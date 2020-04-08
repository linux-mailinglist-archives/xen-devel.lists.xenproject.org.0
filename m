Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69401A1FAB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 13:15:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM8gD-0002nz-Jm; Wed, 08 Apr 2020 11:15:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jM8gC-0002nt-3X
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 11:15:36 +0000
X-Inumbo-ID: 43e14212-798a-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43e14212-798a-11ea-b4f4-bc764e2007e4;
 Wed, 08 Apr 2020 11:15:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1109FAD5F;
 Wed,  8 Apr 2020 11:15:32 +0000 (UTC)
Subject: Re: [PATCH v14 0/3] VM forking
To: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <cover.1586185752.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3dcb79f6-7d90-ced1-51d4-f5b6a32a64e9@suse.com>
Date: Wed, 8 Apr 2020 13:15:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1586185752.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.2020 17:20, Tamas K Lengyel wrote:
> The following series implements VM forking for Intel HVM guests to allow for
> the fast creation of identical VMs without the assosciated high startup costs
> of booting or restoring the VM from a savefile.
> 
> JIRA issue: https://xenproject.atlassian.net/browse/XEN-89
> 
> The fork operation is implemented as part of the "xl fork-vm" command:
>     xl fork-vm -C <config> -Q <qemu-save-file> -m <max-vcpus> <parent_domid>
>     
> By default a fully functional fork is created. The user is in charge however to
> create the appropriate config file for the fork and to generate the QEMU save
> file before the fork-vm call is made. The config file needs to give the
> fork a new name at minimum but other settings may also require changes. Certain
> settings in the config file of both the parent and the fork have to be set to
> default. Details are documented.
> 
> The interface also allows to split the forking into two steps:
>     xl fork-vm --launch-dm no \
>                -m <max-vcpus> \
>                -p <parent_domid>
>     xl fork-vm --launch-dm late \
>                -C <config_file_for_fork> \
>                -Q <qemu_save_file> \
>                <fork_domid>
> 
> The split creation model is useful when the VM needs to be created as fast as
> possible. The forked VM can be unpaused without the device model being launched
> to be monitored and accessed via VMI. Note however that without its device
> model running (depending on what is executing in the VM) it is bound to
> misbehave or even crash when its trying to access devices that would be
> emulated by QEMU. We anticipate that for certain use-cases this would be an
> acceptable situation, in case for example when fuzzing is performed of code
> segments that don't access such devices.
> 
> Launching the device model requires the QEMU Xen savefile to be generated
> manually from the parent VM. This can be accomplished simply by connecting to
> its QMP socket and issuing the "xen-save-devices-state" command. For example
> using the standard tool socat these commands can be used to generate the file:
>     socat - UNIX-CONNECT:/var/run/xen/qmp-libxl-<parent_domid>
>     { "execute": "qmp_capabilities" }
>     { "execute": "xen-save-devices-state", \
>         "arguments": { "filename": "/path/to/save/qemu_state", \
>                         "live": false} }
> 
> At runtime the forked VM starts running with an empty p2m which gets lazily
> populated when the VM generates EPT faults, similar to how altp2m views are
> populated. If the memory access is a read-only access, the p2m entry is
> populated with a memory shared entry with its parent. For write memory accesses
> or in case memory sharing wasn't possible (for example in case a reference is
> held by a third party), a new page is allocated and the page contents are
> copied over from the parent VM. Forks can be further forked if needed, thus
> allowing for further memory savings.
> 
> A VM fork reset hypercall is also added that allows the fork to be reset to the
> state it was just after a fork, also accessible via xl:
>     xl fork-vm --fork-reset -p <fork_domid>
> 
> This is an optimization for cases where the forks are very short-lived and run
> without a device model, so resetting saves some time compared to creating a
> brand new fork provided the fork has not aquired a lot of memory. If the fork
> has a lot of memory deduplicated it is likely going to be faster to create a
> new fork from scratch and asynchronously destroying the old one.
> 
> The series has been tested with Windows VMs and functions as expected. Linux
> VMs when forked from a running VM will have a frozen VNC screen. Linux VMs at
> this time can only be forked with a working device model when the parent VM was
> restored from a snapshot using "xl restore -p". This is a known limitation.
> Also note that PVHVM/PVH Linux guests have not been tested. Forking most likely
> works but PV devices and drivers would require additional wiring to set things
> up properly since the guests are unaware of the forking taking place, unlike
> the save/restore routine where the guest is made aware of the procedure.
> 
> Forking time has been measured to be 0.0007s, device model launch to be around
> 1s depending largely on the number of devices being emulated. Fork resets have
> been measured to be 0.0001s under the optimal circumstances.
> 
> New in v14:
>     minor adjustments
> 
> Patch 1 implements the VM fork
> Patch 2 implements fork reset operation
> Patch 3 adds the toolstack-side code implementing VM forking and reset
> 
> Tamas K Lengyel (3):
>   xen/mem_sharing: VM forking
>   x86/mem_sharing: reset a fork

I've applied these two, but ...

>   xen/tools: VM forking toolstack side

... since this one doesn't have any ack or alike I'll defer to
the tool stack maintainers here.

Jan


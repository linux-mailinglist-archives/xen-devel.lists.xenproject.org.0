Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9BC1EA685
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:08:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfm2f-0001PL-Mo; Mon, 01 Jun 2020 15:07:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jfm2e-0001PG-OA
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:07:56 +0000
X-Inumbo-ID: abe263fa-a419-11ea-81bc-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe263fa-a419-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 15:07:55 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k19so7506573edv.9
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 08:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=r6FP2YosZWHFalCC+WBNkBLcjUgXO6VrNF/Y8BUD2FA=;
 b=KDbv2USn9gc6uxUznYqOp+eSQH7sAjYKnB1K2XF7xD1FGmIQZSSKv7M6ZLx2ZP5Hdd
 OJsBwAPD9iQVPJXfZtsSJ4omByHaT2e+cFiXxqAWk0FM+JnV6HJwoMTtTCqRwDaj/cYk
 ZoFMNnnnXoao99og8NpM1J0EknIpPOP/cRwywSfGSWN62lyhooHxYQFc36bR8bIENXqW
 68AQ5tUeMX/s+QxiVawNlChEeJtC3n2Icx650qDUZibe1D6Z8JwTP3pO1SFXq3kcwnx2
 /T82Brb9ZrkmYindIhuL7beBNBVH9edpQwDsWKjKlQZN4gUk7gM3BwnPSBUI9JKERR1f
 6IwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=r6FP2YosZWHFalCC+WBNkBLcjUgXO6VrNF/Y8BUD2FA=;
 b=owigeTQcUtpD6fKG5hf9OKrWoWGG1LSYecyekvFFKG1KE+ky8WTXXbLmbGcTThxaIv
 vXHZQ5vx+5yJUTJY8iJU8bcC0Dum2A5ZKb+3IsdmfYkJFYRn8kzEYhTIZyhG0FAigsMS
 o1gfd2/DE0pIK5F8Xlb+yInAyVOCX2TkwaAmOTIVllvj/FT6urmwRsrJZCusPilJQv0p
 kjV/guJcfOfLXi/d+RO97PQ2YydLp3HnmOn86kXjYjGiz5Uez4s5UTdsz/qZUqTq0m9X
 SmAn4SlpDgnf1aDvEaHRlTjlGaEW03YcVzTCx1cipHWISlbpDy5ulql4DvJ2Dx0m2tTp
 1K7Q==
X-Gm-Message-State: AOAM530xfSu/ERLYWLTw6krXOsb9/hkg5CuhE18r2Qrjj+0MFLtLDczC
 9SG+i26k8/r7qgpcKv+p3Ks=
X-Google-Smtp-Source: ABdhPJySZHC+AaRIn80jw0F4XxN0lDGW7KyvsRgdqZT7PfcV87HgndLrXXemLMMglliswlUnBLO08w==
X-Received: by 2002:a50:d490:: with SMTP id s16mr21405293edi.242.1591024074966; 
 Mon, 01 Jun 2020 08:07:54 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id w21sm14248499ejc.11.2020.06.01.08.07.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 08:07:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Tamas K Lengyel'" <tamas.lengyel@intel.com>,
 <xen-devel@lists.xenproject.org>
References: <cover.1591017086.git.tamas.lengyel@intel.com>
In-Reply-To: <cover.1591017086.git.tamas.lengyel@intel.com>
Subject: RE: [PATCH v19 for-4.14 00/13] VM forking
Date: Mon, 1 Jun 2020 16:07:52 +0100
Message-ID: <000c01d63826$6d125900$47370b00$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLopxTEy5NbImEQwB/v9n5io2F1+qae/fDA
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Tamas K Lengyel
> Sent: 01 June 2020 14:22
> To: xen-devel@lists.xenproject.org
> Cc: Kevin Tian <kevin.tian@intel.com>; Stefano Stabellini =
<sstabellini@kernel.org>; Tamas K Lengyel
> <tamas.lengyel@intel.com>; Jun Nakajima <jun.nakajima@intel.com>; Wei =
Liu <wl@xen.org>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
George Dunlap
> <george.dunlap@citrix.com>; Tamas K Lengyel <tamas@tklengyel.com>; Jan =
Beulich <jbeulich@suse.com>;
> Anthony PERARD <anthony.perard@citrix.com>; Julien Grall =
<julien@xen.org>; Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>
> Subject: [PATCH v19 for-4.14 00/13] VM forking

Hi,

  This series looks to be largely un-acked so, since we are now past the =
freeze date, I don't really think it can go into 4.14. Is there a =
particular reason that you think it should be considered?

  Paul

>=20
> The following patches are part of the series that implement VM forking =
for
> Intel HVM guests to allow for the fast creation of identical VMs =
without the
> assosciated high startup costs of booting or restoring the VM from a =
savefile.
>=20
> JIRA issue: https://xenproject.atlassian.net/browse/XEN-89
>=20
> The fork operation is implemented as part of the "xl fork-vm" command:
>     xl fork-vm -C <config> -Q <qemu-save-file> <parent_domid>
>=20
> By default a fully functional fork is created. The user is in charge =
however to
> create the appropriate config file for the fork and to generate the =
QEMU save
> file before the fork-vm call is made. The config file needs to give =
the
> fork a new name at minimum but other settings may also require =
changes. Certain
> settings in the config file of both the parent and the fork have to be =
set to
> default. Details are documented.
>=20
> The interface also allows to split the forking into two steps:
>     xl fork-vm --launch-dm no \
>                -m <max-vcpus> \
> 			   -p <parent_domid>
> 	xl fork-vm --launch-dm late \
> 	           -C <config_file_for_fork> \
> 			   -Q <qemu_save_file> \
> 			   <fork_domid>
>=20
> The split creation model is useful when the VM needs to be created as =
fast as
> possible. The forked VM can be unpaused without the device model being =
launched
> to be monitored and accessed via VMI. Note however that without its =
device
> model running (depending on what is executing in the VM) it is bound =
to
> misbehave or even crash when its trying to access devices that would =
be
> emulated by QEMU. We anticipate that for certain use-cases this would =
be an
> acceptable situation, in case for example when fuzzing is performed of =
code
> segments that don't access such devices.
>=20
> Launching the device model requires the QEMU Xen savefile to be =
generated
> manually from the parent VM. This can be accomplished simply by =
connecting to
> its QMP socket and issuing the "xen-save-devices-state" command. For =
example
> using the standard tool socat these commands can be used to generate =
the file:
>     socat - UNIX-CONNECT:/var/run/xen/qmp-libxl-<parent_domid>
> 	{ "execute": "qmp_capabilities" }
> 	{ "execute": "xen-save-devices-state", \
> 		"arguments": { "filename": "/path/to/save/qemu_state", \
> 						"live": false} }
>=20
> The series has been tested with Windows VMs and functions as expected. =
Linux
> VMs when forked from a running VM will have a frozen VNC screen. Linux =
VMs at
> this time can only be forked with a working device model when the =
parent VM was
> restored from a snapshot using "xl restore -p". This is a known =
limitation due
> to Linux VMs having to be made aware of being saved/migrated.
>=20
> New in v19:
> 	Including all the patches currently outstanding into the series
> 	Breaking up libxl/xl patch to many sub-patches to make it easier to =
review
> 	libxl/xl is now reduced to the bare essential to launch QEMU for a VM =
fork
>=20
> Tamas K Lengyel (13):
>   x86/mem_sharing: block interrupt injection for forks
>   tools/libxc: xc_memshr_fork with interrupts blocked
>   tools/libxl: Split libxl__domain_make
>   tools/libxl: populate xenstore entries when launching dm for VM fork
>   tools/libxl: Add checks for dm_restore_file
>   tools/libxl: adjust domcreate_bootloader_done
>   tools/libxl: Adjust libxl__build_pre
>   tools/libxl: Adjust libxl__build_post
>   tools/libxl: libxl__build_hvm_fork
>   tools/libxl: set QEMU saved_state from dm_restore_file
>   tools/libxl: Add VM forking public functions
>   tools/xl: Add xl fork-vm command
>   tools/xl: document fork-vm command
>=20
>  docs/man/xl.1.pod.in             |  39 +++++++++
>  tools/libxc/include/xenctrl.h    |   3 +-
>  tools/libxc/xc_memshr.c          |   4 +-
>  tools/libxl/libxl.h              |  10 +++
>  tools/libxl/libxl_create.c       | 134 =
+++++++++++++++++++++++++------
>  tools/libxl/libxl_dm.c           |   2 +-
>  tools/libxl/libxl_dom.c          |  59 +++++++++++---
>  tools/libxl/libxl_internal.h     |   5 +-
>  tools/libxl/libxl_types.idl      |   1 +
>  tools/xl/Makefile                |   2 +-
>  tools/xl/xl.h                    |   4 +
>  tools/xl/xl_cmdtable.c           |  13 +++
>  tools/xl/xl_forkvm.c             | 122 ++++++++++++++++++++++++++++
>  tools/xl/xl_vmcontrol.c          |  13 +++
>  xen/arch/x86/hvm/vmx/intr.c      |   6 ++
>  xen/arch/x86/mm/mem_sharing.c    |   6 +-
>  xen/include/asm-x86/hvm/domain.h |   2 +-
>  xen/include/public/memory.h      |   3 +
>  18 files changed, 383 insertions(+), 45 deletions(-)
>  create mode 100644 tools/xl/xl_forkvm.c
>=20
> --
> 2.25.1
>=20




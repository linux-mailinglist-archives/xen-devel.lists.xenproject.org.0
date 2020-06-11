Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA871F6ADC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 17:21:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjP0s-0002hD-5x; Thu, 11 Jun 2020 15:21:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iFEF=7Y=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjP0q-0002h8-Ma
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 15:21:04 +0000
X-Inumbo-ID: 293e9168-abf7-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 293e9168-abf7-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 15:21:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4E92AB0BA;
 Thu, 11 Jun 2020 15:21:05 +0000 (UTC)
Subject: Re: Kexec and libxenctlr.so
To: Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, "wl@xen.org" <wl@xen.org>,
 daniel.kiper@oracle.com
References: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <261293b1-f4c9-e41d-0c76-cd47fe5c0dc2@suse.com>
Date: Thu, 11 Jun 2020 17:21:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7a88218d-981e-6583-15a5-3fcaffb05294@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.06.20 16:57, Julien Grall wrote:
> Hi all,
> 
> kexec-tools has an option to load dynamically libxenctlr.so (not 
> .so.4.x) (see [1]).
> 
> Given that the library has never been considered stable, it is probably 
> a disaster that is waiting to happen.
> 
> Looking at the tree kexec is using the follow libxc functions:
>     - xc_kexec_get_range()
>     - xc_kexec_load()
>     - xc_kexec_unload()
>     - xc_kexec_status()
>     - xc_kexec_exec()
>     - xc_version()
>     - xc_interface_open()
>     - xc_interface_close()
>     - xc_get_max_cpus()
>     - xc_get_machine_memory_map()
> 
> I think it is uncontroversial that we want a new stable library for all 
> the xc_kexec_* functions (maybe libxenexec)?
> 
> However I am not entirely sure where to put the others.
> 
> I am thinking to introduce libxensysctl for xc_get_max_cpus() as it is a 
> XEN_SYSCTL. We could possibly include xc_get_machine_memory_map() 
> (despite it is a XENMEM_).
> 
> For xc_version(), I am thinking to extend libxentoolcore to also include 
> "stable xen API".
> 
> Any opinion on the approach?

You could consider hypfs (at least for some of the functionality).

xc_version() and xc_get_max_cpus() would be rather easy.
xc_get_machine_memory_map() is using a stable hypercall used by
the kernel, too.


Juergen




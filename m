Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C42DD382A50
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 12:54:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128146.240630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liasp-0006qx-3D; Mon, 17 May 2021 10:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128146.240630; Mon, 17 May 2021 10:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liaso-0006nn-Vf; Mon, 17 May 2021 10:53:58 +0000
Received: by outflank-mailman (input) for mailman id 128146;
 Mon, 17 May 2021 10:53:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liasn-0006nh-Fb
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 10:53:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5e337f3-7c88-491c-aa49-cc69f58fba63;
 Mon, 17 May 2021 10:53:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A807BB039;
 Mon, 17 May 2021 10:53:54 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b5e337f3-7c88-491c-aa49-cc69f58fba63
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621248834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNLlcpSq0NAE2LV/drYmUJJTMCioiwFltcXsOAXuNIM=;
	b=nRsxuN4XtAfL7Q2P82LJNHU0XTAnfJ36XojWj0QrhStsXoMxj7AE/Qk2sCqLwDlPv0U/iZ
	29gwgTy7L9dt5rhjhriXMQVsD8PnLHPAAu+ZKZkP7qUsUnuIxij8zt9jOoNL3oMdvNSFql
	YoHD1aQ4g78Vw6QQJXQdzUg1Wut5cWk=
Subject: Re: regression in recent pvops kernels, dom0 crashes early
To: Olaf Hering <olaf@aepfle.de>
References: <20210513122457.4182eb7f.olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7abb3c8f-4a9b-700b-5c0c-dc6f42336eab@suse.com>
Date: Mon, 17 May 2021 12:54:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513122457.4182eb7f.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.05.2021 12:24, Olaf Hering wrote:
> Recent pvops dom0 kernels fail to boot on this particular ProLiant BL465c G5 box.
> It happens to work with every Xen and a 4.4 based sle12sp3 kernel, but fails with every Xen and a 4.12 based sle12sp4 (and every newer) kernel.
> 
> Any idea what is going on?
> 
> ....
> (XEN) Freed 256kB init memory.
> (XEN) mm.c:1758:d0 Bad L1 flags 800000
> (XEN) traps.c:458:d0 Unhandled invalid opcode fault/trap [#6] on VCPU 0 [ec=0000]
> (XEN) domain_crash_sync called from entry.S: fault at ffff82d08022a2a0 create_bounce_frame+0x133/0x143
> (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> (XEN) ----[ Xen-4.4.20170405T152638.6bf0560e12-9.xen44  x86_64  debug=y  Not tainted ]----
> ....
> 
> ....
> (XEN) Freed 656kB init memory
> (XEN) mm.c:2165:d0v0 Bad L1 flags 800000
> (XEN) d0v0 Unhandled invalid opcode fault/trap [#6, ec=ffffffff]
> (XEN) domain_crash_sync called from entry.S: fault at ffff82d04031a016 x86_64/entry.S#create_bounce_frame+0x15d/0x177
> (XEN) Domain 0 (vcpu#0) crashed on cpu#5:
> (XEN) ----[ Xen-4.15.20210504T145803.280d472f4f-6.xen415  x86_64  debug=y  Not tainted ]----
> ....
> 
> I can probably cycle through all kernels between 4.4 and 4.12 to see where it broke.

I didn't try to figure out where exactly it broke, but could you give the
patch below a try, perhaps on top of my almost-one-year-old submission at
https://lkml.org/lkml/2020/5/27/1035?

Jan

x86/Xen: swap NX determination and GDT setup on BSP

xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
For this to work when NX is not available, x86_configure_nx() needs to
be called first.

Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1262,16 +1262,16 @@ asmlinkage __visible void __init xen_sta
 	/* Get mfn list */
 	xen_build_dynamic_phys_to_machine();
 
+	/* Work out if we support NX */
+	get_cpu_cap(&boot_cpu_data);
+	x86_configure_nx();
+
 	/*
 	 * Set up kernel GDT and segment registers, mainly so that
 	 * -fstack-protector code can be executed.
 	 */
 	xen_setup_gdt(0);
 
-	/* Work out if we support NX */
-	get_cpu_cap(&boot_cpu_data);
-	x86_configure_nx();
-
 	/* Determine virtual and physical address sizes */
 	get_cpu_address_sizes(&boot_cpu_data);
 


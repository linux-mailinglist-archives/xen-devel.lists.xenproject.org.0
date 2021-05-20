Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA71A38AC8D
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 13:44:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130881.244919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljh4f-0007tB-Vw; Thu, 20 May 2021 11:42:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130881.244919; Thu, 20 May 2021 11:42:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljh4f-0007rJ-RO; Thu, 20 May 2021 11:42:45 +0000
Received: by outflank-mailman (input) for mailman id 130881;
 Thu, 20 May 2021 11:42:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljh4e-0007rD-AN
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 11:42:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83d1b782-5a92-48f1-8209-4acb07cf9712;
 Thu, 20 May 2021 11:42:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1F14ABE8;
 Thu, 20 May 2021 11:42:42 +0000 (UTC)
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
X-Inumbo-ID: 83d1b782-5a92-48f1-8209-4acb07cf9712
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621510962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yL3Xk8Mq0X824q1qm2+RtG2tpaaondahQ7Jy4zmuZdM=;
	b=b5UXBNbM6FmAZ2EaTcRCMFAYF48xWTpnQHwepZj7lHl6W/WoWoWp1zoetB8s62+D9p6wxB
	GZLb+TPa/3N5hAKjMx+XbpqobGGygWsAbCgc5grFjRFeeZDrPnPy0orJFlR0RrGIqO/u7F
	gfL4PHqaLHl6umi+1I8mY8FAoB6jXZU=
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
Message-ID: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
Date: Thu, 20 May 2021 13:42:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables.
For this to work when NX is not available, x86_configure_nx() needs to
be called first.

Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1273,16 +1273,16 @@ asmlinkage __visible void __init xen_sta
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
 


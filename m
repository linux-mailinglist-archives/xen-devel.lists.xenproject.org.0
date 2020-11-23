Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE892C05D5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:41:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34190.65052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB9a-0002YY-SF; Mon, 23 Nov 2020 12:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34190.65052; Mon, 23 Nov 2020 12:41:10 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB9a-0002Y8-P1; Mon, 23 Nov 2020 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 34190;
 Mon, 23 Nov 2020 12:41:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khB9Y-0002Xw-KH
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:41:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 05c52c33-af8b-431e-a2d7-2b1f5c93c1a3;
 Mon, 23 Nov 2020 12:41:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 203E0AC60;
 Mon, 23 Nov 2020 12:41:07 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khB9Y-0002Xw-KH
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:41:08 +0000
X-Inumbo-ID: 05c52c33-af8b-431e-a2d7-2b1f5c93c1a3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 05c52c33-af8b-431e-a2d7-2b1f5c93c1a3;
	Mon, 23 Nov 2020 12:41:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606135267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YhDy7Mg6pP0gtjGsaM0dFyUyU3hPq8Z+OxGSvcjCo4c=;
	b=ZJ4yp331J2ZsZW67BKFgAMSZCYQmldzGDUPUwJNFQiG9m9CTVIopKsCXxW+gvRPuggRnqS
	gxZzLKL4OEDmEmRW/v0FJcsV1M5Jo/raux4VaJUCI12TKjuRX0ZlrKCp/ZPvyTn53DUryk
	iM8pnPZEtfWu5FVvoq77kiOzvKyilpE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 203E0AC60;
	Mon, 23 Nov 2020 12:41:07 +0000 (UTC)
Subject: [PATCH 4/4] x86/ACPI: don't invalidate S5 data when S3 wakeup vector
 cannot be determined
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Message-ID: <d2b9d231-8a05-6164-66f8-74d7bfe4b40f@suse.com>
Date: Mon, 23 Nov 2020 13:41:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We can be more tolerant as long as the data collected from FACS is only
needed to enter S3. A prior change already added suitable checking to
acpi_enter_sleep().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -420,22 +420,22 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 		facs_pa = (uint64_t)fadt->facs;
 	}
 	if (!facs_pa)
-		goto bad;
+		return;
 
 	facs = acpi_os_map_memory(facs_pa, sizeof(*facs));
 	if (!facs)
-		goto bad;
+		return;
 
 	if (strncmp(facs->signature, "FACS", 4)) {
 		printk(KERN_ERR PREFIX "Invalid FACS signature %.4s\n",
 			facs->signature);
-		goto bad;
+		goto done;
 	}
 
 	if (facs->length < 24) {
 		printk(KERN_ERR PREFIX "Invalid FACS table length: %#x",
 			facs->length);
-		goto bad;
+		goto done;
 	}
 
 	if (facs->length < 64)
@@ -452,6 +452,7 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 		offsetof(struct acpi_table_facs, firmware_waking_vector);
 	acpi_sinfo.vector_width = 32;
 
+ done:
 	acpi_os_unmap_memory(facs, sizeof(*facs));
 
 	printk(KERN_INFO PREFIX



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3222C05D2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34173.65017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khB8P-0001YB-Tc; Mon, 23 Nov 2020 12:39:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34173.65017; Mon, 23 Nov 2020 12:39:57 +0000
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
	id 1khB8P-0001Xj-QE; Mon, 23 Nov 2020 12:39:57 +0000
Received: by outflank-mailman (input) for mailman id 34173;
 Mon, 23 Nov 2020 12:39:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khB8P-0001Xd-5F
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:39:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 417f9d19-27c2-48c4-9f41-f122c49c5d15;
 Mon, 23 Nov 2020 12:39:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A64AFAC75;
 Mon, 23 Nov 2020 12:39:55 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khB8P-0001Xd-5F
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:39:57 +0000
X-Inumbo-ID: 417f9d19-27c2-48c4-9f41-f122c49c5d15
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 417f9d19-27c2-48c4-9f41-f122c49c5d15;
	Mon, 23 Nov 2020 12:39:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606135195; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cPfib+BwguvslmqXZRj+FnJjCsQqD71Psr1mDnpBDDc=;
	b=k3Np63Do2MCnyD8xk+WTEnRBJA35RjVU22z3Mh+L4BM0BLKavbR+FNg5DSJBzMClD6SFph
	51LFSTNJh9zxGHvQWgbbiW3hcjdeoWX1tRQ1vz0ZLR/IN9dEG5MO9vaCuuZZPT+Gx7czEo
	GqBFhi55fU8QwLR82/GYWPcya0ROkpo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A64AFAC75;
	Mon, 23 Nov 2020 12:39:55 +0000 (UTC)
Subject: [PATCH 1/4] x86/ACPI: fix mapping of FACS
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>
References: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Message-ID: <81a8c2f0-ae9b-98e0-f5c5-d32b423db491@suse.com>
Date: Mon, 23 Nov 2020 13:39:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7f895b0e-f46f-8fe2-b0ac-e0503ef06a1f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

acpi_fadt_parse_sleep_info() runs when the system is already in
SYS_STATE_boot. Hence its direct call to __acpi_map_table() won't work
anymore. This call should probably have been replaced long ago already,
as the layering violation hasn't been necessary for quite some time.

Fixes: 1c4aa69ca1e1 ("xen/acpi: Rework acpi_os_map_memory() and acpi_os_unmap_memory()")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -422,8 +422,7 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 	if (!facs_pa)
 		goto bad;
 
-	facs = (struct acpi_table_facs *)
-		__acpi_map_table(facs_pa, sizeof(struct acpi_table_facs));
+	facs = acpi_os_map_memory(facs_pa, sizeof(*facs));
 	if (!facs)
 		goto bad;
 
@@ -448,11 +447,16 @@ acpi_fadt_parse_sleep_info(struct acpi_t
 		offsetof(struct acpi_table_facs, firmware_waking_vector);
 	acpi_sinfo.vector_width = 32;
 
+	acpi_os_unmap_memory(facs, sizeof(*facs));
+
 	printk(KERN_INFO PREFIX
 	       "            wakeup_vec[%"PRIx64"], vec_size[%x]\n",
 	       acpi_sinfo.wakeup_vector, acpi_sinfo.vector_width);
 	return;
-bad:
+
+ bad:
+	if (facs)
+		acpi_os_unmap_memory(facs, sizeof(*facs));
 	memset(&acpi_sinfo, 0,
 	       offsetof(struct acpi_sleep_info, sleep_control));
 	memset(&acpi_sinfo.sleep_status + 1, 0,



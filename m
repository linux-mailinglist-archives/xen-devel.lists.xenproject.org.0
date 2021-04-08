Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C6358324
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107245.205017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTd8-0003qL-Bl; Thu, 08 Apr 2021 12:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107245.205017; Thu, 08 Apr 2021 12:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTd8-0003pw-7c; Thu, 08 Apr 2021 12:19:26 +0000
Received: by outflank-mailman (input) for mailman id 107245;
 Thu, 08 Apr 2021 12:19:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTd6-0003oQ-GC
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:19:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c266e007-5997-4fca-af7d-9cfc84cc26d0;
 Thu, 08 Apr 2021 12:19:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CBFC6B005;
 Thu,  8 Apr 2021 12:19:22 +0000 (UTC)
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
X-Inumbo-ID: c266e007-5997-4fca-af7d-9cfc84cc26d0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDQ3ZAFyCDWafzng7hnKKPU/+/S54DwWZulXulR1ydM=;
	b=vQsXBPZTT3RHR7jNPNRXX/InSms8SVvQnJDnyqhayLkd4PSiomA1yr/n7vqHKih8rdyZkr
	jjM6gr3zpnxkD1MbvUNS6ZxqZNtHS0Zo0pckqiUvK3BddXL7EqfQEChgSe2k+pIbZWD+jr
	BPsztQ/SoIJW1femb3OISs04rfV9UHg=
Subject: [PATCH 05/11] x86/oprofile: avoid effectively open-coding
 xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Message-ID: <029d1c22-332a-a1bf-489b-fdee70d8974e@suse.com>
Date: Thu, 8 Apr 2021 14:19:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xmalloc_bytes() forces
SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
actually don't want it.

While at it also use XFREE() instead of open-coding it and change loop
induction variable types.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -142,30 +142,29 @@ static void nmi_save_registers(void * du
 
 static void free_msrs(void)
 {
-	int i;
+	unsigned int i;
+
 	for (i = 0; i < nr_cpu_ids; ++i) {
-		xfree(cpu_msrs[i].counters);
-		cpu_msrs[i].counters = NULL;
-		xfree(cpu_msrs[i].controls);
-		cpu_msrs[i].controls = NULL;
+		XFREE(cpu_msrs[i].counters);
+		XFREE(cpu_msrs[i].controls);
 	}
 }
 
 
 static int allocate_msrs(void)
 {
+	unsigned int i;
 	int success = 1;
-	size_t controls_size = sizeof(struct op_msr) * model->num_controls;
-	size_t counters_size = sizeof(struct op_msr) * model->num_counters;
 
-	int i;
 	for_each_online_cpu (i) {
-		cpu_msrs[i].counters = xmalloc_bytes(counters_size);
+		cpu_msrs[i].counters = xmalloc_array(struct op_msr,
+						     model->num_counters);
 		if (!cpu_msrs[i].counters) {
 			success = 0;
 			break;
 		}
-		cpu_msrs[i].controls = xmalloc_bytes(controls_size);
+		cpu_msrs[i].controls = xmalloc_array(struct op_msr,
+						     model->num_controls);
 		if (!cpu_msrs[i].controls) {
 			success = 0;
 			break;



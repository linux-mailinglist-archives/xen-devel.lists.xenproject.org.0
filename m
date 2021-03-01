Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD032793D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91356.172656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdxP-00022U-Gk; Mon, 01 Mar 2021 08:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91356.172656; Mon, 01 Mar 2021 08:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdxP-000224-Dd; Mon, 01 Mar 2021 08:31:11 +0000
Received: by outflank-mailman (input) for mailman id 91356;
 Mon, 01 Mar 2021 08:31:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdxO-00021y-5Y
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:31:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b125c18e-96fe-4663-914d-60f14e5a1a87;
 Mon, 01 Mar 2021 08:31:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 871A8AF69;
 Mon,  1 Mar 2021 08:31:08 +0000 (UTC)
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
X-Inumbo-ID: b125c18e-96fe-4663-914d-60f14e5a1a87
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614587468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A01l/OBBr08TMbu0YIVKBEMymVcxLcoIlRWngXXvXyE=;
	b=JZ5KAqDEqJQq+aPB67RDlJMED6f3XTI577hNCsi8VcyhzNlktA65YjlFaT2XvwZejxl5qC
	bRL5AohL9Z21/gavkWRPU/C+Tf7wX2jYYDufDozqI18YHdyA8Crz7U6on3nFvd5b8hdeNP
	o9oh96qCIa7BtuogHSugvU5No2N+ABs=
Subject: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Message-ID: <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
Date: Mon, 1 Mar 2021 09:31:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In this case the compiler is recognizing that no valid array indexes
remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
...)), but oddly enough isn't really consistent about the checking it
does (see the code comment).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -54,7 +54,17 @@ static void init_apic_ldr_x2apic_cluster
     per_cpu(cluster_cpus, this_cpu) = cluster_cpus_spare;
     for_each_online_cpu ( cpu )
     {
-        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
+        if ( this_cpu == cpu )
+            continue;
+        /*
+         * Guard in particular against the compiler suspecting out-of-bounds
+         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
+         * is the 1st of these alone which actually helps, not the 2nd, nor
+         * are both required together there).
+         */
+        BUG_ON(this_cpu >= NR_CPUS);
+        BUG_ON(cpu >= NR_CPUS);
+        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
             continue;
         per_cpu(cluster_cpus, this_cpu) = per_cpu(cluster_cpus, cpu);
         break;



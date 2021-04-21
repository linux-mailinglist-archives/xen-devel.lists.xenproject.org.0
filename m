Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2031B366E94
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114793.218825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEHr-00085x-Sf; Wed, 21 Apr 2021 14:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114793.218825; Wed, 21 Apr 2021 14:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEHr-00085Y-Oy; Wed, 21 Apr 2021 14:57:07 +0000
Received: by outflank-mailman (input) for mailman id 114793;
 Wed, 21 Apr 2021 14:57:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEHq-00085T-Or
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:57:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3adcfe3-4c17-47e2-9d9f-80c4a6a969d6;
 Wed, 21 Apr 2021 14:57:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38E00B2E8;
 Wed, 21 Apr 2021 14:57:05 +0000 (UTC)
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
X-Inumbo-ID: a3adcfe3-4c17-47e2-9d9f-80c4a6a969d6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619017025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7k33TZjSiUsbN7zoExMERbIp8QvBpYbbwHsyd9tlzWs=;
	b=q62m4aOxX+wB5j9D8t4usjgr7KIKvIjEuq5NvNqiaFHPtt66/72eiimjnj/CCMUqqEu5cg
	94JZAoer9V0u0xTHI9kbF7AD6/PkZcv5SLEZP1q8IU/+ZYWzwEctQqBivgBC/4LD0JLGTv
	WuDguSwlqagj676qs4vl8Se+OICWBaQ=
Subject: [PATCH v2 3/8] x86/oprofile: avoid effectively open-coding
 xmalloc_array()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Message-ID: <b3e46e74-517a-f5b3-1ae3-8fcae49e42ca@suse.com>
Date: Wed, 21 Apr 2021 16:57:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There is a difference in generated code: xmalloc_bytes() forces
SMP_CACHE_BYTES alignment. But if code really cared about such higher
than default alignment, it should request so explicitly rather than
using a type-unsafe interface. And if e.g. cache line sharing was a
concern, the allocator itself should arrange to avoid such.

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



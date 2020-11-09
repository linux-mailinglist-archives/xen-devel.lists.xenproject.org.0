Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FB02ABFBD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 16:21:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22659.49043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc8z0-0002N5-C1; Mon, 09 Nov 2020 15:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22659.49043; Mon, 09 Nov 2020 15:21:26 +0000
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
	id 1kc8z0-0002Mg-8a; Mon, 09 Nov 2020 15:21:26 +0000
Received: by outflank-mailman (input) for mailman id 22659;
 Mon, 09 Nov 2020 15:21:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kc8yy-0002Mb-Q1
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 15:21:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0dd5f93-1f3b-4e24-992b-ffdf11c15443;
 Mon, 09 Nov 2020 15:21:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32826ABCC;
 Mon,  9 Nov 2020 15:21:23 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=a0OZ=EP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kc8yy-0002Mb-Q1
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 15:21:24 +0000
X-Inumbo-ID: f0dd5f93-1f3b-4e24-992b-ffdf11c15443
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f0dd5f93-1f3b-4e24-992b-ffdf11c15443;
	Mon, 09 Nov 2020 15:21:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604935283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ompXXUS9kSTZFi9Rj5W7qk62f2/bOTFujCaDXGDgiRw=;
	b=t6nR34upa4AV05T+1AnA70lqyY1PbEmHZVt1Hn5V4GipiHwus+Hj+AWbeDubAZBWgqG/eG
	4Bnpz33tNRIq+FKpOHVKwYaX+d5sT2opkuTORcOY/83FTyJfkPxUM/3ziuWfj7/CFQ8GV+
	2C4COzo0mcHDmVcffxAyrf7JftQjUAQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 32826ABCC;
	Mon,  9 Nov 2020 15:21:23 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/CPUID: also check leaf 7 max subleaf to be compatible
Message-ID: <a59790df-cc2c-30a3-fdf8-7c56472f00c2@suse.com>
Date: Mon, 9 Nov 2020 16:21:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Just like is done for basic and extended major leaves.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/lib/x86/policy.c
+++ b/xen/lib/x86/policy.c
@@ -18,6 +18,9 @@ int x86_cpu_policies_are_compatible(cons
     if ( guest->cpuid->basic.max_leaf > host->cpuid->basic.max_leaf )
         FAIL_CPUID(0, NA);
 
+    if ( guest->cpuid->feat.max_subleaf > host->cpuid->feat.max_subleaf )
+        FAIL_CPUID(7, 0);
+
     if ( guest->cpuid->extd.max_leaf > host->cpuid->extd.max_leaf )
         FAIL_CPUID(0x80000000, NA);
 


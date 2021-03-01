Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1132793C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91350.172645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdwk-0001td-7z; Mon, 01 Mar 2021 08:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91350.172645; Mon, 01 Mar 2021 08:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdwk-0001tB-3y; Mon, 01 Mar 2021 08:30:30 +0000
Received: by outflank-mailman (input) for mailman id 91350;
 Mon, 01 Mar 2021 08:30:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdwi-0001sh-A4
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:30:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 499a38d8-94f2-4bbf-a116-88bf048ef6bd;
 Mon, 01 Mar 2021 08:30:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77340AF57;
 Mon,  1 Mar 2021 08:30:26 +0000 (UTC)
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
X-Inumbo-ID: 499a38d8-94f2-4bbf-a116-88bf048ef6bd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614587426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aOzC6w3LpS+/WUDq1gZ9j35Z2qxwwgvDhiN0ayxn28k=;
	b=QJsun6zmDjAD6AuASuQFahgLLq3KCoYBoZ8e2jwIOA/NqXegi5TueXE7C+xBeGSGsAmWyu
	whnr34SVQCRysf/aiTJgOa5Yyyf1xGoynn5/CaxjaDqqGUNf9ku2TZtHfrBuGsKqP14pXS
	sUrD3fe2bouaw32uWjHPioZQVNhrTi0=
Subject: [PATCH 1/2][4.15?] sched: fix build when NR_CPUS == 1
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Ian Jackson <iwj@xenproject.org>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Message-ID: <171d1da4-e87a-b154-5c63-a5627d4f93bc@suse.com>
Date: Mon, 1 Mar 2021 09:30:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In this case the compiler is recognizing that no valid array indexes
remain, and hence e.g. reports:

core.c: In function 'cpu_schedule_up':
core.c:2769:19: error: array subscript 1 is above array bounds
of 'struct vcpu *[1]' [-Werror=array-bounds]
 2769 |     if ( idle_vcpu[cpu] == NULL )
      |          ~~~~~~~~~^~~~~

Reported-by: Connor Davis <connojdavis@gmail.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2768,6 +2768,12 @@ static int cpu_schedule_up(unsigned int
     if ( cpu == 0 )
         return 0;
 
+    /*
+     * Guard in particular against the compiler suspecting out-of-bounds
+     * array accesses below when NR_CPUS=1.
+     */
+    BUG_ON(cpu >= NR_CPUS);
+
     if ( idle_vcpu[cpu] == NULL )
         vcpu_create(idle_vcpu[0]->domain, cpu);
     else



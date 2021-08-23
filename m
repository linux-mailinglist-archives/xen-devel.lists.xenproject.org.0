Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF0D3F4411
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 06:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170141.310807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI1EW-0004kF-2S; Mon, 23 Aug 2021 04:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170141.310807; Mon, 23 Aug 2021 04:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI1EV-0004gs-Ul; Mon, 23 Aug 2021 04:06:47 +0000
Received: by outflank-mailman (input) for mailman id 170141;
 Mon, 23 Aug 2021 02:14:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cRC=NO=gmail.com=cgel.zte@srs-us1.protection.inumbo.net>)
 id 1mHzTX-00016N-82
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 02:14:11 +0000
Received: from mail-qv1-xf30.google.com (unknown [2607:f8b0:4864:20::f30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0661be9-7914-470a-aaff-a154003d7f20;
 Mon, 23 Aug 2021 02:14:10 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id jv8so8906236qvb.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Aug 2021 19:14:10 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id q184sm7802318qkd.35.2021.08.22.19.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Aug 2021 19:14:09 -0700 (PDT)
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
X-Inumbo-ID: f0661be9-7914-470a-aaff-a154003d7f20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0c9W4KFzvkxaiLSuIZiuuGcjam2e7naE89uHIwtQELE=;
        b=mxa9y2T3jwlzAXL1NUtH+yeIKKyyjAPm/UA29J2QlNW4w/UC1hCCt3X+b57hTVMVeH
         iOGtBdIGeFOXJ9tgvnYQfFw4Iw2a0Ngq8MwMmk6EBKTRZHjlO0iBTwg0et8PKKMUG6HJ
         7om7LG1oOtgOOqLTNyHBmmu7dRa9cnu9XskR4pYNAA/57zkkIn4UCM/y/VqWHzrWhKbs
         EYSVN68AK3oiOPiFHCQoKruQ8OEirw9v2AeWOdYShwj5ksNYkh9eJ+5WB7enN5upSzje
         62KSQ0STMSTG6ocM7zuGGgDqiDhRpRtY9GX/EXW5tT879oP+qPq0kmTArb3G1bBMqmr3
         yfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0c9W4KFzvkxaiLSuIZiuuGcjam2e7naE89uHIwtQELE=;
        b=LhhO+zFooykZ9ik8Zc2A13Xt2hsNidDuhnzTHtZcHNosrfYvDlhAGjc+VYYbvG76cZ
         B7FNjqw9JQWr+Wo+i3u1dD0NvBZkeSaArIWK9/DJUZ6KeRs7OxB8lmkJhfbUWFBNJjrZ
         wKuQUn0mv1GJ8a64hlJWEagrqwCb2Ilu7W7rqW8NqeSls9NhMs0f7EFLRwQ8T0N1oLSO
         nneyPhIvQW3inxiIwDekuU1chJX02QMyJ8613WVdcEIUsPz5C7AStgu0IRC9uvp8bWxo
         PgOsG3PLe+qiNRZP960y9RatN6b3vZo72V3jT8aetLD6BIeHXPGcDBrtqZD1SIbLz2d1
         subw==
X-Gm-Message-State: AOAM532xeGUa7SV//T/prGzwS1oYNwhFVvV5CFmuwQh+/ik+RiPt29wL
	Watve0nFaqunBwQ6+r1Nmds=
X-Google-Smtp-Source: ABdhPJznK5ysUfTJ15bQvLes/OQoG9at49ANSShnH6MsgWQpw086j7Vgeh3Q62J5hKzvn2kcT0VbGQ==
X-Received: by 2002:a0c:e885:: with SMTP id b5mr31250706qvo.48.1629684850072;
        Sun, 22 Aug 2021 19:14:10 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <jing.yangyang@zte.com.cn>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Jing Yangyang <jing.yangyang@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] arch/x86/xen/time.c: fix bugon.cocci warnings
Date: Sun, 22 Aug 2021 19:13:53 -0700
Message-Id: <20210823021353.44391-1-jing.yangyang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jing Yangyang <jing.yangyang@zte.com.cn>

Use BUG_ON instead of a if condition followed by BUG.

Generated by: scripts/coccinelle/misc/bugon.cocci

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yangyang <jing.yangyang@zte.com.cn>
---
 arch/x86/xen/time.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index d9c945e..6e29b69 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -210,8 +210,7 @@ static int xen_timerop_set_next_event(unsigned long delta,
 {
 	WARN_ON(!clockevent_state_oneshot(evt));
 
-	if (HYPERVISOR_set_timer_op(get_abs_timeout(delta)) < 0)
-		BUG();
+	BUG_ON(HYPERVISOR_set_timer_op(get_abs_timeout(delta)) < 0);
 
 	/* We may have missed the deadline, but there's no real way of
 	   knowing for sure.  If the event was in the past, then we'll
@@ -241,11 +240,10 @@ static int xen_vcpuop_shutdown(struct clock_event_device *evt)
 {
 	int cpu = smp_processor_id();
 
-	if (HYPERVISOR_vcpu_op(VCPUOP_stop_singleshot_timer, xen_vcpu_nr(cpu),
+	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_stop_singleshot_timer, xen_vcpu_nr(cpu),
 			       NULL) ||
-	    HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
-			       NULL))
-		BUG();
+		HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
+			       NULL));
 
 	return 0;
 }
@@ -254,9 +252,8 @@ static int xen_vcpuop_set_oneshot(struct clock_event_device *evt)
 {
 	int cpu = smp_processor_id();
 
-	if (HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
-			       NULL))
-		BUG();
+	BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer, xen_vcpu_nr(cpu),
+			       NULL));
 
 	return 0;
 }
@@ -373,9 +370,8 @@ void xen_timer_resume(void)
 		return;
 
 	for_each_online_cpu(cpu) {
-		if (HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer,
-				       xen_vcpu_nr(cpu), NULL))
-			BUG();
+		BUG_ON(HYPERVISOR_vcpu_op(VCPUOP_stop_periodic_timer,
+				       xen_vcpu_nr(cpu), NULL));
 	}
 }
 
-- 
1.8.3.1




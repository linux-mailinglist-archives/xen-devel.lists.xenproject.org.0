Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKklLSYzk2lx2gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:09:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123914525F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 16:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234255.1537561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0Do-00050i-Oo; Mon, 16 Feb 2026 15:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234255.1537561; Mon, 16 Feb 2026 15:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs0Do-0004xn-M4; Mon, 16 Feb 2026 15:09:12 +0000
Received: by outflank-mailman (input) for mailman id 1234255;
 Mon, 16 Feb 2026 15:09:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs8Y=AU=bounce.vates.tech=bounce-md_30504962.69933313.v1-5066572243034d21a92e9fbd6e222e04@srs-se1.protection.inumbo.net>)
 id 1vs0Dm-0004xf-HK
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 15:09:10 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7127173b-0b49-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 16:09:09 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fF5lR4ctPzPm0PmZ
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 15:09:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5066572243034d21a92e9fbd6e222e04; Mon, 16 Feb 2026 15:09:07 +0000
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
X-Inumbo-ID: 7127173b-0b49-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771254547; x=1771524547;
	bh=MNh9V4qzhn2ZOOkfvPZMwx5Ld1KsvgvSoYa8cKgDe8M=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=AvXpHF0kTk6Uhw1AQ/kcv+N/GJyi05LRRWj6cENq0a5PAN9xfuntGvfutNxpVG4Ud
	 OjLVQiAQBOfIdXxBlVNtBX5K4WFPWZUjTnBr+daBpXOhjJPwJRX3q7x70ywnVlG4s8
	 A2xnQrC/2ets+RTwkvF4/zp/j7bvH6s4kQvSN4X3q9g6VF1Z5cwCVlryExSor9EgZ3
	 wOMQsDBPwz/N96bMDEEmyu5qrZdSk5i3kH7LeD+OEMgBjFF9LtKN4UZ1mon1McrDTp
	 pCDwHT7ro+jvONFA8vlHsB+1hegVMoZQ4dw3+5bFvVUEQRNaaPU5nM9S7vCMxLivR1
	 NPZE4yOlRQHqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771254547; x=1771515047; i=teddy.astie@vates.tech;
	bh=MNh9V4qzhn2ZOOkfvPZMwx5Ld1KsvgvSoYa8cKgDe8M=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=I0cAxBS+QqRl/lEqnvZKVDVxpBCqLLYpsjYfXPGDbuPQQdqU89D3cfwdjeAPoCi+U
	 YOpiwuPMLV01LNR4bba9/w2Fh0FvYpMZSNJOLDGG5wd2UvIBnNwG0Pu2WlBE14YLsm
	 LnaYvrGyJMy6vJzqmzBEwB371hC/4IuhzA4Oog3Tn6Cq7HtXD1a8xRVU5RcXExwuHm
	 7zJk66cwi3sHo4thwJhc+kU1wK3x496cvkoIhnLoX4uZe36B4W4nLqaybTRzxA4q5w
	 NY5IcXXV7uhOSLuLx9b/OllmX1Mvm+V2FTbdKwLDITY9eW7CAk8dsCLgLgngNFVrCW
	 U40aTdDsR7Eog==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/platform:=20Consider=20PTM=20for=20exposing=20package-related=20MSR?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771254546639
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <e7b1721097bd7abd975882f60b282cf7900db58d.1771254439.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5066572243034d21a92e9fbd6e222e04?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 15:09:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ngoc-tu.dinh@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5123914525F
X-Rspamd-Action: no action

Package-related MSR is actually gated behind "PTM" CPUID flag rather than
"DTS" one. Make sure we check the right CPUID for package-related MSR.

Check for either DTS or PTM for MSR_TEMPERATURE_TARGET.

The only visible difference in practice would be that EPERM would now
be reported instead of EFAULT if we tried accessing the package MSR on
a platform that doesn't have it.

Amends: 615c9f3f820 ("x86/platform: Expose DTS sensors MSR")
Reported-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/platform_hypercall.c    | 5 ++++-
 xen/include/xen/lib/x86/cpu-policy.h | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index c6c5135806..a52fed3bd6 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -89,9 +89,12 @@ static bool msr_read_allowed(unsigned int msr)
         return cpu_has_srbds_ctrl;
 
     case MSR_IA32_THERM_STATUS:
+        return host_cpu_policy.basic.digital_temp_sensor;
     case MSR_TEMPERATURE_TARGET:
+        return host_cpu_policy.basic.digital_temp_sensor ||
+               host_cpu_policy.basic.package_therm_management;
     case MSR_PACKAGE_THERM_STATUS:
-        return host_cpu_policy.basic.digital_temp_sensor;
+        return host_cpu_policy.basic.package_therm_management;
     }
 
     if ( ppin_msr && msr == ppin_msr )
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index db8d035589..d9d57e932a 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -132,7 +132,7 @@ struct cpu_policy
                         :1,
                         :1,
                         :1,
-                        :1,
+                        package_therm_management:1,
                         hwp:1,
                         hwp_interrupt:1,
                         hwp_activity_window:1,
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



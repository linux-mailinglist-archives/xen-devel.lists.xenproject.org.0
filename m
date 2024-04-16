Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535958A66BD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706788.1104165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwena-0005i7-N3; Tue, 16 Apr 2024 09:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706788.1104165; Tue, 16 Apr 2024 09:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwena-0005gE-KH; Tue, 16 Apr 2024 09:08:18 +0000
Received: by outflank-mailman (input) for mailman id 706788;
 Tue, 16 Apr 2024 09:08:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ze4s=LV=bounce.vates.tech=bounce-md_30504962.661e3ffc.v1-cd0b31d4047c4070870f72ff6edafebb@srs-se1.protection.inumbo.net>)
 id 1rwenZ-0005g6-3l
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:08:17 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dafffb4a-fbd0-11ee-94a3-07e782e9044d;
 Tue, 16 Apr 2024 11:08:14 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJdVh6Vlrz8XRxWN
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 09:08:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cd0b31d4047c4070870f72ff6edafebb; Tue, 16 Apr 2024 09:08:12 +0000
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
X-Inumbo-ID: dafffb4a-fbd0-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713258492; x=1713518992;
	bh=psZ1jgY5/ShxiZ95g6hDQhTaYC5/6jQ8OcbLtKEGa6w=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=UeOPDwm4rYtRP45FvyZNoXD21U7rUr7oLcP4uAbcyRBEUkAKMNRHVELzlewvUfvi4
	 tzCoFfNuCmzij6jMrE2dgtsS7nDllJssCABQAQnH33YXKd4Pdpjzp1O77YibD8/RyO
	 yYN9AOYzOnU8VypLqXgt/y2FLGlFhN1AQLVZRqDJ4kcgXgbStYlWuZ5Bl4IZCHMHuN
	 0xO0nhgAOcxzlpPxc/CMevh+5m+oHkZpDnXcBCVXttLx7rWlX4HNx1HgmQvHmmUydw
	 2FjTIidoqbTPSp2Abk7OoSGwN85JavX9kHG+n4MaOKniG1zSnJ544vIhDzUXeL8XKj
	 eI+csgV1FGoqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713258492; x=1713518992; i=vaishali.thakkar@vates.tech;
	bh=psZ1jgY5/ShxiZ95g6hDQhTaYC5/6jQ8OcbLtKEGa6w=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=fXqnSg6MLrAvvRyLbbePKNmeJmTy18U10HUiKC++fbwnkCjeVZAbWcMZX4RAecjrB
	 U6EGW9BjLcrmyIdN1iFfBslWokesUkmFUm8KB5bZVdzcQNrPNk978YTMkkCB7KUaWD
	 kTtN/Wh7vfHH52I+cNS9wPH/5D9lE2SjT0fp4O3PsFqpuXzU/x6bPtEdpJhMb9mv3S
	 iFwvF75Gq8J5g71qdkMmNRGl7kVedP6jhZwGfslC4rP3yc5ucIo5NIMsDSV7CpWiAf
	 u75o5eAr6AucIiLuodj7Y57OzqJOOKGTs86porQfQz0DAc+eMlEiV1IQxcMvELLF2P
	 vKVzWzo2L3QNg==
From: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/svm:=20Add=20flushbyasid=20in=20the=20supported=20features?=
X-Mailer: git-send-email 2.44.0
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713258491675
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, Vaishali Thakkar <vaishali.thakkar@vates.tech>
Message-Id: <b8541a3c70058a74c837352901f2e6a8b45e4fa2.1713258186.git.vaishali.thakkar@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cd0b31d4047c4070870f72ff6edafebb?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240416:md
Date: Tue, 16 Apr 2024 09:08:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

TLB Flush by ASID is missing in the list of supported features
here. So, add it.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@vates.tech>
---
 xen/arch/x86/hvm/svm/svm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index a745acd903..4719fffae5 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2510,6 +2510,7 @@ const struct hvm_function_table * __init start_svm(void)
     P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
     P(cpu_has_svm_nrips, "Next-RIP Saved on #VMEXIT");
     P(cpu_has_svm_cleanbits, "VMCB Clean Bits");
+    P(cpu_has_svm_flushbyasid, "TLB flush by ASID");
     P(cpu_has_svm_decode, "DecodeAssists");
     P(cpu_has_svm_vloadsave, "Virtual VMLOAD/VMSAVE");
     P(cpu_has_svm_vgif, "Virtual GIF");
-- 
2.44.0


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825CD64BF57
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:28:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461280.719360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dkx-0005MU-NB; Tue, 13 Dec 2022 22:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461280.719360; Tue, 13 Dec 2022 22:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dkx-0005Jn-KF; Tue, 13 Dec 2022 22:28:11 +0000
Received: by outflank-mailman (input) for mailman id 461280;
 Tue, 13 Dec 2022 22:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dkv-000519-FY
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:09 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6af79959-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:08 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 7734432003C0;
 Tue, 13 Dec 2022 17:28:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Dec 2022 17:28:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:04 -0500 (EST)
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
X-Inumbo-ID: 6af79959-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970486; x=1671056886; bh=+4Lu+3eVukKK0PupilX1JexIM0HZp5Aii+G
	i4upYzw0=; b=DHB83JBJT/HWstSj4lhjbu6gEH/xeDvPxL9+4M8vXy0j4qIzwX2
	RnAx1hiJEVJijxG/1/oqDDwDsNcs/FXVdPuEnz4ssVntaFAWCyV/s0aiDCwCsGIO
	DsNfDDfUERhW4icawEHU4Pp7FvMFiOH6KOoNI5lgHFTmGu/EZ1usbdgP9MW9Rn6T
	FGncY/bjATjo3VCf9GgAVXeqBpQSIo8WBQZ/0enqBTBfeBJq4GIAc2XoV9h4szBl
	6qaOh9b5SwsNPHTMQkbZGRGJQYsVp6oH/5jW4+fhqsm+luAxvOb11oddJ/tXSbX9
	VWuiYPFQgAM+aQOLvlicTptwqa1XDuY136w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970486; x=1671056886; bh=+4Lu+3eVukKK0
	PupilX1JexIM0HZp5Aii+Gi4upYzw0=; b=DcFCBpQ2tMJEgZya6pXH2cr9NqVEX
	0sjMaIU6uQ7F32sxYy3x3cY2VmWEP5FswFyo7Aw2348kCUUg20/Bi9z5JfDIVILf
	24QHb8DpojstLIP34WuJBJ6R1oEThokpVuau69VZMcxa94iQrYSySMKhTg4CoWU+
	C2EkWvZ5jGPzQxqM6UBDB8QVJOBDXaVPnfUMz9/9NiZiFtWHi9RF7o9nhMpsTSow
	qALezR3jfjDjbzMDZJwU4MHpuYnmJQ/ocS10wCgMo7LKyIj/f3JhkyjeSvoI4xCu
	5DCqm7a/bDsBQC5ACcVjqvnKLLJsTgK8jO+lC1DfTcZQxpRuhceu23wbQ==
X-ME-Sender: <xms:dfyYY5qgPKT1lFewG_2cHFvZLFeaoOb0EF0Lrvqn86W3D2Nd_-Ywug>
    <xme:dfyYY7rZCEhZvOO02QI02viyqV85W442oXT2msABhneM8nFAbNy9zkum2rlb166X0
    udeOfyaubVrMWg>
X-ME-Received: <xmr:dfyYY2MoOpqyHBEL6Nf9wJn1sI_A6xsDU3HWW5QIjs7SDvmoWNrMiUo4LqKnhDbuk0TUKYZyEbRH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:dfyYY06QM0WZFc0vbJUo8MGzq1UICpsWAh1Dmt3zyGHBmpG7MqtiFw>
    <xmx:dfyYY45JxrKp86OVsGm5lElYRu7blJA2sz-JCNGowM9naf2FBRdyeg>
    <xmx:dfyYY8iBUbgske0ozblznvwE17-he0QkBrot1WTFjtKx0Ddvkl3KXg>
    <xmx:dvyYY6vvn0EREtz6_mB66fJO7LfqH6RNCDH9jB1OV-zAvyEBIOe5qw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 01/14] x86/mm: Avoid hard-coding PAT in get_page_from_l1e()
Date: Tue, 13 Dec 2022 17:26:42 -0500
Message-Id: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1670947711.git.demi@invisiblethingslab.com>
References: <cover.1670947711.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also force the unused entries to UC and add a comment.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 78b1972e4170cacccc9c37c6e64e76e66a7da87f..b73cb29327ba49703673886d09d79f2f8928a6c0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -959,14 +959,19 @@ get_page_from_l1e(
             flip = _PAGE_RW;
         }
 
+        /* Force cacheable memtypes to UC */
         switch ( l1f & PAGE_CACHE_ATTRS )
         {
-        case 0: /* WB */
-            flip |= _PAGE_PWT | _PAGE_PCD;
+        case _PAGE_UC:
+        case _PAGE_UCM:
+        case _PAGE_WC:
+            /* not cached */
             break;
-        case _PAGE_PWT: /* WT */
-        case _PAGE_PWT | _PAGE_PAT: /* WP */
-            flip |= _PAGE_PCD | (l1f & _PAGE_PAT);
+        case _PAGE_WB:
+        case _PAGE_WT:
+        case _PAGE_WP:
+        default:
+            flip |= (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
             break;
         }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


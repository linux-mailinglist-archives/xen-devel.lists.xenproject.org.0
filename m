Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383C6A86744
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 22:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947818.1345422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4B-0007wX-IV; Fri, 11 Apr 2025 20:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947818.1345422; Fri, 11 Apr 2025 20:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3L4B-0007tn-EM; Fri, 11 Apr 2025 20:33:35 +0000
Received: by outflank-mailman (input) for mailman id 947818;
 Fri, 11 Apr 2025 20:33:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5hfk=W5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u3L49-0007cp-GK
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 20:33:33 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3addbbba-1714-11f0-9ffb-bf95429c2676;
 Fri, 11 Apr 2025 22:33:31 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 15B6913801E9;
 Fri, 11 Apr 2025 16:33:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Fri, 11 Apr 2025 16:33:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Apr 2025 16:33:28 -0400 (EDT)
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
X-Inumbo-ID: 3addbbba-1714-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1744403610; x=1744490010; bh=qNI+VqSEj0
	KVeZX4bXAfU5HaNIGKRMphh1Sp3jCnRHA=; b=BzyxJe66q6LlGJmm3GY41iiNJ3
	9sHcabf5OYpHCrLeqFcfBCC8G2XK3rPSindGoQHvzfIzzAH2ktjdDbnp+lZ+7Y/d
	MIfOgGCI6pQLXpN/0r7fDhEYPbVyG9ZOBWPEzLbyEWTwn1K2eFiM30r4gvbxJlT0
	AOBnRrmxu/YRGPL2Kp4o7LcjmZ2pa2cUOnxiggQO1dOI5MOekLDhuWcRfVy0VQka
	BcZkYq/TzYlfWM+eTllOr+TlV+d2iyIip1zQCbkPsndzrCcLb7QZ5s4IKz84rRXV
	qv4+VRD91dsUQWEEsT6ZI+RMewgFLueubTfQtLsnO3h3TUm2vkaLW9TuxlTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744403610; x=
	1744490010; bh=qNI+VqSEj0KVeZX4bXAfU5HaNIGKRMphh1Sp3jCnRHA=; b=I
	454Pl5J2bzBUXqCPqP+lZG4QXpDjlTyV2R2Ea9dupk/m7lRYdimfdg6FezRyVknT
	N8h1BMGXdwNKQM6OyO+6tdp+wucisHMrMzG2OgA6TP+mvRms2kcSmox5uKVheswz
	38ahlpFmeLVlXUy+OVwPLB+mi098bxF29a02ao7NzVeUaZtTthKeVuWMWR3MygQR
	2+9lz+Y96QoYeMjk6HPZvcv0+6DLr0fajM3Yagdj+JguTJLERMOoo+xfAAeFX1ue
	vMKrsQBp8vfjcZOjvbi/z6L7fG+hDIZ5KqE2yiaS9YcCT/Ai4Z2i7iM7jPwxD5mT
	b9DHZNMb5s+VBUNtiC00g==
X-ME-Sender: <xms:mXz5Z5dIXIdIkKMEKchJoGgc4fuQlQpGpV7yenHyVRLSAzq4v_LQCg>
    <xme:mXz5Z3OurLDurYMjs7dQOgLUy-8hxS_IWSElbpYe-cFeu3JiwJEMut1zMTfAzb025
    vJZYaJJXi6DGw>
X-ME-Received: <xmr:mXz5ZyjxpeGeCFokwI4f2YPsnIsKY6Z1em2nRunXr-q8QQDPvOhpgo3nknBtodisa-II_O0ayGexU7KQqUKrQuBr0TfFJoxRJMbDu4LJOq_aivksnZ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeig
    vghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtth
    hopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtph
    htthhopegtrghrughovgestggrrhguohgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mXz5Zy8KFXC8Z6Hrq4Rhx5tgN-lLVDwTBKQ9nnmMoViACbstvsia7w>
    <xmx:mXz5Z1tUswHM1Ox_pW-9PkZFUz07_-dAcktpQVDY64p0JIyhCWxn_w>
    <xmx:mXz5ZxFJ7wWhPK_YU-7vAGjdLaTduAb4gUYy0VUT_AUEzinz1ee0Gw>
    <xmx:mXz5Z8Pz0A4nEUj7ubuOYgGeKwXFMRiqdnHBn5Nrf2f6VjahAgy-Aw>
    <xmx:mnz5Z02xPCAQGXHsgi5ZpPlmLIOPklXeMcLwd-1B4pN5uoFAeWl2Q47N>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/7] CI: fix waiting for final test message
Date: Fri, 11 Apr 2025 22:32:14 +0200
Message-ID: <ad1db17ffa1883b1aa21a8480e4fb628a6d0c929.1744403499.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
References: <cover.146eb3617cc9cf442dd4fc7a0a8950fb1bc191c8.1744403499.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expect normally discards initial part of its buffer after matching the
patter, before looking for the next one. If both PASSED and LOG_MSG
happen to be in the buffer at the same time, depending on their order,
only one will be matched and the waiting for the other will timeout.
Example expect -d output of this happening (parts eclipsed for brevity):

    expect: does "\r\r\r\nWelcome to Alpine Linux 3.18\r\r\r\n...\r\r\r\r\n(domU) + echo 'pci test passed'\r\r\r\r\n(domU) pci test passed\r\r\r\r..." (spawn_id exp4) match regular expression "pci test passed"? Gate "pci test passed"? gate=yes re=yes
    ...
    Gate keeper glob pattern for '\nWelcome to Alpine Linux' is '
    Welcome to Alpine Linux'. Activating booster.
    expect: does "'\r\r\r\r\n(domU) pci test passed\r\r\r\r\n(domU)  [ ok ]\r\r\r\r\n(domU)  [ ok ]\r\r\r\r\n(domU) \r\r\r\r\r\n(domU) domU Welcome to Alpine Linux 3.18\r\r\r\r\n(domU) \rKernel 6.6.56 on an x86_64 (/dev/hvc0)\r\r\r\r\n(domU) \r\r\r\r\r\n" (spawn_id exp4) match regular expression "\nWelcome to Alpine Linux"? Gate "\nWelcome to Alpine Linux"? gate=no

Fix this by using -notransfer flag to keep matched part in the buffer.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/console.exp | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index c27f893dfba7..834a08db1b95 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -48,11 +48,11 @@ if {[info exists env(BOOT_MSG)]} {
 if {[info exists env(LOG_MSG)]} {
     expect {
         -re "$env(PASSED)" {
-            expect -re "$env(LOG_MSG)"
+            expect -notransfer -re "$env(LOG_MSG)"
             exit 0
         }
         -re "$env(LOG_MSG)" {
-            expect -re "$env(PASSED)"
+            expect -notransfer -re "$env(PASSED)"
             exit 0
         }
     }
-- 
git-series 0.9.1


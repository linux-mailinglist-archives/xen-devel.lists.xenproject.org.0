Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A295976FB9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 19:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797741.1207808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sono2-0004eU-Dz; Thu, 12 Sep 2024 17:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797741.1207808; Thu, 12 Sep 2024 17:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sono2-0004cR-AR; Thu, 12 Sep 2024 17:40:34 +0000
Received: by outflank-mailman (input) for mailman id 797741;
 Thu, 12 Sep 2024 17:40:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWCI=QK=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sono0-0004cL-9j
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 17:40:32 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19ff2ad8-712e-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 19:40:29 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 9D5BE11404D7;
 Thu, 12 Sep 2024 13:40:28 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 12 Sep 2024 13:40:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Sep 2024 13:40:27 -0400 (EDT)
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
X-Inumbo-ID: 19ff2ad8-712e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to; s=fm1; t=
	1726162828; x=1726249228; bh=C0CRoUPAF+tj5l0mhMdzYQjLyDyRRAiDqeb
	HKb2HEIA=; b=k5HF1drxCXlPO6Cq2quvUgg74/sx5DkW+mYeBk3+0IAyc+bev/F
	UtXS++UG6R1v5GF5Era7cLhD/CkDXYCDhrMJuAQ8XD03M3tyVflw6rspS6bl/mnz
	sQ2qprhBuFrSP1nwnxD6wVczPEKbT0DSINFMd6IR4S205wSaM43wUucF/sBxzWGw
	fdy8Kik0FeV7M1D+06jCBbzw15SNSpDVwuK0vX0+FV5/xxeuK5L01652GeCAbukh
	yjSnPf0Gf9jo92jaTrAtg4I+2a7DXvMkH/hCs6bEyBfARkKn/iKUD/iKi/FffcNw
	a5QZpHQfJEoS05GPd2K3BZnNLsFDVAcuJoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726162828; x=1726249228; bh=C0CRoUPAF+tj5l0mhMdzYQjLyDyR
	RAiDqebHKb2HEIA=; b=KelCRy+5JG9wJo741H0z6/IXUFoOrU8Ie9VL11vmuoCt
	/2NGiTGC/hgbUVVjZmzY1ZgDQwnFyrm+kF9/TJIgbb8fudMYgryygt6ydzVHRUv/
	v6wEjYGJgiEcNnNFvBULQPR4YLJ62reW71KW7aC28+fabB15cdWRxuR7mYnmlK15
	PK/++UZ3HgsS8DVfQ7LocKxF+92I/rN0RGtgXJJFGhumMVrCjETZJX1ODV5GU+Ci
	OzdO3NSL62e4Qvumwr47Gqk0NeFp9uuKlFRttt8Wh8p1/HbudYXL/F3ugem3r82q
	00VJ0UPcfCjArffV3wpwDPdHjlvlVcvip+Dlz68O7w==
X-ME-Sender: <xms:jCfjZvFsGRFTqkFWdp2Olw8SIqU_v2aF8qA7tJxKbjH514DWLfZCOA>
    <xme:jCfjZsUE1tPsJ3nIGX7ocL2B9-KifQSk5W0UabHXE0qTDqHw909bL3lrTcKjjSkTl
    DE-U_RNTQtZeMg>
X-ME-Received: <xmr:jCfjZhJeZa1Tjp-OyuMxtOii4jPo2JiLBwsXS8BCD7DsIhsBoVltRz7JfOt7EwAjhYDMqTZnqK7bSbnDOdHbFpO2rvDQ0hFCZ50nRX2gwUiPQY_PLKlCDp339Dd7yBso>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeegkedv
    kefgffegkefhieejtdffkeehhfelheefjeeutefgleeggfdtveeileenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhi
    sghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhr
    ohhjvggtthdrohhrghdprhgtphhtthhopeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtg
    hpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepmhgr
    rhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:jCfjZtGlKIAVx4ChADX6Y4XsDi2nEGkXup5xv-KWAwNL2wUpeby_gg>
    <xmx:jCfjZlUkOG0Kh5uosh_SAz2VvcgxfUFmx7Ox3S7YtBMEwmT1Tzta0A>
    <xmx:jCfjZoNyzqbK8NZwPyjRDs86OYr3RsOb9K5cUdd8X1rv3MLpxzMHuQ>
    <xmx:jCfjZk0FKh6lHvOugACdplC8QC2TsTICuLHYFRKEd3-ZYzVI3-Vz_Q>
    <xmx:jCfjZjf-0IXluL4S45t_kkIwt9AlkLUSqohp9KENaq1K9FTqMaS8iYxb>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] Fix two problems in the microcode parsers
Date: Thu, 12 Sep 2024 13:39:55 -0400
Message-ID: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode might come from a questionable source, so it is necessary
for the parsers to treat it as untrusted.  The CPU will validate the
microcode before applying it, so loading microcode from unofficial
sources is actually a legitimate thing to do in some cases.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/cpu/microcode/amd.c   | 1 +
 xen/arch/x86/cpu/microcode/intel.c | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d2a26967c6dbc4695602dd46d5836a6d88e15072..31ee5717c5f1c7d0b7e29d990cf4d1024d775900 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -338,6 +338,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         if ( size < sizeof(*et) ||
              (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
              size - sizeof(*et) < et->len ||
+             et->len < sizeof(et->eq[0]) ||
              et->len % sizeof(et->eq[0]) ||
              et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
         {
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 6f6957058684d7275d62e525e88ff678db9eb6d2..7a383adbdf1b5cb58f2e4c89e3a1c11ecc053993 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -158,8 +158,9 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
      * Total size must be a multiple of 1024 bytes.  Data size and the header
      * must fit within it.
      */
-    if ( (total_size & 1023) ||
-         data_size > (total_size - MC_HEADER_SIZE) )
+    if ( (total_size & 1023) || (total_size < MC_HEADER_SIZE) ||
+         data_size > (total_size - MC_HEADER_SIZE) ||
+         (data_size % 4) != 0 )
     {
         printk(XENLOG_WARNING "microcode: Bad size\n");
         return -EINVAL;

base-commit: 035baa203b978b219828d0d3c16057beb344f35c
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


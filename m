Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8521977361
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 23:12:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797822.1207880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sor6T-0005pQ-Pd; Thu, 12 Sep 2024 21:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797822.1207880; Thu, 12 Sep 2024 21:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sor6T-0005nF-My; Thu, 12 Sep 2024 21:11:49 +0000
Received: by outflank-mailman (input) for mailman id 797822;
 Thu, 12 Sep 2024 21:11:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWCI=QK=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sor6S-0005n9-98
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 21:11:48 +0000
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e040789-714b-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 23:11:47 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8D63411400A6;
 Thu, 12 Sep 2024 17:11:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Thu, 12 Sep 2024 17:11:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Sep 2024 17:11:43 -0400 (EDT)
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
X-Inumbo-ID: 9e040789-714b-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1726175505; x=1726261905; bh=uGUo7HMOknbaksfWBKsJg
	9IwCXgEtdZCK4kATC88+jo=; b=wL3JCLdJvhyje2MsBcM8P1KeEZ219q+DX2Pvd
	Q13/wXWXbXja6aqzdEmfONlrMTHv2wC3UM7rIyr5k/88/i+TZMDBQPXUTx7ItjQW
	IYJROwnhE3DqIteG42H1XqBjszetQuNbsl6WDMYi92EO4LUn6snq11E+Kl/U4NKQ
	oiPiw9Fyi0yVKb+EAJ48hqiZy6cTg15irao7I+rAR6B07VwawBm2iYZ6Fh6pNgGL
	/UZn47eWNYxGHf/Wx+TmioeIf7ZRgx5B00o4Gz7l8P35kchIVH3yMY5EkapBY6AY
	kGEYztV4+d6kEKs6xUKIvIEEaNI0Xd0i3HEKDseH74OinfBQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1726175505; x=
	1726261905; bh=uGUo7HMOknbaksfWBKsJg9IwCXgEtdZCK4kATC88+jo=; b=e
	lG43Q91I07vFZn/X5uWHDgHcra8Wi2z9MorCr+AeKg8ZWroxlL8YbtOxkD/qrxjn
	H2NU5pFhED7jodNP9c2INSyoPxNdo8yIRLkk+3QsOdfo/XuTmK0h7TbF5tsfoHcp
	H6ROJBcny7XMYjIUmCsqyBbq5J6LfLYS2/Nk/u76p15JgCwq02mNz6MBRh2N0FlE
	jNTB41lI6dsijYzmOa/4jIiikhcU9k7CcBMuwCf1Tgmcc5jD54rVLdLed4Kmg7uK
	pipKeephOjbtV9pfd+/B0ynguOdIlgcPl4QpLLkc4EFaQTTCz7MiHLGsFsWJrQE0
	5T8DkBqQbY9B7W39u9/Cw==
X-ME-Sender: <xms:EVnjZvaBmYpresIW5519QbHhrljGe3LaYQvmU5O5U6mdU5hfFy6h2g>
    <xme:EVnjZuZ13VgmfZZ3T96PGC9f67wygwcKCYxx__qdYR8TaDQKy_vNPl9_KHyfst8Sr
    HhrJb3coHSRgDo>
X-ME-Received: <xmr:EVnjZh8voOnlutv1SsO7b9xQZndk5OuetAeWhflHY-qJLNLPOsGhcNqN1k3IyZ2CYSKWkkcyK9dsZHo2Zj3393OKXLHALycoWeoDqDcjvD_VsVe44vsV3bmAqYjw2Q7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffej
    gffgueegudevvdejkefghefghffhffejteekleeufeffteffhfdtudehteenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopeguvghmihesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpd
    hrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohep
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:EVnjZlpWAfspkRAeox7D5g9AlFQht1gsH0N29OcSGkYSyeyOn_bpNA>
    <xmx:EVnjZqpkYvZfAwHdkkE0vRpbgNTHPY456zH0ssX1yzO5HGMW9iYHXA>
    <xmx:EVnjZrQ09AeVFxhZiW6IC5U1exCvKgswHsXp0DAQE0x5yQdsWfEIJg>
    <xmx:EVnjZiq64epE3iaUeWT3OauYH8X7zRqrMHJq9H32ZyqwNmZom90s1w>
    <xmx:EVnjZnAYsq4o172s6ca3pTxVfw70AVw5Ya7a8sUnFGSZEQJUBU_TN_Bw>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2] Fix two problems in the microcode parsers
Date: Thu, 12 Sep 2024 17:11:32 -0400
Message-ID: <a7dcfa4c8d4ca16fc734d729b34dbd693ec56f45.1726174797.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
References: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The microcode might come from a questionable source, so it is necessary
for the parsers to treat it as untrusted.  The CPU will validate the
microcode before applying it, so loading microcode from unofficial
sources is actually a legitimate thing to do in some cases.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/cpu/microcode/amd.c   | 6 +++---
 xen/arch/x86/cpu/microcode/intel.c | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d2a26967c6dbc4695602dd46d5836a6d88e15072..08fe3ac61c18a8e16f694e128973da96ce6995e3 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -338,8 +338,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
         if ( size < sizeof(*et) ||
              (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
              size - sizeof(*et) < et->len ||
-             et->len % sizeof(et->eq[0]) ||
-             et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
+             et->len % sizeof(et->eq[0]) )
         {
             printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
             error = -EINVAL;
@@ -365,7 +364,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
             if ( size < sizeof(*mc) ||
                  (mc = buf)->type != UCODE_UCODE_TYPE ||
                  size - sizeof(*mc) < mc->len ||
-                 mc->len < sizeof(struct microcode_patch) )
+                 mc->len < sizeof(struct microcode_patch) ||
+                 mc->len % 4 != 0 )
             {
                 printk(XENLOG_ERR "microcode: Bad microcode data\n");
                 error = -EINVAL;
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index 6f6957058684d7275d62e525e88ff678db9eb6d2..3e113c84b1fff0ba18a0251dbac0c7d6e2b229f6 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -149,8 +149,8 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
 {
     const struct extended_sigtable *ext;
     const uint32_t *ptr;
-    unsigned int total_size = get_totalsize(patch);
-    unsigned int data_size = get_datasize(patch);
+    uint32_t total_size = get_totalsize(patch);
+    uint32_t data_size = get_datasize(patch);
     unsigned int i, ext_size;
     uint32_t sum;
 
@@ -159,7 +159,8 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
      * must fit within it.
      */
     if ( (total_size & 1023) ||
-         data_size > (total_size - MC_HEADER_SIZE) )
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


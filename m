Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725607BB035
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 04:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613207.953596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDo-0006oY-0p; Fri, 06 Oct 2023 02:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613207.953596; Fri, 06 Oct 2023 02:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoaDn-0006ll-Sl; Fri, 06 Oct 2023 02:05:43 +0000
Received: by outflank-mailman (input) for mailman id 613207;
 Fri, 06 Oct 2023 02:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8zii=FU=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qoaDm-0006iG-8I
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 02:05:42 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6a105f6-63ec-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 04:05:36 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C2DD75C030A;
 Thu,  5 Oct 2023 22:05:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 05 Oct 2023 22:05:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Oct 2023 22:05:34 -0400 (EDT)
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
X-Inumbo-ID: d6a105f6-63ec-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696557935; x=1696644335; bh=nH
	ktnuR1LIoxBK0JLNtSz/hwE9AIqkiBxUTneESqhUo=; b=xezwTP9LNjstEVVq8y
	wJZyuDDgKDDcZkI1oOusGThT5vSYNbKfFI0Ro0H6/raa+68zlMvIHU4TH2Vg2lYa
	6LHU0GUeEKLQ5oiEU0NBZrFKfi0gVQeQh0fwm5VWncXNmzzgj9twj4YnD/g1MmNC
	mn6FwXU/l3M19LKcJEZn0xTSqCWPsR6PgxO8w1PmHfT7jgaKZlnzEmchP/LobGf2
	B0Rsay+qk0twVfzRg0JGfNGlRKxoptThLu1/j8tWEjLcHLyyiTMW44+mKUf8rSN1
	dU1UJNOCE74mNJXGy8FRLaR7fEIgj+2kC1Jzx4VD27NSrNKulLneouRcGetAMdZQ
	0lHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1696557935; x=1696644335; bh=nHktnuR1LIoxBK0JLNtSz/hwE9AIqkiBxUT
	neESqhUo=; b=nFleuiCRPyCob8HQfWIjAbSMc56J4J4vtH5/eKrQLV2DrwBd/sN
	WaiLfhMbK6mLTLTTtytLahyMPj0zJuMwE9YdqSLFAgeHzVcfLAY4Z7UcrRBEON26
	UzCILwdS7w81HrsGYI1EghjMtLS0gm9/NSt7VZrMOQHU9eu3+xpMTyuUiGdvsQHU
	FykBtJKnjfwsGogW0+T1anR5rLlaEHMyY69uxTJOCH7/AeNxnWFmGT0OYgmXR0/F
	VWOK3v2E+VWAsePksBomwQLZjdIf8Ti85BRquSPk5ilmQFcBL9dDzz/SRc826i4D
	Zp7FxPIcee0fuCglrhZy4T6WQFK74ROFLfw==
X-ME-Sender: <xms:b2sfZR70M8UxFZeEuhOu_ncPcGcRcErDINxTAjZAmKTPGPDNIRhjZQ>
    <xme:b2sfZe4AEPwBmyYpNXJjelL4jhk_moOc2a7EGZ_W4h7JiXvFExzNnX0DgeUl0tf_u
    ripcPdkq76yNg>
X-ME-Received: <xmr:b2sfZYeRbupjzztafMJcj9BRrb14gFqEYKMZHC6lyYWXasmxk8ynq39UGbtlGS0SZsD1BIsI72oJw8wwTkDliZNVh9gTdQ2RuuEIdmscNpkEA8dc4P4L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfeu
    udehgfdvfeehhedujeehfeduveeugefhkefhheelgeevudetueeiudfggfffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:b2sfZaKsKqf8b-pU3HJo7sxhDQuEQCCKyuMLOHASgeJgD1a8uXHocA>
    <xmx:b2sfZVLR4GEmi1ZRxuAvHb9qE3lLtHVxafuxhHNKoGL7l_WcAd9esA>
    <xmx:b2sfZTxoRz3XcMA5WAHQ3IbMPYqoRqu9iHAaVMnp78knJLuphv1usg>
    <xmx:b2sfZcX2oSsGkw29v8lzUnTKZkiOVNlzvV9XUuu09oCRtqJ_8bq0yg>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] automation: include real-time view of the domU console log too
Date: Fri,  6 Oct 2023 04:05:15 +0200
Message-ID: <d2e566ab602df7a22c1974a0fc469e4b2653128f.1696557834.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
References: <cover.550599c54c91da4f8417fde358992e75bf8163c0.1696557834.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Passthrough domU console log to the serial console in real time, not
only after the test. First of all, this gives domU console also in case
of test failure. But also, allows correlation between domU and dom0 or
Xen messages.

To avoid ambiguity, add log prefix with 'sed'.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/scripts/qubes-x86-64.sh | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 5f6052eef041..1e84e40a4afc 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -33,8 +33,6 @@ echo \"${passed}\"
 until grep -q \"${passed}\" /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
-# get domU console content into test log
-tail -n 100 /var/log/xen/console/guest-domU.log
 echo \"${passed}\"
 "
 if [ "${test_variant}" = "dom0pvh" ]; then
@@ -59,8 +57,6 @@ echo deep > /sys/power/mem_sleep
 echo mem > /sys/power/state
 # now wait for resume
 sleep 5
-# get domU console content into test log
-tail -n 100 /var/log/xen/console/guest-domU.log
 xl list
 xl dmesg | grep 'Finishing wakeup from ACPI S3 state' || exit 1
 # check if domU is still alive
@@ -121,7 +117,6 @@ echo \"${passed}\"
 until grep -q \"^domU Welcome to Alpine Linux\" /var/log/xen/console/guest-domU.log; do
     sleep 1
 done
-tail -n 100 /var/log/xen/console/guest-domU.log
 "
 fi
 
@@ -169,6 +164,8 @@ ifconfig eth0 up
 ifconfig xenbr0 up
 ifconfig xenbr0 192.168.0.1
 
+# get domU console content into test log
+tail -F /var/log/xen/console/guest-domU.log 2>/dev/null | sed -e \"s/^/(domU) /\" &
 xl create /etc/xen/domU.cfg
 ${dom0_check}
 " > etc/local.d/xen.start
-- 
git-series 0.9.1


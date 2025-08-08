Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B79B1EA69
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 16:34:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1074621.1437119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAQ-0003ON-M5; Fri, 08 Aug 2025 14:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1074621.1437119; Fri, 08 Aug 2025 14:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukOAQ-0003KB-I5; Fri, 08 Aug 2025 14:33:58 +0000
Received: by outflank-mailman (input) for mailman id 1074621;
 Fri, 08 Aug 2025 14:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9AHj=2U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukOAO-00039R-SN
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 14:33:56 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e94a86-7464-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 16:33:55 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 8C848EC010F;
 Fri,  8 Aug 2025 10:33:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Fri, 08 Aug 2025 10:33:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Aug 2025 10:33:53 -0400 (EDT)
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
X-Inumbo-ID: b5e94a86-7464-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1754663634; x=1754750034; bh=XYEM16PFEC
	+C07aNCwHNTryayJQ8IVoh25l/VJaDrnI=; b=AAKUwHAzcwi3Evi2oQse0eEMLv
	jGvcAxYOqwLeq47mHYUh0/4azDf1+u8TOK6Wgsb3HGhwZhN40qSyXr4ynmyTj9y5
	puu4HoH75rQ0u1tw1IFuSEmqj0ow+8hh7MSc/IAFvf/88ENkPLwglSqaA/Bkof/1
	+2alFGnxVdPxXHbRG2jt03Syvtdhf7nW6V1NKuvUr+CwE/AR4ttJitComTXHWcIv
	rClGZ6/2k8BuUX03OTWbfmwRHKNneUKDGuQm4Pb2cJyjvCybbPzvABGP7+L+6Pe/
	OdM589AGGli6o///I8GxBHmP8ajln6wYhNckw21OpCJaCqMgiEK98NO1lhyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1754663634; x=
	1754750034; bh=XYEM16PFEC+C07aNCwHNTryayJQ8IVoh25l/VJaDrnI=; b=b
	AhjKWTTYwlP61LretcNs6b4KC6T54iAAqaGaPcFgbQZHQ7BgxgsAgYtSjtEzzx8G
	khvmTVTkBBrKgryMRRKq43Zqeb7SxWdf3i2MxderjDQcLWmdHS13vd5CZ1nKIcXw
	DFqy/KSzg+gtbPPBmglazFIeHejssOlA7elfQJ8tWlrwuYI1FAHa0C6hvlP+llDo
	EbjZsTsYSZ3dg6/Kcpb9yZZGT2yn7DAY8Gi7unEYINVl+byzpZYRMBpX+TcS7H/4
	b1zqtXOMGJMklLmXQLcTef/R0X8lU3cMhJ4nN1qGmLUb9ai08RqDzGPXbdbQ/rZz
	GjDPNafosO5gYnUJWog/Q==
X-ME-Sender: <xms:0gqWaLdxl_KVF32lP4laybwSABZJNnWlbjmwJb5Qx7SeiBcIRuddvw>
    <xme:0gqWaLziQ0-IWKh8C4qe1C82ZjBw-MaqR7t7VpRAkoFPmTxCbXvqIIoF-DOuWqL4D
    FetpzlxoBXhVg>
X-ME-Received: <xmr:0gqWaBGADKQb5EQu6HYCoWb8HvRLjMJN6qY0ekl4EKlJPDmIlKu12iJea4IVOeSu4FaNiQ9rbhKUxoVJOYmgPgqI5LycxACLqmCy-0WUAevuojvoKcQ2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdegtdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefguedu
    hefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhs
    rdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhrtghpthhtoheptggrrhguohgvsegt
    rghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:0gqWaPwCT48h-2jDqcc1diqG4rGjd5r56eC4vwLvvgxv2QsBlso59A>
    <xmx:0gqWaCv7OJhbsuED2U1Yh4RQeCwpwuaxN_Ioh_TDa4lLOXfUs8zEew>
    <xmx:0gqWaM2mel_ANFFM15I0TfpB3TkvrEHlXgkHUzmgfuQeHSuG-w1zwA>
    <xmx:0gqWaN8ZPn9JBOzHCQ580ivw0EQER3HiiQFTNjLwGCPxnrm0YL-xeQ>
    <xmx:0gqWaBZFkWZPxsMilqqiWTos4CCCdjSGxMrdqBvwXiFYmFT5mB5WwBv5>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] CI: Add configure --enable-systemd for full build
Date: Fri,  8 Aug 2025 16:32:42 +0200
Message-ID: <526d26a85bd1f164dd8a421dfcc1e765c3ff5590.1754663560.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
References: <cover.961bf2f7929562a899b182283446598d4c055149.1754663560.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This doesn't exclude sysvinit scripts, but allows testing systemd too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
--
New in v2.

Requires containers rebuild
---
 automation/build/debian/12-x86_64.dockerfile | 1 +
 automation/scripts/build                     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
index e26a19079e38..3a53d92ddf6d 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -24,6 +24,7 @@ RUN <<EOF
         git-core
         pkg-config
         wget
+        systemd
         # libxenguest dombuilder
         libbz2-dev
         liblzma-dev
diff --git a/automation/scripts/build b/automation/scripts/build
index 0e7494ff6d87..4ad42889c78c 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -69,6 +69,9 @@ else
     # Full build.  Figure out our ./configure options
     cfgargs=("--prefix=/usr")
     cfgargs+=("--enable-docs")
+    if pkg-config systemd; then
+        cfgargs+=("--enable-systemd")
+    fi
 
     # booleans for which compiler is in use
     cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
-- 
git-series 0.9.1


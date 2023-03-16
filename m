Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E66BD6D4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 18:17:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510755.789080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDm-0003F8-4z; Thu, 16 Mar 2023 17:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510755.789080; Thu, 16 Mar 2023 17:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcrDm-00038E-0h; Thu, 16 Mar 2023 17:16:58 +0000
Received: by outflank-mailman (input) for mailman id 510755;
 Thu, 16 Mar 2023 17:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcrDk-0002vv-Gw
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 17:16:56 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 593797db-c41e-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 18:16:54 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2C2E55C0172;
 Thu, 16 Mar 2023 13:16:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 Mar 2023 13:16:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 13:16:52 -0400 (EDT)
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
X-Inumbo-ID: 593797db-c41e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1678987014; x=1679073414; bh=R2
	KhcNjVkVS92xl9mbSvSkrpGVEwfW14kn3tzUhf1No=; b=R+zVOn1ZWIPiCdyCin
	mqfjeXFvMv6+JZXCqF+93IWm1bOAYJgwV1czAbCcmU/hE9461hT4OlZflpB92D/o
	ZKuI4e/YHOiICDxSxesZy4FLtpzHCuXLFqMts6bHBmUIJIDJG/B82JKK2fzHIJ7b
	J/rvHlpyWjzlEhHwaw21ef+h310MtADR5LTy7lh6AGDVb611+nYAhI4RQaHa8Vnu
	FFMf98p4mubUUGiQVBXVgTPY5i1OFnfg5NpvQBW2ByhD0PuNYu3jJWM1+ZMbqv0o
	Cl0REgkFLvXt/RYASMZ+nLxCdJngRb3tfJvrLFtGbxnzQIRqGWKEaZpGk0szn5LA
	BzVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1678987014; x=1679073414; bh=R2KhcNjVkVS92xl9mbSvSkrpGVEwfW14kn3
	tzUhf1No=; b=LNmgunLGxTEnSX1F0oVDYFKwhGlbLRyR6OETGwdhTw7twyeVIrv
	dLD8jwU+CLLdnVzFAMlA5Z5Pm+ONFo8ewLrm9j94ApYB0u+ke/sN8XBLV1GvN1SF
	pDBOc18SfUNbV5PfyyGkSHFVVQC8GKOomnrdpRUPiTqwr6Q267m/3s5kmkgLwf+Z
	LZEzqAz+oeVnk28ETSW5Lh2ZT92UJj/rXXhzTN4NSMbXumLS+tULadaJCujlk/JU
	3FLqNqRECi0dDHUgj6eKGRLRdP8l/Pp7Yrczht5GslxrKRSoij0WsDk0Tjzjo8NL
	aNjqIfwpZJHys9fdHBqucAJ8V0b5CnFej8A==
X-ME-Sender: <xms:BU8TZHXL1D19EQ40D6l4mAp4TGF22un2fZ24C86U1xIhTxy29F5IPw>
    <xme:BU8TZPnaN9BrhWs9rX5UNrwL-r0bM6NgR40TYdtXVsYjKr1Tk1Q3dI0WHj0Xj-AtW
    S5dgXh9ZtxX0A>
X-ME-Received: <xmr:BU8TZDZKcJnd1_gdwwzjqBlaRzDIGIW2njj5Mq6_MMQ735PyAttPKT-w7WNNbyvAsn1xR_aSeYNEoo8fJUxiKlucj8eDVDMKddETp7286f8t_qfbFooM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
    rhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghkse
    hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
    ueejhfejheelteetfedutdefteegudelheegteefkeduvddttdduhfeufeevteevnecuff
    homhgrihhnpehphihthhhonhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Bk8TZCWJJ7oSukLnQ8tFRRznF4PErvA-JEBJv3nHFuVm2XmuxrFGhA>
    <xmx:Bk8TZBlnbIis65Lzqvev1ImY8mNErWBDI9dFBVquQLbfxJR-otqc4w>
    <xmx:Bk8TZPf3urRvALkGAJcDsNWlvp4EDo3RPUjOKJcSBPFJAEzwKfon0w>
    <xmx:Bk8TZEvBrtK0Aw3V2VSMVYxW5p4f7pK2rM8VoO4gjoKo1whOLqGeHQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/4] Update README to state Python3 requirement
Date: Thu, 16 Mar 2023 18:16:34 +0100
Message-Id: <20230316171634.320626-4-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
References: <20230316171634.320626-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python2 is not supported anymore.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 README | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/README b/README
index 755b3d8eaf8f..b2d9d79d891b 100644
--- a/README
+++ b/README
@@ -50,7 +50,7 @@ provided by your OS distributor:
         - GNU Binutils 2.24 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
-    * Development install of Python 2.6 or later (e.g., python-dev)
+    * Development install of Python 3.2 or later (e.g., python3-dev)
     * Development install of curses (e.g., libncurses-dev)
     * Development install of openssl (e.g., openssl-dev)
     * Development install of x11 (e.g. xorg-x11-dev)
@@ -180,9 +180,9 @@ Python Runtime Libraries
 
 Various tools, such as pygrub, have the following runtime dependencies:
 
-    * Python 2.6 or later.
+    * Python 3.2 or later.
           URL:    http://www.python.org/
-          Debian: python
+          Debian: python3
 
 Note that the build system expects `python` to be available. If your system
 only has `python2` or `python3` but not `python` (as in Linux From Scratch),
-- 
2.39.2



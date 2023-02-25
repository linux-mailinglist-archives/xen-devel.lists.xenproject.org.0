Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD936A2BB2
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 21:38:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501870.773690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Ik-00081j-S6; Sat, 25 Feb 2023 20:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501870.773690; Sat, 25 Feb 2023 20:37:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pW1Ik-0007zk-Nn; Sat, 25 Feb 2023 20:37:50 +0000
Received: by outflank-mailman (input) for mailman id 501870;
 Sat, 25 Feb 2023 20:37:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wch7=6V=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pW1Ij-0007yc-Oh
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 20:37:49 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4162fbfc-b54c-11ed-a82a-c9ca1d2f71af;
 Sat, 25 Feb 2023 21:37:48 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 67C5E5C009D;
 Sat, 25 Feb 2023 15:37:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 25 Feb 2023 15:37:43 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 25 Feb 2023 15:37:41 -0500 (EST)
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
X-Inumbo-ID: 4162fbfc-b54c-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1677357463; x=1677443863; bh=DLRFynjeQ7h4Iqriku9OW2YC9py/QqyZn5H
	hylUDGk4=; b=Tis2+b/6AIiQ1NA/82TuNQnJfHqUecgC6ERoIGxnyOzHDpuRazo
	2vnA9m0GuMWjjB6WeREqIJaymDHrshqceKTOsNCZWkcG4e9gKfM4zvIBK2137PC5
	QA+pOQ08wqbEWYc8L38ydflFFzebLFpYto9ZPxtziCjpnZSqFn3w3LW6DE6Fa69D
	FG3Z8rO73KboK4CtJ3urBwvcoibTbDtmcFWufFevyDuEse4zXUEJUGj8ouLZEPKB
	g5fEXmpPt3ZtCcNx9FYjpjadX/z4yl0zKnCmz05r28Pc6dfhF1sFstcpH10Jfde6
	VQ9w0EC6M7xmKxZnV/mgrlB7dKleklsp+Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677357463; x=1677443863; bh=DLRFynjeQ7h4I
	qriku9OW2YC9py/QqyZn5HhylUDGk4=; b=I7VtMLO6MqopveuFt8AQ6r462eTti
	qCQMelgBYgJRgGNjKIt8+bN1rqGzJkp7P6jjo8yAxjqgePrbcx4reXyXDm+y9ZdN
	7hA74nd2wJEFNNZnF6bQkABMUlgCTBGTJt3ia6qPViccwIKTqXwb1lHy//ihga8N
	5Xbi/JHhu8PsYcrg4kctcheknQup7bXhDXoF2ptUWnvJaMZafPbAsfeOmUcxP+K1
	WdED7UlylDimE8wtLF78BUwob+sES9wrEMwA6Q1FDec1cvbWrIt+ONrbjNsLc/Mg
	UsujPeQitaoku4K7mBfmUZ1fvm07CRd01KGdMKTXXSgZ1Fahnjw+gzzgA==
X-ME-Sender: <xms:lnH6YzRdISFL4ydBQHJd1jPtEhPLQ9UNNLRPx6g5hsk3whFhJFnp9g>
    <xme:lnH6Y0yD12D9Zx1N3-uY0-h5CpEHK2ZV-UpC9osTFjUM5l7hfQjWVeHcjPh29GbEJ
    WXF9794ynPYEuc>
X-ME-Received: <xmr:lnH6Y42HKcXRZ_l8-tAJFwXv8YyfPgWqJVjdmcu8hDk00abJ84mRNlPduIHtd3DtDncuLNtfWo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekiedgjeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdeutddvfedtgeejfeehjefffedv
    tddvkefhgefgueegjefhveevueegtdfhkeehnecuffhomhgrihhnpeigvghnphhrohhjvg
    gtthdrohhrghdpgigvnhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:lnH6YzDRVsM3DQiQh5lH59YpXnUDqrd3998g6FPWh_OXJzlg-PxZgQ>
    <xmx:lnH6Y8j1a-DSXWhxcxYVv640VIp2oEewZHliW-y6UF8qwpG7kC85aQ>
    <xmx:lnH6Y3ryDxL_uvX76WRqG4Z0xrX70bbQx6BG8o0tkSfUKAOcD6ZhGA>
    <xmx:l3H6Y4h4mDb4ejoT3MFPGgscG4n_QnTrjmh5Yw7guXGDQT96nFkuHA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 2/5] Change remaining xenbits.xen.org links to HTTPS
Date: Sat, 25 Feb 2023 15:37:12 -0500
Message-Id: <e36a472b3e58ee81e8d61e7306f0ee2068eff62a.1677356813.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1677356813.git.demi@invisiblethingslab.com>
References: <cover.1677356813.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also fix an old xenbits.xenproject.org link.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 Config.mk        | 2 +-
 tools/misc/mkrpm | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.mk b/Config.mk
index 75f1975e5e78af44d36c2372cba6e89b425267a5..b2bef45b059976d5a6320eabada6073004eb22ee 100644
--- a/Config.mk
+++ b/Config.mk
@@ -191,7 +191,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 EMBEDDED_EXTRA_CFLAGS := -fno-pie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
-XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles
+XEN_EXTFILES_URL ?= https://xenbits.xen.org/xen-extfiles
 # All the files at that location were downloaded from elsewhere on
 # the internet.  The original download URL is preserved as a comment
 # near the place in the Xen Makefiles where the file is used.
diff --git a/tools/misc/mkrpm b/tools/misc/mkrpm
index 68819b2d739cea5491b53f9b944ee2bd20d92c2b..548db4b5da2691547438df5d7d58e5b4c3bd90d0 100644
--- a/tools/misc/mkrpm
+++ b/tools/misc/mkrpm
@@ -34,7 +34,7 @@ Version: $version
 Release: $release
 License: GPL
 Group:   System/Hypervisor
-URL: http://xenbits.xenproject.org/xen.git
+URL: https://xenbits.xen.org/git-http/xen.git
 
 BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
 %define _binary_payload w1.gzdio
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


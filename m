Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C885CA67A4A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919553.1323978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaNg-0006in-Gk; Tue, 18 Mar 2025 17:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919553.1323978; Tue, 18 Mar 2025 17:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaNg-0006gV-Dh; Tue, 18 Mar 2025 17:05:32 +0000
Received: by outflank-mailman (input) for mailman id 919553;
 Tue, 18 Mar 2025 17:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPrW=WF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tuaNf-0006Qw-0C
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:05:31 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31b5fe93-041b-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 18:05:30 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D876A25401B1;
 Tue, 18 Mar 2025 13:05:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Tue, 18 Mar 2025 13:05:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Mar 2025 13:05:26 -0400 (EDT)
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
X-Inumbo-ID: 31b5fe93-041b-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1742317528; x=1742403928; bh=2RHWRfuiJA
	Z+lCbEby7WMUQD0Se/UCEJJv5nwKDm3aU=; b=JlqMQKNrDdqCdAvV0YJPLcAIYg
	RANOsKmRJTtvhr0MaKzDJOpIupOTr8DioVF6pclVqkrxCUxSyYXhqnOn5b9AzfqL
	41o4s9EkgHKrI9gm0nbIByQkWYQws0a0FrJVFkSi4vPnkBXb8y7D+Rvu1mik5kIJ
	/se7rgHKYz8dOEgaYFltzdT4inK4MnFdRThcjRodSBa5W5cMsaUyJnOxx7RetDfU
	lb1+k9lgoGOt9L0vyfeH6eMyvScOrXDt1qql5F3JRSuRmFhnbBbzFexGQ4xl/yJL
	U5rCTvXF/68cU3r5JdeQ3gyTvJY+S2c3kzOZr6hOizUoZqovSlg9+iy6keig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742317528; x=
	1742403928; bh=2RHWRfuiJAZ+lCbEby7WMUQD0Se/UCEJJv5nwKDm3aU=; b=b
	x1fz+dahNmiVkmLgDPMk4ZGZ3rtM4nbLO+x2hXwdaeWTrI4+ANdS96tM+898nOzq
	KCQUjBs/XR2RN5TUNPTt6mCF1yu037rqRn+hT2i0yCGyERC+sMRaWhtgtb4HIbVv
	abl7N4SVw7s4YL2SCiGIOnJXomkI4oobtA+p/pUiWgm5mbq0SRasf8LAHefvSMRA
	0gYwFKqSMWp0VXqtF9/W/KXJGMUstDPD8aVjMViN2mezGaGJ1ix/BEVhOycZzKhF
	dSPiOHXqKEOFg4pJ5p4cEZcyJ5v8q0ZwfAGZbbYBYDREcqUhDeEPnDy4VpgjZbJA
	i1tUNyBF+0ltsydLJEMsw==
X-ME-Sender: <xms:2KfZZ-RuTDd5-bmY7Z8Jh_1Z-zyqS0k2L02W3mEg4rE6kkt_PBPTRw>
    <xme:2KfZZzwrUnG8uhcioJHIJz2ocit7HHIt9hS1nmMnzZGXMUhS-qQl67ryTSSbVtVfc
    -Mt_mRE7eDXgA>
X-ME-Received: <xmr:2KfZZ72ohO0unVv6Diw5SHvX2HeT5er1oKgPsA2FiRvpuWZZqHb60LOez4Yn0AUAZA5U0dCH-Bz0JdZ-e9gNUSoyNQNhHZiVlbpC03TTecrdKjPAEr0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkih
    cuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeen
    ucggtffrrghtthgvrhhnpefgueduhefgvdefheehudejheefudevueeghfekhfehleegve
    duteeuiedugffgffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    gigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpth
    htohepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdp
    rhgtphhtthhopehfrhgvuggvrhhitgdrphhivghrrhgvthesqhhusggvshdqohhsrdhorh
    hgpdhrtghpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdp
    rhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtg
    hpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdroh
    hrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:2KfZZ6ASNQq2lfRMHM7pAYhxY6zlbi7DmG5gr8Axp3YS6Gxhf5cp5g>
    <xmx:2KfZZ3hyGC_Wg0wWCkF3tDfXnmkkWNQevefvneM4Rh7xFANKzyELeA>
    <xmx:2KfZZ2opxxuu3ITiziDK-paoo2m2WOH2Y6VdGxF48flFP5mCEnYj3w>
    <xmx:2KfZZ6hvV0_jOh7-eVTf4B49csziGn2AIsQL6PdAow4G_ORhpvmbsw>
    <xmx:2KfZZ8aS4JS5iPbh8vsTCex2w88jnaaTilAlV4KWJfHp7MfIpz5QnUEV>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 2/2] Strip build path directories in tools, xen and xen/arch/x86
Date: Tue, 18 Mar 2025 18:01:57 +0100
Message-ID: <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>

Ensure to have a realpath for XEN_ROOT else it fails to substitute
properly pathes in strings sections

Signed-off-by: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
[use cc-option-add]
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 tools/Rules.mk        | 2 ++
 xen/Makefile          | 2 ++
 xen/arch/x86/Makefile | 1 +
 3 files changed, 5 insertions(+)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 6bd636709ff7..9ed0336c07d5 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -169,6 +169,8 @@ endif
 CFLAGS-$(CONFIG_X86_32) += $(call cc-option,$(CC),-mno-tls-direct-seg-refs)
 CFLAGS += $(CFLAGS-y)
 
+$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
+
 CFLAGS += $(EXTRA_CFLAGS_XEN_TOOLS)
 
 INSTALL_PYTHON_PROG = \
diff --git a/xen/Makefile b/xen/Makefile
index 58fafab33d6f..0d79e259a33e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -411,6 +411,8 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
 CFLAGS += -Wa,--strip-local-absolute
 endif
 
+$(call cc-option-add CFLAGS,CC,-ffile-prefix-map=$(XEN_ROOT)=.)
+
 AFLAGS += -D__ASSEMBLY__
 
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f59c9665fdd0..70d0653257d7 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -137,6 +137,7 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 	mv $(TMP) $(TARGET)
 
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
+$(call cc-option-add CFLAGS-$(XEN_BUILD_EFI),CC,-ffile-prefix-map=$(XEN_ROOT)=.)
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
-- 
git-series 0.9.1


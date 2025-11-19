Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D225C70BE9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 20:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166325.1492887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnbi-0007SL-RY; Wed, 19 Nov 2025 19:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166325.1492887; Wed, 19 Nov 2025 19:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLnbi-0007Pl-Ol; Wed, 19 Nov 2025 19:12:46 +0000
Received: by outflank-mailman (input) for mailman id 1166325;
 Wed, 19 Nov 2025 19:12:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5Pp=53=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vLnbh-0007Pd-7h
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 19:12:45 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8a35941-c57b-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 20:12:42 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 3B72C1D00093;
 Wed, 19 Nov 2025 14:12:41 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 19 Nov 2025 14:12:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Nov 2025 14:12:39 -0500 (EST)
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
X-Inumbo-ID: b8a35941-c57b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1763579561; x=1763665961; bh=TPHRLLUj9N7LeFhs2fEg1LQrQouY7BKz
	7R9+rgW0YsE=; b=lVQcL7UwZaCpONrm/KSwcSoH6r613//7zdP5vNMmriwIs4CY
	u5K3Z/KTcrzl+9w8Z3JRYZez1gd0uoiujMZyZItm9fws/zP7hpvczvZGt2UZRcrn
	knuwarMLKZp3q47yolrd5jFKg/Xw+7Xo50iHBeazS4BI7Cp7geLSn21QrQDPDgN7
	HfRQL5gqPr9TPULK2pYwdibIpqbIhzJLmQ9S1XCWvUw36yVBiTh4Uy2y0Dzcy1+d
	mbc/ZlyOdP5bn63drUP/RGKeB/Zu0eYFOXQiVi9lpHB78Wh5MjiiBgBRhGOAYZkE
	oWAGUxd4eMrStwqQS2NHlffd28QwHI3W6jMTqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1763579561; x=1763665961; bh=TPHRLLUj9N7LeFhs2fEg1LQrQouY
	7BKz7R9+rgW0YsE=; b=fFensa4GCJYkFrjHSMzQKHmcIxC8rKFj5b54WFuxheUK
	T/SD+VvRvO2ROBPhb3azw1u9OkVwNmrALp94U9lQ6mxMtR+SqbhWCEaOttgexbFT
	0vABzkh0HOixEbhtbNQXGmfuuZ3/jwH2hYn6pnGfk/zzKKVqpcOquClfiG0O40Vn
	q0VJVBNm4TA51EhS7SnE0RtP/5puQnXjz4jwlM6rrqYVApYYonJf5Bb4I7IP4i/s
	3WdLZTpL1xVZcNFWrR6YinRHjaEIA5lC+sAt2fSKVw8/EPfsWrF617PidkQrgAeF
	Zg+hgfaT+QQZMMIYJQq6PHeYUkOah71RddsYDsLtIQ==
X-ME-Sender: <xms:qBYeabhxux9qQWMh4wPA0TU9RxowBtJA-1NJFvGDB43OCyN4JCnNMA>
    <xme:qBYeae6hx2u7J5_iyTCFT5ua59BnihHQNdNz-KBsBdYVfJ934Zaj0AK03Rz-l3ZYs
    cknHU9k0BHQ5gUMxw9Xoyy9DSjzL4K4U748uTEIJ6w8hoQM>
X-ME-Received: <xmr:qBYeaTZZ9o35hUpNFGeCdyYih-tdbESlgrF5mI7dWh1izl69sKT0dNoTRpDhH77lJgGO7h3Zzjb_ZCjeydUVxQz7Q12LQesUsjsKcbAZ1f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvdehtdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduteevffdv
    keduvddulefflefhveehhefgieffudffteegvdejuefgvdejfeeftdenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhtrhhmmhdrnhgvthdplhgushdrshgsnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepmhgrrhhmrghrvghksehinhhvihhs
    ihgslhgvthhhihhnghhslhgrsgdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhessh
    hushgvrdgtohhmpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhi
    gidrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:qBYeaT6qc107i0__3y6Z9ONMsZZOqpNHUHME-EA52scxAItK6d7JqA>
    <xmx:qBYeaWDtcJ9Uw1UgoEWfH8nJ0Uvq6eJH11IvZMs9MW0bSUfj-ItYeg>
    <xmx:qBYeaZer1XDSwhJMGYUZxGOdu4yXu7FJLTJF1tN_uSXyfgxyVPssyQ>
    <xmx:qBYeaVIBkXqwfV6zJQfFf-aDBipg5AQX0GRwzdfFL851tP_aPh-D-A>
    <xmx:qRYeaZ_pOP4rjSVeNgIpnojzvWFHmWuQMqzf03M0g1aEIMANxI-CZD39>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] xen: Fix EFI buildid alignment
Date: Wed, 19 Nov 2025 20:12:31 +0100
Message-ID: <20251119191235.863187-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Old binutils get confused about .buildid overlapping (in VA space) with
earlier section. That confusion results in weird errors down the road,
like this one:

    objcopy: xen.efi: Data Directory size (1c) exceeds space left in section (8)

While the bug is fixed in later binutils version, force alignment of the
buildid to avoid overlapping and make it work with older versions too.
This can be reverted once toolchain base is raised at or above binutils
2.36.

Details at:
https://lore.kernel.org/all/3TMd7J2u5gCA8ouIG_Xfcw7s5JKMG06XsDIesEB3Fi9htUJ43Lfl057wXohlpCHcszqoCmicpIlneEDO26ZqT8QfC2Y39VxBuqD3nS1j5Q4=@trmm.net/

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Fixes: eee5909e9d1e ("x86/EFI: use less crude a way of generating the build ID")
---
While the actual bug apparently is in binutils, the commit mentioned in
Fixes: tag introduced part that triggers that bug.
---
 xen/arch/x86/xen.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 5d02f83a409c..967f9167f757 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -171,6 +171,8 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } PHDR(note) PHDR(text)
 #elif defined(BUILD_ID_EFI)
+  /* Workaround bug in binutils < 2.38 */
+  . = ALIGN(32);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
-- 
2.51.0



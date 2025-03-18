Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B05A67A4C
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919557.1323989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaNq-00075i-PT; Tue, 18 Mar 2025 17:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919557.1323989; Tue, 18 Mar 2025 17:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaNq-000734-Ls; Tue, 18 Mar 2025 17:05:42 +0000
Received: by outflank-mailman (input) for mailman id 919557;
 Tue, 18 Mar 2025 17:05:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPrW=WF=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tuaNp-0006Pm-9C
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:05:41 +0000
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30309306-041b-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:05:27 +0100 (CET)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 497362540103;
 Tue, 18 Mar 2025 13:05:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Tue, 18 Mar 2025 13:05:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Mar 2025 13:05:23 -0400 (EDT)
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
X-Inumbo-ID: 30309306-041b-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1742317526; x=1742403926; bh=K/vRlO1enD
	NjEvveV4JCXN7QZlebJcyisGWMcWmbG/Y=; b=s7pK/1mttGJfTpJupFga8zJAoi
	hf4PWUR1m4k2o+473Xi20GHQJ69ww7G88Jf+w+FNS1UZ6kHYSBBZlvFrbMdL9u1E
	fxG7Bj94xfJ2niL01FHGPAGZzM8842LvlDbSFWCf81uLwtGFRoZhHK7E95RQC9h5
	jBywye4JEtePzNumtBy1/PrMxEhhosgkR0eoYz9AJQCSS8FSm4L5erDhNodB3R/d
	SoLDQ2P6yhGr3iwHzH7DDe6z7eYtRm+ETiYrfAn6yB4bNRnDeA5GL7+gs5nhI9Lz
	HHJzKk7GY5+F3jkg8U4dbgjzbySQEial0Sbn2lcOX1oHznEUDa1MgaMNPw1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742317526; x=
	1742403926; bh=K/vRlO1enDNjEvveV4JCXN7QZlebJcyisGWMcWmbG/Y=; b=U
	+2HQgUkkDFtZHyQm7EkCuudx+U5wq76Av9DywBrmkKv/WiwRNe76dL6r6YDgb6MW
	rOlKkkas1J3xreZ15orDcxb1ZvukJW4hvD26NZLtRVN7mj3D0O5o6AgvAVf+1/vI
	wN+CWNxp7qYhxl/AVRUkoEHNnDBgGjPT1d8CM8JZhUX7VZFgORv/zJg3GkmTgfnP
	Du66hW5BXLOsvUyWVpff+QLjcVnXGPbyU0vcacbcezm8BgD5WBMsyGZBG5sAhSwE
	XSwsG+xhVvlX9eJu9aY4yh+/gyZUb7Z90FqaUQnmh61HVP6APHThr199ksb/ZJNe
	ErW+okHbySd3h16S+BcLw==
X-ME-Sender: <xms:1afZZwUnWIy0PdBSdpfL5yKZ_fBYhbBwiK7VxiNtAmuHeQkeA35I3Q>
    <xme:1afZZ0k3KYs0rGQZ1NOMaxjGz-X2_Qc5AkYrKdNc6IHBSWOA54y4S0Om7oxMwXEZI
    A7--ii7GbAg4g>
X-ME-Received: <xmr:1afZZ0Z45IQEmoAzLJkyS0wZNiOuuHumisNiOxhskwxAjmQl_ofPyPhkgTDEdCJq5jF0OHoRoyB4mmDY8PxIOcrUbPbUbDuLXcFpAzGOM-4l3Xg_j3Q>
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
    hgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdp
    rhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtg
    hpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnhdroh
    hrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:1afZZ_WFwbKkgHJPQFRc5qkl4M945Gopu5LB9CouIoU1bZIT7D7-LA>
    <xmx:1afZZ6nr3ypztMIC429DuNVcp4fqISxRpE2l5n7YAfqnY7Yug_WCUA>
    <xmx:1afZZ0fJw73SeMSp8xFVCq4xH_BkLuRGtPc7otaFn97t7jqt6-8pNg>
    <xmx:1afZZ8EOREXq6poBRgPQWpIhRQW1ODkHNb5fOTKyegYPwudiG9M-ig>
    <xmx:1qfZZze6rFtviWd4r3EiA4PnhJ6FpuNBjRwx-rzW55NXg_9P57Hh7kLY>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret=20=28fepitre=29?= <frederic.pierret@qubes-os.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 1/2] docs/xen-headers: use alphabetical sorting for @incontents
Date: Tue, 18 Mar 2025 18:01:56 +0100
Message-ID: <09f34b27d576d1067cc38eaa202aebebb0478cff.1742317309.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
References: <cover.a5cb9c3a17249fc067ab501818c3a3e6c7c229cf.1742317309.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>

It makes the build reproducible with fileordering flags

Signed-off-by: Frédéric Pierret (fepitre) <frederic.pierret@qubes-os.org>
---
 docs/xen-headers | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/xen-headers b/docs/xen-headers
index 8c434d77e20e..98ffe814500b 100755
--- a/docs/xen-headers
+++ b/docs/xen-headers
@@ -331,7 +331,7 @@ sub output_index () {
 <h2>Starting points</h2>
 <ul>
 END
-    foreach my $ic (sort { $a->{Seq} <=> $b->{Seq} or $a->{Title} cmp $b->{Title} } @incontents) {
+    foreach my $ic (sort { $a->{Href} cmp $b->{Href} } @incontents) {
         $o .= "<li><a href=\"$ic->{Href}\">$ic->{Title}</a></li>\n";
     }
     $o .= "</ul>\n";
-- 
git-series 0.9.1


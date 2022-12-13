Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4C764BF56
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461281.719372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dl1-0005fT-0X; Tue, 13 Dec 2022 22:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461281.719372; Tue, 13 Dec 2022 22:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dl0-0005d0-So; Tue, 13 Dec 2022 22:28:14 +0000
Received: by outflank-mailman (input) for mailman id 461281;
 Tue, 13 Dec 2022 22:28:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dky-000519-Sc
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:12 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cf983ca-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:12 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id CE2913200923;
 Tue, 13 Dec 2022 17:28:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Dec 2022 17:28:10 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:08 -0500 (EST)
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
X-Inumbo-ID: 6cf983ca-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970489; x=1671056889; bh=yIAGImPg9jXiK1FiJVlbgF2FFk9SjFvShth
	ylTLb5D8=; b=KSjB2hZJlroU0Tb+vsnZA6+N0osPPqAF9TkObkaWyQOhRX1ZOaw
	u1M+32wlOa1G9zRAQjXfj6M5r2K5Oz+ab8mQGg+um/vHlLH8a6symEOuZx0WEdPb
	MxIT7lmyG6KAfAti0Vin0jx2TFQsOVSSmg/ntlrmdXjNq7EYOz+VlGR8PsciJHYS
	yNx56tlEalKpZTxfU+papOHxIe8Ie6Umz72KoltgSYYkyP1jIyV8yLV7ugQbtJQ1
	2Cbn3LI7ZRPhpZmxkOIwPkUE0xm1XDVwD4BJaqqQZPUt0lPf0KqiQGY1yKgxMpdf
	b/8B7y5OrjbXJvRIXbyXBPOTN4FtL+PvSQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970489; x=1671056889; bh=yIAGImPg9jXiK
	1FiJVlbgF2FFk9SjFvShthylTLb5D8=; b=jG0EH4aZeIxs3M+AbXeLey5OfkRaJ
	tOZAdcOb4Ajw/KuEgeKQaEeERjDmLpWRFEC7BLaomI07iGvvrFT+bv+5YCb2fr9R
	a++EqLuSlnnQVSfT6mCtA5zdVwM0wNntFiIZ+mIyHtZPndkiDE2eDHJx0blTcNrn
	xqH4fdq6Ncp0Z/MDEbe94VdOrbkXxMrFLulh+91tvw1kQk3/cZGo13hI/GdW2lJ0
	VDcEXXLZhpPUKhihMJGIS0v7U7JUzT6IKbViLgrDhquROO1oJfhserq9FHKRKJOh
	EEc491PQPn6FuFD+MLz7EXK9qqc45momCEpoD1j6/sRI45zPwIZ3ccVmw==
X-ME-Sender: <xms:efyYY7gH23Egf1NFHy4c36xJgpzpqBtlO0YQLwqkAgP5t4e_xmsV0w>
    <xme:efyYY4C1xzh-8zM7P4CDMQngohxyh9J70KhPbTtlozeSZUuuPxr086Miemc86J-du
    ZSfiVP_-dfweWE>
X-ME-Received: <xmr:efyYY7GfeeNLz2zON1nZRoPWwydhmyBPj14DHKe079-v6wMbP9_OUvW6LijgD5KU64qpTISiWos5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:efyYY4RwURqhh95TQssJegrX1Ui2IW4K6GgbG2TUhci3RIIpLgp5Pg>
    <xmx:efyYY4xEt82oq6AXow3sYxRSpVu4SZEatuJTzjgcsm24rzU-LaQRuw>
    <xmx:efyYY-6TlFgZTqF6CTCT35iOcf_rtDftb_QCEtQvi_0dinRvhmJsLA>
    <xmx:efyYY3nWA6nQ8-bxvSUqcc1_nCQGW4OZO-hsrDzbkyOF5cJXoBIiXA>
Feedback-ID: iac594737:Fastmail
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH v2 02/14] p2m-pt: Avoid hard-coding Xen's PAT
Date: Tue, 13 Dec 2022 17:26:43 -0500
Message-Id: <f23de83cda04312c84c14bf475d7050d3a384650.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code much easier to understand.  No functional change
intended.  As per Andrew Cooper, the existing logic is incorrect, but
this does not make it any worse.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm/p2m-pt.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index eaba2b0fb4e6830f52b7d112fba8175dfe6d2770..cd1af33b6772ab1016e8d4c3284a6bc5d282869d 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -99,13 +99,13 @@ static unsigned long p2m_type_to_flags(const struct p2m_domain *p2m,
         return flags | P2M_BASE_FLAGS | _PAGE_RW | _PAGE_NX_BIT;
     case p2m_mmio_direct:
         if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn_x(mfn)) )
-            flags |= _PAGE_RW;
+            flags |= _PAGE_RW | _PAGE_UCM;
         else
         {
-            flags |= _PAGE_PWT;
+            flags |= _PAGE_UC;
             ASSERT(!level);
         }
-        return flags | P2M_BASE_FLAGS | _PAGE_PCD;
+        return flags | P2M_BASE_FLAGS;
     }
 }
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


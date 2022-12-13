Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C164BF59
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 23:28:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461285.719383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dl5-00063X-9h; Tue, 13 Dec 2022 22:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461285.719383; Tue, 13 Dec 2022 22:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Dl5-0005zs-6O; Tue, 13 Dec 2022 22:28:19 +0000
Received: by outflank-mailman (input) for mailman id 461285;
 Tue, 13 Dec 2022 22:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mJcE=4L=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p5Dl3-000519-TZ
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 22:28:18 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ffef484-7b35-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 23:28:17 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E1A433200583;
 Tue, 13 Dec 2022 17:28:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 13 Dec 2022 17:28:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Dec 2022 17:28:13 -0500 (EST)
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
X-Inumbo-ID: 6ffef484-7b35-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1670970494; x=1671056894; bh=6JSEczb+hySbpeqafqNiYdIAHff3k1hBHf0
	cIR9cHpE=; b=mmBngvgYaONW/Xbk1NLfWrxKF0qOj2wvOFA0QZZ/99KCpMEOZLz
	/vkCvYL8b3Howh8dNvMvXa4PTA6OJ+kCGkZFxuO6euDudSj9jJ0v0EQCRfBWuKwO
	fL+GRa7XiUyKmT1fan38U9MbH2rJAevy6ZH0Sy0CPzfMmdCkmNLZPwB5TMzMTDnu
	ZiEq/QVCOiL9VFMjXpBpGsJKf4lFUOOKpistJKoi1gpWBRanA9SlK00AUMF2xe51
	2opITt61Q3E5WeGVJzVKda/M6ijhup0iJ4iUyIpGzQkVZJYl2pk4d84QoEvdYUck
	jvcejkdX58EmOMxzg32vNLTwpmOs1KaG9rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670970494; x=1671056894; bh=6JSEczb+hySbp
	eqafqNiYdIAHff3k1hBHf0cIR9cHpE=; b=Bvme0P/8kG0Dt8thxMyS04mgHp7M8
	c84gkmZ4zk66VBVuPw1FcGp14vHHAmZBy0/BeaQZ6b5mkIwAF4fecHfgTMqso+T1
	mVhIWtdZBXvsKU9uEJcsxNeLga/82g/jGLpSERhdrOH66/LbF1tuD7N66s6ENSlK
	EXzyTeI83wHOt8UxEZLLorC/271XgGaUSyp0uuXAVvX5c98W7UIZYbapGZszZ1Hr
	+TK24kS2dnHjNZiF6IC7dyUBuPqtCg+N13X7l5f+coPQZhC2HP/w2vJxM75PkKkv
	Ho51YCHICofy+cQA3zaFtDJAXYFWv82JrJuj2R8nylb9uXJmUdoRDBXGQ==
X-ME-Sender: <xms:fvyYYxcYMvJ6ZBx6VNNlPzSVfSJFfmVtQstacKnxfNxRmKcMqZYHZA>
    <xme:fvyYY_MHI5C0rhK7XdL1Dwa7n5lfUhbxbGpg0Ts24C8Z50Bd0047ySK0Lgxk73A1s
    OEHSbrQZBqt3_I>
X-ME-Received: <xmr:fvyYY6gMc92SIk0HL6L8_bcQ4j00MbryEn6yBdxVhSjSYBh0HAHOi7tLW0sYg6D2ToIquMUR61Qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefghefg
    hffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:fvyYY6-_Hkc3-i0waVj3dQEz3ADETz5jvQ7eidd69CloeqpzAdF1Bw>
    <xmx:fvyYY9ub5psz8nx01SWNZ2UDSKPXeGvl0jbjeAsy-hGn5VqEZ9UuLQ>
    <xmx:fvyYY5G6Aaop8gfuMXiVBAv9DfJU91kP1tSTh-vTkMUcgZop3jK4OQ>
    <xmx:fvyYYzBvHhQSN16wLKrdTQUUZ9hgp-fiJ6WXzgretoZKqdNje-_kew>
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
Subject: [PATCH v2 03/14] x86/mm/shadow: avoid assuming a specific Xen PAT
Date: Tue, 13 Dec 2022 17:26:44 -0500
Message-Id: <44c46e9512017eea43bea64aecf534ac6ac818f7.1670948141.git.demi@invisiblethingslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code easier to understand and more robust if Xen's PAT
ever changes.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 xen/arch/x86/mm/shadow/multi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 2370b3060285fee895f335f2a82d3d22ca5d31ed..4e94fec3d50cde0e5a26ecb62ff4d00dd00f759d 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -629,8 +629,8 @@ _sh_propagate(struct vcpu *v,
     else if ( p2mt == p2m_mmio_direct &&
               rangeset_contains_singleton(mmio_ro_ranges, mfn_x(target_mfn)) )
     {
-        sflags &= ~(_PAGE_RW | _PAGE_PAT);
-        sflags |= _PAGE_PCD | _PAGE_PWT;
+        sflags &= ~(_PAGE_RW | PAGE_CACHE_ATTRS);
+        sflags |= _PAGE_UC;
     }
 
     // protect guest page tables
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab


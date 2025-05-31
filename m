Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA96AC988E
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001668.1381795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9iB-0006fo-BV; Sat, 31 May 2025 00:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001668.1381795; Sat, 31 May 2025 00:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL9iB-0006dP-8n; Sat, 31 May 2025 00:04:31 +0000
Received: by outflank-mailman (input) for mailman id 1001668;
 Sat, 31 May 2025 00:04:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nViP=YP=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL9i8-0006dJ-UL
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:04:29 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0d5ea25-3db2-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:04:26 +0200 (CEST)
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
X-Inumbo-ID: d0d5ea25-3db2-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748649865; x=1748909065;
	bh=P0KFPXRNFha4C1g1/gQvujKgHbaoPQkoWI2mThU2DxU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=KIlvTV94IptGK8ZFb+yJyEQad1OInERune9k4HDk1zjxx+EksFunD9uKn2PPHNZec
	 VBDtWaIki95Wx8Z3oH077Jy6iWO999SUgQ/04fgo7SLSiknpFejpojIG9oSpboL0Lq
	 7wcYLRjiK4mOe/avB9MhAWZW/8AZzRKdonGlNIUefug/xxdBAdKc2acRewR9Ro/4Lc
	 giLjoL9stL8N7oLHJMRcE3Kn406X4pMXMX7O4QQFWaxigCcYVJgiUjEA5Hr90iFuJY
	 IBe6+mbRRGQJzqXz0GWjA3/kmqAh5KexN9ZKAS5DT6iVbFBzLSVOBrVxnb1GABLXKH
	 i1P8jnVX5fTGA==
Date: Sat, 31 May 2025 00:04:22 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 0/2] xen/console: updates to diagnostic messages prefixes
Message-ID: <20250531000417.81750-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6370cce680691c3356ef66ddd19cff5dcbaf3a96
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 is purely cosmetic change, adds a symbol for hypervisor's messages.

Patch 2 updates the logic how the domain prefix is formed.

[1] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1845446760

Denis Mukhin (2):
  xen/console: introduce CONSOLE_PREFIX
  xen/console: unify printout behavior for UART emulators

 xen/arch/arm/vpl011.c      |  6 +++---
 xen/arch/arm/vuart.c       |  2 +-
 xen/arch/x86/hvm/hvm.c     |  2 +-
 xen/drivers/char/console.c | 32 +++++++++++++++++++++++++++-----
 4 files changed, 32 insertions(+), 10 deletions(-)

--=20
2.34.1




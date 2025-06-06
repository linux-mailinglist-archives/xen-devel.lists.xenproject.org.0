Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116DAAD08F8
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:11:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008811.1387975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdPP-0008P3-Hk; Fri, 06 Jun 2025 20:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008811.1387975; Fri, 06 Jun 2025 20:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdPP-0008NO-EW; Fri, 06 Jun 2025 20:11:23 +0000
Received: by outflank-mailman (input) for mailman id 1008811;
 Fri, 06 Jun 2025 20:11:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNdPM-0008NH-9b
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 20:11:21 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 673db203-4312-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 22:11:17 +0200 (CEST)
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
X-Inumbo-ID: 673db203-4312-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749240675; x=1749499875;
	bh=Lp5h+FAjm96E/U9mx+er7ay1xqPjAsWEpNjB2aWoz0w=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=lhqE34pEL5bZKydIo6keS7n88huBrluHONcspfGiyTl2oWGQ6tCCBqfSvJ8wxzC9B
	 XTmMRDq+iJVKajpnavL6rDpUAzKuqMPpNwALvB7xoTMBntwkiz45Xf2Fw4lasuJkC1
	 OO1Vg4bsDv+M3g37ualJW8FrrtpO67kQekJHFPrNxBE0OrtG8qhqILyatamAx9cytj
	 bA8KP3XA+360ONBUAYkfRMuaGRXxDbPmplVHzWXYLphXajcgbqOqoiNzIS06INCsEV
	 kDHHillJOZJyx0Ap94depQSH3Xo5/e9SPGdi/nmqz5zolpLBCWnQpDomlukvFnipcs
	 iVQGbvsieQSVQ==
Date: Fri, 06 Jun 2025 20:11:08 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 0/2] xen/console: updates to diagnostic messages prefixes
Message-ID: <20250606201102.2414022-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 08c35cdaee586a798b484ebc1549e5acb79253c3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Patch 1 is purely cosmetic change, adds a symbol for hypervisor's messages.

Patch 2 updates the logic how the domain prefix is formed for guest message=
s
sent over emulated UART.

[1] Link to v2: https://lore.kernel.org/xen-devel/20250605004601.1142090-1-=
dmukhin@ford.com/
[2] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1857923457

Denis Mukhin (2):
  xen/console: introduce CONSOLE_PREFIX
  xen/console: unify printout behavior for UART emulators

 xen/arch/arm/vpl011.c      |  6 +++---
 xen/arch/arm/vuart.c       |  2 +-
 xen/drivers/char/console.c | 30 ++++++++++++++++++++++++++----
 3 files changed, 30 insertions(+), 8 deletions(-)

--=20
2.34.1




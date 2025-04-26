Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6ADA9DCCB
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 20:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969282.1358441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kbu-0001dJ-1y; Sat, 26 Apr 2025 18:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969282.1358441; Sat, 26 Apr 2025 18:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kbt-0001aE-UP; Sat, 26 Apr 2025 18:50:45 +0000
Received: by outflank-mailman (input) for mailman id 969282;
 Sat, 26 Apr 2025 18:50:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8kbq-0001Xu-Fs
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 18:50:43 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58f52527-22cf-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 20:50:39 +0200 (CEST)
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
X-Inumbo-ID: 58f52527-22cf-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=eolfxri6h5cgdmjjvu67ry5lza.protonmail; t=1745693438; x=1745952638;
	bh=F15iZ35Qsjq2yg30u+SCY3vhRM+l1pt9zebJ9BbQoZ8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=R6q9dYcdFFW06bvc3Tyv258caOmHlUodpXTel/pqrzOTkEhGgs7Ug2dsWD47gL5VY
	 RX5C95HJjxgGpLQIplJIEMz5eFNcvYrXxu07pstf6oi5yl2mmlbc+7JfODvN7e+p3c
	 mLDlqH3lAeiLbkUm12tUs8ICYIENrQ3SbaSboAjCJ+h4XQhhoMpEEp1gXXR7cwxNB8
	 qpV+5mkfYgzy+apiZwNmqr4rq/fDFqjCgweWWT4Qv8zOPZmnbZd1m7JWVJmkCdno1V
	 u8cN1yqzFXcQj8F8xyLLU/t1OuQzxd+RGyp2aJQ4Xx0XCaoJ8jou+lXBR9L9mm93Lv
	 PT6iL5DlfaEiA==
Date: Sat, 26 Apr 2025 18:50:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 0/3] xen/console: few cleanups in console driver
Message-ID: <20250426185021.100646-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 7c987f9fde5f03d7e86c39b1cb5053dab23618e2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The patch series introduces a few cleanups aimed at reducing code duplicati=
on
in the console driver.

Originally, patches 2 and 3 were part of NS16550 emulator v3 series [1].

Patch 1 removes some code duplication for logging via conring facility.

Patch 2 (see [2]) removes code duplication between __putstr() and the rest =
of
the driver. It also introduces private flags to select console devices for
printout which simplifies some code paths.

Patch 3 (see [3]) adds conring_flush() to send contents of conring to all
currently available console devices.

[1] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-0-c5d36b3=
1d66c@ford.com/
[2] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-16-c5d36b=
31d66c@ford.com/
[3] https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-17-c5d36b=
31d66c@ford.com/
[4] Link to v1: https://lore.kernel.org/xen-devel/20250403000604.169619-1-d=
mukhin@ford.com/
[5] Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelin=
es/1787672882

Denis Mukhin (3):
  xen/console: cleanup conring management
  xen/console: introduce console_puts()
  xen/console: introduce conring_flush()

 xen/drivers/char/console.c | 177 ++++++++++++++++++++++---------------
 1 file changed, 106 insertions(+), 71 deletions(-)

--=20
2.34.1




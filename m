Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA3651B49F
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321227.542172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPGp-0004aY-0j; Thu, 05 May 2022 00:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321227.542172; Thu, 05 May 2022 00:23:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPGo-0004XM-TY; Thu, 05 May 2022 00:23:02 +0000
Received: by outflank-mailman (input) for mailman id 321227;
 Thu, 05 May 2022 00:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPGn-0004XG-KL
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:23:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84e02bce-cc09-11ec-8fc4-03012f2f19d4;
 Thu, 05 May 2022 02:23:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C9BF61D44;
 Thu,  5 May 2022 00:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF7DC385A5;
 Thu,  5 May 2022 00:22:58 +0000 (UTC)
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
X-Inumbo-ID: 84e02bce-cc09-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651710178;
	bh=U4s8K8JX60MK1mxVftNipKeg5x2+caAQ29BNBAA5GYI=;
	h=Date:From:To:cc:Subject:From;
	b=fi4dbKRA3J16t17yLEvfa2T2sL3n6bzADOIwKYxw3mOhEw6xqDj/ICkHuYDobfI0f
	 hH068OeiTbH6tQv/tdFy4ud89Gf4eTGnS/FiJ/KyhELM5mjubbAovtO+2ptKUuh7LE
	 wjAQArVTnAk2I5TpDmCJnoAOXGkQeDH94Rzbq7b2W0zG/eV/8kH+KL67lKYpZXgO46
	 e5J+jnQvfYxpbpg5vnP99IxKZmZi6CnjluSvWBWLqSiMoTyWVyOc5ErXXlP4qmvFuI
	 g5X5nRrCXSS1ZbcgKhDqOfkL815Ye7LUh5rbrCKqdlOixka669uf8R451V2GK+QMTF
	 6fAn9fv1oyjbg==
Date: Wed, 4 May 2022 17:22:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: boris.ostrovsky@oracle.com, jgross@suse.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH LINUX 0/2] dom0less + PV drivers
Message-ID: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small Linux patch series implements support for initializing
xenstore later, if not immediately available at boot time. It enables
dom0less + PV drivers support.


Luca Miccio (1):
      xen: add support for initializing xenstore later as HVM domain

Stefano Stabellini (1):
      xen: sync xs_wire.h header with upstream xen

 drivers/xen/xenbus/xenbus_probe.c  | 91 +++++++++++++++++++++++++++++---------
 include/xen/interface/io/xs_wire.h | 34 ++++++++++++--
 2 files changed, 102 insertions(+), 23 deletions(-)


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB548CFFB
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 02:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256958.441287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oaL-0007fh-Um; Thu, 13 Jan 2022 01:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256958.441287; Thu, 13 Jan 2022 01:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oaL-0007dq-RX; Thu, 13 Jan 2022 01:07:25 +0000
Received: by outflank-mailman (input) for mailman id 256958;
 Thu, 13 Jan 2022 01:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oTA-0000Zm-0l
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 01:00:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21804e64-740c-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 01:59:59 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA5D0B82184;
 Thu, 13 Jan 2022 00:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CF7C36AE9;
 Thu, 13 Jan 2022 00:59:57 +0000 (UTC)
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
X-Inumbo-ID: 21804e64-740c-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035597;
	bh=MRfMCuCLQoYh6RcY6YpMONA0mg03CHCpmuPnmiW2Njk=;
	h=Date:From:To:cc:Subject:From;
	b=WnZk7wsOBjzx2HxbQDXEB9mnb9umyt6QBlOcoIkNLln7oo/qp/HjWc7KCPDVn6ndT
	 L0auZ5KKWqfbOSxXPmRuJ0UFal7eUXE9JD1gvkbimhH11io/pdCYuistN6M0uIUhG4
	 nVe/4n/AKReEDFMKoUBZ5/DftiNznGwtovC6+jJnJVUhylanyJBzhJmn82JnreZ6aT
	 bAWHjXdxvqlUEau6r/NTjfMf8cHv1LAatXOFzJPMWf7pb+xRxzeLekeA6/30HSdz3g
	 ojICsEfvR1poSdFgM53qDZqDOf+1Kt7wxEe6mQAqR0vVeg2KNwUSozIyRj54zo/KEZ
	 l8yAonXf5rApA==
Date: Wed, 12 Jan 2022 16:59:57 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jgross@suse.com
cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org
Subject: [LINUX PATCH v2 0/1] late xenstore initialization 
Message-ID: <alpine.DEB.2.22.394.2201121647460.19362@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This small patch series for Linux implements support for initializing
xenstore later when booting as Dom0less kernel (HVM guest on ARM). With
this small patch series applied, it is possible to use PV drivers in
Linux when Linux is booted as dom0less kernel.

Cheers,

Stefano

Luca Miccio (1):
      xen: add support for initializing xenstore later as HVM domain

 drivers/xen/xenbus/xenbus_probe.c | 80 +++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 19 deletions(-)


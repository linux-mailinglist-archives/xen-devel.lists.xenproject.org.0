Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6D526C40
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328852.552011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcgn-0002jp-6e; Fri, 13 May 2022 21:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328852.552011; Fri, 13 May 2022 21:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npcgn-0002hG-3P; Fri, 13 May 2022 21:19:09 +0000
Received: by outflank-mailman (input) for mailman id 328852;
 Fri, 13 May 2022 21:19:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npcgl-0002hA-Lr
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:19:07 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 521fdb24-d302-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 23:19:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D04DAB83132;
 Fri, 13 May 2022 21:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D350C34113;
 Fri, 13 May 2022 21:19:04 +0000 (UTC)
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
X-Inumbo-ID: 521fdb24-d302-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476744;
	bh=7YTs/zuZbfJI3WWts99XEzjKJSNx8kLEj6VW19kCNqw=;
	h=Date:From:To:cc:Subject:From;
	b=Ut7MeEQTFp76bWMEt1AKGVHzWMvqjvm+8LY4NnMb9oMod94C5+9d564t2tqCPNp4Y
	 H4M/EwyrgScTbKZzaXXF1pBpKOoWOlHAMJaiA+IrEnAN8T15blx9l+gF9B+jxGov4S
	 afl6yjP92ULbuJDCJ7boFMH4VnFNwM/FJplBS6ACLHbAxsWiNj5mTPBf2Zd5bNcady
	 7HxnJfzg8ZXaKqex6QNMRI8aWuhbFT8xLRE5qrkYBzhn2dat9YBuVh30EsTMFhHiA1
	 MXR0IvBjxCq98VUve/45CU9UEozpJ4GohWDRxmxR2E7PxjS3CKpQQmH8hrnCfBe4e6
	 e2SbcTvHB9mKA==
Date: Fri, 13 May 2022 14:19:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: boris.ostrovsky@oracle.com, jgross@suse.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: [PATCH LINUX v5 0/2] dom0less + PV drivers
Message-ID: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
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
 include/xen/interface/io/xs_wire.h | 37 ++++++++++++++--
 2 files changed, 104 insertions(+), 24 deletions(-)


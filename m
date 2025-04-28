Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CDCA9FCFE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 00:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971230.1359701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Wog-0000JY-TT; Mon, 28 Apr 2025 22:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971230.1359701; Mon, 28 Apr 2025 22:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Wog-0000GQ-Pq; Mon, 28 Apr 2025 22:19:10 +0000
Received: by outflank-mailman (input) for mailman id 971230;
 Mon, 28 Apr 2025 22:19:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9Wof-0000GK-Ae
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 22:19:09 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccc7b453-247e-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 00:19:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9EBE3A4B81E;
 Mon, 28 Apr 2025 22:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20138C4CEE4;
 Mon, 28 Apr 2025 22:19:05 +0000 (UTC)
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
X-Inumbo-ID: ccc7b453-247e-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745878746;
	bh=opO4jp48O5uNHfVcbX4oUeAEz+raeEudFiS8ybjk8bk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YEku2TpEc4rVbSAWz22fM5Fpm0+AtwLyHnnYXVBU9qSLUpLvlLdjRaZ/uWKgvUkLl
	 652NGpb5yFzN5vPQWeW0eCt9pCYf2Gll9DUfvQ+LD1MLrckAgEL3ZVvHwxS3+stncD
	 vS6mtFicysV4Nr3+be1vgixJzEA0nzE2zhcVSw42fbHJ8PHN21UuSVbupHBpIuuWRM
	 CbfSO8Ek9scwIeKaHZxIIXvXGROdOfiX22YGL3sFAmBR3d6bK4RsTmlHG9AacfmLeq
	 +dxVqaT8+eGUXuA/zT4ZQU8nqtCkAPZI8fF+er/OFJa7a37UehM4PgFptm5ebSj8+Y
	 pi7SltVBL+jSA==
Date: Mon, 28 Apr 2025 15:19:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, dmukhin@ford.com, 
    Michal Orzel <michal.orzel@amd.com>, jason.andryuk@amd.com, 
    "S32@nxp.com" <S32@nxp.com>
Subject: Re: [PATCH v8] uboot-script-gen: Dynamically compute addr and size
 when loading binaries
In-Reply-To: <f4cbcb7a-cc60-40f6-84dd-96d0d7d008ea@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2504281518580.785180@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504281312280.785180@ubuntu-linux-20-04-desktop> <PA4PR04MB956574A1DD21388CB1632481F9812@PA4PR04MB9565.eurprd04.prod.outlook.com> <f4cbcb7a-cc60-40f6-84dd-96d0d7d008ea@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Andrei Cherechesu wrote:
> Everything looks good to me, briefly tested it locally as well.

Thank you! Committed.


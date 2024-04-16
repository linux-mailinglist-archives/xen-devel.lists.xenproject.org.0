Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDF98A6650
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 10:41:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706747.1104101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweN0-0002nf-AS; Tue, 16 Apr 2024 08:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706747.1104101; Tue, 16 Apr 2024 08:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rweN0-0002lG-7u; Tue, 16 Apr 2024 08:40:50 +0000
Received: by outflank-mailman (input) for mailman id 706747;
 Tue, 16 Apr 2024 08:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AiXa=LV=bounce.vates.tech=bounce-md_30504962.661e398c.v1-d48cc00ce8c44aadafc4a9a5b1d0f643@srs-se1.protection.inumbo.net>)
 id 1rweMy-0002lA-88
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 08:40:48 +0000
Received: from mail145-16.atl61.mandrillapp.com
 (mail145-16.atl61.mandrillapp.com [198.2.145.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04991b1a-fbcd-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 10:40:46 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-16.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VJcv05gXLz8XRtlK
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 08:40:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d48cc00ce8c44aadafc4a9a5b1d0f643; Tue, 16 Apr 2024 08:40:44 +0000
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
X-Inumbo-ID: 04991b1a-fbcd-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713256844; x=1713517344;
	bh=pjEjfv9riQAIjJjPevFt35FKNT3qD3QODRtVHVYVp2s=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eP18DqWd58rvmfU7YllhlC/JG/wR42cHcStgW1FSNyL9PYpldamhJsZNaQ4URx21q
	 5ySnZ9qU7IjJqdbxwNbxEII4XwN9FrmV1g0xY+axkvZXFNHxyRpx0zYWSWmBT19fsi
	 /uoeGzaYP1tGoNgGfoxL6uymSJRoA8buQFXhqMQNHMSuezmgUq399gzqgaZ+NjmZXB
	 8fYIcZkL06sN7TKZHPtA9ETl05kro3z53v9vbMRtBYJclZhB3fD0GMN074Gjvv6/ie
	 X+roeCiwMGup9Ez8V2SH5+zJMeAcWlKdTxafBuHpNBIUy2WehwSmOVDU37Dh8vi+6n
	 hRQXi2Fs6e4rA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713256844; x=1713517344; i=teddy.astie@vates.tech;
	bh=pjEjfv9riQAIjJjPevFt35FKNT3qD3QODRtVHVYVp2s=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XTau+piv3L83ocq9clXm8va01HT2hMUcYo8jWwD+pavdiZRX3oWkKlhk4tp8Rz6dc
	 Yw6VpVM0l/zGhcyAeuCgqykTKNRwiqTXPVbKuDBZyJLrO4r7azEnKKzMsgedWbwiJt
	 mzGPx3JFguyjrrSJgPXPmbYYJZpCOdgyHh2WxdFBspYAlgTJ2WFDvE+v/EWLko9u+A
	 khMdrELcYDzI9e/dlHVn8vaD1rmY64Ko12n6UCbLYOebneV0csMTp0fpLclYBZcMN0
	 NPEurPs2O/U3xzZ1RW7f+tTgYwCRiDMM2EnuDUdPE94mpy8pDBCHKIqdahHu0hdERR
	 tU+3c9Gd+cUOw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v1=2015/15]=20x86/hvm:=20make=20AMD-V=20and=20Intel=20VT-x=20support=20configurable?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713256843068
Message-Id: <2a6779ba-e3d7-4f53-8a0c-404f139ba254@vates.tech>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240416065012.3470263-1-Sergiy_Kibrik@epam.com>
In-Reply-To: <20240416065012.3470263-1-Sergiy_Kibrik@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d48cc00ce8c44aadafc4a9a5b1d0f643?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240416:md
Date: Tue, 16 Apr 2024 08:40:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Sergiy,

> Also make INTEL_IOMMU/AMD_IOMMU options dependant on VMX/SVM options.

The discussion in the RFC series stated the IOMMU may be used with PV 
guests, and doesn't rely on VMX/SVM support (in fact, it can be used 
without HVM support in Xen).

However, in the discussion, posted interrupts were supposed to be 
dependent on VMX/SVM instead. I suppose this is a leftover from the 
original RFC ?

> https://lore.kernel.org/xen-devel/e29e375f-3d30-0eb1-7e28-b93f2d831b43@suse.com/

Teddy

---


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


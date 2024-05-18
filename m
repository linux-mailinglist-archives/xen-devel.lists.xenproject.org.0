Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB868C8F05
	for <lists+xen-devel@lfdr.de>; Sat, 18 May 2024 03:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724551.1129809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88YJ-0004Td-Ef; Sat, 18 May 2024 01:07:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724551.1129809; Sat, 18 May 2024 01:07:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s88YJ-0004Qw-C7; Sat, 18 May 2024 01:07:59 +0000
Received: by outflank-mailman (input) for mailman id 724551;
 Sat, 18 May 2024 01:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=clH7=MV=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1s88YH-0004Qq-Nl
 for xen-devel@lists.xenproject.org; Sat, 18 May 2024 01:07:57 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e06a6e8-14b3-11ef-909e-e314d9c70b13;
 Sat, 18 May 2024 03:07:55 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715994470841306.1623133554082;
 Fri, 17 May 2024 18:07:50 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-de5b1e6beceso861053276.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 18:07:50 -0700 (PDT)
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
X-Inumbo-ID: 0e06a6e8-14b3-11ef-909e-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1715994473; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=StgLXpea2Vwb99hH4wGwDDfXJQ/KprFl2VvfawaP4pvsbgxHL4SGTntaTlOlLLGf0f4ieMsLm27RrBEKovcPMM7MjUW9WNecDFW3uQkuc3DpshF9aC5qOX8kg/ghl36ZlPMFldymtf8L0yIgx1E4wRJ37mQ9mh3a3TMFd9pDHUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715994473; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xkR8+wmKEUf0ZWHZQWY59zOICyXkQMKCcMF/DSMIUx8=; 
	b=avSXi+xLyrW7h2mANVpuAiLcJ+i0QTXP1ufBtHEusYkcHBfMJL622gbtrx6zDbKFL9ZTsFtwcHumUbqjKEZe5Z+cNgW4n+2dm8mRWupIcQwIMO4Ia7GYjhr4s2Fmm2rUx6inBjwGOd6xqipIekakBcjk6hLiBHZtISIIJ5sxnPs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715994473;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Message-Id:Reply-To;
	bh=xkR8+wmKEUf0ZWHZQWY59zOICyXkQMKCcMF/DSMIUx8=;
	b=f6Mczlx3pc0MsnsOKLnXmpCfYuvj8H9hvet6nWT7IO2ARJ/QLlcVTL4Neazy7PDH
	9svhtJx8HuG9wbFCsAFk3s9o+s2cYhvy1HNhRF81jor9JGrL2D30U5BSB7ahjMq8MjJ
	NfYrxq9r4ddS9ktjuRqXJSPaDS1hP1B1z0g3Vxd8=
X-Gm-Message-State: AOJu0YxZcbQQaz1KA5abHvMfYWfF3OtQJBl1+buJXfVirCsr9dK2i3x4
	Lt2U2FdFrdYX1rOlfteFQk92oT2D55Bu0NAKhfsJ18VA5OE8uZAb8UfW4aM8Fucj2M93CEx334s
	ToCoE515oH9X2fhdghQkdvvbQN1U=
X-Google-Smtp-Source: AGHT+IEbOH6FPRcVpXlX5Kaqv5pt/u50WWfytF6UNtO9dMJVzZqae7DlEA/ICyj/fw7jYdBlWxxQvgbMtfGWKudxNUY=
X-Received: by 2002:a25:c791:0:b0:de5:53c0:b9e5 with SMTP id
 3f1490d57ef6-dee4f4b9abdmr23902838276.40.1715994469859; Fri, 17 May 2024
 18:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
In-Reply-To: <14a8c523b24c87959941e905bd60933a91144bc7.1715761386.git.Sergiy_Kibrik@epam.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 17 May 2024 21:07:13 -0400
X-Gmail-Original-Message-ID: <CABfawhkFG5waaP8A9KTtOT1nn4GS74Oi+yRBK-+YtagDLTbNJA@mail.gmail.com>
Message-ID: <CABfawhkFG5waaP8A9KTtOT1nn4GS74Oi+yRBK-+YtagDLTbNJA@mail.gmail.com>
Subject: Re: [XEN PATCH v2 05/15] x86: introduce CONFIG_ALTP2M Kconfig option
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Content-Type: text/plain; charset="UTF-8"

> Currently altp2m support provided for VT-d only, so option is dependant on VMX.

No clue what is meant by "support provided for VT-d only". Altp2m has
nothing to do with VT-d. It would be more accurate to say it's only
implemented for Intel EPT.

Tamas


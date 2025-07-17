Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B487B08E73
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:43:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046914.1417315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOtF-0000tI-C6; Thu, 17 Jul 2025 13:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046914.1417315; Thu, 17 Jul 2025 13:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOtF-0000rq-98; Thu, 17 Jul 2025 13:43:13 +0000
Received: by outflank-mailman (input) for mailman id 1046914;
 Thu, 17 Jul 2025 13:43:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNUQ=Z6=canonical.com=nick.rosbrook@srs-se1.protection.inumbo.net>)
 id 1ucOtD-0000rk-Jm
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:43:11 +0000
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f98a9a57-6313-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 15:43:09 +0200 (CEST)
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B857D3F69A
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 13:43:08 +0000 (UTC)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-886f7f4e6ecso123483241.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 06:43:08 -0700 (PDT)
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
X-Inumbo-ID: f98a9a57-6313-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1752759788;
	bh=TayNLm7Mp9a3JvzCNr3FZDdDO12VyShqDEyGTMDU8Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=W6t8NderpndQ29EFZ7dnCqJACMF2kSwM2tgfcjm+/W3TLPiFZCcrGAKEheOiBEIDg
	 5yglrbmghiyKmox7CcWqvyO75qu/LMlRCd24+AwqUWx/CbuXezaOlP3ntNzEr8GoXI
	 WyjtW+e58BeAd1TXU+S0lSaG5ShNEN6NtZBDwiUDwyWKXNh+BUIE8NU30DrhLd00xl
	 lAVInSN9XzWmoO0UScHtBf6DAaR7iFKXlnrjIdrVb1UfZWQeWiZMGIuyFghfeP/CAf
	 XojSzMHUMWG8unCha28p31gbYNL/wsGtMwAeGYIhaRT1uH4C91uV44icbVwI8pTilr
	 nEs9av6aHeLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752759788; x=1753364588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TayNLm7Mp9a3JvzCNr3FZDdDO12VyShqDEyGTMDU8Ec=;
        b=xH4+QfMw/lRgvXmSjHbNDVOXrYuufZ1w455ZbXaX9i40RZNpTP69bhpOadIJxkYrFL
         8XYJy1ZoDAbdiXPv4op+YCxBj+6AmpvyKQLaJiVPCJgRFLx+ZOumMazN1GXt+ChxqGva
         D6nJEdrkF90jBnNZnjQM4uWI8nxHAWWKoMnbziEOgs3sR2i2LdVcf8yiXet4yUsYddX5
         Ilhs+luyKmI2E/SE1+SUM/a0O4wIaZ4RCXOCZgplo0Kk8khkha4ZSaSvazEp/RLbARn5
         4d5n6Eu2QRJHASU4CMMFinJyuW20NGDLldPFQd/98clSo+F20lKkIlht2B9CBHhAI5/I
         rNqg==
X-Gm-Message-State: AOJu0YwClY7+pIU9DG9v4UMxDWLkWsduOrmgNdzsoOXjCGd39l2m/63N
	rLeRVEU8G0Aqx7TAOPwyEnQyjAsgOPZxxhMsTqKk62BydHO+M+liJxhchXNSmvn6MGTHXDi5qJw
	aNySOWcdO85ikuOnJ8UK/CjAXOGCkoAinYwoTBhuhLenTFHIjcK8157HLIC1l6hU31Isas9Z1Z+
	smc786wU2uZ92lr26Qluc5U1T0YbuRWVXHIPraFVOCvavK7MVfcNxmIKdeZM7BNpjAgdzYOA==
X-Gm-Gg: ASbGnctmchdEt002taaw86uPtI8yA1Xdn/b1vzWQodyJRxJQxkic7kXS8Nev4GoxdRQ
	MKJIZYw0qTx9tuakF8YG76cdGX5qknBR+RprBTp/HkPF+ysrZf0O4sK68FpsEiAVqc7ywDrT4gw
	nod6LswYwjyJ+RgXcWljc=
X-Received: by 2002:a05:6102:510d:b0:4e7:bf30:da62 with SMTP id ada2fe7eead31-4f9980fadb7mr1338614137.17.1752759787460;
        Thu, 17 Jul 2025 06:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0xRxSFpifoK17+tFwhOQeC4g53JId+3gaR3FJvCvSozrtgMMI70mikVlACt5TtZ8M9ZziERBht+evn7ScWUM=
X-Received: by 2002:a05:6102:510d:b0:4e7:bf30:da62 with SMTP id
 ada2fe7eead31-4f9980fadb7mr1338602137.17.1752759786971; Thu, 17 Jul 2025
 06:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1752691429.git.w1benny@gmail.com> <c291e2e56c598df8c328e76f237699084b2dd593.1752691429.git.w1benny@gmail.com>
In-Reply-To: <c291e2e56c598df8c328e76f237699084b2dd593.1752691429.git.w1benny@gmail.com>
From: Nick Rosbrook <nick.rosbrook@canonical.com>
Date: Thu, 17 Jul 2025 09:42:55 -0400
X-Gm-Features: Ac12FXw2rxt9dfNWQb9QK8-vvPwhKeZ2B7xNPDIAN_H8mClo8HmJOfIY25Q2BvY
Message-ID: <CAEN5XSGvAWfiyOw=hGjj=nnoyZP96tyFdmC7DV2ZDMyOOXd0MQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/9] tools/xl: Add altp2m_count parameter
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: xen-devel@lists.xenproject.org, Nick Rosbrook <enr0n@ubuntu.com>, 
	George Dunlap <gwd@xenproject.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 4:19=E2=80=AFPM Petr Bene=C5=A1 <w1benny@gmail.com>=
 wrote:
>
> From: Petr Bene=C5=A1 <w1benny@gmail.com>
>
> Introduce a new altp2m_count parameter to control the maximum number of a=
ltp2m
> views a domain can use. By default, if altp2m_count is unspecified and al=
tp2m
> is enabled, the value is set to 10, reflecting the legacy behavior.
>
> This change is preparatory; it establishes the groundwork for the feature=
 but
> does not activate it.
>
> Signed-off-by: Petr Bene=C5=A1 <w1benny@gmail.com>
> ---
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  7 +++++++
>  tools/libs/light/libxl_create.c      | 10 ++++++++++
>  tools/libs/light/libxl_internal.h    |  1 +
>  tools/libs/light/libxl_types.idl     |  1 +
>  tools/xl/xl_parse.c                  |  9 +++++++++
>  7 files changed, 31 insertions(+)
>
For the tools/golang changes,

Acked-by: Nick Rosbrook <enr0n@ubuntu.com>


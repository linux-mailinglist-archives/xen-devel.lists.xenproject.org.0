Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F251AD4A96
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 07:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011317.1389695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPER0-0007zE-Fm; Wed, 11 Jun 2025 05:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011317.1389695; Wed, 11 Jun 2025 05:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPER0-0007wh-Ck; Wed, 11 Jun 2025 05:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1011317;
 Wed, 11 Jun 2025 05:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EZyg=Y2=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uPEQy-0007wa-AJ
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 05:55:36 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b13932be-4688-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 07:55:35 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5535652f42cso6389931e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 22:55:35 -0700 (PDT)
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
X-Inumbo-ID: b13932be-4688-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749621335; x=1750226135; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEull6Y2dKdn7HXksCZ+pxPpbHPUoR6qac/gwemfvgY=;
        b=gf6weRgnB+Eia3sioFts/u6ZpzoKySHOI8+eFrrl8KqS1aUiFhlu9uwYRrWERUYIcB
         Mg+Wwew8jCL2qbtI2IjDaKBk4evrtKd08F2rWjhBgPvX+JORBdx969/5sIEGj2XPto3a
         MRFyTYw67+4et3XuEMUj/kCr0WjGla3udqHKXC8BFqVN66e8g3Y3MxRAqqeo7mHAnV/d
         CXisdeCdWo5/l5Lgvh4PsTU3HH5IV30ZlFJpdEXoUEw261Yk6XrYN0U7chL26PQgfG59
         eMnNZwDgGeAZM6Os+FkKW9+Nizb1rawvZ7xZ4G84se7vb54jFjSh+LKjwQUYKkIxjZaj
         tQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749621335; x=1750226135;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEull6Y2dKdn7HXksCZ+pxPpbHPUoR6qac/gwemfvgY=;
        b=qVKho82LE8W6XCVclj9kr9ogOLc1Sc8+6m/VshOrXsro2xkCEMSXovSiQu3xeZPJqc
         +TmMk8mySJ3u/ehCnPAhcgi2ldHZJiTm1stwkbiuHuTpi9GPmPKjZcgr9WblFgwESDv4
         I56yfbwoyz6MWKTOKkRIaE5XHAxeFSymR6c8Ju342H6AftnVx/ljvdkbq8iPwk/AEVOz
         PtdlVdXThD7wWZGuIG4Q/AwEE5YORZk1UH2BuRpMkVPUKf6cvx0VkeNui0b34N7wqOyg
         bTFdXtdK5BiIOJqKotwFbeTP4bqyVkpeWORvKOS6MyakrhS5LJoPQbXUmJLtP+6nGa+6
         cs+A==
X-Forwarded-Encrypted: i=1; AJvYcCXY0czXwtEYLO29a19SylrpfV5lTV+GeQf0rH7mPnt8OYovtTGxhjVG9JFvq8cV+4gfhens0CjSGXI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPYnFNQGpFMoY4aIbey1Nyz1psW1VwnVawaPk+vwMJAJdHy9D3
	yxDGdO6oso6uLVItQlU8R0gQTSBWfgVZr4iu5Vek5FGo2DZHS7wyM0NcjPM/EixKbUtFVUSyTUf
	QIPWN4Gc/TsJvZEgCpwqxKIuvF6O0c6c=
X-Gm-Gg: ASbGncv4yBPqzQVIZXXv2d7cUmc4DRgoACv4JFw+vIIFySEMnW0HWFeWnPkRdiCSONd
	ljQQP0d7BJbwQj57Xz7EqRxJdPaSXrt8bwbLFqY2LgaXhwhIcGf58fRfBOH2t4hhgCE7lIT3lcJ
	3pfrt2jqyS2+EnEsErLzszQkrgGGLL52EMfnPfeUpI8w==
X-Google-Smtp-Source: AGHT+IErScmgyst1hOgqidcJMyBjKM/5nzEwiAgXH2L+nlqO63ErIaFSpju92ErtkSG2sc3XXXL++dfq+bQl766+AOQ=
X-Received: by 2002:a05:6512:3da2:b0:553:1f8e:f27f with SMTP id
 2adb3069b0e04-5539c14a367mr628083e87.30.1749621334267; Tue, 10 Jun 2025
 22:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748848482.git.mykola_kvach@epam.com> <a679ba83fcc0e8387158a218f3af1fa234ea3534.1748848482.git.mykola_kvach@epam.com>
 <4bfe5a9a-6128-4760-9121-46b0d9bd6789@suse.com>
In-Reply-To: <4bfe5a9a-6128-4760-9121-46b0d9bd6789@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 11 Jun 2025 08:55:23 +0300
X-Gm-Features: AX0GCFsA7nHtLNXJdIHn-uO4hMdCRIvzuptexlLYI6Sc4TaBOdW7iUggxtLLmg8
Message-ID: <CAGeoDV_QJrLM4ySknkNuV+xsg7Sxj+0iDe6bXGJpj+1+9_oYaw@mail.gmail.com>
Subject: Re: [PATCH v4][PART 2 01/10] xen/x86: Move freeze/thaw_domains to
 common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 12:20=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 02.06.2025 11:04, Mykola Kvach wrote:
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The freeze_domains and thaw_domains functions are currently defined
> > in x86-specific suspend code. These functions are also useful on other
> > architectures, such as ARM, for implementing system-wide suspend and
> > resume functionality.
> >
> > This patch moves these functions to common code so they can be reused
> > across architectures.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>
> On the assumption that the transient Misra violation is okay:

Perhaps wrapping it with CONFIG_SYSTEM_SUSPEND would be sufficient.

> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

Mykola


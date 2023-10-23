Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29337D2F30
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621186.967450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgE-0001Iy-Uo; Mon, 23 Oct 2023 09:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621186.967450; Mon, 23 Oct 2023 09:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgE-0001An-JL; Mon, 23 Oct 2023 09:57:02 +0000
Received: by outflank-mailman (input) for mailman id 621186;
 Mon, 23 Oct 2023 09:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LY3q=GF=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qurgC-0007mu-UF
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:57:00 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81bb948d-718a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:56:59 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9bdf5829000so455995366b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:56:59 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n13-20020a17090673cd00b009b65a834dd6sm6423469ejl.215.2023.10.23.02.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 02:56:58 -0700 (PDT)
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
X-Inumbo-ID: 81bb948d-718a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698055019; x=1698659819; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D4gHySb9jPP+co9WEm3UiFfVCY+EKkhi2jRn1gUWXeE=;
        b=nsvC+ttCAEzNSSkhljQW0Lphd1/n1WVoR7GIyvGVqU0F5ltWs7TbY+3Pe8ML4KFZeD
         IVUPWq8hwIB8qoAtRZZH0sH3Gh5t3mju3BuB1j80TkkGTabhielPnFqBV3zf1y0kBtf9
         eKa1iEHemEJaWN/IkSIt0NhnYWEeB8dd7nKSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055019; x=1698659819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4gHySb9jPP+co9WEm3UiFfVCY+EKkhi2jRn1gUWXeE=;
        b=T9X7wok9KBvUS2nJB1+1qwuvDQHGmJqAovTGYhP6QZenY0/X1EAq+5DQXd6R173JqN
         ewlcalmdRkBV9EvmfKD+t4R8kulh/3ItMvIeIGAPBV2UgjMPAHXZWlP55f45bLZ8YOE2
         oR5rEm8POv4SnYoQjPN8sP/cgvNBUgBYS9fkV3Nt8sGaghU1ocR93Z5bLjWmvY7iOoff
         ZL2iqgeTU3TJ/n8EnflG3PdfC2z8Sh90nmxOXSJuUoA6Tr4KdaAkFDeTwkdzDckB+YBK
         CJPxXTQgn62MulUUrw31jkXXVDFb92DiKjcGHIyo+jPk2zJT6X2/opNzg9u/nPNe1WLY
         Zhnw==
X-Gm-Message-State: AOJu0YwJrO/meLN5/H6/6SBlgRqkLPLOy06IC4+q61HdHU38u0net9ZZ
	ybK/TcAE1wwBotwUoOCyFFXpJA==
X-Google-Smtp-Source: AGHT+IGnz74fhN9pLXuQ8aks3noDzq+0ViNTdTaK9nOmAQhU7Sk3+NlRU/qNsH9s0b5+24/r9eiZGQ==
X-Received: by 2002:a17:906:c141:b0:9c5:7f8b:bafc with SMTP id dp1-20020a170906c14100b009c57f8bbafcmr6467876ejc.22.1698055018859;
        Mon, 23 Oct 2023 02:56:58 -0700 (PDT)
Date: Mon, 23 Oct 2023 10:56:57 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] tools/xendomains: Only save/restore/migrate if supported
 by xenlight
Message-ID: <e0cd4d8a-8847-4778-b295-7b2901bdca12@perard>
References: <20230322135800.3869458-1-peter.hoyes@arm.com>
 <6F0D3115-C030-423E-ADBB-ADBB104E7BA3@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6F0D3115-C030-423E-ADBB-ADBB104E7BA3@arm.com>

On Thu, Oct 19, 2023 at 12:50:52PM +0000, Luca Fancellu wrote:
> 
> 
> > On 22 Mar 2023, at 13:58, Peter Hoyes <Peter.Hoyes@arm.com> wrote:
> > 
> > From: Peter Hoyes <Peter.Hoyes@arm.com>
> > 
> > Saving, restoring and migrating domains are not currently supported on
> > arm and arm64 platforms, so xendomains prints the warning:
> > 
> >  An error occurred while saving domain:
> >  command not implemented
> > 
> > when attempting to run `xendomains stop`. It otherwise continues to shut
> > down the domains cleanly, with the unsupported steps skipped.
> > 
> > Use `xl help` to detect whether save/restore/migrate is supported by the
> > platform. If not, do not attempt to run the corresponding command.
> > 
> > Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> > ---
> 
> Hi Anthony,
> 
> Regarding this patch, is there any update?
> 
> I’m asking just because here https://patchwork.kernel.org/project/xen-devel/patch/20230322135800.3869458-1-peter.hoyes@arm.com/ it seems you were volunteering to fix that in another way.

I did, https://patchwork.kernel.org/project/xen-devel/patch/20230519162454.50337-1-anthony.perard@citrix.com/
But looks like I need to update the patch.

I think it's a bit late for 3.18, but I should be able to update the
patch for next release.

Cheers,

-- 
Anthony PERARD


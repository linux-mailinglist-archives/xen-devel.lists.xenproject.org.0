Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C09BE1CD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 10:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830645.1245716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8c10-0004YU-Rx; Wed, 06 Nov 2024 09:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830645.1245716; Wed, 06 Nov 2024 09:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8c10-0004WG-Of; Wed, 06 Nov 2024 09:07:50 +0000
Received: by outflank-mailman (input) for mailman id 830645;
 Wed, 06 Nov 2024 09:07:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlMZ=SB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t8c0z-0004W8-JE
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 09:07:49 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970207c1-9c1e-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 10:07:47 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cef772621eso476018a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 01:07:47 -0800 (PST)
Received: from localhost ([213.195.124.162]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16d667fsm253574766b.61.2024.11.06.01.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 01:07:45 -0800 (PST)
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
X-Inumbo-ID: 970207c1-9c1e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk3MDIwN2MxLTljMWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODg0MDY3LjA3ODU5NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730884066; x=1731488866; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNzyDLcyEHBNChmvncanPiVECOHrQoSFZh4RbJy4Wbo=;
        b=DaLre/KTvl7bNNZAo8v18IdvCI+6FJWTOCdqU5CgU3hWQX8F52f53i7rdZkFZqZnBx
         G47Tlsl/UFnj7G4OAzm38n4xxvLOYsI85I9zK2f7xH3Off6ACGDm3PcqMAvPGY/37ftx
         16pWsycUZLbUueuRo8ux2MY9augLJA9r7OS1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730884066; x=1731488866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNzyDLcyEHBNChmvncanPiVECOHrQoSFZh4RbJy4Wbo=;
        b=Yz+9JmdjgozQI1E9rQZeFoWeFwZfvtyRvLeN/lV/dJS5FmfYh9UiLbKQWFgL69lh/3
         29KaA3Iynh7mStxpTtAkm2Zoc5ZxQ+0znF8r1VkzcfX5WiTois9p8un+QXKYXGt9sDUg
         KXNKOb4uxwKRK52CxYnuM+O7+JMuhPyrZDy6HNfFybIMa8dAFCJDJpKdSMtcmtK2zRfp
         ayOdxbU4uWCWTx9X++CssaJz+XbuUZ1xdv+r/MqdSErgFSHs+TR/vm+FXrk6wYXl3TSY
         XMI5Fz89KUOPR9a5j31p/bqZjxzs6uQmtP9NPZHPfsssSgKEt/d+HWSx3H0Um155k20P
         jxSQ==
X-Gm-Message-State: AOJu0YyqrkwZRpegGpeDHjzgYetj+NuYcGr/c98CU/fFphpA0a2xuvaD
	iwj4by25BIsujvNpHDeCbtrQNUfok2m4nF15+rN30BNDgZc4StQsbWxxZY4Rbv4ehpKmdILWH4k
	Q
X-Google-Smtp-Source: AGHT+IFgD5taObDYJjmtUVV43dTGbIXCupC9FMeMLYEZMGm6uokV/U8/4ORkyGu0LoJOzJjlR/22IQ==
X-Received: by 2002:a17:907:318e:b0:a9a:478:2ee3 with SMTP id a640c23a62f3a-a9e50b57ba0mr2239065866b.40.1730884066377;
        Wed, 06 Nov 2024 01:07:46 -0800 (PST)
Date: Wed, 6 Nov 2024 10:07:45 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] xen/vpci: Fix UB in mask_write
Message-ID: <Zysx4ZwCUv62uTBw@macbook>
References: <559dfac91b8f097bc59c4de194fd2ae2b5b4144c.1730880005.git.mykyta_poturai@epam.com>
 <ZyswF4grJSNcVqY_@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyswF4grJSNcVqY_@macbook>

On Wed, Nov 06, 2024 at 10:00:07AM +0100, Roger Pau Monné wrote:
> On Wed, Nov 06, 2024 at 08:05:19AM +0000, Mykyta Poturai wrote:
> > During the construction of dmask value, it gets shifted by
> > (32 - msi->vectors) bits. If msi->vectors is 0, the result of the shift
> > becomes undefined due to shifting by a size of the type. While this
> > works fine on x86, on ARM the resulting mask becomes 0xFFFFFFFF, which
> > is incorrect.
> > 
> > Fix this by adding an explicit check for msi->vectors == 0.

Wait - how can msi->vectors ever be 0?  AFAICT there's no way in the
MSI logic to configure 0 vectors, there will always be at least 1 vector
enabled.

Maybe what you want, if this fix is for compliance reasons, is an
assert unreachable that msi->vectors > 0?

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92EB1A603
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 17:31:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069539.1433392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uix9f-0004ex-De; Mon, 04 Aug 2025 15:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069539.1433392; Mon, 04 Aug 2025 15:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uix9f-0004cx-Aw; Mon, 04 Aug 2025 15:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1069539;
 Mon, 04 Aug 2025 15:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OEzl=2Q=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uix9e-0004cr-KB
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 15:31:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 088c2b0c-7148-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 17:31:04 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b7862bd22bso3104252f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 08:31:04 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3abedesm16051449f8f.3.2025.08.04.08.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 08:31:03 -0700 (PDT)
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
X-Inumbo-ID: 088c2b0c-7148-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754321464; x=1754926264; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q6QKNw0BvKcLrBRnTDRClrWwfu22ME003o3Z2eHBmgs=;
        b=dEwIukGhuKyFWMG9dnrECACeoSW8uDL4LIfnfr2NwTRnxkrGqFNFWmULAWuwI7VtHe
         Y0gtmWDh9epamKo8OYdChcWzLeZ8Tg9sfF2IA19QPURnSc1X8zcA8zl0yU/kw2te/PP4
         cmYQe+eB/4K5JBW3L/XuO8sjIcsE33ZxUNUac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321464; x=1754926264;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6QKNw0BvKcLrBRnTDRClrWwfu22ME003o3Z2eHBmgs=;
        b=IVrG2K5huJWRxsimwlSNeK2NpztkKwfDYTN8779QqUZ2b3Cnmas9nZYhHEMO2wmcNn
         RqNCQGn7HHsVV+Kgzxr7KVydjFFVyKsmPjyM+M/HJH3SXOA4+HrK4+5LRhnOEA7pUNEV
         8e05UzD18gPBW5it8y9OalIXEdDqR1GWn+h1de5LuMRXt3MZSAuJgHJnb3j0t5YYuUEQ
         tJdQcBA4ylFl6pQviZBFky4Y1pp9WU5Qq2h2LNheQKZD1/6KFhQtZ3Ho1fubgBgDApf9
         I8Weu84uQpcl8UxkAF17xXDAnkagiBu5MGBYa840V2uBAM1pujXMyE8BNOF3weTB6WpR
         kTgg==
X-Forwarded-Encrypted: i=1; AJvYcCUoxQwvW9JWLi5bIp1yBn9e+Y0fb4Z/9Rm54mmf9joRUYvgqAOuVLmjzkmaIpG9QrMmRDVetgima30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEu5e8umZlY9iW7X4mXSV1QS/q9BlNrrp1q+SM4m64Fkb/uaZA
	hEXDGGE6tsUg8tGZGoRxJOvtwJe05SvQaqrxjjcdVbc/c48QQ+YpoFOd2+jenhTSOJI=
X-Gm-Gg: ASbGncsxMFBkMV+vnR3fLTqDO+Q7axnJDnlZSwmW4DFpXPFbquoc/zk0s3s2WlLU+Ec
	41150fQbjMP/EMzB9cKkPa4PndKAxA6dRE/CVm5Cbn3iYMZ7iVd6aWSF17/gRhXPf/uLg4TmIO3
	/jyjXQYRfwGytu8cbI77FfEwKt4ML4IFEfS53H0fkHiK7zDziKOU6RNiP6XrwMAH6Lu/BxCrXkd
	j+qbjGNmw0cV/U3vhCr/5aeZfjQLNst72JooOqHzj8n5W539csHUMZqptQWjC8ulX2P9yFWTAkw
	FCctrpT6GzYCpUrByoAorcRvAJYYpa9iHhGhv87zdeDLRiRxJqGjZaKGrWtgDQ9QFOOZllOZf1C
	7nSBi47cYPLnUJ4xLc8IxlOqwbCn6sfj35VPII4jxlXqh9cIsVjGVLSIva/UBFflGZw==
X-Google-Smtp-Source: AGHT+IEA0aWFF/SE+ZgQ1j4YYo7ZFOrPqxduQJUWD/WdPYFWDJMzKW/VY4VbyTOgbvtMyfK8jn230w==
X-Received: by 2002:a5d:5f4c:0:b0:3b7:8acf:1887 with SMTP id ffacd0b85a97d-3b79d4e387emr11114703f8f.13.1754321463874;
        Mon, 04 Aug 2025 08:31:03 -0700 (PDT)
Date: Mon, 4 Aug 2025 17:31:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH v9 5/8] vpci: Refactor vpci_remove_register to remove
 matched registers
Message-ID: <aJDSNon2CdBra9yT@macbook.local>
References: <20250728050401.329510-1-Jiqian.Chen@amd.com>
 <20250728050401.329510-6-Jiqian.Chen@amd.com>
 <89058017-141e-4837-a547-10b41b5d041b@citrix.com>
 <BL1PR12MB58499F7343CAC0206676E0BBE727A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58499F7343CAC0206676E0BBE727A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Thu, Jul 31, 2025 at 06:28:14AM +0000, Chen, Jiqian wrote:
> On 2025/7/30 19:23, Andrew Cooper wrote:
> > On 28/07/2025 6:03 am, Jiqian Chen wrote:
> >> vpci_remove_register() only supports removing a register in a time,
> >> but the follow-on changes need to remove all registers within a range.
> >> So, refactor it to support removing all registers in a given region.
> >>
> >> And it is no issue to remove a non exist register, so remove the
> >> __must_check prefix.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Bisection says this causes an assertion failure in the unit test.
> > 
> > Running /usr/lib/xen/tests/test_vpci
> > Assertion failed: vpci_remove_registers(test_pdev.vpci, 16, 2) (main.c:
> > main: 407)
> > FAILED: /usr/lib/xen/tests/test_vpci
> Thanks Andrew.
> This is because new function vpci_remove_registers() removes all registers inside (offset, offset + size) and returns failure when overlap happens.
> For tools/tests/vpci/main.c, there are layout:
>      *
>      * 32    24    16     8     0
>      *  +------+------+------+------+
>      *  |            r0             | 0
>      *  +------+------+------+------+
>      *  |  r7  |  r6  |  r5  |//////| 4
>      *  +------+------+------+------|
>      *  |///////////////////////////| 8
>      *  +-------------+-------------+
>      *  |/////////////|    r12      | 12
>      *  +------+------+------+------+
>      *  |r16[3]|r16[2]|r16[1]|r16[0]| 16
>      *  +------+------+------+------+
>      *  |    r20[1]   |    r20[0]   | 20
>      *  +-------------+-------------|
>      *  |            r24            | 24
>      *  +------+------+------+------+
>      *  |//////|  r30 |//////|  r28 | 28
>      *  +------+------+------+------+
>      *  |rsvdz |rsvdp | rw1c |  ro  | 32
>      *  +------+------+------+------+
>      *
> As for the last three test cases:
>     VPCI_REMOVE_INVALID_REG(20, 1);
>     This can success as this overlap with r20[0]
>     VPCI_REMOVE_INVALID_REG(16, 2);
>     VPCI_REMOVE_INVALID_REG(30, 2);
>     These two fail as there are r16[0], r16[1] and r30 inside them, so remove success and test cases fail.

Yes, given that vpci_remove_registers() can now remove multiple
handlers in one call those two tests are simply not correct given the
new behavior of the function.

> So, I think we need to change these two test cases to match the new function's logic, like:
> VPCI_REMOVE_INVALID_REG(0, 2);
> VPCI_REMOVE_INVALID_REG(2, 2);

Those two test exactly the same as the (20, 1) call, so I think they
don't add value to the testing.

I would convert them into valid test cases, so:

VPCI_REMOVE_REG(16, 2);
VPCI_REMOVE_REG(30, 2);

Because they now test the new functionality of removing multiple
handlers with a single call (or removing a handler while dealing with
padding on the sides).

Thanks, Roger.


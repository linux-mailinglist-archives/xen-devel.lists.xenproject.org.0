Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E48A6DE54
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925773.1328654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjdi-00055g-V0; Mon, 24 Mar 2025 15:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925773.1328654; Mon, 24 Mar 2025 15:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjdi-00053g-SR; Mon, 24 Mar 2025 15:22:58 +0000
Received: by outflank-mailman (input) for mailman id 925773;
 Mon, 24 Mar 2025 15:22:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BTZL=WL=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1twjdh-00053Z-H2
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:22:57 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc15ee4b-08c3-11f0-9ffa-bf95429c2676;
 Mon, 24 Mar 2025 16:22:55 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so3664346f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:22:55 -0700 (PDT)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957d9sm11182127f8f.9.2025.03.24.08.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:22:54 -0700 (PDT)
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
X-Inumbo-ID: dc15ee4b-08c3-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742829775; x=1743434575; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VEWUjyrDkZUiiqHrR1WsWydWDqhe+XwfFtaz1hrJS8=;
        b=f93wmTXX0+27qa2dFT3AJwh6xL4mi5g5nwOlq9JILiHl7GrAkzchoCFgXR7GYMds1r
         2xy8HjsXmYbqQAbXZnzLxI6SqiiDGaSml/q2VqigqB5PPHRM2IL490c9ziMwkjAmLenQ
         9KscvZNCTKtkIeI8HltkhBsrE4LUuHvUl7CWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742829775; x=1743434575;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3VEWUjyrDkZUiiqHrR1WsWydWDqhe+XwfFtaz1hrJS8=;
        b=kUt42AipBiKgUIRJpdLdon59IqQM6NJJr81k+rrXuZiPKc+tFUZW/euffODtYkJ9jn
         Ap3xk6tHjUggwo8An7CuHl0ZvbwxRywMlFNAhs7Bll8Ev1/TNrAzTPMOq/Mm2XLrnVCi
         qtALVeBwH3ph+dP0rbhpPJWlgxpvabb9CggbafxK3fMfTxXBG/VvqGn9ygYo+mE72qSQ
         m4Pk5x3vAhzvO//zMBcJtMoRn3yEuoJkOkv+RFkFf+cZJaCeDVzPg3biUC1HzLnNxD4L
         FEUWTjB6kWVss4OPH6OS0J0zaYDfW8k0MtDDVcD4QCDI+xHZGAfnbuJUw0t7ZjbuZv/7
         j7UQ==
X-Forwarded-Encrypted: i=1; AJvYcCXewvu9RkrkYXL9Sns1FkQD7lTrJwy9dccEbzHI6J0dda+c1m67jp6of/qXPxJIjM1BXCQ6Y0cngoo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWtLVNwSkipspuNVQAqaQvpkEW7fZ6pYQIhndfaRpehIjBCj1I
	N7Dw6o+jP44K0iFtLdyA7JSfnzaVqDDhlDtAxUQh5r6WCwRb72PhP2WApjg+ZRU=
X-Gm-Gg: ASbGnctcrOfCuS9nb5l0KZxgkUzuogDhDFc4ko9Aq3eiarN9aqo3K40FqFea7mq3X75
	92Eb+cOrgb+y27Mjbp1+Lc2XjYD3yZEkEMrPmebbtjdUyo+6wqnJoV/e8K0fJE4RKBlcQJtR9nZ
	5TiGlSXIKU0GUwDvWeMYIgkYLcYmUSgzb1Pi5or06hjNezLYk6g+rZXDS/hPG4SK18mmWHwFO4p
	3r1kop8wX0DBea7pzY6BugtNdrWV2hdZZHugYZO1tkCQ7BRrouYq3qyyvbkONGBqyaeKvVoZn3U
	F55EPBOK86aBrQL2jV/vYZUyBQdQ4zqVB+zhW14EQ78dRRzNH6VYgC9jLhareSVCW5VrlsVVroY
	=
X-Google-Smtp-Source: AGHT+IFuDv5gKbkgFW3LKVNBP9IeNcu3pY40SmZuc2Ym+OBrdI2rIHLo3vLpQlkGy8KpqcIcXsvzgA==
X-Received: by 2002:a05:6000:1f87:b0:391:2ba9:4c59 with SMTP id ffacd0b85a97d-3997f93988amr12349288f8f.43.1742829774791;
        Mon, 24 Mar 2025 08:22:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 15:22:53 +0000
Message-Id: <D8OLLCXYKINR.3HD274I110XCF@cloud.com>
Subject: Re: [PATCH] tools/arm: Fix nr_spis handling v2
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
Cc: "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross"
 <jgross@suse.com>, "Luca Fancellu" <luca.fancellu@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>,
 "Bertrand Marquis" <bertrand.marquis@arm.com>
X-Mailer: aerc 0.18.2
References: <20250318090013.100823-1-michal.orzel@amd.com>
 <D8KAQ3MH52YA.1G12M32NDFRJW@cloud.com>
 <17608388-b900-45d2-bb74-8eec04ab1f76@amd.com>
In-Reply-To: <17608388-b900-45d2-bb74-8eec04ab1f76@amd.com>

On Mon Mar 24, 2025 at 1:08 PM GMT, Michal Orzel wrote:
>
>
> On 19/03/2025 15:01, Alejandro Vallejo wrote:
> >=20
> > Doesn't this regenerate the golang bindings?
> FYI, it does not. The bindings are already there for NrSpis and default v=
alue is
> does not result in a change (for verification I checked max_grant_frames =
that
> uses LIBXL_MAX_GRANT_DEFAULT).
>
> ~Michal

Oh, good then. Though it does raise the (completely separate) question of h=
ow
correct those bindings might be if they ignore the IDL's default values... =
:/

Cheers,
Alejandro


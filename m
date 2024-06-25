Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651D916E4C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 18:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747974.1155511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM9GA-0004fx-75; Tue, 25 Jun 2024 16:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747974.1155511; Tue, 25 Jun 2024 16:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM9GA-0004dr-3J; Tue, 25 Jun 2024 16:43:10 +0000
Received: by outflank-mailman (input) for mailman id 747974;
 Tue, 25 Jun 2024 16:43:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM9G9-0004dl-0s
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 16:43:09 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000019af-3312-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 18:43:07 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a72510ebc3fso371251566b.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 09:43:07 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fe2a22b6fsm412408266b.85.2024.06.25.09.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 09:43:06 -0700 (PDT)
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
X-Inumbo-ID: 000019af-3312-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719333787; x=1719938587; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZgxFPjsOmmwsu7KF6UDwNopZBtQ3RAQ3rZ9jx57Phkg=;
        b=OYARCePQc0jqPKtFh+KPODamSFfadXGGnvpYO3WoIBUhLqLzjKunwRRall3S3uaVWM
         jVpWT/Bkz2QDQ7PtBN615sLlh0FfojMKcnbJMod8cNARhyAWXzILk3haSYnDXKkMcrBQ
         2IomcV/aqHFE9zZ/w+MnaXgPE9DswyhXRSQkAz1tL+3f+qHFCYAAak+V16xfvcsimAT2
         Vtw6z2K3uyER4zZfT5UGttj0FbDnUX4ksV8072WwSxfzxzzJ5zndXLRDG8ADzFpjbwDM
         shX5ATHK88MNcW4cD590pLcjdsDBqkGV4hU/x7L1fpIg0GvJiiphLvXJwfbmH+2Omhso
         SdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719333787; x=1719938587;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgxFPjsOmmwsu7KF6UDwNopZBtQ3RAQ3rZ9jx57Phkg=;
        b=tbY1sy4OgvBL1GqKIU7DCtj1bg+TAaHIxhlcwKd5dfoNJH5r4qWzzL91l1fsegpm3d
         8zsQ9VYF4BAErcM7IJPTTz42RydCrIQb+YylG6BIcw0EIrulphgSRGsaKWqopAF3Bsm6
         oDNMuivS8+NM36BE1armp1QiUtLv7yiY5JrrIlYrTJi49AWdbQ6PqCPXqrniTY+QqzWB
         KC59K2OO2ggqnFbH/j3r4wTc4vTXGaIXJnVQMoKllqgO2xs4Zdiqtrg0IlrlqEUjwzv8
         YImZhws25xyvx2kLWmI4Vo8XX98CM+qrQmWqGC9WnT1KY/YjkHrB+9B0BEy49aZcemBm
         0nng==
X-Forwarded-Encrypted: i=1; AJvYcCXOrHwf+pGoe2GTXip5xZXAJtzIQQk4tekXZEOVMRbxVrBACwhqjCOR2tKdRsz31p33N+qDM4XQtoZYJFjLQ9+mPg0AaAa9dSKCbLjTtv8=
X-Gm-Message-State: AOJu0YyJ03ibkyiXCgL9GSpJ3C69YBagYnM9Y7BccPPmgLDEoQQuqK+T
	3r4UIu8ilFZgjxGWwUqbMShfJQXMpOlvRRBQP8Zn1RxjnuUTlrmF
X-Google-Smtp-Source: AGHT+IFI4SAOhEvVm8f2Cf8Z8zqITguJXH3FQIp+Kw1w/+JZft2r9sR5sdQCUlqFPVvldgmFhHSvFQ==
X-Received: by 2002:a17:906:7f05:b0:a6e:4693:1f6e with SMTP id a640c23a62f3a-a7242c39be2mr599489066b.29.1719333786895;
        Tue, 25 Jun 2024 09:43:06 -0700 (PDT)
Message-ID: <8dc1f4caf9ceec6228c104acaded6a70c828526b.camel@gmail.com>
Subject: Re: [PATCH v13 10/10] xen/x86: drop constanst_test_bit() in
 asm/bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jun 2024 18:43:05 +0200
In-Reply-To: <301ed888-af55-4445-9944-a1488791e120@suse.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
	 <edd341a6e86ceac2717c59680d4e5e7fc3321b5d.1719319093.git.oleksii.kurochko@gmail.com>
	 <301ed888-af55-4445-9944-a1488791e120@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-06-25 at 16:51 +0200, Jan Beulich wrote:
> On 25.06.2024 15:51, Oleksii Kurochko wrote:
> > constant_test_bit() is functionally the same as generic_test_bit(),
> > so constant_test_bit() can be dropped and replaced with
> > generic_test_bit().
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
> (Didn't I ask for this to be done, so perhaps also Requested-by or
> alike?)
Yes, it was you, sorry.
For sure, we should added Requested-by. ( I had cherry-picking from
other my branch where I didn't add Requested-by and just not double-
check before send to xen-devel )

Could you please add Requested-by during the merge? Thank in advance!

~ Oleksii


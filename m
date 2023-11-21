Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5D7F284D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637592.993519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Met-0002Lz-Hm; Tue, 21 Nov 2023 09:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637592.993519; Tue, 21 Nov 2023 09:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5Met-0002J9-Ew; Tue, 21 Nov 2023 09:03:03 +0000
Received: by outflank-mailman (input) for mailman id 637592;
 Tue, 21 Nov 2023 09:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFE0=HC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r5Mes-0002J1-Di
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:03:02 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5dc9f98-884c-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:03:01 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c873cf9f74so40309471fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 01:03:01 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a2e9b0c000000b002c0055834b3sm1206603lji.4.2023.11.21.01.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 01:03:00 -0800 (PST)
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
X-Inumbo-ID: c5dc9f98-884c-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700557381; x=1701162181; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rkqE2vAMpCme+7MSuqc1jcHLQoQnu4z8xbZxABhX6II=;
        b=OEBVa4xO6ayJv+LSRtbS0VjVU9/y8m4gp9fh2yCOeJWT+VCNjxmeEmpSVfoeHgJNnM
         L5hSCzXdGvbn7Z0VqUlTflEa9jJ2N1bTtr+B9+k9/AXawPt2LqaygR15uDpyUq47iF0Y
         atxE+J8kj4X1aLbXS8AUnbGPnYFe2Ohlym+oWwRuKoykDin+hDcoSUYvwI8v4mZQrYDA
         1QqUv+x2cugN/sUxgONHjpEGlvVYGEJWsOxUURJ7KsViM1+5fVwAsnBuwhXLdS2T2G1F
         jB5fhEoPXBLbLa14qMdMasHusSu225Tyl0nUd6ndgbDyR7ANEQAM9qOCUOjVo4Ok4n1Y
         JATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557381; x=1701162181;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rkqE2vAMpCme+7MSuqc1jcHLQoQnu4z8xbZxABhX6II=;
        b=dqKPXzLrgYIW4+vnb6dsVYDs5+hOubcWcLgx097sboF+MElWzf4o4PFbGKPpCWFUGq
         O+G2oD6Q3BZq+14q9VMT3xFJc/PRWCyvH3Ns2cVxsx/vN3YiDB45SNouov7Hw3uyh5au
         hFHjGg4RFdqCeGaaN6o5lO3bcDmo0B3KLLBXfvRFBEJtqE1PnMrToBHxECKt+HYx9HKI
         JhliK/pSRyOtLi1kHGYcsKhHP6Au7Ul29rRm0R8vslKdocsCcaLFYWCe9w2k41BkPcAh
         hNxkzO4uI548QPHm1GSCx2V/eSPfO3xKcfAIDgHUT/gXN8uJMkK8jEGuXKv9JrE3JTx8
         C8IA==
X-Gm-Message-State: AOJu0YyCOd9NH4yu+EJr5RiLOzvveRtASN/9up3NsvBj+MkMPfvvOmY+
	7F9uky1nJAvbW3SY/1AInLU=
X-Google-Smtp-Source: AGHT+IHNTq2tELsTSglFvRkbrETn5F8AC93pA4qVJv6pqd7hRn+EIupGO8cz9Qyxt/GpxKx1jE3ADA==
X-Received: by 2002:a2e:b282:0:b0:2c4:fe14:a85 with SMTP id 2-20020a2eb282000000b002c4fe140a85mr8333214ljx.18.1700557380675;
        Tue, 21 Nov 2023 01:03:00 -0800 (PST)
Message-ID: <9e31e7fc6f5957b0cdc30dc8937d5dd6bd1d345d.camel@gmail.com>
Subject: Re: Interest in Release Manager Role
From: Oleksii <oleksii.kurochko@gmail.com>
To: Henry Wang <Henry.Wang@arm.com>, Kelly Choi <kelly.choi@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "marc.ungeschikts@vates.tech" <marc.ungeschikts@vates.tech>,
 "olivier.lambert@vates.fr" <olivier.lambert@vates.fr>,
 "marc.ungeschikts@vates.fr" <marc.ungeschikts@vates.fr>
Date: Tue, 21 Nov 2023 11:02:58 +0200
In-Reply-To: <ED06FBCD-A346-4B73-A88A-E52F8080AF1F@arm.com>
References: <0cb1254f433536a9995c278c919372e226059934.camel@gmail.com>
	 <ED06FBCD-A346-4B73-A88A-E52F8080AF1F@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Henry and Kelly,

On Tue, 2023-11-21 at 01:48 +0000, Henry Wang wrote:
> Hi Oleksii,
>=20
> > On Nov 20, 2023, at 22:06, Oleksii <oleksii.kurochko@gmail.com>
> > wrote:
> >=20
> > Dear Xen Community,
> >=20
> > I am keen on stepping into the role of a Release Manager for our
> > next
> > release.
>=20
> Thanks for the email! This sounds good to me and as Kelly says,
> please
> mention this in December community call and we can formalise this.
>=20
> > Despite not having direct experience yet, I am eager to learn,
> > adapt, and grow into this role with your guidance and support.
>=20
> I will help on that, no worries.

Thanks for your support. I'll mention my interest in the December call.
Appreciate your guidance as I step into the role.

Best regards,
 Oleksii


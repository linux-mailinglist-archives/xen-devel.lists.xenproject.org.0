Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD6839684
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 18:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670579.1043472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKf9-0002QX-T1; Tue, 23 Jan 2024 17:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670579.1043472; Tue, 23 Jan 2024 17:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSKf9-0002OV-QC; Tue, 23 Jan 2024 17:34:15 +0000
Received: by outflank-mailman (input) for mailman id 670579;
 Tue, 23 Jan 2024 17:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSKf7-0002OL-Le
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 17:34:13 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f5db1fe-ba15-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 18:34:12 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a2c179aa5c4so486213166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 09:34:12 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 vv11-20020a170907a68b00b00a2ed3049045sm7523021ejc.154.2024.01.23.09.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 09:34:11 -0800 (PST)
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
X-Inumbo-ID: 9f5db1fe-ba15-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706031252; x=1706636052; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4a69tkkqYLroCdIj4cZ8RPqWRDmyrwCnROXudaIGKak=;
        b=fxsw1dNbMnmO0vtogeGKoy5vYUJ8X0LNOa9BuzwMtLFJ+bNby5I8VAuvjRu0CmNWwP
         rXtlMw1teQ1xT63vgJlsl/znWjcwqC2MdfxJMnDQ9PA08HPmDoGKIPOb2jp91QOxVAyb
         ZwSkSNdKBnorBo44ylwv9iqpovIdEQITxNaDfPpBQX5GpzUKZWi+szMYEjHE8zj52dbF
         gTCHP0tRumpXniQxOYg1lUJmYts9dYcFSRfjtz++yylDNba3EB0juuwzc4hL30f2PIUT
         XLod4tdqs0e0baxHnycK4CVJJb4fX7L9/Q/nxQqH+aBzKCBFlG1g9edyxWMzbWphzliP
         HiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706031252; x=1706636052;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4a69tkkqYLroCdIj4cZ8RPqWRDmyrwCnROXudaIGKak=;
        b=iUR42XQYtY1r+tXyEIQQI6Nwulvm7J5TFwZ0FLuMUJevDF3fMh13E/lFJiJsIIa/WB
         atuLsvfhM1f04H7y4D9hdIZUMKEETDc26Pn07oz47NiQkDUJv7iFUpLkWjS4bxPDp+mz
         uFnLjM55WiUXNaWBUHxpjMjqmMNmLrflAdtF4L6Ryzcobxe79QARCHL23qJTcUyk+k7f
         gb5I3H4rQXlCMK9AJI8LRCWQi3GVuEdXXbcxUW9yb3+z1zg2Xtap4N/4jaS9d1NgToFx
         Sr0URcl8OL74teE0P5EU7yoocLucXEc5IBAc8+hbdBqcbtyh2NYCShOlO/fjaDako/Wo
         /PZA==
X-Gm-Message-State: AOJu0YzDzo7XxhaoJOpOeX6RSR19/JVmfjIECwh7AKh3+0eBNeYDme+X
	bmEHlzBiqwZsOTPoeKlZegj3F1BWcwYjbhnuhCH8vg4hUKtHbISu
X-Google-Smtp-Source: AGHT+IHno0Z1Eypbj0BVKcH3K3fta9rhcUVuKkgmN5/kdA594jGiBXFznaTvKyAVDnfpJpdnJNx1pw==
X-Received: by 2002:a17:906:d299:b0:a2f:7a77:5ace with SMTP id ay25-20020a170906d29900b00a2f7a775acemr126462ejb.3.1706031252073;
        Tue, 23 Jan 2024 09:34:12 -0800 (PST)
Message-ID: <01c72cbcf7b824d0c8b3b656e5c6afaa7b941481.camel@gmail.com>
Subject: Re: [PATCH v3 34/34] xen/README: add compiler and binutils versions
 for RISC-V64
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 19:34:11 +0200
In-Reply-To: <d04ec806-f0c1-4992-96ef-229f0ebb468a@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <c4d579f02b431d6ac9366dee73ebd7ab74e44715.1703255175.git.oleksii.kurochko@gmail.com>
	 <88a7e5af-197b-41ef-b3c2-7d4f85a3cb85@suse.com>
	 <2a08cae2c6db049dc08db59f38c4e75573e37064.camel@gmail.com>
	 <d04ec806-f0c1-4992-96ef-229f0ebb468a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 18:05 +0100, Jan Beulich wrote:
> On 23.01.2024 15:49, Oleksii wrote:
> > On Tue, 2024-01-23 at 12:22 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0Changes in V3:
> > > > =C2=A0 - new patch
> > > > ---
> > > > =C2=A0README | 3 +++
> > > > =C2=A01 file changed, 3 insertions(+)
> > > >=20
> > > > diff --git a/README b/README
> > > > index c8a108449e..1015a285c0 100644
> > > > --- a/README
> > > > +++ b/README
> > > > @@ -48,6 +48,9 @@ provided by your OS distributor:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For ARM 64-bit:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 5.1 or later
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.2=
4 or later
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - For RISC-V 64-bit:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GCC 13.2.1 or later
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - GNU Binutils 2.40 or =
later
> > >=20
> > > That's pretty new. For gcc that's even newer than the newest
> > > release.
> > > If older versions really won't do, I don't think you can leave
> > > this
> > > unjustified (by having an empty description). Till now gcc 13.2
> > > has
> > > served me well, and iirc 13.1, 12.3, and 12.2 were fine, too.
> > It can be 12.2.0 for GCC and 2.39 for GNU Binutils. ( it is
> > toolchain
> > which is used by contrainer for RISC-V in Xen ). I'll update
> > versions
> > then.
> >=20
> > But could you please explain again why it can't be 13.2.1 ( it is a
> > version which I have in my distribution, so it is the reason why I
> > used
> > this version in README file ) ?
>=20
> 13.2.1 is a pre-release of 13.3.0. Only versions ending in .0 are
> upstream
> released versions these days. And I think it would be helpful if the
> minimum version also was the first in a major-version series, i.e.
> I'd
> generally prefer naming <N>.1.0 (or <N>.1 for simplicity; see Arm's
> entry).
> Of course if no such suitable version exists (because of being
> buggy), then
> specifying another one is okay. As to x.y.1 - nobody will then really
> know
> which version it is, because every distro will ship its own variant.
>=20
Thanks for explanation.
I'll drop the last number then.

~ Oleksii


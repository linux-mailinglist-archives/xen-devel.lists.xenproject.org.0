Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32106D0779
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 15:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516747.801366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phsnX-0006AB-OY; Thu, 30 Mar 2023 13:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516747.801366; Thu, 30 Mar 2023 13:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phsnX-000671-L1; Thu, 30 Mar 2023 13:58:39 +0000
Received: by outflank-mailman (input) for mailman id 516747;
 Thu, 30 Mar 2023 13:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wKg=7W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phsnW-00066v-Sj
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 13:58:38 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f800c20e-cf02-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 15:58:37 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id g17so24653920lfv.4
 for <xen-devel@lists.xenproject.org>; Thu, 30 Mar 2023 06:58:37 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a056512102a00b004e7b84c6419sm5861534lfr.192.2023.03.30.06.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 06:58:36 -0700 (PDT)
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
X-Inumbo-ID: f800c20e-cf02-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680184717;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fOCuH3XmKCVc/9Ln2weuEdAmYA5uatSA9IFqwoLcdyk=;
        b=aHOCFd3sHzq2pENF9h6JjLv00p0Pud/Z/TCqnYJ+QGcZwbZsfjeoyZAZwa9RcsaDDv
         MrFfKRWH82nfZEbyt2QlLOMa59B85ieFvyV7VjZSWnQUiIZ1r0xZk6fvc0ZwfERLZwfx
         wfYz0TgEymmmdisJ7dg5NkZb4q9voWl3rHd2LtvzqVnuB+Y4h7iXE2uK6uyogDkPz3B0
         dqIvG0HUDhtpz7Nif8Gv4rVaxVV2Q222fnRWqOwBuBZQA8HHwqZM8KIg6H/R6pfTuq/Z
         WEx5Q4zzV2KiXsidw1WB4OljHD9GePL0grbgsUBi4zz2Vf3V77cFWrib30074Ngxf25+
         l48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184717;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOCuH3XmKCVc/9Ln2weuEdAmYA5uatSA9IFqwoLcdyk=;
        b=XdbKzeZKtLicR1YrC73OI9rc9jZIT00doLewSNbjtyL2iyKifawC63OQcceZwBr+jg
         0/qWPbLyayK8UTfUZ6Z4algDy3kxFf4j4+vZ3S7MLLcP7iO/NOqs4/3fyrcOgEROeJIS
         2uljnWeFxjusDaqFvJRQio/PxTpCqVYx2mUTVCNG18HrGG/mwqFQOkf+xBQbgq/yvajd
         BfxO+unN/3TpnKCfnthTE5bGauuOQm1/jI2IhCVyuEhx2tlCJKwd1Me3zxiSeb7p7rZ9
         ao0/VxKNeFExPCEZMszHB/97WjcmfVK0QgtaWy5I6pwCFfWPtQJeTvgbO34LxM8XXEft
         oTpg==
X-Gm-Message-State: AAQBX9dM3+YONI0G5ni9nfhcQ7fpYXxogaWtXMwp67Hty7h0qANWB6gi
	jzg2ABPi2xMRMsCanjmW1N4=
X-Google-Smtp-Source: AKy350aBIZeGrmnmBU4sKpfpCg5tsjf43ubgqvuQFNP1twEgaPulJgcUnwuygPA7naEktJTVi78NrA==
X-Received: by 2002:ac2:53b0:0:b0:4e9:d158:d56b with SMTP id j16-20020ac253b0000000b004e9d158d56bmr7340199lfh.62.1680184717018;
        Thu, 30 Mar 2023 06:58:37 -0700 (PDT)
Message-ID: <2d741580ef0b5a2b3dea5e903f8bdacd9cda564b.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
Date: Thu, 30 Mar 2023 16:58:35 +0300
In-Reply-To: <0f4ec693-d3f5-d1d9-03fb-1a5918bae0b3@suse.com>
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
	 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
	 <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
	 <fa074729-ccf7-cf2a-b8df-6c77ae3117f1@xen.org>
	 <66b64c69fdc1404d9ade4be97c4a184715e4c967.camel@gmail.com>
	 <0f4ec693-d3f5-d1d9-03fb-1a5918bae0b3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Wed, 2023-03-29 at 14:20 +0200, Jan Beulich wrote:
> On 29.03.2023 13:47, Oleksii wrote:
> > On Tue, 2023-03-28 at 16:44 +0100, Julien Grall wrote:
> > > On 28/03/2023 16:34, Jan Beulich wrote:
> > > > On 27.03.2023 19:17, Oleksii Kurochko wrote:
> > > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > > @@ -39,12 +39,25 @@
> > > > > =C2=A0=C2=A0=C2=A0 name:
> > > > > =C2=A0 #endif
> > > > > =C2=A0=20
> > > > > -#define XEN_VIRT_START=C2=A0 _AT(UL, 0x80200000)
> > > > > +#define ADDRESS_SPACE_END (_AC(-1, UL))
> > > > > +#define SZ_1G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 0x40000000
> > > >=20
> > > > No need for this - please use GB(1) (see xen/config.h) in its
> > > > stead.
> > > >=20
> > > > > +#ifdef CONFIG_RISCV_64
> > > > > +#define XEN_VIRT_START=C2=A0=C2=A0=C2=A0 (ADDRESS_SPACE_END - SZ=
_1G + 1)
> > > >=20
> > > > I first thought the " + 1" would be rendering the address
> > > > misaligned.
> > > > May I suggest (ADDRESS_SPACE_END + 1 - SZ_1G) to help avoiding
> > > > this
> > > > impression?
> > >=20
> > > I will jump on this to say that I am finding quite difficult to
> > > review=20
> > > code using define/variable that contains "end" in their name
> > > because
> > > it=20
> > > is never clear whether this is inclusive or exclusive.
> > >=20
> > > In this case, it is inclusive, but within the same patch I can
> > > see=20
> > > map_end which is exclusive.
> > >=20
> > > For this case, my suggestion would be to remove ADDRESS_SPACE_END
> > > and
> > > just hardcode the value where you want to put Xen. For others,
> > > you
> > > could=20
> > > use (start, size) to describe a region.
> > Thanks for the suggestion. I'll take it into account.
> > >=20
> > > Also, are you sure that all the CPU will be able to support more
> > > full
> > > 64-bit VA space?
> > I am not sure but based on Linux it looks like it is true. ( at
> > least,
> > they use the same definitions for RV64 ).
>=20
> Hmm, the spec has this text in a rationalizing remark: "The mapping
> between 64-bit virtual addresses and the 39-bit usable address space
> of Sv39 is not based on zero-extension but instead follows an
> entrenched convention that allows an OS to use one or a few of the
> most-significant bits of a full-size (64-bit) virtual address to
> quickly distinguish user and supervisor address regions."
>=20
> Apart from that all descriptions look to assume that the top VA bits
> are simply ignored for the purpose of translating to PA, which would
> mean that any address within the 64-bit address space can be mapped,
> and the same mapping would appear many times in VA space. I wonder
> whether that's really how it's meant to be, or whether I'm
> overlooking
> something, or whether the spec would want clarifying.
>=20
You are right the top VA bits are ignored but my understanding is that
you can't map any address within 64-bit address space as the top bits
are ignored. Thereby address 0xFFFFFFXXXXXXXXXX are equal to
0x000000XXXXXXXXXX from HW point of view and the top VA bits are used
only by developer.

> > I am curious how that can be checked.
>=20
> Try it out somewhere?
I re-read the initial question and also your answer and it looks like I
misunderstood a little bit the initial question.

So if the question was about if all CPUs support all MMU addressing
modes ( Sv32, Sv39, Sv48, Sv57 ) then an answer is no. There is a rule
that if ,for example, CPU supports Sv57 then it must support lower
modes.


If I understood the question correctly then we can add function which
will write/read SATP_MODE:
    csr_write(CSR_SATP,
              ((unsigned long)stage1_pgtbl_root >> PAGE_SHIFT) |
RV_STAGE1_MODE << SATP_MODE_SHIFT);	__sfence_vma_all();
	csr_write(CSR_SATP, satp);
	if ((csr_read(CSR_SATP) >> SATP_MODE_SHIFT) =3D=3D SATP_MODE_SV57)
	{
		max_supported_mode =3D SATP_MODE_SV57;
		return
	}
	... check other modes ...

~ Oleksii
     =20


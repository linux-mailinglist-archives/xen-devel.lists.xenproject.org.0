Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB69587BB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 15:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780422.1190041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOkw-0007jX-PI; Tue, 20 Aug 2024 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780422.1190041; Tue, 20 Aug 2024 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOkw-0007hC-M2; Tue, 20 Aug 2024 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 780422;
 Tue, 20 Aug 2024 13:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0MZ=PT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgOkv-0007h6-Eu
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 13:18:37 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4ea8c9e-5ef6-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 15:18:36 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52efa16aad9so6806115e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 06:18:36 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53335df3f87sm789063e87.244.2024.08.20.06.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 06:18:34 -0700 (PDT)
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
X-Inumbo-ID: b4ea8c9e-5ef6-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724159916; x=1724764716; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fXR7VYljGna+zt6ofxbcN6gnAQzndfeuyr1TzdIpJ6s=;
        b=dmfQWQUnWj3DC0MXkmSfEZLe7DGYDYQP0JLvHD7jcTymvo0sVpiNVpUDx20TfUXVYo
         LlkOZlQB0iWhQLDfo1Li3jQ7rHCEcRq3qhamTSQ7C0+16vSoRTyZBgah6eHtrDq+8dc9
         XCM6+bd7pzort6TzCFB3dQ0Q58UDQWZsjd9LBoV7qAZepBRaYxY68ANQYIC63z3M+guA
         qNlq9dPZr1+gQlOCKjYTATHFPGphlQBl078YRxa9kHT64xhyllIFqqLml4kWrxU6njgn
         iBlK6zXJML9sBal5R1zMic7uoqG9lZjfSqkdPBYDXOWf/ZCSjzFAtgoti97QW8nqprGP
         25mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724159916; x=1724764716;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fXR7VYljGna+zt6ofxbcN6gnAQzndfeuyr1TzdIpJ6s=;
        b=atCm9z9pAizYzRzKjmWV23ah+YyXnNCZgqOZIXWYqRPMXhsdWlfUAOYI5A46FR3Ztc
         xjVe8kvecCVrir4+xbCiVNfeAN8S3HBMgYcJh86o2o3FQcZzUjS2uMy4GrJR2pxzLzgm
         PMCqmLRLMh1WNQiuAI44eoKhZQHV9zeFKuBYGW9neXoMBwbwvLs8ewfzieb4y4dnpjN1
         ZYNYczoIKML8hC3bZG1rY8bOUAHryEbCIGdmNq+Z/n/U1zglwihveTqSqcUn9aizrRMk
         LtEniVathBy02KM3ah5parCu4RBZdUbUqgP5eYCw+Ob/1OmH2kfQpnz3NrIKrK++IJth
         f5Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU1+x3EmY8DJkBppvQ121n4An8CAPTT6fort6PbkMVIj7kjz0XULQxz/6uIRh0r8QKoz+1ZN+uJDw2vU90awtQ8Ulg0UVce3CaWDExTpR4=
X-Gm-Message-State: AOJu0Yy8fLI+a+xVjQerXexWSQxVSJsHgwqg1i1Z9rnN95RUXGDwdRgr
	PiNlTG8UFB3m/JzcywE9tTmoEju2c9W0gqeEBo3B15D3TxhtAFBo
X-Google-Smtp-Source: AGHT+IGyQS2RCjwaFtfLPuUosEXH+uY5M/Qua7zWIUThOrOinCZTLzFRxnqRDNU6noQcMiyMAGSUzQ==
X-Received: by 2002:a05:6512:68c:b0:532:ef03:a72c with SMTP id 2adb3069b0e04-5331c6b5ac3mr8120583e87.32.1724159915130;
        Tue, 20 Aug 2024 06:18:35 -0700 (PDT)
Message-ID: <1551cd4dd3b5fcf6aea59a972b60fa6b3b06bed6.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 20 Aug 2024 15:18:34 +0200
In-Reply-To: <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
	 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
> > + * Sanity check of the entry
> > + * mfn is not valid and we are not populating page table. This
> > means
>=20
> How does this fit with ...
>=20
> > + * we either modify entry or remove an entry.
> > + */
> > +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
> > flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN=
) )
>=20
> ... the MFN check here? And why is (valid,INVALID_MFN) an indication
> of a modification?
Because as mentioned here:
```
/*
 * If `mfn` equals `INVALID_MFN`, it indicates that the following page
table
 * update operation might be related to either populating the table,
 * destroying a mapping, or modifying an existing mapping.
 */
static int pt_update(unsigned long virt,
```
And so if requested flags are PTE_VALID ( present ) and mfn=3DINVALID it
will mean that we are going to modify an entry.


> But then ...
>=20
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We don't allow modifying=
 an invalid entry. */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pte_is_valid(entry) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pri=
ntk("Modifying invalid entry is not allowed.\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn false;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> ... I also don't understand what this is about. IOW I'm afraid I'm
> still confused about the purpose of this function as well as the
> transitions you want to permit / reject.=C2=A0
In the case if the caller call modify_xen_mappings() on a region that
doesn't exist.

> I wonder whether the
> flags & PTE_VALID and pte_is_valid(entry) aren't in need of swapping.
I am not sure that I understand what you mean.


>=20
> > +/* Update an entry at the level @target. */
> > +static int pt_update_entry(mfn_t root, unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mfn_t mfn, unsigned int target,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 int rc;
> > +=C2=A0=C2=A0=C2=A0 unsigned int level =3D HYP_PT_ROOT_LEVEL;
> > +=C2=A0=C2=A0=C2=A0 pte_t *table;
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * The intermediate page tables are read-only =
when the MFN is
> > not valid
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * and we are not populating page table.
>=20
> The way flags are handled in PTEs, how can page tables be read-only?
This is not needed for everyone case. In case of entry removing an
intermediate page table should be created in case when the user is
trying to remove a mapping that doesn't exist.


>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * This means we either modify permissions or =
remove an entry.
>=20
> From all I can determine we also get here when making brand new
> entries.
> What am I overlooking?
Yes, but in this case an intermediate page tables should be read_only,
so alloc_only will be true and it will be allowed to create new
intermediate page table.


> > +=C2=A0=C2=A0=C2=A0 return rc;
> > +}
> > +
> > +int map_pages_to_xen(unsigned long virt,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfns,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure that we have a valid MFN before proc=
eeding.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the MFN is invalid, pt_update() might mi=
sinterpret the
> > operation,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * treating it as either a population, a mappi=
ng destruction,
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * or a mapping modification.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID_MFN));
>=20
> But flags with PTE_VALID not set are fine to come into here?
Probably not, I will double check again and if it is not okay, I will
update the ASSERT.



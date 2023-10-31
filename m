Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F07DCCD1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 13:19:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625665.975157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnhk-0002eG-0C; Tue, 31 Oct 2023 12:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625665.975157; Tue, 31 Oct 2023 12:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxnhj-0002bp-TZ; Tue, 31 Oct 2023 12:18:43 +0000
Received: by outflank-mailman (input) for mailman id 625665;
 Tue, 31 Oct 2023 12:18:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6UM=GN=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1qxnhh-0002bh-Tf
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 12:18:42 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa0df9a-77e7-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 13:18:39 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so3819078f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Oct 2023 05:18:39 -0700 (PDT)
Received: from smtpclient.apple ([90.243.16.33])
 by smtp.gmail.com with ESMTPSA id
 t4-20020adff604000000b0032db4e660d9sm1405387wrp.56.2023.10.31.05.18.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Oct 2023 05:18:38 -0700 (PDT)
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
X-Inumbo-ID: 9fa0df9a-77e7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1698754719; x=1699359519; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXBs5lffxv00HHT5fxAvxa+q+IlwADUnP5JLazjQ+JA=;
        b=FWeloDjDjUkRsDRN5G+GrEge1JFlcNZbq/kVzdbL4dDHPb0pt5BuNbOAd9rcmxkbku
         3qY90rjGy7b86ukE8ae90sGoTasMnER/jGAmRpbzi5T0qEitzygtnZexNxMXNmdAaLm7
         ye4kZfhTGaBUtt1X1jM12Km0LO8c4oLadH2Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698754719; x=1699359519;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXBs5lffxv00HHT5fxAvxa+q+IlwADUnP5JLazjQ+JA=;
        b=HfwLUTi/x0Wytyi70CAAIFbiitKf7ybOqyGpnn09SiZipVWqQqMCdLuBu9WbG1CB3q
         jCEiy8wf2NmkRBER7omhMNsWLJpq1uBD8a28rXynSqchx/eOA5mNJoTW2TkPuve9lHxU
         Ek99VeAP4nujiHd1YEbxTUFGMCyEw1TrcMVl/EHy9cSnp7alsfQKT9D0Xlc3czKiK+Zr
         TOfaeX8SULUMkJ4g/mLT594VH7BtmokOnllD1xq4ufjBhBXB14Ts+5uOXVALpTvR3qiU
         tgIC13aBcK2Rv/luv307a4MB4p6DSAzQR9sGWk5o5HBRs+E4STdv98/EQ7yfOs2uOIpa
         7NGQ==
X-Gm-Message-State: AOJu0Yz718EoIqoOffn/j3adDZlHmhnPe8WAAkx5h+Hcb4xLNlH8UiVA
	LOfyFj0tUENgKU0Hg6ITjtgVhw==
X-Google-Smtp-Source: AGHT+IFWdbjVOaX35MUCqpbY1JZNEPj3m0wH3sySklRe1FfwOTdGTMiLFB/AJHh7W+j5D0C2BZvs7w==
X-Received: by 2002:a05:6000:1842:b0:32f:7b2e:2dd with SMTP id c2-20020a056000184200b0032f7b2e02ddmr8151494wri.45.1698754719009;
        Tue, 31 Oct 2023 05:18:39 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [RFC PATCH 04/22] x86/msr-index: add references to vendor manuals
From: Edwin Torok <edwin.torok@cloud.com>
In-Reply-To: <e82f5119-c3e7-4138-8e78-2bea48b638ab@citrix.com>
Date: Tue, 31 Oct 2023 12:18:27 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85F790E1-A2E1-428C-85F6-CBE5D137330F@cloud.com>
References: <cover.1698261255.git.edwin.torok@cloud.com>
 <7e4418cfb1daa172e78fc47098a4018ae0493e23.1698261255.git.edwin.torok@cloud.com>
 <356aa412-453f-f6d7-d61b-5946ba8832e2@suse.com>
 <e82f5119-c3e7-4138-8e78-2bea48b638ab@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)



> On 31 Oct 2023, at 11:34, Andrew Cooper <Andrew.Cooper3@citrix.com> =
wrote:
>=20
> On 30/10/2023 4:15 pm, Jan Beulich wrote:
>>=20
>>> --- a/xen/arch/x86/include/asm/msr-index.h
>>> +++ b/xen/arch/x86/include/asm/msr-index.h
>>> @@ -13,6 +13,16 @@
>>> * Blocks of related constants should be sorted by MSR index. The =
constant
>>> * names should be as concise as possible, and the bit names may have =
an
>>> * abbreviated name. Exceptions will be considered on a case-by-case =
basis.
>>> + *
>>> + * References:
>>> + * - =
https://software.intel.com/content/www/us/en/develop/articles/intel-sdm.ht=
ml
>>> + * Intel(R) 64 and IA-32 architectures SDM volume 4: Model-specific =
registers
>>> + * Chapter 2, "Model-Specific Registers (MSRs)"
>>>=20
>> ... at least Intel's URL has changed several times over the years. =
Volume
>> and chapter numbers change even more frequently. Any such is liable =
to go
>> stale at some point.
>=20
> https://intel.com/sdm
>=20
> This one has been valid for roughly the lifetime of intel.com, and is =
committed to stay so.

That is useful to know, I'll update the URL.

>=20
>>=20
>> Jan
>>=20
>>=20
>>> + * - https://developer.amd.com/resources/developer-guides-manuals/
>=20
> whereas AMD really have broken this one, and don't seem to be showing =
any urgency in unbreaking it...  Right now there is no landing page at =
all for manuals.
>=20


Linux commits appear to reference a certain bugzilla that has the =
manuals uploaded: https://bugzilla.kernel.org/show_bug.cgi?id=3D206537
(although they will go stale in another way, e.g. I see no 2023 manuals =
there, but at least you know which manual a given commit referenced).
Although referencing someone else's bugzilla in the Xen codebase =
wouldn't be a nice thing to do, so if we do this it'd probably have to =
be something hosted on Xen infra.

For now I'll probably drop the URL and just keep the name (so at least =
you'd know what to search for).


Best regards,
--Edwin

> ~Andrew



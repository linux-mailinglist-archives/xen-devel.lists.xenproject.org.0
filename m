Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB17D2F7E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621245.967497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurup-0001SD-PK; Mon, 23 Oct 2023 10:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621245.967497; Mon, 23 Oct 2023 10:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurup-0001QY-Lp; Mon, 23 Oct 2023 10:12:07 +0000
Received: by outflank-mailman (input) for mailman id 621245;
 Mon, 23 Oct 2023 10:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1quruo-0001QS-Eq
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:12:06 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d4a1957-718c-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:12:04 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-98377c5d53eso438453466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 03:12:04 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a170906409800b009bf94de8971sm6417974ejj.70.2023.10.23.03.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 03:12:03 -0700 (PDT)
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
X-Inumbo-ID: 9d4a1957-718c-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698055924; x=1698660724; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6xK8SDq7zaGOIGaJt/Q7MFDGfqFif+3uGMUqsQS0U7U=;
        b=GvhzNgaKK0yTwsPDfN1RFJj6bxfRJdqeu/UgXJX6Cb8hSk9CXNZE9Yn5nhkF4EVXYG
         fHcSff3ktBkw/VIC2OD0JM2jqzuUzlGHLjLeLVJl42gKnAHFRY2rgggXQOkvD96SIlPM
         JaGnC2xfbKCY0XPBVPNsOSyVVC3GJod5roIr/aZEb9lBTtnOJq5w9M9mrsV4esf/Xl8c
         jhvLA25XEcBVDhhJ7IVPaNmE6j2YRZpTlxXOoz8j0tE2XUIG0u9+7KBVD71LXDkz8pJ2
         3+vfdP3RMWYVQlwdAHPUb8sIrLiPtWAj/YgYWSuyzaafxVFNOvwgKEKOPnOrpLNBCCE3
         4m+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055924; x=1698660724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xK8SDq7zaGOIGaJt/Q7MFDGfqFif+3uGMUqsQS0U7U=;
        b=cAzqrN+Yn4GqDWqPbbE8CWWRO1mbC+tBB9Q4sKa+21EOjj+Ar7QsGIdKZq43MuYQvK
         T0ObDQ3O/gIe2Nel6SGY7qCcOA/4mvSWAb+omUcvEavOM9TqW/LsHG9RKWdisEUzPLhC
         KWMU6Apr6DYLYutAdhuWL5LoJag7K8e0rLtUqbkX1ZdufvgcWsqwi6Haz4svurfvfJQ/
         lSRdkHSvii61vvfeGkFepuNKIeAHvP6LQSez0hN7veqWXIkkXKAZmHwFHhvEZWDhbBp9
         YUQAfDjLyX7bjkg5azRn+smUxP9+x7ERAYwWcoxVazahhx8QOO0qysY/20nMyiAiqjOL
         fwQA==
X-Gm-Message-State: AOJu0YyQFOn436V6mXcUBQx53KwRdetBpVZl21k85Y/MAh1mzXz5Te1P
	oJqKbvdJPAaaGJrEnUoj6eRU/ekxNhk=
X-Google-Smtp-Source: AGHT+IFtKxUbxh2bx1PGn2I1CgNiRvmbuT7I60AeR8jPK8iavkQjMQkfbyBr04uqLgtLiTtmaGUv4g==
X-Received: by 2002:a17:907:60d4:b0:9a5:9f3c:9615 with SMTP id hv20-20020a17090760d400b009a59f3c9615mr7865072ejc.63.1698055923781;
        Mon, 23 Oct 2023 03:12:03 -0700 (PDT)
Message-ID: <17fbd1d2c9f1fb1fa5121f69c743b2cd766f7620.camel@gmail.com>
Subject: Re: [PATCH v1 04/29] xen/asm-generic: introduce stub header device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 13:12:02 +0300
In-Reply-To: <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <3cc9ecc3abcd21c5ed7276b01bf5963e6a5fd5e0.1694702259.git.oleksii.kurochko@gmail.com>
	 <a20f5783-7ee3-6ed1-d4cf-379c30c64a12@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 11:14 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/device.h
> > @@ -0,0 +1,65 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_DEVICE_H__
> > +#define __ASM_GENERIC_DEVICE_H__
> > +
> > +struct dt_device_node;
> > +
> > +enum device_type
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEV_DT,
> > +=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > +};
>=20
> Are both of these really generic?
>=20
> > +struct device {
> > +=C2=A0=C2=A0=C2=A0 enum device_type type;
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +=C2=A0=C2=A0=C2=A0 struct dt_device_node *of_node; /* Used by drivers =
imported
> > from Linux */
> > +#endif
> > +};
> > +
> > +enum device_class
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_GIC,
>=20
> This one certainly is Arm-specific.
Yes, but the definition of GIC sounds common, so I decided to leave it.
But it can be changed.

>=20
> > +=C2=A0=C2=A0=C2=A0 DEVICE_PCI_HOSTBRIDGE,
>=20
> And this one's PCI-specific.
>=20
> Overall same question as before: Are you expecting that RISC-V is
> going to
> get away without a customized header? I wouldn't think so.
At least right now, I am using the same header device.h as in ARM, and
there wasn't a need for a customized version of the header.

~ Oleksii



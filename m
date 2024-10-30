Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AD9B5F3C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 10:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827965.1242742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65Lw-0005Un-J7; Wed, 30 Oct 2024 09:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827965.1242742; Wed, 30 Oct 2024 09:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t65Lw-0005SS-GR; Wed, 30 Oct 2024 09:51:00 +0000
Received: by outflank-mailman (input) for mailman id 827965;
 Wed, 30 Oct 2024 09:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhn2=R2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t65Lv-0005SM-Qy
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 09:50:59 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7547a5e7-96a4-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 10:50:55 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fb56cb61baso49894231fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 02:50:55 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fd4ae94efasm2178031fa.50.2024.10.30.02.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2024 02:50:54 -0700 (PDT)
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
X-Inumbo-ID: 7547a5e7-96a4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMmIiLCJoZWxvIjoibWFpbC1sajEteDIyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc1NDdhNWU3LTk2YTQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjgxODU1Ljk2Mjg3Miwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730281855; x=1730886655; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I9QfHiN6KO9PbsM5LkHekGj8evBN/yUgpQqO5ZsuaCM=;
        b=J2f8NU1vrckb51o2Xy2ZA5ZmSWbt0xJtm+CTfuPO4KUXROYAYGM2ldrt0B9vObIFw7
         LBNeVqmr4ORx6SLP0RGjCZLGxACQVVZdal/qUT6IbOSfv5m/eJF/AfCV9/a+rd1ASM1v
         a+vGiDrFgj56qvXzRL5W/TNXgHxEibV86vlUOf2gtDKATEs7Qs6xEsyJcGh8dQ9U0sHg
         WALbhFAlBZoaXMxoaqa0O/rY6xZdCYdykyokl0gV8iAESXK0fFcDtgN1oQDx+iPXfbFe
         Vuqi7QA9zzkVZ9iMNMCP0Nw+wBcEEtwAZTy6iIyRAdxNN1IsJzprcGMWLlpJapqHa6zL
         grgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730281855; x=1730886655;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I9QfHiN6KO9PbsM5LkHekGj8evBN/yUgpQqO5ZsuaCM=;
        b=VwzAVliyNRtUKjMtJLt3kqmYdUyjFZG5UNZMdoa48Lb7E1D56IHcMGSLCJUBVg7bZm
         Z7CBBfMNO77+acoO1WiL9meP3BIayOIsxal7Q/3G03UD7Gr6XncfDTGXMyKf2Vn+/f9W
         MOZ/HjMzkztguShy38hplEq6UbMvuqSNt/8InZN+zedkYzU8eWaTMv4/7NLtESF+BfOU
         FyUJ1GQ6HvCv2l/0QK0IO4/qOVrqJUKUHQyw/TYbxL71SxTedq0SWRRNphAZanxH4q4Q
         YKJC74km73CgaCFM5fP7xIvSeB/0tCku6SibYhyuD1blw28T38AoUSeiaGmSqQ9dGQOV
         q2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXqxLKdRPcb50e6Z2Q9AecYrwLaSS0cXaWtsA586tv2Pk1pmhoIAre5/1Erskha9mOhiP91yzo1y5Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytmh0737H/sSWtjwtBlUEmSG03X2Q8PFtbQmOxgtn/0ioxUnrj
	RRRP6018ypo/oqEPNV5kG3Psod1fwWdlEA17b4TTyIomEMyu8hgp
X-Google-Smtp-Source: AGHT+IFQoB1TYL2PBCcqr63uVPx7OGGJ8JYn82dW5eFmYVUYMNTnrQdDJgfsjM+XwhrTBw0cCaXXbQ==
X-Received: by 2002:a05:651c:50b:b0:2fb:6277:71d0 with SMTP id 38308e7fff4ca-2fcbdfc5d1amr78574751fa.22.1730281854951;
        Wed, 30 Oct 2024 02:50:54 -0700 (PDT)
Message-ID: <f26637fa6f315385e0c1f2cbb338389d7c8b0587.camel@gmail.com>
Subject: Re: [PATCH v1] xen/common: move gic_preinit() to common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk	
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org
Date: Wed, 30 Oct 2024 10:50:54 +0100
In-Reply-To: <a5539c03-4e19-4739-95cf-439aa0bea9a3@suse.com>
References: 
	<b1ded26dcebf9a3228fe4062825273720e0c59fe.1730220384.git.oleksii.kurochko@gmail.com>
	 <a5539c03-4e19-4739-95cf-439aa0bea9a3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Tue, 2024-10-29 at 17:57 +0100, Jan Beulich wrote:
> On 29.10.2024 17:47, Oleksii Kurochko wrote:
> > --- a/xen/common/device.c
> > +++ b/xen/common/device.c
> > @@ -4,10 +4,14 @@
> > =C2=A0=C2=A0 *=C2=A0=C2=A0 xen/arch/arm/device.c
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#include <xen/acpi.h>
> > =C2=A0 #include <xen/bug.h>
> > =C2=A0 #include <xen/device_tree.h>
> > =C2=A0 #include <xen/errno.h>
> > =C2=A0 #include <xen/init.h>
> > +#include <xen/kernel.h>
> > +#include <xen/lib.h>
> > +#include <xen/types.h>
>=20
> I don't think non-ACPI configs should include xen/acpi.h here. Surely
> this
> can be moved down into the ACPI-only code section?
xen/acpi.h was included as acpi_disabled is defined there and it is
needed in commom/device.c for:
```
void __init ic_preinit(void)
{
    if ( acpi_disabled )
        ic_dt_preinit();
    else
        ic_acpi_preinit();
}
```
It seems to me that ic_preinit() could be also in generic code and just
ic_acpi_preinit() to be defined in architecture specific code.

~ Oleksii


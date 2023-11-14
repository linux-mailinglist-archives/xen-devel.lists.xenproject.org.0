Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD897EADC1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 11:15:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632306.986569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2qRk-0001lw-BL; Tue, 14 Nov 2023 10:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632306.986569; Tue, 14 Nov 2023 10:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2qRk-0001it-6r; Tue, 14 Nov 2023 10:15:04 +0000
Received: by outflank-mailman (input) for mailman id 632306;
 Tue, 14 Nov 2023 10:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJWh=G3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2qRi-0001iB-Re
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 10:15:02 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab83805d-82d6-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 11:15:00 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so7269978e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 02:15:00 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t19-20020ac24c13000000b005079fd88326sm1283815lfq.45.2023.11.14.02.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 02:14:59 -0800 (PST)
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
X-Inumbo-ID: ab83805d-82d6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699956900; x=1700561700; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wZESUR463gCf83xvsmQf28nbzNqjE0j1inQI3/0Uh4w=;
        b=fM06CCJfcVE91EItQwbvoGjBhZJX5EfQd/DLejzv5/bjnYwMZhFPOCJqGICrdD4pIk
         0TUe0gl0USsLfsp4LnXxGeAcOA2wC3lEbSTYqzuqjp3fgeVUV0cuHYW5t6uYRCWLnvOm
         OrN5xZkUW1JY3FYSYW22KO3bKn7cFB5ga51sSFyWjLoZmg7INOI/dkAIAtyEr/leIfdw
         bZDMqJ7hysfUlSds+Eez/zoDXedwORKP1LuRlWiF8/DRTjKqHDE4f5UmnHwLxOcwIwTZ
         IQzT2OVEyGZe0OWEQxxzTUFtxSx7Ky6HNJym2pTRYqg7NneOxLVd3Ox/z82WXRaLiicH
         O2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956900; x=1700561700;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wZESUR463gCf83xvsmQf28nbzNqjE0j1inQI3/0Uh4w=;
        b=u0tcibZYcvDTYz43hU4qDlWvQu65VxNa1fRJCgF1iQwwnyvpbrIJ+ivBgPP1b7CYKK
         nxfSdRLpgdGUEtldCwzSBRXUlSCVQnF7xy+RUC12u1cBvk2fDBMz37n4Gt8q8jpz49Iq
         dNQwzviwI8p5IaXhyLpEq5VyLO+KrqLt2UYHT4nzgEfKYnoseSmmCtiX9hUb97bPGDQz
         MbFb+e+pJjo96jMWU1uaX5jRVQ6/yogNtOVA4d9+v6day1LnT25eA7qcKdvhRG238x8F
         JalH2RVyCOsyhp+XSYtEXH/SMVyZdhogm6gg8gM6em2QI6yp/ModhYOynzekqXGJ64zk
         E7rw==
X-Gm-Message-State: AOJu0YzW/Kmh7QkCF2Jyo8SgwKT7X2gi5PoRxu+TygwJ7gMgsoC4gNSz
	Ivq4ADkOe4YnEd5qi11jFag=
X-Google-Smtp-Source: AGHT+IF6IPX4wFvnY+cXlwW1F0VaLz6Bw6Z9KmD2VJDRm4dj6sHCW8c3tzuouBxh5md1Ozh3D0lbRw==
X-Received: by 2002:a05:6512:ea2:b0:509:4a02:49f7 with SMTP id bi34-20020a0565120ea200b005094a0249f7mr7662123lfb.44.1699956900063;
        Tue, 14 Nov 2023 02:15:00 -0800 (PST)
Message-ID: <b36dcbb4231fa8fe8b6a39e1dd801b7f9381fa38.camel@gmail.com>
Subject: Re: [PATCH v2 05/15] xen/asm-generic: introduce generic header
 iocap.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Nov 2023 12:14:59 +0200
In-Reply-To: <583e3c47-e5e6-b6d9-79dc-81e115a9b43d@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <6ea2fc1c12fa08e7cc6a47735c4fcd49c48ac4d3.1699633310.git.oleksii.kurochko@gmail.com>
	 <583e3c47-e5e6-b6d9-79dc-81e115a9b43d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-11-13 at 17:48 +0100, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > iocap.h is common for Arm, PPC and RISC-V architectures thereby
> > it was moved to asm-generic.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > The same question as with device.h. Should it be in asm-generic?
>=20
> I think it's okay(ish) here, considering that ...
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/iocap.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_IOCAP_H__
> > +#define __ASM_GENERIC_IOCAP_H__
> > +
> > +#define cache_flush_permitted(d)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 (!rangeset_is_empty((d)->iomem_caps))
>=20
> ... the only thing referenced (iomem_caps) is a common entity. And
> again Arm demonstrates that an arch can get away with just this.
Thanks.

Then I remove redundant headers from Arm and PPC and send new patch
serires.

~ Oleksii


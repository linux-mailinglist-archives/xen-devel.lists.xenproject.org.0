Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9B78D691
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 16:33:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592995.925875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMFf-000146-Ez; Wed, 30 Aug 2023 14:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592995.925875; Wed, 30 Aug 2023 14:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMFf-00011w-C6; Wed, 30 Aug 2023 14:32:59 +0000
Received: by outflank-mailman (input) for mailman id 592995;
 Wed, 30 Aug 2023 14:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FTw=EP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qbMFe-000115-LN
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 14:32:58 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c0084ee-4742-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 16:32:55 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50087d47d4dso9024882e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Aug 2023 07:32:56 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a19a409000000b004fcdf99be86sm2379655lfc.239.2023.08.30.07.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 07:32:55 -0700 (PDT)
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
X-Inumbo-ID: 1c0084ee-4742-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693405976; x=1694010776; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BHYAIuoCJpvAEES+PbiKH9+OZrLgsOmwlGRQOXKEcmo=;
        b=ezmG5SlEzpuOKxOA632oQ0GOu1p14UbTcufCX9P93wrz3NxCm/dkANEoW71rxoArm6
         2uMgo37YfBZFsVAA1+o/2/0sA+aHaa5sJuV0L/i8Eu6WkSwccRxmjZFuNytA/BHD8aL1
         20KJsxJWxEBdVfqCPWdshedaAQjN82cT9rLv+EsEVmFFFIc4b1ts+zERCx1YvJ8WjFEo
         4N+t45w7622yuP8jbGHqRxL7dskASkGaZCnLw+Vld1WyxlfHgL83Ewz3CradpWN31/NJ
         lnLhqebDqVmuO9dgW0qU9Y3QrfpQYD8YWsjcrn1Yfms2pXqWTR3e7v9U3zlrU4HL0leq
         G0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693405976; x=1694010776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHYAIuoCJpvAEES+PbiKH9+OZrLgsOmwlGRQOXKEcmo=;
        b=Pkw5Ui3fn3PFlXq1Nwk5neW26MtpHQ/RLqSNMx+d06xkjcjd5LYMG1eFfly/vJQ0fz
         jOuew+by8vjRBmNuvdKRIgU4rixffeLgv+NKGxomBjUypLuFw+HWS7rK0RNXXn73ldMq
         r+JvxNw+jWFw/KQgxcL++ZunBWO2KFGkoHmtGNGaqWn+MzqO39IdzKoiMTzWKOTpQViH
         Ke63oxW4RHtgVUvE2f/S1B/5fE7uMZa/f7Z34A9t3NWW0T8lQBRElgyCWQt8NEAywNtF
         es4G7WjMwGIXC5ll5yEpF9RZjAvXLqZqLCTvOK2y70mWqrSPAu70npiVtuuSf5HcIElM
         c5iQ==
X-Gm-Message-State: AOJu0YyMzDHHzydqMJORx1mN+ZHVNCs3wwAzwGkz0LDOEglIuQi82bQP
	u8Nq4T913oG217YKdp/wpFM=
X-Google-Smtp-Source: AGHT+IHYIXBUt4wGCfJWbnz9z5Zg12WBlGPG1l0fR43G9R/VyPaWPNAGWZTqRq7QWz2A2Nc7zeHhcQ==
X-Received: by 2002:a05:6512:234d:b0:4fd:fd97:a77b with SMTP id p13-20020a056512234d00b004fdfd97a77bmr2088161lfu.50.1693405975684;
        Wed, 30 Aug 2023 07:32:55 -0700 (PDT)
Message-ID: <00082a3665b18054dc2eb3a5446e33f2e7e73ae4.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] xen: add stubs dir to include path
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,  xen-devel@lists.xenproject.org
Date: Wed, 30 Aug 2023 17:32:54 +0300
In-Reply-To: <f1af0e80-722f-9f47-0618-a31ffe0bbff8@suse.com>
References: <cover.1693319118.git.oleksii.kurochko@gmail.com>
	 <09fa701d2be02589cc9f63d8334082346b5c1702.1693319118.git.oleksii.kurochko@gmail.com>
	 <f1af0e80-722f-9f47-0618-a31ffe0bbff8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-08-30 at 09:30 +0200, Jan Beulich wrote:
> On 29.08.2023 16:34, Oleksii Kurochko wrote:
> > --- a/xen/Makefile
> > +++ b/xen/Makefile
> > @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
> > =C2=A0endif
> > =C2=A0CFLAGS +=3D -I$(srctree)/include
> > =C2=A0CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include
> > +CFLAGS +=3D -I$(srctree)/include/stubs
> > =C2=A0
> > =C2=A0# Note that link order matters!
> > =C2=A0ALL_OBJS-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :=3D common/built_in.o
>=20
> I have to admit that I'm not entirely happy with the name. I wonder
> what
> other REST maintainers think. In particular I would consider using
> Linux'es "asm-generic" name instead, allowing to cover both stub
> headers
> like the one to be introduced here, but also other kinds of
> "fallback"
> ones.
It make sense. I'll update the patch series.


~ Oleksii


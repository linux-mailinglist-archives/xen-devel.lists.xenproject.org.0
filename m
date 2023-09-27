Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 716117B012E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608834.947588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRLR-0004kp-Cr; Wed, 27 Sep 2023 10:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608834.947588; Wed, 27 Sep 2023 10:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRLR-0004iO-9p; Wed, 27 Sep 2023 10:00:37 +0000
Received: by outflank-mailman (input) for mailman id 608834;
 Wed, 27 Sep 2023 10:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yKED=FL=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1qlRLQ-0004iI-Bp
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:00:36 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b325865f-5d1c-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 12:00:34 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313e742a787so7155957f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Sep 2023 03:00:34 -0700 (PDT)
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
X-Inumbo-ID: b325865f-5d1c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695808833; x=1696413633; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ppec7Arbp5jrClzF4Ov2I+Cas5TkMngBgUXcg8S83oI=;
        b=X0wkaC6FQB2Jap2o6iWoA5zCLD+ygrokV+uMedmaoQNvQqKlnUgSpgxgGfrOKhd2ln
         lQsIRkNUa5dMx4/KT7PVM1y5AqiFkZex+yZNzgy52WSsFdCvZRVHV1B1VgtHFoo+4gNz
         jX5Eu1clxy6ZXiN7gtP3GDTDRS5TWs0BQo7pM4A9bUbLwuRkvvYZbvv/LWUhJrYdr0pZ
         ue7WdcNpv5teHixVYcAmwuYvKUDfCX4/YDZ+tMqJUVGtSi7hveAIokCKeaSISXNnPBhN
         4iSNR0Cv39mNLPv8H3NmM4YoHM3E6dczhKX/JKn91PEhtETdhTCAvtZoxF1D94nj1mVG
         DCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695808833; x=1696413633;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ppec7Arbp5jrClzF4Ov2I+Cas5TkMngBgUXcg8S83oI=;
        b=QoGE6wDykfFRYp28UfhcDsKAVJeBY29C5I34ZOerF5OKWMz0wovL58SI6QvnCqW/Iu
         GYDfBG/NlDIob7lzT8zbBe4/DAVyjM5YaDVlTxQsOjZG7nPuHgjrzmJVjOrUbbNAFNlb
         Zefcy9XVWo4AKFOtnBs+OkMmgeexzLoAfqBP3+ebBsEJPtZ0HWKtSNV1hLWLfndCzU1y
         paRZOglT/oLeYF0sNG7pp7pCR32Hk3myBJSFVDiZIHGF3kJgeJD37DzEvMEltB/qGnXD
         ioIwLN2eiy+gz83Dn4ZyOoYGfkfc/5BxGKd3jaO2uVX8Gvo8aBVY77tOsKCIvMcedLnE
         7GLw==
X-Gm-Message-State: AOJu0YzxOZIxEvUwg9j83uMQmXApbXqEbquC/IPT/afG+Dhkntgsw21Q
	IHsZxyC2EDuuJMV5gW9wwkrmeU+7f+WciZ6ZHoLX9rTR+3vBvQ==
X-Google-Smtp-Source: AGHT+IFzwTxW4CtN+lj9pKsHSsFsqL7PtsMdtIvc4SnEJeLboQ5akrCL5e4alDITjZ7i2R0muRdAFA6puVjh4yIcUe8=
X-Received: by 2002:adf:de11:0:b0:319:6b56:94d9 with SMTP id
 b17-20020adfde11000000b003196b5694d9mr1390241wrm.2.1695808833230; Wed, 27 Sep
 2023 03:00:33 -0700 (PDT)
MIME-Version: 1.0
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Wed, 27 Sep 2023 13:07:27 +0300
Message-ID: <CA+SAi2tXMupikB2YgEXuq98KnOcqm6zWrk19rNvWTfzf2=ku-w@mail.gmail.com>
Subject: changing Dom0 data during smc call inside of xen during cache coloring
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000001ca4af06065443a7"

--0000000000001ca4af06065443a7
Content-Type: text/plain; charset="UTF-8"

Hello,

It is necessary to change some structure contents from xen.
I have access to the registers.
One of them keeps the physical address of the structure.
But this physical address is valid for Dom0 only.
Dom0 kernel gets it by the call dma_alloc_coherent
A lower mentioned scheme does not work.

            uint64_t paramaddr = (uint64_t)get_user_reg(regs, 2);
            uint64_t phyaddr = mfn_to_maddr(gfn_to_mfn(current->domain,
                gaddr_to_gfn(paramaddr)));
            phyaddr += (paramaddr & ~PAGE_MASK);

Regards,
Oleg Nikitenko

--0000000000001ca4af06065443a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>It is necessary to ch=
ange some structure contents from xen.<br></div><div>I have access to the r=
egisters.</div><div>One of them keeps the physical address of the structure=
.</div><div>But this physical address is valid for Dom0 only.</div><div>Dom=
0 kernel gets it by the call dma_alloc_coherent</div><div>A lower mentioned=
 scheme does not work. <br></div><div><br></div>=C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 uint64_t paramaddr =3D (uint64_t)get_user_reg(regs, 2);=
<br>=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 uint64_t phyaddr =3D mfn=
_to_maddr(gfn_to_mfn(current-&gt;domain,<br>=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 gaddr_to_gfn(paramaddr)));<br><div>=C2=A0=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 phyaddr +=3D (paramaddr &amp; ~PAGE_M=
ASK);</div><div><br></div><div>Regards,</div><div>Oleg Nikitenko<br></div><=
div><br></div><br></div>

--0000000000001ca4af06065443a7--


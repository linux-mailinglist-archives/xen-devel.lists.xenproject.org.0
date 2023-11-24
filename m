Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9FA7F7362
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640607.999045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Uvg-0002E5-Mo; Fri, 24 Nov 2023 12:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640607.999045; Fri, 24 Nov 2023 12:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Uvg-0002BL-K4; Fri, 24 Nov 2023 12:05:04 +0000
Received: by outflank-mailman (input) for mailman id 640607;
 Fri, 24 Nov 2023 12:05:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6Uve-0002B5-LW
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:05:02 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1790a10-8ac1-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 13:05:00 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507cd62472dso2990297e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 04:05:00 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b005094bb01fc9sm482002lfk.214.2023.11.24.04.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 04:04:59 -0800 (PST)
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
X-Inumbo-ID: b1790a10-8ac1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700827500; x=1701432300; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jJ1i0rq5SwuwcUAeNq+EFJI4VkV9z5Ur4Q3402blaDQ=;
        b=iWB3qzj+3dO73MG3OW8t72rDqXwq4GecpYFfdETgUhcvbWGkDthZFujDgEGv6/krmX
         2l0OUjP0uWR5aWbBLNe3b3zipFppcH8bKdAQSLW0orQasjxCZxErVH/iEgc3/sIXcRSe
         GqRmMAEJ+wM4+jX2+7ZZw+/s9+QlSKsQ6tripmiGJf8rbQE3o5KOlejoMsg6sS2m6GYK
         z0C5mwXR0MibEWcbAXfewA1dHuBlWMqi553Vs5XJ/3jFlI7YH+Y5ACFeSIE2Qm7EELFr
         jlpl1YMJAlKZK5ae0ETz6Mxa0++XiXS+fN8FqbVsb6HpIzRuPvoKeLpeQZJlk2sVKFrd
         VidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700827500; x=1701432300;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJ1i0rq5SwuwcUAeNq+EFJI4VkV9z5Ur4Q3402blaDQ=;
        b=l+/eZBwxPr3SYD12+Bp0bTCpznmEutsmngY0dy8j5ll2fpSa1GGAvykqiKvjKZ/pOn
         ABehHW1uOju7Oz5u7l1C22ks/g6l+lHpx40cUPQ41qt9AaapjcgGl05YOZKM/YITGnzQ
         eh3dVkc4boHQbTeCBuEUcZOCAjMpUWSA5q7h+6fTz76/a5rVLhrQ9qHScMahEF1g9U8e
         OK19UxzlfvHstYIEva0nNSI0HZ86tr23VsTka2SxYRnv15+I37LamXxP+cfEen1aEJfT
         b0l9QLnIPbPV69l6rqiSmIs8JEwmBk5JpKeqgJT0SYpvj9TBtdku1zVH8qMi4kpFKd6a
         Xcig==
X-Gm-Message-State: AOJu0YyXplNQoVbQg30cCDJxGy5OiGb6othOB9KFzkr+2JXcYIBQ0kLm
	8/9ZfQEdnDICmeUgX9355Dw=
X-Google-Smtp-Source: AGHT+IFNF1cIRHMSBfe7rC8ZOBPIGR9IhOkHCFCTpx0hikiqqevF1oX1R7yeQ2ESewkwEQSeySuX+Q==
X-Received: by 2002:a05:6512:3d91:b0:50a:a790:3096 with SMTP id k17-20020a0565123d9100b0050aa7903096mr2734852lfv.5.1700827500068;
        Fri, 24 Nov 2023 04:05:00 -0800 (PST)
Message-ID: <6044184c7ae2f656b5fdaea1a3c38d8602d08350.camel@gmail.com>
Subject: Re: [PATCH v3 08/14] xen/asm-generic: introduce generic div64.h
 header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Fri, 24 Nov 2023 14:04:59 +0200
In-Reply-To: <e36923e2-337d-4801-8184-80867138ded2@xen.org>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
	 <13bf409f3191d066af9caef417011b6ea039dbd9.1700221559.git.oleksii.kurochko@gmail.com>
	 <e36923e2-337d-4801-8184-80867138ded2@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Fri, 2023-11-24 at 11:29 +0000, Julien Grall wrote:
> Hi,
>=20
> On 17/11/2023 12:24, Oleksii Kurochko wrote:
> > All archs have the do_div implementation for BITS_PER_LONG =3D=3D 64
> > so do_div64.h is moved to asm-generic.
>=20
> You are saying "all archs" but ...
>=20
> >=20
> > x86 and PPC were switched to asm-generic version of div64.h.
>=20
> ... you only switch x86/PPC to div64.h.
You are right. I wasn't precise enough. Also RISC-V uses asm-generic
version of div64.h but for that I have separate patch series.

>=20
> I guess this is because for arm we have a different implementation
> for=20
> 32-bits. The 64-bits version is the same as x86/PPC.
>=20
> So I wonder if it is possible to include asm-generic/div64.h from=20
> arch/arm/include/asm/div64.h?
>=20
> This will avoid duplicating some code.
Yes, you are right. Arm wasn't switched to asm-generic/div64.h because
of different implementaion for 32-bit.

I think we can include asm-generic/div64.h excplicitly for Arm. I made
a little test and it works so I started full CI and if it won't any
issue with Arm I'll update the patch.


Thanks for the comments.

> Cheers,
>=20



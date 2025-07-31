Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2858B16E0E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 11:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065104.1430433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPAW-0002lZ-FT; Thu, 31 Jul 2025 09:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065104.1430433; Thu, 31 Jul 2025 09:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhPAW-0002iW-Cc; Thu, 31 Jul 2025 09:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1065104;
 Thu, 31 Jul 2025 09:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X87O=2M=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1uhPAV-0002iQ-8X
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 09:01:43 +0000
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [2001:4860:4864:20::32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f24a62-6dec-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 11:01:41 +0200 (CEST)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-306cce02908so96277fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 02:01:41 -0700 (PDT)
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
X-Inumbo-ID: f8f24a62-6dec-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753952500; x=1754557300; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F41fZOJTrEvSqabKMQc7/sYl4FRr0GZdxcNwBZDrIi8=;
        b=Mj4CH0bf3HaSAIc7QLM7Cs2g0HNGPnltbPO6najx7O/XHLVX1CI07+mXpUfFI51cih
         HCNbqLtpaoFQaURMrTr+0u/AXizoOzkV6ymQrKFN9hOJ8jrSAAT+Z0pS7fgli2TkHsb6
         nmaZ/TeWh/nM9F2HhD2c96/UJ3pv7mbT1GeWD+nVR7zg3afkJuW+qVe+xy+GPVJoU8vQ
         HAPehzzxPx033Sw7nM+6LNwip8AbnIFl/aex90ShjGC7ESiUoJuduMhruri47+Dij6bA
         8jnjCpV5avNvqxn5wxxtRWYbPnCaH7LodCViAvZM9x94t5n+UbpvDj6GG1oEqvdydKY2
         Q9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753952500; x=1754557300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F41fZOJTrEvSqabKMQc7/sYl4FRr0GZdxcNwBZDrIi8=;
        b=kemEj5kOA73b8WJlny0oFBfB3r2sw5lQVwxWjsKDt2BArGIpNKs0VCsmdzflvNCz6E
         iiW4Dk93z/Rr5wk8Oigt0wDc1/j/Foq/KiYTVP+wFqy1izYfdl+rMkNpfUGhnFNQGLfR
         7k9XYyyH9qTgCGWc94u7GHt44vpjQl8I7396wDKZZVaR1A5HXkV/kycWKo93trh0yt0p
         d8El1/7oCS9sdXNTh5usi0CMPcTD1S92bJYpvm0zt0DLfaAzFM8g2oVCbCcXr2En2f+O
         7O0NSp+ENUsFiQZfjKXkfXKjKToUeW8ewPMd0KnDjI2/IP5hInJMi0llnjbvKNrdjeok
         lv3A==
X-Forwarded-Encrypted: i=1; AJvYcCW2vHCQaQxbWzviS2XN4LENmNNWXpwM1DBhYd+WPG/C4Udt0k24ewsj2uRIh6047ZtyJG6C08HGuXY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxeJJbxHMTgN8mJVz1wpaZCnDKHkR/oGg0C9/quHGbKV6O+dJxf
	BqMwHg0elUmFdRGGCvL3Tk6smcNxfBqJBwj1dVSenXcIMeQ4BwjaxbCJMBD7kRpd6/5GMZliT74
	xIHl1vx5bDvcURM7CIFKCeXw+gZRTrADmg8puM7I=
X-Gm-Gg: ASbGncvSuZC5C5LiXYM+tbUoJzyCjRRM/SMaTF21lg58QuE1SV6uRghOVV9l9rwnzfu
	vS1Ad/0Dot8MeWI64S+whVfXxaJKvrJ+JBSOpn4d8ZnsMhH3MnOaX89ZMmA25vmc6VoRkCoINV8
	MdUJfAWXBJMa80luVUmX0atorbtewqAeGX6g80XyCGOEJA+HL2TtXZ8cUYgsxjSJv6EvUyMrHZq
	3CmSanOtN/XU8ijz8MAYe/ih3TuZ5xzyXW+yv93Og==
X-Google-Smtp-Source: AGHT+IFeuFDTmCr5z/omxLS6ddBNKLZpVvh7m5m4q8eYOezYFdR0a3zVj7j7NoHrlF33iIQKkbDWE2Xtvk794JunerU=
X-Received: by 2002:a05:6871:296:b0:2d5:402:30a6 with SMTP id
 586e51a60fabf-30785a203d9mr1592953fac.4.1753952499895; Thu, 31 Jul 2025
 02:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1753869323.git.w1benny@gmail.com> <1f452cde49cd9cfa949affe6061fc628de434e18.1753869323.git.w1benny@gmail.com>
 <59f03a28-71a6-4cbd-aca6-0a5a1bf1f0cd@suse.com>
In-Reply-To: <59f03a28-71a6-4cbd-aca6-0a5a1bf1f0cd@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Thu, 31 Jul 2025 11:01:29 +0200
X-Gm-Features: Ac12FXzHtZ16Zosk6mQ52U68bvjL5Pa8YqiMF6P3Y6Ux0auOS0driEPjzNsrpqk
Message-ID: <CAKBKdXhY-4yFnZJmmgc8NMy9KhZPCaTzPu9xEEG4ZudCSs1kiw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] hvmloader: fix SMBIOS table length checks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 10:36=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
> With this, the function parameter may better be named "min_size" or "req_=
size".

Agreed.

> Was this meant to be smbios_type_2?

Wow, that's a nasty typo. The offsets even match. Thanks for catching
that - yes, there should be smbios_type_2.

> The adjustments also look to be isolated enough to carry out while commit=
ting.
> Provided of course that you agree with making them.

I agree with the adjustments. Feel free to fold them in while
committing. Thank you.

P.


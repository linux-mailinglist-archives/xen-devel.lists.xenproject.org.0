Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF4650CA6
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466102.724945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7GE3-0005cN-6w; Mon, 19 Dec 2022 13:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466102.724945; Mon, 19 Dec 2022 13:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7GE3-0005Z8-3z; Mon, 19 Dec 2022 13:30:39 +0000
Received: by outflank-mailman (input) for mailman id 466102;
 Mon, 19 Dec 2022 13:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuS/=4R=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1p7GE1-0005Z2-Nj
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:30:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cc9effd-7fa1-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 14:30:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so8853493wmh.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Dec 2022 05:30:36 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003d01b84e9b2sm12572845wms.27.2022.12.19.05.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 05:30:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B5B21FFB7;
 Mon, 19 Dec 2022 13:30:35 +0000 (GMT)
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
X-Inumbo-ID: 4cc9effd-7fa1-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlPLPpl56U/bXAj2k5gLxsEbWsnUhmMHwa6ZL+b6GYc=;
        b=sISDUqyFevk+LKCQngSXmeQKP3X6KbLF9UiUup/BQPFP5NC/yG3CR2rtOV5AOlrRoz
         2NfhmGDJoymDeeU1OuNOCpcggembl3ODt/QiQGGxbWuD/2pVml7c7KZ4wcA8LLW+JGWI
         uNjHl3n4pNy8D4ihyteytl8+69GSgm2PimiHPH/3Dhk1NKjGom5nfQLzIZuV+OzjGP2k
         jpXnXUVnsKZ7Oje/Id0pqtFQ7NNeB+07P8sRkq1HHfcQfQ9ukAgRd17X3UqndU7FS95c
         m3vltdF3Xuipy7lAKI1qsmZxs6EsFTU2PplX5F6sIoVEA79Qk4nKfcCMSoeAEdyNxLhH
         EyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UlPLPpl56U/bXAj2k5gLxsEbWsnUhmMHwa6ZL+b6GYc=;
        b=2ByP+T7z3ocJ9q3PW7WjHz8SHey7udLTbi1IDjWkmyCLfKxUcgCg5bIkGlaggeI7rQ
         dFuWArkXQFw4CSSgOTN3uc1VVR2XqV7jwpbTKsP23gjRISgZ8bn8AvKRbFi9H1us9op4
         311rufMzCGqL3pQHdBq3iE/9gjhQRnI0LXlHxKuzf41gefENh5jHFowBQlm0RRVfYWK3
         KR9GAbq9s1TI/o25LEBrB8TOowerw1EGB6+H+YqJpFF1ihOVZCiklFzCEXelOLCTs3XX
         fajY4I7lK7bHDYQzlY7nahUPS04UU/FAq792AIVlUQRWtv4LFg2yq4RIt4O469O+alUq
         CFFw==
X-Gm-Message-State: ANoB5plHP6+wYxasHw8zNtxyBiv03G+QZw6k5LoXLBegUfu6LL3PmpFR
	pS8/XsF2Gluzav/vgu8rZcb00g==
X-Google-Smtp-Source: AA0mqf4Xdip+r7skuBy7lODHoTWA5Ki9oHZGfFRdiMDNpcuRv0VJmJpUY1Fyf6w4t7SHLDm6OrJjiw==
X-Received: by 2002:a05:600c:1e26:b0:3d2:2043:9cb7 with SMTP id ay38-20020a05600c1e2600b003d220439cb7mr25133115wmb.5.1671456636123;
        Mon, 19 Dec 2022 05:30:36 -0800 (PST)
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-11-vikram.garhwal@amd.com>
 <871qphc0p3.fsf@linaro.org> <ade61d47-f8c0-09cc-1a44-faaaff87d76a@amd.com>
 <alpine.DEB.2.22.394.2212021429220.4039@ubuntu-linux-20-04-desktop>
 <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Vikram Garhwal
 <vikram.garhwal@amd.com>, qemu-dev@xilinx.com, stefano.stabellini@amd.com,
 xen-devel@lists.xenproject.org, Peter Maydell <peter.maydell@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
Subject: Re: [QEMU][PATCH v2 10/11] hw/arm: introduce xenpv machine
Date: Mon, 19 Dec 2022 13:28:46 +0000
In-reply-to: <d87025d8-b653-d80e-22c0-05f052447706@xen.org>
Message-ID: <87bknzldvo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Julien Grall <julien@xen.org> writes:

> Hi,
>
> On 02/12/2022 22:36, Stefano Stabellini wrote:
>>> Do you know what Xen version your build env has?
>> I think Alex is just building against upstream Xen. GUEST_TPM_BASE
>> is
>> not defined there yet. I think we would need to introduce in
>> xen_common.h something like:
>> #ifndef GUEST_TPM_BASE
>> #define GUEST_TPM_BASE 0x0c000000
>> #endif
>
> I think this would be a big mistake to add the two lines above in QEMU.
>
> Libxl is responsible for creating the domain and generating the
> firwmare tables. Any mismatch of values will be a real pain to debug.
>
> Even if...
>
>> We already have similar code in xen_common.h for other things.
>> Also, it
>> would be best to get GUEST_TPM_BASE defined upstream in Xen first.
>
> ... we introduce upstream first, the guest layout is not part of the
> stable ABI and therefore could change from release to release.
>
>>=20
>>> Another way to fix this(as Julien suggested) is by setting this GUEST_T=
PM_BASE
>>> value via a property or something and user can set it via command line.
>>>
>>> @sstabellini@kernel.org, do you think of any other fix?
>> Setting the TPM address from the command line is nice and preferable
>> to
>> hardcoding the value in xen_common.h. It comes with the challenge that
>> it is not very scalable (imagine we have a dozen emulated devices) but
>> for now it is fine and a good way to start if you can arrange it.
>
> It is not clear which one you think is not scalable. If this is the
> command line option approach, then I think this is unrealistic to ask
> every user to rebuild there QEMU just because the guest layout has
> changed.
>
> Today the rebuild may only be necessary when switching to a new
> release. But in the future we may imagine a per-domain layout (e.g.
> for legacy purpose). So you will now need to request the user to have
> one QEMU built per domain.

I agree if this is something that can change it needs to be configured
from the command line or somehow otherwise gleaned from the source of
truth. Isn't this information available via XenStore? Isn't that what
Viresh has to do for all the VirtIO devices he's adding to libxl?

A default value for the option could be done I guess.

>
> How is that scalable?
>
> Cheers,


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


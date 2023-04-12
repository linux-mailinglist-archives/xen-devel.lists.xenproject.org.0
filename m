Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06A36DF758
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 15:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520226.807575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmadf-0005j7-VD; Wed, 12 Apr 2023 13:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520226.807575; Wed, 12 Apr 2023 13:35:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmadf-0005g0-RH; Wed, 12 Apr 2023 13:35:55 +0000
Received: by outflank-mailman (input) for mailman id 520226;
 Wed, 12 Apr 2023 13:35:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R0Xd=AD=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1pmadf-0005fu-6Q
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 13:35:55 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2058777-d936-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 15:35:53 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id gw13so6549799wmb.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Apr 2023 06:35:53 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b003ee44b2effasm2413602wmc.12.2023.04.12.06.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 06:35:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E78071FFB7;
 Wed, 12 Apr 2023 14:35:51 +0100 (BST)
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
X-Inumbo-ID: f2058777-d936-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681306552; x=1683898552;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pp/vZNTH1CdYoakxWMjsbyXkrBnC6lsoL8fgM36jhHA=;
        b=UdnscHMEvQz45UkLik37L0hEIoYpItpzh0YlKZDl85OiVjf15e/Kusv7Q22Nt/B7Sg
         8U4bUJwS+rxvIUcFzhv6pw/xeOvQlhS/4KG0r+++aLXVNeR8BBGBM8ffToibmc7lxJPM
         vT0qxlkgOwxmtM0U68ttNyjdRl7SBaon2terdXX7UoK/9dJDyAHYxzcqjNVtP3HhnvRR
         0Zxw5ugxQcXH7EkWUIh3vkXLSiyyr7m1tYeC8hg2QKx1AMlF0AJ6xwx9E3D0r3f+oiO3
         Eb5vACUdhbCOiTSA+KErKHtsDc3JfFPxWP9+qCDfbkz7QMp1qcfNJE1TtE3BAOnAVms1
         MaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681306552; x=1683898552;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pp/vZNTH1CdYoakxWMjsbyXkrBnC6lsoL8fgM36jhHA=;
        b=Pt8fAX/trDB+yauhwf/a5kBhFrhJC18o/YiwtfK3V3QT8xw2+Jh4kZ7ijrFIwy7jen
         SQIBvk5i2PwSGW4Qoa1b/P3US9Im35b2U868r0qJesKTG+jZ2dy22IUJUAF0uqK7nU3k
         7LcXQISWM1QKvPMpIiH3IBwZSx3U+/ATmirEIJGYcLsWzl52RYGUFoxzE/9CFLDaeUoo
         UpQToQuoBacUvJ8u3FARxStsihs+8WqeGn1/TWh0w2HMZEKMj0tApNSSt+497HkKCc5Z
         SByab2v/d2uwCmEcwWN4keIZpddgI+uO6k/75mo+lQcK28qIbZo5QpjUqoywc0PS/kpq
         Vy6g==
X-Gm-Message-State: AAQBX9fn0iYgyIR3A1zLTmhC15N0g978nk2TWtdkMWPeBFHHFqqLaHyA
	rL99UPxG5YPCg8OIaLfRGKp1PA==
X-Google-Smtp-Source: AKy350ZMvSEee+J206l5ykzqOZYJksxor/SX5VB6FJI2pHRVAyrysQrLIuP9OKazZ7dvbgMZlvebZw==
X-Received: by 2002:a1c:ed18:0:b0:3ed:5eed:5581 with SMTP id l24-20020a1ced18000000b003ed5eed5581mr2256488wmh.2.1681306552665;
        Wed, 12 Apr 2023 06:35:52 -0700 (PDT)
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
 <20230411224746.16152-11-vikram.garhwal@amd.com> <87fs95ck61.fsf@suse.de>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fabiano Rosas <farosas@suse.de>
Cc: xen-devel@lists.xenproject.org, vikram.garhwal@amd.com,
 stefano.stabellini@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>, Philippe
  =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [QEMU][PATCH v6 10/10] meson.build: enable xenpv machine build
 for ARM
Date: Wed, 12 Apr 2023 14:32:03 +0100
In-reply-to: <87fs95ck61.fsf@suse.de>
Message-ID: <87pm89nryg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Fabiano Rosas <farosas@suse.de> writes:

> Vikram Garhwal <vikram.garhwal@amd.com> writes:
>
>> Add CONFIG_XEN for aarch64 device to support build for ARM targets.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  meson.build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 52c3995c9d..eb5bb305ae 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -135,7 +135,7 @@ endif
>>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>>    # i386 emulator provides xenpv machine type for multiple architectures
>>    accelerator_targets +=3D {
>> -    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
>> +    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu',
>> 'aarch64-softmmu'],
>
> I'm not familiar with Xen, so pardon my ignorance, but would it (ever)
> make sense to do a 1:1 map of host architecture and qemu target? So we
> don't have to deal with having a build on x86 pulling aarch64-softmmu
> and vice-versa.
>
> Do we expect both x86_64-softmmu and aarch64-softmmu binaries to be used
> in the same host?

Xen is different from the other accelerators as it isn't really guest
CPU aware. It is merely io device emulation backend albeit one that
supports a non-paravirtualised guest on x86. But you are right that
using qemu-system-i386 as a backend on aarch64 hosts does cause some
cognitive dissonance for users. For aarch64 hosts we would only support
the VirtIO guests.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


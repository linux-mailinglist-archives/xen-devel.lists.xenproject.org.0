Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A75686154
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 09:11:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488158.756115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8D7-0007C6-OS; Wed, 01 Feb 2023 08:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488158.756115; Wed, 01 Feb 2023 08:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN8D7-00079a-Lc; Wed, 01 Feb 2023 08:11:17 +0000
Received: by outflank-mailman (input) for mailman id 488158;
 Wed, 01 Feb 2023 08:11:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I2yI=55=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pN8D6-00079U-1k
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 08:11:16 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff56a7be-a207-11ed-933c-83870f6b2ba8;
 Wed, 01 Feb 2023 09:11:15 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id y11so16808336edd.6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Feb 2023 00:11:15 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-206-008.89.14.pool.telefonica.de.
 [89.14.206.8]) by smtp.gmail.com with ESMTPSA id
 w11-20020a50fa8b000000b0049e09105705sm9323996edr.62.2023.02.01.00.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:11:14 -0800 (PST)
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
X-Inumbo-ID: ff56a7be-a207-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVVZZ7wS6QUXc/pYLeaK5exDkUy3Zt8bVZPG8D5u1No=;
        b=NNBDDLFB7AAMeRRFqJyd16OykOpWZFx+Aa0wFjgE6eFwenVdG/7sfGnHLqv/pYLL3h
         iW0X8t01DYuVnr+K87C7he1+16XUTSRBH1V3Xah0KYa+N9ZBDhfSVEO4GUxZat+VT8TB
         6laEuto6OZmr5tLV0GM6/GKNeWTtduYs3wTD4QeH8HD2Wqq6jOQy7QFpTJ98D2hXj6EV
         oSc2isVI4P9iXMMC7HLxcAphkIJsX7tK24mMoaFq0nF00NopIbAVisOv3fgk/dnGFriU
         nIo+X+ujkZRPMfsrQMPlVW1qgDIXpxJAn0l+Wix2Wiy7IYvJ1QQsVATPHNXkYOvvF5qy
         bO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVVZZ7wS6QUXc/pYLeaK5exDkUy3Zt8bVZPG8D5u1No=;
        b=a+7LP+3Lkf7o3854ntsVAhYydP9G0Fo8g5qju6GKI7b2Lzk5AiutQvFnN7c2Q9q1M6
         ndhVDy19LYDT2S1lDyJdPOg0zrW6Jwvwc7VQTn+r3ICyJEAs3413e7WF/rmvhzCoJ4Nq
         mOEoN2wVSvNfdEhv+YaF1VawztbtN+Ps9Rs7CeGS36xE14MMkl5uyywqf+XWhTXPdztn
         rnGxFJXz/4l1btoh1im2iUWJW5sao0tpPYIwieYN2w4kXq0xEhqW8bmaGqju6HnxKmzY
         MMYvRVdZ95Hg6XQDMvaM+tv0heoPjj6mpLsSWmZLhE3QpElSBY2Q2wBRnFFGyLswORV4
         pTPw==
X-Gm-Message-State: AO0yUKUhj5jWHS3owaZUQ5BbuGu8r4nkVXhy4GPOTDOftV+C+DTc15y+
	+Og6EQI7ErfZWchPoAN1RsA=
X-Google-Smtp-Source: AK7set+7Bf1JJ24v+v8g+VmLgOtiu+gqip0P1fEsOqCRHaUKiWt1HbYwUVeskgGrEKFjwvxZ7zjEhQ==
X-Received: by 2002:aa7:c602:0:b0:499:d199:6614 with SMTP id h2-20020aa7c602000000b00499d1996614mr1058466edq.36.1675239074680;
        Wed, 01 Feb 2023 00:11:14 -0800 (PST)
Date: Wed, 01 Feb 2023 08:11:10 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com> <20230118051230-mutt-send-email-mst@kernel.org> <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com> <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
Message-ID: <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 24=2E Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Eperar=
d@citrix=2Ecom>:
>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote:
>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finall=
y removes
>>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make =
Xen in the PC
>>> > machine agnostic to the precise southbridge being used=2E 2/ will be=
come
>>> > particularily interesting once PIIX4 becomes usable in the PC machin=
e, avoiding
>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>>=20
>>> Looks ok to me=2E
>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>>=20
>>> Feel free to merge through Xen tree=2E
>>
>>Hi Bernhard,
>
>Hi Anthony,
>
>>The series currently doesn't apply on master=2E And a quick try at
>>applying the series it is based on also failed=2E Could you rebase it , =
or
>>maybe you would prefer to wait until the other series "Consolidate
>>PIIX=2E=2E=2E" is fully applied?
>
>Thanks for looking into it!
>
>You can get the compilable series from https://patchew=2Eorg/QEMU/2023010=
4144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you let m=
e know, then I can rebase onto master=2E All necessary dependencies for the=
 series are upstreamed meanwhile=2E

Ping

>
>Thanks,
>Bernhard
>>
>>Thanks=2E
>>
>>> > Testing done:
>>> > None, because I don't know how to conduct this properly :(
>>> >=20
>>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>>


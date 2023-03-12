Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1276B63EF
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 10:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508894.783814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHuN-00087p-3f; Sun, 12 Mar 2023 09:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508894.783814; Sun, 12 Mar 2023 09:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbHuN-000851-0b; Sun, 12 Mar 2023 09:22:27 +0000
Received: by outflank-mailman (input) for mailman id 508894;
 Sun, 12 Mar 2023 09:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbHuL-00084v-2D
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 09:22:25 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63fc510d-c0b7-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 10:22:21 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id fd5so3469914edb.7
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 01:22:21 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-022-093.78.54.pool.telefonica.de.
 [78.54.22.93]) by smtp.gmail.com with ESMTPSA id
 f17-20020a1709062c5100b008cdb0628991sm2029248ejh.57.2023.03.12.01.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 01:22:19 -0800 (PST)
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
X-Inumbo-ID: 63fc510d-c0b7-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678612940;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8L9fPPoucSazfhBtYDRn5YU9uUE231Badun+aOJjCOU=;
        b=jiyyN4hwdcO/uyGu3iBO7iNQ0QAse37tJ5T+5h/lAttRu7DV7Y6WWNxqShYsWFDZAi
         mUxbflK2bKBW8Ti1fmJVSVZqWJi42+Kt8iMshn4CYSpI+e7UKzhX5I90k4i2Pr7cd/AU
         3cCMUv5HmCDNYDIa9asYEnI6I57nFYAQSMZCyW6AamTafgh+qwFAuH0NZswBMvAxKbfU
         AQAZBX8p9u5ShPwUDbAnZVPrwXPfnQc+9aBJPmjjZN8YgcSplHBWU150oTAf3CX8bff4
         /Ko9V3f6aiHA5KfxEBtPbcplaXodVQ9tmdPA07OW+fe4lBWsiIE+Zuwx437gz3EcQJc7
         SQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678612940;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8L9fPPoucSazfhBtYDRn5YU9uUE231Badun+aOJjCOU=;
        b=nDJZaXlwkz8HKitKh06OhjEk2Ka+a279B5ijtRlb9AygOm7gQjoaFS0fu9MUPbNrxI
         z8pI14hzaiLWbFihZCQ/uCGrJh5t/xyYORql8QrHk2UNOCV5ndIUC3QPNDdV2DwT6Bm1
         jrICrl2v1pwTF2MhXyzr1tvH6EU2LOq2zaWuCmjdM1oczglgpSfGaze+5KjNN/3EbNbB
         ZuO+jI89CQwBw54rvNQ+oz1CYoe/ZWL7JJkAR5UwP5dAxKSI/YuOmhRD2JjWG9kOg5CE
         Ui0MyGetulIOLHcLgOcGDPh1EJVuuJwEgHtxiDylBGNocasu5ZlYQMTY5/n0AP/0Ge12
         SXYw==
X-Gm-Message-State: AO0yUKX8GE/R+itKWFf0bRV97tRqV1kfv1HsS84tYieC8wiyMIg2qRNH
	MRWJzOMxvcdD3/y1qBk1IPc=
X-Google-Smtp-Source: AK7set8yBeg31XQKfmoTaC29paIeauT+GEVkQNJjPXCxUO5TvFDds4X5C4VGctJ8/NTb8IxR5loyMw==
X-Received: by 2002:a17:906:4783:b0:878:4497:380e with SMTP id cw3-20020a170906478300b008784497380emr40141144ejc.4.1678612940280;
        Sun, 12 Mar 2023 01:22:20 -0800 (PST)
Date: Sun, 12 Mar 2023 09:22:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
In-Reply-To: <c20b7056-037d-67ff-0b2d-ea931d501bac@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com> <20230118051230-mutt-send-email-mst@kernel.org> <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com> <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com> <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com> <6C8AA4D4-FF57-4E43-A464-7F64C576ED5B@gmail.com> <c20b7056-037d-67ff-0b2d-ea931d501bac@aol.com>
Message-ID: <FD7FF486-D06D-4CC1-8618-13B4138596B2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 11=2E M=C3=A4rz 2023 22:20:29 UTC schrieb Chuck Zmudzinski <brchuckz@ao=
l=2Ecom>:
>On 2/9/2023 4:53 PM, Bernhard Beschow wrote:
>> Am 1=2E Februar 2023 08:11:10 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>> >
>> >
>> >Am 24=2E Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>> >>
>> >>
>> >>Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Ep=
erard@citrix=2Ecom>:
>> >>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote=
:
>> >>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>> >>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and fi=
nally removes
>> >>>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to m=
ake Xen in the PC
>> >>>> > machine agnostic to the precise southbridge being used=2E 2/ wil=
l become
>> >>>> > particularily interesting once PIIX4 becomes usable in the PC ma=
chine, avoiding
>> >>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>> >>>>=20
>> >>>> Looks ok to me=2E
>> >>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>> >>>>=20
>> >>>> Feel free to merge through Xen tree=2E
>> >>>
>> >>>Hi Bernhard,
>> >>
>> >>Hi Anthony,
>> >>
>> >>>The series currently doesn't apply on master=2E And a quick try at
>> >>>applying the series it is based on also failed=2E Could you rebase i=
t , or
>> >>>maybe you would prefer to wait until the other series "Consolidate
>> >>>PIIX=2E=2E=2E" is fully applied?
>> >>
>> >>Thanks for looking into it!
>> >>
>> >>You can get the compilable series from https://patchew=2Eorg/QEMU/202=
30104144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you l=
et me know, then I can rebase onto master=2E All necessary dependencies for=
 the series are upstreamed meanwhile=2E
>> >
>> >Ping
>>
>> Ping^2
>
>Hi Bernhard,

Hi Chuck,

>I took a look at this today to see why it cannot be applied=2E

Thanks for looking at it!

>I can see clearly that
>all the prerequisite patches have *not* been applied to master yet, so I =
can
>understand why Anthony cannot pull this up yet=2E Specifically, the serie=
s that
>consolidates PIIX3 and PIIX4 south bridges is not yet applied, and that i=
s one of
>the prerequisites=2E I think you said it was reviewed, but it apparently =
never got
>pulled up into master=2E

Correct, the PIIX consolidation series isn't merged yet=2E This series cur=
rently depends on it to avoid merge conflicts but doesn't need it otherwise=
=2E Back then I anticipated that the consolidation series would land in mas=
ter soon since it was fully reviewed before this one=2E But that turned out=
 not to be the case=2E

This series depends on some necessary refactoring [1] which I did in the c=
ontext of PIIX consolidation which is already in master=2E So this series c=
an easily be rebased onto master and it even simplifies the consolidation s=
eries a bit=2E I'll take this route now and I'll post a v3=2E

Best regards,
Bernhard

[1] https://lore=2Ekernel=2Eorg/qemu-devel/20221120150550=2E63059-1-shente=
y@gmail=2Ecom/

>
>For reference, here is the link to the prerequisite patch set I tested wi=
th
>this patch set:
>
>https://lore=2Ekernel=2Eorg/qemu-devel/20221221170003=2E2929-1-shentey@gm=
ail=2Ecom/
>
>The patch set I tested is a 30-patch series, and I don't know if it has
>been partially applied=2E The title of that patch set is:
>
>This series consolidates the implementations of the PIIX3 and PIIX4 south
>
>So before this patch set to resolve the TYPE_PIIX3_XEN_DEVICE can be
>applied, the patch set to consolidate the PIIX3 and PIIX4 south bridges
>needs to be applied=2E
>
>I don't know if the feature freeze means these patches that do not add an=
y
>new features still need to wait until the next development cycle=2E
>
>Kind regards,
>
>Chuck
>
>> >
>> >>
>> >>Thanks,
>> >>Bernhard
>> >>>
>> >>>Thanks=2E
>> >>>
>> >>>> > Testing done:
>> >>>> > None, because I don't know how to conduct this properly :(
>> >>>> >=20
>> >>>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>> >>>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>> >>>
>


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D2679FC6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 18:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483660.749949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMls-00034D-Sp; Tue, 24 Jan 2023 17:07:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483660.749949; Tue, 24 Jan 2023 17:07:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMls-00032V-QA; Tue, 24 Jan 2023 17:07:44 +0000
Received: by outflank-mailman (input) for mailman id 483660;
 Tue, 24 Jan 2023 17:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kvp=5V=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pKMlr-00032P-8x
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 17:07:43 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c72c4bf-9c09-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 18:07:41 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so40846370ejc.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 09:07:41 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb2007c8246afca181621.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:7c82:46af:ca18:1621])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a17090637d900b008536ff0bb44sm1150293ejc.109.2023.01.24.09.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 09:07:40 -0800 (PST)
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
X-Inumbo-ID: 9c72c4bf-9c09-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IXISPY5stzync/KUBvKXq0ONfLxyCKnySoOrUOcUuM=;
        b=OFfSeCBodDaa0PquypwkxlnGdqhgExe5Tqmdj54i0tKDCWz5KEbPbM+YhL4kagRWq0
         pLVThJ/3Z2B1f48k/uj1IbPmGaJv27zzbXeeDPITp4wZyJTVHUQdz6hOum32x1CKch4E
         X6imBIQHUYKHD40TqI2rhvWI4U4vzqudSzI/NMwFeisI35VGGlvK431L7XDyiR8cZTNU
         7jbKBs0cFwZhmkHyjsDk18aaPvX6HZfR4xNJDfRCXWYobNMmW3fo/iSO/YpDwkI+GRtQ
         j+8NDATKZBMIsOvPkZGoZ/bb+SXNlE1kbGlSX1eeYRN/yJE9iIFLMKEiA+StjVABdV+s
         9LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IXISPY5stzync/KUBvKXq0ONfLxyCKnySoOrUOcUuM=;
        b=rqbi9VWgX9PHbDCh6p/ELlZ1J0XlYGFxiyOtg0OEEMvhXO2PsC1Q4v1wIldI0m4yBe
         Z3LaLD3Ws5GVseY9V+VnjUHp0Wl1x3T/IU1Yxf5KK73LaFHlnQYH8f1fq2kxZYEUkaaJ
         0nzXnj1/wEtKoS+925+bO8MP6Atr2lfrpbIv5IQpaEytrwko9Nsw7yImAIqPFiqBIX0q
         wMZoAWLzutVOf9W0EUHwrEsDRrbeFM5xzfzMq2giPTZ+4ErkAHxRk8MD2c28LEyLTHRA
         YOF62gxEUaCATR9qFXliHNEABXwAOai7oWUBt6+HKD35Y9OQvm59s6XBzjwHRD503BTN
         fNHQ==
X-Gm-Message-State: AFqh2kpx+XI4v7MuHgLY5ER1tYiS6gP0tKUfXNm5f0ghCAhZxHIJwpnd
	Y0rF196vOmxuCvbxcOpmzvg=
X-Google-Smtp-Source: AMrXdXuxMXeA+QJHu7+lnoisAh5OXs04+/6pXredGjOy405Q3BgjsuIdIBcKce8ALFJUS3/FmbgIqA==
X-Received: by 2002:a17:906:3783:b0:86f:e116:295 with SMTP id n3-20020a170906378300b0086fe1160295mr34112197ejc.4.1674580060813;
        Tue, 24 Jan 2023 09:07:40 -0800 (PST)
Date: Tue, 24 Jan 2023 17:07:30 +0000
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
In-Reply-To: <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
References: <20230104144437.27479-1-shentey@gmail.com> <20230118051230-mutt-send-email-mst@kernel.org> <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com>
Message-ID: <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Eperard=
@citrix=2Ecom>:
>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote:
>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and finally=
 removes
>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make X=
en in the PC
>> > machine agnostic to the precise southbridge being used=2E 2/ will bec=
ome
>> > particularily interesting once PIIX4 becomes usable in the PC machine=
, avoiding
>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>=20
>> Looks ok to me=2E
>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>=20
>> Feel free to merge through Xen tree=2E
>
>Hi Bernhard,

Hi Anthony,

>The series currently doesn't apply on master=2E And a quick try at
>applying the series it is based on also failed=2E Could you rebase it , o=
r
>maybe you would prefer to wait until the other series "Consolidate
>PIIX=2E=2E=2E" is fully applied?

Thanks for looking into it!

You can get the compilable series from https://patchew=2Eorg/QEMU/20230104=
144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you let me=
 know, then I can rebase onto master=2E All necessary dependencies for the =
series are upstreamed meanwhile=2E

Thanks,
Bernhard
>
>Thanks=2E
>
>> > Testing done:
>> > None, because I don't know how to conduct this properly :(
>> >=20
>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>


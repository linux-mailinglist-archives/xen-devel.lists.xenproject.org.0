Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0126912D8
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 22:54:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492945.762724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQErb-0002Mk-Cj; Thu, 09 Feb 2023 21:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492945.762724; Thu, 09 Feb 2023 21:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQErb-0002Kv-9w; Thu, 09 Feb 2023 21:53:55 +0000
Received: by outflank-mailman (input) for mailman id 492945;
 Thu, 09 Feb 2023 21:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2cpx=6F=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pQErZ-0002Kp-DM
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 21:53:53 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d8a86a3-a8c4-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 22:53:52 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id c26so5902992ejz.10
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 13:53:51 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-177-219.77.11.pool.telefonica.de.
 [77.11.177.219]) by smtp.gmail.com with ESMTPSA id
 q25-20020a50cc99000000b004a24b8b58cbsm1318598edi.16.2023.02.09.13.53.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 13:53:50 -0800 (PST)
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
X-Inumbo-ID: 3d8a86a3-a8c4-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itT7CNNYwIbGw/NdhBVioMq1qk/0q2en8jeZiTvu8fM=;
        b=gvkdPO+ea8gbJrkwujaXuq7jqd/x4q/yoZr/60V6ZoeTTF6CXPrsxdbDvp58h25VsY
         gMCOWNcSa8jF3Z7//UFAWiQIDoN9oOAvoPxiQpMeFziN3CCAwwMJ6GJ1zrartjupv+ZG
         grh6lZGDFObX5DwdUHW8wwXlMMISHQubCBP0pXVVualrI4IHsFeFvDXp61y6n9JvotOr
         JW4rtSkplS8r0DJZxifuoVbFWSom8YloiJ9CKfnW6TaK1TNNHrkkBsjuAFxpML2kCxV1
         wTt4V7NnWFpOa80BgYPhVfH+Hgk2Wqb47ehOk/qi9VoRyjUzG3edsXPnpzq+Ca/44qoP
         KE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itT7CNNYwIbGw/NdhBVioMq1qk/0q2en8jeZiTvu8fM=;
        b=zQo+Edo2Pa0K+36EgDm9LCsI0rUqmRvPt2upY/K+rhBfnAVLf0V5yy6KLG8DISy3xU
         VHqRVpg8hwTQZ66oKQBuNeT6PXbdjFLhNgFXipUPV6xXcIT6ranX/4Z1vadljLDeWsnP
         +uIKKa8tyTMBys45x43agl0EFLIgu/hdsAduYr3pOqXOqvUpYjd//U1fCcBG0hHUICBQ
         LtgyvbqAh4WcoiTy4wL6+LPvRuj4P+j/8PycQQvTkQPxHRaBKBEyxMyV62jsMQZ0ya8g
         /4ed0nKZ1/BYU8qBhGLsLjH5AUl7TZWrGyUGZXfT5eyiHHrHPzGygqau/bvVmo7+8Tvi
         kv6A==
X-Gm-Message-State: AO0yUKWpvARL20xzYI6NWEL8Ni/ZOe0eRccB6AVS3OU1VeozdUTuWfte
	dSRrfZfatXTtiwbXh9nAy1A=
X-Google-Smtp-Source: AK7set+8AOKT8imCofnKhSOXuWnoO7CZmbZIKmaAC/5ETBa5KX7LXmOcaqdQ1HR9CDMB3Tr6dFoSnA==
X-Received: by 2002:a17:906:1252:b0:889:7781:f62e with SMTP id u18-20020a170906125200b008897781f62emr14288663eja.22.1675979631428;
        Thu, 09 Feb 2023 13:53:51 -0800 (PST)
Date: Thu, 09 Feb 2023 21:53:41 +0000
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
In-Reply-To: <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com> <20230118051230-mutt-send-email-mst@kernel.org> <Y9ADQ/Yu8QQD0oyD@perard.uk.xensource.com> <0C2B1FE4-BB48-4C38-9161-6569BA1D6226@gmail.com> <96A4863B-D6BA-48B5-B5E4-54DD103FEBAA@gmail.com>
Message-ID: <6C8AA4D4-FF57-4E43-A464-7F64C576ED5B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 1=2E Februar 2023 08:11:10 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 24=2E Januar 2023 17:07:30 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>>
>>
>>Am 24=2E Januar 2023 16:11:47 UTC schrieb Anthony PERARD <anthony=2Epera=
rd@citrix=2Ecom>:
>>>On Wed, Jan 18, 2023 at 05:13:03AM -0500, Michael S=2E Tsirkin wrote:
>>>> On Wed, Jan 04, 2023 at 03:44:31PM +0100, Bernhard Beschow wrote:
>>>> > This series first renders TYPE_PIIX3_XEN_DEVICE redundant and final=
ly removes
>>>> > it=2E The motivation is to 1/ decouple PIIX from Xen and 2/ to make=
 Xen in the PC
>>>> > machine agnostic to the precise southbridge being used=2E 2/ will b=
ecome
>>>> > particularily interesting once PIIX4 becomes usable in the PC machi=
ne, avoiding
>>>> > the "Frankenstein" use of PIIX4_ACPI in PIIX3=2E
>>>>=20
>>>> Looks ok to me=2E
>>>> Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>>>>=20
>>>> Feel free to merge through Xen tree=2E
>>>
>>>Hi Bernhard,
>>
>>Hi Anthony,
>>
>>>The series currently doesn't apply on master=2E And a quick try at
>>>applying the series it is based on also failed=2E Could you rebase it ,=
 or
>>>maybe you would prefer to wait until the other series "Consolidate
>>>PIIX=2E=2E=2E" is fully applied?
>>
>>Thanks for looking into it!
>>
>>You can get the compilable series from https://patchew=2Eorg/QEMU/202301=
04144437=2E27479-1-shentey@gmail=2Ecom/ =2E If it doesn't work for you let =
me know, then I can rebase onto master=2E All necessary dependencies for th=
e series are upstreamed meanwhile=2E
>
>Ping

Ping^2

>
>>
>>Thanks,
>>Bernhard
>>>
>>>Thanks=2E
>>>
>>>> > Testing done:
>>>> > None, because I don't know how to conduct this properly :(
>>>> >=20
>>>> > Based-on: <20221221170003=2E2929-1-shentey@gmail=2Ecom>
>>>> >           "[PATCH v4 00/30] Consolidate PIIX south bridges"
>>>


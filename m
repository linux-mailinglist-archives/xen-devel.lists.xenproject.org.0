Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5CBD5EA2
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 21:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142475.1476620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8O39-0002Op-KO; Mon, 13 Oct 2025 19:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142475.1476620; Mon, 13 Oct 2025 19:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8O39-0002MK-Gb; Mon, 13 Oct 2025 19:17:39 +0000
Received: by outflank-mailman (input) for mailman id 1142475;
 Mon, 13 Oct 2025 19:17:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q6bU=4W=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1v8O37-0002MC-P1
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 19:17:37 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44b54960-a869-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 21:17:35 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e384dfde0so46850435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 12:17:32 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (p200300faaf271400a0afdc243fcb5392.dip0.t-ipconnect.de.
 [2003:fa:af27:1400:a0af:dc24:3fcb:5392])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cf790sm19028061f8f.28.2025.10.13.12.17.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 12:17:31 -0700 (PDT)
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
X-Inumbo-ID: 44b54960-a869-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760383052; x=1760987852; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiK75KG1lswxj6Jv8QlsEsjxImVje5ZiRRxRVvO5CtY=;
        b=VHWh/n+JFfg+ToEW5jPcWeqTLm87/VjudTN8Rv7Tke5Ud+feENTZv4jNkX++NSO0f/
         34a8wQZzioGb7NII/H8rkfR2fmImKNrVklFLf+1D5BRn1o343tvUut9/UVhwgArLPZEm
         XHSqB+qkdac/PxePPzDN4iu0DPnQ9q6douGS+qIgJAr2CBdK1qWcEdqP7OQZtlttPxcR
         OA9HglkFQbzV5rME1WomJFAZF/ZCiDL9UE5jvyY8mcoRO9mcXMjhGSd/M8oCFgsnnAMW
         CBNNlPKIV/MI+bidtgVlNtlqJeBU6/Idz8Ntxi+eOqN2TCOF17ZieTZw3EikzeQ0qShJ
         53qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760383052; x=1760987852;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiK75KG1lswxj6Jv8QlsEsjxImVje5ZiRRxRVvO5CtY=;
        b=Nv9nBKSoU5cW4oaL10f6HtfQIyIpe60sZ5gfi3JS3CvjQzXXjLfRxqbT++g8nGbb2N
         vKJI5T9lMZWJFg7pDRr5hskAYcDkdmBTVvRo8CESuKBdDc2qDlyJpDtDsCW8Q11v+jCo
         7CjpvZcI0SiPg/QS53qN5C2bwjDp+GColRCWj+hM/uI3xaL2HOzLFYG/oQh56lvKg+jl
         RVytvk3SogZ1DMF4HMHzvpa2Kq8UMWKCbRvg+EaeTTi3Hr2CEeEFhyHSa3fbKei639MU
         nPpKnYy8PWFP5m+imiH69h/5ArlHf4sozqdN/Pb+u1Tc+bv6I9A5u0NsBeyM6ZWQNYys
         mYdg==
X-Forwarded-Encrypted: i=1; AJvYcCXbfi+pFhaQotDEUzS5Kz1jn3LrAvHoc09hw+nT35pRyLhvVl/eQMFKTqKMlGUsraw+yDB/Ko+E9h4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvlPtskT0ryXdDWePD96Ce3LlXo6wlsK/8+kmEfVQ6XRXJoSag
	IJJ9Tq48zbwevqdggh73Kk8SD0qYGBAJ/86M7OLSyZaO1VFy10AU6aGg
X-Gm-Gg: ASbGncsuBvh6Nl5CMubHoSL1Bjv6gRt5Cj1rSAT9yiUMEMtFs7XQzbPW+wPiPzEr2nf
	ZB7mZ73vcnqcAWnWGvc9xGXBY4i2XrnT60P+oKtROZtQ947cZIs7tdiRCqD51X9ujIVH5T/o57Q
	5BthPAvz23UhdkcdHC1FP5A+NoHIs1qljf0uELYUuVMkGGRFOReEo2HiM36IXfOPrul36ZYPYjR
	HB5XuFzBcWVG3kPK3kSBVoHJZ/lxtx5yuvsl69g2K0Cyp35TMtJ+D8l/FkiKS/voBeFXczJftnj
	WvzfF1dLF6KdQITLwAKYZCyKB6GIhFlPC5T05LpIECjvc22otn2SQEh6MmVQ2Zbpjrz6iEtDDFz
	4L+3C8qeUeUXWInztLzDnat3jlcDkJXJq6RhvAmpbmTX+CXN3UMZ46yz7F+WX6nc3Hiv26HVPNp
	KOXaH2uI23DC8jH6LsXJ6cwypuYweEiSJ5uqn9Mg==
X-Google-Smtp-Source: AGHT+IHU5wMW6jHCaghZ+f5oYifMHLQNNFD/JSPcjf6kXUliBoNv9hhsI7yXKfx/FCdg5qEQ19dHsQ==
X-Received: by 2002:a05:600c:3acb:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-46fa9a21caamr132516145e9.0.1760383051935;
        Mon, 13 Oct 2025 12:17:31 -0700 (PDT)
Date: Mon, 13 Oct 2025 19:17:28 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
CC: sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
In-Reply-To: <877bwz6oqy.fsf@pond.sub.org>
References: <20250729111226.3627499-1-armbru@redhat.com> <877bwz6oqy.fsf@pond.sub.org>
Message-ID: <20C81C5B-912C-49B3-B50A-867C06C134B1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 13=2E Oktober 2025 11:10:45 UTC schrieb Markus Armbruster <armbru@redha=
t=2Ecom>:
>Ping?
>
>Markus Armbruster <armbru@redhat=2Ecom> writes:
>
>> xenfb_mouse_event() has a switch statement whose controlling
>> expression move->axis is an enum InputAxis=2E  The enum values are
>> INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1=2E  The switch has a
>> case for both axes=2E  In addition, it has an unreachable default label=
=2E
>> This convinces Coverity that move->axis can be greater than 1=2E  It
>> duly reports a buffer overrun when it is used to subscript an array
>> with two elements=2E
>>
>> Replace the unreachable code by abort()=2E
>>
>> Resolves: Coverity CID 1613906
>> Signed-off-by: Markus Armbruster <armbru@redhat=2Ecom>
>> ---
>>  hw/display/xenfb=2Ec | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/hw/display/xenfb=2Ec b/hw/display/xenfb=2Ec
>> index 22822fecea=2E=2E5e6c691779 100644
>> --- a/hw/display/xenfb=2Ec
>> +++ b/hw/display/xenfb=2Ec
>> @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, Qem=
uConsole *src,
>>                  scale =3D surface_height(surface) - 1;
>>                  break;
>>              default:
>> -                scale =3D 0x8000;
>> -                break;
>> +                abort();

Don't we prefer g_assert_not_reached() these days, for more expressiveness=
?

Best regards,
Bernhard

>>              }
>>              xenfb->axis[move->axis] =3D move->value * scale / 0x7fff;
>>          }
>
>


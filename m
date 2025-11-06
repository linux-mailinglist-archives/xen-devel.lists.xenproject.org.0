Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB1C3A510
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156776.1485776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxQW-0001q2-W7; Thu, 06 Nov 2025 10:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156776.1485776; Thu, 06 Nov 2025 10:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxQW-0001n4-Sr; Thu, 06 Nov 2025 10:41:12 +0000
Received: by outflank-mailman (input) for mailman id 1156776;
 Thu, 06 Nov 2025 10:41:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j7P0=5O=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1vGxQV-0001lq-2J
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:41:11 +0000
Received: from mail-yx1-xb135.google.com (mail-yx1-xb135.google.com
 [2607:f8b0:4864:20::b135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18cad7ac-bafd-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 11:41:06 +0100 (CET)
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-63fc8c337f2so684119d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Nov 2025 02:41:05 -0800 (PST)
Received: from [10.138.34.110]
 (h96-60-249-169.cncrtn.broadband.dynamic.tds.net. [96.60.249.169])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-787b159c5a3sm6824027b3.35.2025.11.06.02.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Nov 2025 02:41:03 -0800 (PST)
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
X-Inumbo-ID: 18cad7ac-bafd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762425665; x=1763030465; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7HlSl1txf4LcJYLqgOBAu6Ib/8n6a+x+IOcB77G+RCA=;
        b=LpCyIKfftARNxNzWFMPMJniC7TPG6Qt/N99eNz63/S4PlHqoTkKIUWPrZIVPQQhX9h
         +Rsd/Zz4hhOCpzOWrwkNDST9R2XJU2Hwwie/GrRw6DkhAvy46yajIdoKoiSXesU0TZYH
         J31DklwzIKaYV0W97y1Hu5tqLklfv8zOXQGd6N3fVw004SKtQCkT72FA4xacRFzaHQ/Y
         907F4eXwuJKdnxT5LNOzYw84KwRywrh0gj4Hul7rTeGV/hrGFgwagXzGj4V3ztzB+7wz
         ZkcjJqbmA8XLLW+PRJS/3+LsZQQldi62Sh1EP0k5OC9GyvYfarHkkrtgrNj4tX6h1Bew
         G8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762425665; x=1763030465;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HlSl1txf4LcJYLqgOBAu6Ib/8n6a+x+IOcB77G+RCA=;
        b=nYIDYI9XcbCvT+OsJJN1SmxIJ54xnuGRw5Wai1aXXguAJsfQR79vxbUsA4Lkwh0T0L
         53L1K1QyFZ/GPLR9ymiLFejY1u60KESmiN6iVV/gPNNjtEMMaOMaXzngTvqGQ8cUZx6N
         8D3ehxFivLOX0jo73zRAWTxElnyqxNWgan5/nh6q+Kewc8bZO4msyaTNPIJjF+7H+Ufm
         0vOUCP2AaBhBd2blcCjxVVCbf6iHISiPKtMW4VVPB5cZUaQzhRpPOPGqQNNeR2y8y2K/
         VtlKGYLMeUPzS/fBA7Pyorn+mYE6kKZa8TY+Kep7V+RrtSpakt0ZGV7tjkTjUYaPWmrr
         9wlA==
X-Gm-Message-State: AOJu0Yz1TvuSSE8PbQrW4VdBjF5h1z6oz/JdKDc4pBQLIf8Yk2AfMVBA
	QrKS/unkiUCEYOGaezYzi4zEtO+jAOV001X9maWKanpn1jvxESVhLr1e
X-Gm-Gg: ASbGncvFFAG72adYWcQFm0YHaPc+m7u3eWyJogGkDTjGRXdaxAjZ7SLtqjPVb1yICvC
	FXsu8/e+j390nUQ6cox26+COloeR7CDhRyZEr+3R1G08JWEsNBY0bUmTYUIJT/SXOynkJ3cN4T5
	SOBGl/pKv0BQUmbJzGvF9jdA4Q6l38AEdgne0o+oVdbS9tC4vqxQWsjjOdb7J2UE40+okd0/jYV
	0CRizT+kagKBDk0o57XcZiyU1SBKDt7ehbWSv6WN3TjtLLoxzLE9nKOBsapNVoD4KNwlSA6k54O
	idEUYPNbu84hALknZ/sALr6FeRofDZLXbhneQaApBc9Jda8BgeTKlj7fPPJ4TYvzkXYYFha0kjC
	xnhnTF4rP6d9qPfVFOa4yjNvJAr/G+a0wDTDDOtG1IXRSs+s1zQNekKDjOTb4yAdQDu3fOSs8ra
	LriNzntFn2ZsrtUD6woe1e7/kYxKqZfkhDzTd05pxz08UvC6h66L9bFfOtPFiSijpL+ToIT8Q4I
	4briOkG4aygp0s+81FAQG6MPkk=
X-Google-Smtp-Source: AGHT+IG7HWVvJ2IsWNl9hYZsZAWAg+5BAKLnS83sV7gxNE2ggu/06PG6ZGekzKBU7nVlKXO2jmc/lQ==
X-Received: by 2002:a05:690c:f81:b0:786:506c:3cd8 with SMTP id 00721157ae682-786a412ad5cmr112845047b3.21.1762425664455;
        Thu, 06 Nov 2025 02:41:04 -0800 (PST)
Message-ID: <d210647f-7a8d-42f8-8704-65e5c7ae23a9@gmail.com>
Date: Thu, 6 Nov 2025 05:40:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
 <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
 <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com>
 <CAHt6W4fEbuk+VzjFxfz5=T8GXCVW_jSoqqMAkiQTXL79B93SPg@mail.gmail.com>
 <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------593kG1U3oOX9eLmTLCNIK5Gu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------593kG1U3oOX9eLmTLCNIK5Gu
Content-Type: multipart/mixed; boundary="------------xwuChLOhtgBM5Jv29d20D0lK";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <d210647f-7a8d-42f8-8704-65e5c7ae23a9@gmail.com>
Subject: Re: [PATCH v3] xen: Strip xen.efi by default
References: <20251105153808.20278-1-frediano.ziglio@citrix.com>
 <fdc9fd41-2224-4672-911e-3e17b428d32a@gmail.com>
 <CAHt6W4eyH_7c4Q-KYaDjNJnSXjKSVNT1iSw0sNbLMXnK3iEHRg@mail.gmail.com>
 <d193feac-3285-4c26-9a8a-ba09437e7e76@gmail.com>
 <CAHt6W4fEbuk+VzjFxfz5=T8GXCVW_jSoqqMAkiQTXL79B93SPg@mail.gmail.com>
 <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
In-Reply-To: <98e2f19f-5fce-4ad1-b821-f5abb1f815f6@suse.com>
Autocrypt-Gossip: addr=marmarek@invisiblethingslab.com; keydata=
 xsBNBE5j9EwBCACbYHjxDrxFAY3n1x9KBFvjzkG1qFSTVBnH4vpD/5Na4sZq4uDDMUCjivrm
 MzbWYaivYj96BygdOiw7PWxYrhuW0b2WYOeGudZyApgFz42g458s78EciuhgfuWBlxr8dOEN
 /9ueVFHcvtZmDbHhMVPcQ0O7gwh0JmwkOsf7P7WAfYXsQlhO/EBRrNXR0Je+GEpYADhRktxX
 h1d3Iz+oKYuwHioLX8ovoAT4+peOuecWUSpUWebpDbTR5i7NRP3PIblB4KzWJa2kh/f3mx4v
 SRGnHn+BfX42xSe0X7Ktl4Xf+KNq9Wkcjk2CZP57hV2v4pO0ZUOXD7IhlZtnfNj67WjdABEB
 AAHNPU1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
 bmdzbGFiLmNvbT7CwHoEEwEIACQCGwMFCwkIBwMFFQoJCAsFFgIDAQACHgECF4AFAll+l7cC
 GQEACgkQ24/THMrX1yw6kAgAiKiUhzAPXZj5ndqiQDl8u8PUK34SupLzYNMJOCBw5Wh+CPHe
 XYlQUwfULWxmzjiWCzzWDx2X/ONsYdRGKDKMqG5srOSWe1IYXv00MEutGsK+m/hmC5mqi/97
 DVNZ1VtKj5WW79IsI0/7ueHsQYNNrXyOfZvKsRE8VIUJ0tNfLFDFlNpq9jONuF+GviMWxrA5
 FoVaGmjh63xC0fOQYqhP2v8dbYS4B6bO5NZKI2cTHb9Li2iY0e7wIoNgvqgtR3Iv2U2Ry0yL
 D3mNQhwyxcWChexlymjfqLEZwKqaIOo57HOpt7OA+bMg6MvkdUTjNWf2GE6fqCcALjcToJ3L
 NDc1KM7ATQROY/RMAQgAtRWgUZ5mOy+c/qzmiVnxqDkiOJjmnIh3Pn+OqCtjcrTyPI9eVc06
 uH30Jkco0soLiG/UgwVw4XwBlm95j9n6TSUms4mPBh1YiR1hBjsjYwn8zp/Ue9xWk1N6E14H
 aj55GxmS2H3YIlOXfQLr0X3RHsmKixTOKyisrYlJu71FmettDFV7CgMXy1Bc1LbAE08asvAS
 ShHFdRiRRtkuVHvY/Ebq9L54kOxtlI6ahrflMcT0YCMON5oe4GgQRh3p2uy+d/LS2bgRcQST
 IebErj8x0lM271f97GvxV/ypHo7XVIDI5FX1u31Agzx3HQr035GHt4HV4/GVCz+V4xt4BonB
 tQARAQABwsBfBBgBAgAJBQJOY/RMAhsMAAoJENuP0xzK19cs5MgH/jWLXil2Ud4TdtWnBxc+
 2/QZZk2JCssc1PgWNzvH5wH7U+8lGSlUK8ZMOqrrF8C5rX0+xEn7deSrsZChIOnUFo8rhCZK
 y/mBV+FhkMj24FZZ0n8w3eF4KF2t68Pt+AvMjxQHwxAMdf3QftgQhD0qYkt/28eedUQ+jwz6
 kipc4qUQmqTEViQRPa3WAnKgNDQUDUwNruzthfGvHUjllf7zbPI8gkbARM0KlTkLikc9u+Ni
 VMbJTiGPB7YHyw2MIPq1n+mhSPAyXE6CVBnYkonQ7P3SLZssxC3PIarV+DTU68umQB3pfrfF
 7hMcAY5csWrK9/x/Zz4RUfgN6Q3HLrSp9UQ=

--------------xwuChLOhtgBM5Jv29d20D0lK
Content-Type: multipart/mixed; boundary="------------K7SAaHIwDKVZ384xYkDCeOV8"

--------------K7SAaHIwDKVZ384xYkDCeOV8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/25 05:28, Jan Beulich wrote:
> On 06.11.2025 10:58, Frediano Ziglio wrote:
>> On Thu, 6 Nov 2025 at 03:52, Demi Marie Obenour <demiobenour@gmail.com=
> wrote:
>>> Does objdump on the signed file return correct section names?
>>
>> From objdump -x
>>
>> Sections:
>> Idx Name          Size      VMA               LMA               File o=
ff  Algn
>>   0 .text         0016c9ae  ffff82d040200000  ffff82d040200000  000003=
20  2**4
>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>>   1 .rodata       0006b9e8  ffff82d040400000  ffff82d040400000  0016cc=
e0  2**2
>>                   CONTENTS, ALLOC, LOAD, DATA
>>   2 .buildid      00000035  ffff82d04046c000  ffff82d04046c000  001d86=
e0  2**2
>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>   3 .init.text    0004d123  ffff82d040600000  ffff82d040600000  001d87=
20  2**2
>>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>>   4 .init.data    0006c9b0  ffff82d040800000  ffff82d040800000  002258=
60  2**2
>>                   CONTENTS, ALLOC, LOAD, DATA
>>   5 .data.read_mostly 00028da8  ffff82d040a00000  ffff82d040a00000
>> 00292220  2**4
>>                   CONTENTS, ALLOC, LOAD, DATA
>>   6 .data         0000feec  ffff82d040a29000  ffff82d040a29000  002baf=
e0  2**4
>>                   CONTENTS, ALLOC, LOAD, DATA
>>   7 .bss          00223108  ffff82d040a39000  ffff82d040a39000  000000=
00  2**4
>>                   ALLOC
>>   8 .reloc        000016b8  ffff82d040c5d000  ffff82d040c5d000  002cae=
e0  2**2
>>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>>   9 .sbat         000000a6  ffff82d040c5f000  ffff82d040c5f000  002cc5=
a0  2**2
>>                   CONTENTS, READONLY
>>
>> Which looks correct.
>>
>> From hexdump -C I can see close to the end
>>
>> ...
>> 002cc580  30 ae 38 ae 60 ae 00 00  00 80 a3 00 10 00 00 00  |0.8.`....=
=2E......|
>> 002cc590  a0 ae c0 ae e0 ae 00 00  00 00 00 00 00 00 00 00  |.........=
=2E......|
>> 002cc5a0  73 62 61 74 2c 31 2c 53  42 41 54 20 56 65 72 73  |sbat,1,SB=
AT Vers|
>> 002cc5b0  69 6f 6e 2c 73 62 61 74  2c 31 2c 68 74 74 70 73  |ion,sbat,=
1,https|
>> 002cc5c0  3a 2f 2f 67 69 74 68 75  62 2e 63 6f 6d 2f 72 68  |://github=
=2Ecom/rh|
>> 002cc5d0  62 6f 6f 74 2f 73 68 69  6d 2f 62 6c 6f 62 2f 6d  |boot/shim=
/blob/m|
>> 002cc5e0  61 69 6e 2f 53 42 41 54  2e 6d 64 0a 78 65 6e 2e  |ain/SBAT.=
md.xen.|
>> 002cc5f0  78 73 2c 31 2c 43 6c 6f  75 64 20 53 6f 66 74 77  |xs,1,Clou=
d Softw|
>> 002cc600  61 72 65 20 47 72 6f 75  70 2c 78 65 6e 2c 34 2e  |are Group=
,xen,4.|
>> 002cc610  32 30 2e 31 2d 37 2e 32  32 2e 67 33 65 30 36 37  |20.1-7.22=
=2Eg3e067|
>> 002cc620  32 36 62 2e 78 73 39 2c  6d 61 69 6c 74 6f 3a 73  |26b.xs9,m=
ailto:s|
>> 002cc630  65 63 75 72 69 74 79 40  78 65 6e 73 65 72 76 65  |ecurity@x=
enserve|
>> 002cc640  72 2e 63 6f 6d 0a 00 00  00 00 00 00 00 00 00 00  |r.com....=
=2E......|
>> 002cc650  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |.........=
=2E......|
>> 002cc660  2c 00 00 00 2e 69 6e 69  74 2e 74 65 78 74 00 2e  |,....init=
=2Etext..|
>> 002cc670  69 6e 69 74 2e 64 61 74  61 00 2e 64 61 74 61 2e  |init.data=
=2E.data.|
>> 002cc680  72 65 61 64 5f 6d 6f 73  74 6c 79 00 00 00 00 00  |read_most=
ly.....|
>> 002cc690  9e 05 00 00 00 02 02 00  30 82 05 92 06 09 2a 86  |........0=
=2E....*.|
>> 002cc6a0  48 86 f7 0d 01 07 02 a0  82 05 83 30 82 05 7f 02  |H........=
=2E.0....|
>> 002cc6b0  01 01 31 0f 30 0d 06 09  60 86 48 01 65 03 04 02  |..1.0...`=
=2EH.e...|
>> 002cc6c0  01 05 00 30 5c 06 0a 2b  06 01 04 01 82 37 02 01  |...0\..+.=
=2E...7..|
>> 002cc6d0  04 a0 4e 30 4c 30 17 06  0a 2b 06 01 04 01 82 37  |..N0L0...=
+.....7|
>> 002cc6e0  02 01 0f 30 09 03 01 00  a0 04 a2 02 80 00 30 31  |...0.....=
=2E....01|
>> 002cc6f0  30 0d 06 09 60 86 48 01  65 03 04 02 01 05 00 04  |0...`.H.e=
=2E......|
>> 002cc700  20 e2 47 64 f8 e8 7b 62  eb 17 e0 13 0a 0d 93 02  | .Gd..{b.=
=2E......|
>> 002cc710  7a d8 3b f0 20 a8 ee 3d  49 98 3f de c1 47 de 15  |z.;. ..=3D=
I.?..G..|
>> 002cc720  43 a0 82 03 2c 30 82 03  28 30 82 02 10 a0 03 02  |C...,0..(=
0......|
>> 002cc730  01 02 02 11 00 8f fc 11  bf 41 54 40 74 89 2c 53  |.........=
AT@t.,S|
>> 002cc740  a5 78 c1 e8 32 30 0d 06  09 2a 86 48 86 f7 0d 01  |.x..20...=
*.H....|
>> 002cc750  01 0b 05 00 30 1c 31 1a  30 18 06 03 55 04 03 13  |....0.1.0=
=2E..U...|
>> 002cc760  11 58 65 6e 53 65 72 76  65 72 20 58 65 6e 20 64  |.XenServe=
r Xen d|
>> 002cc770  65 76 30 1e 17 0d 32 35  30 33 32 30 31 36 35 35  |ev0...250=
3201655|
>> 002cc780  30 37 5a 17 0d 33 37 30  31 31 39 30 33 31 34 30  |07Z..3701=
1903140|
>> 002cc790  37 5a 30 1c 31 1a 30 18  06 03 55 04 03 13 11 58  |7Z0.1.0..=
=2EU....X|
>> 002cc7a0  65 6e 53 65 72 76 65 72  20 58 65 6e 20 64 65 76  |enServer =
Xen dev|
>> ...
>>
>> So, this confirms that the string table is there to support larger
>> section names and the signature is there and it's working.
>=20
> But is it going to work on all EFI implementations, or merely the one y=
ou tried?
> Of course it would help if Demi could give more concrete pointers to (p=
ossible)
> implementations where there might be (known? suspected?) issues.
>=20
> Jan

I misread the PE hashing code in EDK2.  I assumed it mishandled the case =
where
there is data *between* the sections and the signature, but it actually m=
ishandles
the case where there is data *after* the signature.  I'll file an EDK2 PR=
 to
reject such images on the grounds that they could never have worked.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------K7SAaHIwDKVZ384xYkDCeOV8
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------K7SAaHIwDKVZ384xYkDCeOV8--

--------------xwuChLOhtgBM5Jv29d20D0lK--

--------------593kG1U3oOX9eLmTLCNIK5Gu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmkMezwACgkQszaHOrMp
8lOjQg/9HKemwFBcSnu9bPQYz9t6oWv8uaCWqMRz5f0vE3Jnn9Vai68BI88QSDTM
He0Ber8QxP/x0eT2dT/IafavLsGCBALIUxjyDSYH7KnrdXcEhA5YNJpCHqVwMHCb
3Hd92DMYEOoLhBdSXMnT2MNrZk2FsUiwsHOe7NS+vJG/J0HWYK9vAP4OUSKfXTPr
5oJ9ApqajeSErXr3rohVPhoGGBiHdscTbuvcmowrjpzdFJAbrpySoLe8+/OLfFae
suNge63SiRFbXFAq2KYb3e8ToRHQCeQ7GSIfrZN3lG3mwZX/OfSREMPgWZz+YWhp
w/HG1zfkDTi7bIVElRSn9vIyJ+HNuf4ZXTbWXFxi2+z9TdFrUlDPgrwM+yFjekop
z/Wzu8e99BZYG5mB1mnctRtrlRcbPjqSOPIjVoiWqgRYpR1pi2vqS6RMXosQrB9n
lbGz2vqjRvgd9T9dOHb8TTeRbvCGm4xPla/TFjVsBEOwNInwDiaiC3df3mcXlkPx
HFizHIiGITWEaoCkMhdgM0zhJYDe5eD9GLJARWMRyswtmTCIIH8TjQG+lNIFHlkS
wJCjC/bdM52lCRdOfXjyVZDgp8WSTLzRu5FbcTglh+iPtzFvq+fQZLomgR6Sw2sO
eGmypxhJQ/JMUVS4198OP97RM9UjQAeG1btk5v0wCWHA2FPCR8E=
=vMWq
-----END PGP SIGNATURE-----

--------------593kG1U3oOX9eLmTLCNIK5Gu--


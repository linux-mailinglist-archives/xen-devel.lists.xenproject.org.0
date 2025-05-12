Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4904CAB47D2
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 01:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982224.1368772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcPQ-0003fG-2E; Mon, 12 May 2025 23:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982224.1368772; Mon, 12 May 2025 23:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcPP-0003cT-Us; Mon, 12 May 2025 23:18:07 +0000
Received: by outflank-mailman (input) for mailman id 982224;
 Mon, 12 May 2025 23:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKQa=X4=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uEcPO-0003bz-JU
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 23:18:06 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a9de7ab-2f87-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 01:18:04 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e7569ccf04cso4411828276.0; 
 Mon, 12 May 2025 16:18:04 -0700 (PDT)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-70a53c7c72csm14460777b3.74.2025.05.12.16.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 16:18:02 -0700 (PDT)
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
X-Inumbo-ID: 5a9de7ab-2f87-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747091883; x=1747696683; darn=lists.xenproject.org;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XTVg2O1fCdquiTRKlwNHkGeiCx4N78omEs7oZELGtc=;
        b=A3p5bmdKYlCVxCFCYSf9cEB9CrZ8SmxirVObLLmL3OHLzRc6scbp8gUwHo4YJIbiou
         /iDx31QkXyc0DPmVwjPNK7u60vPg1U9nplrn/7vhF0u349G86rE1L7/OnJd5LXYsUhpI
         Rf00z7Y5pPmr7He45YlaH/IIuj8tMiYkX68LJNqyPbS+N6oOH6yfiukzOrY+hJ9tcwH0
         OcTt32P4Htj140/Vuaijh0nnUHX1WT9x3JFwPyFThmUuQ3sjSIreNDsC9VFq9cZzDuA+
         Vysa1W3ANf3YPSV9bCc+pAMKjT7zAimHXDLaEq3mhGkztRGQdKQSYbiu1jrd+FHmYxza
         rbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747091883; x=1747696683;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6XTVg2O1fCdquiTRKlwNHkGeiCx4N78omEs7oZELGtc=;
        b=rF3jvU+gOcXc9aUJYD+UfnCbTxyHyWtaCchjyf2XpWQGB2BBaTyKniTF+y0uZXaHZS
         xGLFd8OFqmUjl4euGf5dyEawth9qKf8nkDutQtIdq5PYiKcklWkUJwhr3QO/xPnZJTgG
         wn+LiqmoOsxucsL1Xf7dxwDfqtp2D9xnxWTmkVPPCShaWVbrg1NvijU2u9bqf9Wh1YgQ
         ewuhzK4zjDhhSQ8vXYjzv2owXWouILi+T/wkUMrzfEQmbvqGWrnX9raxOt9d7yith8YW
         iInT9OcSALuRWRI127VdYgoUPFays4V119xhW0jQ8A/5xwnplnW3cvrvmlXgiOQMTof0
         FPTg==
X-Forwarded-Encrypted: i=1; AJvYcCXM8xn2OW70/f1Ul9RX7tYO7wuA2rTH+d6bwkw5HetA/LnFAQARyP+WZo+smnpfdt0SttwFb8tMNYbe@lists.xenproject.org, AJvYcCXg2MsbmIYk66DwGryYGEAulswNSrjcDski3sEByyFGnN7k74ymB/M/P5R+z2rowafMcZ4OoLOU7uF2XPtwfDcDcQ==@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzk8phKlsvhrBXdsedkjhrJJa/Ow6ewUc9cw53SCw6L5Ua1urei
	9h/Qc6D0fefsjP6jJHT5DCqDuYzCZIZ7eFlYtlpNijJc+KJmbLLe
X-Gm-Gg: ASbGncsc/eWzWlL6nxKjJcD1O5zmCA2eLJsLWz9pLBy711hJHkifQr/4iSDN8xMqJmT
	89KD+QQ7ojnWyqOHSkG6SPcz7qa3uolturwsEXWZK4elAW4deqOlkAHaFksoxfXEId23/ogaWYk
	8TWmFPameR9UmLmC070Z5q6Oq6di+3Np9o0y/ZZF9Wb2dVZ9pvLuCpq/qUQrQdHvWzo5D/Y02B0
	RD+XF68ZVotyZROzCDcM0fNyiJBl7IKFSgl1yrGbGMXKxdJXGA4zUHfwlzepLmYtctAQfmrS2zQ
	AorO+MFOGxhS7CvJYNH5+E9M8gFi6P8JMaeLDrDCNAbY9c+8a5IfHtg=
X-Google-Smtp-Source: AGHT+IGwj38nsNCLvMOXcii0qBFVwK11yXpsFDB9b4m1kVAuD1RsaSa5BXLe0Vx1aNtCYFS+G9agUA==
X-Received: by 2002:a05:690c:62ca:b0:707:e5b0:7cc9 with SMTP id 00721157ae682-70a3fb54d36mr200213617b3.34.1747091882813;
        Mon, 12 May 2025 16:18:02 -0700 (PDT)
Message-ID: <5ca4846e-8cb9-4160-9671-a12f8e5af9f9@gmail.com>
Date: Mon, 12 May 2025 19:18:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
 <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
 <D9RJ9PK28QNQ.EKGYRHXWTYZ1@amd.com> <aB3d2FxH8JOxM5q9@macbook.lan>
 <cfec871c-4785-4c36-80fb-b1ddb461c5bb@gmail.com>
 <aCGsaaoowoKvWEmb@macbook.lan>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Subject: Re: Mapping memory into a domain
In-Reply-To: <aCGsaaoowoKvWEmb@macbook.lan>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mw05HYe8G3lmUugieckIt4vG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mw05HYe8G3lmUugieckIt4vG
Content-Type: multipart/mixed; boundary="------------ltTqQ89JH0h15yWUwWg0kg5E";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <agarciav@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>
Message-ID: <5ca4846e-8cb9-4160-9671-a12f8e5af9f9@gmail.com>
Subject: Re: Mapping memory into a domain
References: <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
 <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
 <aBuatoL1dm0tjZ9P@macbook.lan>
 <30243d25-881d-42d3-90c2-f791c3632372@gmail.com>
 <aBxizlMj3D94M3WS@macbook.lan>
 <ae1a35dd-b7b2-426f-b2d5-723bb07b0e79@gmail.com>
 <D9RJ9PK28QNQ.EKGYRHXWTYZ1@amd.com> <aB3d2FxH8JOxM5q9@macbook.lan>
 <cfec871c-4785-4c36-80fb-b1ddb461c5bb@gmail.com>
 <aCGsaaoowoKvWEmb@macbook.lan>
In-Reply-To: <aCGsaaoowoKvWEmb@macbook.lan>
Autocrypt-Gossip: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==

--------------ltTqQ89JH0h15yWUwWg0kg5E
Content-Type: multipart/mixed; boundary="------------0fxwGUxR1QigFmCKX9XeVcdE"

--------------0fxwGUxR1QigFmCKX9XeVcdE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/12/25 4:08 AM, Roger Pau Monn=C3=A9 wrote:
> On Fri, May 09, 2025 at 02:21:57PM -0400, Demi Marie Obenour wrote:
>> On 5/9/25 6:50 AM, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, May 09, 2025 at 11:47:36AM +0200, Alejandro Vallejo wrote:
>>>>>>>>> A Linux driver that needs access to userspace memory
>>>>>>>>> pages can get it in two different ways:
>>>>>>>>>
>>>>>>>>> 1. It can pin the pages using the pin_user_pages family of APIs=
=2E
>>>>>>>>>    If these functions succeed, the driver is guaranteed to be a=
ble
>>>>>>>>>    to access the pages until it unpins them.  However, this als=
o
>>>>>>>>>    means that the pages cannot be paged out or migrated.  Furth=
ermore,
>>>>>>>>>    file-backed pages cannot be safely pinned, and pinning GPU m=
emory
>>>>>>>>>    isn=E2=80=99t supported.  (At a minimum, it would prevent th=
e pages from
>>>>>>>>>    migrating from system RAM to VRAM, so all access by a dGPU w=
ould
>>>>>>>>>    cross the PCIe bus, which would be very slow.)
>>>>>>>>
>>>>>>>> From a Xen p2m this is all fine - Xen will never remove pages fr=
om the
>>>>>>>> p2m unless it's requested to.  So the pining, while needed on th=
e Linux
>>>>>>>> side, doesn't need to be propagated to Xen I would think.
>>>>
>>>> It might still be helpful to have the concept of pinning to avoid th=
em
>>>> being evicted for other reasons (ballooning?). I don't think it'd be=

>>>> sane to allow returning to Xen a page that a domain ever shared with=
 a
>>>> device.
>>>
>>> If mapped using the p2m_mmio_direct type in the p2m a domain won't be=

>>> able to balloon them out.  It would also be misguided for a guest
>>> kernel to attempt to balloon out memory that I presume will be inside=

>>> of a PCI device BAR from the guest point of view.
>>
>> Indeed it will be inside a BAR.
>>
>>>> re: being requested. Are there real promises from Xen to that effect=
? I
>>>> could make a hypervisor oversubscribing on memory that swaps non-IOV=
A
>>>> mem in and out to disk, moving it around all the time and it would b=
e
>>>> compliant with the current behaviour AIUI, but it wouldn't work with=

>>>> this scheme, because the mfn's would be off more often than not.
>>>
>>> Even if Xen supported domain memory swapping, that could never be use=
d
>>> with domains that have devices attached, as it's not possible to fixu=
p
>>> the p2m on IOMMU fault and retry the access.
>>>
>>> Not sure you could even move mfns around, as you would need an atomic=

>>> way to copy the previous page contents and set the PTE to point to th=
e
>>> new page.
>>>
>>> Unless you want to get into a (IMO) complicated scheme where the
>>> domain notifies the hypervisor which ranges are being used for device=

>>> DMA accesses (and thus requires guest kernel changes), I think
>>> swapping of guest memory when there are assigned devices is a no-go.
>>>
>>> Xen has (or had? as I never actually seen it being used) a mechanism
>>> to swap domain memory to a dom0 file (see tools/xenpaging.c).  Howeve=
r
>>> more than one provider had mentioned to me that one feature they
>>> particularly preferred of Xen over KVM is that it would never swap
>>> guest memory.  Not sure if that's still the case, but some struggled
>>> to prevent KVM from swapping guest memory, and got complains of
>>> slowness from their tenants.
>>>
>>> For the purposes of getting a prototype I would suggest that you
>>> assume p2m memory cannot be randomly swapped out, unless requested by=

>>> either the guest or the control domain.
>>
>> The API being discussed here needs to support frontends that have
>> assigned PCI devices, but the pages should never be mapped into
>> the frontend domain=E2=80=99s IOMMU context.  If the frontend tries to=

>> DMA into one of these pages it=E2=80=99s a frontend bug.
>=20
> That's a detail I didn't get from your previous description.  If
> memory is not to be added to the IOMMU page-tables you will need an
> extra flag or similar to signal this, as by default all memory added
> to a guest p2m is also added to the IOMMU page-tables.  And when using
> shared page-tables between the IOMMU and the CPU there's no way to add
> mappings to the CPU only.

I suspect that in practice, shared CPU/IOMMU page tables will need to be
disabled when this API is in use, as...

> Do you really need such mappings to be added only to the p2m, and not
> the IOMMU page-tables?  I don't think the pages "should never be
> mapped", but rather "don't need to be mapped" as the implementation
> won't support DMA accesses (iow: "never" is too strong in this
> context).  IMO it is fine if for an initial prototype the pages are
> also added to the IOMMU page-tables, and later you can add a flag (or
> a new hypercall) that strictly only adds pages to the p2m and not the
> IOMMU page-tables, it's likely to also be a good performance
> improvement.

=2E..I doubt that an IOTLB flush from an MMU notifier that might be calle=
d
fairly frequently will be acceptable for anything but a prototype.
I don't have any benchmarks, though.  Also, having DMA operations succeed=

or fail non-deterministically would be much harder to debug than for them=

to always fail.

>>>>>>> If pinning were enough things would be simple, but sadly it=E2=80=
=99s not.
>>>>>>>
>>>>>>>>> 2. It can grab the *current* location of the pages and register=
 an
>>>>>>>>>    MMU notifier.  This works for GPU memory and file-backed mem=
ory.
>>>>>>>>>    However, when the invalidate_range function of this callback=
, the
>>>>>>>>>    driver *must* stop all further accesses to the pages.
>>>>>>>>>
>>>>>>>>>    The invalidate_range callback is not allowed to block for a =
long
>>>>>>>>>    period of time.  My understanding is that things like dirty =
page
>>>>>>>>>    writeback are blocked while the callback is in progress.  My=

>>>>>>>>>    understanding is also that the callback is not allowed to fa=
il.
>>>>>>>>>    I believe it can return a retryable error but I don=E2=80=99=
t think that
>>>>>>>>>    it is allowed to keep failing forever.
>>>>>>>>>
>>>>>>>>>    Linux=E2=80=99s grant table driver actually had a bug in thi=
s area, which
>>>>>>>>>    led to deadlocks.  I fixed that a while back.
>>>>>>>>>
>>>>>>>>> KVM implements the second option: it maps pages into the stage-=
2
>>>>>>>>> page tables (or shadow page tables, if that is chosen) and unma=
ps
>>>>>>>>> them when the invalidate_range callback is called.
>>>>
>>>> I'm still lost as to what is where, who initiates what and what the =
end
>>>> goal is. Is this about using userspace memory in dom0, and THEN shar=
ing
>>>> that with guests for as long as its live? And make enough magic so t=
he
>>>> guests don't notice the transitionary period in which there may not =
be
>>>> any memory?
>>>>
>>>> Or is this about using domU memory for the driver living in dom0?
>>>>
>>>> Or is this about something else entirely?
>>>>
>>>> For my own education. Is the following sequence diagram remotely acc=
urate?
>>>>
>>>> dom0                              domU
>>>>  |                                  |
>>>>  |---+                              |
>>>>  |   | use gfn3 in the driver       |
>>>>  |   | (mapped on user thread)      |
>>>>  |<--+                              |
>>>>  |                                  |
>>>>  |  map mfn(gfn3) in domU BAR       |
>>>>  |--------------------------------->|
>>>>  |                              +---|
>>>>  |              happily use BAR |   |
>>>>  |                              +-->|
>>>>  |---+                              |
>>>>  |   | mmu notifier for gfn3        |
>>>>  |   | (invalidate_range)           |
>>>>  |<--+                              |
>>>>  |                                  |
>>>>  |  unmap mfn(gfn3)                 |
>>>>  |--------------------------------->| <--- Plus some means to making=
 guest=20
>>>>  |---+                          +---|      vCPUs pause on access.
>>>>  |   | reclaim gfn3    block on |   |
>>>>  |<--+                 access   |   |
>>>>  |                              |   |
>>>>  |---+                          |   |
>>>>  |   | use gfn7 in the driver   |   |
>>>>  |   | (mapped on user thread)  |   |
>>>>  |<--+                          |   |
>>>>  |                              |   |
>>>>  |  map mfn(gfn7) in domU BAR   |   |
>>>>  |------------------------------+-->| <--- Unpause blocked domU vCPU=
s
>>>
>>> The guest vCPU will already pause on access if there's a p2m
>>> violation, until the ioreq has completed and the vCPU execution can
>>> resume.  That's in control of the ioreq server that handles the
>>> request.
>>>
>>> I don't know about the dom0 user-space part, but that's possibly of n=
o
>>> concern for the implementation side in Xen?
>>
>> I believe so, yes.
>>
>>> My understanding of the actions needed from the Xen side is:
>>>
>>>  1. Map either RAM owned by the hardware domain or an MMIO page into
>>>     a domain p2m.
>>>  2. Remove entries from a domain p2m.
>>>  3. Handle p2m violations resulting from guest accesses, using 1. and=

>>>     force a guest access retry (or emulate the access).
>>>
>>> 1. Can possibly be done with XEN_DOMCTL_memory_mapping and
>>> XENMEM_add_to_physmap_batch, but as I understood it it's not ideal.
>>> Demi would like a way to use the same hypercall to map either RAM or
>>> IOMEM into a domain p2m.
>>
>> Indeed so, and also the backend domain might be a driver domain instea=
d
>> of the hardware domain.  It needs to have privilege over the frontend,=

>> but it should not need privilege over the whole system.
>=20
> This can all be arranged for, I wouldn't get bugged down on this
> details initially.

That's good to know.

>>> 2. What hypercall to use depends on how the memory is mapped.
>>>
>>> 3. ioreq servers will already get requests for accesses to unmapped
>>> regions they have registered for.  If the access is to be retried we
>>> need to expand ioreq interface a bit to handle this case.  Adding a
>>> new ioreq state like STATE_IORESP_RETRY might be enough?  Maybe I'm
>>> being naive though.
>>
>> This is where an implementation in a real userspace emulator would
>> be very useful, to ensure that the API being implemented is actually
>> usable in practice.
>=20
> My suggestion for adding a "retry" response type to the ioreq
> interface was so that your ioreq model implementation would be
> simpler.  However if that's more hassle for you, I would initially map
> and emulate the access, as that would also be correct and shouldn't
> require any changes to the ioreq interface.  It can always be expanded
> later to support a map and retry model.
>=20
> AFAICT, from the ongoing discussion above, the only uncertainty is
> which hypercall(s) to use to map either MMIO or RAM into a guest p2m.
> I wouldn't invest a huge amount of time into prototyping something
> very complex, and rather get a very simple hypercall implemented that
> fits your needs.  You could likely make a frankenhypercall based on the=

> implementations of XEN_DOMCTL_memory_mapping and
> XENMEM_add_to_physmap, so that you can get a prototype working.
>=20
> I think at this point it's important to get a functional prototype, so
> that we know exactly the requirements of the interfaces that you need.
> I wouldn't bother to design a detailed interface until we know exactly
> that such interface is suitable for your goals, and to that end we
> need a prototype with whatever you can glue together.

I believe AMD needs this for their automotive use-case.  What is the
status of this code?  I believe it would be best to send whatever
code AMD has available right now.  Just mark it as RFC if it is
incomplete.  That allows getting upstream feedback sooner rather
than later.

Xenia, Alejandro, Stefano, would this be feasible?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------0fxwGUxR1QigFmCKX9XeVcdE
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

--------------0fxwGUxR1QigFmCKX9XeVcdE--

--------------ltTqQ89JH0h15yWUwWg0kg5E--

--------------mw05HYe8G3lmUugieckIt4vG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmgigdkACgkQszaHOrMp
8lMNlg//doCtALKgWu/w6qjlBPFJEHoFN9TcYxrr8I4mqJTCruQZmE0PoEP/K+82
4OfgMX/nkY3OHAT0qhGVf/0x9+u7V+C9fzS38MiR4SM7tfuiWZeG4vZPvhb/5QPU
wb5YV+Tso2N5rk1Lh+cPNw4hW+LgWjD4Nan43qZu/aJnrXWtRySG7RUN0W3xhQmC
ZdJTVqfIRydgKZDILFKZOT+vexLn6O6sPe1ChvZKY8aaZoW0vXpW7rYzfTvcV0Q5
3ufITt3nBg+iYhSrE710uDFjIbVDcBC5Ot71dR784KJRJb2FBsSynFZYlBWHO0uY
AxqDm/fs+BhW6o86o6npRH6egzGGyZ+mPVMvAQqoq/VBaDsNBL9uqrwxinOComu3
1nhP1LLdzm+zBqqdTmV/pGsc18mso8L6IxvgjAhH4F7srjWMdibvgDTi7cBA4h1L
iBHQAIqROwhkB+xkZ2oimD42XffdZxrX22ENuQdxjGN7QGWfdREJeefo6K3nsDZh
ERUZGgoOf48J3RblRK4klJIBrX4FVsoJo3QWAyeIE/covy7gK/zD+YiQn3MunA4k
DGe6OAsPAytRbGrxaXkl9QFelBUpK/smx3tqBr8AQz39egT/ZwQsydlDu4IAw+gA
swttjKKbTtq+0G+IrnuuPww7NN0Ucd70gSbuNiiFYlXfLVX1LLc=
=zfDI
-----END PGP SIGNATURE-----

--------------mw05HYe8G3lmUugieckIt4vG--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3AAACF0D
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 22:55:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978025.1364906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCPK9-0001eN-JE; Tue, 06 May 2025 20:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978025.1364906; Tue, 06 May 2025 20:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCPK9-0001cK-E6; Tue, 06 May 2025 20:55:33 +0000
Received: by outflank-mailman (input) for mailman id 978025;
 Tue, 06 May 2025 20:55:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euHp=XW=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uCPK8-0001c9-Ac
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 20:55:32 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71bd5ebb-2abc-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 22:55:30 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6ff37565154so54278607b3.3; 
 Tue, 06 May 2025 13:55:31 -0700 (PDT)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-708c46cbcc0sm28818677b3.118.2025.05.06.13.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 13:55:28 -0700 (PDT)
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
X-Inumbo-ID: 71bd5ebb-2abc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746564930; x=1747169730; darn=lists.xenproject.org;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaQudY3fwgxYRyADZDL8jhCQROjxwSC2Czzwe4219vc=;
        b=IVKiE4UHm+Ngs4zU3opP28wYAuaX9xChoN6v4o3DphyPeeHrk/EAxV7zVsY0flcdU2
         nKJQfjAuWDizFIiaEUZ5JyU99kGkqUDznwCgA4u1zA1AQ4jS6ZZ6hwZOIn5JJHvhvXdZ
         +jw3B6VRNsX/P42MAKDZay0LCWUMfAfw7EGCmJnJaGOZNzBr2Ydyy1INsWuOs1loNnvN
         ECZu901l6vMOcY/4j1ujoJaeSJXOvcplsbZ6dpH3nUi9QwVLpruvDgGp9/SM3fy8CJfE
         +UbH+GP6/A4H0caZgO6y7Gmi7t4G4UtMb9t9b273GJZ2IMd9xeu5Z5Wdvwhm0yLg9y6j
         5VkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746564930; x=1747169730;
        h=in-reply-to:subject:autocrypt:from:content-language:references:cc
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XaQudY3fwgxYRyADZDL8jhCQROjxwSC2Czzwe4219vc=;
        b=fiTDeEioyoWsoE9wHuI+0x2Onco0E1QPzAZGwjTFUYxg+vABagBUtAcKaaJtYFloA3
         llN6HYz/wBzhJdsASHvWD37rAW1JTb0gT7Hyfwg61wyiWXorCySKWkBDNrrgQGgI9XJi
         zdjexpffiX6aBWIsEIbD71HPLh/yJjP77tRISHQ5dHi0euGbnyK1MeesZv3DShA1OueE
         BlZqrMsSFL5MgMnDOHdKcWXOxcPmuuSExphdoB+QBmIquhMOhZInNniY78pjHUvqi9ya
         R7Ga9P1j8Fc490RcP93mVmDJMSXo+jrsUbpjt3wJXr1IOJ3aCWM8aK0KHAaa2qMtoR1X
         dr6g==
X-Forwarded-Encrypted: i=1; AJvYcCUFtJYRJRKRu46wpj7pB5m+sa8gzq35GyZOBuodTpCQA1P+naxkLIFW4VripunNqORU/HHi8++Y3TBZFIgKsetqHA==@lists.xenproject.org, AJvYcCXqOUdFuqmIzpe0DhvcJdk/a1Naoa87bn0gVyG7XP2aeBuR9v8Md6pi7j3G+k/cpGJPlXJicEhnvZz0@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMFDs6h2PKcyqrBISiWcaL7iA+LsqrDYItXlPZVVvK/VdIFJoj
	T2FnMiJAhp5R8UromSMWntpnqONf8oe2iCdm/AyaMnDryf9wVXTh
X-Gm-Gg: ASbGncupMRNSM79lcYZ49lRo8YbJwhHnEG1nTFpghyUvA9APmPBne7ErKC7G7AVs2I4
	wII1SMMDg4KfwsFF92acbdp1IV+TGiBvr67I2BW703fa97ftu/kbiO4duvyi0cFHBOBgKKERcq6
	ysJIEwKTZEZSVvvX1lPYXj0nv3CZrqYUTc/e9NgnijyTkKYdGgDhyv0PIxLn1qnDcGjBZ292p18
	Z1RrbPQNcZrjVXCJnHmCJVszZJiqjx4GZUH0V1WgUj6hoxBlM5HI7yacLFft6m7x4aPit2A4BxK
	p716sm4X8X+tQDNGD91mzL/7cmqsykjBWIbeUHsuJbRV
X-Google-Smtp-Source: AGHT+IHnF0X/mPFrP4DqJbJ/NpZiRDNjVZBqZ4bpOieGpmHhCVTO66fclgRX4H0fg528Otz+Et+x7Q==
X-Received: by 2002:a05:690c:650a:b0:708:39b1:863e with SMTP id 00721157ae682-70a1da8fc05mr15269667b3.15.1746564929630;
        Tue, 06 May 2025 13:55:29 -0700 (PDT)
Message-ID: <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
Date: Tue, 6 May 2025 16:56:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alejandro Vallejo <agarciav@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Subject: Re: Mapping memory into a domain
In-Reply-To: <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ug0yZErzvnn2E0ccOh0nm0Pd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ug0yZErzvnn2E0ccOh0nm0Pd
Content-Type: multipart/mixed; boundary="------------TSCZeA7Ylj9iMZaXR4OOSF5Y";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Alejandro Vallejo <agarciav@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Xen-devel <xen-devel-bounces@lists.xenproject.org>
Message-ID: <ae3465e2-b803-4a26-8443-0bc1d38da7ac@gmail.com>
Subject: Re: Mapping memory into a domain
References: <82772686-edcd-41e4-b81c-f6b3ded30901@gmail.com>
 <D9O702EAEGRU.10CY1WTUELAKF@amd.com>
 <24a0a77b-e543-453d-b20b-0dbac111287c@gmail.com>
 <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
In-Reply-To: <D9P3M1Z20DAB.1HSZ79GOZOMKR@amd.com>
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

--------------TSCZeA7Ylj9iMZaXR4OOSF5Y
Content-Type: multipart/mixed; boundary="------------71UNXmZ6EkFBsUxqKNQWhGOQ"

--------------71UNXmZ6EkFBsUxqKNQWhGOQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/6/25 9:06 AM, Alejandro Vallejo wrote:
> On Tue May 6, 2025 at 3:02 AM CEST, Demi Marie Obenour wrote:
>> On 5/5/25 7:32 AM, Alejandro Vallejo wrote:
>>> I suppose this is still about multiplexing the GPU driver the way we
>>> last discussed at Xen Summit?
>>>
>>> On Mon May 5, 2025 at 12:51 AM CEST, Demi Marie Obenour wrote:
>>>> What are the appropriate Xen internal functions for:
>>>>
>>>> 1. Turning a PFN into an MFN?
>>>> 2. Mapping an MFN into a guest?
>>>> 3. Unmapping that MFN from a guest?
>>>
>>> The p2m is the single source of truth about such mappings.
>>>
>>> This is all racy business. You want to keep the p2m lock for the full=

>>> duration of whatever operation you wish do, or you risk another CPU
>>> taking it and pulling the rug under your feet at the most inconvenien=
t
>>> time.
>>>
>>> In general all this faff is hidden under way too many layers beneath
>>> copy_{to,from}_guest(). Other p2m manipulation high-level constructs
>>> that might do interesting things worth looking at may be {map,unmap}_=
mmio_region()
>>>
>>> Note that not every pfn has an associated mfn. Not even every valid p=
fn
>>> has necessarily an associated mfn (there's pod). And all of this is
>>> volatile business in the presence of a baloon driver or vPCI placing
>>> mmio windows over guest memory.
>>
>> Can I check that POD is not in use? =20
>=20
> Maybe, but now you're reaching exponential complexity considering each
> individual knob of the p2m into account.
>=20
>>
>>> In general anything up this alley would need a cohesive pair for
>>> map/unmap and a credible plan for concurrency and how it's all handle=
d
>>> in conjunction with other bits that touch the p2m.
>>
>> Is taking the p2m lock for the entire operation a reasonable approach
>> for concurrency?  Will this cause too much lock contention?
>=20
> Maybe. It'd be fine for a page. Likely not so for several GiB if they
> aren't already superpages.
>=20
>>
>>>> The first patch I am going to send with this information is a docume=
ntation
>>>> patch so that others do not need to figure this out for themselves.
>>>> I remember being unsure even after looking through the source code, =
which
>>>> is why I am asking here.
>>>
>>> That's not surprising. There's per-arch stuff, per-p2mtype stuff,
>>> per-guesttype stuff. Plus madness like on-demand memory. It's no wond=
er
>>> such helpers don't exist and the general manipulations are hard to
>>> explain.
>>
>> Is this a task that is only suitable for someone who has several years=

>> experience working on Xen, or is it something that would make sense fo=
r
>> someone who is less experienced?
>=20
> The p2m is a very complex beast that integrates more features than I
> care to count. It requires a lot of prior knowledge. Whoever does it
> must know Xen fairly well in many configurations.
>=20
> The real problem is finding the right primitives that do what you want
> without overcomplicating everything else, preserving system security
> invariants and have benign (and ideally clear) edge cases.
>=20
> This was the last email you sent (I think?). Has any of the requirement=
s
> changed in any direction?
>=20
>   https://lore.kernel.org/xen-devel/Z5794ysNE4KDkFuT@itl-email/

Map and Revoke are still needed, with the same requirements as described
in this email.  Steal and Return were needed for GPU shared virtual memor=
y,
but it has been decided to not support this with virtio-GPU, so these
primitives are no longer needed.

> Something I'm missing there is how everything works without Xen. That
> might help (me, at least) guage what could prove enough to support the
> usecase. Are there sequence diagrams anywhere about how this whole thin=
g
> works without Xen? I vaguely remember you showing something last year i=
n
> Xen Summit in the design session, but my memory isn't that good :)

A Linux driver that needs access to userspace memory
pages can get it in two different ways:

1. It can pin the pages using the pin_user_pages family of APIs.
   If these functions succeed, the driver is guaranteed to be able
   to access the pages until it unpins them.  However, this also
   means that the pages cannot be paged out or migrated.  Furthermore,
   file-backed pages cannot be safely pinned, and pinning GPU memory
   isn=E2=80=99t supported.  (At a minimum, it would prevent the pages fr=
om
   migrating from system RAM to VRAM, so all access by a dGPU would
   cross the PCIe bus, which would be very slow.)

2. It can grab the *current* location of the pages and register an
   MMU notifier.  This works for GPU memory and file-backed memory.
   However, when the invalidate_range function of this callback, the
   driver *must* stop all further accesses to the pages.

   The invalidate_range callback is not allowed to block for a long
   period of time.  My understanding is that things like dirty page
   writeback are blocked while the callback is in progress.  My
   understanding is also that the callback is not allowed to fail.
   I believe it can return a retryable error but I don=E2=80=99t think th=
at
   it is allowed to keep failing forever.

   Linux=E2=80=99s grant table driver actually had a bug in this area, wh=
ich
   led to deadlocks.  I fixed that a while back.

KVM implements the second option: it maps pages into the stage-2
page tables (or shadow page tables, if that is chosen) and unmaps
them when the invalidate_range callback is called.  Furthermore,
if a page fault happens while the page is unmapped, KVM will try
to bring the pages back into memory so the guest can access it.

For GPU acceleration via virtio-GPU native contexts to work,
the Xen interface driver needs to do the same thing with GPU
buffers that KVM does: it needs to fault the pages into guest
memory on-demand and revoke access to the pages when the host
kernel demands them back.  There really is no alternative that
I am aware of.  The need to handle guest page faults doesn=E2=80=99t
come from the host kernel, but rather from guest userspace.
It isn=E2=80=99t practical to change guest userspace to remove this
requirement.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------71UNXmZ6EkFBsUxqKNQWhGOQ
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

--------------71UNXmZ6EkFBsUxqKNQWhGOQ--

--------------TSCZeA7Ylj9iMZaXR4OOSF5Y--

--------------Ug0yZErzvnn2E0ccOh0nm0Pd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmgad20ACgkQszaHOrMp
8lOKkBAAmdWylLAdJx4cuxHdliQfF6h++9AfsEEKDASVk28FqnFa7QonCJPpXEnb
1ezThILwsvprAtWE+/CSfoviMayL40+lB6PZfSjY3DAtv1YSp/IMHwPhYM6+XZo9
W8IBnM6tD3PGiuCPY7TpbcfB5hDRTtszhegueDCXCgXABx0ePESfsvfazR9gV56u
CBwuUvCz/UkMZYw/18fT/g2kybrVouIwq0/3iYSQBGTQOgvMzk+8s/C0g8qMVYp8
tXV3AYczxXUbKl6jjo1JhqDW/Zt8vFQJdAnNM2H4T3doDS1VTzmVk04MlQHJRBK9
5LZT3yqimcqThmNabegVg/hLE4IhextA9a3J8fwT8zZUwW5BThjSpKoGqrKwbwK+
lH0Ja8CLgjxT3kXi3p5SOADKoqWcSdk4cRbOra9oWm8Js3F9g9r9fxnyp2oQfW1Y
p22fJAQNaj+NR7t6pkbq1WXPvEohKgkyqDJJmuOWAheiO99FrdDhy3ymTgZ58Wjx
gnRKpMhLeL45cB3NK3pmiE97wQdnCLCWZgeZIgyTXcHIUSR0IEDknrMBH7+TtUje
T89s84BHwDJrWM7LEyirXmvSc9j6TUgpduQCkpxIsIJ7/VNh+NCVzHDbIt9Qmle/
Q2js7icFO5u96nXHc00y4l9OIO/cEtQFQttTTZsKSQVoH5g0cX8=
=Oh+5
-----END PGP SIGNATURE-----

--------------Ug0yZErzvnn2E0ccOh0nm0Pd--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF5B1CA03
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 18:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072004.1435326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhLF-00083Q-7x; Wed, 06 Aug 2025 16:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072004.1435326; Wed, 06 Aug 2025 16:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujhLF-00080t-4n; Wed, 06 Aug 2025 16:50:17 +0000
Received: by outflank-mailman (input) for mailman id 1072004;
 Wed, 06 Aug 2025 16:50:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hpqR=2S=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1ujhLD-00080d-Vq
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 16:50:16 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c36ff96-72e5-11f0-a323-13f23c93f187;
 Wed, 06 Aug 2025 18:50:14 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-7e6974a290eso7574585a.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 09:50:14 -0700 (PDT)
Received: from [10.138.10.6] ([89.187.178.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e80cae9dfesm252198885a.38.2025.08.06.09.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 09:50:12 -0700 (PDT)
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
X-Inumbo-ID: 6c36ff96-72e5-11f0-a323-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754499013; x=1755103813; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VG+W8uWmInvftlR3w8Y4VyBuBMGZhNln7nCCLmljhZs=;
        b=ZATkEofW5uhbY0dUZAbTWxO4mFvFy/o+6zd4sWPKZcDEdEtiseT+hH6wQjM9VgeBRY
         SLIXd6XreOq1nqfFjJ0SI09l02iymrkR+YINQrcf2L/fH9jIxgsAqYkrebdJsb96O7Ji
         Ax5VhViDupX7fBp6T71zSkhlmLouWB8StyNjJNDwsh/yr5eugT8lC5lxV8ZkJY8RWE8K
         qSNx9Q+flwN7S8bzpLjpXMVF/vaZLtnCPVAppD4Nv4vJXacOkveT75R0Tb9h7PgTgDIm
         LFWH2ZX8fNOPL+j0woEBsIN7CfpOhPAhrS4Rk0PYFNC3HrjmuM9X1kPDzGFbpmz3zXG7
         2VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754499013; x=1755103813;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VG+W8uWmInvftlR3w8Y4VyBuBMGZhNln7nCCLmljhZs=;
        b=ZI/NDnxjBVHa9Hh2FAyRPRXXe9+GrQ3ZX7a2rmHLZV6FwRjTkuV1AXC2PcE8UcvX5l
         qSV234epWe6Ugey9ZLKp4nQip7NYU7Dt2lUDGOfJfM0qvxO9pQMYW4BlRza04AavjlKe
         KweQzBqg5jgWRJXeNIeXJ7XYdBbLI0gJhw7KaMdxROyzyDFFnU0EuL3Oec7Fffz8U1La
         vvHkYlsFBnOoTg1HqhC6wvDwM6so6IyeD+iE3zF/9/nIGWAwarCFOnKz0PkhyxHOFskU
         FPSq+j6SCRleUChX+m7nvUQ35h46+26Q7QIVMbkGhh1NdtC/+Ypg/9Ko7g5Wd3icoqJ7
         61Fw==
X-Forwarded-Encrypted: i=1; AJvYcCXWP1myPfoNbEbHyMh8LqY9JKYRy2/krNMhnfcDkL+8TxGmlyOeAMbyMHXzbTkjcHOB+3nyFbZVP5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8hONt6uF9ggd9B70JieW5k8cA06ny6RCUA0mxLEVdAa8XzNFg
	cLE2Pe9aSb8bEEycrryG35c+JJoRkQZet74m8jAv3aQlQEckdNmfxPjE
X-Gm-Gg: ASbGncth1Mu4XXLwZQkKOIWH0ZD66AbL8Z9S8yETyIiouk1St+00N0L5xc1v1DyXT2h
	KGyKfyMws13mb2und0VpQjBX3+oVPkU7BX878IMGyi5GERFtbBWuLleZ8T/Ht+NlznlkhEMtIny
	oC6SNqgiYMTbJ/DXfzvJmNDekSw3HIPRyhanY7qQcr6+piNKRebYToaJQcj+XxFTIQ3CdOHJ9Fm
	GN3ckfBH9nMPGo4xn4orOxZ/SJ4ynKCBDxWY6fWU9B9/ymmwuXgdpwHk/KJACDOV5/p81fWZWgy
	OGBjGDxlMP4vVoAV7H2Pq7VoXirrIKlWzISrjXPAFA0T7OWmCZbu8hvL65izchQCEDHiKg7dGU0
	YIDEuAy4KNqNKmLKEqHC/sTPhV08=
X-Google-Smtp-Source: AGHT+IGvcX2241OSrh1kxne8gwdJTs/Wbkh3j46bPJalIMSl/pidxKZiRWma/YcHvD9b9jv6XTF7bA==
X-Received: by 2002:a05:620a:2b8d:b0:7e6:9274:2b2d with SMTP id af79cd13be357-7e814ed19d0mr630842585a.50.1754499012870;
        Wed, 06 Aug 2025 09:50:12 -0700 (PDT)
Message-ID: <14e1c224-c648-41bb-97c6-ec63596bd38b@gmail.com>
Date: Wed, 6 Aug 2025 12:50:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
 <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
 <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HTYytyCmaazj52Hiyr2VYmAF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HTYytyCmaazj52Hiyr2VYmAF
Content-Type: multipart/mixed; boundary="------------UCSiGg9IZeyNJvXl8IjE07zq";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <14e1c224-c648-41bb-97c6-ec63596bd38b@gmail.com>
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
 <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
 <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
In-Reply-To: <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>

--------------UCSiGg9IZeyNJvXl8IjE07zq
Content-Type: multipart/mixed; boundary="------------UAOgisYUERiBA07qRNHzbgMk"

--------------UAOgisYUERiBA07qRNHzbgMk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/6/25 12:24, Oleksii Kurochko wrote:
>=20
> On 8/6/25 2:05 PM, Jan Beulich wrote:
>> On 06.08.2025 13:33, Oleksii Kurochko wrote:
>>> On 8/4/25 5:19 PM, Jan Beulich wrote:
>>>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>>>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bo=
otcpu_id,
>>>>>   =20
>>>>>        console_init_postirq();
>>>>>   =20
>>>>> +    vmid_init();
>>>> This lives here only temporarily, I assume? Every hart will need to =
execute
>>>> it, and hence (like we have it on x86) this may want to be a central=
 place
>>>> elsewhere.
>>> I haven=E2=80=99t checked how it is done on x86; I probably should.
>>>
>>> I planned to call it for each hart separately during secondary hart b=
ring-up,
>>> since accessing the|hgatp| register of a hart is required to detect|V=
MIDLEN|.
>>> Therefore,|vmid_init()| should be called for secondary harts when the=
ir
>>> initialization code starts executing.
>> But is this going to be the only per-hart thing that will need doing? =
Otherwise
>> the same larger "container" function may want calling instead.
>=20
> Yes, it is going to be the only per-hart operation.
>=20
> There is|__cpu_up()| (not yet upstreamed [1]), which calls
> |sbi_hsm_hart_start(hartid, boot_addr, hsm_data)| to start a hart, and =
I planned
> to place|vmid_init()| somewhere in the code executed at|boot_addr|.
>=20
> [1]https://gitlab.com/xen-project/people/olkur/xen/-/blob/latest/xen/ar=
ch/riscv/smpboot.c#L40
>=20
>>>>> +{
>>>>> +    unsigned long vmid_bits;
>>>> Why "long" (also for the function return type)?
>>> Because csr_read() returns unsigned long as HGATP register has
>>> 'unsigned long' length.
>> Oh, right, I should have commented on the function return type only.
>> Yet then I also can't resist stating that this kind of use of a variab=
le,
>> which initially is assigned a value that doesn't really fit its name, =
is
>> easily misleading towards giving such comments.
>>
>>> But it could be done in this way:
>>>       csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>       vmid_bits =3D  MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);=

>>>       vmid_bits =3D ffs_g(vmid_bits);
>>>       csr_write(CSR_HGATP, old);
>>> And then use uint16_t for vmid_bits and use uin16_t as a return type.=

>> Please check ./CODING_STYLE again as to the use of fixed-width types.
>=20
> I meant unsigned short, uint16_t was just short to write. I'll try to b=
e
> more specific.
>=20
>>
>>>>> +    unsigned long old;
>>>>> +
>>>>> +    /* Figure-out number of VMID bits in HW */
>>>>> +    old =3D csr_read(CSR_HGATP);
>>>>> +
>>>>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>>> +    vmid_bits =3D csr_read(CSR_HGATP);
>>>>> +    vmid_bits =3D  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
>>>> Nit: Stray blank.
>>>>
>>>>> +    vmid_bits =3D flsl(vmid_bits);
>>>>> +    csr_write(CSR_HGATP, old);
>>>>> +
>>>>> +    /*
>>>>> +     * We polluted local TLB so flush all guest TLB as
>>>>> +     * a speculative access can happen at any time.
>>>>> +     */
>>>>> +    local_hfence_gvma_all();
>>>> There's no guest running. If you wrote hgat.MODE as zero, as per my
>>>> understanding now new TLB entries could even purely theoretically ap=
pear.
>>> It could be an issue (or, at least, it is recommended) when hgatp.MOD=
E is
>>> changed:
>>>    If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=
=3Dx0
>>>    (and rs2 set to either x0 or the VMID) must be executed to order s=
ubsequent
>>>    guest translations with the MODE change=E2=80=94even if the old MO=
DE or new MODE
>>>    is Bare.
>>> On other hand it is guaranteed that, at least, on Reset (and so I ass=
ume
>>> for power on) that:
>>>    If the hypervisor extension is implemented, the hgatp.MODE and vsa=
tp.MODE
>>>    fields are reset to 0.
>>>
>>> So it seems like if no guest is ran then there is no need even to wri=
te
>>> hgatp.MODE as zero, but it might be sense to do that explicitly just =
to
>>> be sure.
>>>
>>> I thought it was possible to have a running guest and perform a CPU h=
otplug.
>> But that guest will run on another hart.
>>
>>> In that case, I expect that during the hotplug,|vmidlen_detect()| wil=
l be
>>> called and return the|vmid_bits| value, which is used as the active V=
MID.
>>> At that moment, the local TLB could be speculatively polluted, I thin=
k.
>>> Likely, it makes sense to call vmidlen_detect() only once for each ha=
rt
>>> during initial bringup.
>> That may bring you more problems than it solves. You'd need to stash a=
way
>> the value originally read somewhere. And that somewhere isn't per-CPU =
data.
>>
>>>> In fact, with no guest running (yet) I'm having a hard time seeing w=
hy
>>>> you shouldn't be able to simply write the register with just
>>>> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionabl=
e
>>>> whether "old" needs restoring; writing plain zero afterwards ought t=
o
>>>> suffice. You're in charcge of the register, after all.
>>> It make sense (but I don't know if it is a possible case) to be sure =
that
>>> HGATP.MODE remains the same, so there is no need to have TLB flush. I=
f
>>> HGATP.MODE is changed then it will be needed to do TLB flush as I men=
tioned
>>> above.
>>>
>>> If we agreed to keep local_hfence_gvma_all() then I think it isn't re=
ally
>>> any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.
>>>
>>> Generally if 'old' is guaranteed to be zero (and, probably, it makes =
sense
>>> to check that in vmidlen_detect() and panic if it isn't zero) and if
>>> vmidlen_detect() function will be called before any guest domain(s) w=
ill
>>> be ran then I could agree that we don't need local_hfence_gvma_all() =
here.
>>>
>>> As an option we can do local_hfence_gvma_all() only if 'old' value wa=
sn't
>>> set to zero.
>>>
>>> Does it make sense?
>> Well - I'd like the pre-conditions to be understood better. For exampl=
e, can
>> a hart really speculate into guest mode, when the hart is only in the
>> process of being brought up?
>=20
> I couldn't explicit words that a hart can't speculate into guest mode
> either on bring up or during its work.
>=20
> But there are some moments in the spec which tells:
>    Implementations with virtual memory are permitted to perform address=

>    translations speculatively and earlier than required by an explicit
>    memory access, and are permitted to cache them in address translatio=
n
>    cache structures=E2=80=94including possibly caching the identity map=
pings from
>    effective address to physical address used in Bare translation modes=
 and
>    M-mode.
> And here:
>    Implementations may also execute the address-translation algorithm
>    speculatively at any time, for any virtual address, as long as satp =
is
>    active (as defined in Section 10.1.11). Such speculative executions =
have
>    the effect of pre-populating the address-translation cache.
> Where it is explicitly mentioned that speculation can happen in *any ti=
me*.
> And at the same time:
>    Speculative executions of the address-translation algorithm behave a=
s
>    non-speculative executions of the algorithm do, except that they mus=
t
>    not set the dirty bit for a PTE, they must not trigger an exception,=

>    and they must not create address-translation cache entries if those
>    entries would have been invalidated by any SFENCE.VMA instruction
>    executed by the hart since the speculative execution of the algorith=
m began.
> What I read as if TLB was empty before it will stay empty.

I read that as "flushing the TLB invalidates entries created by speculati=
ve
execution before the TLB flush".  That is the bare minimum needed for TLB=

flushing to work.  You have to do the TLB flush *after* changing the PTEs=
,
not before.

This is true on at least x86 but I expect it to hold in general.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------UAOgisYUERiBA07qRNHzbgMk
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

--------------UAOgisYUERiBA07qRNHzbgMk--

--------------UCSiGg9IZeyNJvXl8IjE07zq--

--------------HTYytyCmaazj52Hiyr2VYmAF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmiTh7sACgkQszaHOrMp
8lNSfA/+JZsVk0Im2B/3ULYSiiIHvjfvZmQVpXQ7GI2fBAncLXdwyCrzah4VakQy
kTlOQ9efAMrej80liLLD03Gj943W0tNDVwlCshRp+zjUuU7QU7d/T1K2naXDxKnD
GzDXFdjP1uQ4sY1XUDv6fwW7qmKj3fs8+a/1QHX9/Hflg3hbWxzF7ciGNb4DdnCp
LVHGURQGBa+oQ8Huw+BFtsp2VfEH5tfXmU8hrYmzVrjeFpCCcpYQ9mdBw3vnvYYT
wQNfZy6fjHbj0aETGhDhuhWDLkC738JKIHiDqAn2Vjr4vqrlELy6VgdF/3hkA/fF
KI8dQi8qrpCru0VxKC6awkWbxodp+e9jB9P4K8plGPXNcCfD51BDzXqzMUp6f0fC
PYy7HU90jdY4GDUB2TGKRPL+rjLP5U16SAj6Paavvi2Ja5tzCgVOZbCQNFKebNXq
1xnXsC9RiJxZfDQxW46GY5HdLY/895iqU5Hb73mQMkaboiWVwATAKzJuqXmxNebN
xtN9rubaUYgblser5gQzUJz7dpmY3/CFeftwt1UXvu3EdVdCq1qwcDnRDCoIkw5C
F/CpkIqpt45lrEzW5ee58YTL0HOZmaM3vqOQVMruiZlUw4bbSJRz6ADS+OBSP8W2
jEi+FVF5hPqFOzaMJYjnUB1yA7SeU5+gu2hLnVIMj9DfeeQOrws=
=+2iS
-----END PGP SIGNATURE-----

--------------HTYytyCmaazj52Hiyr2VYmAF--


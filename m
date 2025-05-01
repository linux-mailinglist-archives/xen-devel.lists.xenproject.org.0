Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC29AA641D
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 21:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974292.1362185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZcl-0004ps-4S; Thu, 01 May 2025 19:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974292.1362185; Thu, 01 May 2025 19:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAZcl-0004nz-1r; Thu, 01 May 2025 19:31:11 +0000
Received: by outflank-mailman (input) for mailman id 974292;
 Thu, 01 May 2025 19:31:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u7+W=XR=gmail.com=demiobenour@srs-se1.protection.inumbo.net>)
 id 1uAZcj-0004nt-V8
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 19:31:10 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4ac9f2c-26c2-11f0-9eb4-5ba50f476ded;
 Thu, 01 May 2025 21:31:08 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e733e25bfc7so1201575276.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 12:31:08 -0700 (PDT)
Received: from [10.138.7.94] ([45.134.140.51])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e755e7d93dfsm280107276.48.2025.05.01.12.31.06
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 May 2025 12:31:06 -0700 (PDT)
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
X-Inumbo-ID: d4ac9f2c-26c2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746127867; x=1746732667; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po2xjJ8plZ+RKKgAdAkXLkKvvkvYSi96/s/0QmmMp8o=;
        b=AEkZFpm1wM6ha9jkwaCAa3Mh0fZV/KpzFZeWrpUEu5OytAdnEckkHn0i/omX/1NOx7
         2zlcjiTnbYZCsWT/4lM4aDBSDvxwez9yFKHgqTmg863S5XTFY7IRkV0VUg5hmuAXhzEt
         f+97/mVFw+y0bddoya0gPI/kYqYZ7at1oOrNHP1kfSKIkkNxSkbPg7v7MljlxvM/NCgo
         BA4c7WlYxIIewEVe9m4oJjVP6wRPIbiEq/CaupI1SS9TPKUimZDUntHlQ6I1BRpounyp
         sAg7bR+aqm539dBEPTjLHWR7q71hhYHTHyobJ3WgnYquEYX4maAq85zFuZ+dUzMZmcdB
         hRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746127867; x=1746732667;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Po2xjJ8plZ+RKKgAdAkXLkKvvkvYSi96/s/0QmmMp8o=;
        b=WstYTxuamJQWz5nXvVlWNxnOyJR515PpZLX9vRh2yJffGa3eQDjIFuhpuDEIhFsw1L
         rKD9nWPY6y6ieM3vwohjseUsLtMgOLVpArR+4W5+ks2+JzE4x1ImcRWwg0IR7duPfT3G
         cqKESPyjrysiCWP15o7qAJt4lfT1QUCgNEGLZn4umg8u9/3bnerUl4LpFzG0ihkgrNce
         t0Xupw+eTHvgiYkDdxLALYiH0cO7lUkc7lRgeWfXvhdpCBoPx3QajUKxCgt24twzBEXD
         p8NR5JCi5ANuEVTKK3PrMIU7URvILWyGU1wz/6+iGD35Koj7gbE3HtM3F5Ta+bZJvsnk
         msBw==
X-Gm-Message-State: AOJu0Yy6DD11d/pTJIxcHawyWhrte9jpBmLWHaFf1Ad2sXm6s3inGPbW
	Ges1pajxMYLPSCJtbNDkkGvPpY9S82byMfLXlmYI7e5fPqrsWIf1MRxEiw==
X-Gm-Gg: ASbGncuWEXmiHV6HBH1BZugcnFugbj8DtppwS1N6MTw0x/OM9ER/8mjM4SAD6Vq17/V
	2A0H5KxHWpLPVmM4Dg44Bx4972jyNYoERaj3FuGGxPlrbXDXuQKR+7wv4GskMWXFyUX4KN1mucT
	Ql66qnDaELAZNhBFqH6RQPg77zyOjNZp8aCAyBxTofVdDknvwxmtDBYVz6GPGeZbTDcKH9NyFGt
	bLdlFGa7B0Wfe+jjnCtF4ef7I+8rQuH0Ram/GIab5gNBVEsK/aOzdyF2LG+RhFbafHAfrXbUM0B
	Cn5rOshVZWOB7dQESdoNNkqLrUwydnfLFTOqiL6Ja+BZ
X-Google-Smtp-Source: AGHT+IGsUGi+ZpF0BXlksBfQa9OVdkQCdgVeRp/RTe71calKQ5DBxFSXe8pKBQN1H+xUe4bfeN2K9Q==
X-Received: by 2002:a05:6902:84a:b0:e72:bb4d:7cf9 with SMTP id 3f1490d57ef6-e7565627262mr380481276.34.1746127867398;
        Thu, 01 May 2025 12:31:07 -0700 (PDT)
Message-ID: <0e69cc75-67af-4905-b736-8b58f2ac996c@gmail.com>
Date: Thu, 1 May 2025 15:31:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] sbat: Add SBAT section to the xen binary
To: xen-devel@lists.xenproject.org
References: <20250501104925.228351-1-gerald.elder-vass@cloud.com>
 <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DrtLaz9jZhw2ig09C5y18fS2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DrtLaz9jZhw2ig09C5y18fS2
Content-Type: multipart/mixed; boundary="------------8CjajPHZmPBVrJ8n8XpMBqGB";
 protected-headers="v1"
From: Demi Marie Obenour <demiobenour@gmail.com>
To: xen-devel@lists.xenproject.org
Message-ID: <0e69cc75-67af-4905-b736-8b58f2ac996c@gmail.com>
Subject: Re: [XEN PATCH] sbat: Add SBAT section to the xen binary
References: <20250501104925.228351-1-gerald.elder-vass@cloud.com>
 <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>
In-Reply-To: <a8c18c85-54c6-4aa7-8eef-bb383f3cdfd5@citrix.com>

--------------8CjajPHZmPBVrJ8n8XpMBqGB
Content-Type: multipart/mixed; boundary="------------7dIpI0it2SLb9ZlA7EZ4l7JA"

--------------7dIpI0it2SLb9ZlA7EZ4l7JA
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5/1/25 7:34 AM, Andrew Cooper wrote:
> On 01/05/2025 11:49 am, Gerald Elder-Vass wrote:
>> The SBAT section provides a way for the binary to declare a generation=

>> id for its upstream source and any vendor changes applied. A compatibl=
e
>> loader can then revoke vulnerable binaries by generation, using the
>> binary's declared generation id(s) to determine if it is safe to load.=

>>
>> More information about SBAT is available here:
>> https://github.com/rhboot/shim/blob/main/SBAT.md
>>
>> Vendors should append a custom line onto sbat.csv(.in) with their vend=
or
>> specific sbat data.
>>
>> Populate the SBAT section in the Xen binary by using the information
>> in xen/arch/x86/sbat.csv.in
>>
>> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> Tested-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
>=20
> Thankyou for starting to post these patches.
>=20
> The commit message needs that SBAT is a revocation scheme for UEFI
> SecureBoot, and mandatory now if you want to get signed by Microsoft.=C2=
=A0
> This wants to be the first sentence, IMO.
>=20
> That in turn also explains why it's in the EFI binary only, and
> discarded from the ELF binary.
>=20
>> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
>> index d902fb7accd9..6db7475c2c23 100644
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -74,6 +74,7 @@ obj-$(CONFIG_TBOOT) +=3D tboot.o
>>  obj-y +=3D hpet.o
>>  obj-y +=3D vm_event.o
>>  obj-y +=3D xstate.o
>> +obj-y +=3D sbat_data.o
>=20
> These should be sorted by file name (although hpet.o is clearly out of
> order here).
>=20
> Where possible, please use dash rather than underscore in filenames,
> although in this case I'd shorten it to just sbat.o and bypass that pro=
blem.
>=20
>> =20
>>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>>  obj-y +=3D domctl.o
>> @@ -277,6 +278,12 @@ $(obj)/efi.lds: AFLAGS-y +=3D -DEFI
>>  $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
>>  	$(call if_changed_dep,cpp_lds_S)
>> =20
>> +$(obj)/sbat.csv: $(src)/sbat.csv.in
>> +	sed "s/@@VERSION@@/${XEN_FULLVERSION}/" $< > $@
>> +
>> +$(obj)/sbat_data.o: $(obj)/sbat.csv
>> +	$(OBJCOPY) -I binary -O elf64-x86-64 --rename-section .data=3D.sbat,=
readonly,data,contents $< $@
>> +
>>  clean-files :=3D \
>>      include/asm/asm-macros.* \
>>      $(objtree)/.xen-syms.[0-9]* \
>> diff --git a/xen/arch/x86/sbat.csv.in b/xen/arch/x86/sbat.csv.in
>> new file mode 100644
>> index 000000000000..7cdc33dbd998
>> --- /dev/null
>> +++ b/xen/arch/x86/sbat.csv.in
>> @@ -0,0 +1,2 @@
>> +sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/S=
BAT.md
>> +xen,1,Linux Foundation,xen,@@VERSION@@,https://xenproject.org/
>=20
> I know this is what the SBAT spec says to do, but it's unworkable.
>=20
> Upstream Xen cannot state or maintain a global generation ID on behalf
> of it's downstreams.=C2=A0 This is true in general, not just for Xen.
>=20
> For us (XenServer), this needs to be a line starting xen.xenserver,
> because we (and only we) know how our Xen is built and configured.=C2=A0=

> Every other downstream will need to do the same.
>=20
> So, either we want just the SBAT line an nothing else, or we want some
> kind of "to be filled in by the OSV" info, to make it clear that people=

> need to alter it.
>=20
> When UEFI SecureBoot becomes security supported, the security team
> probably wants to note in XSAs whether the issue constitutes a breach o=
f
> UEFI-SB, and remind downstreams to bump their generation IDs.

What about having both?

One of the goals of SBAT is to keep the size of revocations under control=
=2E
That requires as many downstreams as possible to share an SBAT section en=
try
so that a single revocation can be used for all of them.  If everyone use=
s
a different SBAT entry, does SBAT provide any functionality beyond meetin=
g
Microsoft requirements?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
--------------7dIpI0it2SLb9ZlA7EZ4l7JA
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

--------------7dIpI0it2SLb9ZlA7EZ4l7JA--

--------------8CjajPHZmPBVrJ8n8XpMBqGB--

--------------DrtLaz9jZhw2ig09C5y18fS2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmgTzCIACgkQszaHOrMp
8lM9KA//RHBpTqN0TfmpM9VXcA36TgzCjDsN5eCjZ1uUeRJ9Xs1FZdjH78hfR4TD
U5WxV50X2BMPQhyffkJPjZdqo336HD8HOFRHSBMdGmpb7nvOVQS7p0huqRUDOHfp
K5FisVANdGIAEycdcEr2Dykj/Hy/E8HTdHiaEzuxfgtC8GPEKZi7+4OXlVul4Hr0
kqDCPW44GbAke8IICEXGOwLaIOPqD5D64F48nHhygHtM9qgqEEycOAWlhb4I/qYi
adY8vA9rEelpSl7In+x6UniamSmICNbXRxL9nkq67yEtdlgzawa6l6fFlzrTxqV7
eTVgmqj+XEz1vrYrXggaOd8t/IIb943IHIi3R7vFaoM0vXdtz57IsQW88mC0k+C4
r2q6kEfQ3W9pMqJ+85XnU8Ft2ctumoHvT7LMnjyRUKyhiShVTmW+2akseB5PadRT
bxTl5VRn584uVkCMM2fkSsazc5EoGBvbHBaZ8CAaBMnrdiRxcThSsi5oLJAwm8FT
x5UYWUE3+KSeDy9ycdUVf2IVfr10QY7tKqQN1tTR0uAVlBSpae5fWpcu9dGg+7EU
8AqxPpSHw+QAJlG5ZCySyKlPOBXzHLKYXSfEdJYGU03mqih6FSYxv7UUpx8725fU
Rcn7kw7psHUH4h0Pib5NQMdZv3NEwjBvs8xyxsuBs9hPRyZ5Iak=
=kYvv
-----END PGP SIGNATURE-----

--------------DrtLaz9jZhw2ig09C5y18fS2--


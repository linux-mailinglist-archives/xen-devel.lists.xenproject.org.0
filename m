Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBF1FC610
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 08:17:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlRNZ-0007Up-JY; Wed, 17 Jun 2020 06:16:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X9vs=76=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jlRNY-0007Uk-Cq
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 06:16:56 +0000
X-Inumbo-ID: 24790a4a-b062-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24790a4a-b062-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 06:16:55 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id dr13so1013124ejc.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 23:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=uIcdwr+mp7f2wJok//eahZc0osapd1m51kkI8OF62L4=;
 b=RbhVHUM5/yOPJ+UzO5lvcnShygKuDAfae6Fn0znZQhnQQT6Uk+dIf4qfFp5UI5FX4N
 GhPEyfaUHvnpEwV9dTUnUuuECkZ2+SHfnlhSLuQlmNWGb5Sgh0HVexJQjFDJ8gVU1c1o
 Ux1ld18V9qVIEl1Wmx24LPGjrNhVyynpTIYR3uZKLnkKiaYdj3zDU7aKdMwGsvbdLKCG
 Fw1eCF73kYjtgew0/ejUJAqseMInB3IIF9Xtb3WM1FWA/4MqHbs+FRsy6sXkmUtdUJH0
 OOV7Sy1NNuqYfTaB5lY3mRoFzRxFxm7gp3fzfVWQGX23oHzxckLvtScy1GbAIwxJeFDW
 Juyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=uIcdwr+mp7f2wJok//eahZc0osapd1m51kkI8OF62L4=;
 b=AN1fZ7CjPBVCFzF8/sAbJh5QGZCy3gcd1PxbMa5EYimvRVyqetfnb/xcbNO031IW+E
 NR0Br2INGnXnc7vVQVUpKrqY+rLI6MViSlCNIYk5RXVgj+vFRdUaamo/l7BAsT2gjh2s
 Z1ewUJMFiWaEEI3vw8yeLYAyBjK+pizZrUV+wzkkHvKmYdNFq2i6uAhKvDONOgC5uLvc
 SABWv0jqLKMKWkseg8I8ZWn2QrCSpRsjUz4yudVyDptUhs3KtktTWg6YFBCVq1Nnikyo
 IZp6dWYIy3EBsKVAdTSXKMqiaYQPj/++OJaSFDMElCk0z238wnDxZVpCmd9aJNVvlKja
 zBOw==
X-Gm-Message-State: AOAM533S1GBaVtGvknuhhCgMElSKsvTJ5YeKpDy3SdledFnL2sekbl82
 1DMAO3Edh3pphjZHiKoG5dk=
X-Google-Smtp-Source: ABdhPJyHMoJJ7xfHPdZmT9ioF3bvSs7ZRoc+/5gB5+JJyQMdxp3FAp3ZtrObWlifham9qQBNVLaahQ==
X-Received: by 2002:a17:906:3282:: with SMTP id 2mr5899611ejw.93.1592374615005; 
 Tue, 16 Jun 2020 23:16:55 -0700 (PDT)
Received: from [192.168.8.124] (public-gprs354212.centertel.pl. [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id y2sm12509814ejj.103.2020.06.16.23.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 23:16:54 -0700 (PDT)
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
 <20200616145951.GP735@Air-de-Roger>
 <cfe13cc5-ce0a-a50f-fed6-8546407d2e81@suse.com>
 <20200616152515.GQ735@Air-de-Roger>
From: Grzegorz Uriasz <gorbak25@gmail.com>
Autocrypt: addr=gorbak25@gmail.com; prefer-encrypt=mutual; keydata=
 mQENBFyZgUUBCACo21Uf58hRRgX0uQd3kRJUqXp8/kJsC58tKZG9ENy8rvmcq15AmblqOQnD
 k6Pmh2lhh31A+m4ONF+TT0vlFYv9sN0kA1llvHPH95LYhROXt7UwSZBQTnQlLZFVqeGa3R6M
 pJwaAMQP/lyYgINt1pvBdCWtcNP/wKuNI/efnZuBOPDKSeBH/V0ZmmZxlSsx05/ktgtR6ibP
 FZXPBgx5DY0DxPm/jb8CqkXO5291wyYCP2VDy85oqG8EgsfFOOPZNwBQCKS7cWLZDMEsVNnB
 WyU3zJZBvEVK/5BwIzm1+AL9lR6RRLaOpC19k2ZqbyhEG9EhsR+/DIF0znBd9Nhjokd5ABEB
 AAG0JEdyemVnb3J6IFVyaWFzeiA8Z29yYmFrMjVAZ21haWwuY29tPokBVwQTAQgAQQIbAwUJ
 A8JnAAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHDkRnQjCGTnaTo/LngD9fcXMA1pBQJd
 /5CUAhkBAAoJEHgD9fcXMA1pb9YIAICTmZOrEGho9MC7z851jw507EamIqaAXQAADKpbxSGH
 yVxALYZv6cqR84rsQuML0N8ai4rdCJ7PviMYyaWVX3P09kJoFxSzKhjxbwZMkRF8O+9tIhNO
 29h8v5cmv7Sp4NpssITFMZAms4LleJtdkivDeRxSCyJnHceZyGiD6pPTkopyuISGZIS+4axF
 zarn+JM+uiTm1QHdCbcvK3sor//QvHr9kKjLKTxMwiTZOGQzF8+oHpVxxwX8Bz3UbFwRX/Io
 rErT92f9WOsFWnvZHuLGcRLSlG0h9xljIuhP7mvGiudTgNoPt9YFtAG8KT/2HnUZ4XxJKi+B
 8Ilet++3m4m5AQ0EXJmBRQEIANBww0bVhYwP1g4AMux/Fjp7KUjYj7Q8ej+t71ShZkAzvPQT
 00ULdnYEa62uKM9YwXqOu0XJsnBveJKO1q3nfJuazAbsC0B3v0bYlUUQoTRxCUs3v22UOVxe
 kaTtN3KDdnSTq7QkkZBZFvV+vAwKGlqECzsYtZ86CiIEOgmUeVA82AzyMx306l1th90OdHYt
 LKkHxreEPWInN9jptOaKNwvB5cR6PxFfVRtVteN121tVJRK5geA0RVjHn35ig97ycDP5FcwP
 HuuuKfr+07ANXrtFM/QLGmIvEaMEgpPmzyGkXGhbsDpMikHOkXvQCRTesJ38r8DRUffinYXI
 vAw0IsMAEQEAAYkBPAQYAQgAJhYhBHDkRnQjCGTnaTo/LngD9fcXMA1pBQJcmYFFAhsMBQkD
 wmcAAAoJEHgD9fcXMA1p3y8H/2nftQbUcb2oKtpyePStdmdN45A1OWjorj6iBRvTOhoig6y7
 PbveJ9Zj35IP0Zy4W77Ke4ayK/PiBkh7bRrdQAwTAc7EiYw3j+foO32JA/4bANMgSuRBxO/d
 xoloRPoaRE6eGUkA3N65V5WlWkinKxzSGDgSOz7Tit5QY8fGJYWeLTzFj605Y9iUu0MSLpfs
 LQQby+I9gETWh5TUMz1uNytIB80UdMpzqcC36zCMk7wIy1g8YhbehJq1zU1+ZpDrggrN3ucH
 0NFFvHq5uwEkR8Llj29nDcyKuWMlnCMpM/iJcTde7N8UVdtN9yBGol4+yAZT0w5RP87pw3oD
 fuZMcoY=
Message-ID: <4787679a-1f1a-5905-b130-a95a5542c7be@gmail.com>
Date: Wed, 17 Jun 2020 08:16:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616152515.GQ735@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NSPFRzh7CyNbmQ9xlGrzZYSQtQ9cyNCsi"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: artur@puzio.waw.pl, Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Andrew Cooper <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 j.nowak26@student.uw.edu.pl, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NSPFRzh7CyNbmQ9xlGrzZYSQtQ9cyNCsi
Content-Type: multipart/mixed; boundary="EZNMNhLYqG2sI4JEpgLTcNiA7zlGfs2qB";
 protected-headers="v1"
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 marmarek@invisiblethingslab.com, artur@puzio.waw.pl, jakub@bartmin.ski,
 j.nowak26@student.uw.edu.pl
Message-ID: <4787679a-1f1a-5905-b130-a95a5542c7be@gmail.com>
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
 <20200616145951.GP735@Air-de-Roger>
 <cfe13cc5-ce0a-a50f-fed6-8546407d2e81@suse.com>
 <20200616152515.GQ735@Air-de-Roger>
In-Reply-To: <20200616152515.GQ735@Air-de-Roger>

--EZNMNhLYqG2sI4JEpgLTcNiA7zlGfs2qB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I will submit the v2 patch today.

Best Regards,
Grzegorz

On 16/06/2020 17:25, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jun 16, 2020 at 05:11:58PM +0200, Jan Beulich wrote:
>> On 16.06.2020 16:59, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Jun 16, 2020 at 03:25:42PM +0200, Jan Beulich wrote:
>>>> --- unstable.orig/xen/arch/x86/acpi/boot.c
>>>> +++ unstable/xen/arch/x86/acpi/boot.c
>>>> @@ -480,7 +480,9 @@ static int __init acpi_parse_fadt(struct
>>>>  	if (fadt->header.revision >=3D FADT2_REVISION_ID) {
>>>>  		/* FADT rev. 2 */
>>>>  		if (fadt->xpm_timer_block.space_id =3D=3D
>>>> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
>>>> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
>>>> +		    (fadt->xpm_timer_block.access_width =3D=3D 0 ||
>>>> +		     fadt->xpm_timer_block.access_width =3D=3D 3)) {
>>> We should really have defines for those values, or else they seem to
>>> imply actual access sizes. What about adding
>>> ACPI_ADDR_ACCESS_{LEGACY,BYTE,WORD,DWORD,QWORD}?
>> If there were such defines, I'd have used them. Adding them is
>> inappropriate though, as this would modify an imported header in a
>> Xen-specific way. We could leverage ACPI_ACCESS_BIT_WIDTH() here,
>> though.
> Yes, that would be better IMO.
>
> Thanks, Roger.


--EZNMNhLYqG2sI4JEpgLTcNiA7zlGfs2qB--

--NSPFRzh7CyNbmQ9xlGrzZYSQtQ9cyNCsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEcORGdCMIZOdpOj8ueAP19xcwDWkFAl7ptVMACgkQeAP19xcw
DWncCwgApkYn1DNOXvOYE2Fj7HmX3TEPgq+4Hgn+1N3E+0EfGPbcnZZ+Fq1kQE7R
38oW0DaJstwIfyqZzK+lfYi+kp3UfQf7J+wVrHfugrHWaDvO1ZxV2V/SEpfxCV0y
cRb8pcNyf3aKVnNv1kHO6pVK08+OOrF2AVKXyjpvQH613IY/eAWQVrr3MNhXiMMe
mYeKgnG68TUSTX45qkMGkHMCWfwRZSrJrZ0diNaXt4FIKLyRVH7Y2Kir5yKwQm1k
jiM9uovtFqgQ71bnJSJyeAG+RH1Qzs6jiYTJeJm+cBfZTy3G106d94iR1SEjx7dR
xixNavILrDm0E472lB8pjHKEJzC06Q==
=r17S
-----END PGP SIGNATURE-----

--NSPFRzh7CyNbmQ9xlGrzZYSQtQ9cyNCsi--


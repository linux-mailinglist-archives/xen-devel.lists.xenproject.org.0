Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DB1FB5B2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 17:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlDEE-0007uS-7l; Tue, 16 Jun 2020 15:10:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NRRy=75=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jlDEC-0007tw-UM
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 15:10:21 +0000
X-Inumbo-ID: 7dea92b2-afe3-11ea-b7bb-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dea92b2-afe3-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 15:10:19 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id y13so21905348eju.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to;
 bh=vjbzjTRd9SqaA31kjp9p8pzdssSbIqMwGtJOQtwIXT8=;
 b=f0Izth+twpiXefSm2ju6k2+iByI/ckTNnNOZIj0kVoNKSemOoJDm0OS0uLSR41vEad
 LbCADDXsUk3VCbZn47NrZjbkHJvi6cRgrV4jOe4JH2td4Zk9PXsYD9GQJA1jUvGxc0kK
 75iLumt+Ef8ay3UcZwYwXY36sPlFlQoags1qOXfz0jbtLOXgD51u4zLy2CbloCBbtItd
 u9ctxyyMykNVK/Rz8ky+jEW74NsIVaNonss0SyBmD9tA3h3hzE4aWbPeGdjYrdOOipJ9
 TfvEW0bvD50NkBZIuWb+7ktsI/m/HUsPLPNEtKDd4ahOxk96KyRBN66rY4v9YFZagVXe
 bJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to;
 bh=vjbzjTRd9SqaA31kjp9p8pzdssSbIqMwGtJOQtwIXT8=;
 b=DGGRyYHc7yQMQvMi8qucJEiyPRqV2a6WZGQRY5I/JTZ94wPEM3mtBPZZndN/P7nyrQ
 s2vb05Xouz1D5+jAVqGTuKYCrb9NV7qeHprj3aIr/w9xyFiax9UDGfXh+FvuUWjEPsVG
 KA1wJTCt5SjeoUbvYMihH9OVgKjctPrmNDf5gFyf9Ce0WUtPxwOZnUsj0xkWG1KUEK9e
 ZkMfyjMU+l/lgMLld1fc9RmiW+qE0QuW7xR0OYXn0g+6STjPP7dq+79Pqif+c7RwH3cQ
 1I9KCXsxjzbHjJ8hlOIU7EkaMOhI4CQJFUI2aO32feDuoNEWFqXlBi48dF/gKsfIoIpE
 UNVQ==
X-Gm-Message-State: AOAM531PuBSYI89Y+VBSFWmjI6k9dN9EZlIkMBk/r20PUF+j9VdZPNCJ
 y4+lfcB0o5cMu8xttvR/pF4=
X-Google-Smtp-Source: ABdhPJx48WaLsxbPWWBEwqnumbOBo/Fiob5ip8VxExxmzlO3VUJnQY1AozFJRfGWQPi9BV6bzDPAxw==
X-Received: by 2002:a17:906:198d:: with SMTP id
 g13mr3158986ejd.281.1592320218673; 
 Tue, 16 Jun 2020 08:10:18 -0700 (PDT)
Received: from [192.168.8.124] (public-gprs354212.centertel.pl. [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id oq28sm11334217ejb.12.2020.06.16.08.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 08:10:17 -0700 (PDT)
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
 <20200616145951.GP735@Air-de-Roger>
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
Message-ID: <3b02a2c4-1991-b7c3-1b5e-e388221fda19@gmail.com>
Date: Tue, 16 Jun 2020 17:10:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616145951.GP735@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hpm0V3gSivriNpTnX68iVzFwFe6oPVlE2"
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
--Hpm0V3gSivriNpTnX68iVzFwFe6oPVlE2
Content-Type: multipart/mixed; boundary="C2RUB6eTBb9Ebz7wYKddxQ40ytaxzUc3B";
 protected-headers="v1"
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 marmarek@invisiblethingslab.com, artur@puzio.waw.pl, jakub@bartmin.ski,
 j.nowak26@student.uw.edu.pl
Message-ID: <3b02a2c4-1991-b7c3-1b5e-e388221fda19@gmail.com>
Subject: Re: [PATCH 1/1] x86/acpi: Use FADT flags to determine the PMTMR width
References: <cover.1592142369.git.gorbak25@gmail.com>
 <dba39869b788f7f9d937fac48f0476a0443925f0.1592142369.git.gorbak25@gmail.com>
 <6b921b43-03f6-448c-297e-8c8f041eea2a@suse.com>
 <20200616103204.GN735@Air-de-Roger>
 <e6356183-cabe-1c54-dc6d-04365d4650a7@suse.com>
 <20200616145951.GP735@Air-de-Roger>
In-Reply-To: <20200616145951.GP735@Air-de-Roger>

--C2RUB6eTBb9Ebz7wYKddxQ40ytaxzUc3B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I'm wondering why support for 32 bit acpi pm timers was introduced to xen=
=2E
Linux doesn't bother and just crops it to 24 bits:
https://github.com/torvalds/linux/blob/a5dc8300df75e8b8384b4c82225f1e4a0b=
4d9b55/drivers/clocksource/acpi_pm.c#L37

Best regards,
Grzegorz Uriasz

On 16/06/2020 16:59, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jun 16, 2020 at 03:25:42PM +0200, Jan Beulich wrote:
>> On 16.06.2020 12:32, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Jun 16, 2020 at 10:07:05AM +0200, Jan Beulich wrote:
>>>> On 14.06.2020 16:36, Grzegorz Uriasz wrote:
>>>>> --- a/xen/arch/x86/acpi/boot.c
>>>>> +++ b/xen/arch/x86/acpi/boot.c
>>>>> @@ -480,7 +480,10 @@ static int __init acpi_parse_fadt(struct acpi_=
table_header *table)
>>>>>  		if (fadt->xpm_timer_block.space_id =3D=3D
>>>>>  		    ACPI_ADR_SPACE_SYSTEM_IO) {
>>>>>  			pmtmr_ioport =3D fadt->xpm_timer_block.address;
>>>>> -			pmtmr_width =3D fadt->xpm_timer_block.bit_width;
>>>>> +			if (fadt->flags & ACPI_FADT_32BIT_TIMER)
>>>>> +				pmtmr_width =3D 32;
>>>>> +			else
>>>>> +				pmtmr_width =3D 24;
>>>> I think disagreement of the two wants logging, and you want to
>>>> default to using the smaller of the two (or even to ignoring the
>>>> timer altogether). Then there wants to be a way to override
>>>> (unless we already have one) our defaulting, in case it's wrong.
>>> TBH, I presume timer_block will always return 32bits, because that's
>>> the size of the register. Then the timer can implement less bits than=

>>> the full size of the register, and that's what gets signaled using th=
e
>>> ACPI flags. What we care about here is the number of bits used by the=

>>> timer, not the size of the register.
>>>
>>> I think we should only ignore the timer if pm_timer_block.bit_width <=

>>> pmtmr_width.
>>>
>>> Printing a (debug) message when those values disagree is fine, but I
>>> bet it's going to trigger always when the implemented timer is only
>>> using 24bits.
>> The 2nd system I tried on would trigger it, so maybe there's no point
>> in logging indeed. How about the below as a basis?
>>
>> Jan
>>
>> --- unstable.orig/xen/arch/x86/acpi/boot.c
>> +++ unstable/xen/arch/x86/acpi/boot.c
>> @@ -480,7 +480,9 @@ static int __init acpi_parse_fadt(struct
>>  	if (fadt->header.revision >=3D FADT2_REVISION_ID) {
>>  		/* FADT rev. 2 */
>>  		if (fadt->xpm_timer_block.space_id =3D=3D
>> -		    ACPI_ADR_SPACE_SYSTEM_IO) {
>> +		    ACPI_ADR_SPACE_SYSTEM_IO &&
>> +		    (fadt->xpm_timer_block.access_width =3D=3D 0 ||
>> +		     fadt->xpm_timer_block.access_width =3D=3D 3)) {
> We should really have defines for those values, or else they seem to
> imply actual access sizes. What about adding
> ACPI_ADDR_ACCESS_{LEGACY,BYTE,WORD,DWORD,QWORD}?
>
> Also the check for the access size seems kind of unrelated to the
> patch itself? (not that I'm opposed to it)
>
>>  			pmtmr_ioport =3D fadt->xpm_timer_block.address;
>>  			pmtmr_width =3D fadt->xpm_timer_block.bit_width;
>>  		}
>> @@ -492,8 +494,10 @@ static int __init acpi_parse_fadt(struct
>>   	 */
>>  	if (!pmtmr_ioport) {
>>  		pmtmr_ioport =3D fadt->pm_timer_block;
>> -		pmtmr_width =3D fadt->pm_timer_length =3D=3D 4 ? 24 : 0;
>> +		pmtmr_width =3D fadt->pm_timer_length =3D=3D 4 ? 32 : 0;
>>  	}
>> +	if (pmtmr_width > 24 && !(fadt->flags & ACPI_FADT_32BIT_TIMER))
>> +		pmtmr_width =3D 24;
>>  	if (pmtmr_ioport)
>>  		printk(KERN_INFO PREFIX "PM-Timer IO Port: %#x (%u bits)\n",
>>  		       pmtmr_ioport, pmtmr_width);
>> --- unstable.orig/xen/arch/x86/time.c
>> +++ unstable/xen/arch/x86/time.c
>> @@ -465,7 +465,7 @@ static s64 __init init_pmtimer(struct pl
>>      u64 start;
>>      u32 count, target, mask =3D 0xffffff;
>> =20
>> -    if ( !pmtmr_ioport || !pmtmr_width )
>> +    if ( !pmtmr_ioport )
>>          return 0;
>> =20
>>      if ( pmtmr_width =3D=3D 32 )
>> @@ -473,6 +473,8 @@ static s64 __init init_pmtimer(struct pl
>>          pts->counter_bits =3D 32;
>>          mask =3D 0xffffffff;
>>      }
>> +    else if ( pmtmr_width !=3D pts->counter_bits )
>> +        return 0;
>> =20
>>      count =3D inl(pmtmr_ioport) & mask;
>>      start =3D rdtsc_ordered();
> The rest LGTM.
>
> Thanks, Roger.


--C2RUB6eTBb9Ebz7wYKddxQ40ytaxzUc3B--

--Hpm0V3gSivriNpTnX68iVzFwFe6oPVlE2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEcORGdCMIZOdpOj8ueAP19xcwDWkFAl7o4NcACgkQeAP19xcw
DWnTxQgAlRurkr+IUwIwRgjB7vebvpbZBJI0/jYjYr9ri7yiWGiAcr98vTBTf5ps
rVqC8MN3SYlrKx/AZDf7sODgDqhBn3UBcssXZcF18Tic7uU9BdjMHkx0lQ+RdHYW
l5ol8GBEuK9KKXwGERt/YQKLAjmwGJ/nInWq66r5UmSAW4q82AYXM3z84Cc2/QLz
My/kstsHrOrVXtz2NRDoHzI09LyMZw+mrDw8Of3D3aLL+T99lMTTAlNu2cwR1/l+
J0d9VeT5UojpTRE17hb6URtnWjRphWHi2HOVesk2kWZrkOnJkiiNpRZILhgd67ii
rwLZRk53QSC6Ys9Vu+TQ0kihj+rVgQ==
=+mWy
-----END PGP SIGNATURE-----

--Hpm0V3gSivriNpTnX68iVzFwFe6oPVlE2--


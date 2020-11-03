Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148CC2A437B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:57:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18235.43202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtzt-00059L-N0; Tue, 03 Nov 2020 10:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18235.43202; Tue, 03 Nov 2020 10:57:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtzt-00058u-HH; Tue, 03 Nov 2020 10:57:05 +0000
Received: by outflank-mailman (input) for mailman id 18235;
 Tue, 03 Nov 2020 10:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kZtzr-00058i-UZ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:57:03 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ab2ffa7-182c-4c64-b407-ec8f33589217;
 Tue, 03 Nov 2020 10:57:02 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604401014860529.1942258083284;
 Tue, 3 Nov 2020 02:56:54 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kZtzr-00058i-UZ
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:57:03 +0000
X-Inumbo-ID: 3ab2ffa7-182c-4c64-b407-ec8f33589217
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3ab2ffa7-182c-4c64-b407-ec8f33589217;
	Tue, 03 Nov 2020 10:57:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604401017; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XeyooSQxiPGnuLuzbrWqPiEFRvTTC1Qa1kXvxJ2KUbLyOTioYOSoTCt+cKhFf5n8uCr9IxesOJvz6cblXw5mwxzckYbuQM1E7kzqatPoiy+opPJ9ssNySImQPSft2UTC0hjuvv2wQkXY2UixI1wTp8wv52Bb7bAakrRlPJUCqgQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604401017; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=iCaF0jp3IRN9tZUCkkPA3t5ikCaMDd+YC3b9Mg7+CvE=; 
	b=KvmY9BPMv2X7jRTWYkIK2Pk1D6GemKnOWiwVsolmtV4viUL1WBPQH3xzJpBuolr0P6ORsUEyvgkB9z6mOmeet10tu9VDm036Wy1Z1wU8/XAcJwm9iFMa/x8kbIf9TdkA3ilL5vaej6ZztNZ02AAKclZUGRESHYZrFkqdxlsOBNU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604401017;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=iCaF0jp3IRN9tZUCkkPA3t5ikCaMDd+YC3b9Mg7+CvE=;
	b=IbF4XyenHHowpDK3R1tgvNYCbPAQkCQTtOQwBYzE8suiDShmR3RVpcg/DTO56THf
	dsoTS6fSrdaG9EFf7qnl61Gtik1Pz+pivmkew6Ny4M2SjgI5MSNYnvl6mi3/Vb33HAF
	EinPo4segyugLOPS+SLcpJ+ofFuvv1pyB72/K9LM=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604401014860529.1942258083284; Tue, 3 Nov 2020 02:56:54 -0800 (PST)
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
 <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
 <a855e71d-3610-0377-75e5-f08a02e96a25@xen.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
Message-ID: <1dfe9edb-e56b-0e0b-cd91-5af2e1558f98@qubes-os.org>
Date: Tue, 3 Nov 2020 11:56:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <a855e71d-3610-0377-75e5-f08a02e96a25@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="836bcfuhQ4PB7MWcAcyI0ET6Qy7igEiMT"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--836bcfuhQ4PB7MWcAcyI0ET6Qy7igEiMT
Content-Type: multipart/mixed; boundary="r5aCyVpMEAHf1sjm0VkBw0VhzJfyS6p0q";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <1dfe9edb-e56b-0e0b-cd91-5af2e1558f98@qubes-os.org>
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
 <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
 <a855e71d-3610-0377-75e5-f08a02e96a25@xen.org>
In-Reply-To: <a855e71d-3610-0377-75e5-f08a02e96a25@xen.org>

--r5aCyVpMEAHf1sjm0VkBw0VhzJfyS6p0q
Content-Type: multipart/mixed;
 boundary="------------370ECCE17B1C94732C8CA024"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------370ECCE17B1C94732C8CA024
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Le 11/3/20 =C3=A0 11:11 AM, Julien Grall a =C3=A9crit=C2=A0:
>=20
>=20
> On 03/11/2020 10:05, Jan Beulich wrote:
>> On 03.11.2020 11:00, Julien Grall wrote:
>>> Hi Fr=C3=A9d=C3=A9ric,
>>>
>>> On 31/10/2020 15:14, Fr=C3=A9d=C3=A9ric Pierret (fepitre) wrote:
>>>> ---
>>>> =C2=A0=C2=A0 xen/Makefile | 2 ++
>>>> =C2=A0=C2=A0 1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/xen/Makefile b/xen/Makefile
>>>> index 30b1847515..4cc35556ef 100644
>>>> --- a/xen/Makefile
>>>> +++ b/xen/Makefile
>>>> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?=3D -unstable$(XEN_VENDORVE=
RSION)
>>>> =C2=A0=C2=A0 export XEN_FULLVERSION=C2=A0=C2=A0 =3D $(XEN_VERSION).$=
(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>>>> =C2=A0=C2=A0 -include xen-version
>>>> +export SOURCE_DATE_EPOCH=C2=A0=C2=A0=C2=A0 ?=3D $(shell git log -1 =
--format=3D%ct 2>/dev/null)
>>>
>>> It is possible to download a tarball for Xen release (see [1]). They
>>> don't contain the .git directory and therefore this command would fai=
l.
>>>
>>> Should we fallback to "date" in this case?
>>
>> Isn't this what already happens? The variable would be assigned
>> an empty value in this case, wouldn't it?
>=20
> My question was whether empty SOURCE_DATE_EPOCH is acceptable?
>=20
> Looking at patch #1, the users of the variable will use "date" if it is=
 empty. Why can't this behavior be common?
>=20
> Cheers,
>=20

In fact, we could fallback to date in SOURCE_DATE_EPOCH definition and in=
 this case this would always be defined. Now, I'm wondering how misleadin=
g that could be with respect to its definition (see [1]): "The value MUST=
 be reproducible (deterministic) across different executions of the build=
, depending only on the source code.". In this case, if someone looks to =
the code and interpret the build time etc, defined with respect to SOURCE=
_DATE_EPOCH, that would be odd?

Regards,
Fr=C3=A9d=C3=A9ric


[1]: https://reproducible-builds.org/specs/source-date-epoch/

--------------370ECCE17B1C94732C8CA024
Content-Type: application/pgp-keys;
 name="OpenPGP_0x484010B5CDC576E2.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x484010B5CDC576E2.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFwkq3EBEADcfyaOkeuf+g96S1ieq05tJ8vTGsQrNXQ5RDE7ffagL0+EpfIP3x73x5Q0D=
y2r
UVQ+oN1DHcueNL70RtNs9BFnoW0KZnskbT4nEJ9wQCQa22lQaIk9kCNVddh2HJKljtd8vtovi=
97s
WIjtzxx5Qwc2md0DY9AHhNC4KqKIW3tSPC17UsI8fASoNAHItYtyn2bO67p8pCIvltoBrYnEl=
D1P
yp5IGWiD2/YD325iPl2+qHVkUSWmb92hRRU19Rg+Uds8bVHqhz4cOqIE7jpXgYzTN/kq8sxBM=
h2O
rQ/bSxLaccaNApIVSZVSAasVJfdscNDL9fjkHERK/AiSTleHrsgLf4PLw5koqPs/6JEIVI+t0=
pyg
+Pa8uwFoeYTPrLSlw0f7bXSmlVfv8g7M7RWmk3T5QIpeHA0j3lEZNbYRXzkI91HCt40X2bTb2=
jTK
gvB9jQjEarpk6euvGs2Ig/U4MlUy3pG5Ehd2Ebn8Rz31JXpaA/GPaJ5DjzV0q9mkYkGDLYI3J=
/J+
s2u0Kr0VswLaIN3WJn7kKEDwfc4s2kaAYfblE/p0zVirEVBum723MFH4DxhTrOoWgta2nyRHO=
oi0
z0EVhYA+D86mFPWKb9roWvtnmFlssggGmqbJEMvtLbYnlSt3v32nfUXh12aQPwU/LCGIzq4oF=
NVr
Np3aWPnSajLPpQARAQABzTxGcsOpZMOpcmljIFBpZXJyZXQgKGZlcGl0cmUpIDxmcmVkZXJpY=
y5w
aWVycmV0QHF1YmVzLW9zLm9yZz7CwXgEEwECACIFAlwkq3ECGwMGCwkIBwMCBhUIAgkKCwQWA=
gMB
Ah4BAheAAAoJEEhAELXNxXbiPLkQAI6kEDyLl0TpvRDOanuD5YkVHLEYVuG62CJNwMjFoFRgZ=
Jnl
+Fb5HBgthU9lBdMqNySg+s8yekM9KRlUHKYjwAsyjPIjRtca4bH3V11/waKpvPBgPsC75CxSZ=
9uI
TprfEqX7V2OLbrYW94qwR8jX+n/wlEGG3pbfXG7FTnjxQWM0E0aSvO0Yb5EkjiJ7cwEiqvL04=
Uek
t5I2Zc8iRDF9kneINiNhzRtvrR1UN6KtiZNSk2NsLOptrUQ/1AU5jwH4mnQQymtYDsWddlRoD=
RC/
bsAow7cBudj+lekM3cNRZOazKZx5UPnN8nqvD7FqeAcZBVyrHZ4hcWqABaJEPv6CCHRiLQnGR=
9ze
2O5Yh+/BunrOJdjdsib1ZECH9GtIcj4mmPAN84NO4r8a6Sn9jsXkd2Wj2N5wNrZMPslhfiaW2=
VHT
fLmAOt+wRwLRsFfqLykF8hMlNXXE4frxotwa6+PTd48Ws9H9aalSs0lebsG0623b4mBjy1cox=
FUw
eclPInXsPEdu/Yu2r7xrgGouXH8KgDhqlqq60UaA5n/0XhIeZ8tBTYs+1B5/C9TjvNAUsBkob=
1Ep
fW3J4Gq14GqwK+eodOTL5t2f2PWN/IQyop/j0FMgVU5/PUS0pciz5ybyIJBLhbsJBvKbxM/Ny=
xHr
mNwGEknpoeq+XT8rEJ+/Ag8Wnjl0zsFNBFwkq3EBEADAPJdyFy4KeYpuGATWwWCNHe8XNVqBp=
lV0
yVlT5pSiCyA3UK34JlGX9YJOj/FlMZGgh61vbiK+piRjm/lyb128wpMjnoOmqpbSLbra8NP8M=
u5F
ZMcv8OxrSIr/RHq2heFg1j11QOMGwe6vPC918qpzmiaYj2qpKY/RYsG8V+9+dpLEU75+mpHU7=
GlE
CfPmHYbnsismL/4+xH+8BG56yg0UFbfrNYonIQFSn5k/w6i7jt7M++ZmWfEV5nCP2qvzeYDGA=
L6B
bWVOjuDhrKsAIKnomCyy+MjcVP955PVdN2+OlPJng07oKtQr5aNCaNpv/i4gLO1IScdfDwm6g=
dfB
2Zg/7jTJrKw0kWPFl9rHfN7dLAR28u3uT8Rhicjdd7hgYlDWdbImhNL/Z7iL3eayH7T9qAVNU=
587
MhWvIREyE1gj22cs0e1m6qMFpbFYG0709N2UwlpAH+Pd35bTi9q2o1pH91xBYH6QvvrwsuVYH=
wuc
3xXLRVRXWXY8xvNFSlY1LB8A46JOtV/ZodYDyhxVGbeWp820cb0s1f689XCXqFYAzTfCit+Ee=
boY
ORN5CGioXzS+z0S9IhPbdUuvqs7xvC248bM7nm84YdgVM7HWybOtpRpWpycwGs73IvbxyLE9a=
Pe/
Zw4PTKWvbJlcFioofLwTQE1XvWomFPD9LLrBl5NUjQARAQABwsFfBBgBAgAJBQJcJKtxAhsMA=
AoJ
EEhAELXNxXbilSkP/2NcazvUDGyQLm7tFp4HNqSQfFJ3+chzxfOOdNtdWE+RFetyx9R8DBGrP=
X8h
jITWD9ZA2bbZZ+J+a39vyY7bNZkCGbWzPGK//O1cInL4Ecmj7Xm8DXjk3E2Xzv1YrZk/GBz9x=
K8m
WXwhn90SHNadEf28ghMXcmUJSqT+KTxQQjUVaEtQDdzQnYQKh/dHxs760QSAnXkWr0YVYxk8q=
8aa
+G8iAkNJcb+Wx5gWEw4ft3HpKMRq74OQvWayy0fXpTlusdnvZs0VVMeRpCW6iCt9UmsbfG6Ny=
f2M
KKbWRJntjy8mjJiFjiJ2j9s4yNIookRv8IfocULuhnx5FWsvIzX2Vwcd7G5objnY1DlCNQrhJ=
Us/
geoCUBjBJp7sfbHakWfTKxZjFsuCXT1dCEN7JXX6ABOshzDTwB0kq7Bq/EkOzPDQGfOPoX2h1=
KjH
uvGWw5cBe8WLnEuhIyf/DWfMS1LbjFB4JlMUEcood5xvE4owpfZog+0a9gpBS6cg9bMgRUex1=
C+w
3fudJdPQwIRAjJgac0jTT6uDY8re9RhBDv83PRSM7AzxqEFvDj8K46dg1XvJcKs7K5PXpm5Pw=
4st
VEAxIks5uR62wxygImkdvgjQRzJe4JWwAniBWsZG+cNYj6xcItqkupIb4PeOWgNQQMhGv8Dnb=
AdO
OOnumAXWq0+wl5uP
=3DRWX1
-----END PGP PUBLIC KEY BLOCK-----

--------------370ECCE17B1C94732C8CA024--

--r5aCyVpMEAHf1sjm0VkBw0VhzJfyS6p0q--

--836bcfuhQ4PB7MWcAcyI0ET6Qy7igEiMT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+hN3MACgkQSEAQtc3F
duKZuQ//bqEBNKUE6HALsvKjK8kdg1KlfEb5ViV5LrFBG/BLkeC7Bi0v+uKWpMM/
9PoGAPzfitGqZP/wqWStwE5IkYTDrW7p72PI2NEC5UJaiYp8enVcwmwGuUIHcYQO
zgfGzCTH3fAQv0L+0bb1I1ZW/FN1uo4oeGfgxB1wb8tTHkEwR/PvTxPw3VInRvwU
aJklLk0phUmbDg01RLNQxHzn2ZRlCR7HZ1pMBO2mlwLg8F3WR6xPrzbRu8PHqyhX
xhsgUQQmIQlCWpD4c8mp0EKtMX+n/jOqDOCE00vExYtpWUGxmzm6Vq1PS1z9uRcZ
/UDfyEjd19E7ZpyzhByCy4iiwwL65ShtBa4ugOqW2lQuj3htgXQEps9EqBOtx+jf
Ng3GLHsYDN4kM0NfYTyMSDyX2fqLIFMAAc9GUpyIun6G+WIHZmz33khPS0IIh9mI
YRLUQh87HcqLSGnrqSkPYKMuXhJVaBtRmiYO1EAeQNQGWmgvR4oILTbE4plfvYGU
GxBZGT/onjB7azAeNereZ2MDM+VRPlQDzR16NQEmXXPQ8bprcJ/tqOYd3uavGiev
xukQ6NDqlRveKsMwbHCPcJLwJYbXlO3H5lqYHadjAHNHi4moVj7JeI6mdF3cRoqN
7BeBDFhzRMcBYw7F31M6GX1hT6RishzXDLX3DPfYSceX11kOGKk=
=cz9p
-----END PGP SIGNATURE-----

--836bcfuhQ4PB7MWcAcyI0ET6Qy7igEiMT--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A52A414F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18169.43043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtHZ-0000Fj-NP; Tue, 03 Nov 2020 10:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18169.43043; Tue, 03 Nov 2020 10:11:17 +0000
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
	id 1kZtHZ-0000FK-JD; Tue, 03 Nov 2020 10:11:17 +0000
Received: by outflank-mailman (input) for mailman id 18169;
 Tue, 03 Nov 2020 10:11:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kZtHX-0000FF-L0
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:11:15 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e64b63d-8b8f-479b-921e-2830258cfc95;
 Tue, 03 Nov 2020 10:11:14 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604398265597262.2454710694693;
 Tue, 3 Nov 2020 02:11:05 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kZtHX-0000FF-L0
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:11:15 +0000
X-Inumbo-ID: 2e64b63d-8b8f-479b-921e-2830258cfc95
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2e64b63d-8b8f-479b-921e-2830258cfc95;
	Tue, 03 Nov 2020 10:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604398270; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UI9NcwXVBDVYzRF18XAqtzn/fN60aCM2YyOOFo+Xu3UaWKkq0/v5Kaorq2p3K8fj79DKd6Ebi7R370wG0T/RtxszUj2aMXKYcQkqVXQlcDilSGv4Kn8Hcje+xeIrO6yzFzKhKL9CmKcSBqg4pR2f6ppdHQ9M+6I0DW4C9qnb12k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604398270; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=NBUnu4eFKiYodaIYDWrN7A5S8fdkqH8j0CP5dcjuKFI=; 
	b=e/RNSBtibPxnKrzBjWhhTVTIrk/L1ElysRf9GlfhsxyMcr9m0xZGOJUhz1sC8zSkLD/hmYTF1OXIAR7R1/fk1fCLnUKIyQ8bJ/qws7oah7wYt5jKjtIt0KvsvvvBRbVbKMBAjVUWet/e7cfvQhzf/6grLSY7BQBFNIYy+3v1Lis=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604398270;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=NBUnu4eFKiYodaIYDWrN7A5S8fdkqH8j0CP5dcjuKFI=;
	b=ZMkE/ttfaMeXATVtSeFKomFa46uzn3iiQ6QlF/XD9IQF9VM1mkZMpl1OFXfy8GXJ
	LDmLekD131YVydpjad4zmUfaMz1GxiGY2ajoahqU8TjegU9Hc5SmRCYBqqYrNxTKkb9
	TBND+jfAPe2EHQPvOhrhHUhPzIcZcNWY7dtmUcuk=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604398265597262.2454710694693; Tue, 3 Nov 2020 02:11:05 -0800 (PST)
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
 <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Message-ID: <89363871-0fb7-701b-f6e6-7b94c767618f@qubes-os.org>
Date: Tue, 3 Nov 2020 11:11:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GWsyUHbKc3ZtpIUfRi3ZFrwKN3zMwKvAI"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GWsyUHbKc3ZtpIUfRi3ZFrwKN3zMwKvAI
Content-Type: multipart/mixed; boundary="I8Tp5nlXdgO4uIHZEZlKIgz7bhuNpQyKE";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <89363871-0fb7-701b-f6e6-7b94c767618f@qubes-os.org>
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
 <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
In-Reply-To: <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>

--I8Tp5nlXdgO4uIHZEZlKIgz7bhuNpQyKE
Content-Type: multipart/mixed;
 boundary="------------162C3657FAB2C1BF50A93984"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------162C3657FAB2C1BF50A93984
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


Le 11/3/20 =C3=A0 11:05 AM, Jan Beulich a =C3=A9crit=C2=A0:
> On 03.11.2020 11:00, Julien Grall wrote:
>> Hi Fr=C3=A9d=C3=A9ric,
>>
Hi Julien,

>> On 31/10/2020 15:14, Fr=C3=A9d=C3=A9ric Pierret (fepitre) wrote:
>>> ---
>>>    xen/Makefile | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 30b1847515..4cc35556ef 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?=3D -unstable$(XEN_VENDORVER=
SION)
>>>    export XEN_FULLVERSION   =3D $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN=
_EXTRAVERSION)
>>>    -include xen-version
>>>   =20
>>> +export SOURCE_DATE_EPOCH	?=3D $(shell git log -1 --format=3D%ct 2>/d=
ev/null)
>>
>> It is possible to download a tarball for Xen release (see [1]). They
>> don't contain the .git directory and therefore this command would fail=
=2E
>>
>> Should we fallback to "date" in this case?
>=20
> Isn't this what already happens? The variable would be assigned
> an empty value in this case, wouldn't it?

Julien, Jan, yes it already fallback to "date" if the variable is empty (=
it's the reason of "2>/dev/null") in the other test of check if SOURCE_DA=
TE_EPOCH is defined. Maybe there is more elegant way for this. Depending =
on the wanted here for providing or not a default value in case of git so=
urces, this could be documented instead as suggested previously.

> Jan
>=20

Regards,
Fr=C3=A9d=C3=A9ric

--------------162C3657FAB2C1BF50A93984
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

--------------162C3657FAB2C1BF50A93984--

--I8Tp5nlXdgO4uIHZEZlKIgz7bhuNpQyKE--

--GWsyUHbKc3ZtpIUfRi3ZFrwKN3zMwKvAI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+hLLUACgkQSEAQtc3F
duIYwBAApiqOPvN8zhoU4ZAgC4pnHdds/YLGmHYzgCOrcypSlN7jXJEcPpKb/lhx
75tSMJfokHl33hrIochleyaYYrwMPrwpa3akG4vb1D0kXY50Ps29ofdEOcQj1a4N
rSB18cyKzXpYCN769QpfA1osqstB0oGCtID40SOFC2Jbh7V6g4JvCQR7yrJDfMEb
BvYkCZiB/EZzq2mP4e6NNV5J+o3bDVHJcjQLLt8ZsPQ/R4xvmZzhikzb3RM/+r28
oFlrcwZQg8w5LifYCrQpKlAjLxQ+ogF/Vmu1PXqDZcANSed3bRYwO5NRJu+c8024
nATWM4uB2cfQFUappO5XVLejmkkztIrFut6lNYJuDMyGoV0KjfBdMzi8fFxNA3F+
vBHHvAHNupej7HTNr19hhKqRnGa/i8StJdfI2VNEJSj1HaXRbTkvYYs2efmh2w7p
kXIRyuptbXFuuLRacTFkJzUSoeznVbBDULIc6Rufn9Q80euY23j3rMLkb7h25kVe
oSLrW3zXMvkgDrpJa5RiJ9EzO4bjq76SEuDNBiIiZ9IRUJMvJpfbX8oUx3L7Qy1J
eLFvKoqVehnCBfXvzjusMfNoGGLnP1CUe0drNZMTTg9BEC2SqN3AuLnaEjWkTL2j
a7gjNUFgMvzJjUKRMIvctMCT79vY+gV7+B6B9Ul1Cc5q+MGOfsc=
=MV6O
-----END PGP SIGNATURE-----

--GWsyUHbKc3ZtpIUfRi3ZFrwKN3zMwKvAI--


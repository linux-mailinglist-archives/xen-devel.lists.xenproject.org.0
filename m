Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AE2A3FD0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 10:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18046.42800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZsSP-0001L5-BU; Tue, 03 Nov 2020 09:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18046.42800; Tue, 03 Nov 2020 09:18:25 +0000
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
	id 1kZsSP-0001Kf-8D; Tue, 03 Nov 2020 09:18:25 +0000
Received: by outflank-mailman (input) for mailman id 18046;
 Tue, 03 Nov 2020 09:18:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kZsSN-0001Ka-Ng
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:18:23 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54e63eb8-de31-40c8-9378-b20d91cbcbe7;
 Tue, 03 Nov 2020 09:18:22 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604395096815928.1676514834194;
 Tue, 3 Nov 2020 01:18:16 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kZsSN-0001Ka-Ng
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 09:18:23 +0000
X-Inumbo-ID: 54e63eb8-de31-40c8-9378-b20d91cbcbe7
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 54e63eb8-de31-40c8-9378-b20d91cbcbe7;
	Tue, 03 Nov 2020 09:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604395098; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k9jdRcOxDXPr5tA2JlsPs03MYPBh6kL1C3c/zZq3f5s+o8NF2K+q+1gITK+UnKDXWu+eduXAufQVTLDtwb0RveSLe4czT49IK2qvGm3NDUrHfdTJicbjCil038P61LSQ3wQEQAxsnFy25RIDHLP/RbttSsORygFPwHFROZygZgg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604395098; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DCXrlknV304fNI7tghg2f9ApOklKQCZfC6k3Qw5tdnM=; 
	b=KFFyoCipgFUHXwq1Qmat9/q15U3zzTZEgjf1PwvPKcu3JW5hgztg0QYG/o6ZPCHJOxQPH2kKflnbAxiWWB0IIs47Qyo3ncqez9A8vPLsNZLaG4N3Tu3yWbWJ4ug/QgvkYl/NQLpIY9ZKBJJFdnwIzZRc0cQYnDEGznZriyhQLGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604395098;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=DCXrlknV304fNI7tghg2f9ApOklKQCZfC6k3Qw5tdnM=;
	b=WcNn6ppMq63n312cshENASXLUx5/X1R+qh7tOezNykggr0rmrsb4SIcC5s9Gve0F
	DHJP8K4bSRNmmHXan+cFUD/PdlU40lare3Xie8PIfVmH4pKapFjWw0+15S4wqK+VBhD
	XA0cQJcmQa7ElcH8UKRdx8RbLBDBL+URS+RTHfiU=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604395096815928.1676514834194; Tue, 3 Nov 2020 01:18:16 -0800 (PST)
Subject: Re: [PATCH v1 1/2] Define build dates/time based on SOURCE_DATE_EPOCH
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <57423c6627e00fbc3f41d3f6be6ba1e15abb96fc.1604156731.git.frederic.pierret@qubes-os.org>
 <68db059e-bc65-ee1a-ac3c-004b4552133a@suse.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Message-ID: <0e312fe7-3dc9-e23e-ec70-70f1d8fc962f@qubes-os.org>
Date: Tue, 3 Nov 2020 10:18:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <68db059e-bc65-ee1a-ac3c-004b4552133a@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CGeHsiwKj3rHrUriGhqvWUaQ25MTejxrj"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CGeHsiwKj3rHrUriGhqvWUaQ25MTejxrj
Content-Type: multipart/mixed; boundary="xulLMhs0LkivEtEoQsCzZJNqJtbG8uxGi";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <0e312fe7-3dc9-e23e-ec70-70f1d8fc962f@qubes-os.org>
Subject: Re: [PATCH v1 1/2] Define build dates/time based on SOURCE_DATE_EPOCH
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <57423c6627e00fbc3f41d3f6be6ba1e15abb96fc.1604156731.git.frederic.pierret@qubes-os.org>
 <68db059e-bc65-ee1a-ac3c-004b4552133a@suse.com>
In-Reply-To: <68db059e-bc65-ee1a-ac3c-004b4552133a@suse.com>

--xulLMhs0LkivEtEoQsCzZJNqJtbG8uxGi
Content-Type: multipart/mixed;
 boundary="------------0280C1EE39BC06747DCFA01C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0280C1EE39BC06747DCFA01C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


Le 11/3/20 =C3=A0 10:10 AM, Jan Beulich a =C3=A9crit=C2=A0:
> On 31.10.2020 16:14, Fr=C3=A9d=C3=A9ric Pierret (fepitre) wrote:
>> --- a/tools/firmware/hvmloader/Makefile
>> +++ b/tools/firmware/hvmloader/Makefile
>> @@ -21,7 +21,11 @@ XEN_ROOT =3D $(CURDIR)/../../..
>>   include $(XEN_ROOT)/tools/firmware/Rules.mk
>>  =20
>>   # SMBIOS spec requires format mm/dd/yyyy
>> +ifneq ($(SOURCE_DATE_EPOCH),)
>> +SMBIOS_REL_DATE ?=3D $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "+%m/=
%d/%Y" 2>/dev/null)
>> +else
>>   SMBIOS_REL_DATE ?=3D $(shell date +%m/%d/%Y)
>> +endif
>=20
> As this pattern recurs, how about abstracting it away via a
> definition (perhaps to be placed in ./Config.mk) along the
> lines of (variable name subject to improvement)
>=20
> DATE_EPOCH_OPTS :=3D $(if $(SOURCE_DATE_EPOCH),-u -d "@$(SOURCE_DATE_EP=
OCH)")
>=20
> and then here simply
>=20
> SMBIOS_REL_DATE ?=3D $(shell date $(DATE_EPOCH_OPTS) +%m/%d/%Y)
>=20
> (i.e. in particular also without any "ifneq()")?
>=20
> Jan
>=20

Hi Jan,

Yes it makes sense. I'll prepare another version with your comments. Than=
k you.

Fr=C3=A9d=C3=A9ric

--------------0280C1EE39BC06747DCFA01C
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

--------------0280C1EE39BC06747DCFA01C--

--xulLMhs0LkivEtEoQsCzZJNqJtbG8uxGi--

--CGeHsiwKj3rHrUriGhqvWUaQ25MTejxrj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+hIFUACgkQSEAQtc3F
duL+mRAAiafGIEjO+CpiVg4+dxeCl9Re561GVlRNQg47vRwECPoeiFzVC85zQrq3
72caB/hwE8ctYRxQODonT8AAKcFjNH0v3BksT6Yi2mGY6pCi64/DVoyGEDDYzHUp
nEwtUgbJvIydQtBYXiRlxJUq7ft2VBy3CZLtYFP5TquRHd3KK5dhkbuuk/+ZyGLl
33naZJpyTUmzvHb7c7uSJSO0n+p1FMvYJrqb5WNEkNbZOYnf0SRKk3pTouKlhbhE
Nk8hUhNTle3kMBKhbN8EctEhM0UdNc2GcTNyMyqWVeg+teGXAu4I556SJ/HdwLBO
ecGv6ly7acwgsY+KnfAWJpUrADvJlOSpD4oP5SZ3Otm0vxl2w0u8Q3zdVk88+kQX
rPnGNPRcJVgU2pvqaRYgKNKveDEUQzGcMb8Om/kAZHdyDYyTwMUEeQLL+vogjxDc
TYRr5HgKdqrfLumc/XCXu2j29rgBYUHPO7+gRMpAjErPMRxkqVs/0YAGBVl89WT3
uHTsMjepUAzTwbAiKyTecEAthSnoz5b6gQcr5P+wQdCpElMQ+aCYcQTl+yyPSxbu
C6HINNl+qilf2R2KIBp8z1bj8AcpIvpl5suyTiMlmq3yj6jHTjAppkD60bPHK3L0
ExdAkY/YNXiFuTkCHKFO4Wj7q5xRWmbsgC/+it6P9QLZTSbuB2U=
=y+vN
-----END PGP SIGNATURE-----

--CGeHsiwKj3rHrUriGhqvWUaQ25MTejxrj--


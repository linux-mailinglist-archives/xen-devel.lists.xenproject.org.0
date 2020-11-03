Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE42A4858
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 15:36:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18360.43369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZxQI-0008SO-7e; Tue, 03 Nov 2020 14:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18360.43369; Tue, 03 Nov 2020 14:36:34 +0000
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
	id 1kZxQI-0008Rz-4c; Tue, 03 Nov 2020 14:36:34 +0000
Received: by outflank-mailman (input) for mailman id 18360;
 Tue, 03 Nov 2020 14:36:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kZxQH-0008Ru-5e
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:36:33 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d2b808c-643e-450c-abb3-1ed1a3ff6ee8;
 Tue, 03 Nov 2020 14:36:32 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604414186744884.2632144736624;
 Tue, 3 Nov 2020 06:36:26 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uWmA=EJ=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kZxQH-0008Ru-5e
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 14:36:33 +0000
X-Inumbo-ID: 8d2b808c-643e-450c-abb3-1ed1a3ff6ee8
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8d2b808c-643e-450c-abb3-1ed1a3ff6ee8;
	Tue, 03 Nov 2020 14:36:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604414189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AOBScQlcPkeRF7pLurU7Ucs5OR+h6oxZN2CPB0K4wa4B9OqLTqxTRxTwqvw0qcj6IGFhdZc1ZEuCl/EEIHQYN1YjzfLeccBva53ZbWpn+ZB7JRCZphMkAxDgrbL8qxBhrXGi+jXicH9WA24ROXTu/skH6T1OIm1UGT9/9a5ojhw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604414189; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=aK0qDr51RFIT+8ZZXZByEYXzbH1OSzNaKROwfwDemeU=; 
	b=SDuxn818s3ez7SgMCitduJmZ6aZ+pnTIzAnF8hQ/BPd3RHkc9hclZvB2Wo9CFH8aFpb1ak4J9jjBsfMvMBxfU5DrJtR8jEdX3eV69ixwSjihl7F8w7Nd1l+VY+Qry4U2+BpF/zVbAIaNj78fKR3UFg3GPWb95/9DCES72mvgOeE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604414189;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=aK0qDr51RFIT+8ZZXZByEYXzbH1OSzNaKROwfwDemeU=;
	b=GCRR6DxZhzlrGuwwkqIbqDiYMXIqZdlQ9iuG7hPJEr6KRif9FCv/Kv7FKE//sc5R
	kYzLTIzqTh3wx2Lf4cnkh1qOdXuAfaqyWrvAU6lM3KoIHqD+q1FNv9L4YAXyyZjSaIG
	ltEkb0v7+Qw6T7TySCTtWw9y75q4yupNvFwFWVdM=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604414186744884.2632144736624; Tue, 3 Nov 2020 06:36:26 -0800 (PST)
To: Dario Faggioli <dfaggioli@suse.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <JGross@suse.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
 <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
 <20201031025442.GF1447@mail-itl>
 <c17e7a152a7e1922bd9c729f70a96acf4ca5240b.camel@suse.com>
 <20201031040817.GG1447@mail-itl>
 <2cbcca0b-8415-8f98-46d8-12279703cbbe@qubes-os.org>
 <f9ceee15b46bfe66d126644986c25ced1ed70d0b.camel@suse.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Message-ID: <7eba1d54-940d-54c7-905d-f46e1db48d79@qubes-os.org>
Date: Tue, 3 Nov 2020 15:36:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <f9ceee15b46bfe66d126644986c25ced1ed70d0b.camel@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RAOUBkqoSPxdHoSIL2bCWrBl0q1hqppqJ"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RAOUBkqoSPxdHoSIL2bCWrBl0q1hqppqJ
Content-Type: multipart/mixed; boundary="GP4dnsV0Zc2pzpcKgeKTdvIAYMTCnNcqx";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Dario Faggioli <dfaggioli@suse.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <JGross@suse.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Message-ID: <7eba1d54-940d-54c7-905d-f46e1db48d79@qubes-os.org>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
References: <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
 <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
 <20201031025442.GF1447@mail-itl>
 <c17e7a152a7e1922bd9c729f70a96acf4ca5240b.camel@suse.com>
 <20201031040817.GG1447@mail-itl>
 <2cbcca0b-8415-8f98-46d8-12279703cbbe@qubes-os.org>
 <f9ceee15b46bfe66d126644986c25ced1ed70d0b.camel@suse.com>
In-Reply-To: <f9ceee15b46bfe66d126644986c25ced1ed70d0b.camel@suse.com>

--GP4dnsV0Zc2pzpcKgeKTdvIAYMTCnNcqx
Content-Type: multipart/mixed;
 boundary="------------48A79D9974D6BB704456BFDA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------48A79D9974D6BB704456BFDA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 11/3/20 =C3=A0 3:15 PM, Dario Faggioli a =C3=A9crit=C2=A0:
> On Tue, 2020-11-03 at 14:23 +0100, Fr=C3=A9d=C3=A9ric Pierret wrote:
>> Hi,
>>
> Hi,
>=20
>> Some new info :). Marek has sent me a patch (
>> https://gist.github.com/marmarek/810ae5c079d218928535514b08a07716) to
>> help in debugging this issue.
>>
> Ok, thanks for the update (and thanks Mark for putthing together the
> patch).
>=20
>> With default credit2 as scheduler, here are some log from two
>> successive crashes:
>> - https://gist.github.com/fepitre/76a1e154249c7326c743d6a6d004a67b
>> - https://gist.github.com/fepitre/ab00091980cb8110fb3d349aecc3a644
>>
> Right, this is what you see when you poke at the debug keys, after a
> freeze. It would be interesting to see if there is any trace of the
> debug output added in the patch _before_ the crash... But I appreciate
> that it's not really easy to achieve this.

I'll try to find this info in the next days.

>> Also, I've been testing "dom0=3Dpvh" option and the system remains
>> stable since more than 24h. At least, I've not experimented any
>> freeze since I'm using this option.
>>
> PVH and what scheduler?

PVH and Credit2.

> I think it's quite clear that this is not a Credit2 bug, as it shows on=

> Credit1 as well, but AFAIUI, with Credit2 it shows up more often?
>=20
> Now we also have a (weak?) dependency on the type of dom0?

It seems so.

> What's the configuration that is currently working?
> Credit2 +PVH ?
> Credit1 + PVH ?
> Whatever + PVH ?

The only differences between Credit1 and 2 was that Credit2 was generatin=
g freezes faster than Credit1. Here is the output of `xl info` of the cur=
rent "stable" running config:

"""
[admin@dom0 ~]$ xl info
host                   : dom0
release                : 5.4.72-2.qubes.x86_64
version                : #1 SMP Sun Oct 18 16:17:06 CEST 2020
machine                : x86_64
nr_cpus                : 16
max_cpu_id             : 63
nr_nodes               : 2
cores_per_socket       : 8
threads_per_core       : 1
cpu_mhz                : 2593.766
hw_caps                : bfebfbff:17bee3ff:2c100800:00000001:00000001:000=
00000:00000000:00000100
virt_caps              : pv hvm hvm_directio pv_directio hap
total_memory           : 163805
free_memory            : 11077
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 14
xen_extra              : .0
xen_version            : 4.14.0
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hv=
m-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :
xen_commandline        : placeholder console=3Dcom2 dom0_mem=3Dmin:1024M =
dom0_mem=3Dmax:8192M iommu=3Dno-igfx ucode=3Dscan smt=3Doff gnttab_max_fr=
ames=3D2048 gnttab_max_maptrack_frames=3D4096 loglvl=3Dall guest_loglvl=3D=
all dom0=3Dpvh
cc_compiler            : gcc (GCC) 10.2.1 20201016 (Red Hat 10.2.1-6)
cc_compile_by          : user
cc_compile_domain      : [unknown]
cc_compile_date        : Sat Oct 31 16:02:25 UTC 2020
build_id               : 0bbdc8aa6f34a2b27c3ac9842741bc022269f9ee
xend_config_format     : 4
"""

> Regards
>=20

Regards,
Fr=C3=A9d=C3=A9ric

--------------48A79D9974D6BB704456BFDA
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

--------------48A79D9974D6BB704456BFDA--

--GP4dnsV0Zc2pzpcKgeKTdvIAYMTCnNcqx--

--RAOUBkqoSPxdHoSIL2bCWrBl0q1hqppqJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+haucACgkQSEAQtc3F
duLfdxAAoH5tixJNO30K9SHLpHrFectLPdQhGaf2+vWbYM0enBrCxhJkKwPWOj+O
iY9TRRl4E1nWSpabFKZ5DTuNO2C98so5cv5n/cXkVCFhpsqga0JIP1Q+5jhqVL8S
xwF1O/6pO/Xkf3mDpHEh+Z6Y9Xv//7L1v3y3JZOsXriUp5E/Nrq2P5a8u1qLLIf+
Qyf2uhGYEBn+swhMuX0TcZBnTkaLNFEIifmzIKndaRcqd3pSuklAL6qhToIi1jR8
eetrYgO3QjhIqcRZyiTiZ2+8Q0SJLbbFHf1mRDeecI+5euN26b46JVLZXXUBfNx/
HF0fFYgHG83UKNERt95x+jQr5ZEvuPiyEBOR+V50WYnY0Me+6ZMLQ5xhcfoAXX0U
zHTgay97lsji9oxHAdFxp76SCkBBoJhjttdFraec3vg/p5HB0gm+YGU1jOZMzNmG
u9e5zmGAkaynJxHjYitRQDyZLt1K6X9hoDxo/L3C7sji0i79l9LE1pcF4jtGHPHw
MG6W9xkO0xrh/IxB2AHB7/091mMQ0KSKMISLFhWRTAJ1OENiSQU5TQYPj0yuYKG6
KwzmVY6jIgtlGI5czLH2bJbgoEu7qgXhvm9x6/G5MjN9PGiD4f41QCbVwd3EyXs9
FOjTh8YA85KwlN/QvqvBvuGEimHRKjzWOPde9nFNPuQ+odu1Iyc=
=fQuu
-----END PGP SIGNATURE-----

--RAOUBkqoSPxdHoSIL2bCWrBl0q1hqppqJ--


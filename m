Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0329C82A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 20:03:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13061.33607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXUEw-0006xz-08; Tue, 27 Oct 2020 19:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13061.33607; Tue, 27 Oct 2020 19:02:37 +0000
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
	id 1kXUEv-0006xa-Sv; Tue, 27 Oct 2020 19:02:37 +0000
Received: by outflank-mailman (input) for mailman id 13061;
 Tue, 27 Oct 2020 19:02:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOid=EC=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kXUEu-0006xS-HZ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:02:36 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33b64eeb-d449-4697-a1bd-b3de12fa2a07;
 Tue, 27 Oct 2020 19:02:35 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1603813375063569.4061733314264;
 Tue, 27 Oct 2020 08:42:55 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zOid=EC=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kXUEu-0006xS-HZ
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:02:36 +0000
X-Inumbo-ID: 33b64eeb-d449-4697-a1bd-b3de12fa2a07
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 33b64eeb-d449-4697-a1bd-b3de12fa2a07;
	Tue, 27 Oct 2020 19:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603824973; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GNopAgwdzENJHsG41YS11o0ebFEbgiiLCDhxYWWvWHzvVKu69PrUW7GxOUhFxL5tKUqFV4sBefxLnp6UeVGfImI6tcS42tyvyHYIhAu81FGuf1GTcyZws8xLCWckgavqZcRORtseJu5v6imGJtDf5z0QWIV2cSidzKSD/gaaxvg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603824973; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KB1GGuP7nPe19SpJ+/wqtnpUKBz9kLLmZQoSyqn60p8=; 
	b=Oh+wvXhniC6gmuZI/OJ6I/fv5HIfkfoL4818GCP+kfX4ZRlFO1guY3u2TaiIdSUT+xvIpwlpBAuEGDKcQDBMFWmpOPVty8pIf+n6A+IqXciQXpzttCVGK2Wfv46DO0OAG/xXLumSr8loKePKVaoyCpFVfK0IKYgoI85TR54EQAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603824973;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=KB1GGuP7nPe19SpJ+/wqtnpUKBz9kLLmZQoSyqn60p8=;
	b=SucvbrXbMrnDUQOqn/GiLA4Nl/gOhUMZ+8+4Jv8PBvbIww6g3Yxp8CPZN/NVWUi4
	jvPriJCedtg2N/vcgQshpnEm+2bsVoliYooSoXUZr+LkmKwl5TOt/DQ+QLhMKkSdGw/
	QRk7UW5A4JKb0emBqml3RdgQHRV/vENSz0Dag0aQ=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1603813375063569.4061733314264; Tue, 27 Oct 2020 08:42:55 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
Message-ID: <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
Date: Tue, 27 Oct 2020 16:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xR62Yw6Zhwo7qE7jF8KUz2WRyV4MP303C"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xR62Yw6Zhwo7qE7jF8KUz2WRyV4MP303C
Content-Type: multipart/mixed; boundary="kGSL22qBXdph9VBTHEPBJp1yL5qfMENtT";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Message-ID: <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
In-Reply-To: <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>

--kGSL22qBXdph9VBTHEPBJp1yL5qfMENtT
Content-Type: multipart/mixed;
 boundary="------------584CD6C833828720D14F2CFC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------584CD6C833828720D14F2CFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Le 10/27/20 =C3=A0 10:22 AM, Dario Faggioli a =C3=A9crit=C2=A0:
> On Tue, 2020-10-27 at 06:58 +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 26.10.20 17:31, Dario Faggioli wrote:
>>>
>>> Or did you have something completely different in mind, and I'm
>>> missing
>>> it?
>>
>> No, I think you are right. I mixed that up with __context_switch()
>> not
>> being called.
>>
> Right.
>=20
>> Sorry for the noise,
>>
> Sure, no problem.
>=20
> In fact, this issue is apparently scheduler independent. It indeed
> seemd to be related to the other report we have "BUG: credit=3Dsched2
> machine hang when using DRAKVUF", but there it looks like it is
> scheduler-dependant.
>=20
> Might it be something that lies somewhere else, but Credit2 is
> triggering it faster/easier? (Just thinking out loud...)
>=20
> For Frederic, what happens is that dom0 hangs, right? So you're able to=

> poke at Xen with some debugkeys (like 'r' for the scheduler's status,
> and the ones for the domain's vCPUs)?
>=20
> If yes, it may be useful to see the output.
>=20
> Regards
>=20

I'm having some new info with respect to your request. Yes dom0 hangs and=
 I can interact with serial console. I've succeeded to obtain the output =
of 'r' debug-keys:

```
(XEN) sched_smt_power_savings: disabled
(XEN) NOW=3D72810702614697
(XEN) Online Cpus: 0-15
(XEN) Cpupool 0:
(XEN) Cpus: 0-15
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: SMP Credit Scheduler (credit)
(XEN) info:
(XEN) 	ncpus              =3D 16
(XEN) 	master             =3D 0
(XEN) 	credit             =3D 4800
(XEN) 	credit balance     =3D 608
(XEN) 	weight             =3D 12256
(XEN) 	runq_sort          =3D 996335
(XEN) 	default-weight     =3D 256
(XEN) 	tslice             =3D 30ms
(XEN) 	ratelimit          =3D 1000us
(XEN) 	credits per msec   =3D 10
(XEN) 	ticks per tslice   =3D 3
(XEN) 	migration delay    =3D 0us
(XEN) idlers: 00000000,00003c99
(XEN) active units:
(XEN) 	  1: [0.1] pri=3D-1 flags=3D0 cpu=3D6 credit=3D214 [w=3D2000,cap=3D=
0]
(XEN) 	  2: [0.4] pri=3D-1 flags=3D0 cpu=3D8 credit=3D115 [w=3D2000,cap=3D=
0]
(XEN) 	  3: [0.5] pri=3D-1 flags=3D0 cpu=3D5 credit=3D239 [w=3D2000,cap=3D=
0]
(XEN) 	  4: [0.11] pri=3D-1 flags=3D0 cpu=3D1 credit=3D-55 [w=3D2000,cap=3D=
0]
(XEN) 	  5: [0.6] pri=3D-2 flags=3D0 cpu=3D15 credit=3D-177 [w=3D2000,cap=
=3D0]
(XEN) 	  6: [0.7] pri=3D-1 flags=3D0 cpu=3D2 credit=3D50 [w=3D2000,cap=3D=
0]
(XEN) 	  7: [19.1] pri=3D-2 flags=3D0 cpu=3D9 credit=3D-241 [w=3D256,cap=3D=
0]
(XEN) CPUs info:
(XEN) CPU[00] current=3Dd[IDLE]v0, curr=3Dd[IDLE]v0, prev=3DNULL
(XEN) CPU[00] nr_run=3D0, sort=3D996334, sibling=3D{0}, core=3D{0-7}
(XEN) CPU[01] current=3Dd0v11, curr=3Dd0v11, prev=3DNULL
(XEN) CPU[01] nr_run=3D1, sort=3D996335, sibling=3D{1}, core=3D{0-7}
(XEN) 	run: [0.11] pri=3D-1 flags=3D0 cpu=3D1 credit=3D-55 [w=3D2000,cap=3D=
0]
(XEN) 	  1: [32767.1] pri=3D-64 flags=3D0 cpu=3D1
(XEN) CPU[02] current=3Dd0v7, curr=3Dd0v7, prev=3DNULL
(XEN) CPU[02] nr_run=3D1, sort=3D996335, sibling=3D{2}, core=3D{0-7}
(XEN) 	run: [0.7] pri=3D-1 flags=3D0 cpu=3D2 credit=3D50 [w=3D2000,cap=3D=
0]
(XEN) 	  1: [32767.2] pri=3D-64 flags=3D0 cpu=3D2
(XEN) CPU[03] current=3Dd[IDLE]v3, curr=3Dd[IDLE]v3, prev=3DNULL
(XEN) CPU[03] nr_run=3D0, sort=3D996329, sibling=3D{3}, core=3D{0-7}
(XEN) CPU[04] current=3Dd[IDLE]v4, curr=3Dd[IDLE]v4, prev=3DNULL
(XEN) CPU[04] nr_run=3D0, sort=3D996325, sibling=3D{4}, core=3D{0-7}
(XEN) CPU[05] current=3Dd0v5, curr=3Dd0v5, prev=3DNULL
(XEN) CPU[05] nr_run=3D1, sort=3D996334, sibling=3D{5}, core=3D{0-7}
(XEN) 	run: [0.5] pri=3D-1 flags=3D0 cpu=3D5 credit=3D239 [w=3D2000,cap=3D=
0]
(XEN) 	  1: [32767.5] pri=3D-64 flags=3D0 cpu=3D5
(XEN) CPU[06] current=3Dd0v1, curr=3Dd0v1, prev=3DNULL
(XEN) CPU[06] nr_run=3D1, sort=3D996334, sibling=3D{6}, core=3D{0-7}
(XEN) 	run: [0.1] pri=3D-1 flags=3D0 cpu=3D6 credit=3D214 [w=3D2000,cap=3D=
0]
(XEN) 	  1: [32767.6] pri=3D-64 flags=3D0 cpu=3D6
(XEN) CPU[07] current=3Dd[IDLE]v7, curr=3Dd[IDLE]v7, prev=3DNULL
(XEN) CPU[07] nr_run=3D0, sort=3D996303, sibling=3D{7}, core=3D{0-7}
(XEN) CPU[08] current=3Dd[IDLE]v8, curr=3Dd[IDLE]v8, prev=3DNULL
(XEN) CPU[08] nr_run=3D2, sort=3D996335, sibling=3D{8}, core=3D{8-15}
(XEN) 	  1: [0.4] pri=3D-1 flags=3D0 cpu=3D8 credit=3D115 [w=3D2000,cap=3D=
0]
(XEN) CPU[09] current=3Dd19v1, curr=3Dd19v1, prev=3DNULL
(XEN) CPU[09] nr_run=3D1, sort=3D996335, sibling=3D{9}, core=3D{8-15}
(XEN) 	run: [19.1] pri=3D-2 flags=3D0 cpu=3D9 credit=3D-241 [w=3D256,cap=3D=
0]
(XEN) 	  1: [32767.9] pri=3D-64 flags=3D0 cpu=3D9
(XEN) CPU[10] current=3Dd[IDLE]v10, curr=3Dd[IDLE]v10, prev=3DNULL
(XEN) CPU[10] nr_run=3D0, sort=3D996334, sibling=3D{10}, core=3D{8-15}
(XEN) CPU[11] current=3Dd[IDLE]v11, curr=3Dd[IDLE]v11, prev=3DNULL
(XEN) CPU[11] nr_run=3D0, sort=3D996331, sibling=3D{11}, core=3D{8-15}
(XEN) CPU[12] current=3Dd[IDLE]v12, curr=3Dd[IDLE]v12, prev=3DNULL
(XEN) CPU[12] nr_run=3D0, sort=3D996333, sibling=3D{12}, core=3D{8-15}
(XEN) CPU[13] current=3Dd[IDLE]v13, curr=3Dd[IDLE]v13, prev=3DNULL
(XEN) CPU[13] nr_run=3D0, sort=3D996334, sibling=3D{13}, core=3D{8-15}
(XEN) CPU[14] current=3Dd0v14, curr=3Dd0v14, prev=3DNULL
(XEN) CPU[14] nr_run=3D1, sort=3D990383, sibling=3D{14}, core=3D{8-15}
(XEN) 	run: [0.14] pri=3D0 flags=3D0 cpu=3D14 credit=3D-514 [w=3D2000,cap=
=3D0]
(XEN) 	  1: [32767.14] pri=3D-64 flags=3D0 cpu=3D14
(XEN) CPU[15] current=3Dd0v6, curr=3Dd0v6, prev=3DNULL
(XEN) CPU[15] nr_run=3D1, sort=3D996335, sibling=3D{15}, core=3D{8-15}
(XEN) 	run: [0.6] pri=3D-2 flags=3D0 cpu=3D15 credit=3D-177 [w=3D2000,cap=
=3D0]
(XEN) 	  1: [32767.15] pri=3D-64 flags=3D0 cpu=3D15
```

I attempt to get '*' but that blocked my serial console, at least I was n=
ot able to interact with it few minutes later. I'll try to get other info=
 too. I've also uploaded the piece of this huge '*' dump here: https://gi=
st.github.com/fepitre/36923fbc08cc2fd8bdb59b81e73a6c2e

Regards

--------------584CD6C833828720D14F2CFC
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

--------------584CD6C833828720D14F2CFC--

--kGSL22qBXdph9VBTHEPBJp1yL5qfMENtT--

--xR62Yw6Zhwo7qE7jF8KUz2WRyV4MP303C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+YP/gACgkQSEAQtc3F
duJwPw/9FxuKJxbNwpEVFvohmgNbzOSSpVoF07l0nEblhoDY0+H8fX3nstTSWY16
asY1epUj2a6FCCjtiZrXdrCZ04Na0Hvfrt1EHxO6chaaTNvHWoPHACZY6gARfAut
/C7X8W+0FNAm46wVLKkHElp6qmegAejMUxBWmI2G7sqI+7T6tFWXms81K+kgr6Bz
QL5jWO2l6hfTyBYLDfvvncjOK7WDBu1NE2hF08YbSe9V47sTh3rx7D81ePcDtE5s
3rOgmQZ8SMMOvZX3+dNgWD8MyY+Cqvlr8ILatVq6afH9LisDze4l6KeM3fmCxkR+
zhWNS5cP0yVlUsNozm4dEOAJxgHIz6goJXawF9pksvkfkezHY4t7n5vDn8+Qs1c7
TK5uAzEnKHBCBdaEXRkI5EOafFpcDFo6P3iGxdM19glDJ9Q9U/GD/rsnTlG8QVpc
NH2QOC4ED839wL/pggESADqL5KToChsz1s610fNmkCO/Aug/mmJLK/fIeDwFBb+W
mif9OMnjfu5gitcwEKwjI5fPS4kvy/PxrGFwDTBlbGOOMXx9rFXZLrmZn3UA7D50
J36P04RcWOOJFYGZdwQvHTBhd6B0YfboMaXatsQueP1ovY/pHl9Xx7Mrc3/2bZ/i
LPB2+R8aBZMrETamFDXjO0023J2/FBmDjxbV3VM0ZC+XW4Q9zZ0=
=CPDe
-----END PGP SIGNATURE-----

--xR62Yw6Zhwo7qE7jF8KUz2WRyV4MP303C--


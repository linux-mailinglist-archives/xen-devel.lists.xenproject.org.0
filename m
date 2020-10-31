Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F542A1865
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 16:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16946.41718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYsQn-0005pz-4n; Sat, 31 Oct 2020 15:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16946.41718; Sat, 31 Oct 2020 15:04:37 +0000
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
	id 1kYsQn-0005pa-1B; Sat, 31 Oct 2020 15:04:37 +0000
Received: by outflank-mailman (input) for mailman id 16946;
 Sat, 31 Oct 2020 15:04:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kYsQl-0005pV-EW
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:04:35 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e717d84-40a9-4d59-8935-183297b075d8;
 Sat, 31 Oct 2020 15:04:33 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1604156668136651.8131786794564;
 Sat, 31 Oct 2020 08:04:28 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=b0cl=EG=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kYsQl-0005pV-EW
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 15:04:35 +0000
X-Inumbo-ID: 3e717d84-40a9-4d59-8935-183297b075d8
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3e717d84-40a9-4d59-8935-183297b075d8;
	Sat, 31 Oct 2020 15:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604156670; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NFmbnOn4JSsroaFmRJK/IBLc8Ld9BFp8hXrV/VDt9PtL2hW67JglJHO7F3B7BAEc75StDag0fn48RIGAvyQxDHTJeRUsvoMJnEueGIiUjQR1m4Ec0xx42xG6hgo10S8XUtjzo4sUso7PpjW/E0igXaicmJPM7L+DUaV/jtDwsTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604156670; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5wJvmAsxNGDcaCrKZlXgv9HhD/4l9KxmPQt9VibSOXs=; 
	b=aP1ZexqbGmpAi1SKktkBKJm80oFyMYFPfXf8d6VNCDIHLTPQwJtt9k4XO0e9/2W8pCZAHF6Kfpzpajbrz7oqDnAyIZdniBq4/H9xQcblxpbPM9QkrMSy0Mzb1R+MoziGmBfr0i5O5SrklvOY0WswngC8NGG9dfKHBpIOOar9/EQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604156670;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=5wJvmAsxNGDcaCrKZlXgv9HhD/4l9KxmPQt9VibSOXs=;
	b=bFVAVD/xXNuqPl1nSix4VObxCKGIK5W9Fehi+HxKQJIgtqe1OZdjsFfv493Jvm0k
	ho2sKh2scfJMNBzq9Ll7uWwGy2TWbr5kKWi/5zhA+IGY4GhUOF5Vo8MuSyzDFapExtp
	+W/sR6TB2n7eG9HBEuFgod1YhAxylQn/bru42tJk=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1604156668136651.8131786794564; Sat, 31 Oct 2020 08:04:28 -0700 (PDT)
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
To: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>
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
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Message-ID: <e2b9272b-7a81-b3d7-8eb2-0b82dc9f5465@qubes-os.org>
Date: Sat, 31 Oct 2020 16:04:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201031040817.GG1447@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cUtv7XcLI85My2kkWAsEIoc1OqDLXcHiW"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cUtv7XcLI85My2kkWAsEIoc1OqDLXcHiW
Content-Type: multipart/mixed; boundary="4Sly6D8Kbe7JBmhdlwnO6TS5iK4GpQ4YL";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <JGross@suse.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Message-ID: <e2b9272b-7a81-b3d7-8eb2-0b82dc9f5465@qubes-os.org>
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
In-Reply-To: <20201031040817.GG1447@mail-itl>

--4Sly6D8Kbe7JBmhdlwnO6TS5iK4GpQ4YL
Content-Type: multipart/mixed;
 boundary="------------07EB2AEF7489AC301F4F05AF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------07EB2AEF7489AC301F4F05AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Le 10/31/20 =C3=A0 5:08 AM, marmarek@invisiblethingslab.com a =C3=A9crit=C2=
=A0:
> On Sat, Oct 31, 2020 at 04:27:58AM +0100, Dario Faggioli wrote:
>> On Sat, 2020-10-31 at 03:54 +0100, marmarek@invisiblethingslab.com
>> wrote:
>>> On Sat, Oct 31, 2020 at 02:34:32AM +0000, Dario Faggioli wrote:
>>> (XEN) *** Dumping CPU7 host state: ***
>>> (XEN) Xen call trace:
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040223625>] R _spin_lock+0x35/0x40
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402233cd>] S on_selected_cpus+0x1d/=
0xc0
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1=
b0
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402df160>] S context_switch+0x110/0=
xa60
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04024310a>] S core.c#schedule+0x1aa/=
0x250
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040222d4a>] S softirq.c#__do_softirq=
+0x5a/0xa0
>>> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2=
b/0x30
>>>
>>> And so on, for (almost?) all CPUs.
>>
>> Right. So, it seems like a live (I would say) lock. It might happen on=

>> some resource which his shared among domains. And introduced (the
>> livelock, not the resource or the sharing) in 4.14.
>>
>> Just giving a quick look, I see that vmx_do_resume() calls
>> vmx_clear_vmcs() which calls on_selected_cpus() which takes the
>> call_lock spinlock.
>>
>> And none of these seems to have received much attention recently.
>>
>> But this is just a really basic analysis!
>=20
> I've looked at on_selected_cpus() and my understanding is this:
> 1. take call_lock spinlock
> 2. set function+args+what cpus to be called in a global "call_data" var=
iable
> 3. ask CPUs to execute that function (smp_send_call_function_mask() cal=
l)
> 4. wait for all requested CPUs to execute the function, still holding
> the spinlock
> 5. only then - release the spinlock
>=20
> So, if any CPU does not execute requested function for any reason, it
> will keep the call_lock locked forever.
>=20
> I don't see any CPU waiting on step 4, but also I don't see call traces=

> from CPU3 and CPU8 in the log - that's because they are in guest (dom0
> here) context, right? I do see "guest state" dumps from them.
> The only three CPUs that do logged xen call traces and are not waiting =
on that
> spin lock are:
>=20
> CPU0:
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040240f89>] R vcpu_unblock+0x9/0x50
> (XEN)    [<ffff82d0402e0171>] S vcpu_kick+0x11/0x60
> (XEN)    [<ffff82d0402259c8>] S tasklet.c#do_tasklet_work+0x68/0xc0
> (XEN)    [<ffff82d040225a59>] S tasklet.c#tasklet_softirq_action+0x39/0=
x60
> (XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
> (XEN)    [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/0x30
>=20
> CPU4:
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040227043>] R set_timer+0x133/0x220
> (XEN)    [<ffff82d040234e90>] S credit.c#csched_tick+0/0x3a0
> (XEN)    [<ffff82d04022660f>] S timer.c#timer_softirq_action+0x9f/0x300=

> (XEN)    [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5a/0xa0
> (XEN)    [<ffff82d0402d64e6>] S x86_64/entry.S#process_softirqs+0x6/0x2=
0
>=20
> CPU14:
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040222dc0>] R do_softirq+0/0x10
> (XEN)    [<ffff82d0402d64e6>] S x86_64/entry.S#process_softirqs+0x6/0x2=
0
>=20
> I'm not sure if any of those is related to that spin lock,
> on_selected_cpus() call, or anything like that...
>=20

Hi,
Some newer logs here: https://gist.github.com/fepitre/5b2da8cf2ef976c0b88=
5ce7bcfbf7313

You can have piece of serial console at hang freeze then debug keys 'd' a=
nd '0' blocked at one VCPU.

I hope that will help.

Regards,
Fr=C3=A9d=C3=A9ric

--------------07EB2AEF7489AC301F4F05AF
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

--------------07EB2AEF7489AC301F4F05AF--

--4Sly6D8Kbe7JBmhdlwnO6TS5iK4GpQ4YL--

--cUtv7XcLI85My2kkWAsEIoc1OqDLXcHiW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+dfPgACgkQSEAQtc3F
duJThRAAo2ge5pRdTFAYynlM+2ewDLi9/RDpAj+nkzzXEuiBIr7BbBVuE2w+Q1H+
nxPNZtQhXYN3rdpj9CAUUEY+m6OF0lI3+e10wPln29sPgF5lTE2aCfYkZ3t4vuCF
O9lLSBR2ErN4nkxiR3RSzpRpssJTqnDt8qp0jx0sRJwsvRuRxhufobY6pW3Zk3xK
Pn1PGiGlUElCqCh1ySDNyCplGSWfz/0C1vwx7IMQTjWNkfgDRnGCUl1hnTgkmLAn
I3V45sok3aGRMD75ontTY5YBi7WaE6zKH1SBWnXx8+ZyedeAIF9+6n1MDWhRUYxB
0qztDQRorcnPCqNDUvIQBjLUaMb/RiNqaVksCaNfoXfiFZDh8c1rKyd77wfcid+k
7pQ+y2n8KguDbdHx2II5Mqbi1K2V4CtKB/0Af+wOR2KGhlC8n7xMYWOZS2T5SpZr
ppTM40k2IpsnJ0Q9CDo49kMczqC/67o8IUXMTmkvYXjiRcFOkUnnjI3C26tIR4bh
SUaKby7cuVjJH8dGk076c9Ja1KSUyZ7bli/+nZqSd7LRCw6PgFFiTvPvru27aezQ
sgIVHEPj14XC3gP1WSyqO829/WRRLyVkgf562dTij61AK5LS3UkGaqchb4USh4Uo
8UbeSD4FZiT71tloXxFnCn9azhRQjhxh9Ctsae4JyoPNuX6FUWs=
=m26Y
-----END PGP SIGNATURE-----

--cUtv7XcLI85My2kkWAsEIoc1OqDLXcHiW--


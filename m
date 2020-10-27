Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971229C879
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 20:14:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13068.33619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXUQ3-0007yM-6m; Tue, 27 Oct 2020 19:14:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13068.33619; Tue, 27 Oct 2020 19:14:07 +0000
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
	id 1kXUQ3-0007xx-3v; Tue, 27 Oct 2020 19:14:07 +0000
Received: by outflank-mailman (input) for mailman id 13068;
 Tue, 27 Oct 2020 19:14:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zOid=EC=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
 id 1kXUQ1-0007xs-Cq
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:14:05 +0000
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f21a453-f0fd-4f45-80af-802c07f4c499;
 Tue, 27 Oct 2020 19:14:02 +0000 (UTC)
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by
 mx.zohomail.com with SMTPS id 1603814822714428.9691482866506;
 Tue, 27 Oct 2020 09:07:02 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zOid=EC=qubes-os.org=frederic.pierret@srs-us1.protection.inumbo.net>)
	id 1kXUQ1-0007xs-Cq
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 19:14:05 +0000
X-Inumbo-ID: 6f21a453-f0fd-4f45-80af-802c07f4c499
Received: from sender4-of-o57.zoho.com (unknown [136.143.188.57])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6f21a453-f0fd-4f45-80af-802c07f4c499;
	Tue, 27 Oct 2020 19:14:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603825463; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CWgnlwuf+vl/YIgwTr3I/a9bfD6ff5T7Wv8MysM/tdKJD8dgEIaZ1zVpNMtPwajd+nfoZST8CGyWFI17YA2xar4eIQnjEGWJJX8n+lSdGFxXcamUea6ngREYoLRTyQE20Lls7lDz6MMFSaa+ALrsieIUcZfjy6fzlCTlEPseekg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603825463; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=zwZzKeIMfs869uqUN+jylJxJAsXo+50eS/lmT0P948M=; 
	b=dEu99EK5apmmc0gVSHlEToj3XOqjcpg3BE+MuMrhRY7SfY+1bLhqSN02DsyZ2V0LujaV1RXj/c/DPkwKSKpTaOJSP8HULeuuAq2KFXiC/IWGJNJuEzOWdYUlQNh7TxienDnjcp1y5gAy9+z2loWvi0IUz9vkAaIkPhxgZmvM0XA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=qubes-os.org;
	spf=pass  smtp.mailfrom=frederic.pierret@qubes-os.org;
	dmarc=pass header.from=<frederic.pierret@qubes-os.org> header.from=<frederic.pierret@qubes-os.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603825463;
	s=s; d=qubes-os.org; i=frederic.pierret@qubes-os.org;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type;
	bh=zwZzKeIMfs869uqUN+jylJxJAsXo+50eS/lmT0P948M=;
	b=VH+OSWDgycMyqvWhuuydM5x3aqaFIvu3F4MGQoT1I/z7vxjvHFm7uclLe6WzgMi9
	rUCY7WCE2I6nHg7+ETcTZL0GAuzBljO2fZwKJhgTikZSiYmJVBMvBUWUYhZaJTeFBIM
	xO9Q/3RL6f/g4gNsVV3WqYjAInSB7GsfF5IHaiy4=
Received: from [10.137.0.19] (92.188.110.153 [92.188.110.153]) by mx.zohomail.com
	with SMTPS id 1603814822714428.9691482866506; Tue, 27 Oct 2020 09:07:02 -0700 (PDT)
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
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
 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
Autocrypt: addr=frederic.pierret@qubes-os.org; keydata=
 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
 QMhGv8DnbAdOOOnumAXWq0+wl5uP
Message-ID: <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
Date: Tue, 27 Oct 2020 17:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gHMmyumlKrc840OvDE8uPUjYA3CmVstiz"
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gHMmyumlKrc840OvDE8uPUjYA3CmVstiz
Content-Type: multipart/mixed; boundary="nIf3NTCDIQsAFxOtuut7a4P0zWhs0peKu";
 protected-headers="v1"
From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>
To: Dario Faggioli <dfaggioli@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Message-ID: <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
In-Reply-To: <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>

--nIf3NTCDIQsAFxOtuut7a4P0zWhs0peKu
Content-Type: multipart/mixed;
 boundary="------------2CB8B852480B5EB37E6F9DE5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2CB8B852480B5EB37E6F9DE5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



Le 10/27/20 =C3=A0 4:42 PM, Fr=C3=A9d=C3=A9ric Pierret a =C3=A9crit=C2=A0=
:
>=20
>=20
> Le 10/27/20 =C3=A0 10:22 AM, Dario Faggioli a =C3=A9crit=C2=A0:
>> On Tue, 2020-10-27 at 06:58 +0100, J=C3=BCrgen Gro=C3=9F wrote:
>>> On 26.10.20 17:31, Dario Faggioli wrote:
>>>>
>>>> Or did you have something completely different in mind, and I'm
>>>> missing
>>>> it?
>>>
>>> No, I think you are right. I mixed that up with __context_switch()
>>> not
>>> being called.
>>>
>> Right.
>>
>>> Sorry for the noise,
>>>
>> Sure, no problem.
>>
>> In fact, this issue is apparently scheduler independent. It indeed
>> seemd to be related to the other report we have "BUG: credit=3Dsched2
>> machine hang when using DRAKVUF", but there it looks like it is
>> scheduler-dependant.
>>
>> Might it be something that lies somewhere else, but Credit2 is
>> triggering it faster/easier? (Just thinking out loud...)
>>
>> For Frederic, what happens is that dom0 hangs, right? So you're able t=
o
>> poke at Xen with some debugkeys (like 'r' for the scheduler's status,
>> and the ones for the domain's vCPUs)?
>>
>> If yes, it may be useful to see the output.
>>
>> Regards
>>
>=20
> I'm having some new info with respect to your request. Yes dom0 hangs a=
nd I can interact with serial console. I've succeeded to obtain the outpu=
t of 'r' debug-keys:
>=20
> ```
> (XEN) sched_smt_power_savings: disabled
> (XEN) NOW=3D72810702614697
> (XEN) Online Cpus: 0-15
> (XEN) Cpupool 0:
> (XEN) Cpus: 0-15
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Scheduler: SMP Credit Scheduler (credit)
> (XEN) info:
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 ncpus=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 16
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 master=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 credit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 4800
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 credit balance=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 608
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 weight=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 12256
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 runq_sort=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D 996335
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 default-weight=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
 256
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 tslice=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 30ms
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 ratelimit=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D 1000us
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 credits per msec=C2=A0=C2=A0 =3D 10
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 ticks per tslice=C2=A0=C2=A0 =3D 3
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 migration delay=C2=A0=C2=A0=C2=A0 =3D 0us=

> (XEN) idlers: 00000000,00003c99
> (XEN) active units:
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [0.1] pri=3D-1 flags=3D0 c=
pu=3D6 credit=3D214 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2: [0.4] pri=3D-1 flags=3D0 c=
pu=3D8 credit=3D115 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3: [0.5] pri=3D-1 flags=3D0 c=
pu=3D5 credit=3D239 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4: [0.11] pri=3D-1 flags=3D0 =
cpu=3D1 credit=3D-55 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5: [0.6] pri=3D-2 flags=3D0 c=
pu=3D15 credit=3D-177 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6: [0.7] pri=3D-1 flags=3D0 c=
pu=3D2 credit=3D50 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7: [19.1] pri=3D-2 flags=3D0 =
cpu=3D9 credit=3D-241 [w=3D256,cap=3D0]
> (XEN) CPUs info:
> (XEN) CPU[00] current=3Dd[IDLE]v0, curr=3Dd[IDLE]v0, prev=3DNULL
> (XEN) CPU[00] nr_run=3D0, sort=3D996334, sibling=3D{0}, core=3D{0-7}
> (XEN) CPU[01] current=3Dd0v11, curr=3Dd0v11, prev=3DNULL
> (XEN) CPU[01] nr_run=3D1, sort=3D996335, sibling=3D{1}, core=3D{0-7}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [0.11] pri=3D-1 flags=3D0 cpu=3D1 cr=
edit=3D-55 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.1] pri=3D-64 flags=3D=
0 cpu=3D1
> (XEN) CPU[02] current=3Dd0v7, curr=3Dd0v7, prev=3DNULL
> (XEN) CPU[02] nr_run=3D1, sort=3D996335, sibling=3D{2}, core=3D{0-7}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [0.7] pri=3D-1 flags=3D0 cpu=3D2 cre=
dit=3D50 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.2] pri=3D-64 flags=3D=
0 cpu=3D2
> (XEN) CPU[03] current=3Dd[IDLE]v3, curr=3Dd[IDLE]v3, prev=3DNULL
> (XEN) CPU[03] nr_run=3D0, sort=3D996329, sibling=3D{3}, core=3D{0-7}
> (XEN) CPU[04] current=3Dd[IDLE]v4, curr=3Dd[IDLE]v4, prev=3DNULL
> (XEN) CPU[04] nr_run=3D0, sort=3D996325, sibling=3D{4}, core=3D{0-7}
> (XEN) CPU[05] current=3Dd0v5, curr=3Dd0v5, prev=3DNULL
> (XEN) CPU[05] nr_run=3D1, sort=3D996334, sibling=3D{5}, core=3D{0-7}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [0.5] pri=3D-1 flags=3D0 cpu=3D5 cre=
dit=3D239 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.5] pri=3D-64 flags=3D=
0 cpu=3D5
> (XEN) CPU[06] current=3Dd0v1, curr=3Dd0v1, prev=3DNULL
> (XEN) CPU[06] nr_run=3D1, sort=3D996334, sibling=3D{6}, core=3D{0-7}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [0.1] pri=3D-1 flags=3D0 cpu=3D6 cre=
dit=3D214 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.6] pri=3D-64 flags=3D=
0 cpu=3D6
> (XEN) CPU[07] current=3Dd[IDLE]v7, curr=3Dd[IDLE]v7, prev=3DNULL
> (XEN) CPU[07] nr_run=3D0, sort=3D996303, sibling=3D{7}, core=3D{0-7}
> (XEN) CPU[08] current=3Dd[IDLE]v8, curr=3Dd[IDLE]v8, prev=3DNULL
> (XEN) CPU[08] nr_run=3D2, sort=3D996335, sibling=3D{8}, core=3D{8-15}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [0.4] pri=3D-1 flags=3D0 c=
pu=3D8 credit=3D115 [w=3D2000,cap=3D0]
> (XEN) CPU[09] current=3Dd19v1, curr=3Dd19v1, prev=3DNULL
> (XEN) CPU[09] nr_run=3D1, sort=3D996335, sibling=3D{9}, core=3D{8-15}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [19.1] pri=3D-2 flags=3D0 cpu=3D9 cr=
edit=3D-241 [w=3D256,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.9] pri=3D-64 flags=3D=
0 cpu=3D9
> (XEN) CPU[10] current=3Dd[IDLE]v10, curr=3Dd[IDLE]v10, prev=3DNULL
> (XEN) CPU[10] nr_run=3D0, sort=3D996334, sibling=3D{10}, core=3D{8-15}
> (XEN) CPU[11] current=3Dd[IDLE]v11, curr=3Dd[IDLE]v11, prev=3DNULL
> (XEN) CPU[11] nr_run=3D0, sort=3D996331, sibling=3D{11}, core=3D{8-15}
> (XEN) CPU[12] current=3Dd[IDLE]v12, curr=3Dd[IDLE]v12, prev=3DNULL
> (XEN) CPU[12] nr_run=3D0, sort=3D996333, sibling=3D{12}, core=3D{8-15}
> (XEN) CPU[13] current=3Dd[IDLE]v13, curr=3Dd[IDLE]v13, prev=3DNULL
> (XEN) CPU[13] nr_run=3D0, sort=3D996334, sibling=3D{13}, core=3D{8-15}
> (XEN) CPU[14] current=3Dd0v14, curr=3Dd0v14, prev=3DNULL
> (XEN) CPU[14] nr_run=3D1, sort=3D990383, sibling=3D{14}, core=3D{8-15}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [0.14] pri=3D0 flags=3D0 cpu=3D14 cr=
edit=3D-514 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.14] pri=3D-64 flags=
=3D0 cpu=3D14
> (XEN) CPU[15] current=3Dd0v6, curr=3Dd0v6, prev=3DNULL
> (XEN) CPU[15] nr_run=3D1, sort=3D996335, sibling=3D{15}, core=3D{8-15}
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0 run: [0.6] pri=3D-2 flags=3D0 cpu=3D15 cr=
edit=3D-177 [w=3D2000,cap=3D0]
> (XEN)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1: [32767.15] pri=3D-64 flags=
=3D0 cpu=3D15
> ```
>=20
> I attempt to get '*' but that blocked my serial console, at least I was=
 not able to interact with it few minutes later. I'll try to get other in=
fo too. I've also uploaded the piece of this huge '*' dump here: https://=
gist.github.com/fepitre/36923fbc08cc2fd8bdb59b81e73a6c2e
>=20
> Regards

Ok the server got frozen just few minutes after my mail and I got now:
'r': https://gist.github.com/fepitre/78541f555902275d906d627de2420571
'q': https://gist.github.com/fepitre/0ddf6b5e8fdb3152d24337d83fdc345e
'I': https://gist.github.com/fepitre/50c68233d08ad1e495edf7e0e146838b

Tell me if I can provide any other info from serial console.

Regards,
Fr=C3=A9d=C3=A9ric

--------------2CB8B852480B5EB37E6F9DE5
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

--------------2CB8B852480B5EB37E6F9DE5--

--nIf3NTCDIQsAFxOtuut7a4P0zWhs0peKu--

--gHMmyumlKrc840OvDE8uPUjYA3CmVstiz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl+YRaMACgkQSEAQtc3F
duL1URAAv11YdOo/5ETgQI7ffBLS+VKyiFkefvWux4lzJoD4xL1UDA2RLgTUjG7E
Heh3T0BAmAXw2cn0qbcZ3fr5EaDVExQS/EJaV6AEFubH1gldsmqwDS3uOXIEa+AA
9m8r6W6TRPbzGOdAdnRw1B+p9cWljyKIrIUXcRXMTJ4RzIZTCuvoe9kziGmPWqOR
6cIdtH4hPumY0hcVI7D2uaRSGivn/FR/8MZOBvSIrTEuix7B044ts6RtDq6068W5
HUjkXv4KCQCdEbYVnVjfwAD57Rlneo9aebidITJSHkh2GpZZVU8qx8ZFf4rL5bl9
wR0UdpoiFxiX9xI7qmeqcpaN7iD9EnUgNV4zEw0XLJRxVGj9vIEcgOdgYG9YLcpH
j1OMslZ8wTeCQm+NHMSzFQl3fxtOditnP51p0SEzCc4i95xtWMqBy6FWwFChm+Uc
1FU1Ur4o3/p9drLvnJx2CKHrO7r95ago3Iu364SWcucAYtHeX+2I0DZcCExcZMTQ
zpWvnfBTOJJu1nOSHzSThlEy8qkcK3D3Endjp5K+sx36IOaaLYegyzXCccD762h3
BqmNpDvNI/pzLBGwp9iOGKkLqiSF66jLa25cQAqRNnQsVdeXnr+9aNpFeYNRaAHD
15H82oN3Y6hanIwiBLZGxbWa0oQQmPVWmyQ9rX8YHDHOX2lyHdg=
=m2zU
-----END PGP SIGNATURE-----

--gHMmyumlKrc840OvDE8uPUjYA3CmVstiz--


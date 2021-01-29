Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5373086F2
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77776.141083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Oz8-0006O0-Kj; Fri, 29 Jan 2021 08:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77776.141083; Fri, 29 Jan 2021 08:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Oz8-0006NJ-HQ; Fri, 29 Jan 2021 08:18:30 +0000
Received: by outflank-mailman (input) for mailman id 77776;
 Fri, 29 Jan 2021 08:18:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j1X=HA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l5Oz7-0006Ku-5P
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:18:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6709fd95-58dd-4ba3-afbd-e9e64373abee;
 Fri, 29 Jan 2021 08:18:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 660E6AFEC;
 Fri, 29 Jan 2021 08:18:22 +0000 (UTC)
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
X-Inumbo-ID: 6709fd95-58dd-4ba3-afbd-e9e64373abee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611908302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Gxqwnhs0a2Kf5UOEuiOyfeJtY5bJRdNabRec2CIIDc=;
	b=hNUmJ0fzbM6+KmjDOJFZjZ/TwfPvwVFxR295YfQbzG6xeobPFiurhhNidhMuRYl4MZTQyk
	6AmXtqxhQJOSkCyUOo/K8YwWN++B9vZKMu+63OY9jRpFb/hHy8xhnQ/BqXoMEvfcMp1RbL
	ZMoe4uxitLJ1thyQKXhGV7GAIKg1viI=
Subject: Re: Null scheduler and vwfi native problem
To: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bfe8b2fe-57c4-79e2-f2e7-3e1cb9b7963b@suse.com>
Date: Fri, 29 Jan 2021 09:18:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hENy65tr6wUgmkxkrBXXzK4vEK6gaN82W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hENy65tr6wUgmkxkrBXXzK4vEK6gaN82W
Content-Type: multipart/mixed; boundary="Zci8PKvI1NuZSXVMbhOdUVK8zX8jlys3o";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <bfe8b2fe-57c4-79e2-f2e7-3e1cb9b7963b@suse.com>
Subject: Re: Null scheduler and vwfi native problem
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
In-Reply-To: <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>

--Zci8PKvI1NuZSXVMbhOdUVK8zX8jlys3o
Content-Type: multipart/mixed;
 boundary="------------4B77EFB22A4676840DE262B6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4B77EFB22A4676840DE262B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.01.21 09:08, Anders T=C3=B6rnqvist wrote:
> On 1/26/21 11:31 PM, Dario Faggioli wrote:
>> On Tue, 2021-01-26 at 18:03 +0100, Anders T=C3=B6rnqvist wrote:
>>> On 1/25/21 5:11 PM, Dario Faggioli wrote:
>>>> On Fri, 2021-01-22 at 14:26 +0000, Julien Grall wrote:
>>>>> Hi Anders,
>>>>>
>>>>> On 22/01/2021 08:06, Anders T=C3=B6rnqvist wrote:
>>>>>> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>>>>>>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>>>>>> - booting with "sched=3Dnull vwfi=3Dnative" but not doing the IRQ
>>>>>> passthrough that you mentioned above
>>>>>> "xl destroy" gives
>>>>>> (XEN) End of domain_destroy function
>>>>>>
>>>>>> Then a "xl create" says nothing but the domain has not started
>>>>>> correct.
>>>>>> "xl list" look like this for the domain:
>>>>>> mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=
=A0=C2=A0 512=C2=A0=C2=A0=C2=A0=C2=A0 1 ------
>>>>>> 0.0
>>>>> This is odd. I would have expected ``xl create`` to fail if
>>>>> something
>>>>> went wrong with the domain creation.
>>>>>
>>>> So, Anders, would it be possible to issue a:
>>>>
>>>> # xl debug-keys r
>>>> # xl dmesg
>>>>
>>>> And send it to us ?
>>>>
>>>> Ideally, you'd do it:
>>>> =C2=A0=C2=A0 - with Julien's patch (the one he sent the other day, a=
nd that
>>>> you
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 have already given a try to) applied
>>>> =C2=A0=C2=A0 - while you are in the state above, i.e., after having =
tried to
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 destroy a domain and failing
>>>> =C2=A0=C2=A0 - and maybe again after having tried to start a new dom=
ain
>>> Here are some logs.
>>>
>> Great, thanks a lot!
>>
>>> The system is booted as before with the patch and the domu config
>>> does
>>> not have the IRQs.
>>>
>> Ok.
>>
>>> # xl list
>>> Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ID=C2=A0=C2=A0 Mem VCPUs State
>>> Time(s)
>>> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0=C2=A0 3000=C2=A0=C2=A0=C2=A0=C2=A0 5 r-----
>>> 820.1
>>> mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 1=C2=A0=C2=A0 511=C2=A0=C2=A0=C2=A0=C2=A0 1 r-----
>>> 157.0
>>>
>>> # xl debug-keys r
>>> (XEN) sched_smt_power_savings: disabled
>>> (XEN) NOW=3D191793008000
>>> (XEN) Online Cpus: 0-5
>>> (XEN) Cpupool 0:
>>> (XEN) Cpus: 0-5
>>> (XEN) Scheduler: null Scheduler (null)
>>> (XEN) =C2=A0=C2=A0=C2=A0 cpus_free =3D
>>> (XEN) Domain info:
>>> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 0
>>> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 1: [0.0] pcpu=3D0
>>> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 2: [0.1] pcpu=3D1
>>> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 3: [0.2] pcpu=3D2
>>> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 4: [0.3] pcpu=3D3
>>> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 5: [0.4] pcpu=3D4
>>> (XEN) =C2=A0=C2=A0=C2=A0 Domain: 1
>>> (XEN) =C2=A0=C2=A0=C2=A0 =C2=A0 6: [1.0] pcpu=3D5
>>> (XEN) Waitqueue:
>>>
>> So far, so good. All vCPUs are running on their assigned pCPU, and
>> there is no vCPU wanting to run but not having a vCPU where to do so.
>>
>>> (XEN) Command line: console=3Ddtuart dtuart=3D/serial@5a060000
>>> dom0_mem=3D3000M dom0_max_vcpus=3D5 hmp-unsafe=3Dtrue dom0_vcpus_pin
>>> sched=3Dnull vwfi=3Dnative
>>>
>> Oh, just as a side note (and most likely unrelated to the problem we'r=
e
>> discussing), you should be able to get rid of dom0_vcpus_pin.
>>
>> The NULL scheduler will do something similar to what that option itsel=
f
>> does anyway. And with the benefit that, if you want, you can actually
>> change to what pCPUs the dom0's vCPU are pinned. While, if you use
>> dom0_vcpus_pin, you can't.
>>
>> So it using it has only downsides (and that's true in general, if you
>> ask me, but particularly so if using NULL).
> Thanks for the feedback.
> I removed dom0_vcpus_pin. And, as you said, it seems to be unrelated to=
=20
> the problem we're discussing. The system still behaves the same.
>=20
> When the dom0_vcpus_pin is removed. xl vcpu-list looks like this:
>=20
> Name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ID=C2=A0 VCPU=C2=A0=C2=A0 CPU =
State Time(s)=20
> Affinity (Hard / Soft)
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=
=A0 0=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 29.4 all / all
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=
=A0 1=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.7 all / all
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=
=A0 2=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.7 all / all
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 3=C2=A0=C2=A0=C2=
=A0 3=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.6 all / all
> Domain-0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0 4=C2=A0=C2=A0=C2=
=A0 4=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 28.6 all / all
> mydomu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=
 5=C2=A0=C2=A0 r--=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.6 5 / all
>=20
>  From this listing (with "all" as hard affinity for dom0) one might rea=
d=20
> it like dom0 is not pinned with hard affinity to any specific pCPUs at =

> all but mudomu is pinned to pCPU 5.
> Will the dom0_max_vcpus=3D5 in this case guarantee that dom0 only will =
run=20
> on pCPU 0-4 so that mydomu always will have pCPU 5 for itself only?

No.

>=20
> What if I would like mydomu to be th only domain that uses pCPU 2?

Setup a cpupool with that pcpu assigned to it and put your domain into
that cpupool.


Juergen

--------------4B77EFB22A4676840DE262B6
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4B77EFB22A4676840DE262B6--

--Zci8PKvI1NuZSXVMbhOdUVK8zX8jlys3o--

--hENy65tr6wUgmkxkrBXXzK4vEK6gaN82W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmATxM0FAwAAAAAACgkQsN6d1ii/Ey+C
iwf/Ye+7K22F0Cj/atj2wMdkhlqAiPacnhkyOMZxhMJDsNPEMhX0hXei0XJHCJ2GuNGdeiMVX4bd
mh3j/YyRJHhTqSlBW6FdyVmdoQmCruEgsrbnrsXDqnr9E2OZ+CyT1jjvE4o4u5T9lAI33Ck+Oaan
upd3AGvGTSnhSzS04sdl94RovOkCQ6nzAOZFpDmiMki6hX7EA5aVLaPBZUdj/xfyhuUgBhSHeQuY
ZsYfbHerz33OGW6ilUnhNgSJs74jiotZoLn4Phc7Sh2dXaKErwhRXWb9mAfM2yxZzRG0TqqRbeHC
Jv11U9Fg8a/SYBDAB+LJOw2de1tczXqkyaJTsEqn5Q==
=Qs9M
-----END PGP SIGNATURE-----

--hENy65tr6wUgmkxkrBXXzK4vEK6gaN82W--


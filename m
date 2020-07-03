Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D4213BEB
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 16:38:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrMov-00005r-IZ; Fri, 03 Jul 2020 14:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wATx=AO=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1jrMou-00005m-Ek
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 14:37:40 +0000
X-Inumbo-ID: be51d374-bd3a-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be51d374-bd3a-11ea-bb8b-bc764e2007e4;
 Fri, 03 Jul 2020 14:37:39 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 3B953A3A57;
 Fri,  3 Jul 2020 16:37:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 31076A36FD;
 Fri,  3 Jul 2020 16:37:37 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id TpPj6Tq88Wfj; Fri,  3 Jul 2020 16:37:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8D3A7A3A57;
 Fri,  3 Jul 2020 16:37:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id I_QcTcf2D3yr; Fri,  3 Jul 2020 16:37:36 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 68826A36FD;
 Fri,  3 Jul 2020 16:37:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 59215223D3;
 Fri,  3 Jul 2020 16:37:06 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id StbmaSZGds1P; Fri,  3 Jul 2020 16:37:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id BDACC22DE6;
 Fri,  3 Jul 2020 16:37:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id zvDmxyBjKjLy; Fri,  3 Jul 2020 16:37:00 +0200 (CEST)
Received: from [192.168.70.4] (unknown [195.187.238.48])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 2CCE022AC3;
 Fri,  3 Jul 2020 16:37:00 +0200 (CEST)
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Subject: Re: [PATCH] x86/cpuid: Expose number of vCPUs in CPUID.1.EBX
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <f9c2583332d83fe76c3d98e215c76b7b111650e3.1592496443.git.hubert.jasudowicz@cert.pl>
 <bc49dfbd-ffc0-3548-1e46-22b808442679@citrix.com>
 <8174d110-be3b-5735-9085-f35f7f0318ab@cert.pl>
 <03c4c8e1-5924-9b85-6e1b-023ae24745f3@citrix.com>
Message-ID: <eb4b392b-84c9-d98c-5fe6-423175cd8f18@cert.pl>
Date: Fri, 3 Jul 2020 16:36:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <03c4c8e1-5924-9b85-6e1b-023ae24745f3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/30/20 10:49 PM, Andrew Cooper wrote:
> On 19/06/2020 15:19, Hubert Jasudowicz wrote:
>> On 6/18/20 6:51 PM, Andrew Cooper wrote:
>>> On 18/06/2020 17:22, Hubert Jasudowicz wrote:
>>>> When running under KVM (or presumably other hypervisors) we enable
>>>> the CPUID.1.EDX.HTT flag, thus indicating validity of CPUID.1.EBX[23=
:16]
>>>> - maximum number of logical processors which the guest reads as 0.
>>>>
>>>> Although this method of topology detection is considered legacy,
>>>> Windows falls back to it when CPUID.0BH.EBX is 0.
>>>>
>>>> CPUID.1.EBX[23:16] being equal to 0, triggers memory corruption in
>>>> ntoskrnl.exe as Windows assumes that number of logical processors wo=
uld
>>>> be at least 1. Memory corruption manifests itself while mapping
>>>> framebuffer for early graphical subsystem, causing BSOD.
>>>>
>>>> This patch fixes running nested Windows (tested on 7 and 10) with KV=
M as
>>>> L0 hypervisor, by setting the value to maximum number of vCPUs in do=
main.
>>>>
>>>> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>>> I'm afraid fixing guest topology is more complicated than just this.=C2=
=A0 On
>>> its own, I'm not sure if this is safe for VMs migrating in.
>>>
>>> While I agree that Xen's logic is definitely broken, I suspect the
>>> conditions for the BSOD are more complicated than this, because Windo=
ws
>>> does work fine when there is no KVM in the setup described.
>>>
>>> ~Andrew
>>>
>> After some more testing, I've managed to boot Windows by explicitly co=
nfiguring the guest
>> with cpuid=3D"host,htt=3D0". If I understand correctly, the default be=
havior is to
>> enable HTT for the guest and basically pass through the value of CPUID=
.1.EBX[23:16]
>> without any sanity checks.
>>
>> The reason this works in other setups is that the non-zero value retur=
ned by real hardware
>> leaks into the guest. In my setup, what Xen sees is:
>> CPUID.1h =3D=3D EAX: 000806ea EBX: 00000800 ECX: fffab223 EDX: 0f8bfbf=
f
>>
>> In terms of VM migration, this seems already broken because guest migh=
t read different
>> values depending on what underlying hardware reports. The patch would =
at least provide
>> some consistency between hosts. Another solution would be not to enabl=
e HTT bit by default.
>=20
> Apologies for the delay replying.=C2=A0 (I've been attempting to finish=
 the
> reply for more than a week now, but am just far too busy).
>=20

No worries. I understand that it's always too much code to review and=20
too few maintainers. ;)

>=20
> Xen's behaviour is definitely buggy.=C2=A0 I'm not trying to defend the=
 mess
> it is currently in.
>=20
> The problem started (AFAICT) with c/s ca2eee92df44 in Xen 3.4 (yup -
> you're reading that right), which is still reverted in XenServer becaus=
e
> it broke migration across that changeset.=C2=A0 (We also have other top=
ology
> extensions which are broken in different ways, and I'm still attempting
> to unbreak upstream Xen enough to fix it properly).
>=20
> That changeset attempted to expose hyperthreads, but keep them somewhat
> hidden by blindly asserting that APIC_ID shall now be vcpu_id * 2.
>=20
> Starting with 4.14-rc3, the logic patched above can now distinguish
> between a clean boot, and a migration in from a pre-4.14 version of Xen=
,
> where the CPUID settings need re-inventing out of thin air.
>=20
>=20
> Anyway - to this problem specifically.
>=20
> It seems KVM is giving us HTT=3D0 and NC=3D0.=C2=A0 The botched logic a=
bove has
> clearly not been run on a pre-HTT processor, and it trips up properly
> under KVM's way of doing things.
>=20
> How is the rest of the topology expressed?=C2=A0 Do we get one socket p=
er
> vcpu then, or is this example a single vcpu VM?

The default way of exposing topology when specifying -smp [cpu number] in=
=20
QEMU command line is 1 socket, 1 core, 1 thread for each vCPU.=20

I've fiddled with the switches and when I configured QEMU with
-smp cores=3D2,sockets=3D2,threads=3D2, Xen sees the leaf as:
CPUID.1h =3D=3D EAX: 806ea EBX: 40800 ECX: fffa3223 EDX: 1f8bfbff

so, as you can see, now the HTT bit is on and thus EBX[23:16] makes sense
being equal to number of threads * number of cores for this socket.

This also makes Windows boot without overriding cpuid policy.

> I'm wondering if the option least likely to break migration under the
> current scheme would be to have Xen invent a nonzero number there in th=
e
> HVM policy alongside setting HTT.

This would probably fix the issue and not break anything (hopefully), how=
ever
I don't really understand the rationale behind setting HTT bit on by defa=
ult,
except for looking "weird" to the guest that it has multiple sockets each
with single core. Can you elaborate on that?

Hubert Jasudowicz


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE9200B42
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 16:21:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmHsk-0006KX-7Z; Fri, 19 Jun 2020 14:20:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sYEL=AA=cert.pl=hubert.jasudowicz@srs-us1.protection.inumbo.net>)
 id 1jmHsi-0006KS-Ax
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 14:20:36 +0000
X-Inumbo-ID: 0a0e3e32-b238-11ea-bb8b-bc764e2007e4
Received: from bagnar.nask.net.pl (unknown [195.187.242.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a0e3e32-b238-11ea-bb8b-bc764e2007e4;
 Fri, 19 Jun 2020 14:20:35 +0000 (UTC)
Received: from bagnar.nask.net.pl (unknown [172.16.9.10])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 1A105A34AB;
 Fri, 19 Jun 2020 16:20:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 0F97AA34AF;
 Fri, 19 Jun 2020 16:20:33 +0200 (CEST)
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 1fY7hZqoS_MI; Fri, 19 Jun 2020 16:20:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 8B662A34AB;
 Fri, 19 Jun 2020 16:20:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at bagnar.nask.net.pl
Received: from bagnar.nask.net.pl ([127.0.0.1])
 by localhost (bagnar.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Sw_AqVrLcHbf; Fri, 19 Jun 2020 16:20:32 +0200 (CEST)
Received: from belindir.nask.net.pl (belindir-ext.nask.net.pl
 [195.187.242.210])
 by bagnar.nask.net.pl (Postfix) with ESMTP id 67D29A34A9;
 Fri, 19 Jun 2020 16:20:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id 52EAB225A8;
 Fri, 19 Jun 2020 16:20:02 +0200 (CEST)
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UxnE5D_69fkj; Fri, 19 Jun 2020 16:19:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by belindir.nask.net.pl (Postfix) with ESMTP id DA91822577;
 Fri, 19 Jun 2020 16:19:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at belindir.nask.net.pl
Received: from belindir.nask.net.pl ([127.0.0.1])
 by localhost (belindir.nask.net.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Jb21ZM7euPDe; Fri, 19 Jun 2020 16:19:56 +0200 (CEST)
Received: from [192.168.70.4] (unknown [195.187.238.48])
 by belindir.nask.net.pl (Postfix) with ESMTPSA id 75DCF22542;
 Fri, 19 Jun 2020 16:19:56 +0200 (CEST)
Subject: Re: [PATCH] x86/cpuid: Expose number of vCPUs in CPUID.1.EBX
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <f9c2583332d83fe76c3d98e215c76b7b111650e3.1592496443.git.hubert.jasudowicz@cert.pl>
 <bc49dfbd-ffc0-3548-1e46-22b808442679@citrix.com>
From: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
Message-ID: <8174d110-be3b-5735-9085-f35f7f0318ab@cert.pl>
Date: Fri, 19 Jun 2020 16:19:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bc49dfbd-ffc0-3548-1e46-22b808442679@citrix.com>
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

On 6/18/20 6:51 PM, Andrew Cooper wrote:
> On 18/06/2020 17:22, Hubert Jasudowicz wrote:
>> When running under KVM (or presumably other hypervisors) we enable
>> the CPUID.1.EDX.HTT flag, thus indicating validity of CPUID.1.EBX[23:1=
6]
>> - maximum number of logical processors which the guest reads as 0.
>>
>> Although this method of topology detection is considered legacy,
>> Windows falls back to it when CPUID.0BH.EBX is 0.
>>
>> CPUID.1.EBX[23:16] being equal to 0, triggers memory corruption in
>> ntoskrnl.exe as Windows assumes that number of logical processors woul=
d
>> be at least 1. Memory corruption manifests itself while mapping
>> framebuffer for early graphical subsystem, causing BSOD.
>>
>> This patch fixes running nested Windows (tested on 7 and 10) with KVM =
as
>> L0 hypervisor, by setting the value to maximum number of vCPUs in doma=
in.
>>
>> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>=20
> I'm afraid fixing guest topology is more complicated than just this.=C2=
=A0 On
> its own, I'm not sure if this is safe for VMs migrating in.
>=20
> While I agree that Xen's logic is definitely broken, I suspect the
> conditions for the BSOD are more complicated than this, because Windows
> does work fine when there is no KVM in the setup described.
>=20
> ~Andrew
>=20

After some more testing, I've managed to boot Windows by explicitly confi=
guring the guest
with cpuid=3D"host,htt=3D0". If I understand correctly, the default behav=
ior is to
enable HTT for the guest and basically pass through the value of CPUID.1.=
EBX[23:16]
without any sanity checks.

The reason this works in other setups is that the non-zero value returned=
 by real hardware
leaks into the guest. In my setup, what Xen sees is:
CPUID.1h =3D=3D EAX: 000806ea EBX: 00000800 ECX: fffab223 EDX: 0f8bfbff

In terms of VM migration, this seems already broken because guest might r=
ead different
values depending on what underlying hardware reports. The patch would at =
least provide
some consistency between hosts. Another solution would be not to enable H=
TT bit by default.

Kind regards,
Hubert Jasudowicz





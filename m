Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C795E20FE28
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2020 22:50:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqNC4-0008EV-Co; Tue, 30 Jun 2020 20:49:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+AUS=AL=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jqNC2-0008EL-7Y
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2020 20:49:26 +0000
X-Inumbo-ID: 2e381060-bb13-11ea-8695-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e381060-bb13-11ea-8695-12813bfff9fa;
 Tue, 30 Jun 2020 20:49:24 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: scvk6xkOra2VNUp2WDoOp2BS7us9n4dJl76LOt5U3vJY6+wdXitUXZMuml49ND1jDzDgX4P8dk
 as9r+kg0tjG4z048xv4GIyRXZPRZ5Z0OmeY7c5JzXZ9VXsjK1xCNOLgx0BNK0ggPvoutLTmXFx
 2s84OFREV2OfDTkAZuEZyJ0a7d9wXgrV7n78v1513utyP2lR5Z9VY5Keze/LdjdOTGb/ex7lbg
 bOB+eA3lB7ga6WPBZmW/aHPkRe0nRYBL0phS5vsOrXz46ohK6CHvwk9gT/QVfsaGNPzLrvLpbN
 Vxk=
X-SBRS: 2.7
X-MesageID: 21343897
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,298,1589256000"; d="scan'208";a="21343897"
Subject: Re: [PATCH] x86/cpuid: Expose number of vCPUs in CPUID.1.EBX
To: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <f9c2583332d83fe76c3d98e215c76b7b111650e3.1592496443.git.hubert.jasudowicz@cert.pl>
 <bc49dfbd-ffc0-3548-1e46-22b808442679@citrix.com>
 <8174d110-be3b-5735-9085-f35f7f0318ab@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
X-Enigmail-Draft-Status: N11100
Message-ID: <03c4c8e1-5924-9b85-6e1b-023ae24745f3@citrix.com>
Date: Tue, 30 Jun 2020 21:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8174d110-be3b-5735-9085-f35f7f0318ab@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 19/06/2020 15:19, Hubert Jasudowicz wrote:
> On 6/18/20 6:51 PM, Andrew Cooper wrote:
>> On 18/06/2020 17:22, Hubert Jasudowicz wrote:
>>> When running under KVM (or presumably other hypervisors) we enable
>>> the CPUID.1.EDX.HTT flag, thus indicating validity of CPUID.1.EBX[23:16]
>>> - maximum number of logical processors which the guest reads as 0.
>>>
>>> Although this method of topology detection is considered legacy,
>>> Windows falls back to it when CPUID.0BH.EBX is 0.
>>>
>>> CPUID.1.EBX[23:16] being equal to 0, triggers memory corruption in
>>> ntoskrnl.exe as Windows assumes that number of logical processors would
>>> be at least 1. Memory corruption manifests itself while mapping
>>> framebuffer for early graphical subsystem, causing BSOD.
>>>
>>> This patch fixes running nested Windows (tested on 7 and 10) with KVM as
>>> L0 hypervisor, by setting the value to maximum number of vCPUs in domain.
>>>
>>> Signed-off-by: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
>> I'm afraid fixing guest topology is more complicated than just this.  On
>> its own, I'm not sure if this is safe for VMs migrating in.
>>
>> While I agree that Xen's logic is definitely broken, I suspect the
>> conditions for the BSOD are more complicated than this, because Windows
>> does work fine when there is no KVM in the setup described.
>>
>> ~Andrew
>>
> After some more testing, I've managed to boot Windows by explicitly configuring the guest
> with cpuid="host,htt=0". If I understand correctly, the default behavior is to
> enable HTT for the guest and basically pass through the value of CPUID.1.EBX[23:16]
> without any sanity checks.
>
> The reason this works in other setups is that the non-zero value returned by real hardware
> leaks into the guest. In my setup, what Xen sees is:
> CPUID.1h == EAX: 000806ea EBX: 00000800 ECX: fffab223 EDX: 0f8bfbff
>
> In terms of VM migration, this seems already broken because guest might read different
> values depending on what underlying hardware reports. The patch would at least provide
> some consistency between hosts. Another solution would be not to enable HTT bit by default.

Apologies for the delay replying.  (I've been attempting to finish the
reply for more than a week now, but am just far too busy).


Xen's behaviour is definitely buggy.  I'm not trying to defend the mess
it is currently in.

The problem started (AFAICT) with c/s ca2eee92df44 in Xen 3.4 (yup -
you're reading that right), which is still reverted in XenServer because
it broke migration across that changeset.  (We also have other topology
extensions which are broken in different ways, and I'm still attempting
to unbreak upstream Xen enough to fix it properly).

That changeset attempted to expose hyperthreads, but keep them somewhat
hidden by blindly asserting that APIC_ID shall now be vcpu_id * 2.

Starting with 4.14-rc3, the logic patched above can now distinguish
between a clean boot, and a migration in from a pre-4.14 version of Xen,
where the CPUID settings need re-inventing out of thin air.


Anyway - to this problem specifically.

It seems KVM is giving us HTT=0 and NC=0.  The botched logic above has
clearly not been run on a pre-HTT processor, and it trips up properly
under KVM's way of doing things.

How is the rest of the topology expressed?  Do we get one socket per
vcpu then, or is this example a single vcpu VM?

I'm wondering if the option least likely to break migration under the
current scheme would be to have Xen invent a nonzero number there in the
HVM policy alongside setting HTT.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2257A28E58F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 19:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6948.18153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSkmd-0004mn-4C; Wed, 14 Oct 2020 17:41:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6948.18153; Wed, 14 Oct 2020 17:41:51 +0000
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
	id 1kSkmd-0004mO-0l; Wed, 14 Oct 2020 17:41:51 +0000
Received: by outflank-mailman (input) for mailman id 6948;
 Wed, 14 Oct 2020 17:41:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kSkmb-0004mJ-VJ
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:41:50 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 904468c7-44dd-4100-87ad-f4876b9f707c;
 Wed, 14 Oct 2020 17:41:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aNf1=DV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kSkmb-0004mJ-VJ
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 17:41:50 +0000
X-Inumbo-ID: 904468c7-44dd-4100-87ad-f4876b9f707c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 904468c7-44dd-4100-87ad-f4876b9f707c;
	Wed, 14 Oct 2020 17:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602697307;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=S0vv2LR8wcqmu2jTJZ4PxlH8GTUhLCm/gIwKO2lPVVQ=;
  b=O+uSbfaujJkVbuO3h7CWQBjyjWgiMXzu7rDshpDbsR94819yHcsHcsYm
   fOFVKVuRFXqz8eiH426MyW5itzNWEYoLqb3sxSBkBFq36IrSNnz5c0XRS
   NHeHNZKEKKbFlNTJ7AynF1kEIJrg/WIB3KBJwjBG++wmQV8pKg3Xlz2Y6
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BGW0CMy7pVmGHOZIBvWchbaY4Lopi6ln0HHFYhT6jY7g5CtblgRYFeLxuvFZ9RJEYq5YqVAFTI
 ej2ePBRLcgxkkBNzWLHjI95UWma555qGnUeQG8peBOUXox3IqbLgEOKz2ictkaStT1XXhyuK57
 QzvD4aVKeyFlAbVq3TCSqj0EJrLWhfPGtuv4/fcEApJo6ai33UjJaz2hfaVEQ5C/7kdc/djs9E
 262m/l2wXrCsYpaDWkl200FBoDU2MFST4pQAdv7wtiQiPnG+kt/Uv5sJ67aleDFUh7dbGFoWPn
 Wf0=
X-SBRS: 2.5
X-MesageID: 30051881
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,375,1596513600"; 
   d="scan'208";a="30051881"
Subject: Re: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Andy Lutomirski <luto@kernel.org>,
	Manuel Bouyer <bouyer@antioche.eu.org>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
 <20201009115301.19516-1-andrew.cooper3@citrix.com>
 <20201014162814.GT19254@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <476ff576-e3ea-a461-6486-e117d8360b35@citrix.com>
Date: Wed, 14 Oct 2020 18:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201014162814.GT19254@Air-de-Roger>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 14/10/2020 17:28, Roger Pau Monné wrote:
> On Fri, Oct 09, 2020 at 12:53:01PM +0100, Andrew Cooper wrote:
>> Despite appearing to be a deliberate design choice of early PV64, the
>> resulting behaviour for unregistered SYSCALL callbacks creates an untenable
>> testability problem for Xen.  Furthermore, the behaviour is undocumented,
>> bizarre, and inconsistent with related behaviour in Xen, and very liable
>> introduce a security vulnerability into a PV guest if the author hasn't
>> studied Xen's assembly code in detail.
>>
>> There are two different bugs here.
>>
>> 1) The current logic confuses the registered entrypoints, and may deliver a
>>    SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
>>    entrypoint is registered.
>>
>>    This has been the case ever since 2007 (c/s cd75d47348b) but up until
>>    2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
>>    a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.
>>
>>    Xen would malfunction under these circumstances, if it were a PV guest.
>>    Linux would as well, but PVOps has always registered both entrypoints and
>>    discarded the Xen-provided selectors.  NetBSD really does malfunction as a
>>    consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).
>>
>> 2) In the case that neither SYSCALL callbacks are registered, the guest will
>>    be crashed when userspace executes a SYSCALL instruction, which is a
>>    userspace => kernel DoS.
>>
>>    This has been the case ever since the introduction of 64bit PV support, but
>>    behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which yield
>>    #GP/#UD in userspace before the callback is registered, and are therefore
>>    safe by default.
>>
>> This change does constitute a change in the PV ABI, for corner cases of a PV
>> guest kernel registering neither callback, or not registering the 32bit
>> callback when running on AMD/Hygon hardware.
>>
>> It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
>> SYSENTER (safe by default, until explicitly enabled), as well as native
>> hardware (always delivered to the single applicable callback).
>>
>> Most importantly however, and the primary reason for the change, is that it
>> lets us sensibly test the fast system call entrypoints under all states a PV
>> guest can construct, to prove correct behaviour.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Andy Lutomirski <luto@kernel.org>
>> CC: Manuel Bouyer <bouyer@antioche.eu.org>
>>
>> v2:
>>  * Drop unnecessary instruction suffixes
>>  * Don't truncate #UD entrypoint to 32 bits
>>
>> Manuel: This will result in a corner case change for NetBSD.
>>
>> At the moment on native, 32bit userspace on 64bit NetBSD will get #UD (Intel,
>> etc), or an explicit -ENOSYS (AMD, etc) when trying to execute a 32bit SYSCALL
>> instruction.
>>
>> After this change, a 64bit PV VM will consistently see #UD (like on Intel, etc
>> hardware) even when running on AMD/Hygon hardware (as Xsyscall32 isn't
>> registered with Xen), rather than following Xsyscall into the proper system
>> call path.
>> ---
>>  xen/arch/x86/x86_64/entry.S | 26 +++++++++++++++++++-------
>>  1 file changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
>> index 000eb9722b..aaf8402f93 100644
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -26,18 +26,30 @@
>>  /* %rbx: struct vcpu */
>>  ENTRY(switch_to_kernel)
>>          leaq  VCPU_trap_bounce(%rbx),%rdx
>> -        /* TB_eip = (32-bit syscall && syscall32_addr) ?
>> -         *          syscall32_addr : syscall_addr */
>> -        xor   %eax,%eax
>> +
>> +        /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
>> +        mov   VCPU_syscall32_addr(%rbx), %ecx
> This being an unsigned long field, shouldn't you use %rcx here?

Yes I should.  Sorry - thought I'd fixed all of these.  I'll ad higher
half handlers to the XTF test.

~Andrew


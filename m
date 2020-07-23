Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF522B07B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 15:28:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jybGS-0008P6-MD; Thu, 23 Jul 2020 13:28:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jybGR-0008OF-Jo
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 13:27:59 +0000
X-Inumbo-ID: 52a8f55f-cce8-11ea-a298-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52a8f55f-cce8-11ea-a298-12813bfff9fa;
 Thu, 23 Jul 2020 13:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595510878;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=s7t2QUOLs1qt8WqvBpHUm61e9CeK8KZQNhK9/ZwC1us=;
 b=EVVwTLz2+LEpET7smVxlKNYZpktsGCWY2c/5vu61KLMt7quWCB7eOOWa
 IjKa/MD1T+Ai3lHJz2x26rcu/jokJ1MjRS9ec81W+DWX75Fus3QZ0RzZ0
 RxC0ciP5WEB6My+q82p/gQmLh9on0eV3P+Pv2W+olimhfr1SlxZHpeCtc w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bDWa+yTMtrngYt6gmlpTivdst9fYiE9wb+rwX3W/ksRkHxrd0FvN54g1Ahk29Gbyp1ZLAIbyuN
 6lwdkWQpLX2KTl/2j3takemDVB4/Pm6Kwj1DvmDcIqyBQ+i0/W5s/majNPt1Kj2q2MNbfC2191
 zbVNLA84DnF1a2Po46ZB1zyRGxoM+L6VgV1ItBq26atLywcXy6d2VFJTUWvGFPHyCKSRz2yLmz
 FVcnyR+8+gi5UPao1+LRQ/UcG521vUSPfErLvmuqEPf2+bZ21iGOXuZPePy97ZJ2SPfQtfYrgK
 Igs=
X-SBRS: 2.7
X-MesageID: 23055499
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,386,1589256000"; d="scan'208";a="23055499"
Subject: Re: [PATCH] x86/vmce: Dispatch vmce_{rd,wr}msr() from
 guest_{rd,wr}msr()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200722101809.8389-1-andrew.cooper3@citrix.com>
 <20200723100727.GA7191@Air-de-Roger>
 <ccc153a5-cf65-c483-43ea-d6b864366e06@citrix.com>
 <20200723113025.GC7191@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1250cb45-5539-cb45-52eb-b2cb1477c48d@citrix.com>
Date: Thu, 23 Jul 2020 14:27:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723113025.GC7191@Air-de-Roger>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 12:30, Roger Pau Monné wrote:
> On Thu, Jul 23, 2020 at 12:00:53PM +0100, Andrew Cooper wrote:
>> On 23/07/2020 11:07, Roger Pau Monné wrote:
>>> On Wed, Jul 22, 2020 at 11:18:09AM +0100, Andrew Cooper wrote:
>>>> +    case MSR_IA32_MCG_CAP     ... MSR_IA32_MCG_CTL:      /* 0x179 -> 0x17b */
>>>> +    case MSR_IA32_MCx_CTL2(0) ... MSR_IA32_MCx_CTL2(31): /* 0x280 -> 0x29f */
>>>> +    case MSR_IA32_MCx_CTL(0)  ... MSR_IA32_MCx_MISC(31): /* 0x400 -> 0x47f */
>>> Where do you get the ranges from 0 to 31? It seems like the count
>>> field in the CAP register is 8 bits, which could allow for up to 256
>>> banks?
>>>
>>> I'm quite sure this would then overlap with other MSRs?
>> Irritatingly, nothing I can find actually states an upper architectural
>> limit.
>>
>> SDM Vol4, Table 2-2 which enumerates the Architectural MSRs.
>>
>> 0x280 thru 0x29f are explicitly reserved MCx_CTL2, which is a limit of
>> 32 banks.  There are gaps after this in the architectural table, but
>> IceLake has PRMRR_BASE_0 at 0x2a0.
>>
>> The main bank of MCx_{CTL,STATUS,ADDR,MISC} start at 0x400 and are
>> listed in the table up to 0x473, which is a limit of 29 banks.  The
>> Model specific table for SandyBridge fills in the remaining 3 banks up
>> to MSR 0x47f, which is the previous limit of 32 banks.  (These MSRs have
>> package scope rather than core/thread scope, but they are still
>> enumerated architecturally so I'm not sure why they are in the model
>> specific tables.)
>>
>> More importantly however, the VMX MSR range starts at 0x480, immediately
>> above bank 31, which puts an architectural hard limit on the number of
>> banks.
> Yes, realized about the VMX MSRs starting at 0x480, which limits the
> number of banks. Maybe a small comment about the fact that albeit the
> count in the CAP register could go up to 256 32 is the actual limit
> due to how MSRs are arranged?

Ok.  I've added:

The bank limit of 32 isn't stated anywhere I can locate, but is a
consequence
of the MSR layout described in SDM Volume 4.

as another paragraph to the commit message.

> Note there's also GUEST_MC_BANK_NUM which is the actual implementation
> limit in Xen AFAICT, maybe using it here would be clearer? (and limit
> the ranges forwarded to vmce_rdmsr)

First, there is a note saying that older versions of Xen advertised more
than 2 banks to guests (and therefore we might see such a guest migrated
in), and second, capturing all MSRs is a bug I'm specifically fixing
with this change, and was called out in the commit message.

These MSRs, even beyond the banks implemented by the guest, are still
MCE banks, and need handling appropriately as "out of range banks",
which isn't necessarily the same as falling into the general default MSR
path.

~Andrew


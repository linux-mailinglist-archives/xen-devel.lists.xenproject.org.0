Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA681D9BD0
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:59:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4e3-00045f-1B; Tue, 19 May 2020 15:59:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGb=7B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jb4e1-00045Y-Lg
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:59:05 +0000
X-Inumbo-ID: a9cda2da-99e9-11ea-ae69-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9cda2da-99e9-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 15:59:04 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: t+VMYjCUDVBb8Qz48o/FakOmXoKdr+6rgoF9hwzgU2wY4/XZkYPIyn87gDMTNEI/N7HR+gmNOQ
 AnsAorALKTled5xWBKXc0Ed352SvY7/RGYDgCUQxLhMcKNWPBq6nu/oT9Es1oJsZtrfsM0zhuN
 YK1x8FgwHknb4wnmNMmCUq9bDO3EMDWUHYvusSzeTOOXnnkyw8dEsHxItZgb59tRZywyMjJyAz
 idolsfTvEmuf+6oY6ug7AvzJC/FXPya4KTyVdNzDNaWPH2UUZVVjc1yu3MXTEcgdx+ah9/t2mB
 bw8=
X-SBRS: 2.7
X-MesageID: 17893715
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="17893715"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Jan Beulich <jbeulich@suse.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <bf0d9e00-cb42-34b1-26ee-93628eea094c@suse.com>
 <d925943b-cad8-07c3-c21c-322ffc4a75da@citrix.com>
 <f06370cb-5cff-2e4a-571c-0b61656e4829@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8004a377-dd66-0248-8ed9-2145080ec570@citrix.com>
Date: Tue, 19 May 2020 16:59:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f06370cb-5cff-2e4a-571c-0b61656e4829@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 15:55, Jan Beulich wrote:
> On 19.05.2020 16:29, Andrew Cooper wrote:
>> On 19/05/2020 09:14, Jan Beulich wrote:
>>> On 18.05.2020 17:38, Andrew Cooper wrote:
>>>> The reserved_bit_page_fault() paths effectively turn reserved bit faults into
>>>> a warning, but in the light of L1TF, the real impact is far more serious.
>>>>
>>>> Xen does not have any reserved bits set in its pagetables, nor do we permit PV
>>>> guests to write any.  An HVM shadow guest may have reserved bits via the MMIO
>>>> fastpath, but those faults are handled in the VMExit #PF intercept, rather
>>>> than Xen's #PF handler.
>>>>
>>>> There is no need to disable interrupts (in spurious_page_fault()) for
>>>> __page_fault_type() to look at the rsvd bit, nor should extable fixup be
>>>> tolerated.
>>> I'm afraid I don't understand the connection of the first half of this
>>> to the patch - you don't alter spurious_page_fault() in this regard (at
>>> all, actually).
>> The disabling interrupts is in spurious_page_fault().  But the point is
>> that there is no need to enter this logic at all for a reserved page fault.
>>
>>> As to extable fixup, I'm not sure: If a reserved bit ends up slipping
>>> into the non-Xen parts of the page tables, and if guest accessors then
>>> become able to trip a corresponding #PF, the bug will need an XSA with
>>> the proposed change, while - afaict - it won't if the exception gets
>>> recovered from. (There may then still be log spam issue, I admit.)
>> We need to issue an XSA anyway because such a construct would be an L1TF
>> gadget.
>>
>> What this change does is make it substantially more obvious, and turns
>> an information leak into a DoS.
> For L1TF-affected hardware. For unaffected hardware it turns a possible
> (but not guaranteed) log spam DoS into a reliable crash.

It represents unexpected corruption of our most critical security
resource in the processor.

Obviously we need to account for any legitimate uses Xen has of reserved
bits (so far maybe GNP for PV guests), but BUG()-like behaviour *is* the
response appropriate to the severity of finding corrupt PTEs.

~Andrew


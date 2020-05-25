Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89B1E1018
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdDkp-0005tQ-B8; Mon, 25 May 2020 14:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdDkn-0005tL-Vk
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:06:58 +0000
X-Inumbo-ID: fe50b21a-9e90-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe50b21a-9e90-11ea-9887-bc764e2007e4;
 Mon, 25 May 2020 14:06:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7857FAC24;
 Mon, 25 May 2020 14:06:58 +0000 (UTC)
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
 <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
 <e5a2899c-f375-55e8-fc6c-940b70929ae6@suse.com>
 <CABfawhnB4WY6U-XcigT+X=n4e8qdDMFokMWR1Sc_s-oMeyZRWg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78714288-89b0-6a53-4f74-f2306ae6e749@suse.com>
Date: Mon, 25 May 2020 16:06:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CABfawhnB4WY6U-XcigT+X=n4e8qdDMFokMWR1Sc_s-oMeyZRWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.05.2020 15:46, Tamas K Lengyel wrote:
> On Mon, May 25, 2020 at 7:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.05.2020 14:18, Tamas K Lengyel wrote:
>>> On Mon, May 25, 2020 at 12:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 22.05.2020 18:33, Tamas K Lengyel wrote:
>>>>> When running shallow forks without device models it may be undesirable for Xen
>>>>> to inject interrupts. With Windows forks we have observed the kernel going into
>>>>> infinite loops when trying to process such interrupts, likely because it attempts
>>>>> to interact with devices that are not responding without QEMU running. By
>>>>> disabling interrupt injection the fuzzer can exercise the target code without
>>>>> interference.
>>>>>
>>>>> Forks & memory sharing are only available on Intel CPUs so this only applies
>>>>> to vmx.
>>>>
>>>> Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
>>>> this. Would you mind pointing me at where this restriction is coming from?
>>>
>>> Both mem_access and mem_sharing are only implemented for EPT:
>>> http://xenbits.xen.org/hg/xen-unstable.hg/file/5eadf9363c25/xen/arch/x86/mm/p2m-ept.c#l126.
>>
>> p2m-pt.c:p2m_type_to_flags() has a similar case label.
> 
> It doesn't do anything though, does it? For mem_sharing to work you
> actively have to restrict the memory permissions on the shared entries
> to be read/execute only. That's only done for EPT.

Does it not? I seems to me that it does, seeing the case sits
together with the p2m_ram_ro and p2m_ram_logdirty ones:

    case p2m_ram_ro:
    case p2m_ram_logdirty:
    case p2m_ram_shared:
        return flags | P2M_BASE_FLAGS;

>> And I can't
>> spot a respective restriction in mem_sharing_memop(), i.e. it looks
>> to me as if enabling mem-sharing on NPT (to satisfy hap_enabled()
>> in mem_sharing_control()) would be possible.
> 
> If you are looking for an explicit gate like that, then you are right,
> there isn't one. You can ask the original authors of this subsystem
> why that is. If you feel like adding an extra gate, I wouldn't object.

Well, the question here isn't about gating - that's an independent
bug if it's indeed missing. The question is whether SVM code also
needs touching, as was previously requested. You tried to address
this by stating an Intel-only limitation, which I couldn't find
proof for (so far).

Jan


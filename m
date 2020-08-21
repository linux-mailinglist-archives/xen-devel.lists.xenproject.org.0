Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2824CE3C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 08:50:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k90sH-00055U-Dq; Fri, 21 Aug 2020 06:50:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kxmg=B7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k90sG-0004uK-1D
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 06:50:04 +0000
X-Inumbo-ID: 0195895c-5058-4afe-a401-44dc02c16b80
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0195895c-5058-4afe-a401-44dc02c16b80;
 Fri, 21 Aug 2020 06:50:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2B338B67C;
 Fri, 21 Aug 2020 06:50:27 +0000 (UTC)
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Roman Shaposhnik <roman@zededa.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <a439f9c6-2773-5f49-367b-fe3f3ff21ae9@citrix.com>
 <CAMmSBy8gupDuXEUGxucwZ0G6dG8xD-Edabv-ken0L_P1uyJgZA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <66a05f5d-715f-eb40-57c4-6decd43f540b@suse.com>
Date: Fri, 21 Aug 2020 08:50:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8gupDuXEUGxucwZ0G6dG8xD-Edabv-ken0L_P1uyJgZA@mail.gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.2020 21:12, Roman Shaposhnik wrote:
> On Thu, Aug 20, 2020 at 5:56 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 19/08/2020 23:50, Roman Shaposhnik wrote:
>>>  Hi!
>>>
>>> below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
>>> without efi=no-rs. Please let me know if I can provide any additional
>>> information.
>>
>> Just to be able to get all datapoints, could you build Xen with
>> CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP and see if the failure mode changes?
> 
> It does.

As said on the other sub-thread - it doesn't:

> (XEN)  00000ff900000-00000ffffffff type=11 attr=8000000000000000
> (XEN) Unknown cachability for MFNs 0xff900-0xfffff
>[...]
> (XEN) ----[ Xen-4.14.0  x86_64  debug=y   Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
> (XEN) rax: 0000000088411fe8   rbx: ffff82d0408afb28   rcx: ffff82d0408afa40
> (XEN) rdx: 00000000ff900000   rsi: 00000000ff900000   rdi: 00000000775e4d58
> (XEN) rbp: ffff82d0408afc00   rsp: ffff82d0408afa18   r8:  ffff82d0408afb28
> (XEN) r9:  0000000000000000   r10: 00000000ff920000   r11: 0000000000020000
> (XEN) r12: ffff82d0408afc40   r13: 0000000000000040   r14: 00000000775ce2c0
> (XEN) r15: 00000000775cf9e8   cr0: 0000000080050033   cr4: 00000000001006e0
> (XEN) cr3: 0000000070ddd000   cr2: 00000000ff900020
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
> (XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10 17 eb
> (XEN) Xen stack trace from rsp=ffff82d0408afa18:
> (XEN)    00000000775ddb8e 00000000775e4d58 0000000000072812 0000000000000001
> (XEN)    ffff82d0408afaf8 00000000ff900000 0000000000020000 00000000ff91fff0
> (XEN)    00000000ff90cecc 00000000ff900060 0000000007f70021 0000000000000000
> (XEN)    0000000077739001 ffff82d0409cc3c0 0000000000000020 ffff82d0409cc3c0
> (XEN)    0000000000000020 ffff82d040646ce0 ffff82d040620d20 ffff82d0408afc40
> (XEN)    00000000775e2e73 00000000775da608 ffff82d0408afc50 0000000000000000
> (XEN)    0000000000000000 ffff82d0409b8950 00000000775e2ead ffff82d0409b8950
> (XEN)    ffff82d0408afb48 8000000000000003 0000000000000000 0000000000000000
> (XEN)    00000000775ddd88 00000000775da610 000000000000000a ffff82d0408afc50
> (XEN)    000000000000000a ffff82d0408afc40 ffff82d040620d20 ffff82d040721200
> (XEN)    ffff82d0408afb78 ffff82d0409eed20 ffff82d0408afbb8 0000000000000430
> (XEN)    0000000000000002 ffff82d0408aff00 000000000000020c ffff82d0408afc50
> (XEN)    00000000775de841 00000000775cf9e8 00000000775d03b5 00000000775ce2c0
> (XEN)    0000000000000000 ffff82d0408afc40 0000000000000082 0000000000000000
> (XEN)    00000000775d0798 ffff82d0408afc90 0000000000000000 0000000000002022
> (XEN)    ffff82d04025e164 ffff82d0408afc40 0000000000000282 0000000000000000
> (XEN)    ffff82d0408affff 0000000000000282 ffff82d040665fb6 00000000001006e0
> (XEN)    ffff82d040202033 0000000000000002 ffff830077586e18 0000000000000003
> (XEN)    ffff82d0408afcd0 0000000071233000 00007d2fbf750367 ffff82d0404ef931
> (XEN)    0000000031746960 0000000000001d4b 0000000000000200 00333114010107dc
> (XEN) Xen call trace:
> (XEN)    [<00000000775e0d21>] R 00000000775e0d21
> (XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
> (XEN)    [<0000000000000282>] F 0000000000000282
> (XEN)    [<ffff830077586e18>] F ffff830077586e18
> (XEN)
> (XEN) Pagetable walk from 00000000ff900020:

Hitting the very same address range, just the call trace has changed.

Jan


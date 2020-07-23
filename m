Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E98422AC84
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 12:26:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyYQE-0006p4-Sl; Thu, 23 Jul 2020 10:25:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyYQD-0006oz-8g
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 10:25:53 +0000
X-Inumbo-ID: e2398b62-ccce-11ea-86ed-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2398b62-ccce-11ea-86ed-bc764e2007e4;
 Thu, 23 Jul 2020 10:25:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80A8CACDF;
 Thu, 23 Jul 2020 10:25:59 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: Clean up track_dirty_vram() calltree
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200722151548.4000-1-andrew.cooper3@citrix.com>
 <07ecb7dd-c823-0c6a-2bcd-7fc22471af7a@suse.com>
 <822f6c64-0e63-1199-63b0-f27449fd79c6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <635385e7-81f4-138a-f8ba-269a6d2c7ddb@suse.com>
Date: Thu, 23 Jul 2020 12:25:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <822f6c64-0e63-1199-63b0-f27449fd79c6@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.2020 11:40, Andrew Cooper wrote:
> On 22/07/2020 17:13, Jan Beulich wrote:
>> On 22.07.2020 17:15, Andrew Cooper wrote:
>>>  * Rename nr to nr_frames.  A plain 'nr' is confusing to follow in the the
>>>    lower levels.
>>>  * Use DIV_ROUND_UP() rather than opencoding it in several different ways
>>>  * The hypercall input is capped at uint32_t, so there is no need for
>>>    nr_frames to be unsigned long in the lower levels.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'd like to note though that ...
>>
>>> --- a/xen/arch/x86/mm/hap/hap.c
>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>> @@ -58,16 +58,16 @@
>>>  
>>>  int hap_track_dirty_vram(struct domain *d,
>>>                           unsigned long begin_pfn,
>>> -                         unsigned long nr,
>>> +                         unsigned int nr_frames,
>>>                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
>>>  {
>>>      long rc = 0;
>>>      struct sh_dirty_vram *dirty_vram;
>>>      uint8_t *dirty_bitmap = NULL;
>>>  
>>> -    if ( nr )
>>> +    if ( nr_frames )
>>>      {
>>> -        int size = (nr + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
>>> +        unsigned int size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);
>> ... with the change from long to int this construct will now no
>> longer be correct for the (admittedly absurd) case of a hypercall
>> input in the range of [0xfffffff9,0xffffffff]. We now fully
>> depend on this getting properly rejected at the top level hypercall
>> handler (which limits to 1Gb worth of tracked space).
> 
> I don't see how this makes any difference at all.
> 
> Exactly the same would be true in the old code for an input in the range
> [0xfffffffffffffff9,0xffffffffffffffff], where the aspect which protects
> you is the fact that the hypercall ABI truncates to 32 bits.

Exactly: The hypercall ABI won't change. The GB(1) check up the call
tree may go away, without the then arising issue being noticed.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B31230E7F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 17:54:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Rvu-00040J-4I; Tue, 28 Jul 2020 15:54:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K5Bo=BH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k0Rvt-00040D-Lc
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 15:54:25 +0000
X-Inumbo-ID: 9b42dfcc-d0ea-11ea-8b89-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b42dfcc-d0ea-11ea-8b89-bc764e2007e4;
 Tue, 28 Jul 2020 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595951664;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=3RqD1ZWNAXPqA1HlEKynr4F4GCWiwQSbeP3zx33qDi4=;
 b=b1GLf4BxfAhCUAlSyjQGDuAg1TKi/iawApxbZS8wQgGXC9SmJdYODCjg
 4yDqMZ73kPUar6ZBO56ONUBFWHo8jVZO8CNTd9h9MYzhV1R0BXAY9BKMm
 s8Vbm1RiT8eapTGr5U8BTkp39Ytrks3wTd6JJZWcGHQFZNh1kYY49aXTZ o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fNUJfxBsaAtfnz8WwdLmKRjJy4+x5tliyGcJyedIBFbzqOIKLKwIVZD9b285TXQU2XXIL5adQJ
 owlFaLNCsN0hZcHd2uXpPb9AQzZhGpnjCEbK5HtTxM+TY3ps8A14yxPAbqBQ/svf0CLb5BDSOR
 A3W+KSbgRpTDUe7Nd8BgsaGGyYuZ9Wo60anePXdIihv5QTPUS956Oa9LpOjmRkoM3LDQgWz+Do
 JiOye1H0/4exIvUVgiMWsmrqx6JrqN/3QAEn+8rYvhTygr+oyJXK/vTL3pmnpcTpInS26PqCv2
 hko=
X-SBRS: 2.7
X-MesageID: 23551922
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23551922"
Subject: Re: [PATCH] x86/hvm: Clean up track_dirty_vram() calltree
To: Jan Beulich <jbeulich@suse.com>
References: <20200722151548.4000-1-andrew.cooper3@citrix.com>
 <07ecb7dd-c823-0c6a-2bcd-7fc22471af7a@suse.com>
 <822f6c64-0e63-1199-63b0-f27449fd79c6@citrix.com>
 <635385e7-81f4-138a-f8ba-269a6d2c7ddb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9831be29-93e6-d7af-b42a-49cd6766dcc9@citrix.com>
Date: Tue, 28 Jul 2020 16:54:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <635385e7-81f4-138a-f8ba-269a6d2c7ddb@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/07/2020 11:25, Jan Beulich wrote:
> On 23.07.2020 11:40, Andrew Cooper wrote:
>> On 22/07/2020 17:13, Jan Beulich wrote:
>>> On 22.07.2020 17:15, Andrew Cooper wrote:
>>>>  * Rename nr to nr_frames.  A plain 'nr' is confusing to follow in the the
>>>>    lower levels.
>>>>  * Use DIV_ROUND_UP() rather than opencoding it in several different ways
>>>>  * The hypercall input is capped at uint32_t, so there is no need for
>>>>    nr_frames to be unsigned long in the lower levels.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I'd like to note though that ...
>>>
>>>> --- a/xen/arch/x86/mm/hap/hap.c
>>>> +++ b/xen/arch/x86/mm/hap/hap.c
>>>> @@ -58,16 +58,16 @@
>>>>  
>>>>  int hap_track_dirty_vram(struct domain *d,
>>>>                           unsigned long begin_pfn,
>>>> -                         unsigned long nr,
>>>> +                         unsigned int nr_frames,
>>>>                           XEN_GUEST_HANDLE(void) guest_dirty_bitmap)
>>>>  {
>>>>      long rc = 0;
>>>>      struct sh_dirty_vram *dirty_vram;
>>>>      uint8_t *dirty_bitmap = NULL;
>>>>  
>>>> -    if ( nr )
>>>> +    if ( nr_frames )
>>>>      {
>>>> -        int size = (nr + BITS_PER_BYTE - 1) / BITS_PER_BYTE;
>>>> +        unsigned int size = DIV_ROUND_UP(nr_frames, BITS_PER_BYTE);
>>> ... with the change from long to int this construct will now no
>>> longer be correct for the (admittedly absurd) case of a hypercall
>>> input in the range of [0xfffffff9,0xffffffff]. We now fully
>>> depend on this getting properly rejected at the top level hypercall
>>> handler (which limits to 1Gb worth of tracked space).
>> I don't see how this makes any difference at all.
>>
>> Exactly the same would be true in the old code for an input in the range
>> [0xfffffffffffffff9,0xffffffffffffffff], where the aspect which protects
>> you is the fact that the hypercall ABI truncates to 32 bits.
> Exactly: The hypercall ABI won't change. The GB(1) check up the call
> tree may go away, without the then arising issue being noticed.

The ABI is equally as like to change as the 1G limit.  Either both
issues will be fixed (and almost certainly together), or neither will
change forever more.

~Andrew


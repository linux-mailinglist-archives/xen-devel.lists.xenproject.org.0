Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A9223BD8D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2zDF-0004kU-B2; Tue, 04 Aug 2020 15:50:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2zDE-0004kJ-Ln
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:50:48 +0000
X-Inumbo-ID: e3b9ef3c-a254-46b5-bbbd-726a425dbd82
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b9ef3c-a254-46b5-bbbd-726a425dbd82;
 Tue, 04 Aug 2020 15:50:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE8FEAE9D;
 Tue,  4 Aug 2020 15:51:01 +0000 (UTC)
Subject: Re: [PATCH] x86emul: further FPU env testing relaxation for AMD-like
 CPUs
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b2667393-0196-30de-86e9-b7a6145ed03d@suse.com>
 <91e628c6-cbbc-2023-51be-674de4901704@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84af154e-c2b9-a6da-f8ee-8acafdd02dff@suse.com>
Date: Tue, 4 Aug 2020 17:50:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <91e628c6-cbbc-2023-51be-674de4901704@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 16:46, Andrew Cooper wrote:
> On 04/08/2020 10:36, Jan Beulich wrote:
>> See the code comment that's being extended. Additionally a few more
>> zap_fpsel() invocations are needed - whenever we stored state after
>> there potentially having been a context switch behind our backs.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>> @@ -752,6 +752,13 @@ static struct x86_emulate_ops emulops =
>>   * 64-bit OSes may not (be able to) properly restore the two selectors in
>>   * the FPU environment. Zap them so that memcmp() on two saved images will
>>   * work regardless of whether a context switch occurred in the middle.
>> + *
>> + * Additionally on AMD-like CPUs FDP/FIP/FOP may get lost across context
>> + * switches, when there's no unmasked pending FP exception: With
> 
> I think you want a full stop rather than a colon, and ...

I'd prefer to stick to the colon here, while ...

>> + * CPUID[80000008].EBX[2] clear, the fields don't get written/read by
>> + * {F,}XSAVE / {F,}XRSTOR, which OSes often compensate for by invoking an
>> + * insn forcing the fields to gain a deterministic value. Whereas with said
> 
> ... a comma here rather than a full stop.
> 
> Having "whereas" at the beginning of a sentence like this is weird,
> given that you're contrasting the behaviour of the CPUID bit.
> 
> Also, the more usual CPUID syntax would be CPUID.0x80000008.EBX[2].

... I've adjusted these.

Jan


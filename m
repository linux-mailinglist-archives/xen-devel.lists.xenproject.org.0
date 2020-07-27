Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265122F97F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 21:50:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k098k-0005DO-2a; Mon, 27 Jul 2020 19:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k098j-0005DJ-Gc
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 19:50:25 +0000
X-Inumbo-ID: 6968ec6a-d042-11ea-8aee-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6968ec6a-d042-11ea-8aee-bc764e2007e4;
 Mon, 27 Jul 2020 19:50:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76758AE83;
 Mon, 27 Jul 2020 19:50:34 +0000 (UTC)
Subject: Re: [PATCH 2/4] x86: reduce CET-SS related #ifdef-ary
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <58615a18-7f81-c000-d499-1a49f4752879@suse.com>
 <20200727150002.GS7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2a33851-10b3-a1c7-646a-96a0b5783923@suse.com>
Date: Mon, 27 Jul 2020 21:50:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727150002.GS7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 17:00, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 12:48:46PM +0200, Jan Beulich wrote:
>> Commit b586a81b7a90 ("x86/CET: Fix build following c/s 43b98e7190") had
>> to introduce a number of #ifdef-s to make the build work with older tool
>> chains. Introduce an assembler macro covering for tool chains not
>> knowing of CET-SS, allowing some conditionals where just SETSSBSY is the
>> problem to be dropped again.
>>
>> No change to generated code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Looks like an improvement overall in code clarity:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Can you test on clang? Just to be on the safe side, otherwise I can
> test it.

Works with 5.<whatever> that I have on one of my boxes.

>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -237,9 +237,7 @@ iret_exit_to_guest:
>>    * %ss must be saved into the space left by the trampoline.
>>    */
>>   ENTRY(lstar_enter)
>> -#ifdef CONFIG_XEN_SHSTK
>>           ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
> 
> Should the setssbsy be quoted, or it doesn't matter? I'm asking
> because the same construction used by CLAC/STAC doesn't quote the
> instruction.

I actually thought we consistently quote these. It doesn't matter
as long as it's a single word. Quoting becomes necessary when
there are e.g. blanks involved, which happens for insns with
operands.

Jan


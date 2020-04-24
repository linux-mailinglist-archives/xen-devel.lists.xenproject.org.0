Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D21B6E0B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 08:22:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRrid-0002Br-Eb; Fri, 24 Apr 2020 06:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2qtr=6I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRrib-0002Bm-Qo
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 06:21:45 +0000
X-Inumbo-ID: de7c4220-85f3-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de7c4220-85f3-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 06:21:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 41005AF33;
 Fri, 24 Apr 2020 06:21:43 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/pv: Don't use IST for NMI/#MC/#DB in !CONFIG_PV
 builds
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-4-andrew.cooper3@citrix.com>
 <08a798db-3126-7ccd-17f3-476607cc9e45@suse.com>
 <76fa899a-2b35-8ea9-159e-c9e3dcf88f53@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3281b2cc-4bab-65f7-0583-2ee30b4f3b22@suse.com>
Date: Fri, 24 Apr 2020 08:21:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <76fa899a-2b35-8ea9-159e-c9e3dcf88f53@citrix.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.04.2020 20:49, Andrew Cooper wrote:
> On 21/04/2020 08:48, Jan Beulich wrote:
>> On 20.04.2020 16:59, Andrew Cooper wrote:
>>> --- a/xen/include/asm-x86/processor.h
>>> +++ b/xen/include/asm-x86/processor.h
>>> @@ -441,12 +441,18 @@ struct tss_page {
>>>  };
>>>  DECLARE_PER_CPU(struct tss_page, tss_page);
>>>  
>>> +/*
>>> + * Interrupt Stack Tables.  Used to force a stack switch on a CPL0=>0
>>> + * interrupt/exception.  #DF uses IST all the time to detect stack overflows
>>> + * cleanly.  NMI/#MC/#DB only need IST to cover the SYSCALL gap, and therefore
>>> + * only necessary with PV guests.
>>> + */
>> Is it really only the SYSCALL gap that we mean to cover? In particular
>> for #MC I'd suspect it is a good idea to switch stacks as well, to get
>> onto a distinct memory page in case the #MC was stack related.
> 
> If #MC occurs on your stack, you have already lost.  The chances of only
> taking a single #MC are tiny because the next-line prefetcher will be
> doing its job (or it hits when the lines (plural) leave L3, which will
> be in guest context at some point in the future.)

It would seem fishy behavior to me for the hardware to continue
issuing prefetches against a page that has just been noticed to
cause issues when accessed. Surely hardware at least _could_
internally mark such a page #UC or some such, to prevent further
prefetches to actually hit the bus.

> The very best you can hope for is to cleanly print something and crash -
> even if you manage to run the handler, you've got no idea if the
> interrupted context had a spinlock held, and Xen has no support for
> changing to a different pcpu stack.

But getting something printed is magnitudes better that hanging
or rebooting entirely silently.

Nevertheless, as long as you extend the description somewhat to
express this reasoning in some way
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(a little hesitantly though).

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9931CDE53
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYA3G-0005FM-HX; Mon, 11 May 2020 15:09:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYA3F-0005FH-8A
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:09:05 +0000
X-Inumbo-ID: 5a3e830c-9399-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a3e830c-9399-11ea-ae69-bc764e2007e4;
 Mon, 11 May 2020 15:09:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3975DAF0F;
 Mon, 11 May 2020 15:09:06 +0000 (UTC)
Subject: Re: [PATCH 02/16] x86/traps: Clean up printing in
 do_reserved_trap()/fatal_trap()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-3-andrew.cooper3@citrix.com>
 <aca22b53-895e-19bb-c54c-f1e4945c95c1@suse.com>
 <8f1d68b1-895a-d2a6-4dcb-55b688b03336@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b1ef905c-dab6-d1c3-4673-4c06c7e94a0a@suse.com>
Date: Mon, 11 May 2020 17:09:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8f1d68b1-895a-d2a6-4dcb-55b688b03336@citrix.com>
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

On 11.05.2020 17:01, Andrew Cooper wrote:
> On 04/05/2020 14:08, Jan Beulich wrote:
>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>> For one, they render the vector in a different base.
>>>
>>> Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
>>> mnemonic, which starts bringing the code/diagnostics in line with the Intel
>>> and AMD manuals.
>> For this "bringing in line" purpose I'd like to see whether you could
>> live with some adjustments to how you're currently doing things:
>> - NMI is nowhere prefixed by #, hence I think we'd better not do so
>>   either; may require embedding the #-es in the names[] table, or not
>>   using N() for NMI
> 
> No-one is going to get confused at seeing #NMI in an error message.  I
> don't mind jugging the existing names table, but anything more
> complicated is overkill.
> 
>> - neither Coprocessor Segment Overrun nor vector 0x0f have a mnemonic
>>   and hence I think we shouldn't invent one; just treat them like
>>   other reserved vectors (of which at least vector 0x09 indeed is one
>>   on x86-64)?
> 
> This I disagree with.  Coprocessor Segment Overrun *is* its name in both
> manuals, and the avoidance of vector 0xf is clearly documented as well,
> due to it being the default PIC Spurious Interrupt Vector.
> 
> Neither CSO or SPV are expected to be encountered in practice, but if
> they are, highlighting them is a damn-sight more helpful than pretending
> they don't exist.

How is them occurring (and getting logged with their vector numbers)
any different from other reserved, acronym-less vectors? I particularly
didn't suggest to pretend they don't exist; instead I did suggest that
they are as reserved as, say, vector 0x18. By inventing an acronym and
logging this instead of the vector number you'll make people other than
you have to look up what the odd acronym means iff such an exception
ever got raised.

Jan


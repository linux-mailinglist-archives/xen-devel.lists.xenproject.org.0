Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB036E7EA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:25:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119825.226543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2uH-0004H3-RQ; Thu, 29 Apr 2021 09:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119825.226543; Thu, 29 Apr 2021 09:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2uH-0004Gh-OE; Thu, 29 Apr 2021 09:24:25 +0000
Received: by outflank-mailman (input) for mailman id 119825;
 Thu, 29 Apr 2021 09:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2uG-0004Gc-Dc
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:24:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 287a7591-3749-4d46-8285-f0391eb17a10;
 Thu, 29 Apr 2021 09:24:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90D8CB004;
 Thu, 29 Apr 2021 09:24:22 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 287a7591-3749-4d46-8285-f0391eb17a10
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619688262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=knfMbILYQH2XVxt+stei43N3k9ZVl38cxLCI2LaNVv0=;
	b=nG2q2HXnUKPt4dsyQ/OVx+B/DhTKMvaTG5cDyrVQJkbqR9O2kBZIbLWgjg+dff5WLdwYES
	X+6zKfuEC9w9P3KPi1FWHPIFLRJOpJ+yAtnbQXhLvI7oKy4QTk9jyRxyM+dpvQnxQQcuxt
	qSyVjCpYByyKbR3SXPdxz5eOYg75TLU=
Subject: Ping: [PATCH] x86emul: fix test harness build for gas 2.36
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <723af87e-329d-6f52-ece4-fc3314796960@suse.com>
 <5e6f7769-ba07-bccb-9d73-4c7c0db67f89@citrix.com>
 <62d6134b-cf49-275e-d1a8-1b47d9152888@suse.com>
Message-ID: <c6bff966-4341-8648-49d6-b243a2d821ac@suse.com>
Date: Thu, 29 Apr 2021 11:24:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <62d6134b-cf49-275e-d1a8-1b47d9152888@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 19.04.2021 17:51, Jan Beulich wrote:
> On 19.04.2021 17:41, Andrew Cooper wrote:
>> On 19/04/2021 16:30, Jan Beulich wrote:
>>> All of the sudden, besides .text and .rodata and alike, an always
>>> present .note.gnu.property section has appeared. This section, when
>>> converting to binary format output, gets placed according to its
>>> linked address, causing the resulting blobs to be about 128Mb in size.
>>> The resulting headers with a C representation of the binary blobs then
>>> are, of course all a multiple of that size (and take accordingly long
>>> to create). I didn't bother waiting to see what size the final
>>> test_x86_emulator binary then would have had.
>>>
>>> See also https://sourceware.org/bugzilla/show_bug.cgi?id=27753.
>>>
>>> Rather than figuring out whether gas supports -mx86-used-note=, simply
>>> remove the section while creating *.bin.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/tools/tests/x86_emulator/testcase.mk
>>> +++ b/tools/tests/x86_emulator/testcase.mk
>>> @@ -12,11 +12,11 @@ all: $(TESTCASE).bin
>>>  %.bin: %.c
>>>  	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $<
>>>  	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $*.tmp $*.o
>>> -	$(OBJCOPY) -O binary $*.tmp $@
>>> +	$(OBJCOPY) -O binary -R .note.gnu.property $*.tmp $@
>>>  	rm -f $*.tmp
>>>  
>>>  %-opmask.bin: opmask.S
>>>  	$(CC) $(filter-out -M% .%,$(CFLAGS)) -c $< -o $(basename $@).o
>>>  	$(LD) $(LDFLAGS_DIRECT) -N -Ttext 0x100000 -o $(basename $@).tmp $(basename $@).o
>>> -	$(OBJCOPY) -O binary $(basename $@).tmp $@
>>> +	$(OBJCOPY) -O binary -R .note.gnu.property $(basename $@).tmp $@
>>>  	rm -f $(basename $@).tmp
>>
>> Hmm - this is very ugly.  We don't really want to be stripping this
>> information, because it covers various properties of the binary which
>> need not to be lost, including stack-clash mitigations, and CET status.
> 
> Could you clarify who you think wants to consume this information from
> these format-less binary blobs? They're strictly internal to the test
> harness.
> 
>> We might be able to get away with saying that we're operating strictly
>> with defaults, and folding these *.bin's back into a program which is
>> also linked with defaults, at which point the resulting binary ought to
>> end up with a compatible .note.gnu.property section, but I'm not sure
>> how convinced I am by this argument.
> 
> Well, if we want to make it complicated, we could of course extract
> the notes into a separate ELF object, and include that object in the
> linking process. But these notes are wrong anyway: Whichever insns the
> blobs use, test_x86_emulator does _not_ need CPU support for them, as
> it'll suitably avoid executing any of the blobs. Similarly stack and
> CET related information is not of interest for the blobs, only for the
> "normal" object files.

Besides there not having been any response from you so far, I'd like to
point out that stripping the section is also what H.J. suggests in the
referenced bugzilla entry. (As said there, I don't view this as an
excuse to break use cases like ours by default, but that's orthogonal.)

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCC36907F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116093.221539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtJG-0001yb-79; Fri, 23 Apr 2021 10:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116093.221539; Fri, 23 Apr 2021 10:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtJG-0001yE-45; Fri, 23 Apr 2021 10:45:18 +0000
Received: by outflank-mailman (input) for mailman id 116093;
 Fri, 23 Apr 2021 10:45:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtJE-0001xz-G8
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:45:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d0d4d02-307f-436f-ba9d-2e1f935d08d5;
 Fri, 23 Apr 2021 10:45:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3CE7AFE6;
 Fri, 23 Apr 2021 10:45:14 +0000 (UTC)
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
X-Inumbo-ID: 4d0d4d02-307f-436f-ba9d-2e1f935d08d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619174714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JdrIaMPT2kQNkCRzSufS4y3iIccV3WIfQ36B2QepM8Q=;
	b=F6OA6zBFwYowoTi5mL7ruNxq4nRZAKS1B+D63XzFQciVxx8ij8qMovOBCYjB6pqTIFeOlU
	CKGein2UNAT6IffJ1tuauxYvM0L+UMCZJSLrMZQPqG9GQftx3z0n/bvEg2TIWvbpFv2Szd
	biGkSnoSNjr725bH2Qf27vRLf5KsGlQ=
Subject: Re: [PATCH 7/8] x86/EFI: keep debug info in xen.efi
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <YIBFD4i6bLaeaXdE@Air-de-Roger>
 <3cda296d-e88e-5fe0-4924-4cf974c4f909@suse.com>
 <YIEwW3HQuTtgWH5M@Air-de-Roger>
 <a00cfe95-06bd-4999-05ab-cae737ab6f4c@suse.com>
 <YIGOrOL+pKGaHqwX@Air-de-Roger>
 <8fabc56b-8e2d-96cd-e9b2-81bf38777d52@suse.com>
 <YIGcE5Cr+xK4K6gw@Air-de-Roger>
 <98431d14-d4a0-61a8-148e-221652f37b61@suse.com>
 <YIJ3icwAoGEW/AO+@Air-de-Roger>
 <32bba278-12cc-d105-7b95-6a788992d70c@suse.com>
 <YIKcS0o/9A0whxa/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c0edf6b1-46ea-e246-223e-b60356c928d6@suse.com>
Date: Fri, 23 Apr 2021 12:45:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIKcS0o/9A0whxa/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 23.04.2021 12:07, Roger Pau Monné wrote:
> On Fri, Apr 23, 2021 at 10:51:40AM +0200, Jan Beulich wrote:
>> On 23.04.2021 09:30, Roger Pau Monné wrote:
>>> /*
>>>  * Explicitly list debug section for the PE output so that they don't
>>>  * end up at VA 0 which is below image base and thus invalid. Also use
>>>  * the NOLOAD directive, even when currently ignored by PE output, in
>>>  * order to note those sections shouldn't be loaded into memory.
>>>  *
>>>  * Note such sections are past _end, so if loaded will be discarded by
>>>  * Xen anyway.
>>>  */
>>>
>>> Feel free to reword or expand the comment.
>>
>> Yes, I've edited it some while inserting. Will see to get to
>> submitting v2 then.
>>
>>> Not sure there's some
>>> reference we could add here about how debug sections are placed in PE
>>> files usually.
>>
>> As said before - I don't think there's any "usually" here, which is
>> why different environments have invented different ways. The debug
>> info native to COFF is more like ELF's symbol table (with a little
>> bit of extra information) plus Dwarf's .debug_line, but not really
>> fully covering what you'd expect from debug info.
> 
> One last thing, do you know if the newly added debug_* sections get
> the IMAGE_SCN_MEM_DISCARDABLE section flag set?

At least with an up-to-date ld (i.e. one meeting the requirements so
we wouldn't force debug info to be stripped) they do.

> Not sure there's a way we can force it from the linker script TBH, but
> would be nice and seems to be a recommended flag for debug sections
> according to Microsoft [0].

The linker does this for debugging sections irrespective of what the
linker script says:

   if ((sec_flags & SEC_DEBUGGING) != 0)
     styp_flags |= IMAGE_SCN_MEM_DISCARDABLE;

Jan


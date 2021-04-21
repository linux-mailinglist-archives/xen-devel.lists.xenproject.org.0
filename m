Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB7366E3B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114729.218687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDs7-0004i1-Up; Wed, 21 Apr 2021 14:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114729.218687; Wed, 21 Apr 2021 14:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDs7-0004hc-R3; Wed, 21 Apr 2021 14:30:31 +0000
Received: by outflank-mailman (input) for mailman id 114729;
 Wed, 21 Apr 2021 14:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZDs6-0004hX-1d
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:30:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f152367-d26c-4961-9317-311a5c203ffe;
 Wed, 21 Apr 2021 14:30:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 829C0B4CD;
 Wed, 21 Apr 2021 14:30:28 +0000 (UTC)
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
X-Inumbo-ID: 9f152367-d26c-4961-9317-311a5c203ffe
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619015428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1ll3+pWW8Gbe3Jp+0VuiCL+/jIP4oCBP3T9uat6pkQ=;
	b=H8dJ8r4n90WnrHd8erLK8TUK6EWCOtLmdPXR1WvgysKpPZmbMW/V9jg9xFF+AaE/QHYTOW
	i5i9U9435Q7Su1VPETR31Ig8x+qqUWwZSMCag8hem2SBxbi5dwN1VMhXrBV5Z9yNJ2CVv4
	4M5UqSwoee++XUSMkcxKxAzV5bvEbGo=
Subject: Re: [PATCH 3/8] x86/EFI: program headers are an ELF concept
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <017478f9-76d2-4dc4-de93-b662c4552968@suse.com>
 <YH/sLn+g/7wsZUDy@Air-de-Roger>
 <69abcc03-7ffc-10e2-0de3-26c6c84a6d26@suse.com>
 <YIA046qIRcLsiOPY@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bcea78d4-d77a-44fa-6e68-6905048e8418@suse.com>
Date: Wed, 21 Apr 2021 16:30:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIA046qIRcLsiOPY@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 16:21, Roger Pau Monné wrote:
> On Wed, Apr 21, 2021 at 12:36:16PM +0200, Jan Beulich wrote:
>> On 21.04.2021 11:11, Roger Pau Monné wrote:
>>> On Thu, Apr 01, 2021 at 11:45:09AM +0200, Jan Beulich wrote:
>>>> While they apparently do no harm when building xen.efi, their use is
>>>> potentially misleading. Conditionalize their use to be for just the ELF
>>>> binary we produce.
>>>>
>>>> No change to the resulting binaries.
>>>
>>> The GNU Linker manual notes that program headers would be ignored when
>>> not generating an ELF file, so I'm not sure it's worth us adding more
>>> churn to the linker script to hide something that's already ignored by
>>> ld already.
>>>
>>> Maybe adding a comment noting program headers are ignored when not
>>> generating an ELF output would be enough?
>>
>> Maybe, but I'd prefer this to be explicit, and I'd prefer for efi.lds
>> to not have any PE-unrelated baggage. The churn by this patch isn't
>> all this significant, is it? In fact in two cases it actually deletes
>> meaningless stuff.
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I would prefer if the new PHDR macro was used for all program headers
> directives for consistency though.

Well, yes, I can certainly do so.

Jan


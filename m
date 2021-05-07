Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9135D3761D5
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123821.233633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levnu-0002Y8-8M; Fri, 07 May 2021 08:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123821.233633; Fri, 07 May 2021 08:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levnu-0002Vj-5N; Fri, 07 May 2021 08:25:46 +0000
Received: by outflank-mailman (input) for mailman id 123821;
 Fri, 07 May 2021 08:25:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1levns-0002Vb-8V
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:25:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2951210f-fd18-43b1-bf02-dd7eab40f013;
 Fri, 07 May 2021 08:25:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99048AD21;
 Fri,  7 May 2021 08:25:42 +0000 (UTC)
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
X-Inumbo-ID: 2951210f-fd18-43b1-bf02-dd7eab40f013
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620375942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4g32LixRQqC5xw6jvIWDLSjRncG5ffzm2Z8swxeyQ6M=;
	b=Ygk7G/moxEZmEDujNkiQQUg+H4qYqaBD4bV8U1WVDsaDfT9eO3GJlNX3OWrlQKfpOnLehG
	vTmD8ZM3jeS1YEijIc4GFSKqWowgcBr2HPHoUNOrxnI4nnMaJm0bA7/ZN+CnHLM6TInwTW
	XosqXoOCz4wNJM4sx728+xRwhveGcmM=
Subject: Ping: [PATCH] x86/AMD: also determine L3 cache size
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7ffeec9f-2ce4-9122-4699-32c3ffb06a5d@suse.com>
 <3ff79e34-da70-85c3-0324-efa50313d5b4@citrix.com>
 <487bed52-bd1d-ceee-a85a-9bed9aad4712@suse.com>
Message-ID: <ebfb246f-ace8-f0eb-1860-70f74d894b4c@suse.com>
Date: Fri, 7 May 2021 10:25:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <487bed52-bd1d-ceee-a85a-9bed9aad4712@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.04.2021 11:21, Jan Beulich wrote:
> On 16.04.2021 16:21, Andrew Cooper wrote:
>> On 16/04/2021 14:20, Jan Beulich wrote:
>>> For Intel CPUs we record L3 cache size, hence we should also do so for
>>> AMD and alike.
>>>
>>> While making these additions, also make sure (throughout the function)
>>> that we don't needlessly overwrite prior values when the new value to be
>>> stored is zero.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> I have to admit though that I'm not convinced the sole real use of the
>>> field (in flush_area_local()) is a good one - flushing an entire L3's
>>> worth of lines via CLFLUSH may not be more efficient than using WBINVD.
>>> But I didn't measure it (yet).
>>
>> WBINVD always needs a broadcast IPI to work correctly.
>>
>> CLFLUSH and friends let you do this from a single CPU, using cache
>> coherency to DTRT with the line, wherever it is.
>>
>>
>> Looking at that logic in flush_area_local(), I don't see how it can be
>> correct.  The WBINVD path is a decomposition inside the IPI, but in the
>> higher level helpers, I don't see how the "area too big, convert to
>> WBINVD" can be safe.
>>
>> All users of FLUSH_CACHE are flush_all(), except two PCI
>> Passthrough-restricted cases. MMUEXT_FLUSH_CACHE_GLOBAL looks to be
>> safe, while vmx_do_resume() has very dubious reasoning, and is dead code
>> I think, because I'm not aware of a VT-x capable CPU without WBINVD-exiting.
> 
> Besides my prior question on your reply, may I also ask what all of
> this means for the patch itself? After all you've been replying to
> the post-commit-message remark only so far.

As for the other patch just pinged again, unless I hear back on the
patch itself by then, I'm intending to commit this the week after the
next one, if need be without any acks.

Jan


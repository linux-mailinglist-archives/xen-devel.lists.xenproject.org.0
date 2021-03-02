Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A113329BEA
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 12:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92276.174121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH33A-0007GC-S0; Tue, 02 Mar 2021 11:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92276.174121; Tue, 02 Mar 2021 11:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH33A-0007Fn-Od; Tue, 02 Mar 2021 11:18:48 +0000
Received: by outflank-mailman (input) for mailman id 92276;
 Tue, 02 Mar 2021 11:18:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH339-0007Fh-2W
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 11:18:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a60a581-d842-4e71-9d19-8237bb75449b;
 Tue, 02 Mar 2021 11:18:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BACC3ABF4;
 Tue,  2 Mar 2021 11:18:45 +0000 (UTC)
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
X-Inumbo-ID: 0a60a581-d842-4e71-9d19-8237bb75449b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614683925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZZglwz4ylrWmHpmpqth6+F07GG7xvHr4x3S8gM8slw=;
	b=I/nR6SiTPKIHtpA9zHOsjzmm/vO8PD7KIQV2bKeah+BxX0T8938h6FAth6o6l9hhHwHcYU
	qf2AT1XoYeib0ui5GCteXBngmwc7P7U9tGNXHrNvMM+wCKpHK3rGlXLDQmN2EeGrZPgiOw
	L6+fB1BcsnyUrNCZb2SIa4jdmSwovRM=
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <YDzzt1CXau8vKCn1@Air-de-Roger>
 <a0664115-2b36-7a56-2814-bb234fb379cf@suse.com>
 <YD0rtgJgIN2FxEex@Air-de-Roger>
 <9b0a5689-fced-d986-3bfb-9ade47cf3635@suse.com>
 <YD4aKmAaYZ5xdTzP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <638c8ff4-d853-69b1-a6a0-1778b342ac8f@suse.com>
Date: Tue, 2 Mar 2021 12:18:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YD4aKmAaYZ5xdTzP@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.03.2021 11:57, Roger Pau Monné wrote:
> On Tue, Mar 02, 2021 at 10:59:37AM +0100, Jan Beulich wrote:
>> On 01.03.2021 19:00, Roger Pau Monné wrote:
>>> On Mon, Mar 01, 2021 at 04:14:26PM +0100, Jan Beulich wrote:
>>>> On 01.03.2021 15:01, Roger Pau Monné wrote:
>>>>> On Mon, Mar 01, 2021 at 09:31:07AM +0100, Jan Beulich wrote:
>>>>>> In this case the compiler is recognizing that no valid array indexes
>>>>>> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
>>>>>> ...)), but oddly enough isn't really consistent about the checking it
>>>>>> does (see the code comment).
>>>>>
>>>>> I assume this is because of the underlying per_cpu access to
>>>>> __per_cpu_offset using cpu as the index, in which case wouldn't it be
>>>>> better to place the BUG_ON there?
>>>>
>>>> Not sure, to be honest. It seemed more logical to me to place it
>>>> next to where the issue is.
>>>
>>> I'm not sure whether I would prefer to place it in per_cpu directly to
>>> avoid similar issues popping up in other parts of the code in the
>>> future?
>>
>> That's going to be a lot of BUG_ON(), and hence a lot of "ud2"
>> instances. Not something I'm keen on having. The more that it's
>> not the per_cpu() which triggers the warning, but separate
>> conditionals allowing the compiler to deduce value ranges of
>> variables.
> 
> Right. I don't see much other way around this then. Did you check with
> clang also?

No, I didn't. But if anything it would require further additions,
surely no less.

> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan


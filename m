Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E68D7A28ED
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 23:06:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603416.940405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFzx-0002jf-0S; Fri, 15 Sep 2023 21:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603416.940405; Fri, 15 Sep 2023 21:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFzw-0002h0-TC; Fri, 15 Sep 2023 21:05:08 +0000
Received: by outflank-mailman (input) for mailman id 603416;
 Fri, 15 Sep 2023 21:05:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qhFzv-0002gu-RT
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 21:05:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhFzq-0007rW-Pr; Fri, 15 Sep 2023 21:05:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhFzq-0000en-H9; Fri, 15 Sep 2023 21:05:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=kTemnMc3rDaEtN0QdmHobWjIlXASyh3yAX3MRSbS8Gc=; b=jBYjOZqawgWjgnLnQwHGIT5rXV
	HIbt4QZVsqJ3P7ZbJt15mC3O4N7ErH3dK3oXcUHrsPry1WO+RBrfQ8UEcufap+q4oowSxDxlDLYAl
	YWDKKhaU1KZj/6yaqUzZxNScQR+kfi4XA5ffL4HgzgaaeWHQDvum5/948/6E6hDgASlk=;
Message-ID: <3edff64e-8c3a-d5d4-b466-d9771c365702@xen.org>
Date: Fri, 15 Sep 2023 22:05:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 for-4.18?] x86: support data operand independent timing
 mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>,
 Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <54005c49-b012-8265-246e-22b03a87f724@suse.com>
 <e4ab7415-cf72-4c04-93dd-fd393f49f6f5@xen.org>
 <dfbbf38c-8651-5396-c966-365fe954df48@suse.com>
 <bfe3a681-7dbd-462c-9a8c-969d5a99aaa1@xen.org>
 <e7618567-0108-ce7a-de78-df14f13740fc@suse.com>
 <3c0ce6b3-6b26-4265-b560-11faef768e0f@xen.org>
 <66b6f226-bff9-7d05-33e9-3ee93bf04662@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <66b6f226-bff9-7d05-33e9-3ee93bf04662@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/09/2023 12:01, Jan Beulich wrote:
> On 14.09.2023 11:18, Julien Grall wrote:
>> On 14/09/2023 10:11, Jan Beulich wrote:
>>> On 14.09.2023 11:04, Julien Grall wrote:
>>>> On 14/09/2023 07:32, Jan Beulich wrote:
>>>>> On 13.09.2023 19:56, Julien Grall wrote:
>>>>>> If not, I think we should taint Xen and/or print a message if the admin
>>>>>> requested to use DIT. This would make clear that the admin is trying to
>>>>>> do something that doesn't work.
>>>>>
>>>>> Tainting Xen on all hardware not exposing the bit would seem entirely
>>>>> unreasonable to me. If we learned of specific cases where the vendor
>>>>> promises are broken, we could taint there, sure. I guess that would be
>>>>> individual XSAs / CVEs then for each instance.
>>>>
>>>> ... we need to somehow let the user know that the HW it is running on
>>>> may not honor DIT. Tainting might be a bit too harsh, but I think
>>>> printing a
>>>> message with warning_add() is necessary.
>>>
>>> But Intel's claim is that with the bit unavailable hardware behaves as
>>> if DIT was in effect.
>>
>> I am confused. Above, you suggested it cannot be guaranteed. So I
>> interpreted we don't know what's happening on any processor.
> 
> Right. We can trust vendors, or not.
> 
>> So where
>> you referring to...
>>
>>
>>    Therefore you're still suggesting to emit a
>>> warning on most of Intel's hardware and on all non-Intel one.
>>
>> ... non-Intel HW?
>>
>>> That's
>>> going too far, imo.
>>
>> We could restrict the warning to non-Intel platform.
> 
> That still goes too far imo. I'm not convinced we should cover for
> vendor uncertainty here. We can't make a system any safer than its
> hardware is, in this regard. We simply have no (or not enough)
> influence on the internal workings of their pipelines.
Fair enough. I would still prefer a message in the log but ...

> 
> What I have done is add a sentence to the command line option's
> documentation:
> 
> "Note that enabling this option cannot guarantee anything beyond what
>   underlying hardware guarantees (with, where available and known to Xen,
>   respective tweaks applied)."
> 
> Plus I've further qualified the option:
> 
> ### dit (x86/Intel)

... I am also happy with these two changes.

Cheers,

-- 
Julien Grall


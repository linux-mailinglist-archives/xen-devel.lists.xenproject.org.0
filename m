Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F135744B058
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 16:29:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224041.387085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkT30-00077x-RF; Tue, 09 Nov 2021 15:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224041.387085; Tue, 09 Nov 2021 15:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkT30-00075c-O8; Tue, 09 Nov 2021 15:28:30 +0000
Received: by outflank-mailman (input) for mailman id 224041;
 Tue, 09 Nov 2021 15:28:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkT2z-00075W-BC
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 15:28:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkT2y-0001cR-FS; Tue, 09 Nov 2021 15:28:28 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.22.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkT2y-0007XH-9F; Tue, 09 Nov 2021 15:28:28 +0000
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
	bh=3bzJbYoNtvxbfeMp6Wh5AaJ2nBv2+5/oBc7+qdWT0oQ=; b=qfY1BIR5GFrr3m7vjP9j/Z0w7G
	Dg5T6mwYqgCJoWzchSMtya/52Tnkx4Q3cW/I4XzEe0SJKSWtEKlepYJuWLdtcHf/NIep50QB4Iq5R
	lSIHYJd1gfhFAjBCEhwMbJPSQkOv63Y/eenKxGtzHxMMTe2/zrnYZywaxGe/q5+PH1K0=;
Message-ID: <0d79cc56-f3e8-bf6a-4ed9-ac2fe64aba43@xen.org>
Date: Tue, 9 Nov 2021 15:28:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain
 destruction"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyxia@amazon.com>, Dmitry Isaikin
 <isaikin-dmitry@yandex.ru>, Ian Jackson <iwj@xenproject.org>
References: <20211109143128.56089-1-roger.pau@citrix.com>
 <a708312d-ab1b-4784-b1fe-01dbb680e7e9@xen.org>
 <YYqL9nViQiDw9C30@Air-de-Roger>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YYqL9nViQiDw9C30@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/11/2021 14:55, Roger Pau Monné wrote:
> On Tue, Nov 09, 2021 at 02:42:58PM +0000, Julien Grall wrote:
>> Hi Roger,
>>
>> On 09/11/2021 14:31, Roger Pau Monne wrote:
>>> This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
>>>
>>> Performance analysis has shown that dropping the domctl lock during
>>> domain destruction greatly increases the contention in the heap_lock,
>>> thus making parallel destruction of domains slower.
>>>
>>> The following lockperf data shows the difference between the current
>>> code and the reverted one:
>>>
>>> lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
>>> lock:  2788704(0.362311723s), block:   222681( 0.091152276s)
>>
>> Thanks for the numbers, this is already an improvement from the reverted.
>>
>> Can you also please provide some details on the setup that was used to get
>> the number? (e.g. how many guests, amount of memory...).
> 
> Those are from Dmitry, and are gathered after destroying 5 guests in
> parallel. Given his previous emails he seems to use 2GB HVM guests for
> other tests, so I would assume that's the case for the lock profile data
> also (albeit it's not said explicitly):
> 
> https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01515.html
> 
> I'm not sure it's worth adding this explicitly, as it's not a very
> complex test case. Probably any attempts to destroy a minimal amount
> of guests in parallel (5?) will already show the lock contention in
> the profiling.

In this case, I am not too concerned about not been able to reproduce 
it. However, I think it is a good practice to always post the setup 
along with the numbers.

This makes easier to understand the context of the patch and avoid 
spending time digging into the archives to find the original report.

Anyway, you already wrote everything above. So this is a matter of 
adding your first paragraph in the commit message + maybe a link to the 
original discussion(s).

Cheers,

-- 
Julien Grall


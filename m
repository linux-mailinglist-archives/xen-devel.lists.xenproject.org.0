Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8899334ECA0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Mar 2021 17:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103600.197588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGOS-0004nS-Mq; Tue, 30 Mar 2021 15:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103600.197588; Tue, 30 Mar 2021 15:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRGOS-0004n3-Jp; Tue, 30 Mar 2021 15:35:00 +0000
Received: by outflank-mailman (input) for mailman id 103600;
 Tue, 30 Mar 2021 15:34:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRGOR-0004my-HB
 for xen-devel@lists.xenproject.org; Tue, 30 Mar 2021 15:34:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRGOR-00079Q-Bs; Tue, 30 Mar 2021 15:34:59 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRGOR-0000qJ-4g; Tue, 30 Mar 2021 15:34:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ENy+w1fUJSGrmxhLkjF6WQR4E5cG0tivYMMh+onII4Q=; b=zq5wQIxdBGKBPWqwIdZNy1obkX
	v22NJ2j4X+sGz2AbU22MEqmA+b9bV07uROmbBr3W2/0lPqVA5qrXWljEwlzq7intTXJ0b2tMThvo8
	EJP0rzvj8gdEumY1DP6mhoffKuM3rxybU7l+0CS63Wei/XcjuCjxK4QTodHhmgI03VoQ=;
Subject: Re: [PATCH v2 for-4.15 3/7] CHANGELOG.md: Add dom0/domU zstd
 compression support
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien.grall.oss@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
References: <20210329161457.345360-1-george.dunlap@citrix.com>
 <20210329161457.345360-3-george.dunlap@citrix.com>
 <CAJ=z9a0DxKKkLGMDK1nisVsefwE=8RQcD8M4vpOO1QopjzZtjw@mail.gmail.com>
 <87E259CB-2BB4-4BAE-9916-BE46584E0EF4@citrix.com>
 <c2610906-bae2-520d-a8c3-da37849d96aa@xen.org>
 <672c88ac-8373-6629-4d2f-0d1e86c103cd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <92f0b44a-84de-457c-ba04-896644382905@xen.org>
Date: Tue, 30 Mar 2021 16:34:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <672c88ac-8373-6629-4d2f-0d1e86c103cd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/03/2021 11:56, Jan Beulich wrote:
> On 30.03.2021 12:14, Julien Grall wrote:
>>
>>
>> On 30/03/2021 11:08, George Dunlap wrote:
>>>
>>>
>>>> On Mar 29, 2021, at 7:54 PM, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>>>
>>>> Hi George,
>>>>
>>>> On Mon, 29 Mar 2021 at 17:15, George Dunlap <george.dunlap@citrix.com> wrote:
>>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>>> index 8c89212f14..538eae611c 100644
>>>>> --- a/CHANGELOG.md
>>>>> +++ b/CHANGELOG.md
>>>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>    - ARM SMMUv3 (Tech Preview)
>>>>>    - Intel Processor Trace support (Tech Preview)
>>>>>    - Named PCI devices for xl/libxl
>>>>> + - Support for zstd-compressed dom0 and domU kernels
>>>>
>>>> Looking at the log, the feature looks x86 only (at least the dom0 part).
>>>
>>> Oh, interesting.  So what about the following?
>>>
>>> - Support for zstd-compressed dom0 (x86) and domU kernels
>>
>> Sounds fine to me. Note that I haven't tried zstd-compressed for domu
>> Kernel on Arm.
>>
>> Maybe the author (Jan) can confirm whether this was plumbed in common
>> libxc code?
> 
> Well, I've followed the model used for other compression methods. I have
> no idea what this means or does not mean for Arm; in fact so far I was
> under the impression that like in the hypervisor decompression support
> was an x86-only feature, but from what you say I conclude I have been
> wrong with this.

We support gzip for dom0. For guests, I am not entirely sure what the 
state as I tend to uncompressed kernel every time.

Cheers,

-- 
Julien Grall


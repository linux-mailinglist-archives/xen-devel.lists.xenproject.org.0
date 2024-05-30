Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C18D5109
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 19:29:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732909.1138958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjam-0006vX-NU; Thu, 30 May 2024 17:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732909.1138958; Thu, 30 May 2024 17:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCjam-0006u1-KO; Thu, 30 May 2024 17:29:32 +0000
Received: by outflank-mailman (input) for mailman id 732909;
 Thu, 30 May 2024 17:29:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCjal-0006tv-BU
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 17:29:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCjal-00043d-6p; Thu, 30 May 2024 17:29:31 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCjal-00010w-0L; Thu, 30 May 2024 17:29:31 +0000
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
	bh=qXxktVINme67eJbU5IwzWEPPmpeaXo2Dihp5Mrl7cJo=; b=xUPA+ZHrgZcgp6EBAUQ3duPx/q
	vXxkNZc2aX4KSfUN9Xvkw29ALHfV4Xw33ipn95FSjvtL5z1Bsc2CRnj3dyi84BjiLJRGhMAY5RhZK
	ooxXoKdqp054Im401SJo8DP+E8QHA97SAsXYzkW+u9OzyOR+fesIAA38NONrtWB9S+fY=;
Message-ID: <e246d628-83c9-4021-b32b-3a30e0dfcf6a@xen.org>
Date: Thu, 30 May 2024 18:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 8/8] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org,
 Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <c6ff49af9a107965f8121862e6b32c24548956e6.1717008161.git.oleksii.kurochko@gmail.com>
 <065c4b2f-93b6-428f-beca-b77e6f98cecc@citrix.com>
 <27148c63318ef78d542db7cc20373e3cb3836df3.camel@gmail.com>
 <8f37cb67-32ae-4e01-af60-f94af136698f@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8f37cb67-32ae-4e01-af60-f94af136698f@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 30/05/2024 18:22, Andrew Cooper wrote:
> On 30/05/2024 6:16 pm, Oleksii K. wrote:
>> On Thu, 2024-05-30 at 17:47 +0100, Andrew Cooper wrote:
>>> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>>>> diff --git a/README b/README
>>>> index c8a108449e..30da5ff9c0 100644
>>>> --- a/README
>>>> +++ b/README
>>>> @@ -48,6 +48,10 @@ provided by your OS distributor:
>>>>         - For ARM 64-bit:
>>>>           - GCC 5.1 or later
>>>>           - GNU Binutils 2.24 or later
>>>> +      - For RISC-V 64-bit:
>>>> +        - GCC 12.2 or later
>>>> +        - GNU Binutils 2.39 or later
>>>> +          Older GCC and GNU Binutils would work, but this is not a
>>>> guarantee.
>>> This sentence isn't appropriate to live here.
>>>
>>> The commit message saying "this is what we run in CI" is perfectly
>>> good
>>> enough.
>>>
>>> With this dropped, Reviewed-by: Andrew Cooper
>>> <andrew.cooper3@citrix.com>.  Can fix on commt.
>> I am okay with dropping this sentence, but someone ( unfortunately I
>> don't remember who Jan? Julien? ) requested it, and I think it would be
>> nice to hear their opinion before doing so.

I don't think it was me :). I have no issue with dropping the line.

> 
> It's line noise, and literally a redundant statement.  The same is true
> of every other line in the file,

+1. If anyone wanted extra clarify, we could spell out at the beginning 
of the file that this is the versions are confident with.

Cheers,

-- 
Julien Grall


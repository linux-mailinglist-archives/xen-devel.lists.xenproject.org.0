Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 813123419E4
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 11:27:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99161.188371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCLE-0005wp-Q9; Fri, 19 Mar 2021 10:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99161.188371; Fri, 19 Mar 2021 10:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCLE-0005wP-Md; Fri, 19 Mar 2021 10:26:52 +0000
Received: by outflank-mailman (input) for mailman id 99161;
 Fri, 19 Mar 2021 10:26:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNCLC-0005wK-Qb
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 10:26:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNCLA-0000of-RK; Fri, 19 Mar 2021 10:26:48 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNCLA-0004sx-LG; Fri, 19 Mar 2021 10:26:48 +0000
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
	bh=ByQsvHaWqbqT7IjMthJp1f64qUUUnq8G2JVmLNsveYc=; b=Lzg1LRFldjcOt+b5GAg8S2oMNq
	uV1rTruFVSg1g7o8fPk6b7peuO9kijmDKH74DqTu/AEFl2zgt5p386xSFVA0ZEr9T94AO2pP2eBQt
	9ls+ffnBUovz86mg0m7mgpDwMwI+zzm6LJcK3L3vV8Iz4nrHkkuu9x5j2cF/WVuuOmGo=;
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
 <24658.6228.390535.850901@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bfd91242-d9a3-22a3-5ff9-31d461bfd8da@xen.org>
Date: Fri, 19 Mar 2021 10:26:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <24658.6228.390535.850901@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 17/03/2021 14:55, Ian Jackson wrote:
> Julien Grall writes ("Re: preparations for 4.13.3"):
>> On 08/03/2021 09:49, Jan Beulich wrote:
>>> All,
>>>
>>> the release is overdue (my apologies). Please point out backports
>>> you find missing from the respective staging branches, but which
>>> you consider relevant.
>>>> Ones that I have queued already, but which hadn't passed the push
>>> gate to master yet when doing a swipe late last week, are
>>>
>>> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
>>> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization without reserved bits
>>> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when running virtualized
>>
>> I would like to also consider the following one:
>>
>> 28804c0ce9fd SUPPORT.MD: Clarify the support state for the Arm SMMUv{1,
>> 2} drivers (4.11+ as updating the security support)
>> 067935804a8e xen/vgic: Implement write to ISPENDR in vGICv{2, 3} (4.13+)
>>       To support newer kernel on stable Xen
>> d81133d45d81 xen/arm: Add workaround for Cortex-A53 erratum #843419 (4.13+)
>> fd7479b9aec2 xen/arm: Add workaround for Cortex-A55 erratum #1530923 (4.13+)
>> 5505f5f8e7e8 xen/arm: Add Cortex-A73 erratum 858921 workaround (4.13+)
>> 63b4c9bfb788 xen/arm: mm: Access a PT entry before the table is unmapped
>> (4.13 only)
>> f6790389613c xen/arm: sched: Ensure the vCPU context is seen before
>> vcpu_pause() returns (4.13 only)
>>
>> I have put in parentheses the list of versions targeted.
> 
> My backport list seems to have very few tools patches on it.
> 
> If anyone has any tools bugfixes that ought to go into 4.13 please do
> let me know!
> 
> Additionally, perhaps this one commit to be backported ?
>    935e0836710ce8cab584155b2844cea8497a5159
>    arm: replace typeof() with __typeof__()

I think it would be useful.

Cheers,

-- 
Julien Grall


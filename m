Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B12D96B0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 11:57:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52121.91200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolX8-00066V-Kp; Mon, 14 Dec 2020 10:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52121.91200; Mon, 14 Dec 2020 10:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kolX8-000669-Hd; Mon, 14 Dec 2020 10:56:50 +0000
Received: by outflank-mailman (input) for mailman id 52121;
 Mon, 14 Dec 2020 10:56:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kolX6-000664-Ej
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 10:56:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kolX5-0003VM-Ml; Mon, 14 Dec 2020 10:56:47 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kolX5-0008Hg-Fa; Mon, 14 Dec 2020 10:56:47 +0000
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
	bh=6+RzVgD5q5DCgFXmvhUasC2LankJp1uJjdkB4X1yTZY=; b=6y7FngxccCVmAdcZeaASuuqYqa
	7uXiYI8B2KLd0fynhadj8GDtluQJQzi6HtDeNxyvfUsx4H03pcEW2AiWDHb7EgRO1LJYXUrnWJ3Ni
	77ZNGu+I9f/KqPjTua1NDphzsEfipNb0xBDXl+WWU2spVy8R3i5uwG5f7LWIpER/yWPU=;
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the
 domain
To: "Shamsundara Havanur, Harsha" <havanur@amazon.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <cover.1607686878.git.havanur@amazon.com>
 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
 <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
 <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bf70db2d-cf03-11cb-887e-aa38094b3d5f@xen.org>
Date: Mon, 14 Dec 2020 10:56:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Harsha,

On 14/12/2020 09:26, Shamsundara Havanur, Harsha wrote:
> On Mon, 2020-12-14 at 09:52 +0100, Jan Beulich wrote:
>> CAUTION: This email originated from outside of the organization. Do
>> not click links or open attachments unless you can confirm the sender
>> and know the content is safe.
>>
>>
>>
>> On 11.12.2020 12:44, Harsha Shamsundara Havanur wrote:
>>> A HVM domain flushes cache on all the cpus using
>>> `flush_all` macro which uses cpu_online_map, during
>>> i) creation of a new domain
>>> ii) when device-model op is performed
>>> iii) when domain is destructed.
>>>
>>> This triggers IPI on all the cpus, thus affecting other
>>> domains that are pinned to different pcpus. This patch
>>> restricts cache flush to the set of cpus affinitized to
>>> the current domain using `domain->dirty_cpumask`.
>>
>> But then you need to effect cache flushing when a CPU gets
>> taken out of domain->dirty_cpumask. I don't think you/we want
>> to do that.
>>
> If we do not restrict, it could lead to DoS attack, where a malicious
> guest could keep writing to MTRR registers or do a cache flush through
> DM Op and keep sending IPIs to other neighboring guests.

I saw Jan already answered about the alleged DoS, so I will just focus 
on the resolution.

I agree that in the ideal situation we want to limit the impact on the 
other vCPUs. However, we also need to make sure the cure is not worse 
than the symptoms.

The cache flush cannot be restricted in all the pinning situation 
because pinning doesn't imply the pCPU will be dedicated to a given vCPU 
or even the vCPU will stick on pCPU (we may allow floating on a NUMA 
socket). Although your setup may offer this guarantee.

My knowledge in this area is quite limited. But below a few question 
that hopefully will help to make a decision.

The first question to answer is: can the flush can be restricted in a 
setup where each vCPUs are running on a decicated pCPU (i.e partionned 
system)?

If the answer is yes, then we should figure out whether using 
domain->dirty_cpumask would always be correct? For instance, a vCPU may 
not have yet run, so can we consider the associated pCPU cache would be 
consistent?

Another line of question is what can we do on system supporting 
self-snooping? IOW, would it be possible to restrict the flush for all 
the setup?

Cheers,

-- 
Julien Grall


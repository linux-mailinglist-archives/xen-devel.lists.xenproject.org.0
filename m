Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F056E31655F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 12:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83572.155830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nqw-0003ZH-W0; Wed, 10 Feb 2021 11:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83572.155830; Wed, 10 Feb 2021 11:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9nqw-0003Ys-Sn; Wed, 10 Feb 2021 11:40:14 +0000
Received: by outflank-mailman (input) for mailman id 83572;
 Wed, 10 Feb 2021 11:40:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9nqv-0003Ym-Aa
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 11:40:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9nqt-0008EJ-Sg; Wed, 10 Feb 2021 11:40:11 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9nqt-0001Bf-Kz; Wed, 10 Feb 2021 11:40:11 +0000
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
	bh=ZBbwv4k8hfMiyXp6KH/O3Aq5Y/ESOsiC/dC8pW32B+M=; b=GpbtRwCgq5M5DS1m4+n3d7ANdy
	iuVNPvcxxb/74xcRwhMY+vCqmVUIeFCqpLghsTf1skWPIlQtCReXno+vXy4UrEfr5CugqqIxvNb4n
	CywKNVERB6lU44idultifMWUUz6BFdiGRZd4JavTsaXJ3jJB8qDdGXRUQqFrJa0TLToA=;
Subject: Re: [for-4.15][PATCH v2 1/5] xen/x86: p2m: Don't map the special
 pages in the IOMMU page-tables
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, hongyxia@amazon.co.uk,
 iwj@xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20210209152816.15792-1-julien@xen.org>
 <20210209152816.15792-2-julien@xen.org> <YCOZbNly7YCSNtHY@Air-de-Roger>
 <5bf0a2de-3f0e-8860-7bc7-f667437aa3a7@suse.com>
 <YCPE0byWKlf/uOFT@Air-de-Roger>
 <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e1c7c616-0941-b577-5842-a51374030798@xen.org>
Date: Wed, 10 Feb 2021 11:40:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <65797b03-7bd8-92e9-b6c7-e8eccde9f8ba@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/02/2021 11:38, Jan Beulich wrote:
> On 10.02.2021 12:34, Roger Pau Monné wrote:
>> On Wed, Feb 10, 2021 at 12:10:09PM +0100, Jan Beulich wrote:
>>> On 10.02.2021 09:29, Roger Pau Monné wrote:
>>>> I get the feeling this is just papering over an existing issue instead
>>>> of actually fixing it: IOMMU page tables need to be properly freed
>>>> during early failure.
>>>
>>> I take a different perspective: IOMMU page tables shouldn't
>>> get created (yet) at all in the course of
>>> XEN_DOMCTL_createdomain - this op is supposed to produce an
>>> empty container for a VM.
>>
>> The same would apply for CPU page-tables then, yet they seem to be
>> created and populating them (ie: adding the lapic access page) doesn't
>> leak such entries, which points at an asymmetry. Either we setup both
>> tables and handle freeing them properly, or we set none of them.
> 
> Where would CPU page tables get created from at this early stage?

When mapping the APIC page in the P2M. I don't think you can get away 
with removing it completely.

Cheers,

-- 
Julien Grall


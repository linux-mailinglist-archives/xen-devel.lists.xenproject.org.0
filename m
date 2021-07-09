Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CDB3C2137
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 11:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153494.283589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mSf-0005WX-QH; Fri, 09 Jul 2021 09:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153494.283589; Fri, 09 Jul 2021 09:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1mSf-0005US-Mw; Fri, 09 Jul 2021 09:06:17 +0000
Received: by outflank-mailman (input) for mailman id 153494;
 Fri, 09 Jul 2021 09:06:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1mSd-0005U8-Tj
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 09:06:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mSc-00053A-AU; Fri, 09 Jul 2021 09:06:14 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1mSc-0004WQ-4B; Fri, 09 Jul 2021 09:06:14 +0000
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
	bh=c79V0Am6xRo3BHBJWrfaUXzbzdRWiRCJ6sMHawdLaIo=; b=3sH96EkQ8t2iRe2Qei2d+roDfg
	78YlGc5nNKnNJjgNrh0myTNzIsajPMs8aOZasAWHJ0MpXrJUK1qjHWJcx5Z2arhQjTTWQq4U28bdh
	TrxqgKU3xURkL+zSbfTGJqqCFmufWRZjuBzYEQ8gaHqQ7jomg1LMxoQpR5T9pLnOUCtM=;
Subject: Re: [PATCH v4 4/5] tools/libs/gnttab: Fix PAGE_SIZE redefinition
 error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1623155575.git.costin.lupu@cs.pub.ro>
 <84d03c4595428e4ff857dcacc72f6b9c04476849.1623155575.git.costin.lupu@cs.pub.ro>
 <90974b14-4a8d-d9dd-f8e9-65eef692d28a@xen.org>
 <f888c8ed-4b5d-6ca1-326e-a3ab5b5f0c94@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <333d749a-a47b-dfb8-fbbe-3f47a7879a06@xen.org>
Date: Fri, 9 Jul 2021 10:06:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f888c8ed-4b5d-6ca1-326e-a3ab5b5f0c94@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 09/07/2021 09:59, Costin Lupu wrote:
> Hi Julien,

Hi Costin,

> 
> On 7/8/21 8:33 PM, Julien Grall wrote:
>> Hi Costin,
>>
>> On 08/06/2021 13:35, Costin Lupu wrote:
>>> If PAGE_SIZE is already defined in the system (e.g. in
>>> /usr/include/limits.h
>>> header) then gcc will trigger a redefinition error because of -Werror.
>>> This
>>> patch replaces usage of PAGE_* macros with XC_PAGE_* macros in order
>>> to avoid
>>> confusion between control domain page granularity (PAGE_* definitions)
>>> and
>>> guest domain page granularity.
>>>
>>> The exception is in osdep_xenforeignmemory_map() where we need the
>>> system page
>>
>> Did you mean osdep_gnttab_grant_map?
>>
> 
> Argh, yes, sorry about that. Can we fix this on upstreaming or should I
> send a new version?

I can do it on commit.

Cheers,

> 
>>> size to check whether the PFN array should be allocated with mmap() or
>>> with
>>> dynamic allocation.
>>>
>>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>>
>> Other than the question above:
>>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>
> 
> Cheers,
> Costin
> 

-- 
Julien Grall


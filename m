Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9432D3EF5
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 10:41:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48056.85010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmvyI-0002PQ-Vx; Wed, 09 Dec 2020 09:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48056.85010; Wed, 09 Dec 2020 09:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmvyI-0002P1-Ss; Wed, 09 Dec 2020 09:41:18 +0000
Received: by outflank-mailman (input) for mailman id 48056;
 Wed, 09 Dec 2020 09:41:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmvyH-0002Ov-Ax
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 09:41:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmvyG-0003ll-2k; Wed, 09 Dec 2020 09:41:16 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmvyF-0003ae-RU; Wed, 09 Dec 2020 09:41:15 +0000
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
	bh=R4sJhaKCXsab7iT7m8N1tJ5o9kZxMmHfCEkyfLNMiSA=; b=yQgbxDNMHmrd4/QQFkEXNfiMJq
	+34D272EPBBURZNCpPJjJH3EnkOvHQi9fIhquyco9hWq2kDUSYjXYYQuewbzUYWA0PIrJ25L8EUB0
	p5nnLu01DIkdELUNtv52bC+l5nsrVlsvk2AlwvC8OBI576se4XhNSJu1hUlR6VKMuqIM=;
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
 <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
 <77534dc3-bdd6-f884-99e3-90dc9b02a81f@citrix.com>
 <59a4e1c1-ea39-1846-92ae-92560db4b1fb@xen.org>
 <e0782c3b-9958-3792-eab9-d3fd6708225f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5fc44865-2115-947c-bd22-b51d7f17d39c@xen.org>
Date: Wed, 9 Dec 2020 09:41:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e0782c3b-9958-3792-eab9-d3fd6708225f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 07/12/2020 10:23, Jan Beulich wrote:
> On 24.11.2020 17:57, Julien Grall wrote:
>> On 24/11/2020 00:40, Andrew Cooper wrote:
>>> On a totally separate point,  I wonder if we'd be better off compiling
>>> with -fgnu89-inline because I can't see any case we're we'd want the C99
>>> inline semantics anywhere in Xen.
>>
>> This was one of my point above. It feels that if we want to use the
>> behavior in Xen, then it should be everywhere rather than just this helper.
> 
> I'll be committing the series up to patch 6 in a minute. It remains
> unclear to me whether your responses on this sub-thread are meant
> to be an objection, or just a comment. Andrew gave his R-b despite
> this separate consideration, and I now also have an ack from Wei
> for the entire series. Please clarify.

It still feels strange to apply to one function and not the others... 
But I don't have a strong objection against the idea of using C99 
inlines in Xen.

IOW, I will neither Ack nor NAck this patch.

> 
> Or actually I only thought I could commit a fair initial part of
> the series - I'm still lacking Arm-side acks for patches 2 and 3
> here.

If you remember, I have asked if Anthony could review the build system 
because he worked on it recently.

Unfortunately, I haven't seen any answer so far... I have pinged him on IRC.

Cheers,

-- 
Julien Grall


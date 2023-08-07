Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFF771CC6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577860.904935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw76-0007tA-Fn; Mon, 07 Aug 2023 09:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577860.904935; Mon, 07 Aug 2023 09:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSw76-0007pp-CP; Mon, 07 Aug 2023 09:01:20 +0000
Received: by outflank-mailman (input) for mailman id 577860;
 Mon, 07 Aug 2023 09:01:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qSw74-0007ph-GU
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:01:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qSw6z-0001Dc-Lw; Mon, 07 Aug 2023 09:01:13 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qSw6z-00055e-Ez; Mon, 07 Aug 2023 09:01:13 +0000
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
	bh=tvpAgZpWu0drG7uizeyAn3qShsucxpZN45X6EvbFQns=; b=ue8JL1dIdYcUVFlNXuss+xO4pb
	ULKPyNxSOOYFWHjWkKOgfZHpiQn2EfGDzf3wSSjTabwCUbQ6UT5Z49Hx753hZzdiId/WvcxFWDivY
	rQbwb54rBitfTuwheRI4mi6HhrkbEeXbWBwPBKDr0z5eQdBO+O8yRugRfzWxcfbbNw9Q=;
Message-ID: <486ba9e1-2bf0-4446-9ac4-33a256f8d51e@xen.org>
Date: Mon, 7 Aug 2023 10:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
 <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
 <fed4b27c-91ec-7605-1a71-a0b7c6d7e2e2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fed4b27c-91ec-7605-1a71-a0b7c6d7e2e2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/08/2023 09:14, Jan Beulich wrote:
> On 04.08.2023 17:27, Nicola Vetrini wrote:
>> --- a/xen/include/xen/delay.h
>> +++ b/xen/include/xen/delay.h
>> @@ -5,6 +5,6 @@
>>   
>>   #include <asm/delay.h>
>>   #define mdelay(n) (\
>> -	{unsigned long msec=(n); while (msec--) udelay(1000);})
>> +	{unsigned long msec_=(n); while (msec_--) udelay(1000);})
> 
> As elsewhere, please also adjust style while touching the line, at
> least as far as the obviously wrong case goes:
> 
> #define mdelay(n) (\
> 	{unsigned long msec_ = (n); while (msec_--) udelay(1000);})
> 
> Even better would be
> 
> #define mdelay(n) ({ \
> 	unsigned long msec_ = (n); while (msec_--) udelay(1000); \
> })

If you are touching the style, about converting to a staging inline and 
also splitting the line in multiple one?

Cheers,

-- 
Julien Grall


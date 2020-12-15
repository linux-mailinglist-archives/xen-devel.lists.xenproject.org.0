Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79C82DB411
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 19:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54763.95317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpFRn-0006th-FH; Tue, 15 Dec 2020 18:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54763.95317; Tue, 15 Dec 2020 18:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpFRn-0006tI-BI; Tue, 15 Dec 2020 18:53:19 +0000
Received: by outflank-mailman (input) for mailman id 54763;
 Tue, 15 Dec 2020 18:53:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kpFRm-0006tD-Cd
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 18:53:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpFRm-0005SK-3K; Tue, 15 Dec 2020 18:53:18 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kpFRl-0003gj-TC; Tue, 15 Dec 2020 18:53:18 +0000
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
	bh=ppg+aSo7YVAKml67KlLFcasfugqH7OiLRYbRXANzKpI=; b=iZ/79tnVaf+eqIrzkZwkq0ukGs
	5vS09m3DHdm3mhaS5kapY2qjI0F6/CQbLPP+ByZkRqSzQf5u+nkz2vE1SPX6jSMMP3aw1AaiSP6FM
	cnFSA1aCSRVI71Y7jEUDDfNZp9PYeHOcf02hVv8zM5N4CydpDh5jyBEoAllvCyUa2KE4=;
Subject: Re: [RFC PATCH v2 10/15] xen/arm64: port Linux's arm64 cmpxchg.h to
 Xen
To: Ash Wilding <ash.j.wilding@gmail.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, rahul.singh@arm.com
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
 <20201111215203.80336-11-ash.j.wilding@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c16534dd-d775-8085-a763-8ee48f380427@xen.org>
Date: Tue, 15 Dec 2020 18:53:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201111215203.80336-11-ash.j.wilding@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ash,

On 11/11/2020 21:51, Ash Wilding wrote:
> From: Ash Wilding <ash.j.wilding@gmail.com>
> 
>   - s/arch_xchg/xchg/
> 
>   - s/arch_cmpxchg/cmpxchg/
> 
>   - Replace calls to BUILD_BUG() with calls to __bad_cmpxchg() as we
>     don't currently have a BUILD_BUG() macro in Xen and this will
>     equivalently cause a link-time error.

How complex would it be to import BUILD_BUG() in Xen? Would the 
following work:

#define BUILD_BUG() BUILD_BUG_ON(1)

> 
>   - Replace calls to VM_BUG_ON() with BUG_ON() as we don't currently
>     have a VM_BUG_ON() macro in Xen.
> 
>   - Pull in the timeout variants of cmpxchg from the original Xen
>     arm64 cmpxchg.h as these are required for guest atomics and are
>     not provided by Linux. Note these are always using LL/SC so we
>     should ideally write LSE versions at some point.

The main advantage of LSE support in Xen is to drop the timeout helpers. 
I guess this would require a bit more thought to still allow inlining.

In any case, it may make sense to move them in a separate headers so you 
don't have to remove/add them. Anyway, I would be happy with the current 
approach as well.

Cheers,

-- 
Julien Grall


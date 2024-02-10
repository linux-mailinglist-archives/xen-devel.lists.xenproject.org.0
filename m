Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407918503D9
	for <lists+xen-devel@lfdr.de>; Sat, 10 Feb 2024 11:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678943.1056517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYkQ7-0004OW-70; Sat, 10 Feb 2024 10:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678943.1056517; Sat, 10 Feb 2024 10:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYkQ7-0004N0-3n; Sat, 10 Feb 2024 10:17:15 +0000
Received: by outflank-mailman (input) for mailman id 678943;
 Sat, 10 Feb 2024 10:17:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rYkQ6-0004Mu-96
 for xen-devel@lists.xenproject.org; Sat, 10 Feb 2024 10:17:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYkQ4-0004uC-NN; Sat, 10 Feb 2024 10:17:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rYkQ4-0001QQ-HE; Sat, 10 Feb 2024 10:17:12 +0000
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
	bh=/Qsi4giPadtc5U+s50tYn6g6Lx4Qk4pRkfIOnkIZT7I=; b=vE4dzjNxWSnxfAXDpZ2PZH7H3L
	OqgnNIrhlq72+1n49H8yevSlpsaGLdGl13GAHB258SB6NdI1lA2WprxqiCtDBha9y9hbxXwt/QGIi
	bjGVlBz/Y7XBd4ouv6TEs7UAk25oUHCWAg9DS0FALvf1XHVxI69AbvUtXeplM0HTfJPM=;
Message-ID: <f86baad0-f113-4156-9c10-6910e8c63492@xen.org>
Date: Sat, 10 Feb 2024 10:17:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Return type of clean_and_invalidate_dcache_va_range
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen Devel <xen-devel@lists.xenproject.org>,
 Consulting <consulting@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jbeulich <jbeulich@suse.com>,
 Andrew Cooper3 <andrew.cooper3@citrix.com>, Roger Pau
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <e050b096ff39aa857f9c267a8dbb4ef6@bugseng.com>
 <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2402091402080.1925432@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/02/2024 22:02, Stefano Stabellini wrote:
> On Fri, 9 Feb 2024, Nicola Vetrini wrote:
>> Hi all,
>>
>> In the context of violations of MISRA C:2012 Rule 17.7: "The value returned by
>> a function having non-void return type shall be used", I was looking at the
>> function "clean_and_invalidate_dcache_va_range". It has the following
>> signature on both arm and x86:
>>
>> static inline int clean_and_invalidate_dcache_va_range
>>      (const void *p, unsigned long size)
>>
>> The commit that introduced it for Arm ~9 years ago (71d64afe3e12: "arm: return
>> int from *_dcache_va_range") [1] mentions that on Arm it can't fail, but
>> supposedly it can on x86.
>>
>> However, as far as I can tell, for both arch-es the implementation now always
>> returns 0 [2][3], so perhaps the mention of -EOPNOTSUPP for x86 is no longer
>> true (I wasn't able to reconstruct if there was a time at which this was true,
>> even in the same commit that changed the return type to int).
>>
>> The question is: should the return type be void, since it appears that every
>> user is ignoring the returned value (violating the rule), except the one in
>> common/grant_table.c [4]?
> 
> Looking at the implementation on both ARM and x86, I am in favor of
> changing the return type to void
I think we need some consistency between all the cache flush helpers 
(clean_and_invalidate_dcache_va_range, invalidate_dcache_va_range() and 
clean_dcache_va_range()). They should all return a values or not return any.

That said, we have two other architectures in development. Are we saying 
this helpers will not need to (initially) return -EOPNOTSUPP?

If we need to return a value for any of the cache helpers, then I would 
consider to provide an extra helpers that would only be used by the 
grant-table code and return a value. Then transform all the existing 
helpers to return void.

Cheers,

-- 
Julien Grall


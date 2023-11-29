Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 777D77FD4AA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 11:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643808.1004335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8I6P-0001yS-HK; Wed, 29 Nov 2023 10:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643808.1004335; Wed, 29 Nov 2023 10:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8I6P-0001wg-EU; Wed, 29 Nov 2023 10:47:33 +0000
Received: by outflank-mailman (input) for mailman id 643808;
 Wed, 29 Nov 2023 10:47:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8I6O-0001wW-Mn
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 10:47:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8I6L-0008CG-Pc; Wed, 29 Nov 2023 10:47:29 +0000
Received: from 82-132-247-131.dab.02.net ([82.132.247.131] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8I6L-0004Gq-GO; Wed, 29 Nov 2023 10:47:29 +0000
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
	bh=7NzXJ02DK44MY/FfjSv/CDuN/umgKdRaHGQ8IVvx9XM=; b=QzJxAwfLCGkcGpbQ3OyK4ZIhGh
	XzYFs9mm9pxyVsA63Rfw1byohsPQkgAXtjviGKWtPxKuzquX5CTlvwAD+B3xtPCGkw+4VILwsKAzP
	n2Pul0mhpLtDe+ARJ9TzWtV8nmEeMRDPX8lH1H8UA2Qj01s0GPEs4Oq9CWEWqCGEFrH4=;
Message-ID: <5a469665-54b2-4904-9604-ad686fbbb05e@xen.org>
Date: Wed, 29 Nov 2023 11:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config.mk: drop -Wdeclaration-after-statement
Content-Language: en-GB
To: Alexander Kanavin <alex@linutronix.de>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <20231128174729.3880113-1-alex@linutronix.de>
 <fcb1cc57-b985-4711-a234-4aaa380b9abe@suse.com>
 <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
From: Julien Grall <julien@xen.org>
In-Reply-To: <81043e30-c9fd-4c5e-ad63-0e42edea733d@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

+ Anthony for the tools
+ Juergen for Xenstored

On 29/11/2023 11:34, Alexander Kanavin wrote:
> On 11/29/23 08:51, Jan Beulich wrote:
> 
>> On 28.11.2023 18:47, Alexander Kanavin wrote:
>>> Such constructs are fully allowed by C99:
>>> https://gcc.gnu.org/onlinedocs/gcc-12.2.0/gcc/Mixed-Labels-and-Declarations.html#Mixed-Labels-and-Declarations
>> There's more to this: It may also be a policy of ours (or of any 
>> sub-component)
>> to demand that declarations and statements are properly separated. 
>> This would
>> therefore need discussing first.
> 
> The error is coming from python 3.12 headers and not from anything in 
> xen tree, no? As you don't have control over those headers, I'm not sure 
> what other solution there could be.

We seem to add -Wno-declaration-after-statement for some components in 
tools/. So one possibility would be to move the flags to an hypervisor 
specific makefile (in xen/).

Anthony/Juergen, do you have any concern if the tools are built without 
-Wdeclaration-after-statement?

Cheers,

-- 
Julien Grall


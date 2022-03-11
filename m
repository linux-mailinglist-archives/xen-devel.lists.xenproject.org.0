Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB94D6830
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 18:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289201.490666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSjW8-0000VJ-T6; Fri, 11 Mar 2022 17:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289201.490666; Fri, 11 Mar 2022 17:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSjW8-0000TU-PW; Fri, 11 Mar 2022 17:57:32 +0000
Received: by outflank-mailman (input) for mailman id 289201;
 Fri, 11 Mar 2022 17:57:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSjW7-0000TO-6R
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 17:57:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSjW6-0006Dh-HV; Fri, 11 Mar 2022 17:57:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSjW6-0004z9-Ai; Fri, 11 Mar 2022 17:57:30 +0000
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
	bh=hywydtrlPhkGhhyjpfV2laEBa7hEGzZJzRG+8up4XdQ=; b=ZALKVdtAyoLfdzmoEj0thR+gRU
	J5vluGmAfu4+T2nfapM5P4AsqrEtRdrZwenQ52Nzu/2GW+WpM+LxfjeMFHPuodjcM13celvGghrxn
	lkv+dD5ns2abD2Y+z+KplAD7CxnfAmbqSUYHPnyTA9BB47aUy8stmU7HkjcQP0ZHJAKE=;
Message-ID: <3fa26307-965e-549e-1496-ee618399b085@xen.org>
Date: Fri, 11 Mar 2022 17:57:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 16/36] xen/color alloc: implement color_from_page for
 ARM64
To: Marco Solieri <marco.solieri@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-17-marco.solieri@minervasys.tech>
 <1bf96df3-3593-1c01-a571-a0ee6e63524e@xen.org>
 <20220311173914.mppkerpbme6roo6w@carbon.xt3.it>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220311173914.mppkerpbme6roo6w@carbon.xt3.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marco,

On 11/03/2022 17:39, Marco Solieri wrote:
> On Fri, Mar 04, 2022 at 08:54:35PM +0000, Julien Grall wrote:
>> On 04/03/2022 17:46, Marco Solieri wrote:
>>> The colored allocator should not make any assumptions on how a color
>>> is defined, since the definition may change depending on the
>>> architecture.
>> IIUC, you are saying that the mapping between a physical address to a
>> way is the same on every Armv8 processor.
>>
>> Can you provide a reference from the Arm Arm which confirm this
>> statement?
> 
> We are actually stating quite the opposite.  Generally speaking, the Arm
> ARM leaves as IMPLEMENTATION DEFINED many details that are needed to
> determine how colouring should be defined, most notably:
> - the physical vs virtual indexing, which determines whether colouring
>    is possible;
> - the cache line length and the degree of associativity, which determine
>    the way size, which in turn, together with the page size selected by
>    the OS/hypervisor, allows to compute the number of available colours;
> - the number of levels of shared caches, which determines the number of
>    different colour sets.
> 
> For the sake of simplicity, we wanted to decouple the notion of colour
> from the many hardware features that enable/suggest one of the
> (sometimes many) instantiations.
> 
> All these details are usually reported in the processor TRM.  E.g., in
> the A53 TRM [DDI 0500J] we read (Sec. 7.1):
> 
> | Optional tightly-coupled L2 cache that includes:
> | — Configurable L2 cache size of 128KB, 256KB, 512KB, 1MB and 2MB.
> | — Fixed line length of 64 bytes.
> | — Physically indexed and tagged cache.
> | — 16-way set-associative cache structure.
Thanks for the details. They are all about the variables of an equation. 
What I am looking for is how the equation calculate_addr_col_mask() in 
patch #6 was defined.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56218645EEB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 17:29:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456497.714262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2xHX-00017t-HP; Wed, 07 Dec 2022 16:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456497.714262; Wed, 07 Dec 2022 16:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2xHX-00015V-Ee; Wed, 07 Dec 2022 16:28:27 +0000
Received: by outflank-mailman (input) for mailman id 456497;
 Wed, 07 Dec 2022 16:28:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2xHW-00015P-MS
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 16:28:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2xHV-0005rH-An; Wed, 07 Dec 2022 16:28:25 +0000
Received: from [15.248.2.156] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2xHV-0001If-2e; Wed, 07 Dec 2022 16:28:25 +0000
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
	bh=JMhRux5lJsxnPEOa8YQAoN5PZrKdrKcrJ8/O4HBN+3Q=; b=i1HBHMLY0snheD3B8a+GtBT/K8
	yGW/rYf+WdZ5+Qm4kkwzgLWeWI1IUFPsMC8KMD/IHMhSi3//1P7id5JMFfCj1250H7iTxYg6EjGn1
	g76oHzcwCdC1XmhXwe4sujBp65dOe5afpRe+OtgFj6eJ8Ht8TZLGkdH1zGLaHlnAHLaM=;
Message-ID: <7cb6475e-0ab4-a7e2-8049-04c66588229f@xen.org>
Date: Wed, 7 Dec 2022 16:28:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN][RFC PATCH v4 10/16] asm/smp.h: move cpu related function to
 asm/cpu.h
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Luca.Fancellu@arm.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-4-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221207061815.7404-4-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 07/12/2022 06:18, Vikram Garhwal wrote:
> Dynamic programming ops will modify the dt_host and there might be other
> function which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host. But adding rwlock in
> device_tree.h causes following circular dependency:
>      device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h
> 
> Inside arch/arm/include/asm/smp.h, there is one function which needs
> device_tree.h, moved the cpu related function to a new file:
> arch/arm/include/asm/cpu.h

Given there is only one function, I don't really see the benefits of 
splitting smp.h and then adding #ifdef CONFIG_ARM in the common code.

Instead, it would be better if we don't include device_tree.h in the 
header but in the c files that need to call arch_cpu_init() and forward 
declare dt_device_node.

Another potential approach is to move out the percpu_rwlock helpers in a 
separate header. The advantage with this approach is we would reduce the 
number of definition included everywhere (there are not many use of the 
percpu rwlock).

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAE93A193
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763183.1173429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFd7-0001IL-Fq; Tue, 23 Jul 2024 13:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763183.1173429; Tue, 23 Jul 2024 13:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFd7-0001Fx-Ce; Tue, 23 Jul 2024 13:32:37 +0000
Received: by outflank-mailman (input) for mailman id 763183;
 Tue, 23 Jul 2024 13:32:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sWFd5-0001Fr-Og
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:32:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWFd5-0006wp-Cn; Tue, 23 Jul 2024 13:32:35 +0000
Received: from [15.248.3.91] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWFd5-0004tN-4I; Tue, 23 Jul 2024 13:32:35 +0000
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
	bh=hiA1mHwg4T6q3gkmmVOELJ4JXJMYp7gGauj1MueYW2M=; b=JqvNd+jKtdbHkmnpXU3XFtoymC
	VUmO2URYwQBlkiEOVqZvbpWMDUgV3yN54aUrsZTWu8Bcs0iPCzSIy1az4RHu2/UBVihWVZmuX8Y4Q
	dCgdy6UNxyMZATD3WK+tQ/JzRgLGQxnFO8ls4gpXm4JLpnb+G98MDqZ6qV6+Ce1NF4zA=;
Message-ID: <2189b16d-2006-484e-91d0-c3445670b90f@xen.org>
Date: Tue, 23 Jul 2024 14:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
Content-Language: en-GB
To: oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
 <8fd1cc2c-9dda-4e74-b242-fe8aa862955d@xen.org>
 <819ec33e568b54aba355bc2189b3d760ec294fb0.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <819ec33e568b54aba355bc2189b3d760ec294fb0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/07/2024 13:58, oleksii.kurochko@gmail.com wrote:
> Hi Julien,

Hi Oleksii,

> On Sun, 2024-07-21 at 09:46 +0100, Julien Grall wrote:
>>> +/* Fixmap slots */
>>> +#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
>>> +#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of
>>> PMAP */
>>
>> ... here is seems to be inclusive. Furthermore if you had 32-bit
>> address
>> space, it is also quite easy to have to create a region right at the
>> top
>> of it. So when END is exclusive, it would become 0.
>>
>> So on Arm, we decided to start to get rid of "end". I would consider
>> to
>> do the same on RISC-V for new functions.
> I assume that you wrote here just as an example of confusion occurs
> because of using *_END but just to be clear I have to leave
> FIXMAP_MAP_END as-is because it is used now by common code.

Indeed. FIXMAP_PMAP_END should stay for now.

Cheers,

-- 
Julien Grall


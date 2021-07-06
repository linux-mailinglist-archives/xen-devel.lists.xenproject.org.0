Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4843BD9E7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 17:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151461.279918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mng-0005AQ-A7; Tue, 06 Jul 2021 15:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151461.279918; Tue, 06 Jul 2021 15:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0mng-00057J-71; Tue, 06 Jul 2021 15:15:52 +0000
Received: by outflank-mailman (input) for mailman id 151461;
 Tue, 06 Jul 2021 15:15:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0mnf-00057D-33
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 15:15:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0mnb-0003qT-7f; Tue, 06 Jul 2021 15:15:47 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0mnb-0003ju-0h; Tue, 06 Jul 2021 15:15:47 +0000
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
	bh=H7ORhudI49hLq7R/416H0Z63lBZM1TRv32Z8JU0g7R0=; b=iksRNjpMWlp86vL9ceSQxjYkuY
	I0ZOTDuc2su8HiUMyh50PkfHvHgF+I6FL3eGjikLv5grAUxJ4cygxzgL9QjzgKBQq6VbYcAnrN6LH
	YMcPw5RgkgHzLF+MfFiE7oWF2wzdrB99IAMadwwHKX8o50rw+2Gwg6An5zHkqMm7pbSI=;
Subject: Re: [PATCH] tools: Fix CPSR/SPSR print size
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com, michal.orzel@arm.com, olaf@aepfle.de,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d79b4ff3-cc61-a1a7-ed5d-e0ea627bbab8@xen.org>
Date: Tue, 6 Jul 2021 16:15:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f28690afd8c4f36351fcdb1e95704cc5240b193a.1625583993.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Bertrand,

Thanks for the fix. I forgot to check the full tools build when sending 
the first fix :(.

On 06/07/2021 16:09, Bertrand Marquis wrote:
> With the changes of register size introduced in
> 918b8842a852e0e7446286f546724b1c63c56c66, CPSR and SPSR are now stored
> as 64bit values.
> 
> Fix the print size to use 64bit type.
> 

Can you add a fixes tag? This makes easier to find bug fix in the tree.

For this patch it would be:

Fixes: 918b8842a852 ("arm64: Change type of hsr, cpsr, spsr_el1 to 
uint64_t")

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Just to confirm, with this patch and mine the tools build successfully 
on 32-bit and 64-bit?

Cheers,

-- 
Julien Grall


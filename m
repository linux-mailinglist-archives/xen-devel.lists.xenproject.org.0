Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9804A886CA4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 14:15:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696873.1088077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnejk-0008Ub-5R; Fri, 22 Mar 2024 13:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696873.1088077; Fri, 22 Mar 2024 13:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnejk-0008Rw-1v; Fri, 22 Mar 2024 13:15:08 +0000
Received: by outflank-mailman (input) for mailman id 696873;
 Fri, 22 Mar 2024 13:15:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rneji-0008Rk-OE
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 13:15:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnejd-0003Lu-DJ; Fri, 22 Mar 2024 13:15:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rnejd-0005r3-85; Fri, 22 Mar 2024 13:15:01 +0000
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
	bh=C+gwDwhrEsv0KyU6I6tUWQNLG/3jx3IW5RAsB6mKI2g=; b=QMIYBWhH6UPUQvhD+UKiRkZkdB
	dirM+wjJSVDuYC7iewngmzO/Jarg8g4v184VROa6qulyqUbiwTACiuh0FQC7laziIHC1E4VaT7Yip
	ijlbzrSZuL9juVTE2Kk8W6cEEre6tGXwwSP66fn8eluJhVvOGU12ykPaNGJJygUsoftc=;
Message-ID: <5cd33075-3965-4c03-add0-ffbc5a994920@xen.org>
Date: Fri, 22 Mar 2024 13:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <039524d4157dddb2faf6887739a727f6e993b53f.1710443965.git.sanastasio@raptorengineering.com>
 <19c4d0c2-c69c-4310-bf02-28d3894f8006@xen.org>
 <4268b0de-e959-42aa-bc5c-0c48a359ea1d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4268b0de-e959-42aa-bc5c-0c48a359ea1d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 22/03/2024 07:55, Jan Beulich wrote:
> On 21.03.2024 18:47, Julien Grall wrote:
>> On 14/03/2024 22:15, Shawn Anastasio wrote:
>>> Arm's setup.c contains a collection of functions for parsing memory map
>>> and other boot information from a device tree. Since these routines are
>>> generally useful on any architecture that supports device tree booting,
>>> move them into xen/common/device-tree.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> ---
>>>    MAINTAINERS                       |   1 +
>>>    xen/arch/arm/setup.c              | 419 --------------------------
>>>    xen/common/Makefile               |   1 +
>>>    xen/common/device-tree/Makefile   |   1 +
>>>    xen/common/device-tree/bootinfo.c | 469 ++++++++++++++++++++++++++++++
>>
>> The new bootinfo.c is exported quite a few functions. Please introduce
>> an generic header with the associated functions/structures.
> 
> By "generic" you don't mean a header in asm-generic/, do you?

Right. I meant include/xen/*.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0980F169
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 16:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653235.1019657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4xF-0000N1-SY; Tue, 12 Dec 2023 15:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653235.1019657; Tue, 12 Dec 2023 15:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD4xF-0000Ks-Q1; Tue, 12 Dec 2023 15:45:53 +0000
Received: by outflank-mailman (input) for mailman id 653235;
 Tue, 12 Dec 2023 15:45:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rD4xD-0000Km-PD
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 15:45:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD4xD-0001hw-BP; Tue, 12 Dec 2023 15:45:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rD4xD-0003px-3v; Tue, 12 Dec 2023 15:45:51 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=n8issHcoK6ue8IefLltLRkrS5NNqQl2z2FAJcbXvrqk=; b=B1kBBS12QYSG17wzWnh6mN2Nf2
	G7V9h/8dtjUuorhLJdDfc+cCHMVad6Bzthx5ZpijvHWQAPGtXtQ2DNsJCrhCp6quBSIDyQ5glddpp
	YFNS4/1rxUSJeDGTq18JY5OHhXMlyS+/5XaMS0tHoplYcHd9j5AMSNSKaE1/Z6yjxUv0=;
Message-ID: <2d177dd2-7187-4d3c-8dbd-46a1a0651cf6@xen.org>
Date: Tue, 12 Dec 2023 15:45:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] xen: have a more generic unaligned.h header
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231211131616.1839-1-jgross@suse.com>
 <b49a092d-a0de-4f54-8b1e-32c5a549c843@xen.org>
In-Reply-To: <b49a092d-a0de-4f54-8b1e-32c5a549c843@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/12/2023 11:44, Julien Grall wrote:
> Hi Juergen,
> 
> On 11/12/2023 13:16, Juergen Gross wrote:
>> Update Xen's unaligned.h header to support all architectures, allowing
>> to remove the architecture specific variants (x86 only until now).
>>
>> Changes in V2:
>> - new patch 1 (Julien Grall)
>> - adjusted patch 2 (Jan Beulich)
>>
>> Changes in V3:
>> - adjusted patch 2 (Andrew Cooper)
>>
>> Juergen Gross (3):
>>    xen/arm: set -mno-unaligned-access compiler option for Arm32
>>    xen: make include/xen/unaligned.h usable on all architectures
>>    xen: remove asm/unaligned.h
> 
> The series is now committed.

Either patches #2 or #3 broke gitlab CI:

https://gitlab.com/xen-project/hardware/xen/-/jobs/5733143618

I have reverted both of them to unblock it.

Cheers,

-- 
Julien Grall


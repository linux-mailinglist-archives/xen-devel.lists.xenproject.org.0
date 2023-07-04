Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAC3747894
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558644.872946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlRK-0007H0-Dj; Tue, 04 Jul 2023 19:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558644.872946; Tue, 04 Jul 2023 19:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlRK-0007EM-Ah; Tue, 04 Jul 2023 19:11:54 +0000
Received: by outflank-mailman (input) for mailman id 558644;
 Tue, 04 Jul 2023 19:11:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGlRI-0007EE-RF
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:11:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlRI-0000Fu-8Y; Tue, 04 Jul 2023 19:11:52 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlRI-0001Zf-15; Tue, 04 Jul 2023 19:11:52 +0000
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
	bh=d6N1UGkbglsq2JKcU1Nnq10Dfh0i87isXX7HujVXOMQ=; b=zL10TnoltrieqCn8slPBLAvisT
	L3+AvSFPVNSUjKVweXwqU1snt8qRHcDMWMlnWqQIYwGyJ8LSP6ODNKU4QBeuVGCFVgvPNsqSIayzD
	THRLhpj3s4ZHDRUjpShoMNz2jwzURQzarYnL5P+EZXldq3otQbOYiI4SMtL6NCJ5YRr0=;
Message-ID: <a2df163a-ac61-e53b-25dd-fcd33703adf2@xen.org>
Date: Tue, 4 Jul 2023 20:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include also
 arm
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 wei.chen@arm.com, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
 <66c3d183-460d-4f34-a331-01ac4d65fc9d@perard>
From: Julien Grall <julien@xen.org>
In-Reply-To: <66c3d183-460d-4f34-a331-01ac4d65fc9d@perard>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Replying here because there is no cover letter (in the future please add 
one if you have more than two patches bundled together).

On 04/07/2023 10:42, Anthony PERARD wrote:
> On Thu, Jun 08, 2023 at 02:59:12PM +0100, Luca Fancellu wrote:
>> Commit 56a7aaa16bfe introduced some SVE related code that is protected by
>> '#if defined(__aarch64__)', the issue is that this doesn't take into
>> consideration when the toolstack is compiled for an arm32 Dom0 running on
>> an arm64 platform, it should be able to create SVE enabled guests but with
>> the current code it's not.
>>
>> So fix the issue by compiling the code when the toolstack is compiled for
>> both arm32 and arm64.
>>
>> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@citrix.com>

I have now committed the series.

Cheers,

-- 
Julien Grall


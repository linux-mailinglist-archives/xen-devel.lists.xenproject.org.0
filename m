Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512A747843
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558606.872857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkgs-0005uO-89; Tue, 04 Jul 2023 18:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558606.872857; Tue, 04 Jul 2023 18:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkgs-0005s9-5P; Tue, 04 Jul 2023 18:23:54 +0000
Received: by outflank-mailman (input) for mailman id 558606;
 Tue, 04 Jul 2023 18:23:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGkgq-0005s0-6d
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:23:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkgp-0007XI-EN; Tue, 04 Jul 2023 18:23:51 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkgp-0007hD-8X; Tue, 04 Jul 2023 18:23:51 +0000
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
	bh=Y0aX9g9aRpkUunebuDtkqLKcZeL4ngk737CZD7anojM=; b=FjigqDh/aLpa7QZHDOzCPgAWfS
	en5IARejf30YixT+hJHQqHsdglObinxBNedEnvWolaEu+6S4BC2EZfV5lRGXTRmIECtTPlItha9xe
	dW/XU9hvDVlXboz4BgD47+sHAC8qNqfkN3t7EnrW5tGCheWdoDJxdV6kfr3764lUrIbs=;
Message-ID: <0b332497-ae42-1356-67d5-1a46ace11b01@xen.org>
Date: Tue, 4 Jul 2023 19:23:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>,
 "federico.serafini@bugseng.com" <federico.serafini@bugseng.com>
References: <20230629210150.69525-1-julien@xen.org>
 <B186E9AD-1DBE-41B2-ADE9-850F1ACC4078@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B186E9AD-1DBE-41B2-ADE9-850F1ACC4078@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 04/07/2023 15:35, Bertrand Marquis wrote:
>> On 29 Jun 2023, at 23:01, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Both the stub and the x86 prototypes for replace_grant_host_mapping()
>> and create_grant_host_mapping() will define the first parameter (and
>> third for the former) as uint64_t. Yet Arm will define it as
>> 'unsigned long'.
>>
>> While there are no differences for 64-bit, for 32-bit it means
>> that the address should be truncated as 32-bit guest could support
>> up to 40-bit addresses.
>>
>> So replace 'unsigned long' with 'uint64_t' for the first parameter
>> (and third parameter for replace_grant_host_mapping()).
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks. It is now committed.

Cheers,

-- 
Julien Grall


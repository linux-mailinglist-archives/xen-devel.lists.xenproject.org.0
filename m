Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 232577CC4BF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 15:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618251.961664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsk7R-0002hM-S3; Tue, 17 Oct 2023 13:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618251.961664; Tue, 17 Oct 2023 13:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsk7R-0002ff-PG; Tue, 17 Oct 2023 13:28:21 +0000
Received: by outflank-mailman (input) for mailman id 618251;
 Tue, 17 Oct 2023 13:28:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsk7Q-0002fZ-35
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 13:28:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsk7O-00053h-VG; Tue, 17 Oct 2023 13:28:18 +0000
Received: from [15.248.2.61] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsk7O-00071Q-MC; Tue, 17 Oct 2023 13:28:18 +0000
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
	bh=yjcGE4cFUMAyeUWsGq2bRP9bfn5zOmjWrkp8xiBl0+U=; b=uOqFPtwOSXkpI6mjm9Y02aehqE
	KZW8p1IbU/YT4ZwilnNyfMe8BDXRABNxpwNNl35Shq11WQsOjUGcUcC74i1zWNKrUy39nYjqWI2cM
	agVVD3qLmYL6kWBDRuUQjU97wi6CZtkcJ3LxMhZkfKHCuLhKIq1ga0NXIrg/41+44UII=;
Message-ID: <3573c8c2-1a9c-444c-a542-539b16f689f2@xen.org>
Date: Tue, 17 Oct 2023 14:28:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA C:2012 D4.11 caution on staging
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
 <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
 <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
 <75a00257-c062-4d82-9b64-1707ce4566e6@xen.org>
 <594c09e1f8b2e1e8321c2cb862fcb378@bugseng.com>
 <5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org>
 <c4f4f1fc-b20a-c08f-9782-9ce06f6dd868@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c4f4f1fc-b20a-c08f-9782-9ce06f6dd868@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/10/2023 07:11, Jan Beulich wrote:
> On 16.10.2023 20:06, Julien Grall wrote:
>> Instead, it would be best to find a way to help Eclair to detect this is
>> not an issue and also improve readability. Would the following help Eclair?
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index 30c227967345..ab16124eabd6 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -671,6 +671,8 @@ struct domain *domain_create(domid_t domid,
>>
>>        if ( !is_idle_domain(d) )
>>        {
>> +        ASSERT(config);
>> +
>>            watchdog_domain_init(d);
>>            init_status |= INIT_watchdog;
> 
> Just to mention it: Even if right now it turned out to help, it wouldn't
> once release builds are also checked.

Indeed. I thought about it when writing the e-mail yesterday. I have the 
feeling that we are not getting many similar report today thanks to the 
various ASSERT().

This may mean that the ASSERT() will have to be kept during static 
analysis or we deviate/add proper error checking.

Cheers,

-- 
Julien Grall


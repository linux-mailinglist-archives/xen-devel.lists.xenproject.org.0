Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60775336F2D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 10:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96414.182364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHvU-0007MW-9t; Thu, 11 Mar 2021 09:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96414.182364; Thu, 11 Mar 2021 09:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKHvU-0007M5-6J; Thu, 11 Mar 2021 09:48:16 +0000
Received: by outflank-mailman (input) for mailman id 96414;
 Thu, 11 Mar 2021 09:48:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lKHvS-0007M0-BB
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 09:48:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKHvR-00022O-4N; Thu, 11 Mar 2021 09:48:13 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lKHvQ-0007m4-S4; Thu, 11 Mar 2021 09:48:12 +0000
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
	bh=3cqelGmI07pHVY8hVPWi3fhqvD0roAVrxauEZew+z0s=; b=kuZpvvSVok9dY5p69Tz+NME7NV
	pj/k038DQ7OQsVyHRAvqwkytBiLspyXYZpokt6IbtkSkVv85hQt1dF/On5HCnuCawonOcw7vbziLI
	YA91gfviZyYcforefAWYyjK0+lrxhJpOnLKoGD9Nnd9x/Q/2aJdoDZJTh5avo5wd5Bxs=;
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, raphning@amazon.co.uk, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210305124003.13582-1-julien@xen.org>
 <20210305124003.13582-3-julien@xen.org>
 <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
 <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
 <7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
 <24642.14600.124181.19574@mariner.uk.xensource.com>
 <0249af89-ced0-0f7f-d370-9ffade6b1678@xen.org>
 <24645.61961.964574.269753@mariner.uk.xensource.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1ec1c5b8-3802-873c-36a2-ea9637345302@xen.org>
Date: Thu, 11 Mar 2021 09:48:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24645.61961.964574.269753@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Ian,

On 08/03/2021 09:44, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for xprintf() and barf{,_perror}()"):
>> Would the following comment work for you?
>>
>> /* Function pointer as xprintf() can be configured at runtime. */
>>
>> I can fold it in my patch while committing.
> 
> Sure, thanks.  FTAOD
> 
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> to that comment addition.

Thanks! I have committed the two patches.

Cheers,

-- 
Julien Grall


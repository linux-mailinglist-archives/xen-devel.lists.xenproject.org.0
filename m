Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9D6E0AA5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 11:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520594.808337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmteH-0000Vp-4k; Thu, 13 Apr 2023 09:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520594.808337; Thu, 13 Apr 2023 09:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmteH-0000Tm-1t; Thu, 13 Apr 2023 09:53:49 +0000
Received: by outflank-mailman (input) for mailman id 520594;
 Thu, 13 Apr 2023 09:53:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pmteF-0000Tg-VR
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 09:53:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmteF-0006bU-So; Thu, 13 Apr 2023 09:53:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.20.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pmteF-0006bg-Lb; Thu, 13 Apr 2023 09:53:47 +0000
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
	bh=3TMnKaazw7RkdLGoudNI4e9xwLmqht+031sHO8iWC7s=; b=CUnW6t+sGMVByDDCo4bpqGLBZN
	mj4xEuar3YKYVTV+Uks8TXvHqSrSe8/BWtTo1SQUnmhe3Zbf4Vx2APUUDNQR7GJOJFlgnhf4ob80F
	y61AH9urPjtA7/SLBn9+JkTQT+XDmWJVA7EW3XPHGHjjO2NUCGe8yw6S08MvI4c5h/CU=;
Message-ID: <e714186d-0ebb-ecf0-0800-c9fc0bdcaa6c@xen.org>
Date: Thu, 13 Apr 2023 10:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN][PATCH v5 02/17] common/device_tree: change
 __unflatten_device_tree()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-3-vikram.garhwal@amd.com>
 <3f98a8b0-dea6-4ae4-137a-312e89af879b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f98a8b0-dea6-4ae4-137a-312e89af879b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/04/2023 10:45, Michal Orzel wrote:
> On 11/04/2023 21:16, Vikram Garhwal wrote:
>>
>>
>> Following changes are done to __unflatten_device_tree():
>>      1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>>      2. Remove static function type.
> I think there was no need to touch this function in patch 1 if you are modifying it here
> additionally in a separate patch.
> 
>>      3. Add handling of memory allocation. This will be useful in dynamic node
>>          programming when we unflatten the dt during runtime memory allocation
>>          can fail.
> Didn't we say that checking if the memory allocation failed or not should be done
> as a separate patch (i.e. a prerequisite to your series) as part of hardening?
> 
> In any case (depending on the maintainers vote), the change itself looks ok, so:

Yes it should be separate because this is something we may want to 
consider to backport.

Cheers,

-- 
Julien Grall


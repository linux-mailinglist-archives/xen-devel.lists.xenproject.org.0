Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F9C363724
	for <lists+xen-devel@lfdr.de>; Sun, 18 Apr 2021 20:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112544.214723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYC7b-000882-1N; Sun, 18 Apr 2021 18:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112544.214723; Sun, 18 Apr 2021 18:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYC7a-00087d-U1; Sun, 18 Apr 2021 18:26:14 +0000
Received: by outflank-mailman (input) for mailman id 112544;
 Sun, 18 Apr 2021 18:26:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lYC7Z-00087Y-Er
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 18:26:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYC7Z-0007v5-5C; Sun, 18 Apr 2021 18:26:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lYC7Y-00044d-TP; Sun, 18 Apr 2021 18:26:13 +0000
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
	bh=xCeqe2qzkmXuPMgLqo0adcs82fb9T2Lp6dKCofvqgZk=; b=IQdE5xzfW0MU404U1LHrpk8Igq
	+quuWh9AyZodsJzQ2Yth0fJcvT7aqxfzDMnphaKD7yiTvaOlM1xDEZ0Vbvqnefsfp+jZ6K62yJLEr
	jERwknqS8yXOfsMCYVuhTf4ok4h4z18SIbrGalgGoMWyUjWWY8N04cU24qq7RUiO4Y/E=;
Subject: Re: [PATCH v2] xen/arm: kernel: Propagate the error if we fail to
 decompress the kernel
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>
References: <20210406191554.12012-1-julien@xen.org>
 <591603c5-ebcb-e9d6-74a0-bed921458a69@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6c8133a5-dc78-083b-0cec-69860e46daf7@xen.org>
Date: Sun, 18 Apr 2021 19:26:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <591603c5-ebcb-e9d6-74a0-bed921458a69@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 12/04/2021 07:45, Michal Orzel wrote:
> On 06.04.2021 21:15, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, we are ignoring any error from perform_gunzip() and replacing
>> the compressed kernel with the "uncompressed" kernel.
>>
>> If there is a gzip failure, then it means that the output buffer may
>> contain garbagge. So it can result to various sort of behavior that may
>> be difficult to root cause.
>>
>> In case of failure, free the output buffer and propagate the error.
>> We also need to adjust the return check for kernel_compress() as
>> perform_gunzip() may return a positive value.
>>
>> Take the opportunity to adjust the code style for the check.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - Fix build
>> ---
> 
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Thanks! @Stefano, can I get your acked-by?

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4B95B29C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 12:09:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781683.1191171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh4k4-00084a-FY; Thu, 22 Aug 2024 10:08:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781683.1191171; Thu, 22 Aug 2024 10:08:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh4k4-000834-At; Thu, 22 Aug 2024 10:08:32 +0000
Received: by outflank-mailman (input) for mailman id 781683;
 Thu, 22 Aug 2024 10:08:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sh4k3-00082y-8p
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 10:08:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh4k2-0001j3-KJ; Thu, 22 Aug 2024 10:08:30 +0000
Received: from [15.248.2.26] (helo=[10.24.67.18])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sh4k2-0001m5-B2; Thu, 22 Aug 2024 10:08:30 +0000
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
	bh=CmvTWeI4YL/7oRomE/7yjl3rTHdfFCHruNE2eVDgeXA=; b=C3tRNHOFSQaHVUZP1VcgvOgXgC
	UaI78Thki7/TXRGRFFfRnrOF+Wttf320hwIzEuvSZE+LKuF3FAjoBmvsVxIJLOYBASo24dfYM6N4y
	n3TOgejmea+Xggvf9/NFxP+3Io2QBq+lowHtFmUTl9LkvatpTzhhPbKgIO5vURdPlE0g=;
Message-ID: <4cd8f2d6-d10e-43d4-8ce7-8b37946ece40@xen.org>
Date: Thu, 22 Aug 2024 11:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: Hide FEAT_SME
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814210054.67520-1-julien@xen.org>
 <b306e03e-17d4-4d09-aa8c-78e44dacacca@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b306e03e-17d4-4d09-aa8c-78e44dacacca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 16/08/2024 08:15, Michal Orzel wrote:
  > On 14/08/2024 23:00, Julien Grall wrote:
>>
>>
>> Newer hardware may support FEAT_SME. Xen doesn't have any knowledge but
>> it will still expose the feature to the VM. If the OS is trying to use
>> SME, then it will crash.
>>
>> Solve by hiding FEAT_SME.
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
> Acked-by: Michal Orzel <michal.orzel@amd.com>
> 
>>
>> ---
>>
>> The current approach used to create the domain cpuinfo is to hide
>> (i.e. a denylist) what we know Xen is not supporting. The drawback
>> with this approach is for newly introduced feature, Xen will expose it
>> by default.
>>
>> If a kernel is trying to use it then it will crash. I can't really
>> make my mind whether it would be better to expose only what we support
>> (i.e. use an allowlist).
>>
>> AFAICT, there is no security concerns with the current approach because
>> ID_* registers are not a way to tell the kernel which features are
>> supported. A guest kernel could still try to access the new registers.
> I agree with the security aspect but the part of the sentence in the middle is a bit misleading.

Indeed. It was poorly worded. I was meant to say what you wrote below :).

> ID_ registers *are* a way of informing the kernel about implemented PE features. It's just that
> the kernel could still access the features. That said, it should be considered an incorrect behavior
> and definitely not something we should worry about.

Cheers,

-- 
Julien Grall



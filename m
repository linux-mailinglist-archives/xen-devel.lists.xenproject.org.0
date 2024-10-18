Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053779A4061
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821952.1235941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nMU-0006PN-O4; Fri, 18 Oct 2024 13:49:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821952.1235941; Fri, 18 Oct 2024 13:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nMU-0006NW-Kz; Fri, 18 Oct 2024 13:49:50 +0000
Received: by outflank-mailman (input) for mailman id 821952;
 Fri, 18 Oct 2024 13:49:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t1nMT-0006NC-EW
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:49:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1nMT-0005Iw-6g; Fri, 18 Oct 2024 13:49:49 +0000
Received: from [2a02:8012:3a1:0:ecee:6c05:256c:cbd3]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t1nMS-0008QZ-Ve; Fri, 18 Oct 2024 13:49:49 +0000
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
	bh=vnd9TW+w9BTHCty5NNSxtmfD7HJd02zpAyMyszh1xdU=; b=3yc6C0Ms0XlCg+o/mwvqFYMD3P
	0V0e60e86Cae1QAw5nhwThz1LO5jccOK+PHveHQosFT37zBptUIj0tlVjiA87RTtvXn4BButUEsMb
	NI+saFXcIt7pVEd92hvNi6SfjPgxZXDeRt48/HQlKkTvHYG9uEZqhc1OquJPHJmCoJjE=;
Message-ID: <494e17ee-73be-4afe-873d-fd0b3cc49901@xen.org>
Date: Fri, 18 Oct 2024 14:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-3-ayan.kumar.halder@amd.com>
 <9A01BB97-2CA9-491F-80EA-7B7D81B553AD@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9A01BB97-2CA9-491F-80EA-7B7D81B553AD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/10/2024 19:43, Luca Fancellu wrote:
> Hi Ayan,
> 
>> On 10 Oct 2024, at 15:03, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> There are features in the forthcoming patches which are dependent on
>> MPU. For eg fixed start address.
>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>> by the MPU configuration.
>>
>> Thus, this patch introduces a choice between MMU and MPU for the type
>> of memory management system. By default, MMU is selected.
>> MPU is now gated by UNSUPPORTED.
>>
>> Update SUPPORT.md to state that the support for MPU is experimental.
> 
> Maybe I’m wrong, but shouldn’t we add this only when MPU is supported?

The support of the MPU will happen quite a long way down the line. We 
will first start with experimental (which implies the code may or may 
not work) and I think this is correct to do that now.

Cheers,

-- 
Julien Grall



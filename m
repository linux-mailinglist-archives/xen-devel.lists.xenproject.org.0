Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC553BE885
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 15:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152188.281176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Fn-0002FL-Kh; Wed, 07 Jul 2021 13:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152188.281176; Wed, 07 Jul 2021 13:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m17Fn-0002Cm-H1; Wed, 07 Jul 2021 13:06:15 +0000
Received: by outflank-mailman (input) for mailman id 152188;
 Wed, 07 Jul 2021 13:06:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m17Fl-0002Cg-Rm
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 13:06:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17Fi-0003xr-Q9; Wed, 07 Jul 2021 13:06:10 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m17Fi-0007aI-Jc; Wed, 07 Jul 2021 13:06:10 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=/nWj+NR9oKtRt/vfvWcHJgpTrMP73a2dGsl0BeYtHHw=; b=q3UeAGZ0dHljzhwPNuYv0XDBw/
	zAGn4UqNcSY1jbbmJAZHYA/IQ4IiOHekhi4HeySJYIHY2VmpBFjPRCiUn8LwcN/0O7Cea2N72LsjS
	XqEv1mW6gH/IjXh7108rrnoslLPtqTFgh3RTkznpXLw5C+74MDLZn/KMVOwLPgs0NOk8=;
Subject: Re: [PATCH] arm: Fix arch_initialise_vcpu to be unsupported
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Jan Beulich <jbeulich@suse.com>
References: <20210706102853.10251-1-michal.orzel@arm.com>
 <3b3cb3ef-82eb-3933-9b7e-c124aabefa60@xen.org>
Message-ID: <c83f4c98-8d6c-2bed-5aae-5ef56dbe3a18@xen.org>
Date: Wed, 7 Jul 2021 14:06:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3b3cb3ef-82eb-3933-9b7e-c124aabefa60@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 07/07/2021 13:53, Julien Grall wrote:
> Hi Michal,
> 
> On 06/07/2021 11:28, Michal Orzel wrote:
>> Function arch_initialise_vcpu is not reachable as the
>> VCPUOP_initialise is an unsupported operation on arm.
>> Modify the function by adding ASSERT_UNREACHABLE() and
>> returning -EOPNOTSUPP.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

> 
> Cheers,
> 

-- 
Julien Grall


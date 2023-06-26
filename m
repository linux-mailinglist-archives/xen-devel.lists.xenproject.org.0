Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2188873DFE5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 14:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555489.867284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDllh-0003H8-T7; Mon, 26 Jun 2023 12:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555489.867284; Mon, 26 Jun 2023 12:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDllh-0003E0-QE; Mon, 26 Jun 2023 12:56:33 +0000
Received: by outflank-mailman (input) for mailman id 555489;
 Mon, 26 Jun 2023 12:56:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDllg-0003Du-2s
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 12:56:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDllf-0001DD-Hr; Mon, 26 Jun 2023 12:56:31 +0000
Received: from [193.85.242.128] (helo=[192.168.148.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDllf-0001jx-AI; Mon, 26 Jun 2023 12:56:31 +0000
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
	bh=Z6bKlifNNL2nNncyyhgDWPhEo7/OHIGlFfdyNxEmG28=; b=qrLrddHrIw2medpgx8SsJcSVnG
	bltP2poxNXBIjTjIbyFAuS/7oi0c192g1m3dyJHhe/4aI23L9+RhK5U6+b+WMpRYI4yHngTqz0Lo0
	1gPiYnB7k/2ogWRiLbjNqFg1pGtN3TMQnXMUJW43VBTahPGPFDS/AE2sv5aTBHlpUxp4=;
Message-ID: <f9afb315-34f8-0e1d-de67-5024fe7f616f@xen.org>
Date: Mon, 26 Jun 2023 13:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 8/9] xen/arm: Allow the user to build Xen with USBAN
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-9-julien@xen.org>
 <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <804682ce-ad88-34dc-1501-c9ff6347fb8b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/06/2023 12:56, Michal Orzel wrote:
> 
> 
> On 25/06/2023 22:49, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> UBSAN has been enabled a few years ago on x86 but was never
>> enabled on Arm because the final binary is bigger than 2MB (
>> the maximum we can currently handled).
>>
>> With the recent rework, it is now possible to grow Xen over 2MB.
>> So there is no more roadblock to enable Xen other than increasing
>> the reserved area.
>>
>> On my setup, for arm32, the final binaray was very close to 4MB.
>> Furthermore, one may want to enable USBAN and GCOV which would put
>> the binary well-over 4MB (both features require for some space).
>> Therefore, increase the size to 8MB which should us some margin.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ----
>>
>> The drawback with this approach is that we are adding 6 new
>> page-table (3 for boot and 3 for runtime) that are statically
>> allocated. So the final Xen binary will be 24KB bigger when
>> neither UBSAN nor GCOV.
>>
>> If this is not considered acceptable, then we could make the
>> size of configurable in the Kconfig and decide it based on the
>> features enabled.
> Both of these features are enabled only in a debug build of Xen, so
> another option would be to increase Xen size only for a debug build.

At least UBSAN can be selected without DEBUG. For that you need to add 
EXPERT.

Anyway, from your comment, it is not clear to me whether you dislike the 
existing approach (and why) or you are OK with the increase.

Cheers,

-- 
Julien Grall


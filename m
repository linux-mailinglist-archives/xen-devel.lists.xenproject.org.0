Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD437EB57
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 00:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126445.238040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgxBj-0007YZ-Eu; Wed, 12 May 2021 22:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126445.238040; Wed, 12 May 2021 22:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgxBj-0007W2-BO; Wed, 12 May 2021 22:18:43 +0000
Received: by outflank-mailman (input) for mailman id 126445;
 Wed, 12 May 2021 22:18:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgxBi-0007Vw-LU
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 22:18:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgxBg-0004fq-Ui; Wed, 12 May 2021 22:18:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgxBg-0006K6-Ov; Wed, 12 May 2021 22:18:40 +0000
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
	bh=fG92JyapnWWZhAVzqQe7939190PRNkzzWbXxx+gTR/c=; b=kACCT2zp03nvUVWCVdEz+IKPLN
	IcKbuU8q9wdkLevAtctsIHedQVXNYlMNw2NUh9VJiuo9F2EEjJ66YTi3s2Swww+PLiVcuTMa9nmRa
	kKQcZ/Ts7sOz5ttSVaLaGttbDVxUcg4dvmJvc1CoPJ46JJICUb2vuMODVCJHYUZ7CFHk=;
Subject: Re: [PATCH RFCv2 07/15] xen/arm: mm: Re-implement early_fdt_map()
 using map_pages_to_xen()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-8-julien@xen.org>
 <alpine.DEB.2.21.2105121437501.5018@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <68422df9-014e-7acb-f10f-f605a7233f40@xen.org>
Date: Wed, 12 May 2021 23:18:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2105121437501.5018@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 12/05/2021 22:41, Stefano Stabellini wrote:
> On Sun, 25 Apr 2021, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> Now that map_pages_to_xen() has been extended to support 2MB mappings,
>> we can replace the create_mappings() calls by map_pages_to_xen() calls.
>>
>> The mapping can also be marked read-only has Xen as no business to
>> modify the host Device Tree.
> 
> I think that's good. Just FYI there is some work at Xilinx to make
> changes to the device tree at runtime but we'll cross that bridge when
> we come to it.

This particular mapping is only used during early boot. After the DT has 
been unflatten, this region is unmapped and the physical memory released.

So if the DT needs to be modified at runtime, then you would most likely 
want to modify the unflatten version.

> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thank you!

Cheers,

-- 
Julien Grall


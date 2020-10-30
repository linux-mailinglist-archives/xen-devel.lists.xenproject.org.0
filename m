Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C522A0D64
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 19:29:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16157.39480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZ9V-00080X-Oh; Fri, 30 Oct 2020 18:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16157.39480; Fri, 30 Oct 2020 18:29:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYZ9V-00080C-LR; Fri, 30 Oct 2020 18:29:29 +0000
Received: by outflank-mailman (input) for mailman id 16157;
 Fri, 30 Oct 2020 18:29:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYZ9U-000807-NF
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:29:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa7a890d-dcbe-472b-a00f-024c4cac5286;
 Fri, 30 Oct 2020 18:29:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZ9K-0007ot-70; Fri, 30 Oct 2020 18:29:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYZ9J-0004ZA-UP; Fri, 30 Oct 2020 18:29:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYZ9U-000807-NF
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 18:29:28 +0000
X-Inumbo-ID: fa7a890d-dcbe-472b-a00f-024c4cac5286
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id fa7a890d-dcbe-472b-a00f-024c4cac5286;
	Fri, 30 Oct 2020 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=m1iLd6OVDkA18gJijDSiOaMYJIVKnYJ2qasVX+GACqo=; b=vRgl4VIS+gVfuK2bX54gKVPyGk
	aiEyoLnMRagugtsvaviLN5dZWNnimPLfmc5dOU6v27OfJGIh2j9TGuIrNj37McNnuJQHTiZDoMhuU
	ftKqZx/Knk601P1sc3NegCzrp60GgKWNE1zVCZ19vlFWGl+EtIxDBm5pu1GgzeNGsiI8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZ9K-0007ot-70; Fri, 30 Oct 2020 18:29:18 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYZ9J-0004ZA-UP; Fri, 30 Oct 2020 18:29:18 +0000
Subject: Re: [PATCH v2 2/7] xen/arm: acpi: The fixmap area should always be
 cleared during failure/unmap
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
 masami.hiramatsu@linaro.org, ehem+xen@m5p.com, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Rahul.Singh@arm.com, Julien Grall
 <jgrall@amazon.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Wei Xu <xuwei5@hisilicon.com>
References: <20201023154156.6593-1-julien@xen.org>
 <20201023154156.6593-3-julien@xen.org>
 <alpine.DEB.2.21.2010231714510.12247@sstabellini-ThinkPad-T480s>
 <6038f41f-594c-e573-9126-f31291af9c38@xen.org>
 <alpine.DEB.2.21.2010301127470.12247@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <5a8afe57-1be5-6a0b-2ed5-e668690fc246@xen.org>
Date: Fri, 30 Oct 2020 18:29:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010301127470.12247@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 30/10/2020 18:28, Stefano Stabellini wrote:
> On Fri, 30 Oct 2020, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 24/10/2020 01:16, Stefano Stabellini wrote:
>>> On Fri, 23 Oct 2020, Julien Grall wrote:
>>>>    bool __acpi_unmap_table(const void *ptr, unsigned long size)
>>>>    {
>>>>        vaddr_t vaddr = (vaddr_t)ptr;
>>>> +    unsigned int idx;
>>>> +
>>>> +    /* We are only handling fixmap address in the arch code */
>>>> +    if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
>>>> +         (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END)) )
>>>
>>> Is it missing "+ PAGE_SIZE"?
>>>
>>>      if ( (vaddr < FIXMAP_ADDR(FIXMAP_ACPI_BEGIN)) ||
>>>           (vaddr >= FIXMAP_ADDR(FIXMAP_ACPI_END) + PAGE_SIZE) )
>>
>> Yes it should be + PAGE_SIZE. Do you mind if I fix it on commit?
> 
> No, I don't mind. Go ahead.

I technically don't have a ack for this patch. Can I consider this as a 
Acked-by? :)

Cheers,

-- 
Julien Grall


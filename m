Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06464AF521
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 16:23:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269329.463386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHoon-0004ux-U6; Wed, 09 Feb 2022 15:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269329.463386; Wed, 09 Feb 2022 15:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHoon-0004t6-R2; Wed, 09 Feb 2022 15:23:41 +0000
Received: by outflank-mailman (input) for mailman id 269329;
 Wed, 09 Feb 2022 15:23:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHoon-0004t0-6x
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 15:23:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHoom-0007L3-RR; Wed, 09 Feb 2022 15:23:40 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHoom-0008RR-Li; Wed, 09 Feb 2022 15:23:40 +0000
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
	bh=R6qOKoOoOjM4J0QUUpq0oWvOJZyhpCwg4brMxSJh6W8=; b=F0Td/WSSvFdD6x0i6w4vZcfU6I
	zNvQjSxo1zNf4FMZ012pVswkX439vYtpE8eRmSjm/YhwPMmfPTrlAA2oRQ5+AXXE/aHF+87VW5Amy
	7h+VmaqclatmxV5fCvGA7cSPRF44Th6Mj00BkdyHOVaAO3XckKnDlh5H6LghBxQeHq/Y=;
Message-ID: <9e31e46c-f516-46df-4f82-f7c11b444747@xen.org>
Date: Wed, 9 Feb 2022 15:23:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC v2 5/8] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1644341635.git.oleksii_moisieiev@epam.com>
 <cb1493f5d9b5c3437268054b4a8e345cb35c8708.1644341635.git.oleksii_moisieiev@epam.com>
 <1bfc6aa8-6252-e22a-4e10-6a5efdd15229@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1bfc6aa8-6252-e22a-4e10-6a5efdd15229@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2022 15:02, Oleksandr Andrushchenko wrote:
>> +{
>> +    return FIELD_PREP(HDR_ID, hdr->id) |
>> +        FIELD_PREP(HDR_TYPE, hdr->type) |
>> +        FIELD_PREP(HDR_PROTO, hdr->protocol);
>> +}
>> +
>> +/*
>> + * unpack_scmi_header() - unpacks and records message and protocol id
>> + *
>> + * @msg_hdr: 32-bit packed message header sent from the platform
>> + * @hdr: pointer to header to fetch message and protocol id.
>> + */
>> +static inline void unpack_scmi_header(uint32_t msg_hdr, scmi_msg_header_t *hdr)
>> +{
>> +    hdr->id = FIELD_GET(HDR_ID, msg_hdr);
>> +    hdr->type = FIELD_GET(HDR_TYPE, msg_hdr);
>> +    hdr->protocol = FIELD_GET(HDR_PROTO, msg_hdr);
>> +}
>> +
>> +static inline int channel_is_free(struct scmi_channel *chan_info)
>> +{
>> +    return ( chan_info->shmem->channel_status
>> +            & SCMI_SHMEM_CHAN_STAT_CHANNEL_FREE ) ? 0 : -EBUSY;
>> +}
>> +
>> +/*
>> + * Copy data from IO memory space to "real" memory space.
>> + */
>> +void __memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
> This seems to be a copy of [2].
> We should think about moving this into a dedicated file like in Linux,
> preserving the authorship+

+1. Also this should be in a separate patch.

Cheers,

-- 
Julien Grall


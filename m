Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE4615EF4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 10:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435694.689383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9jg-00065S-A6; Wed, 02 Nov 2022 09:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435694.689383; Wed, 02 Nov 2022 09:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oq9jg-000637-7H; Wed, 02 Nov 2022 09:08:36 +0000
Received: by outflank-mailman (input) for mailman id 435694;
 Wed, 02 Nov 2022 09:08:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oq9je-000631-Sn
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 09:08:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9je-00064U-ID; Wed, 02 Nov 2022 09:08:34 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.26.173]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oq9je-0000Ru-90; Wed, 02 Nov 2022 09:08:34 +0000
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
	bh=RLFowBG2jiqBOiJts4yeqkMa0/QhmAvTm3aZ9Rg2EbU=; b=4LHxOFQXvbzpNw5zc5SRNVwwCd
	/PNZqFKm9dNPEA12bmE8WGq5iVED38pL5ylOdcC+kAdYKWpzksFkduRt9+UvnKoXGkAJa0BQhwute
	1Ja22an5uDD2u9rDak/3G3TnC51aHgLtSR/0mH/H3ynMjS3P8k87iO0YR2EeQRC41w7k=;
Message-ID: <e16b5889-1594-39ad-a6bc-02ce6f4d7d45@xen.org>
Date: Wed, 2 Nov 2022 09:08:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on
 Aarch32
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-4-ayankuma@amd.com>
 <a4881436-83f3-c580-ed96-ac6b477e325e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a4881436-83f3-c580-ed96-ac6b477e325e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/11/2022 08:52, Michal Orzel wrote:
>>   /* N-bit register helpers */
>>   #define VREG_REG_HELPERS(sz, offmask)                                   \
>>   static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
>>                                                   const mmio_info_t *info)\
>>   {                                                                       \
>> -    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
>> -                            info->dabt.size);                           \
>> +    unsigned int offset = info->gpa & (offmask);                        \
> In all the other helpers you are also defining the variables to store shift and mask,
> no matter the number of uses. I know that this is a left over from the removed helpers,
> but since you are modifying the file you could improve consistency and define them
> here as well.

Nack. We don't define extra local variable just for consistency. They 
are added in some places below to reduce the number of operation in one 
line.

This is not necessary here.

Cheers,

-- 
Julien Grall


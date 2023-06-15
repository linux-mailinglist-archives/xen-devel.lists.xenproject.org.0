Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A07320ED
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 22:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549829.858596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ta7-0002jD-T9; Thu, 15 Jun 2023 20:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549829.858596; Thu, 15 Jun 2023 20:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ta7-0002gy-Q4; Thu, 15 Jun 2023 20:28:35 +0000
Received: by outflank-mailman (input) for mailman id 549829;
 Thu, 15 Jun 2023 20:28:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q9ta6-0002gq-9z
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 20:28:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9ta5-0006Ze-T6; Thu, 15 Jun 2023 20:28:33 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.16.225]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q9ta5-0001oN-Mt; Thu, 15 Jun 2023 20:28:33 +0000
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
	bh=gCze7DpVgdh1qiNLAimpY+xJ61OAwQr/ilUidAqwa0k=; b=Qnus4U3r9U59PZYlr/ELITj7jK
	dBzHZVMah6mtVtNH6QjR3BIO5ODRJn/XycYjGmfWIwy0owAmxdrTAEWjbAq2SoUNGbse8S/pw3XC4
	lm4hs4qf9cE7RTE2TSnFCcbCfX8yMika0/2KY7xdB8rE+r2V1Fse45CUdhhLJbVNb0rs=;
Message-ID: <8acfbb02-f5d1-fb15-d375-0638346cba57@xen.org>
Date: Thu, 15 Jun 2023 21:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN v8 5/5] xen/arm: p2m: Enable support for 32bit IPA for
 ARM_32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
 <20230602120754.23817-6-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230602120754.23817-6-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 02/06/2023 13:07, Ayan Kumar Halder wrote:
> Refer ARM DDI 0406C.d ID040418, B3-1345,
> 
> "A stage 2 translation with an input address range of 31-34 bits can
> start the translation either:
> 
> - With a first-level lookup, accessing a first-level translation
>    table with 2-16 entries.
> 
> - With a second-level lookup, accessing a set of concatenated
>    second-level translation tables"
> 
> Thus, for 32 bit IPA, there will be no concatenated root level tables.
> So, the root-order is 0.
> 
> Also, Refer ARM DDI 0406C.d ID040418, B3-1348
> "Determining the required first lookup level for stage 2 translations
> 
> For a stage 2 translation, the output address range from the stage 1
> translations determines the required input address range for the stage 2
> translation. The permitted values of VTCR.SL0 are:
> 0b00 Stage 2 translation lookup must start at the second level.
> 0b01 Stage 2 translation lookup must start at the first level.
> 
> VTCR.T0SZ must indicate the required input address range. The size of
> the input address region is 2^(32-T0SZ) bytes."
> 
> Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = 0 when the size of
> input address region is 2^32 bytes.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


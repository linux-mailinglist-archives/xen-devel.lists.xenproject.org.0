Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCFD6E7AAA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523459.813523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7pe-00014j-EX; Wed, 19 Apr 2023 13:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523459.813523; Wed, 19 Apr 2023 13:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7pe-00012G-BZ; Wed, 19 Apr 2023 13:26:46 +0000
Received: by outflank-mailman (input) for mailman id 523459;
 Wed, 19 Apr 2023 13:26:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pp7pc-00012A-2x
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:26:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp7pb-0005EK-JK; Wed, 19 Apr 2023 13:26:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.29.18]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pp7pb-0006MR-BN; Wed, 19 Apr 2023 13:26:43 +0000
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
	bh=GT73UPkmb2sR/HGFpxdQ3inbqkPJSbG2H9bMIcU03NM=; b=gQHSN2NqsRPyXuR8xojrFX7rvW
	aQlTPHPVO0uBRGkdIWdeAqw8BL/ovKmKjuvlYfQPdyexEr9vQZtKoqmNyzz7ykU0Mb8fcFDUd97jN
	hh7Px0qPtzfrnik87X/M5z1QGeKRQnaM3JkaM5UWsSEHIjJr8tZBMUWq1p9JHf+oin4U=;
Message-ID: <752ce1ba-8c23-e397-3f6a-15c93ac6cee0@xen.org>
Date: Wed, 19 Apr 2023 14:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 02/10] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-3-ayan.kumar.halder@amd.com>
 <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <458367fe-1781-7751-230c-8a43cecbfca6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

>> diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
>> new file mode 100644
>> index 0000000000..3296a368a6
>> --- /dev/null
>> +++ b/xen/include/xen/libfdt/libfdt-xen.h
>> @@ -0,0 +1,55 @@
>> +/*
>> + * SPDX-License-Identifier: GPL-2.0-only
> Our CODING_STYLE says:
> New files should start with a single-line SPDX comment, ..., e.g.
> /* SPDX-License-Identifier: GPL-2.0 */
> 
> For me it would be perfectly fine to do as you did but it is not what our docs state
> (i.e. single-line comment). It might be that we need to modify CODING_STYLE instead.

 From my reading of https://spdx.dev/ids/#how, what you suggest would 
not be a valid SPDX-License-Idenfier as everything in needs to be in 
*one* (including the begin/end comment).

Cheers,

-- 
Julien Grall


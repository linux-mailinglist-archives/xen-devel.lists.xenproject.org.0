Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E034E748576
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 15:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559197.873968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2vV-0005fn-NJ; Wed, 05 Jul 2023 13:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559197.873968; Wed, 05 Jul 2023 13:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2vV-0005dv-KN; Wed, 05 Jul 2023 13:52:13 +0000
Received: by outflank-mailman (input) for mailman id 559197;
 Wed, 05 Jul 2023 13:52:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH2vU-0005dp-5n
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 13:52:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH2vT-0000sJ-Lf; Wed, 05 Jul 2023 13:52:11 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.19.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH2vT-00017N-G6; Wed, 05 Jul 2023 13:52:11 +0000
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
	bh=KSSwevGb69gYHitIjlCFTafPkDM1vWEpOw4yY1XS/2o=; b=x9YZMe51s2nbaizT6GI4RATYmZ
	qcYYw+IatlecOJ5MViD/W6PoznjIz3qBTRCaCobOg6idVQs1cdaL3ppqed9oBC3Yxt3sbF9xJQGQJ
	A1tF5ps3WlJpAcLUsasXe6649yreaR6xYpFMMstGlR97gM1sQLEOlEMtKqg7IF27mUYM=;
Message-ID: <3114b76e-1cf9-12ef-d83c-76c566009e71@xen.org>
Date: Wed, 5 Jul 2023 14:52:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 33/52] xen/mpu: initialize frametable in MPU system
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-34-Penny.Zheng@arm.com>
 <ee709651-a6fc-2485-ae2b-edf0306fbc13@amd.com>
 <db707ef1-cc91-bc7d-33d2-bf804ece2226@arm.com>
 <15791f2e-b4cf-aa60-3f67-d9e74877e54b@xen.org>
 <63c58ce7-08c0-e86c-acec-9273f48cdc12@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <63c58ce7-08c0-e86c-acec-9273f48cdc12@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 05/07/2023 10:53, Penny Zheng wrote:
>>> Since if not and when anyone wants to update map_pages_to_xen(), 
>>> destroy_xen_mappings() and modify_xen_mappings() in the future, it is 
>>> possible for them to leave changes in only one file.
>>
>> The helpers are just wrappers. I doubt they will change in the future. 
>> So I think it would be OK to duplicate.
>>
>> The alternative would to have a common prototype for xen_pt_update() 
>> and xen_mpumap_update() and avoid any #ifdery. That said, this is not 
>> my preference at least if they are not static inline.
>>
> 
> Correct me if I'm wrong, you are suggesting something like this:
> A more-generic wrapper like xen_mm_update, and we introduce static 
> inline implementation in mmu/mm.h with xen_pt_update(), and static
> inline implementation in mpu/mm.h with xen_mpumap_update().

Yes as an alternative proposal. But my preference here is to duplicate 
the helpers in mm-mmu.c and mm-mpu.c.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56F567EE15
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 20:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485902.753336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLUGG-0002CV-RO; Fri, 27 Jan 2023 19:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485902.753336; Fri, 27 Jan 2023 19:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLUGG-0002AL-O0; Fri, 27 Jan 2023 19:19:44 +0000
Received: by outflank-mailman (input) for mailman id 485902;
 Fri, 27 Jan 2023 19:19:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pLUGF-0002AD-GI
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 19:19:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLUGE-0006KB-Ur; Fri, 27 Jan 2023 19:19:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pLUGE-00013e-Oq; Fri, 27 Jan 2023 19:19:42 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=uHaXHL/FVNly5UZIdc3Ga9SPTYKmG02IgzTGGybur6I=; b=Yq4FK+kW1oOq9Rl6jhjyICqw8B
	g5k31CFRoq4rmZeEbQqcPF5Bsqkps4CDo3bU2CogYFdVsHA3r35IwQcgiIBp6C1MwCV2qkqpEZ2zz
	4LU1FHqNlSNxP3hHwdfDdSDWx1JKKD92pBflVKvAzk9Dlyh/uXjNJJhglTFkm9ATO6Bg=;
Message-ID: <d1240124-8dd5-74c5-381a-0ee0edb49c43@xen.org>
Date: Fri, 27 Jan 2023 19:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/14] xen/arm32: head: Widen the use of the temporary
 mapping
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-11-julien@xen.org>
 <0271e540-d3b0-fb9b-0f66-015abb45231c@amd.com>
 <5c18827c-ffc2-1c31-bd7c-812ca05c4bc3@xen.org>
In-Reply-To: <5c18827c-ffc2-1c31-bd7c-812ca05c4bc3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 24/01/2023 19:43, Julien Grall wrote:
>>> -        /*
>>> -         * This will override the link to boot_second in 
>>> XEN_FIRST_SLOT.
>>> -         * The page-tables are not live yet. So no need to use
>>> -         * break-before-make.
>>> -         */
>>>           create_table_entry boot_pgtable, boot_second_id, r9, 1
>>>           create_table_entry boot_second_id, boot_third_id, r9, 2
>> Do we need to duplicate this if we just did the same in 
>> create_page_tables before branching to
>> use_temporary_mapping?
> 
> Hmmm... Possibly not. I will give a try and let you know.

I confirm this is not necessary. So I have removed the two lines.

Cheers,

-- 
Julien Grall


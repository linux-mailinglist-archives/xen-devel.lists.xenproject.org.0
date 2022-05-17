Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1061529A9E
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 09:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330515.553901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqrPY-0007Xu-FK; Tue, 17 May 2022 07:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330515.553901; Tue, 17 May 2022 07:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqrPY-0007Ul-CE; Tue, 17 May 2022 07:14:28 +0000
Received: by outflank-mailman (input) for mailman id 330515;
 Tue, 17 May 2022 07:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6f+b=VZ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nqrPX-0007Uf-0Z
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 07:14:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fb0ed061-d5b0-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 09:14:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FF241063;
 Tue, 17 May 2022 00:14:24 -0700 (PDT)
Received: from [10.57.3.238] (unknown [10.57.3.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 988D23F718;
 Tue, 17 May 2022 00:14:22 -0700 (PDT)
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
X-Inumbo-ID: fb0ed061-d5b0-11ec-837e-e5687231ffcc
Message-ID: <9eb95e25-1a19-4048-259f-dc2dbee6cac7@arm.com>
Date: Tue, 17 May 2022 09:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] xen/arm: gnttab: modify macros to evaluate all
 arguments and only once
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20220506094225.181815-1-michal.orzel@arm.com>
 <20220506094225.181815-3-michal.orzel@arm.com>
 <ed8e9d16-56ea-68ab-8221-d654e15b40a0@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <ed8e9d16-56ea-68ab-8221-d654e15b40a0@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 16.05.2022 12:19, Julien Grall wrote:
> Hi Michal,
> 
> On 06/05/2022 10:42, Michal Orzel wrote:
>> Modify macros to evaluate all the arguments and make sure the arguments
>> are evaluated only once. Introduce following intermediate macros:
>> gnttab_status_gfn_, gnttab_shared_gfn_ that do not take domain as a
>> parameter. These are to be used locally and allow us to avoid passing
>> NULL from gnttab_get_frame_gfn to the respective macros (without _ suffix).
>> Make use of a domain parameter from gnttab_shared_gfn and gnttab_status_gfn
>> by adding an ASSERT.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> Most of the helpers below are going to disappear with Oleksandr latest work (see [1]).
> 
> Looking at Oleksandr's patch, I think only gnttab_set_frame_gfn() would end up to use one of the macro parameters twice. So I would like to suggest to chat with Oleksandr if we can tweak his patch (can be done on commit) or we rebase this patch on top of his work.
> 
> Cheers,
> 
> [1] https://lore.kernel.org/xen-devel/1652294845-13980-1-git-send-email-olekstysh@gmail.com/
> 

By looking at Oleksandr patch:
1. there are 2 macros: gnttab_set_frame_gfn, gnttab_need_iommu_mapping that use one of the macro parameters twice.
2. gnttab_get_frame_gfn still passes NULL as a domain parameter to gnttab_shared_gfn/gnttab_status_gfn that do not evaluate domain parameter

I agree that point 1 could be fixed on commit but point 2 requires in my opinion adding intermediate macros to avoid passing NULL (just like I did).

As this would require more work from Oleksandr, I'm ok to rebase my patch on top of his work once merged.

Cheers,
Michal


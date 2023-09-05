Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83D792EC7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 21:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595819.929435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdbaK-0002jG-Hg; Tue, 05 Sep 2023 19:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595819.929435; Tue, 05 Sep 2023 19:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdbaK-0002hZ-Ef; Tue, 05 Sep 2023 19:19:36 +0000
Received: by outflank-mailman (input) for mailman id 595819;
 Tue, 05 Sep 2023 19:19:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZRj=EV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qdbaJ-0002hT-9h
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 19:19:35 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23056259-4c21-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 21:19:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4335E828588D;
 Tue,  5 Sep 2023 14:19:29 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vGVnCSTeHm2g; Tue,  5 Sep 2023 14:19:27 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A09D5828589F;
 Tue,  5 Sep 2023 14:19:27 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id b8Q-ddKtp9kd; Tue,  5 Sep 2023 14:19:27 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 322AC828588D;
 Tue,  5 Sep 2023 14:19:27 -0500 (CDT)
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
X-Inumbo-ID: 23056259-4c21-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A09D5828589F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693941567; bh=nl4E7DZVQLWnURdI6KAIDmOWsKZeIcwUKfpaDJdm+0g=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=WH68cvnuXcioT40XevLtFBQFbTb2DErYzC/8rTFmObBGwwkKxuFMQxj/Cs89Zubix
	 d2wUAdZci4YgQ4F8AGEhztuFS9WZ/4hzEINITMT8xOs/oCDuzYY3JQwXR0mE9xzOCo
	 qWni2c4Qkie8bcStkDqwbbdIXv8d62bcU+H4NOns=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <df8de9f5-f1d2-61a6-7bc3-e74d5a99270a@raptorengineering.com>
Date: Tue, 5 Sep 2023 14:19:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v4 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1692744718.git.sanastasio@raptorengineering.com>
 <7cebc2962002c36ecfe712bf1bcb251e083910b8.1692744718.git.sanastasio@raptorengineering.com>
 <45081782-69cb-1b8e-7925-fd9fb4e3d0c4@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <45081782-69cb-1b8e-7925-fd9fb4e3d0c4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/5/23 5:01 AM, Jan Beulich wrote:
> On 23.08.2023 01:03, Shawn Anastasio wrote:
>> Add code to construct early identity-mapped page tables as well as the
>> required process and partition tables to enable the MMU.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> Having committed this, something broke in CI. As per the artifacts of
> https://gitlab.com/xen-project/xen/-/jobs/5017915681 ...
> 
>> +void __init setup_initial_pagetables(void)
>> +{
>> +    struct lvl1_pd *root = lvl1_pd_pool_alloc();
>> +    unsigned long lpcr;
>> +
>> +    setup_initial_mapping(root, (vaddr_t)_start, (vaddr_t)_end, __pa(_start));
>> +
>> +    /* Enable Radix mode in LPCR */
>> +    lpcr = mfspr(SPRN_LPCR);
>> +    mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
>> +    early_printk("Enabled radix in LPCR\n");
> 
> ... this is the first message missing; setup_initial_mapping() appears
> to be completing fine.

Ah, yes, this is a side-effect of the CI pipeline using the pseries
machine type instead of PowerNV. Setting the LPCR directly as we're
doing here has to be done via a hypercall on the paravirtualized pseries
platform.

I've given it some thought and I think the best path forward would be to
just drop pseries support. I had originally targeted it for the early
bringup patches since it has historically been much better supported by
QEMU, but that's no longer the case with QEMU git. Outside of testing I
don't think there's much practical value in continuing to support
pseries.

I'll prepare a series to drop pseries support and update the CI
container to use the PowerNV machine type instead, if there are no
objections.

> Jan

Thanks,
Shawn


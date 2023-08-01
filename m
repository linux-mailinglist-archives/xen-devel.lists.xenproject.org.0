Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F66A76BC48
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 20:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574471.899769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQu2w-0002Sx-UU; Tue, 01 Aug 2023 18:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574471.899769; Tue, 01 Aug 2023 18:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQu2w-0002R8-Qd; Tue, 01 Aug 2023 18:24:38 +0000
Received: by outflank-mailman (input) for mailman id 574471;
 Tue, 01 Aug 2023 18:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUJK=DS=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQu2u-0002R0-Qp
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 18:24:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2c0585-3098-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 20:24:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2399D8285497;
 Tue,  1 Aug 2023 13:24:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id pfcc-9Db09eW; Tue,  1 Aug 2023 13:24:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3BDFC82853DF;
 Tue,  1 Aug 2023 13:24:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jA2m5m0n0gwk; Tue,  1 Aug 2023 13:24:33 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C738F82853A7;
 Tue,  1 Aug 2023 13:24:32 -0500 (CDT)
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
X-Inumbo-ID: aa2c0585-3098-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3BDFC82853DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690914273; bh=J+KyGv3B071ltB41m2dhkYpEyS/dfVfCw6N9IXMQuXg=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=tFc/gBF/GYxmm8tIU0WS0JMCr4nz2Xp63agoBUSIKNk3ohVAGCsIxeKadhCMQVYEs
	 FW5nU1Z3etiUCug82F13hvV/PpJnhWEVPgs8Sx5/eYyWPoQMEyzUyXJYUzv94T2QMe
	 yPEE0Tmc04Kx3swFnGlfiV9MLfcbtJL4GoH2dljY=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f3894efa-0eb6-a9de-f84a-413531f26108@raptorengineering.com>
Date: Tue, 1 Aug 2023 13:24:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] xen/ppc: Parse device tree for OPAL node on PowerNV
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <fc4011f42ea017ec9ae12c4f1a0c1a09b7bbcfc8.1690579561.git.sanastasio@raptorengineering.com>
 <bc5d6856-03b3-038c-8d9d-fb06309e766f@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <bc5d6856-03b3-038c-8d9d-fb06309e766f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/31/23 11:06 AM, Jan Beulich wrote:
> On 28.07.2023 23:35, Shawn Anastasio wrote:
>> --- a/xen/arch/ppc/arch.mk
>> +++ b/xen/arch/ppc/arch.mk
>> @@ -10,5 +10,5 @@ CFLAGS += -mstrict-align -mcmodel=medium -mabi=elfv2 -fPIC -mno-altivec -mno-vsx
>>  LDFLAGS += -m elf64lppc
>>  
>>  # TODO: Drop override when more of the build is working
>> -override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o
>> -override ALL_LIBS-y =
>> +override ALL_OBJS-y = arch/$(SRCARCH)/built_in.o common/libfdt/built_in.o lib/built_in.o
>> +override ALL_LIBS-y = lib/lib.a
> 
> Can't you drop the ALL_LIBS-y override right here?

Just tested this and it does indeed work. I'll drop the override in v2.

> Jan

Thanks,
Shawn


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A03358349
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107299.205124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTnK-0005nF-Qh; Thu, 08 Apr 2021 12:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107299.205124; Thu, 08 Apr 2021 12:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTnK-0005mt-NQ; Thu, 08 Apr 2021 12:29:58 +0000
Received: by outflank-mailman (input) for mailman id 107299;
 Thu, 08 Apr 2021 12:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUTnI-0005mo-VB
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:29:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 178b3c63-22d6-4a6a-937e-16091006bdfa;
 Thu, 08 Apr 2021 12:29:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7871DB11B;
 Thu,  8 Apr 2021 12:29:55 +0000 (UTC)
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
X-Inumbo-ID: 178b3c63-22d6-4a6a-937e-16091006bdfa
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617884995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjSH2fpMc5hZ0rfU4D5+PvBOyDoCyUmQcgv8uI1jvBg=;
	b=LSPbTu4MyD2WH9lSthnXrY4NBkyi7gabPeNh+AJ3SD++dcbdBZ97AMGmA/3UBj28NQ2TMj
	NAUeCGTaRefF1KkMIfxxxDjSon5dLmpYufQZRYAySAST1b36scTD8c6q6NDkwXMciBAdXD
	cK/HxRnghw39gPnTI+pl802j8nrzKF8=
Subject: Re: [PATCH 02/11] x86/vPMU: avoid effectively open-coding
 xzalloc_flex_struct()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <ec03cef8-a883-fd68-a062-c243d782394c@suse.com>
 <ededfb52-6dc6-6c5d-1684-d6fe0e14eb74@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0621335d-684c-223b-deec-a2ee028d991d@suse.com>
Date: Thu, 8 Apr 2021 14:29:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ededfb52-6dc6-6c5d-1684-d6fe0e14eb74@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.04.2021 14:25, Andrew Cooper wrote:
> On 08/04/2021 13:17, Jan Beulich wrote:
>> There is a difference in generated code: xzalloc_bytes() forces
>> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
>> actually don't want it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

>> --- a/xen/arch/x86/cpu/vpmu_intel.c
>> +++ b/xen/arch/x86/cpu/vpmu_intel.c
>> @@ -461,10 +461,10 @@ static int core2_vpmu_alloc_resource(str
>>              goto out_err;
>>      }
>>  
>> -    core2_vpmu_cxt = xzalloc_bytes(sizeof(*core2_vpmu_cxt) +
>> -                                   sizeof(uint64_t) * fixed_pmc_cnt +
>> -                                   sizeof(struct xen_pmu_cntr_pair) *
>> -                                   arch_pmc_cnt);
>> +    core2_vpmu_cxt = xzalloc_flex_struct(struct xen_pmu_intel_ctxt, regs,
>> +                                         fixed_pmc_cnt + arch_pmc_cnt *
>> +                                         (sizeof(struct xen_pmu_cntr_pair) /
>> +                                          sizeof(*core2_vpmu_cxt->regs)));
>>      p = xzalloc(uint64_t);
> 
> However, this is very wtf, and clearly wants reworking.  I'll see if I
> can find some time, unless anyone else beats me to it.

I thought so too while seeing this, but it's quite a bit more of a
rework than I felt I'd like to tackle right away.

Jan


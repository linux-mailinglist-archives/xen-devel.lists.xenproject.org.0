Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFAC35F424
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 14:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110575.211049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWetZ-0006lD-5x; Wed, 14 Apr 2021 12:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110575.211049; Wed, 14 Apr 2021 12:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWetZ-0006ko-2f; Wed, 14 Apr 2021 12:45:25 +0000
Received: by outflank-mailman (input) for mailman id 110575;
 Wed, 14 Apr 2021 12:45:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWetX-0006ki-Lb
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 12:45:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7576103b-338c-4531-a21e-294f2563fe37;
 Wed, 14 Apr 2021 12:45:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0599FB024;
 Wed, 14 Apr 2021 12:45:22 +0000 (UTC)
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
X-Inumbo-ID: 7576103b-338c-4531-a21e-294f2563fe37
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618404322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mB7Hcpj8aW4pjU974L1agqDayu6bV6QLOWLnfSx1KnI=;
	b=NHOdQP5auUdFsXlCF7mJzih+9nnb2HPdhLCd8NkS0CVUoUF0F79Vd5WMk2DxD7MiMaNtOj
	LG+4KUrd2kkeiAvCzatMm+W2/Rz4alRhqv1VRzSz7rDXhKRkBOakioRz4IBx63YYL4Tjwu
	3PtrU9Nma03UWAhpJhqaT2TsGF7FYZc=
Subject: Re: [PATCH 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20210414110433.83084-1-roger.pau@citrix.com>
 <20210414110433.83084-3-roger.pau@citrix.com>
 <97d443b0-f5c2-0183-74c1-ab16d3cf1e7d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <63738788-c7ed-13f7-acaa-c1ad102442a3@suse.com>
Date: Wed, 14 Apr 2021 14:45:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <97d443b0-f5c2-0183-74c1-ab16d3cf1e7d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.04.2021 14:33, Andrew Cooper wrote:
> On 14/04/2021 12:04, Roger Pau Monne wrote:
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -178,6 +178,11 @@ static const char *const str_7a1[32] =
>>      [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
>>  };
>>  
>> +static const char *const str_e21a[32] =
>> +{
>> +    [ 2] = "lfence-always-serializing",
> 
> This is a bit of a mouthful.  One problem is the fact that "serialising"
> is an ambiguous term, because neither Intel nor AMD formally specify
> what it means in the architecture.
> 
> There is a description of what "architecturally serialising" does, which
> does occasionally move over time, and the name of this CPUID bit in the
> PPR confusing at best, because it very much isn't "architecturally
> serialising", and the term "dispatch serialising" isn't actually defined
> anywhere.
> 
> Intel have now started referring to LFENCE as a "speculative execution
> barrier", but this still doesn't have a precise definition.
> 
> I'm afraid I don't have a useful suggestion for something short and
> concise, which also conveys the precise meaning.

How about "lfence+" or some such?

Jan


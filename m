Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF83510B2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 10:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104142.198825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsTK-0002kh-Se; Thu, 01 Apr 2021 08:14:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104142.198825; Thu, 01 Apr 2021 08:14:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRsTK-0002kM-PQ; Thu, 01 Apr 2021 08:14:34 +0000
Received: by outflank-mailman (input) for mailman id 104142;
 Thu, 01 Apr 2021 08:14:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRsTK-0002kH-29
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 08:14:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c259dab-e72e-4d58-ad03-c299b6bc02f0;
 Thu, 01 Apr 2021 08:14:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA2C4AD9F;
 Thu,  1 Apr 2021 08:14:31 +0000 (UTC)
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
X-Inumbo-ID: 8c259dab-e72e-4d58-ad03-c299b6bc02f0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617264871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+Mwczd/JLppQkoJwt/WdnAEqqg2B2/Bm6sAPhNxIaQ=;
	b=GObWplHcaORdQh3kcmXAJzUYEdVO3cN6NN/+sGUlggjxtkRM4h1vw6+FNaVUq16GkYJGix
	ym7//FSMQwtUFLeFc8nFxHGFAM91uKlWHaJ9KyTEbuhIwJ6Fiw7jXXobEy6wt6H6w99NE/
	E7SODNZ74QVDiufIDVQZz0nvbP3qM0A=
Subject: =?UTF-8?Q?Ping=c2=b2=3a_=5bPATCH=5d_x86/CPUID=3a_move_some_static_m?=
 =?UTF-8?Q?asks_into_=2einit?=
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2e3dfe1a-bc8b-6774-ef7e-efb565343c52@suse.com>
 <ed96af1b-62ba-a7ca-913f-74e454ca9e2f@suse.com>
Message-ID: <fe3120a6-df1d-3e89-0150-922ffa1cc39e@suse.com>
Date: Thu, 1 Apr 2021 10:14:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ed96af1b-62ba-a7ca-913f-74e454ca9e2f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.07.2020 16:55, Jan Beulich wrote:
> On 15.07.2020 09:45, Jan Beulich wrote:
>> Except for hvm_shadow_max_featuremask and deep_features they're
>> referenced by __init functions only.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/cpuid.c
>> +++ b/xen/arch/x86/cpuid.c
>> @@ -16,12 +16,15 @@
>>  const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>>  const uint32_t special_features[] = INIT_SPECIAL_FEATURES;
>>  
>> -static const uint32_t pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
>> +static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
>>  static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
>> -static const uint32_t hvm_hap_max_featuremask[] = INIT_HVM_HAP_MAX_FEATURES;
>> -static const uint32_t pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
>> -static const uint32_t hvm_shadow_def_featuremask[] = INIT_HVM_SHADOW_DEF_FEATURES;
>> -static const uint32_t hvm_hap_def_featuremask[] = INIT_HVM_HAP_DEF_FEATURES;
>> +static const uint32_t __initconst hvm_hap_max_featuremask[] =
>> +    INIT_HVM_HAP_MAX_FEATURES;
>> +static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
>> +static const uint32_t __initconst hvm_shadow_def_featuremask[] =
>> +    INIT_HVM_SHADOW_DEF_FEATURES;
>> +static const uint32_t __initconst hvm_hap_def_featuremask[] =
>> +    INIT_HVM_HAP_DEF_FEATURES;
>>  static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
>>  
>>  static int __init parse_xen_cpuid(const char *s)

While I seem to recall that you, Andrew, said on irc that this change
may need almost immediate reverting with some further work you were
meaning to do, this work hasn't surfaced in the 8.5 months this patch
has been pending. Therefore I think I should have gone in right at
the time. Even if it's going to get (partly) reverted over time, I
think until such time it is benefitial to have that data moved to
.init. I therefore intend to commit this, again if need be without
any acks, once the tree is fully open again.

Jan


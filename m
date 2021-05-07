Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A8B376221
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 10:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123835.233669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levwI-0005Et-Lu; Fri, 07 May 2021 08:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123835.233669; Fri, 07 May 2021 08:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levwI-0005CL-Ik; Fri, 07 May 2021 08:34:26 +0000
Received: by outflank-mailman (input) for mailman id 123835;
 Fri, 07 May 2021 08:34:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1levwH-0005CF-6H
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 08:34:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10b54ca1-f322-4339-afc5-97740e4874f5;
 Fri, 07 May 2021 08:34:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3AD4AF59;
 Fri,  7 May 2021 08:34:23 +0000 (UTC)
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
X-Inumbo-ID: 10b54ca1-f322-4339-afc5-97740e4874f5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620376463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K9fVSfr49FNfNZyjj3LhpqYGR4JDCqjaghMVjN6Vub0=;
	b=UIw1iqQG8iO7eyz8jxU5BkYKWotgwJAtO50ZHms4/RugUeWetZ2EeOFoLCk+cuJCVx8p2y
	dXGNNrpgxJXPMti+Bf+719ZmwJqC1gp7cqTWStnpvU1H68ae+jN0X2X8iK+cBtB8+APv7g
	lYmlExSGlWnRcfAfRiJih2sf0RU3BaA=
Subject: Re: [PATCH] x86/shim: fix build when !PV32
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <08ea57f0-732e-fe12-409c-5487fb493429@suse.com>
 <YJT4cV62lqFgFKq/@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c00c73a5-0d9c-9e1e-20d7-5d65ac23976e@suse.com>
Date: Fri, 7 May 2021 10:34:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJT4cV62lqFgFKq/@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 07.05.2021 10:21, Roger Pau Monné wrote:
> On Fri, May 07, 2021 at 08:22:38AM +0200, Jan Beulich wrote:
>> In this case compat headers don't get generated (and aren't needed).
>> The changes made by 527922008bce ("x86: slim down hypercall handling
>> when !PV32") also weren't quite sufficient for this case.
>>
>> Try to limit #ifdef-ary by introducing two "fallback" #define-s.
>>
>> Fixes: d23d792478db ("x86: avoid building COMPAT code when !HVM && !PV32")
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/pv/shim.c
>> +++ b/xen/arch/x86/pv/shim.c
>> @@ -34,8 +34,6 @@
>>  #include <public/arch-x86/cpuid.h>
>>  #include <public/hvm/params.h>
>>  
>> -#include <compat/grant_table.h>
>> -
>>  #undef virt_to_mfn
>>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
>>  
>> @@ -300,8 +298,10 @@ static void write_start_info(struct doma
>>                                            &si->console.domU.mfn) )
>>          BUG();
>>  
>> +#ifdef CONFIG_PV32
>>      if ( compat )
>>          xlat_start_info(si, XLAT_start_info_console_domU);
>> +#endif
> 
> Would it help the compiler logic if the 'compat' local variable was
> made const?

No, because XLAT_start_info_console_domU is undeclared when there are
no compat headers.

> I'm wondering if there's a way we can force DCE from the compiler and
> avoid the ifdefs around the usage of compat.

The issue isn't with DCE - I believe the compiler does okay in that
regard. The issue is with things simply lacking a declaration /
definition. That's no different from e.g. struct fields living
inside an #ifdef - all uses then need to as well, no matter whether
the compiler is capable of otherwise recognizing the code as dead.

Jan


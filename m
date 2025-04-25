Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E6A9D515
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968670.1358170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RCH-0006EV-OM; Fri, 25 Apr 2025 22:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968670.1358170; Fri, 25 Apr 2025 22:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8RCH-0006C9-JZ; Fri, 25 Apr 2025 22:07:01 +0000
Received: by outflank-mailman (input) for mailman id 968670;
 Fri, 25 Apr 2025 22:06:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJEZ=XL=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u8RCF-0005fx-Nr
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:06:59 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ad181f8-2221-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 00:06:58 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745618812461587.6329446185744;
 Fri, 25 Apr 2025 15:06:52 -0700 (PDT)
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
X-Inumbo-ID: 9ad181f8-2221-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745618814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CViaT6Yw0uR9GVzfeBxM+DdiO86bXh3AsY56sWHPN32ESMK0fJUiGnzbn4/Q4NoPzHwpYun25QaQOdoFnvt4VIRRTJQQv0MshfjFn6S1Hom7d2HMSLUcP6YcBzCrQm7S3g5WgXPhte3GuRWWs2C16NqeH7w41Yt1Suquyo9muVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745618814; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zWV8KAI3GgZnrKPr1JBx123EB1XO3ZpFKc2fL8TcNdc=; 
	b=O/17+LMc5/H3qtVzGLCYxn5inq1bOhv6x2WgpUfAC9U3BIEdODl8Rq+M95oEupNIOK2msl1PIa0rryty/pX6R4uLj4Pq7kdDzlFHiqjPdifA+yT56DJxsgMzXN2lGpDKjTRUZ66GxGFg/UoZoeZAGqytRAS2IRF0FIRUKp+r6PM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745618814;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zWV8KAI3GgZnrKPr1JBx123EB1XO3ZpFKc2fL8TcNdc=;
	b=OQgbyUxeQRrzi8MqEq0DlndunjnEReB1BpzjkVTUhm+Cv67DceYnA4QHOYMi43Rb
	agyGTjfw0rgtbLiOTwPQP62vjObGWalMrE3GpmNg9Tcg5FlQMv+sy2eCQi5JGsYFLce
	pXVH0fbGNOBPznlANMoK2QWftue1znSCI9hpC+YY=
Message-ID: <10ea3202-3ffe-49c8-b449-5d59abc81be1@apertussolutions.com>
Date: Fri, 25 Apr 2025 18:06:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 32/38] x86/hyperlaunch: introduce concept of core domains
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: stefano.stabellini@amd.com, agarciav@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-33-dpsmith@apertussolutions.com>
 <bb2aa95a-797c-4d33-86eb-28acfaef743c@amd.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <bb2aa95a-797c-4d33-86eb-28acfaef743c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 4/23/25 15:50, Jason Andryuk wrote:
> On 2025-04-19 18:08, Daniel P. Smith wrote:
>> When constructing domU, and specifically the event channels for their 
>> console
>> and xenstore event channels, the domid for the backing domain must be 
>> known.
>> Therefore, the control, hardware, and xenstore domains are deemed as core
>> domains, and must be constructed before any of the other domains.
>>
>> This commit introduces the build_core_domains() function that will 
>> ensure the
>> core domains are constructed first.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/arch/x86/domain-builder/core.c     | 68 ++++++++++++++++++++++++--
>>   xen/arch/x86/include/asm/boot-domain.h |  2 +
>>   2 files changed, 66 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain- 
>> builder/core.c
>> index 901efce62a61..f693aa46d278 100644
>> --- a/xen/arch/x86/domain-builder/core.c
>> +++ b/xen/arch/x86/domain-builder/core.c
>> @@ -103,18 +103,78 @@ void __init builder_init(struct boot_info *bi)
>>       }
>>   }
>> +static int  __init build_core_domains(struct boot_info *bi)
>> +{
>> +    int count = 0;
>> +    struct boot_domain *bd;
>> +    int hw, cd, xs;
>> +
>> +    cd = first_boot_domain_index(bi, BUILD_CAPS_CONTROL);
> 
>> +    hw = first_boot_domain_index(bi, BUILD_CAPS_HARDWARE);
> 
>> +    xs = first_boot_domain_index(bi, BUILD_CAPS_XENSTORE);
> 
> This order has issues if you actually have disaggregated domains.
> 
> Control and Hardware depend on Xenstore for Xenstore.
> 
> Control and Xenstore depend on Hardware for console support.
> 
> I re-worked the xenstore allocation to run after domain creation.  I've 
> upstreamed that for dom0less (and ARM doesn't have to deal with consoles).
> 
> So if xenstore allocation is moved later, Hardware, Xenstore, then 
> Control works.  But xenstore and console could both be handled after the 
> fact and then the construction order doesn't matter.  The backend domid 
> is needed to construct the event channel and grant entry.  With assigned 
> domids, alloc_store_evtchn()/alloc_console_evtchn() can operate on the 
> domids instead of expecting the domain to have been constructed.

Actually, there is a larger issue here and this is going to be reworked.

V/r,
dps


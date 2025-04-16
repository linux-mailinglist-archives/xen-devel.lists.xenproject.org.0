Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185DAA9046F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:33:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956087.1349594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52t6-0007VU-Pt; Wed, 16 Apr 2025 13:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956087.1349594; Wed, 16 Apr 2025 13:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52t6-0007Tv-NC; Wed, 16 Apr 2025 13:33:12 +0000
Received: by outflank-mailman (input) for mailman id 956087;
 Wed, 16 Apr 2025 13:33:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7a8=XC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u52t5-0007Tp-Gx
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:33:11 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 554aaad0-1ac7-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 15:33:09 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744810377862337.92117731242763;
 Wed, 16 Apr 2025 06:32:57 -0700 (PDT)
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
X-Inumbo-ID: 554aaad0-1ac7-11f0-9eaf-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1744810381; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FL5D7qpBhsOtiFRX5kOCZVQ2sZIeHJP6X9V1XnGeQ3Hapg8be2DwTpBNsAAo5ray4y2RdgLZmBwyXk9RDiRLc/i0V+BC1r4mtRhJcv43vGknwboNkgTbBQjwTA+KiHtFq6EAAMl6hvURNj+qHrGWH2s/BeTPz+C0TMGn/Rom9PU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744810381; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VAOf2e+evPb9TLpxqCwK1cQNjcRp83vyhXss99b/MSo=; 
	b=AyQUpZUuAOjDm3UcNNO1NHcjwqHUjulvud6gpAYeKd5goObntsv6n2bp+v/mhfG6uy3hTwKpt7aip8SB+End2h+J07yEpEH2zZwsfAm74EGtjdIpXBDg6rqXJyocOYOatfjGu+x877bR8ndFYmn7gF9T1HRIt7WbKjBcCZv2GyU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744810381;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=VAOf2e+evPb9TLpxqCwK1cQNjcRp83vyhXss99b/MSo=;
	b=fr1RemDKN1ZpmMeAi7zlR/mhjr2+fPJYl0OpUFmKMPLasC04TAz80KYx/jicwVPy
	5Nm9yVdCVkNGVqFfqsITgXkFqjEGMP2+C9zq5HbYzwfzB6+Ic5TzQHi+pA3HE83I4ex
	9PynRoDmVFvJtIXHGBFT2qXP7biHzHWW5fbUuI6k=
Message-ID: <82fe6290-ea16-4e4f-8be4-76b9b624e398@apertussolutions.com>
Date: Wed, 16 Apr 2025 09:32:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <agarciav@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
 <7a13e61b-8568-4852-bb46-974964e02d61@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <7a13e61b-8568-4852-bb46-974964e02d61@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/10/25 07:57, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/domain-builder/fdt.c
>> +++ b/xen/arch/x86/domain-builder/fdt.c
>> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>>               bd->domid = (domid_t)val;
>>               printk("  domid: %d\n", bd->domid);
>>           }
>> +        else if ( strncmp(prop_name, "mode", name_len) == 0 )
>> +        {
>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>> +            {
>> +                printk("  failed processing mode for domain %s\n", name);
>> +                return -EINVAL;
>> +            }
>> +
>> +            printk("  mode: ");
>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>> +            {
>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>> +                    printk("HVM\n");
>> +                else
>> +                    printk("PVH\n");
>> +            }
>> +            else
>> +                printk("PV\n");
>> +        }
> 
> My prior questions here remain: What's the significance of
> BUILD_MODE_ENABLE_DM when set alongside BUILD_MODE_PARAVIRT? What about
> any of the other bits being set?

 From boot-domain.h:
                                           /* On     | Off    */
#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */

The logic says, if BUILD_MODE_PARAVIRT bit is not set, thus an HVM 
domain, check if BUILD_MODE_ENABLE_DM has been set. This is determin if 
the domain is what the toolstack differentiates as either an HVM or PVH 
domain. As you should know, there is no case of a PV domain requiring a 
backing device mode (DM) domain. IOW, BUILD_MODE_ENABLE_DM is only 
relevant to an HVM domain.

v/r,
dps



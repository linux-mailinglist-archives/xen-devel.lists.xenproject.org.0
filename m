Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DAF63D806
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 15:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449913.706953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0O1n-0000rV-5n; Wed, 30 Nov 2022 14:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449913.706953; Wed, 30 Nov 2022 14:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0O1n-0000ot-3A; Wed, 30 Nov 2022 14:25:35 +0000
Received: by outflank-mailman (input) for mailman id 449913;
 Wed, 30 Nov 2022 14:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nhrb=36=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1p0O1l-0000on-E8
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 14:25:33 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7721899-70ba-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 15:25:31 +0100 (CET)
Received: from [10.10.1.154] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1669818321344846.5741021890385;
 Wed, 30 Nov 2022 06:25:21 -0800 (PST)
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
X-Inumbo-ID: d7721899-70ba-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; t=1669818323; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DAiV77C3l9KkiRJXUqaVkHfs09E+z81dGBZbmpxlu3OTtTPFSCV0R4iJIliHdctNwO7uc1jWn/+99rZrrGuc2eDk81Y9Sx9V78f4KOgPH/xb8zOxNWydKmMArtnN/Hyhi2V78QEmuc9L4Ro5nXRLwVK3eWd28HfgiQd+ayZlaiY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669818323; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=g7TipV0I7Gy5yDaSXWreS2VrBfDhMbzklK2sAAD97W4=; 
	b=FmXE7edscpaY07Qt29BCtzKXHuhRQqRTWeo8fdGb4Bn+8zAkrtW8pQLiB33HOPfYKT2OSdz4GzElLw18zfQLpDKJrCHPQXhNaqaF/qd1Cgg8eT7a2Mw4BPE2qvlYK065BoYd/nI1jeW6GTKk2xQ36ISGNnXEqF6Tj2i+WpOurW0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669818323;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=g7TipV0I7Gy5yDaSXWreS2VrBfDhMbzklK2sAAD97W4=;
	b=qnCrwdHaCBfvSYWE/E+32aJmd3ybYLF1EAev1sWMe/0PcD5jKGBgNcotqmjpWUel
	59+CtaN21VfD+upTotZQAjPVQNpBllKGjnRqNvEwTe5SXEBBloTbQNZB0Fw19CEeGYS
	fMkKxJoFfOENMxnVHHyvepK4Oevbf4jkLWFNFGJQ=
Message-ID: <ef7de705-a5e8-0728-f567-9ac83a2b3efc@apertussolutions.com>
Date: Wed, 30 Nov 2022 09:25:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] x86/mm: PGC_page_table is used by shadow code only
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <df240766-7a57-d9ce-f0a9-697fc470e1f5@suse.com>
 <4fef5b0c-4463-cd6f-15fc-47268505517b@citrix.com>
 <96f6a943-0e1e-7399-fe83-56a550d47bf6@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <96f6a943-0e1e-7399-fe83-56a550d47bf6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/30/22 02:52, Jan Beulich wrote:
> On 29.11.2022 21:56, Andrew Cooper wrote:
>> On 29/11/2022 14:55, Jan Beulich wrote:
>>> By defining the constant to zero when !SHADOW_PAGING we give compilers
>>> the chance to eliminate a little more dead code elsewhere in the tree.
>>> Plus, as a minor benefit, the general reference count can be one bit
>>> wider. (To simplify things, have PGC_page_table change places with
>>> PGC_extra.)
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Ahead of making this change, can we please rename it to something less
>> confusing, and fix it's comment which is wrong.
>>
>> PGC_shadowed_pt is the best I can think of.
> 
> Can do, sure.
> 
>>> ---
>>> tboot.c's update_pagetable_mac() is suspicious: It effectively is a
>>> no-op even prior to this change when !SHADOW_PAGING, which can't be
>>> quite right. If (guest) page tables are relevant to include in the
>>> verification, shouldn't this look for PGT_l<N>_page_table as well? How
>>> to deal with HAP guests there is entirely unclear.
>>
>> Considering the caller, it MACs every domheap page for domains with
>> CDF_s3_integrity.
>>
>> The tboot logical also blindly assumes that any non-idle domain has an
>> Intel IOMMU context with it.  This only doesn't (trivially) expose
>> because struct domain_iommu is embedded in struct domain (rather than
>> allocated separately), and reaching into the wrong part of the arch
>> union is only mitigated by the tboot logic not being invoked on
>> non-intel systems.  (Also the idle domain check is useless, given that
>> it's in a for_each_domain() loop).
>>
>> It does look a little like the caller is wanting to MAC all Xen data
>> that describes the guest, but doing this unilaterally for all shadowed
>> guests seems wrong beside the per-domain s3_integrity setting.
> 
> Question is - do we care about addressing this (when, as said, it's
> unclear how to deal with HAP domains; maybe their actively used p2m
> pages would need including instead)? Or should we rather consider
> ripping out tboot support?

This would break a significant number of production deployed OpenXT 
derivative solutions. I would respectively request that a middle ground 
be found that will allow the capability to remain until TrenchBoot has 
had time to build a Secure Launch for Xen that mirrors Secure Launch for 
Linux.

NB: I have a long list of changes for the tboot code but have opted thus 
far to let them lie. Mainly as they would be hole patching that would 
mostly be tossed with the clean room implementation that will come from TB.

v/r,
dps


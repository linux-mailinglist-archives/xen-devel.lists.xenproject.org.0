Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C32DE012
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56394.98739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBRX-0002JN-CE; Fri, 18 Dec 2020 08:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56394.98739; Fri, 18 Dec 2020 08:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBRX-0002J1-8t; Fri, 18 Dec 2020 08:48:55 +0000
Received: by outflank-mailman (input) for mailman id 56394;
 Fri, 18 Dec 2020 08:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqBRV-0002It-BH
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:48:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35598815-ea6f-4cf7-9709-b34af88ba062;
 Fri, 18 Dec 2020 08:48:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6ECBCACBD;
 Fri, 18 Dec 2020 08:48:51 +0000 (UTC)
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
X-Inumbo-ID: 35598815-ea6f-4cf7-9709-b34af88ba062
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608281331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ghIe0N3tZ4XWXLjcKriaLOCVEDnqA9Mt+/h/XXvilog=;
	b=Cg2U4RN+pSXgEafrXm8LZz6D0KuTo57y35uFwaU0sNl6b4JDr9IojGStoaCpGvNwp6eonJ
	9/B2KtSG9hLThCGmTvckmizo1XaoZDFPXPacZvjG+MfAWlwHBbz5LFowbaPJD7RFbyyqc8
	MhbVPlptEx4CsR1yLmVpStEBiS+R47E=
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
 <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2eb9259d-1a36-4df0-d59d-fc08ce38d763@suse.com>
Date: Fri, 18 Dec 2020 09:48:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.12.2020 20:18, Andrew Cooper wrote:
> On 15/12/2020 16:26, Jan Beulich wrote:
>> This is together with its only caller, xenmem_add_to_physmap_one().
> 
> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
> follow-on from the subject sentence.

Yeah, changed along these lines.

>>  Move
>> the latter next to p2m_add_foreign(), allowing this one to become static
>> at the same time.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

> , although...
> 
>> --- a/xen/arch/x86/mm/p2m.c
>> +++ b/xen/arch/x86/mm/p2m.c
>> @@ -2639,7 +2646,114 @@ int p2m_add_foreign(struct domain *tdom,
>>      return rc;
>>  }
>>  
>> -#ifdef CONFIG_HVM
>> +int xenmem_add_to_physmap_one(
>> +    struct domain *d,
>> +    unsigned int space,
>> +    union add_to_physmap_extra extra,
>> +    unsigned long idx,
>> +    gfn_t gpfn)
>> +{
>> +    struct page_info *page = NULL;
>> +    unsigned long gfn = 0 /* gcc ... */, old_gpfn;
>> +    mfn_t prev_mfn;
>> +    int rc = 0;
>> +    mfn_t mfn = INVALID_MFN;
>> +    p2m_type_t p2mt;
>> +
>> +    switch ( space )
>> +    {
>> +        case XENMAPSPACE_shared_info:
>> +            if ( idx == 0 )
>> +                mfn = virt_to_mfn(d->shared_info);
>> +            break;
>> +        case XENMAPSPACE_grant_table:
>> +            rc = gnttab_map_frame(d, idx, gpfn, &mfn);
>> +            if ( rc )
>> +                return rc;
>> +            break;
>> +        case XENMAPSPACE_gmfn:
>> +        {
>> +            p2m_type_t p2mt;
>> +
>> +            gfn = idx;
>> +            mfn = get_gfn_unshare(d, gfn, &p2mt);
>> +            /* If the page is still shared, exit early */
>> +            if ( p2m_is_shared(p2mt) )
>> +            {
>> +                put_gfn(d, gfn);
>> +                return -ENOMEM;
>> +            }
>> +            page = get_page_from_mfn(mfn, d);
>> +            if ( unlikely(!page) )
>> +                mfn = INVALID_MFN;
>> +            break;
>> +        }
>> +        case XENMAPSPACE_gmfn_foreign:
>> +            return p2m_add_foreign(d, idx, gfn_x(gpfn), extra.foreign_domid);
>> +        default:
>> +            break;
> 
> ... seeing as the function is moving wholesale, can we at least correct
> the indention, to save yet another large churn in the future?  (If it
> were me, I'd go as far as deleting the default case as well.)

Oh, indeed. I did look for obvious style issues but didn't spot this
(still quite obvious) one. I've done so and also added blank lines
between the case blocks.

Jan


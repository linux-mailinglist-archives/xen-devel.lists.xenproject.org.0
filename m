Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804AE330FBD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 14:42:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94935.178950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJG9D-0005mp-JA; Mon, 08 Mar 2021 13:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94935.178950; Mon, 08 Mar 2021 13:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJG9D-0005mQ-G5; Mon, 08 Mar 2021 13:42:11 +0000
Received: by outflank-mailman (input) for mailman id 94935;
 Mon, 08 Mar 2021 13:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJG9B-0005mL-Ka
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:42:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 667e26b1-43c4-4106-b3fd-11232c297cfc;
 Mon, 08 Mar 2021 13:42:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7CF3AC54;
 Mon,  8 Mar 2021 13:42:07 +0000 (UTC)
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
X-Inumbo-ID: 667e26b1-43c4-4106-b3fd-11232c297cfc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615210927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ+3Up9dP59m+YGq0dxEE1fIDfgvYYRyhCRZ/TjJyYU=;
	b=kmV7bTHr/0Qw4gbYzaUCDdPYSUWHml5tNGwvPxps2bHa4V99la8TRZJiiCitXqNkG2vWfi
	okjhfbDgOARilZw5JSMRmndBKK791xyP3Jy/6I4xpV0wsE5h5xH0P/yVY32k04dInrE+YK
	Q+aOcPDUkmsHoEmDe7WG0m4x7myQRZ0=
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
 <YEYMgQ+e5A9/jqQE@Air-de-Roger>
 <c5dd3650-b8cf-ba4c-70ee-f0dd09a1ea09@suse.com>
 <YEYYuyhnH1B0k+IV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2cabeb6b-bbec-4cca-d872-66c2d8ae6c3a@suse.com>
Date: Mon, 8 Mar 2021 14:42:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEYYuyhnH1B0k+IV@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.03.2021 13:29, Roger Pau Monné wrote:
> On Mon, Mar 08, 2021 at 12:47:44PM +0100, Jan Beulich wrote:
>> On 08.03.2021 12:37, Roger Pau Monné wrote:
>>> On Fri, Mar 05, 2021 at 10:50:54AM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/msr.c
>>>> +++ b/xen/arch/x86/msr.c
>>>> @@ -315,6 +315,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t
>>>>          *val = msrs->tsc_aux;
>>>>          break;
>>>>  
>>>> +    case MSR_K8_HWCR:
>>>> +        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
>>>> +            goto gp_fault;
>>>> +        *val = K8_HWCR_TSC_FREQ_SEL;
>>>
>>> I've been only able to find information about this MSR up to family
>>> 10h, but I think in theory Xen might also run on family 0Fh, do you
>>> know if the MSR is present there, and the bit has the same meaning?
>>
>> From its name (and its K7 alternative name) it's clear the register
>> had been there at that point. And indeed the bit has a different
>> meaning there (its the bottom bit of a 6-bit START_FID field if the
>> BKDG I'm looking at can be trusted.
> 
> OK, I cannot seem to find the BKDG for family 0Fh. The oldest BKDG I
> can find is for Family 10h [0].
> 
>> Since I don't think it matters
>> much whether we expose a value of 0x00 or a value of 0x01 there,
>> and since we likely don't want to make #GP raising dependent upon
>> family when we don't _really_ need to, I would want to propose that
>> the value used is good enough uniformly.
> 
> I would be fine with setting it to 0 if Fam < 10h if you think that's
> acceptable. I think the chances of someone running Xen >= 4.15 on such
> old hardware are quite dim.

Would you mind explaining how returning 0 in this case would be
better? No hard-coded value will ever be guaranteed to reflect the
truth. See my reply to Andrew - if anything we'd need to let the
hardware field shine through, and in _that_ case I of course I
agree that we then should treat Fam0F specially.

I will admit though that as per the BKDG I'm looking at only even
values are defined for the field. Reporting 1 here therefore may
do good (keep OSes from trying to use any of this P-state stuff)
or bad (confuse OSes).

Jan


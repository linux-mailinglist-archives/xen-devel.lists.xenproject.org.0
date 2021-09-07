Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9922402A70
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181102.328104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNboY-00041q-02; Tue, 07 Sep 2021 14:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181102.328104; Tue, 07 Sep 2021 14:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNboX-0003yo-Se; Tue, 07 Sep 2021 14:11:05 +0000
Received: by outflank-mailman (input) for mailman id 181102;
 Tue, 07 Sep 2021 14:11:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNboX-0003yB-0N
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:11:05 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f5131f8-0fe5-11ec-b0f7-12813bfff9fa;
 Tue, 07 Sep 2021 14:11:03 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631023856310111.27960753270997;
 Tue, 7 Sep 2021 07:10:56 -0700 (PDT)
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
X-Inumbo-ID: 6f5131f8-0fe5-11ec-b0f7-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631023862; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZIL3ngtVoMCpENgJBqG6qOYrPmBTvfSmYGYT8jlTyBVe8U2ePx8VpgTasGI+kphTyo4ro3Il8mVA8m6ez/s80TvKrK614WL/ZUI/HKh2S85c4HvHwoMOzUSpPQhNzABkd/WhlXwatH46GTnzC3eWVUO6e/GsThtIq1msUG070ZI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631023862; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=NGknd/JHTSfyOh9tzQSO+4h9Q2/QFArTITRMaNAFEqs=; 
	b=juQWA93l5PqfG068ROI0otQkMXrRjgB8gNMUnU4plSFOI4dXmW56aGY0hvNbzE0wS/nrJFbdyX7Vt6+Aw8zmt2TYypHCDpn4ObYFj+Ix1GgQNuSZl8E+NErq8UMTHcGgThucIUq71++r2ukwk8JUaj6RvLeiYbcTCTewYAug3Ng=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631023862;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NGknd/JHTSfyOh9tzQSO+4h9Q2/QFArTITRMaNAFEqs=;
	b=YN/QLhcL3Nc6dl9z2F4ist/Z89bUslpmyQsNTr9ThNnXJWdTCnwGoegR7X53Vldg
	D0il3JmNEi24FeIUgCNzRkkhAkhS3prydd1OidjJ9P3HtUpkXWUHdG3PEFgbUo98fFY
	V9D8alPvzuhb8oiNQdHzhdqo0IqkVgB4p17VhR4w=
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
 <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
 <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
 <a3a9207e-7ab9-5eb9-7488-74bc4203e7a3@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <3b3762a7-5034-9094-84f9-cd8ab24e24a0@apertussolutions.com>
Date: Tue, 7 Sep 2021 10:09:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3a9207e-7ab9-5eb9-7488-74bc4203e7a3@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/7/21 9:50 AM, Jan Beulich wrote:
> On 07.09.2021 15:41, Daniel P. Smith wrote:
>> On 9/6/21 2:17 PM, Andrew Cooper wrote:
>>> On 03/09/2021 20:06, Daniel P. Smith wrote:
>>>> --- a/xen/include/xsm/dummy.h
>>>> +++ b/xen/include/xsm/dummy.h
>>>> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
>>>>    
>>>>    #endif /* CONFIG_XSM */
>>>>    
>>>> -static always_inline int xsm_default_action(
>>>> -    xsm_default_t action, struct domain *src, struct domain *target)
>>>> +static always_inline int xsm_default_action(xsm_default_t action,
>>>> +                                            struct domain *src,
>>>> +                                            struct domain *target)
>>>
>>> The old code is correct.  We have plenty of examples of this in Xen, and
>>> I have been adding new ones when appropriate.
>>>
>>> It avoids squashing everything on the RHS and ballooning the line count
>>> to compensate.  (This isn't a particularly bad example, but we've had
>>> worse cases in the past).
>>
>> Based on the past discussions I understood either is acceptable and find
>> this version much easier to visually parse myself. With that said, if
>> the "next line single indent" really is the preferred style by the
>> maintainers/community, then I can convert all of these over.
> 
> I guess neither is the "preferred" style; as Andrew says, both are
> acceptable and both are in active use. I guess the rule of thumb is:
> The longer what's left of the function name, the more you should
> consider the style that you change away from.
> 
> Anyway, in the end I guess the request for style adjustments was
> mainly to purge bad style, not to convert one acceptable form to
> another. Converting the entire file to the same style is of course
> fine (for producing a consistent result), but then - as per above -
> here it would more likely be the one that in this case was already
> there.

Understood, I will respin with all the function defs to align with the 
"next line single indent" style, though it would be helpful for 
clarification on this style exactly. Do you always wrap all args if one 
extends past 80 col or is there a rule for when some should remain on 
the first line (function def line)?

v/r,
dps


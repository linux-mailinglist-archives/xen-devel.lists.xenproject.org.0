Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0E4029FF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 15:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181055.328026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbNE-0004b1-Us; Tue, 07 Sep 2021 13:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181055.328026; Tue, 07 Sep 2021 13:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbNE-0004Yf-Rg; Tue, 07 Sep 2021 13:42:52 +0000
Received: by outflank-mailman (input) for mailman id 181055;
 Tue, 07 Sep 2021 13:42:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTX3=N5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mNbND-0004YZ-BJ
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 13:42:51 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ddadf84-0fe1-11ec-b0f3-12813bfff9fa;
 Tue, 07 Sep 2021 13:42:50 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631022164109295.00066750460735;
 Tue, 7 Sep 2021 06:42:44 -0700 (PDT)
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
X-Inumbo-ID: 7ddadf84-0fe1-11ec-b0f3-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631022167; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EwXVjk7o0+dNW6BQyzIDtRSYN4NmBvRZLsUpPEsZNhVlT1DAgbWz+pViSNQTi4ASsluqS88rEakdUxr/EHLYUZwaYP9AtnT5YOtWsyMGFti+D9i2cLq4GKOJrkIn/cqKXBVHgjXefaKQ6sV2LKITuag2vkUo0cDMfne5LpeadHY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631022167; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=CYEF02zRg0djSWApjMYgBANnz2rEyed+agc2MJGNgJ4=; 
	b=Wlgl57FKbX4InW3weDbgq8QTjou/oRB0zBjMlZPmUWuENbYe3kgGJAavDsERwnnOCe1Qu8Wa30dKo6LQnJ7gh/nDQH5ri7Y6D4NkEz677pYErByE/UNjXalqhikxcedvuP4uBIkCyZ5aTOA6W2X0EmQC8Wyj9o7G2VK/u3ZIsa0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631022167;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CYEF02zRg0djSWApjMYgBANnz2rEyed+agc2MJGNgJ4=;
	b=Z0vhHWYhejqxTL3qqWAPWN6v0Hzj/xcmLsISh4Y0oLXgwrIhTYN6OU10zLEAuYf4
	V0Eah+42XDGWEwRECKo40MbBD0haeKS6lC82QUm6BJkZ5gfXykXvsond1LfSezoUjul
	x7SQp7BOFUeE9Bf18jf0d6rEySnNg+9SUzORHZxI=
Subject: Re: [PATCH v4 04/11] xsm: apply coding style
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
 <20210903190629.11917-5-dpsmith@apertussolutions.com>
 <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <ef0d627e-cc1f-4b9a-7695-daa646968c42@apertussolutions.com>
Date: Tue, 7 Sep 2021 09:41:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <01c81885-9ea0-3ecf-66b0-009b9e7ba39b@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/6/21 2:17 PM, Andrew Cooper wrote:
> On 03/09/2021 20:06, Daniel P. Smith wrote:
>> Instead of intermixing coding style changes with code changes as they
>> are come upon in this patch set, moving all coding style changes
>> into a single commit. The focus of coding style changes here are,
>>
>>   - move trailing comments to line above
>>   - ensuring line length does not exceed 80 chars
>>   - ensuring proper indentation for 80 char wrapping
>>   - covert u32 type statements to  uint32_t
>>   - remove space between closing and opening parens
>>   - drop extern on function declarations
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/include/xsm/dummy.h | 173 +++++++++-----
>>   xen/include/xsm/xsm.h   | 494 ++++++++++++++++++++++------------------
>>   xen/xsm/xsm_core.c      |   4 +-
>>   3 files changed, 389 insertions(+), 282 deletions(-)
>>
>> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
>> index 214b5408b1..deaf23035e 100644
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -69,8 +69,9 @@ void __xsm_action_mismatch_detected(void);
>>   
>>   #endif /* CONFIG_XSM */
>>   
>> -static always_inline int xsm_default_action(
>> -    xsm_default_t action, struct domain *src, struct domain *target)
>> +static always_inline int xsm_default_action(xsm_default_t action,
>> +                                            struct domain *src,
>> +                                            struct domain *target)
> 
> The old code is correct.  We have plenty of examples of this in Xen, and
> I have been adding new ones when appropriate.
> 
> It avoids squashing everything on the RHS and ballooning the line count
> to compensate.  (This isn't a particularly bad example, but we've had
> worse cases in the past).

Based on the past discussions I understood either is acceptable and find 
this version much easier to visually parse myself. With that said, if
the "next line single indent" really is the preferred style by the 
maintainers/community, then I can convert all of these over.

>>   {
>>       switch ( action ) {
>>       case XSM_HOOK:
>> @@ -99,12 +100,13 @@ static always_inline int xsm_default_action(
>>   }
>>   
>>   static XSM_INLINE void xsm_security_domaininfo(struct domain *d,
>> -                                    struct xen_domctl_getdomaininfo *info)
>> +    struct xen_domctl_getdomaininfo *info)
> 
> This doesn't match any styles I'm aware of.  Either struct domain on the
> new line, or the two structs vertically aligned.
> 
> It more obviously highlights why squashing all parameters on the RHS is
> a bad move.

Apologies I let one slip through, though going through over 80-some 
function defs trying to make sure they are all aligned and missing one
I would say is not a bad job.

>> @@ -291,37 +307,41 @@ static XSM_INLINE void xsm_evtchn_close_post(struct evtchn *chn)
>>       return;
>>   }
>>   
>> -static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
>> +static XSM_INLINE int xsm_evtchn_send(XSM_DEFAULT_ARG struct domain *d,
>> +                                      struct evtchn *chn)
>>   {
>>       XSM_ASSERT_ACTION(XSM_HOOK);
>>       return xsm_default_action(action, d, NULL);
>>   }
>>   
>> -static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d, struct evtchn *chn)
>> +static XSM_INLINE int xsm_evtchn_status(XSM_DEFAULT_ARG struct domain *d,
>> +                                        struct evtchn *chn)
>>   {
>>       XSM_ASSERT_ACTION(XSM_TARGET);
>>       return xsm_default_action(action, current->domain, d);
>>   }
>>   
>> -static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1, struct domain *d2)
>> +static XSM_INLINE int xsm_evtchn_reset(XSM_DEFAULT_ARG struct domain *d1,
>> +                                       struct domain *d2)
>>   {
>>       XSM_ASSERT_ACTION(XSM_TARGET);
>>       return xsm_default_action(action, d1, d2);
>>   }
>>   
>> -static XSM_INLINE int xsm_alloc_security_evtchns(
>> -    struct evtchn chn[], unsigned int nr)
>> +static XSM_INLINE int xsm_alloc_security_evtchns(struct evtchn chn[],
>> +                                                 unsigned int nr)
> 
> I maintain that this was correct before.

Getting to this point I must say it would be helpful if this could be 
spelled out in CODING_STYLE. Specifically, so that I am clear, if a 
parameter overflows, than all the parameters overflow? Are there 
exceptions such as if overflow doesn't happen until the third of four or 
the fourth parameter. Having a rule set would be much more helpful than 
trying to look for examples elsewhere in code.

>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index 9872bae502..8878281eae 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -19,7 +19,7 @@
>>   #include <xen/multiboot.h>
>>   
>>   /* policy magic number (defined by XSM_MAGIC) */
>> -typedef u32 xsm_magic_t;
>> +typedef uint32_t xsm_magic_t;
>>   
>>   #ifdef CONFIG_XSM_FLASK
>>   #define XSM_MAGIC 0xf97cff8c
>> @@ -31,158 +31,171 @@ typedef u32 xsm_magic_t;
>>    * default actions of XSM hooks. They should be compiled out otherwise.
>>    */
>>   enum xsm_default {
>> -    XSM_HOOK,     /* Guests can normally access the hypercall */
>> -    XSM_DM_PRIV,  /* Device model can perform on its target domain */
>> -    XSM_TARGET,   /* Can perform on self or your target domain */
>> -    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
>> -    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
>> -    XSM_OTHER     /* Something more complex */
>> +    /* Guests can normally access the hypercall */
>> +    XSM_HOOK,
>> +    /* Device model can perform on its target domain */
>> +    XSM_DM_PRIV,
>> +    /* Can perform on self or your target domain */
>> +    XSM_TARGET,
>> +    /* Privileged - normally restricted to dom0 */
>> +    XSM_PRIV,
>> +    /* Xenstore domain - can do some privileged operations */
>> +    XSM_XS_PRIV,
>> +    /* Something more complex */
>> +    XSM_OTHER
>>   };
> 
> Why?  This takes a table which was unambiguous to read, and makes it
> ambiguous at a glance.  You want either no change at all, or blank lines
> between comment/constant pairs so you don't need to read to either end
> to figure out how to parse the comments.

I went back to the comment that prompted me to do this and rereading now 
makes me think I took it to literal. Specifically, "...I'd like to 
encourage you to also address other style issues in the newly introduced 
file. Here I'm talking about comment style, requiring /* to be on its 
own line." I took that to include these as well since I am pretty sure I 
have seen elsewhere this kind of commenting. Regardless, looking back I 
  can see how the meaning could have only for other block quotes. 
Honestly I will gladly change it back as I think that is far clearer.

v/r,
dps


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE125B3C39
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 17:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404471.646955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWg8C-0005rO-9c; Fri, 09 Sep 2022 15:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404471.646955; Fri, 09 Sep 2022 15:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWg8C-0005p0-65; Fri, 09 Sep 2022 15:41:24 +0000
Received: by outflank-mailman (input) for mailman id 404471;
 Fri, 09 Sep 2022 15:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F1lU=ZM=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oWg8B-0005or-6o
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 15:41:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8c14709-3055-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 17:41:20 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1662738076566571.0787444842507;
 Fri, 9 Sep 2022 08:41:16 -0700 (PDT)
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
X-Inumbo-ID: d8c14709-3055-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; t=1662738077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=brWj5PxNFb9ejA4cGHcjn/2YeY+OG4NOKAC+Z8UCuJa6HEiWv8OOhP+JqBK24JLzBgxyd7QanquysDgGOKPlehmVRYNLDJHjH+0g6OH5Db38pj0IGqmB+/nRw9CwOZy2vTo0ml2KUPHEoQOWt3bSxGjJ21rI9jt2NIP5FRZf/S8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662738077; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3pPQ8rWPnj6YmEPuBn7YnrybGjisZ/aKYZ9q4cPs7/o=; 
	b=I0VWb8QaPyB74zXIqIYgDcaebdSXh/wNVG+kHBgYoINxoNAOlOvqD3cE6PLE7cZ2hquSKLAkSAawuBK+OOHoAD67HywNFqNWxVtLf0v8rjh+WLAz2Nf87Jc5qO2as86c/5Qr3VqvipqKNiNKpHjxVGw6zw98r7mEDQ00ZJ2uxI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662738077;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=3pPQ8rWPnj6YmEPuBn7YnrybGjisZ/aKYZ9q4cPs7/o=;
	b=bIIldCrh22hUF5F70ZlFRBxO7wAF/DUvJhEeGefuQAjIvYmPKWEymt0LzAT9zhmZ
	ArgEeN6uY+GDmxuADNJpZf3F/JPy/SZ1y8uDbPO/afspPyjtsgEpQ9gSGm2/uVZW4Xd
	w/e1RGWIKqvd3QVPXZxcotUdpTBJbSjPRtlE3dgc=
Message-ID: <b12addb7-ce3f-b560-4f35-05ba9c699c87@apertussolutions.com>
Date: Fri, 9 Sep 2022 11:41:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: jandryuk@gmail.com, xen-devel@lists.xenproject.org
References: <20220909095012.4251-1-dpsmith@apertussolutions.com>
 <3da17c12-1cbe-165e-94f4-44face9a181f@suse.com>
 <e6568867-3296-58b2-8744-d1644e401528@apertussolutions.com>
 <f037e0c2-625f-dcad-a67a-6468392c14bd@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xsm/flask: adjust print messages to use %pd
In-Reply-To: <f037e0c2-625f-dcad-a67a-6468392c14bd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 9/9/22 08:10, Jan Beulich wrote:
> On 09.09.2022 13:34, Daniel P. Smith wrote:
>> On 9/9/22 06:04, Jan Beulich wrote:
>>> On 09.09.2022 11:50, Daniel P. Smith wrote:
>>>> --- a/xen/xsm/flask/avc.c
>>>> +++ b/xen/xsm/flask/avc.c
>>>> @@ -566,14 +566,14 @@ void avc_audit(u32 ssid, u32 tsid, u16 tclass, u32 requested,
>>>>       if ( a && (a->sdom || a->tdom) )
>>>>       {
>>>>           if ( a->sdom && a->tdom && a->sdom != a->tdom )
>>>> -            avc_printk(&buf, "domid=%d target=%d ", a->sdom->domain_id, a->tdom->domain_id);
>>>> +            avc_printk(&buf, "source=%pd target=%dp ", a->sdom, a->tdom);
>>>>           else if ( a->sdom )
>>>> -            avc_printk(&buf, "domid=%d ", a->sdom->domain_id);
>>>> +            avc_printk(&buf, "source=%pd ", a->sdom);
>>>>           else
>>>> -            avc_printk(&buf, "target=%d ", a->tdom->domain_id);
>>>> +            avc_printk(&buf, "target=%pd ", a->tdom);
>>>
>>> Apart from switching to %pd to also replace "domid" by "source". That's
>>> fine in the first case (where both domain IDs are logged), but in the
>>> second case it's a little questionable. Wouldn't it be better to be
>>> able to distinguish the tdom == NULL case from the tdom == sdom one,
>>> perhaps by using "source" in the former case but "domid" in the latter
>>> one?
>>
>> Apologies as I am not quite following your question. Let me provide my 
>> reasoning and if it doesn't address your question, then please help me 
>> understand your concern.
>>
>> The function avc_printk() allows for the incremental build up of an AVC 
>> message. In this section, it is attempting to include the applicable 
>> source and target that was used to render the AVC. With the switch to 
>> %pd, the first and second lines would become "domid=d{id}". I personally 
>> find that a bit redundant. Adding to that, in the context of this 
>> function there is "sdom" which is source domain, "cdom" which is current 
>> domain, and tdom which is target domain. The print statements using cdom 
>> or tdom already denoted them with "current=" and "target=" respectively. 
>> Whereas, sdom was prefixed with "domid=" in the print statements. To me, 
>> it makes more sense to change the prefixes of sdom with "source=" to 
>> accurately reflect the context of that domid.
> 
> Well, yes, perhaps "domain" would be better than "domid" with the change
> to %pd. But I still think the middle of the three printk()s would better
> distinguish tdom == NULL from tdom == sdom:
> 
>         else if ( a->sdom )
>             avc_printk(&buf, "%s=%pd ", a->tdom ? "domain" : "source", a->sdom);

Okay, I see you are trying to reduce away the last "else", but I have
several concerns about doing this suggestion.

 - The biggest concern is the fact that in the past, a domain referred
to strictly as "domain" or "domid" in an AVC has always implied it was
the source. At the same time, the target domain has always been
referenced as "target". This suggestion would completely flip that
implied understanding around. In part, this change was to move source
from being implied to being explicitly reported. The end result is it
then makes source explicit as it is for current and target.

 - AFAICT the suggestion is not logically equivalent. The current form
checks first if sdom is defined, then prints it. If sdom is not defined,
then it is presumed that tdom will be defined, and will then print it.
AIUI, the suggestion will lose the case where sdom is not defined.

 - I haven't went to confirm this, but I believe the logic here is based
on an understanding of when sdom and tdom are defined. Specifically, the
expected situations are,
  1. sdom and tdom are defined and not equal, report both
  2. if sdom and tdom are defined and equal, report only sdom as tdom
       is implied to be the same
  3. if sdom is not defined, then tdom must be defined, report only tdom
     and sdom is implied to be cdom

Finally, as I was typing this up, I had a realization that I may not be
able to relabel the reference. It is believed at some point you could
feed Xen AVCs to audit2allow to generate an allow rule for the AVC.
Though recent versions do not appear to work, so I am going to try to
find a day or two to dig in and determine what influence this might have
on the change.

v/r,
dps


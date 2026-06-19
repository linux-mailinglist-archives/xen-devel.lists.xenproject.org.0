Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YVN9JtNtNWqXwAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 18:26:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EDF6A70C8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 18:26:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=gOMNAz0s;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1342538.1602650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wac3N-0000UQ-IN; Fri, 19 Jun 2026 16:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342538.1602650; Fri, 19 Jun 2026 16:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wac3N-0000Ru-FH; Fri, 19 Jun 2026 16:26:49 +0000
Received: by outflank-mailman (input) for mailman id 1342538;
 Fri, 19 Jun 2026 16:26:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wac3L-0000Ro-8v
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 16:26:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wac3K-003Ljo-6O
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 18:26:46 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a356dc0-2eae-0a2a0a5409dd-0a2a4506c5fc-20
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 18:26:45 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a356dc3-b690-0a2a45060019-888fbc3352b2-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 18:26:45 +0200
Received: by mx.zohomail.com with SMTPS id 1781886399306291.1094597515963;
 Fri, 19 Jun 2026 09:26:39 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781886401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TXK1Ezi931ZdqE3z/9H2r5YE/93oJ2hyOfckxGNa/MEUB4Wa2vaYYE9CwP6IgeU59vZ1ELgXtqpvg7eqkZf/hGbCodrNFrb5MucOvSwMRSVYrvNyMt5f9rGl/0FW4+1SUFX586uzBs+9zU1EEuOeTtT9s3LYrOONrKlcuVL13BM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781886401; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Uho1Ezpja0sKwdaTHCFZY0G2Tikdkl5zPjmvaumbe6M=; 
	b=ZQ52mlHKY+M9zQpFU6dcMkpsz9SgkHMQgVCxB0xF1eimThPOkEJ/DTbduCW7eZ9XwqjVmUVDgvgydS/A9ai7QBReJU2708yCRaxrgaucT/AvkILN6hiUt05xwbUFMS6XI//LMwXHMTIRwBx0ShXYbAAiYfLFB5uTSC9WDnrn2Kk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781886401;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Uho1Ezpja0sKwdaTHCFZY0G2Tikdkl5zPjmvaumbe6M=;
	b=gOMNAz0sh5v+L6i7BC2dxAQA2ujKKsaNOFtWMGihB+z3mOfrw7+qkiR27iKs0G/2
	O/i5CfUs7FavGRzNkzDIz3BDGGS9Z9KFLzEBBk0nBRlbWx4kqxLVbuewtwLNNLVQhDh
	1zRgXz4mnn1az3/aED+Dwp6DMtGH4iUpEfaqrUMw=
Message-ID: <2936cde0-ec6d-48a6-906b-d42666c1fd61@apertussolutions.com>
Date: Fri, 19 Jun 2026 12:26:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
 <a3e51817-4464-4672-a975-ba76349bab31@apertussolutions.com>
 <243c5119-a016-49f4-919e-efa492b02e5e@suse.com>
 <d6071252-a8fa-44b5-923e-b08175ab0fa7@apertussolutions.com>
 <12468fb6-0cf7-4e27-89ca-8ec4640e569b@suse.com>
 <0d5d4fda-d296-4027-a62a-134fd8aaae53@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <0d5d4fda-d296-4027-a62a-134fd8aaae53@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-16d1c6/1781886405-B2BE9853-CE77B0EC/0/0
X-purgate-type: clean
X-purgate-size: 3094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[apertussolutions.com];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:email,apertussolutions.com:dkim,apertussolutions.com:email,apertussolutions.com:mid,apertussolutions.com:from_mime];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,citrix.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04EDF6A70C8


On 6/18/26 10:50, Jan Beulich wrote:
> On 18.06.2026 14:51, Jan Beulich wrote:
>> On 18.06.2026 14:48, Daniel P. Smith wrote:
>>> On 6/18/26 8:42 AM, Jan Beulich wrote:
>>>> On 18.06.2026 14:34, Daniel P. Smith wrote:
>>>>> On 6/18/26 8:23 AM, Jan Beulich wrote:
>>>>>> On 18.06.2026 14:13, Andrew Cooper wrote:
>>>>>>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>>>>>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>>>>>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>>>>>>> hypervisors.
>>>>>>>>
>>>>>>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>>>>>>> those for xsm_page_offline() (where the hook pointer field already is
>>>>>>>> suitably guarded).
>>>>>>>>
>>>>>>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>>>>>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>
>>>>>>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>>>>>>> too, which should be able to spot things like this.
>>>>>>>
>>>>>>> This is a regression vs 4.21, so does need including.
>>>>>>
>>>>>> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
>>>>>>
>>>>>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>>> --- a/xen/include/xsm/xsm.h
>>>>>>>> +++ b/xen/include/xsm/xsm.h
>>>>>>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>>>>>>     #endif
>>>>>>>>         int (*set_target)(struct domain *d, struct domain *e);
>>>>>>>>         int (*domctl)(struct domain *d, struct xen_domctl *op);
>>>>>>>> +#ifdef CONFIG_SYSCTL
>>>>>>>>         int (*sysctl)(int cmd);
>>>>>>>>         int (*readconsole)(uint32_t clear);
>>>>>>>> +#endif
>>>>>>>
>>>>>>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>>>>>>
>>>>>>> I know it will grow the diff, but can we see about collecting them into
>>>>>>> a single region, and in dummy_ops too?  It will shrink the overall
>>>>>>> result, and the order of pointers in this ops structure is uninteresting.
>>>>>>
>>>>>> I have a far more consolidating patch in the works, which is how I actually
>>>>>> noticed the issue. I'd prefer to keep things as simple as possible here.
>>>>>
>>>>> By the way, I was going back through this and notices that they are not
>>>>> ifdef out in xsm/dummy.h. Are we relying on them being inlines to ensure
>>>>> that they do not result in dead code?
>>>>
>>>> I think so. Maybe it's unhelpful that we have
>>>
>>> To be clear, you want to leave as is for now (or at least pick up in
>>> another patch)?
>>
>> It's up to you - I can add the #ifdef there, but it doesn't look to strictly
>> be needed.

It's not needed and will create minimal but extra churn on back port, so 
we can forego for now.

> Can you please make explicit which way you'd like it in order to provide an
> ack, so this bug fix can go in?

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>



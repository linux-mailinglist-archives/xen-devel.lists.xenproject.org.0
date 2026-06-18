Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KqAAGGznM2p7HwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:41:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 049C96A01FD
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:41:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=cX2JRYkN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341090.1601642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waC3L-0006sD-T7; Thu, 18 Jun 2026 12:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341090.1601642; Thu, 18 Jun 2026 12:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waC3L-0006pR-Q2; Thu, 18 Jun 2026 12:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1341090;
 Thu, 18 Jun 2026 12:41:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1waC3K-0006pK-Sk
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:41:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waC3K-003zui-48
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:41:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a33e741-e002-0a2a0a5209dd-0a2a4507aa68-48
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:41:02 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a33e759-4766-0a2a45070019-888fbc3352a2-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:40:59 +0200
Received: by mx.zohomail.com with SMTPS id 1781786451748137.6271647654495;
 Thu, 18 Jun 2026 05:40:51 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781786454; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CsaCKdfsSZYdlS/2H+1B1H0y+rircLnW/iWnwfGdbW/MxyeVt4uq0GkXSLy6E18CXl5XlRO170ZC5uoFKTveiVwbGy6SP6mQVVkSelgB78AkVnzyo8sD4WY46+HEHw4fYjzPxNC6XtT2cYjaEskEUEQXl84B9j7EVVRU5xwIA5c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781786454; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C2ygIbhffl1iDYoikiKD6fli2ANxoIlWi8qio3DbWSs=; 
	b=hqPc774sRahAnVbM5zA119yjXSxK2zE8EeR79AmZ5KpgFVdCldmFQnNdStFlaJZqAt1+Ak7sB6j45J3UIdTFrFG0vi82jI0dkTOVd5eNLD/1U5BFGVc/rHKBWd5dEzpZ6gxO9IGv/8PItpdOfTz+GntoLMl0uCPEKwpUqaNn+AY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781786454;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=C2ygIbhffl1iDYoikiKD6fli2ANxoIlWi8qio3DbWSs=;
	b=cX2JRYkNh6WVFcRKWBbgBizoB3GLr9PJoyvpBizTFx6TsQ9C4kKauEQuAYUZlKM5
	bR9+799IZpFfASh7hJxWp1tGrUz4S43yZeKuXXt5kqomD2JRLHlT5bAuRv4X1uZjvv7
	y4XJLqQ4zUa6GOwyRnDnpqbEC89m0Q0BHbwiAGVE=
Message-ID: <e5443d3c-a3ec-4698-b20e-b867f150aa5e@apertussolutions.com>
Date: Thu, 18 Jun 2026 08:40:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-ef75cf/1781786459-881CB979-B2329992/0/0
X-purgate-type: clean
X-purgate-size: 1960
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,apertussolutions.com:dkim,apertussolutions.com:mid,apertussolutions.com:from_mime,suse.com:email];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 049C96A01FD

On 6/18/26 8:23 AM, Jan Beulich wrote:
> On 18.06.2026 14:13, Andrew Cooper wrote:
>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>> hypervisors.
>>>
>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>> those for xsm_page_offline() (where the hook pointer field already is
>>> suitably guarded).
>>>
>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>> too, which should be able to spot things like this.
>>
>> This is a regression vs 4.21, so does need including.
> 
> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
> 
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
> 
> Thanks.
> 
>>> --- a/xen/include/xsm/xsm.h
>>> +++ b/xen/include/xsm/xsm.h
>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>   #endif
>>>       int (*set_target)(struct domain *d, struct domain *e);
>>>       int (*domctl)(struct domain *d, struct xen_domctl *op);
>>> +#ifdef CONFIG_SYSCTL
>>>       int (*sysctl)(int cmd);
>>>       int (*readconsole)(uint32_t clear);
>>> +#endif
>>
>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>
>> I know it will grow the diff, but can we see about collecting them into
>> a single region, and in dummy_ops too?  It will shrink the overall
>> result, and the order of pointers in this ops structure is uninteresting.
> 
> I have a far more consolidating patch in the works, which is how I actually
> noticed the issue. I'd prefer to keep things as simple as possible here.

Would also be good to clean up flask_ops similarly.

v/r,
dps



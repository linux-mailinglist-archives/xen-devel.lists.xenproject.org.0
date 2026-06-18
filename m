Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tgs1GfrlM2pbHwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:35:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7DA6A01B9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:35:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=OabhKAzS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341079.1601632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBxG-00059D-8k; Thu, 18 Jun 2026 12:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341079.1601632; Thu, 18 Jun 2026 12:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waBxG-00057a-5y; Thu, 18 Jun 2026 12:34:46 +0000
Received: by outflank-mailman (input) for mailman id 1341079;
 Thu, 18 Jun 2026 12:34:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1waBxE-00057U-Kk
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:34:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waBxD-00CU91-Fq
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:34:43 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a33e5e0-2eae-0a2a0a5409dd-0a2a45068d78-6
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:34:42 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a33e5e0-b690-0a2a45060019-888fbc335291-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:34:42 +0200
Received: by mx.zohomail.com with SMTPS id 178178607465357.3125186961671;
 Thu, 18 Jun 2026 05:34:34 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781786077; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H6LwILuXnVHaEYXdEyu/63FsbQ343Tl09GW3fkPClUvwqVi0H91B4g4AQ+civO6ds3He5wWTSpLnZ51GvJh6ry2dfvabRxkaOKpinof5xko6e4bBXDj2bah8aoxaVZhuO0ZzOweCF6QIvHVP+PTrR3YtUDjx02TeAMmvy4kLe9Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781786077; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xYw5PrrOlnqBV7j5RdBGJBqKf2UB1hhrIhK5GZ820Hw=; 
	b=EuCCjpKN79UctcaQ3A9mDN9C/z8PzslNMgeq/3FsOgA4rrsDc8LikIX4rmUrDXGbh8956TkUHtPOrUoPo5mX4pTX2XEigDTvtw8tEYtgiGQk2unUMWW7w5x77pvTM5SErP9IQ+uWSWFNfnblPpP/EHhcwNh5yuQda9+/TwINHuU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781786077;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xYw5PrrOlnqBV7j5RdBGJBqKf2UB1hhrIhK5GZ820Hw=;
	b=OabhKAzSsvYxAG35L+JbDbPC+SuUtTrt9KSanPWdyGIlitLxSuQOs9OhS+d+LHXK
	CGXtDN6ovKvCh3+t98ESBEcbPo89fot8Gkx5WJ1VGN2tfnhq7ZYizqhAXGYKUfJAMVO
	fvDaM+D56rNjl9w+SO9xBc5jftAyAOaf6SBvNbM0=
Message-ID: <a3e51817-4464-4672-a975-ba76349bab31@apertussolutions.com>
Date: Thu, 18 Jun 2026 08:34:33 -0400
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
X-purgate-ID: tlsNG-16d1c6/1781786082-39FF7853-50516860/0/0
X-purgate-type: clean
X-purgate-size: 2095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_NA(0.00)[apertussolutions.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 0D7DA6A01B9

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

By the way, I was going back through this and notices that they are not 
ifdef out in xsm/dummy.h. Are we relying on them being inlines to ensure 
that they do not result in dead code?

v/r,
dps



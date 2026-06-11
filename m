Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oRvRN3nFKmqRwgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:26:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9014E672B49
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:26:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=apertussolutions.com header.s=zoho header.b=GRGL6BIB;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=none;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335677.1597864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgLz-00067T-Pm; Thu, 11 Jun 2026 14:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335677.1597864; Thu, 11 Jun 2026 14:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgLz-00065X-Mx; Thu, 11 Jun 2026 14:25:55 +0000
Received: by outflank-mailman (input) for mailman id 1335677;
 Thu, 11 Jun 2026 14:25:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dpsmith@apertussolutions.com>) id 1wXgLy-00065R-8g
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:25:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgLx-002scC-Lb
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:25:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2ac56a-5cb7-0a2a0a5109dd-0a2a45029382-30
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:25:53 +0200
Received: from [136.143.188.51] (helo=sender4-of-o51.zoho.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dpsmith@apertussolutions.com>)
 id 6a2ac56f-af86-0a2a45020019-888fbc335282-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:25:53 +0200
Received: by mx.zohomail.com with SMTPS id 1781187941402987.899345823625;
 Thu, 11 Jun 2026 07:25:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781187942; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iUB9NjPkztSucQYFwILCw7LsCwxwkV/RsRsQLISwhb2+FBcYlcPdyDtHAshuIS5XidjL4UkxzTeKsRBNbrpxZMwvsl0kJ+necixxs9YtnechXIr2gxBFFjl6WRVq+NJgpZJ3C2cSiar6mqF0xBLV/rXm5fnpFv1Fudr8cU6i7jw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781187942; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hWWP/VKoTAppFucoEMfjeJWddtXW1qqJrnfJNCSjCiA=; 
	b=Mp8lGOghI4w8tFW8sdoA+ZZTGBViocYaSMNkzTdNXfPU7x/33P5S7rB1kS5gtGcIyhdoj15Po4mtUoUBGvvBJyQ9oW/42l/IHuKB2NbYLKlCNHNvpsmdVzw0ZqQqDCt2JnsS5ReVP7cgDl8N1XBpDacCEvQX03Spr+hFFoCyzR4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781187942;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hWWP/VKoTAppFucoEMfjeJWddtXW1qqJrnfJNCSjCiA=;
	b=GRGL6BIBfcxWlx2nzZxq1t1yjLOnpHc/lOOp10gzeVcfTV1XGX97wwXlYPu9hBpt
	2Szp/o2n/tdGLkTuwIiA5fxbCPsSUyTOiECN19M99h5/z5qA5AZOB/1obYgpPQJTwmt
	qsA/6/j9gn/CvZ0UVxq0H1qs400wQ+9ZKzZ9z2Es=
Message-ID: <1c570ddd-c785-4798-8c04-0a997d42acdf@apertussolutions.com>
Date: Thu, 11 Jun 2026 10:25:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] domctl: Handle XEN_DOMCTL_getpageframeinfo3
 without the domctl lock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260609151528.2426788-1-ross.lagerwall@citrix.com>
 <20260609151528.2426788-2-ross.lagerwall@citrix.com>
 <e5be8bcd-1699-442e-bcc4-25bb2e1c4234@apertussolutions.com>
 <airEye3YHSEmNUCG@macbook.local>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <airEye3YHSEmNUCG@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-purgate-ID: tlsNG-720697/1781187953-A8145161-C11BC304/0/0
X-purgate-type: clean
X-purgate-size: 2419
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.69 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[apertussolutions.com:s=zoho];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,apertussolutions.com:dkim,apertussolutions.com:mid,apertussolutions.com:from_mime];
	DMARC_NA(0.00)[apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[apertussolutions.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dpsmith@apertussolutions.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9014E672B49

On 6/11/26 10:23 AM, Roger Pau Monné wrote:
> On Thu, Jun 11, 2026 at 09:11:15AM -0400, Daniel P. Smith wrote:
>> On 6/9/26 11:15 AM, Ross Lagerwall wrote:
>>> It does not have side effects and is protected from concurrent changes
>>> by the P2M read lock therefore skip taking the domctl lock.
>>>
>>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
>>> ---
>>>    xen/arch/x86/domctl.c | 4 ++++
>>>    xen/common/domctl.c   | 1 +
>>>    2 files changed, 5 insertions(+)
>>>
>>> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
>>> index 83bf51e498df..0e9a2532887e 100644
>>> --- a/xen/arch/x86/domctl.c
>>> +++ b/xen/arch/x86/domctl.c
>>> @@ -301,6 +301,10 @@ long arch_do_domctl(
>>>            /* Games to allow this code block to handle a compat guest. */
>>>            void __user *guest_handle = domctl->u.getpageframeinfo3.array.p;
>>> +        ret = xsm_domctl(XSM_OTHER, d, domctl);
>>> +        if ( ret )
>>> +            break;
>>> +
>>>            if ( unlikely(num > 1024) ||
>>>                 unlikely(num != domctl->u.getpageframeinfo3.num) )
>>>            {
>>> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
>>> index 3efa5b9d55b9..35144d95b808 100644
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -555,6 +555,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>        case XEN_DOMCTL_gsi_permission:
>>>        case XEN_DOMCTL_bind_pt_irq:
>>>        case XEN_DOMCTL_unbind_pt_irq:
>>> +    case XEN_DOMCTL_getpageframeinfo3:
>>>            ret = arch_do_domctl(op, d, u_domctl);
>>>            goto domctl_out_unlock_domonly;
>> I would respectfully ask to be mindful when XSM hooks are being manipulated
>> in a patch that a review from an XSM maintainer should be sought before
>> committing a patch. In this case case the change itself is good, though I
>> would have liked the opportunity to comment that the commit message should
>> have had some explanation on the xsm change.
> 
> I've already replied to 2/2, but would like to re-instate my apology
> here so it doesn't seem like this went unnoticed:
> 
> Sorry, this was already picked up in a rush to get it into 4.22 and I
> didn't realize it was missing an XSM maintainer Ack.  That's entirely
> my fault, there was no intention to bypass or overrule your opinion.

No worries, thank you for the apologies.
.



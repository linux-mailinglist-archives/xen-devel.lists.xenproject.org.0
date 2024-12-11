Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FBF9ED0D2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 17:07:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.854958.1268025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPFM-0008GE-Fk; Wed, 11 Dec 2024 16:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 854958.1268025; Wed, 11 Dec 2024 16:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLPFM-0008E3-CR; Wed, 11 Dec 2024 16:07:32 +0000
Received: by outflank-mailman (input) for mailman id 854958;
 Wed, 11 Dec 2024 16:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLPFK-0008BF-OI
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 16:07:30 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 048f27f0-b7da-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 17:07:29 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733933240956195.13922843402474;
 Wed, 11 Dec 2024 08:07:20 -0800 (PST)
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
X-Inumbo-ID: 048f27f0-b7da-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1733933244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OIdgTLlRBamAk5x8zqa5YxDgzhIzonsQLTB9tGDZSkEb3Qd8ML/+eUz95apsgeqPcufcuJ2at9spZTsjlRmP3GMaFFizq93tALo756GV1AN9I+MEJgFjWPecOgHcpqvz9ew7d+HgTPoRDsGSn6nfLOS52YBAAinN/usd0uL+X6w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733933244; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9Lm5ZvZ63BzudbCXPyhXRSASFrTO/SYhQw6yp/5HMXc=; 
	b=O2iIBnvNl+NKCQ/KXMsLHOOvi4EUmpzwF52ZDPgBG5l6KurgEHkMYa/w8k2puMRnRjKNYgOfiPJ7k4W3BndaiIX3DLaoaA7jhIvEGW5d7LuwU+WG/jR31OXGxc0YX6PC0xjPsnXMegIAuYKWynto5IyM0xGUAyhl7CdeX6son/U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733933243;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9Lm5ZvZ63BzudbCXPyhXRSASFrTO/SYhQw6yp/5HMXc=;
	b=btYYOnsSF9q3qZFP2i7pp0lRPX40uvbwB+UvOSkQ1hj+zPYhlJEu4lOSYGT9Da8O
	bDG6fbStwUai8WaDSvfozo3UQznOqvZw/hFiKeLddOsVFxnKlN8TXd8JoDDZjBUPy1H
	w+wBXr75MXu+WIUlRMZZT4hFxxjIPFopVWZPvsP4=
Message-ID: <70aeda86-687f-4733-98e9-583bae35a220@apertussolutions.com>
Date: Wed, 11 Dec 2024 11:07:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] x86/hyperlaunch: add domain id parsing to domain
 config
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-12-dpsmith@apertussolutions.com>
 <99177823-38d9-4aca-af84-150ae6f37a25@amd.com>
 <4dbd5882-0724-4023-9c0e-43c82eba2b80@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4dbd5882-0724-4023-9c0e-43c82eba2b80@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 07:00, Jan Beulich wrote:
> On 26.11.2024 00:45, Jason Andryuk wrote:
>> On 2024-11-23 13:20, Daniel P. Smith wrote:
>>> @@ -186,6 +209,12 @@ static int __init process_domain_node(
>>>            return -EFAULT;
>>>        }
>>>    
>>> +    if ( bd->domid == DOMID_INVALID )
>>> +        bd->domid = get_initial_domain_id();
>>> +    else
>>> +        if ( bd->domid != get_initial_domain_id() )
>>
>> single line "else if"?
> 
> Yes.

Agreed.

>>> +            printk(XENLOG_WARNING "WARN: unsuported booting not using initial domid\n");
>>
>> "unsupported"
>>
>> Maybe "Booting without initial domid not supported"?
> 
> Plus the line then wants splitting after XENLOG_WARNING.

Okay.

v/r,
dps



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D19CFE5F
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 12:01:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838796.1254777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGYO-00016N-0c; Sat, 16 Nov 2024 11:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838796.1254777; Sat, 16 Nov 2024 11:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCGYN-00014u-Tu; Sat, 16 Nov 2024 11:01:23 +0000
Received: by outflank-mailman (input) for mailman id 838796;
 Sat, 16 Nov 2024 11:01:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tCGYM-000128-Nj
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 11:01:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCGYL-0080cm-1R;
 Sat, 16 Nov 2024 11:01:21 +0000
Received: from [2a02:8012:3a1:0:dc92:b14d:2764:76ac]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tCGYL-007xEH-1i;
 Sat, 16 Nov 2024 11:01:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=AGKFih8c648I8YMEXe0w+lnDdKx8anJr1brQWuQONYU=; b=sEylcHHLqi+JSrsg7R9PxkQLQg
	8d5bl0eB2PmdreHWPtvZKu31oWPxrmHdlJ+N42088cP35jCfyl9FtOfkJ75gmrpB8BQJ0YrnYxS9v
	1488QfFDbnXmrFiDYt5gi2q+R2BshZfTy6ffFT3wg9CCIfiFYEavwPbpBtja7lTW/Nr8=;
Message-ID: <f583e39d-8da4-4cb3-a698-3d982843eafe@xen.org>
Date: Sat, 16 Nov 2024 11:01:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-3-jgross@suse.com>
 <6823a222-63ad-4a5a-83d2-70c6f39f38c0@suse.com>
 <fadbb6da-a314-4f1b-8a59-92c1c201dd09@suse.com>
 <7b4015a0-9d02-40a9-9919-10e7bdd73291@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7b4015a0-9d02-40a9-9919-10e7bdd73291@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan & Juergen,

On 04/11/2024 09:35, Jan Beulich wrote:
> On 01.11.2024 07:48, Jürgen Groß wrote:
>> On 31.10.24 11:59, Jan Beulich wrote:
>>> On 23.10.2024 15:10, Juergen Gross wrote:
>>>> Add a bitmap with one bit per possible domid indicating the respective
>>>> domain has changed its state (created, deleted, dying, crashed,
>>>> shutdown).
>>>>
>>>> Registering the VIRQ_DOM_EXC event will result in setting the bits for
>>>> all existing domains and resetting all other bits.
>>>
>>> That's furthering the "there can be only one consumer" model that also
>>> is used for VIRQ_DOM_EXC itself. I consider the existing model flawed
>>> (nothing keeps a 2nd party with sufficient privilege from invoking
>>> XEN_DOMCTL_set_virq_handler a 2nd time, taking away the notification
>>> from whoever had first requested it), and hence I dislike this being
>>> extended. Conceivably multiple parties may indeed be interested in
>>> this kind of information. At which point resetting state when the vIRQ
>>> is bound is questionable (or the data would need to become per-domain
>>> rather than global, or even yet more fine-grained, albeit
>>> ->virq_to_evtchn[] is also per-domain, when considering global vIRQ-s).
>>
>> The bitmap is directly tied to the VIRQ_DOM_EXC anyway, as it is that
>> event which makes the consumer look into the bitmap via the new hypercall.
>>
>> If we decide to allow multiple consumers of VIRQ_DOM_EXC, we'll need to
>> have one bitmap per consumer of the event. This is not very hard to
>> modify.

While in principle I agree that having multiple consumers of 
VIRQ_DOM_EXC would be great. I have some scalability concern because now 
we would end up to have to update N bitmap every time. So we would need 
to put a limit to N. I don't think there is a good limit...

So overall, I am not entirely convinced it is worth the trouble.

Cheers,

-- 
Julien Grall


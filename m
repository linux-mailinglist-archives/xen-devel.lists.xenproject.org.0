Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9F7E7E2E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 18:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630709.983836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VSa-00056R-Bt; Fri, 10 Nov 2023 17:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630709.983836; Fri, 10 Nov 2023 17:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1VSa-00051y-8o; Fri, 10 Nov 2023 17:38:24 +0000
Received: by outflank-mailman (input) for mailman id 630709;
 Fri, 10 Nov 2023 17:38:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VSY-00051X-UW; Fri, 10 Nov 2023 17:38:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VSX-0005CJ-QG; Fri, 10 Nov 2023 17:38:21 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.148.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r1VSX-0004c5-K9; Fri, 10 Nov 2023 17:38:21 +0000
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
	bh=mIjbjJuJ61rlOrgKdBDbfSYU4W1xHRxsswtoXXljrY8=; b=P0CCjuImFtItE659kQcjUCDE1w
	5nb1eHQzC8qPonMYF7PHSUzE2geRjsL7zjxp1+ox86yvNLsKXqWYpOZxspz/IH4nWrtb/NFRrYHUM
	sbwQkNQYH3MgmHY33REp8dGeLXC2Cs+HHzVjYdSo1JbC1u5UsELYWHxYU89R6OyyXl0A=;
Message-ID: <7265e418-6c40-47ea-97a7-bcf3c2e61cf7@xen.org>
Date: Fri, 10 Nov 2023 17:38:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
 <9d75d794-a333-792a-786c-064d35910980@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9d75d794-a333-792a-786c-064d35910980@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 10/11/2023 12:44, Jan Beulich wrote:
> On 10.11.2023 13:23, Roger Pau Monné wrote:
>> On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
>>> Get the own domid via creation of a temporary event channel. There is
>>> no "official" way to read the own domid in PV guests, so use the event
>>> channel interface to get it:
>>>
>>> - allocate an unbound event channel specifying DOMID_SELF for the
>>>    other end
>>>
>>> - read the event channel status which will contain the own domid in
>>>    unbound.dom
>>>
>>> - close the event channel
>>
>> Should we look into introducing a way to expose the domid, so that in
>> the future we might not need to resort to this workarounds to get the
>> domid?
>>
>> Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
>> a non-HVM specific leaf when it was made available to HVM for pvshim
>> reasons.
> 
> Couldn't we retroactively generalize the type-agnostic parts of that
> leaf?

This would only work for x86. I think we want to have a generic 
hypercalls so it can be used by all arch.

Cheers,

-- 
Julien Grall


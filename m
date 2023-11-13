Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD557E9A20
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 11:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631485.984840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2U3Z-0004sT-SW; Mon, 13 Nov 2023 10:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631485.984840; Mon, 13 Nov 2023 10:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2U3Z-0004o9-Mp; Mon, 13 Nov 2023 10:20:37 +0000
Received: by outflank-mailman (input) for mailman id 631485;
 Mon, 13 Nov 2023 10:20:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2U3X-0004nl-UA; Mon, 13 Nov 2023 10:20:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2U3X-0001ae-Mz; Mon, 13 Nov 2023 10:20:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r2U3X-0001ZF-Gm; Mon, 13 Nov 2023 10:20:35 +0000
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
	bh=GgpZcqVZUu8EhXUGgfmmX5XFE1PP/9s/CPuFKVP/9XE=; b=BumTM/zxWImsBVT66e3x1W2fo+
	CADKradiVQnUJMqAzGCyLnJSk8H11C3TZtkVNWcdQJbgiT7ZO1XNtzVWE00ALomi+kcklahVsYxr4
	ABImE/obJx1G5aRRg/KkDxlDHRR99S9pbW44yYH3K0N6stGsofcWku9Va4xTSXWlBALw=;
Message-ID: <35421335-ae20-41d7-bacc-5f4a60327e9a@xen.org>
Date: Mon, 13 Nov 2023 10:20:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] Mini-OS: get own domid
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231110113435.22609-1-jgross@suse.com>
 <20231110113435.22609-3-jgross@suse.com> <ZU4g0y-Y6-77sY-C@macbook.local>
 <9d75d794-a333-792a-786c-064d35910980@suse.com>
 <7265e418-6c40-47ea-97a7-bcf3c2e61cf7@xen.org>
 <e70d9b85-00fa-3d7e-8c0a-d463cf0e0c74@suse.com>
 <c25eb77a-9a15-4450-80dc-0d9e2e79c858@xen.org>
 <53d3435f-f021-edf2-3b90-9ea8f1784725@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <53d3435f-f021-edf2-3b90-9ea8f1784725@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 13/11/2023 09:28, Jan Beulich wrote:
> On 13.11.2023 10:12, Julien Grall wrote:
>>
>>
>> On 13/11/2023 07:37, Jan Beulich wrote:
>>> On 10.11.2023 18:38, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 10/11/2023 12:44, Jan Beulich wrote:
>>>>> On 10.11.2023 13:23, Roger Pau Monné wrote:
>>>>>> On Fri, Nov 10, 2023 at 12:34:32PM +0100, Juergen Gross wrote:
>>>>>>> Get the own domid via creation of a temporary event channel. There is
>>>>>>> no "official" way to read the own domid in PV guests, so use the event
>>>>>>> channel interface to get it:
>>>>>>>
>>>>>>> - allocate an unbound event channel specifying DOMID_SELF for the
>>>>>>>      other end
>>>>>>>
>>>>>>> - read the event channel status which will contain the own domid in
>>>>>>>      unbound.dom
>>>>>>>
>>>>>>> - close the event channel
>>>>>>
>>>>>> Should we look into introducing a way to expose the domid, so that in
>>>>>> the future we might not need to resort to this workarounds to get the
>>>>>> domid?
>>>>>>
>>>>>> Maybe in the PV-specific cpuid leaf?  It's a shame we didn't put it in
>>>>>> a non-HVM specific leaf when it was made available to HVM for pvshim
>>>>>> reasons.
>>>>>
>>>>> Couldn't we retroactively generalize the type-agnostic parts of that
>>>>> leaf?
>>>>
>>>> This would only work for x86. I think we want to have a generic
>>>> hypercalls so it can be used by all arch.
>>>
>>> Hmm, yes, perhaps. Otoh it would seem desirable to me if arch-es also
>>> provided some extension to an arch-natural way of feature detection
>>> (which CPUID is on x86), without the need to invoke any hypercalls.
>>
>> For Arm, I can't really think of anything other than hvc/smc which are
>> used for calls to the hypervisor/monitor (so basically hypercalls).
>>
>> Please suggest if you have a better idea.
> 
> I don't know enough Arm to properly suggest something. Arm64 has various
> id_* system registers, so I would be wondering whether having a properly
> virtual one reserved in system register space couldn't do the trick.

AFAIK there are none available. But if such exists, then I don't see how 
that would suit with my requests to have an arch-agnostic approach.

Each architecture would need to have to provide a way to expose those 
values. At which point, why not using hypercall? What's wrong with it?

Cheers,

-- 
Julien Grall


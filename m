Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C938B229
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 16:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131020.245097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljjw6-0008In-Nr; Thu, 20 May 2021 14:46:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131020.245097; Thu, 20 May 2021 14:46:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljjw6-0008Gg-KT; Thu, 20 May 2021 14:46:06 +0000
Received: by outflank-mailman (input) for mailman id 131020;
 Thu, 20 May 2021 14:46:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljjw5-0008Ga-2w
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 14:46:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c030af74-c962-4348-896f-cfb218a95d3d;
 Thu, 20 May 2021 14:46:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA707ABCD;
 Thu, 20 May 2021 14:46:01 +0000 (UTC)
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
X-Inumbo-ID: c030af74-c962-4348-896f-cfb218a95d3d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621521961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAJ/Wdhb+P/6nTVsY6VoRSp6VLmlOkUGpAVBdyRH50E=;
	b=f3WU5037GxUFmMkoV4XMywWjvEeu6ufvsjSVrPesbJq0/FgBCacu6QI4j1TIUteP6jHhHD
	jPDjstO/EO3KVO67bS0nYM4Nw6U16Hv3NaHduc5Gl0xETEUj555swAAMEcZ68ypq3Gdaoh
	ZMO/LroEP0dnncQsVcz0KKhuMSKyRvA=
Subject: Re: [PATCH v2 1/2] xen-pciback: redo VF placement in the virtual
 topology
From: Jan Beulich <jbeulich@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
 <8def783b-404c-3452-196d-3f3fd4d72c9e@suse.com>
 <87d771dd-8b00-4101-b76b-21087ea1b1df@oracle.com>
 <214a6c61-5f6a-d841-312a-be2abb95f77a@suse.com>
 <75bfa4bd-cb4b-fb56-1600-6aebda4cf4cb@oracle.com>
 <83aa295a-9329-f516-d439-75d198b92bf0@suse.com>
Message-ID: <184ecd2b-b35f-8427-7ae2-e265750f4fae@suse.com>
Date: Thu, 20 May 2021 16:46:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <83aa295a-9329-f516-d439-75d198b92bf0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.05.2021 16:44, Jan Beulich wrote:
> On 20.05.2021 16:38, Boris Ostrovsky wrote:
>>
>> On 5/20/21 3:43 AM, Jan Beulich wrote:
>>> On 20.05.2021 02:36, Boris Ostrovsky wrote:
>>>> On 5/18/21 12:13 PM, Jan Beulich wrote:
>>>>>  
>>>>> @@ -95,22 +95,25 @@ static int __xen_pcibk_add_pci_dev(struc
>>>>>  
>>>>>  	/*
>>>>>  	 * Keep multi-function devices together on the virtual PCI bus, except
>>>>> -	 * virtual functions.
>>>>> +	 * that we want to keep virtual functions at func 0 on their own. They
>>>>> +	 * aren't multi-function devices and hence their presence at func 0
>>>>> +	 * may cause guests to not scan the other functions.
>>>>
>>>> So your reading of the original commit is that whatever the issue it was, only function zero was causing the problem? In other words, you are not concerned that pci_scan_slot() may now look at function 1 and skip all higher-numbered function (assuming the problem is still there)?
>>> I'm not sure I understand the question: Whether to look at higher numbered
>>> slots is a function of slot 0's multi-function bit alone, aiui. IOW if
>>> slot 1 is being looked at in the first place, slots 2-7 should also be
>>> looked at.
>>
>>
>> Wasn't the original patch describing a problem strictly as one for single-function devices, so the multi-function bit is not set? I.e. if all VFs (which are single-function devices) are placed in the same slot then pci_scan_slot() would only look at function 0 and ignore anything higher-numbered.
>>
>>
>> My question is whether it would "only look at function 0 and ignore anything higher-numbered" or "only look at the lowest-numbered function and ignore anything higher-numbered".
> 
> The common scanning logic is to look at slot 0 first. If that's populated,
> other slots get looked at only if slot 0 has the multi-function bit set.
> If slot 0 is not populated, nothing is known about the other slots, and
> hence they need to be scanned.

In particular Linux'es next_fn() ends with

	/* dev may be NULL for non-contiguous multifunction devices */
	if (!dev || dev->multifunction)
		return (fn + 1) % 8;

	return 0;

Jan


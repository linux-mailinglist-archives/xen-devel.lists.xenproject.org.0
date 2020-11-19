Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC72B8F36
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 10:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30520.60592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgVT-0003eq-VB; Thu, 19 Nov 2020 09:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30520.60592; Thu, 19 Nov 2020 09:45:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgVT-0003eT-Rw; Thu, 19 Nov 2020 09:45:35 +0000
Received: by outflank-mailman (input) for mailman id 30520;
 Thu, 19 Nov 2020 09:45:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfgVS-0003eO-KQ
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:45:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfgVR-0007qe-HO; Thu, 19 Nov 2020 09:45:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfgVR-0007ET-9v; Thu, 19 Nov 2020 09:45:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfgVS-0003eO-KQ
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 09:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=5nbOD9UELbP8gFS0hwOsVv3brwLNuvhMJ67nY+aAgyg=; b=jaquHvPjfBy5pamUc0UtZ7cr+T
	5Jg5LPyc3an20vhWAHEYk9BrJYlDs8/xsRIp3GItVWO7y7tGhRDIg7/uvBSBJoOAsbh/e+ISbhrfX
	E1IF91YMUi0J52a35A/q7MzjJRmSlFevQpQxU1SzNf4a1c+WINqiFCzY1DtYK+DGMsjg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfgVR-0007qe-HO; Thu, 19 Nov 2020 09:45:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfgVR-0007ET-9v; Thu, 19 Nov 2020 09:45:33 +0000
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
 <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <bd5fa7bb-7c44-1ec0-fc57-3ecf01c7d651@suse.com>
 <CBBE4253-F244-418D-9EA6-BC39D1BC8DF8@arm.com>
 <1530c2fb-8def-37eb-8a22-d7f9fc4e38b4@suse.com>
 <0946edb2-c2c1-0d3d-c8ff-f24055f78ebf@xen.org>
 <9f505669-a107-fecc-d26c-75e14cdabadf@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b3eac2b6-f412-0814-b876-72bf48488b09@xen.org>
Date: Thu, 19 Nov 2020 09:45:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <9f505669-a107-fecc-d26c-75e14cdabadf@suse.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/11/2020 09:00, Jan Beulich wrote:
> On 18.11.2020 16:35, Julien Grall wrote:
>> On 18/11/2020 15:16, Jan Beulich wrote:
>>> On 18.11.2020 16:02, Rahul Singh wrote:
>>>> Hello Jan,
>>>>
>>>>> On 17 Nov 2020, at 10:55 am, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>
>>>>> On 16.11.2020 13:25, Rahul Singh wrote:
>>>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When HAS_PCI
>>>>>> is enabled for ARM, compilation error is observed for ARM architecture
>>>>>> because ARM platforms do not have full PCI support available.
>>>>>
>>>>> While you've extended the sentence, it remains unclear to me what
>>>>> compilation error it is that results here. I've requested such
>>>>> clarification for v2 already.
>>>>
>>>> Compilation error is related to the code that refer to x86  functions (create_irq()..) and MSI implementation related error.
>>>> For more details please find the attached file for compilation error.
>>>
>>> The use of mmio_ro_ranges is almost quite possibly going to remain
>>> x86-specific, but then I guess this wants abstracting in a suitable
>>> way.
>>>
>>> The remaining look to all be MSI-related, so perhaps what you want
>>> to avoid is just that part rather than everything PCI-ish?
>>
>> Not really (see more above).
> 
> Did you really mean "above", not "below"? If so, I guess I need some
> clarification. If not, I suppose I've addressed your concern by the
> 2-patch series I've just sent.

This was meant to be "below".

Cheers,

-- 
Julien Grall


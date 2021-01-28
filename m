Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9C307DC9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 19:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77397.140156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bv7-0001zx-No; Thu, 28 Jan 2021 18:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77397.140156; Thu, 28 Jan 2021 18:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Bv7-0001zY-Kg; Thu, 28 Jan 2021 18:21:29 +0000
Received: by outflank-mailman (input) for mailman id 77397;
 Thu, 28 Jan 2021 18:21:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5Bv5-0001zT-MK
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 18:21:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Bun-0003kW-0D; Thu, 28 Jan 2021 18:21:09 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Bum-0003pb-P3; Thu, 28 Jan 2021 18:21:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=qtmK7ILflSxOrv9KD+ht1JOElI9Cazedib1OCzO8SeU=; b=yNozMpJve7ZGCzDASWLcp9pqn5
	j6CtP7nDADm2clDQN+4xlC2ZLSjsiNGAYOtzozvYgtYLebcosvBFlWOss+sopQvxQlp1lebftasWm
	eiT3ixMjlT5NQWSmcxpRMrSEV2X3LnQkZSOLbF+TdoHupMiwnaq+YVsWfZyWXc+d3QWU=;
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
 <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
 <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org>
 <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
 <9d0e2e0a-4409-ee37-636b-a0403e3571fc@xen.org>
Message-ID: <32349c24-dc9b-8c0a-d98e-3fc39eebb9ec@xen.org>
Date: Thu, 28 Jan 2021 18:21:05 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <9d0e2e0a-4409-ee37-636b-a0403e3571fc@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/01/2021 18:16, Julien Grall wrote:
> Hi Andrew,
> 
> On 28/01/2021 18:10, Andrew Cooper wrote:
>> On 28/01/2021 17:44, Julien Grall wrote:
>>>
>>>
>>> On 28/01/2021 17:24, Stefano Stabellini wrote:
>>>> On Thu, 28 Jan 2021, Julien Grall wrote:
>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>    > Patch series [8] was rebased on recent "staging branch"
>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is
>>>>>> unmapped) and
>>>>>> tested on
>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio disk
>>>>>> backend [9]
>>>>>> running in driver domain and unmodified Linux Guest running on
>>>>>> existing
>>>>>> virtio-blk driver (frontend). No issues were observed. Guest domain
>>>>>> 'reboot/destroy'
>>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>>
>>>>> I have done basic testing with a Linux guest on x86 and I didn't
>>>>> spot any
>>>>> regression.
>>>>>
>>>>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm
>>>>> if there
>>>>> is no regression there. Can anyone give a try?
>>>>>
>>>>> On a separate topic, Andrew expressed on IRC some concern to expose 
>>>>> the
>>>>> bufioreq interface to other arch than x86. I will let him explain
>>>>> his view
>>>>> here.
>>>>>
>>>>> Given that IOREQ will be a tech preview on Arm (this implies the
>>>>> interface is
>>>>> not stable) on Arm, I think we can defer the discussion past the
>>>>> freeze.
>>>>
>>>> Yes, I agree that we can defer the discussion.
>>>>
>>>>
>>>>> For now, I would suggest to check if a Device Model is trying to
>>>>> create an
>>>>> IOREQ server with bufioreq is enabled (see ioreq_server_create()).
>>>>> This would
>>>>> not alleviate Andrew's concern, however it would at allow us to
>>>>> judge whether
>>>>> the buffering concept is going to be used on Arm (I can see some use
>>>>> for the
>>>>> Virtio doorbell).
>>>>>
>>>>> What do others think?
>>>>
>>>> Difficult to say. We don't have any uses today but who knows in the
>>>> future.
>>>
>>> I have some ideas, but Andrew so far objects on using the existing
>>> bufioreq interface for good reasons. It is using guest_cmpxchg() which
>>> is really expensive.
>>
>> Worse.  Patch 5 needs to switch cmpxchg() to guest_cmpxchg() to avoid
>> reintroducing XSA-295, but doesn't.
> 
> The memory is only shared with the emulator (we don't allow the legacy 
> interface on Arm). So why do you think it is re-introducing XSA-295?

Just for clarification, the swithc to guest_cmpxchg() is done as part of 
patch #13.

Cheers,

-- 
Julien Grall


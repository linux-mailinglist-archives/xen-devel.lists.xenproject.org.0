Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1585307938
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 16:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77172.139619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l590M-0003iV-Q0; Thu, 28 Jan 2021 15:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77172.139619; Thu, 28 Jan 2021 15:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l590M-0003i6-Mk; Thu, 28 Jan 2021 15:14:42 +0000
Received: by outflank-mailman (input) for mailman id 77172;
 Thu, 28 Jan 2021 15:14:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l590L-0003i1-EE
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 15:14:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5901-0008HG-Cu; Thu, 28 Jan 2021 15:14:21 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5901-0002fI-4u; Thu, 28 Jan 2021 15:14:21 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=wo0HK1R2Ik9sSFowo50oPbSJIwMEQwz1TCExGyAq3BE=; b=Z1xyF7xiRkapzRv836MflzpW0F
	cvR1bx0CQUDE6my75Ibbt1+QVuE9KMKhp1AZM3iKQ+kMk5oneoqlYJn17b3v9tmLil9TCJeDloE7I
	8aSh1QiJBGM4G/ImBnbbl5j1/U/F/ll+v8OPzlWw/zIgnKc3bVMoz783uRp9C3KP81U4=;
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <dc7866fc-5b13-5378-2b22-6475053fd76b@xen.org>
 <a69fdf11-2445-865f-4893-b486618c29a3@gmail.com>
 <a1bde3cd-c902-1e86-dc35-6c503ebfa684@xen.org>
 <e274bb07-23e6-95cb-c614-344098f27f76@gmail.com>
 <fb163739-fffc-b6d8-1ae4-d95a68c29e60@xen.org>
 <58677bf7-a7ba-7827-75f4-f86152954c24@gmail.com>
 <ef73fe0a-34bd-b1d2-baaa-6dc43cfeabe4@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4960d39d-1b9f-8769-fea1-8a91bfed7fb1@xen.org>
Date: Thu, 28 Jan 2021 15:14:17 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ef73fe0a-34bd-b1d2-baaa-6dc43cfeabe4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 28/01/2021 14:37, Oleksandr wrote:
> On 27.01.21 19:45, Oleksandr wrote:
>>
>> On 27.01.21 19:42, Julien Grall wrote:
>>
>> Hi
>>
>>>
>>>
>>> On 27/01/2021 17:37, Oleksandr wrote:
>>>>
>>>> On 27.01.21 19:33, Julien Grall wrote:
>>>>
>>>> Hi Julien
>>>>
>>>>>
>>>>>
>>>>> On 27/01/2021 16:50, Oleksandr wrote:
>>>>>>
>>>>>> On 27.01.21 18:43, Julien Grall wrote:
>>>>>>> Hi Oleksandr,
>>>>>>
>>>>>> Hi Julien
>>>>>>
>>>>>>
>>>>>>>
>>>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>>>> ***
>>>>>>>>
>>>>>>>> Patch series [8] was rebased on recent "staging branch"
>>>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is 
>>>>>>>> unmapped) and tested on
>>>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio 
>>>>>>>> disk backend [9]
>>>>>>>> running in driver domain and unmodified Linux Guest running on 
>>>>>>>> existing
>>>>>>>> virtio-blk driver (frontend). No issues were observed. Guest 
>>>>>>>> domain 'reboot/destroy'
>>>>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>>>>>
>>>>>>>> Please note, build-test passed for the following modes:
>>>>>>>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>>>>>>>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>>>>>>>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>>>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>>>>>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>>>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>>>>>
>>>>>>> I thought I woudl give a try to test the code, but I can't find a 
>>>>>>> way to enable CONFIG_IOREQ_SERVER from the UI.
>>>>>>>
>>>>>>> Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER doesn't 
>>>>>>> have a prompt and is not selected by Arm.
>>>>>>>
>>>>>>> Can you provide details how this can be built on Arm?
>>>>>>
>>>>>> Please apply the attached patch to select IOREQ on Arm.
>>>>>
>>>>> This is roughly what I wrote. I think a user should be able to 
>>>>> select IOREQ via the menuconfig without any additional patch on top 
>>>>> of your series.
>>>>>
>>>>> Can you include a patch that would enable that?
>>>>
>>>> Yes, do you prefer a separate patch or required changes could be 
>>>> folded in patch #14?
>>>
>>> I would do a separate patch as IOREQ only really work after the full 
>>> series applies.
>>
>>
>> Makes sense, I will do it for V6
> 
> 
> Could we please negotiate *the last posting time* for me to able to 
> prepare and push V6 not later than it?

The feature freeze is going to be happen tomorrow evening. I can't give 
you as specific time, but it is probably best if you respin v6 by 
tomorrow morning. This should give us some slack for any last minutes 
issues (if any).

Cheers,

-- 
Julien Grall


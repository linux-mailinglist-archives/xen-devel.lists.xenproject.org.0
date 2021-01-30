Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1084B309590
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 14:55:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78897.143643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5qiO-0005Wh-Ni; Sat, 30 Jan 2021 13:55:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78897.143643; Sat, 30 Jan 2021 13:55:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5qiO-0005WH-K7; Sat, 30 Jan 2021 13:55:04 +0000
Received: by outflank-mailman (input) for mailman id 78897;
 Sat, 30 Jan 2021 13:55:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5qiN-0005WB-2o
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 13:55:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5qiL-0008IV-W5; Sat, 30 Jan 2021 13:55:01 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5qiL-0005NF-Nw; Sat, 30 Jan 2021 13:55:01 +0000
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
	bh=cZJi1n5/fMcin5Q4NUQE7ougA8QBh0ZqdJJ+UQ/Vihk=; b=AuzlN5SwKFhr5+3ODJA6UFKr8i
	XC+1+quH7GaZ5VnOT3iTtecnlvElotbEzZKUAchd5ftYL90/PlUl5xhlpnnwu/MmF9MEr9Tq8tj0s
	+9LLBKhKPvFbmoisw+w1BwPhlfQabvCn5Bk4weN9KnMdVqcD78qWAsRZyvINx49LPNx4=;
Subject: Re: Question about xen and Rasp 4B
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <alpine.DEB.2.21.2101271707570.9684@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2101291740190.9684@sstabellini-ThinkPad-T480s>
 <404be2c1-79da-acd1-ca04-2e12f65fa664@unikie.com>
From: Julien Grall <julien@xen.org>
Message-ID: <91647c7f-d8e3-0533-dc46-ac7f798db876@xen.org>
Date: Sat, 30 Jan 2021 13:55:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <404be2c1-79da-acd1-ca04-2e12f65fa664@unikie.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 30/01/2021 13:44, Jukka Kaartinen wrote:
> 
> 
> On 30.1.2021 3.42, Stefano Stabellini wrote:
>> On Wed, 27 Jan 2021, Stefano Stabellini wrote:
>>> FYI I have just ordered a micro HDMI cable so I might be able to provide
>>> more useful feedback in the following days.
>>
>> What did you use to setup the graphic environment? Is it Ubuntu or
>> Raspbian? I am having issues setting up a distro with a "startx" that
>> works.
>>
> I'm using Ubuntu mate. Plain Ubuntu seemed to be quite slow.
> Btw. we noticed that cpufreq stays at 600MHz if it is not forced from 
> the config.txt
> 
> arm_freq=1500
> force_turbo=1
> 
> 
> This kernel trace might be related.
> [    0.746502] cpufreq-dt cpufreq-dt: failed register driver: -19
> 
This is normal, Dom0 doesn't see the physical CPUs, instead they are all 
virtual and /cpus is recreated.

For a proper solution, either dom0 would need to be modified to 
understandn the different between vCPUs and pCPUs or we will want to 
implement the CPUFreq in Xen.

It might be possible to have a simpler solution on some setup (for 
instance if you have each pCPU dedicated to a single vCPU).

Cheers,

-- 
Julien Grall


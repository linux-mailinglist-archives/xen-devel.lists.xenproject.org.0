Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2728C26DF73
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:19:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvga-0000kX-NM; Thu, 17 Sep 2020 15:19:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3K40=C2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kIvgZ-0000kS-PY
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:18:59 +0000
X-Inumbo-ID: 833b94d8-3a66-4127-9aff-3ee705b2da92
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 833b94d8-3a66-4127-9aff-3ee705b2da92;
 Thu, 17 Sep 2020 15:18:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600355937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOn5eEjXrGzxugjdQ3CBfHROyHMfDl3erKv96/yXIDg=;
 b=VddjaVMnm3BuJfVI2g/xXpXlYQaVKK0lFopRtsjpVA0vH8D9sCSnc8D+JfnZTOwaXpWF0f
 j4bIv1xPJFZFU5x2WZwdYD982FfmENEtAVsz+zw2ZBEuz7KFlk6oUkYVWB0hgU4T27Cx4l
 8jbuNavdEA53qGCBCUc51LyvxYbet5i//Yo5RlFxJ4m9yioyuYg80X4B+HV5+EUz8CQB6Z
 qkGv9iYW4EOxzOb0bXoGbA6uTpsDGCkwWuZVQD6+kaLOsKsqXTe+AI1dIXfhYXChSXT+le
 Y4+fgSeZCfwckhC3732sYWuiiNvaq5u0nBrIDb5pyWC1d35vnm21WA7fVsrFmA==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C1ADAB5C;
 Thu, 17 Sep 2020 15:19:31 +0000 (UTC)
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: xen-devel <xen-devel@dornerworks.com>,
 Josh Whitehead <Josh.Whitehead@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20d9521f-beee-17e3-9acb-b1aa48a5bdbd@suse.com>
Date: Thu, 17 Sep 2020 17:18:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.20 17:10, Stewart Hildebrand wrote:
> On Thursday, September 17, 2020 5:04 AM, Jürgen Groß wrote:
>> On 16.09.20 20:18, Jeff Kubascik wrote:
>>> This change is an overhaul of the ARINC653 scheduler to enable CAST-32A
>>> multicore scheduling. CAST-32A specifies that only one partition
>>> (domain) can run during a minor frame, but that domain is now allowed to
>>> have more than one vCPU.
>>
>> It might be worth to consider using just the core scheduling framework
>> in order to achive this. Using a sched_granularity with the number of
>> cpus in the cpupool running ARINC653 scheduler should already do the
>> trick. There should be no further midification of ARINC653 scheduler
>> required.
>>
> 
> This CAST-32A multicore patch series allows you to have a different number of vCPUs (UNITs, I guess) assigned to domUs. For example, dom1 has a single vCPU, and dom2 has 4 vCPUs. I didn't think the core scheduling framework had this flexibility?

It has.

You can have a guest with only one vcpu running with any larger
granularity.


Juergen


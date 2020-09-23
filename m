Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D344E275725
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 13:28:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL2wQ-00061i-W3; Wed, 23 Sep 2020 11:28:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+VqP=DA=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kL2wP-00061b-FV
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 11:28:05 +0000
X-Inumbo-ID: 1ce36209-2a08-4fa5-a4d3-c1e886a4040e
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ce36209-2a08-4fa5-a4d3-c1e886a4040e;
 Wed, 23 Sep 2020 11:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=84P6DnBnTL/yvmIkqEFujF/5rFjWsuCyFMFkcWAVA0g=; b=4cOpuslsGByhFwRNw5r/VwjXbA
 RnXIGjmog9EsF39nepGr6tXNybmFenYe+obgTMThxCu2IzhZIAxPcOWQ1JipKF9IjYkKZHksYrer0
 sPKF8y2Y9h9udsZY/oJ0zGSnB+5Dgt4oKf8ZwcWhpkFj6F6hZRC49xAaSiCKnuGJTaGg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL2wJ-0000Dm-On; Wed, 23 Sep 2020 11:27:59 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kL2wJ-0003uE-Eu; Wed, 23 Sep 2020 11:27:59 +0000
Subject: Re: [RESEND][PATCH] xen/arm: sched: Ensure the vCPU context is seen
 before vcpu_pause() returns
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20200922193104.20604-1-julien@xen.org>
 <582CD990-4D6B-4B93-BDB5-C16D5F69A9EB@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <87e6546b-8e3c-35cf-0e99-34575107b2ed@xen.org>
Date: Wed, 23 Sep 2020 12:27:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <582CD990-4D6B-4B93-BDB5-C16D5F69A9EB@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 23/09/2020 12:08, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 22 Sep 2020, at 20:31, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Some callers of vcpu_pause() will expect to access the latest vcpu
>> context when the function returns (see XENDOMCTL_{set,get}vcpucontext}.
>>
>> However, the latest vCPU context can only be observed after
>> v->is_running has been observed to be false.
>>
>> As there is no memory barrier instruction generated, a processor could
>> try to speculatively access the vCPU context before it was observed.
> 
> The function vcpu_context_saved does contain a memory barrier already.

Memory barriers usually work in pair. We have a write barrier in 
vcpu_context_saved() but no read barrier in the code relying on the 
v->is_running.

> Shouldn’t we make sure instead that any time is_running is modified to
> false there is a barrier before (which is the case in vcpu_context_saved) ?
> 
> I understand the goal here but the barrier seem very far from the modification
> of is_running.

That's not what I am trying to fix (see above). Instead, this patch will 
ensure that when a pCPU observe v->is_running = false, then it can rely 
on the context of the vCPU to be valid.

Cheers,

-- 
Julien Grall


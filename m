Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15924909BC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 14:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258176.444341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9SMx-00062J-A8; Mon, 17 Jan 2022 13:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258176.444341; Mon, 17 Jan 2022 13:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9SMx-0005zh-6p; Mon, 17 Jan 2022 13:48:23 +0000
Received: by outflank-mailman (input) for mailman id 258176;
 Mon, 17 Jan 2022 13:48:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n9SMv-0005zW-5E
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 13:48:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n9SMo-0004i0-Lx; Mon, 17 Jan 2022 13:48:14 +0000
Received: from [202.153.81.7] (helo=[192.168.175.62])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n9SMo-0001qn-8I; Mon, 17 Jan 2022 13:48:14 +0000
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
	bh=BzVJnIH9ur1be4iZ8VTxomRpO3sboGRN421B9Vnp5RI=; b=qpu3fWL6bt6+0YZaSOwdw0/kDg
	TNdmiXyjIfLrwafi52lOWao3psBYsyM2DWecV89R7GWjZ2fst9dvoDFDrYOU0YdkyXS1e9RMKdNe4
	P1xTyy/lDcd8vy13V+Ig9XhLawqMe4lUuK3p5bj49OKNUdPtiIIBhQp0YVUa98Bs4JWo=;
Message-ID: <b6ed9ee2-460b-f704-f3e7-b25d25aef337@xen.org>
Date: Mon, 17 Jan 2022 17:48:06 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: sched=null vwfi=native and call_rcu()
To: Juergen Gross <jgross@suse.com>, George Dunlap
 <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
 <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
 <alpine.DEB.2.22.394.2201061747140.2060010@ubuntu-linux-20-04-desktop>
 <0cb5a1ceff3afc6c6d4319c9f6dd06a06a93a294.camel@suse.com>
 <alpine.DEB.2.22.394.2201141253080.19362@ubuntu-linux-20-04-desktop>
 <B9187426-3A8D-4687-A00B-487A6B4EF1D7@citrix.com>
 <619e264e-9d4e-f97b-227d-7917ade0bbe8@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <619e264e-9d4e-f97b-227d-7917ade0bbe8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/01/2022 15:13, Juergen Gross wrote:
> On 17.01.22 12:05, George Dunlap wrote:
>>> On Jan 14, 2022, at 9:01 PM, Stefano Stabellini 
>>> <sstabellini@kernel.org> wrote:
>>> On Fri, 14 Jan 2022, Dario Faggioli wrote:
>>>> On Thu, 2022-01-06 at 17:52 -0800, Stefano Stabellini wrote:
>>>>> On Thu, 6 Jan 2022, Julien Grall wrote:
>>>> Alternatively, we can submit the series as ARM-only... But I fear that
>>>> the x86 side of things would then be easily forgotten. :-(
>>>
>>> I agree with you on this, but at the same time we are having problems
>>> with customers in the field -- it is not like we can wait to solve the
>>> problem on ARM any longer. And the issue is certainly far less likely to
>>> happen on x86 (there is no vwfi=native, right?) In other words, I think
>>> it is better to have half of the solution now to solve the worst part of
>>> the problem than to wait more months for a full solution.

Well, it all depends on how your guest OS works A "malicious" guest that 
will configure the vCPU to busy loop without wfi will result to the same 
problem (this is one of the reason why NULL scheduler is not security 
supported).

>>
>> An x86 equivalent of vwfi=native could be implemented easily, but 
>> AFAIK nobody has asked for it yet.  I agree that we need to fix if for 
>> ARM, and so in the absence of someone with the time to fix up the x86 
>> side, I think fixing ARM-only is the way to go.
>>
>> It would be good if we could add appropriate comments warning anyone 
>> who implements `hlt=native` on x86 the problems they’ll face and how 
>> to fix them.  Not sure the best place to do that; in the VMX / SVM 
>> code that sets the exit for HLT &c?
> 
> But wouldn't a guest in a busy loop on x86 with NULL scheduler suffer
> from the same problem?

This is not a problem on x86 because there will always an exit to the 
hypervisor a timed interval (IIRC for some rendezvous?). On Arm, using 
the NULL scheduler will result to a completely tickless hypervisor.

Cheers,

-- 
Julien Grall


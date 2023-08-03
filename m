Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C346976F39E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 21:43:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576589.902889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qReDk-0007AA-5s; Thu, 03 Aug 2023 19:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576589.902889; Thu, 03 Aug 2023 19:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qReDk-00077n-2J; Thu, 03 Aug 2023 19:42:52 +0000
Received: by outflank-mailman (input) for mailman id 576589;
 Thu, 03 Aug 2023 19:42:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0usr=DU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qReDi-00077f-F9
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 19:42:50 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb90aea6-3235-11ee-b269-6b7b168915f2;
 Thu, 03 Aug 2023 21:42:48 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1691091754739117.37028717622366;
 Thu, 3 Aug 2023 12:42:34 -0700 (PDT)
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
X-Inumbo-ID: eb90aea6-3235-11ee-b269-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1691091755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GE1T+WHsDuXoDxDQ8av1C/yiUKuG2q38YkCj/VeUH1HcOriS96YJUlmj5bSA+1YZ3nL5mfbUWyMJVRx7NtmDO283M05GDw4XEqk/LAnv6c916BMFJjwdL63RIrVAAYpMSqwnL3TunA/XiDbSBheNO842FnFE7BmICM6b/sT1Uak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1691091755; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=2I+Vu5mQ8GuInwyRjafb7KsZvx3azkyTFJ/xC5tSh2w=; 
	b=IM24OgF0X3Qf58rIEkYMk/1d0A+J0jg2vWFBSuaF32FYLlDEJsX1a75Kb7KnCY9t7DQ0ULMycBNe8kJ4TMC5S/vyxZPf83xLKfMAiAzFt/ubbU11cyJ+FNo9uR4SoCYuqEKYhRNg6uPeUI6dtpVx02BxkaAswuNx1Z9A/4Hk0cw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1691091755;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2I+Vu5mQ8GuInwyRjafb7KsZvx3azkyTFJ/xC5tSh2w=;
	b=mEWUyf/vLxXyaQqpVzpZhiKxskDw5/T7MkvNt+dVMzwxE2ljGN841JL+l2cGuPGV
	6MJZnCIrDWSNmP6Im4ENDgPKDaZUF7z9ll0trFLhBF23Yo0juMqxS/j/wIABrbta4G3
	QOc2ye/J/NBPN7mj+STxXZPCRrKjDMOe0aqus8ig=
Message-ID: <4e5be83a-64f2-7a63-ec61-e992c8a8c1fb@apertussolutions.com>
Date: Thu, 3 Aug 2023 15:42:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
 <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
 <alpine.DEB.2.22.394.2308021657290.2127516@ubuntu-linux-20-04-desktop>
 <98db3f0c-6188-ba1b-7252-ae3e31adbf36@apertussolutions.com>
 <alpine.DEB.2.22.394.2308031229090.2127516@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031229090.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External



On 8/3/23 15:30, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Daniel P. Smith wrote:
>> On 8/2/23 19:58, Stefano Stabellini wrote:
>>> On Wed, 2 Aug 2023, Jan Beulich wrote:
>>>>> -    for ( ; ; )
>>>>> +    if ( d == NULL )
>>>>
>>>> This covers both Xen receiving input and the domain receiving input having
>>>> gone away. Originally in the latter case the next sequential (in domid
>>>> numbering) domain would be switched to. In the new logic you start over
>>>> from the beginning of the domain list. Such a change in behavior (if
>>>> deemed acceptable at all, which I'm not convinced of) needs calling out in
>>>> the description.
>>>
>>> I think it would be best to keep the current behavior as we already
>>> have people using it unless we have strong reasons to change it.
>>
>> I agree and intended to keep the order of switching but I disagree on keeping
>> the complete current behavior. I mean that by the complete current behavior
>> being defined, at least for Arm, as meaning only the domains created at boot.
>> The is_console flag in struct domain is the DAC equivalent to granting the
>> FLASK access XEN__READCONSOLE to a domain, it was just never implemented/used
>> until domoless enable it. An intended consequence of this patch is to ensure
>> any domain granted the privilege, either through the DAC is_console or FLASK
>> XEN__READCONSOLE, is included in the rotation regardless if the domain was
>> created at boot or at runtime.
> 
> I think that's fine.
> 
> Let's say that we have Xen, Dom0, and 2 Dom0less DomUs at boot.  The
> console will start on Dom0 and the rotation would go:
> 
> Dom0->Dom1->Dom2->Xen->Dom0...
> 
> If a new domain comes up at runtime with is_console, it would become:
> 
> Dom0->Dom1->Dom2->Dom3->Xen->Dom0...

Correct, that is the sequence I was attempting to achieve, but then I 
ran into the dom0less CI configuration of booting a system with Xen and 
a DomU. The above rotation will stay the same less dom0/hwdom, but it 
did quickly point out that I made an assumption about the hardware 
domain always being present.

v/r,
dps


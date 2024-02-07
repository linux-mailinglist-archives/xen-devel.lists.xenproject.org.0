Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C254E84C843
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:07:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677313.1053841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXepJ-0002tS-Mf; Wed, 07 Feb 2024 10:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677313.1053841; Wed, 07 Feb 2024 10:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXepJ-0002rZ-K6; Wed, 07 Feb 2024 10:06:45 +0000
Received: by outflank-mailman (input) for mailman id 677313;
 Wed, 07 Feb 2024 10:06:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rXepI-0002rT-E5
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:06:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXepH-0006sv-UF; Wed, 07 Feb 2024 10:06:43 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rXepH-0005Mc-Nr; Wed, 07 Feb 2024 10:06:43 +0000
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
	bh=D0dBMrZ3WAJaA4lhRMFcD0qZlUFXCJfatxEbtL5kBjc=; b=cQ+FESx5w5HdNGevGiOQm7lEIF
	H7RIvV5sIipxg9wEHCpJUWfwtK1cytKOGV6cNSnnWPkS5fBmcMmsKHheU3ubuijRWh6s2cmbbQdsF
	KuKaLyQwdbUuaFTQJTQI6OWMvR4GrBEKbCSZIZzt6AlR/aHkqgjtQngrH6uEv859hSEg=;
Message-ID: <e3a967fb-f9c5-495f-a30a-1826e3673c95@xen.org>
Date: Wed, 7 Feb 2024 10:06:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 1/3] xen/arm: Introduce CONFIG_PARTIAL_EMULATION and
 "partial-emulation" cmd option
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, luca.fancellu@arm.com
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-2-ayan.kumar.halder@amd.com>
 <c7841d11-d072-4787-9d76-ee94123605bb@xen.org>
 <8daa2461-092f-48ad-8556-3bba398ae544@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8daa2461-092f-48ad-8556-3bba398ae544@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 07/02/2024 07:45, Michal Orzel wrote:
> On 06/02/2024 19:49, Julien Grall wrote:
>> On 31/01/2024 12:10, Ayan Kumar Halder wrote:
>>> There can be situations when the registers cannot be emulated to their full
>>> functionality. This can be due to the complexity involved. In such cases, one
>>> can emulate those registers as RAZ/WI for example. We call them as partial
>>> emulation.
>>>
>>> Some registers are non-optional and as such there is nothing preventing an OS
>>> from accessing them.
>>> Instead of injecting undefined exception (thus crashing a guest), one may want
>>> to prefer a partial emulation to let the guest running (in some cases accepting
>>> the fact that it might result in unwanted behavior).
>>>
>>> A suitable example of this (as seen in subsequent patches) is emulation of
>>> DBGDTRTX_EL0 (on Arm64) and DBGDTRTXINT(on Arm32). These non-optional
>>> registers can be emulated as RAZ/WI and they can be enclosed within
>>> CONFIG_PARTIAL_EMULATION.
>>>
>>> Further, "partial-emulation" command line option allows us to
>>> enable/disable partial emulation at run time. While CONFIG_PARTIAL_EMULATION
>>> enables support for partial emulation at compile time (i.e. adds code for
>>> partial emulation), this option may be enabled or disabled by Yocto or other
>>> build systems. However if the build system turns this option on, users
>>> can use scripts like Imagebuilder to generate uboot-script which will append
>>> "partial-emulation=false" to xen command line to turn off the partial
>>> emulation. Thus, it helps to avoid rebuilding xen.
>>>
>>> By default, "CONFIG_PARTIAL_EMULATION=y" and "partial-emulation=false".
>>> This is done so that Xen supports partial emulation. However, customers are
>>> fully aware when they enable partial emulation. It's important to note that
>>> enabling such support might result in unwanted/non-spec compliant behavior.
>>
>> Can you remind me why this is built by default? In particular...
> This is the result of RFC discussion we had, where both Bertrand and Stefano agreed on having
> the Kconfig enabled by default to improve user experience:
> Bertrand:
> https://lore.kernel.org/xen-devel/C0ADC33B-1966-4D3E-B081-A3AA0C3AE76D@arm.com/
> Stefano:
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2312081514450.1703076@ubuntu-linux-20-04-desktop/

Thanks for the pointer. I thought a bit more and per-se the default of 
the Kconfig doesn't really matter too much. So I am fine to keep it on 
by default.

That said, I think we need to detail the security support for the 
command line in SUPPORT.md. I think we want to consider to not security 
support any issue that would allow the userland to attack the guest OS 
due to a bug in the partial emulation.

I would be fine with security supporting any issue that would 
DoS/compromise Xen.

Cheers,

-- 
Julien Grall


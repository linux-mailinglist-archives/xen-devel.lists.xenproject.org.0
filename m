Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACD8B45875
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 15:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112001.1460497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuWAE-0003f3-Hv; Fri, 05 Sep 2025 13:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112001.1460497; Fri, 05 Sep 2025 13:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuWAE-0003cr-F5; Fri, 05 Sep 2025 13:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1112001;
 Fri, 05 Sep 2025 13:07:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uuWAC-0003cl-Ud
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 13:07:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuWAC-007x8c-1L;
 Fri, 05 Sep 2025 13:07:36 +0000
Received: from [2a02:8012:3a1:0:9f:253:13d3:5d9d]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uuWAC-00H1sz-1J;
 Fri, 05 Sep 2025 13:07:36 +0000
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
	bh=bhWQ5boihjzjB/CqJBYJUAjfcczXgA/RlON/+Ky0ejM=; b=OymO6Qh3wRlulaERdnGxFit25n
	nKC7yA96lgAuw0XEfSYQVOK0AxfOUV3S2ET9RL+3inSe4qwR8MwP/dVZtImaNbk945IWhB5PKWNMk
	ulo6erlXoE7kI5gLfXSgPpfzTSPQ4HCRLKuKmEY0BjNbdpP63LtHJnFbJ3l/ffuTh23I=;
Message-ID: <1b27dc46-4d5c-4c6d-8976-0f9b98d11d6b@xen.org>
Date: Fri, 5 Sep 2025 14:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/arm64: allow to make aarch32 support optional
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250806094929.293658-1-grygorii_strashko@epam.com>
 <20250806094929.293658-4-grygorii_strashko@epam.com>
 <87ms7l39gl.fsf@epam.com> <540abaa2-9946-40b8-bf49-b54e4f7a1393@epam.com>
 <87o6rpqent.fsf@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <87o6rpqent.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2025 13:15, Volodymyr Babchuk wrote:
> Hi,
> 
> Grygorii Strashko <grygorii_strashko@epam.com> writes:
> 
>> On 27.08.25 03:16, Volodymyr Babchuk wrote:
>>> Hi Grygorii,
>>> Grygorii Strashko <grygorii_strashko@epam.com> writes:
>>>
>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>
>>>> Now Arm64 AArch32 guest support is always enabled and built-in while not
>>>> all Arm64 platforms supports AArch32 (for exmaple on Armv9A) or this
>>>> support might not be needed (Arm64 AArch32 is used quite rarely in embedded
>>>> systems). More over, when focusing on safety certification, AArch32 related
>>>> code in Xen leaves a gap in terms of coverage that cannot really be
>>>> justified in words. This leaves two options: either support it (lots of
>>>> additional testing, requirements and documents would be needed) or compile
>>>> it out.
>>>>
>>>> Hence, this patch introduces basic support to allow make Arm64
>>>> AArch32 guest support optional. The following changes are introduced:
>>>>
>>>> - Introduce Kconfig option CONFIG_ARM64_AARCH32 to allow enable/disable
>>>>     Arm64 AArch32 guest support (default y)
>>>>
>>>> - Introduce is_aarch32_enabled() helper which accounts Arm64 HW capability
>>>>     and CONFIG_ARM64_AARCH32 setting
>>>>
>>>> - Introduce arm64_set_domain_type() to configure Arm64 domain type in
>>>>     unified way instead of open coding (d)->arch.type, and account
>>>>     CONFIG_ARM64_AARCH32 configuration.
>>>>
>>>> - toolstack: do not advertise "xen-3.0-armv7l " capability if AArch32 is
>>>>     disabled.
>>>>
>>>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>>>     AArch32 is disabled.
>>>>
>>>> - Set Arm64 domain type to DOMAIN_64BIT by default.
>>>>     - the Arm Xen boot code is handling this case properly already;
>>>>     - for toolstack case the XEN_DOMCTL_set_address_size hypercall handling
>>>>       updated to forcibly configure domain type regardless of current domain
>>>>       type configuration, so toolstack behavior is unchanged.
>>>>
>>>> With CONFIG_ARM64_AARCH32=n the Xen will reject AArch32 guests (kernels) if
>>>> configured by user in the following way:
>>>> - Xen boot will fail with panic during dom0 or dom0less domains creation
>>>> - toolstack domain creation will be rejected due to xc_dom_compat_check()
>>>>     failure.
>>>>
>>>> Making Arm64 AArch32 guest support open further possibilities for build
>>>> optimizations of Arm64 AArch32 guest support code.
>>>>
>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>> ---
>>>> changes in v2:
>>>> - use Arm64 "cpu_has_el1_32" in all places to check if HW has AArch32 support
>>>> - rework Arm64 XEN_DOMCTL_set_address_size hypercall handling to work with any
>>>>     initial domain type set (32bit or 64 bit)
>>>> - fix comments related to macro parameters evaluation issues
>>>> - do not expose EL1 AArch32 support to guest in ID_AA64PFR0_EL1 reg if
>>>>     AArch32 is disabled
>>>>
>>>>    xen/arch/arm/Kconfig                    |  7 ++++
>>>>    xen/arch/arm/arm64/domain-build.c       | 46 +++++++++++++++++++++++--
>>>>    xen/arch/arm/arm64/domctl.c             | 16 +++++----
>>>>    xen/arch/arm/arm64/vsysreg.c            |  9 +++++
>>>>    xen/arch/arm/domain.c                   |  9 +++++
>>>>    xen/arch/arm/domain_build.c             | 21 +++--------
>>>>    xen/arch/arm/include/asm/arm32/domain.h | 12 +++++++
>>>>    xen/arch/arm/include/asm/arm64/domain.h | 23 +++++++++++++
>>>>    xen/arch/arm/setup.c                    |  2 +-
>>>>    9 files changed, 119 insertions(+), 26 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index a0c816047427..bf6dd73caf73 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -266,6 +266,13 @@ config PCI_PASSTHROUGH
>>>>    	help
>>>>    	  This option enables PCI device passthrough
>>>>    +config ARM64_AARCH32
>>>> +	bool "AArch32 Guests support on on ARM64 (UNSUPPORTED)" if UNSUPPORTED
>>> But aarch32 guests are supported... I understand that you wanted to
>>> say
>>> "Disabling aarch32 support is unsupported". But currently this entry
>>> reads backwards. I think it should be reworded better. But I have no
>>> idea - how to do this.
>>
>> I think "(UNSUPPORTED)" can be just dropped. Is it ok?
> 
> As I understand, If you want this feature to be eventually certified, it
> should not be UNSUPPORTED nor EXPERIMENTAL.

The certification is somewhat irrelevant to the decision of the state of 
the feature. Instead, the decision should be based on the criteria based 
in SUPPORT.MD (see "Status"). If it is experimental/unsupported, then 
what's missing to make it supported?

In addition to that, there is the "EXPERT" mode. This was introduced 
mainly to allow the user to tailor the Kconfig but also limit to what we 
security support. This is to reduce the amount of workload on the 
security team when it comes to decide on whether we need to issue an XSA 
(the more possibility, the more difficult it becomes).

There has been discussion on providing a small set of config (one could 
be for certification purpose) that would be security supported. But I 
don't think we come to a conclusion yet.

Cheers,

-- 
Julien Grall



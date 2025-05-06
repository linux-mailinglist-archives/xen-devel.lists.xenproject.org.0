Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBEBAAC401
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 14:29:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977143.1364205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHQa-0004Q6-9g; Tue, 06 May 2025 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977143.1364205; Tue, 06 May 2025 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCHQa-0004Nr-77; Tue, 06 May 2025 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 977143;
 Tue, 06 May 2025 12:29:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCHQY-0004Nl-Ie
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 12:29:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCHQY-00Cg5L-0w;
 Tue, 06 May 2025 12:29:38 +0000
Received: from [2a02:8012:3a1:0:7157:32ca:2aea:33a3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCHQY-000QuW-0O;
 Tue, 06 May 2025 12:29:38 +0000
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
	bh=Cy5/8twqUfPNbpHxqJlEDdXb+Jj9THtCRDc+J3ZAY9I=; b=0TDOY8WRwEw+Ch/9G990EjK2Y8
	IKaWr4L/c8HR14L5IFI6vv0JYQ/iapO6myVnnZeTRwYq9faZHQ3SUUsHECz6HdEFUkO0OBVC2HJYg
	qdo6NJuGuIOUrdQ3TAQWtxEUHv0NcGa7SqMzrp0Exue7/BPYeHGVWTlmkpPl1mAuorYw=;
Message-ID: <df5d09ae-ba1f-43c5-8d96-fd363597e799@xen.org>
Date: Tue, 6 May 2025 13:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
 <a96a2e51-7b00-45a3-9f75-0a062c8defd8@xen.org>
 <FB60F408-6ECE-4396-BAE4-E9D70F9E9DA6@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <FB60F408-6ECE-4396-BAE4-E9D70F9E9DA6@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 13:24, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

> 
>> On 6 May 2025, at 12:44, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 29/04/2025 16:20, Luca Fancellu wrote:
>>> Document the requirement needed to boot Xen on Armv8-R platforms.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> v4 changes:
>>>   - New patch
>>> ---
>>>   docs/misc/arm/booting.txt | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
>>> index 21ae74837dcc..719af74f1e69 100644
>>> --- a/docs/misc/arm/booting.txt
>>> +++ b/docs/misc/arm/booting.txt
>>> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>>>     * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>>>   +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
>>> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, hence the
>>> +above requirements need to be adjusted to this case:
>>> +> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on Arm32.
>>
>> I think it would be better to update the line "Xen must be entered in NS EL2 mode" to clarify the state for 64-bit Arm.
>>
>>> +> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
>>> +  SCTLR_EL2.C set to 0).
>>
>> This line is valid for Armv8-A/Armv7-A when using the Image/zImage protocol.
>>
>>>     [1] linux/Documentation/arm/booting.rst
>>>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
> 
> Just to be sure to be on the same page, are you suggesting these changes on the original file?

Yes with one tweak.

 > > diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..c00c651805d7 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -58,10 +58,14 @@ Firmware/bootloader requirements
>   
>   Xen relies on some settings the firmware has to configure in EL3 before starting Xen.

I think you want to update this sentence to remove the reference to EL3. 
Even on A-profile EL3 is not mandatory (I vaguely remember one of the 
platform I worked on had no EL3).

>   
> -* Xen must be entered in NS EL2 mode
> +* Xen must be entered in:
> +  * Non-Secure EL2 mode for Armv8-A Arm64 and Arm32, Armv8-R Arm32.
> +  * Secure EL2 mode for Armv8-R Arm64.
>   
>   * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.

And then here: "When EL3 is supported, ...". This would also cover the 
R-profile change.

Cheers,

>   
> +* Xen must be entered with MMU/MPU off and data cache disabled (SCTLR_EL2.M bit
> +  and SCTLR_EL2.C set to 0).
>   
>   [1] linux/Documentation/arm/booting.rst
>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
> 
> Cheers,
> Luca
> 

-- 
Julien Grall



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F42F49DEA2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 11:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261398.452559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD1a8-0005kd-NL; Thu, 27 Jan 2022 10:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261398.452559; Thu, 27 Jan 2022 10:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD1a8-0005hj-JV; Thu, 27 Jan 2022 10:00:44 +0000
Received: by outflank-mailman (input) for mailman id 261398;
 Thu, 27 Jan 2022 10:00:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nD1a7-0005hd-Hk
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 10:00:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD1a5-0004kI-CD; Thu, 27 Jan 2022 10:00:41 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.9.172]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nD1a5-0004Ap-6F; Thu, 27 Jan 2022 10:00:41 +0000
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
	bh=GjKL+XlbwmNv7WW0YvQWji58Nm3XCZTccRwATp/DkRk=; b=NBCYBgCRScs/eACmmBIP515KQx
	m+Hz2yR0I+MLU/Lr3AhrScpUFR8TUwO+CpdixPd0cuvC7Dh5/Ma9zNCe3Gs8KYGT6059CHQRmfpKI
	7mcf9zhrqs8DqerqSj5k+S7TummS//iRl+P6lmp0qB7SIkVelWvOVITU4RguD6QfMoRk=;
Message-ID: <8e59b4ef-a009-b380-f262-a8381abbea16@xen.org>
Date: Thu, 27 Jan 2022 10:00:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
To: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <d80da027-93ac-4819-ef7a-f3fd8592e443@suse.com>
 <PAXPR08MB7420AC9A05A6118642F544BD9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <PAXPR08MB7420252BFA15D032BDDF2F4A9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <e135adab-8b21-8dc0-2518-e505a59feb9f@suse.com>
 <PAXPR08MB7420EF1360C2E1D63D278A1B9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <b274899d-55f5-1851-82e6-69898d53e726@suse.com>
 <PAXPR08MB74205D98C454993DCFAE4FFC9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <677bb034-242d-e9ce-00ce-57e7214fd4cc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <677bb034-242d-e9ce-00ce-57e7214fd4cc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/01/2022 09:27, Jan Beulich wrote:
> On 27.01.2022 10:25, Wei Chen wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年1月27日 17:17
>>>
>>> On 27.01.2022 10:09, Wei Chen wrote:
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 2022年1月27日 17:00
>>>>>
>>>>> But you realize we already have such a stub file on x86?
>>>>>
>>>>
>>>> Yes, we found the redefinition errors that are caused by x86 stub file
>>>> and new macros in stub.h. We had tries to add:
>>>> ifeq ($(XEN_BUILD_EFI),y)
>>>> CFLAGS-y += -DXEN_BUILD_EFI
>>>> XEN_CFLAGS += -DXEN_BUILD_EFI
>>>> endif
>>>> x86/Makefile to gate these new macros, but it seems that we may need
>>>> to change EFI build logic for x86. It will cause more risks for me.
>>>> So I want to introduce a similar stub.c in arch/arm.
>>>
>>> While that's perhaps fine, ideally common bits would be common. Iirc
>>> already back at the time I was wondering why stub.c had to be x86-
>>> only.
>>
>> Some dummy functions in stub.c can be shared by arm or other architectures.
>> But some functions like efi_multiboot2 are architecture dependent.
> 
> Right - that's no different from the bulk of the non-stubbed EFI code.
> I don't really mind you making an Arm-specific stub file if there's
> not very much duplication, but it doesn't feel very good. In the end
> it's up to the Arm maintainers anyway.

If the stubs are mostly the same then they should be common rather than 
duplicated.

 > x86/Makefile to gate these new macros, but it seems that we may need
 > to change EFI build logic for x86. It will cause more risks for me.

But that would be a build risk right? If so, it is quite easy to 
verify/catch it compare to runtime issue.

Cheers,

> 
> Jan
> 

-- 
Julien Grall


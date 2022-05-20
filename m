Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAA852E948
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 11:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333609.557459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzDe-00086U-EY; Fri, 20 May 2022 09:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333609.557459; Fri, 20 May 2022 09:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzDe-00083L-BF; Fri, 20 May 2022 09:46:50 +0000
Received: by outflank-mailman (input) for mailman id 333609;
 Fri, 20 May 2022 09:46:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nrzDc-00083F-SP
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 09:46:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrzDX-00034X-De; Fri, 20 May 2022 09:46:43 +0000
Received: from [54.239.6.186] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrzDX-0008Dw-6x; Fri, 20 May 2022 09:46:43 +0000
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
	bh=XUm/SSk7GCzQrh//822CuekK5vAFysWo5BpOTzl6WCE=; b=bqufTKx78N5SCijUDAi4Dpdu6t
	gauysOkiDNrwGbSF30DLguDlfdfSY0E4o0Ir5rL6eCOrAbW2MwbPKrI0r+Rg/a/h2Z5l8PoQ89B9D
	S2sG4aVCR8clWDpaKtHZXf5XUjP1v845/EbuCd509pX7e90FW3TNPjfp0T740gZeOUBI=;
Message-ID: <997030b6-2f7b-a180-d72a-2e3eaa15b93e@xen.org>
Date: Fri, 20 May 2022 10:46:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
To: Wei Chen <Wei.Chen@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220511014639.197825-1-wei.chen@arm.com>
 <20220511014639.197825-3-wei.chen@arm.com>
 <9b04ca55-f617-dc14-cbf0-a3e427ad5869@suse.com>
 <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420C70C703B1C006A3403EE9ED09@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Wei,

On 19/05/2022 03:36, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2022年5月18日 21:05
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien
>> Grall <julien@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei
>> Liu <wl@xen.org>; Jiamei Xie <Jiamei.Xie@arm.com>; xen-
>> devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 2/9] xen: reuse x86 EFI stub functions for Arm
>>
>> On 11.05.2022 03:46, Wei Chen wrote:
>>> x86 is using compiler feature testing to decide EFI build
>>> enable or not. When EFI build is disabled, x86 will use an
>>> efi/stub.c file to replace efi/runtime.c for build objects.
>>> Following this idea, we introduce a stub file for Arm, but
>>> use CONFIG_ARM_EFI to decide EFI build enable or not.
>>>
>>> And the most functions in x86 EFI stub.c can be reused for
>>> other architectures, like Arm. So we move them to common
>>> and keep the x86 specific function in x86/efi/stub.c.
>>>
>>> To avoid the symbol link conflict error when linking common
>>> stub files to x86/efi. We add a regular file check in efi
>>> stub files' link script. Depends on this check we can bypass
>>> the link behaviors for existed stub files in x86/efi.
>>>
>>> As there is no Arm specific EFI stub function for Arm in
>>> current stage, Arm still can use the existed symbol link
>>> method for EFI stub files.
>>
>> Wouldn't it be better to mandate that every arch has its stub.c,
>> and in the Arm one all you'd do (for now) is #include the common
>> one? (But see also below.)
>>
> 
> Personally, I don't like to include a C file into another C file.

Same here. I know we already use it in EFI but I am not in favor to add 
more of them.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CF742C335
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208575.364765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafH1-0001xa-HE; Wed, 13 Oct 2021 14:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208575.364765; Wed, 13 Oct 2021 14:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafH1-0001v7-Dq; Wed, 13 Oct 2021 14:30:27 +0000
Received: by outflank-mailman (input) for mailman id 208575;
 Wed, 13 Oct 2021 14:30:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mafGz-0001uY-PT
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:30:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mafGz-0006nJ-ID; Wed, 13 Oct 2021 14:30:25 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.17.188]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mafGz-0006iK-CS; Wed, 13 Oct 2021 14:30:25 +0000
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
	bh=88LjASR2hZDtKWukyTX0ylkB0cMo0H54f498CUDaKhE=; b=3UpnZ4Wrmy3A7zayKAOP0t6LAP
	FHCm4TzVgbuL8sZEnXHthZaJseeV39jQWuJebj43jSRnadS0jjbrTAUozayNeQqMzu1ZrNDLwhyIs
	59qJ5sEbXz/TElaP/GxSJEN5GBpvicJRnDiD3biXltYRmGq3UVBHSRrG4rhTSEut61iQ=;
Message-ID: <ea6fa013-809b-f946-76d8-5314b45d6f17@xen.org>
Date: Wed, 13 Oct 2021 15:30:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] arm/docs: Clarify legacy DT bindings on UEFI
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211013121929.30784-1-luca.fancellu@arm.com>
 <a31231e3-a1eb-0e1f-59b8-75677d5db51b@xen.org>
 <363EAF93-1165-4515-A582-B40B6115FA71@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <363EAF93-1165-4515-A582-B40B6115FA71@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

On 13/10/2021 15:06, Luca Fancellu wrote:
> 
> 
>> On 13 Oct 2021, at 14:27, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 13/10/2021 13:19, Luca Fancellu wrote:
>>> Legacy compatible strings for dom0 modules are not
>>> supported when booting using UEFI, the documentation
>>> doesn't mention that.
>>
>> Can you add a summary in the commit message why we consider the legacy binding is not supported?
> 
> Yes what about:
> 
> Since the introduction of UEFI boot for Xen, the legacy
> compatible strings were not supported and the stub code
> was checking only the presence of “multiboot,module” to
> require the Xen UEFI configuration file or not.
> The documentation was not updated to specify that behavior.
> 
> Add a phrase to docs/misc/arm/device-tree/booting.txt
> to clarify it.

Sounds good to me. You can add my ack on it:

Acked-by: Julien Grall <jgrall@amazon.com>

Would you be able to respin the patch with the two changes?

> 
>>
>>> Add a phrase to docs/misc/arm/device-tree/booting.txt
>>> to clarify it.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   docs/misc/arm/device-tree/booting.txt | 2 ++
>>>   1 file changed, 2 insertions(+)
>>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
>>> index c6a775f4e8..017c0f13eb 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -51,6 +51,8 @@ Each node contains the following properties:
>>>   	Xen 4.4 supported a different set of legacy compatible strings
>>>   	which remain supported such that systems supporting both 4.4
>>>   	and later can use a single DTB.
>>> +	However when booting Xen using UEFI and Device Tree, the legacy
>>
>> NIT: I would drop "and Device Tree" because this feels a bit redundant as this compatible can only be used in the Device-Tree.
> 
> I will drop it
> 
>>
>>> +	compatible strings are not supported.
>>>     	- "xen,multiboot-module" equivalent to "multiboot,module"
>>>   	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
> 

Cheers,

-- 
Julien Grall


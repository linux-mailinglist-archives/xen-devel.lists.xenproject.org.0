Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E58CD260
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 14:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728452.1133382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA7ia-0001T9-76; Thu, 23 May 2024 12:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728452.1133382; Thu, 23 May 2024 12:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA7ia-0001R4-4U; Thu, 23 May 2024 12:38:48 +0000
Received: by outflank-mailman (input) for mailman id 728452;
 Thu, 23 May 2024 12:38:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sA7iY-0001Qy-M6
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 12:38:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sA7iX-0005Zy-1e; Thu, 23 May 2024 12:38:45 +0000
Received: from [15.248.2.28] (helo=[10.24.67.32])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sA7iW-0004Kz-NO; Thu, 23 May 2024 12:38:44 +0000
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
	bh=dDnu+CLFVajFDCtc2+ScvRfwxDR3nWuOYJVtpUlniaY=; b=rr5y2vc7SdG8S15afeyAubUciK
	/6TpbzzubZhqc7QgZx3IHH2rwUczqdU/q5Labur7806hO0pmxiS5b0tlfg8sUBAacNuxeuiIr2+w/
	NxZ6lzPK+qd1oSU7jwEQxDtj34SLB7pETEzv57NMGDuOUFVe4N0sfUa32Nqs/TZJ5wDs=;
Message-ID: <94484f5f-fdcd-4c6a-ad34-5dbe7cc4eda0@xen.org>
Date: Thu, 23 May 2024 13:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.19] Re: [XEN PATCH v3] arm/mem_access: add conditional
 build of mem_access.c
Content-Language: en-GB
To: "Oleksii K." <oleksii.kurochko@gmail.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <b3f03c4f5a78b86b01750f10bb0cebcdb2fd35cc.1715265720.git.alessandro.zucchelli@bugseng.com>
 <CABfawh=7jZmtseCm9yaZUcKkK7i+yYiudVDvTFeF6bax_1+BjA@mail.gmail.com>
 <fb426cc8-fda9-4e21-983d-37649499e0e4@xen.org>
 <a9fdb75d26839c31a8b0ceda9c940b2e13a89bab.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9fdb75d26839c31a8b0ceda9c940b2e13a89bab.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 23/05/2024 09:04, Oleksii K. wrote:
> On Wed, 2024-05-22 at 21:50 +0100, Julien Grall wrote:
>> Hi,
>>
>> Adding Oleksii as the release manager.
>>
>> On 22/05/2024 19:27, Tamas K Lengyel wrote:
>>> On Fri, May 10, 2024 at 8:32 AM Alessandro Zucchelli
>>> <alessandro.zucchelli@bugseng.com> wrote:
>>>>
>>>> In order to comply to MISRA C:2012 Rule 8.4 for ARM the following
>>>> changes are done:
>>>> revert preprocessor conditional changes to xen/mem_access.h which
>>>> had it build unconditionally, add conditional build for
>>>> xen/mem_access.c
>>>> as well and provide stubs in asm/mem_access.h for the users of
>>>> this
>>>> header.
>>>>
>>>> Signed-off-by: Alessandro Zucchelli
>>>> <alessandro.zucchelli@bugseng.com>
>>>
>>> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
>>
>> Oleksii, would you be happy if this patch is committed for 4.19?
> Sure:
>   Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks. It is now committed.

> 
>>
>> BTW, do you want to be release-ack every bug until the hard code
>> freeze?
>> Or would you be fine to levea the decision to the maintainers?
> I would prefer to leave the decision to the maintainers.

Ok. I will keep it in mind for the bug fixes until the hard code.

Cheers,

-- 
Julien Grall


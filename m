Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C628443DFB1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 13:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217873.378086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3CL-0006Xq-Nr; Thu, 28 Oct 2021 11:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217873.378086; Thu, 28 Oct 2021 11:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg3CL-0006Ua-Kr; Thu, 28 Oct 2021 11:03:53 +0000
Received: by outflank-mailman (input) for mailman id 217873;
 Thu, 28 Oct 2021 11:03:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mg3CK-0006UQ-66
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 11:03:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg3CI-0005ht-0O; Thu, 28 Oct 2021 11:03:50 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.236.13])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mg3CH-0001Lh-Qq; Thu, 28 Oct 2021 11:03:49 +0000
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
	bh=R910lvvlJXVIuwagQjRDlCiMvr2RrUoISl2d6FGyCVs=; b=g8abL9ULP0DjYb09EEsUUfX0tt
	FG4hR8FBDgOeEyupjIbT1JfRJ+DgS9JbH4VyoxLWbZVl36BnXAzasgX84VXXS7dL3O/N59zgu7ACA
	xwprrvkK/EL0u36ojSUx1Kx3PsvcvoD5b2o1WEx3gVjd733hrdafqdqEodiG3aa5dsG0=;
Message-ID: <3c6efc32-3e3f-6a26-952c-6347501b8a78@xen.org>
Date: Thu, 28 Oct 2021 12:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>
References: <20211027083730.1406947-1-andr2000@gmail.com>
 <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
 <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
 <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
 <1bb4f2d7-958f-4408-c04e-88d9b580d2a2@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1bb4f2d7-958f-4408-c04e-88d9b580d2a2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/10/2021 12:01, Oleksandr Andrushchenko wrote:
> Hi, Julien!
> 
> [snip]
> On 28.10.21 13:48, Julien Grall wrote:
>> Hi Stefano,
>>
>> Looking at linux/arch/arm64/boot/dts/, there are a few Device-Tree that contain the property "linux,pci-domain". All of them seems to also add it for disabled hostbridges.
>>
>> However, I am under the impression that it is more common to have a Devide-Tree without any property "linux,pci-domain". When PCI support is enabled, Xen will generate the domain ID for the hostbridge and write it to the DT.
>>
>> This doesn't work for disabled hostbridge and I think this is Oleksandr's problem. @Oleksandr can you confirm it?
> Yes, what I have is a disabled node without "linux,pci-domain"

Just to confirm, is it the same for enabled hostbridges?

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C03415A57
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 10:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193519.344698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKSi-0003gt-4g; Thu, 23 Sep 2021 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193519.344698; Thu, 23 Sep 2021 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKSi-0003eL-1X; Thu, 23 Sep 2021 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 193519;
 Thu, 23 Sep 2021 08:52:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTKSf-0003eF-U5
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 08:52:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKSf-0003bu-Kg; Thu, 23 Sep 2021 08:52:09 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKSf-0007OT-Ah; Thu, 23 Sep 2021 08:52:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=54Q2iN3Hzh5H2P1QQyjMr5dul7cZXAydmOHMnp8mxEU=; b=r304z6fqwu+glGkW7MPd/C2ZtN
	2ZLRKWcv1Jyvrevma5Dor/BOKOt7A8/3rBDpC+OddvdV4McK1Szab/Vd2hnBUpb4eXyr3K5TJWTnG
	lB98NjEhLGsuzdr6xAqHguXU7zxHmw3JpbytFbndAsxXWk298l+aRyfj9kZ3yFiielmM=;
Subject: Re: [PATCH v2 13/17] xen:arm: Implement pci access functions
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 andre.przywara@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <f05b02c04803809bbe4ebd49ed4abb5a4656b010.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <33deb79b-54e3-c00e-653c-9c1191574b4a@xen.org>
Date: Thu, 23 Sep 2021 13:52:05 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109221913430.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 23/09/2021 07:23, Stefano Stabellini wrote:
>> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
>> index 4b32c7088a..5406daecda 100644
>> --- a/xen/include/asm-arm/pci.h
>> +++ b/xen/include/asm-arm/pci.h
>> @@ -18,6 +18,7 @@
>>   #ifdef CONFIG_HAS_PCI
>>   
>>   #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>> +#define PRI_pci "%04x:%02x:%02x.%u"
> 
> This is added in this patch but it is unused here

To add on this, this is technically not arch specific. So if this is 
necessary in a follow-up patch, then the definition should be moved to a 
generic header.

Cheers,

-- 
Julien Grall


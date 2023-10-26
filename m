Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46C67D89AA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 22:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623974.972318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw6su-0002ef-AC; Thu, 26 Oct 2023 20:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623974.972318; Thu, 26 Oct 2023 20:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw6su-0002d0-7a; Thu, 26 Oct 2023 20:23:16 +0000
Received: by outflank-mailman (input) for mailman id 623974;
 Thu, 26 Oct 2023 20:23:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qw6ss-0002cu-46
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 20:23:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qw6sr-0006IO-M1; Thu, 26 Oct 2023 20:23:13 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.13.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qw6sr-0005ZG-FA; Thu, 26 Oct 2023 20:23:13 +0000
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
	bh=dVLcNqipZFXnzYb5oAHAq2Ceh4RPO/QeD6fVaedSG4Y=; b=JmpHgQ/6hiJagcYO/dQsUb9hJ2
	gX3xR5+Q1dWKHaB4jpISckwTeBKdnCdfNM1RIh3dt/nQedKTt/RHFuRACtTINdBJknorvWglt617u
	oDsqO103TnUgkAXIhfa6nkCYN3YUah12IspcxPC4Lkbd/Iv4CQNNp/YePMwrCF+5w6ow=;
Message-ID: <7a8aac9a-5ba0-45be-8673-9f0a6d5e8a66@xen.org>
Date: Thu, 26 Oct 2023 21:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] arm/new vgic: Add ITS support to NEW_VGIC
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1698225630.git.mykyta_poturai@epam.com>
 <b0b41f2065002e4cf7795ebfbf9f84624c2f150d.1698225630.git.mykyta_poturai@epam.com>
 <163d3326-38f2-40b6-a654-60f0221daa6c@xen.org>
 <6c5cb10b-7b61-4690-92b1-9c75a371af4d@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c5cb10b-7b61-4690-92b1-9c75a371af4d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/10/2023 11:01, Mykyta Poturai wrote:
> Hi Julien,

Hi,

> On 25.10.23 13:22, Julien Grall wrote:
>> Looking at the change, you mainly add #ifdef in the code. The goal of
>> gic-v3-lpi.c was to be agnostic from the different vGIC. So please
>> abstract it.
> 
> 
> Would it be okay to add something like "typedef struct vgic_irq
> pending_irq" to deal with the type differences or is it better to
> completely move the code that mentions them into vgic files?

Looking at the code, you only seem to use vgic_irq in 
vgic_vcpu_inject_lpi(). Most of the code after your patch seems to 
diverge between the new vGIC and old vGIC.

So I think you want to duplicate vgic_vcpu_inject_lpi() for each vGIC.

Cheers,

-- 
Julien Grall


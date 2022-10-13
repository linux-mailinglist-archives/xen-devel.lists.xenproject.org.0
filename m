Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5A5FDA74
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422173.668013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy8G-0006WX-7c; Thu, 13 Oct 2022 13:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422173.668013; Thu, 13 Oct 2022 13:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiy8G-0006Tv-47; Thu, 13 Oct 2022 13:20:16 +0000
Received: by outflank-mailman (input) for mailman id 422173;
 Thu, 13 Oct 2022 13:20:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oiy8F-0006Tp-BV
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:20:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiy8E-0007xR-4u; Thu, 13 Oct 2022 13:20:14 +0000
Received: from [15.248.2.148] (helo=[10.24.69.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oiy8D-0008AZ-VP; Thu, 13 Oct 2022 13:20:14 +0000
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
	bh=nkPnIZvevJsTXW7wMoMvuCQk9ans1LbOAtfDtWjqam8=; b=GY4B8CGJn3Cv15/06fvodiPXN/
	75Jfs75+wHGSlR+mAqhnOvkbqEJsnhTpES9oAe34B4l1V3iTXT8B6NQ4XG+MaNPcnqMwbMkW7d+wd
	fNIvpZ6gWC0JwfgiTItNJlVq4KWaDZeihw5o4mbPmMH3siCjLFTwlMwRWGVC8lv6Psbw=;
Message-ID: <9b4a9bbf-eb5c-3d13-f796-c6bf5704d85b@xen.org>
Date: Thu, 13 Oct 2022 14:20:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: Need guidance to support reading GICR_TYPER (64 bit register) on
 Aarch32_v8r
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Jaxson Han <jaxson.han@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e2d041b2-3b38-f19b-2d8e-3a255b0ac07e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2022 12:47, Ayan Kumar Halder wrote:
> Hi Arm mantainers/Folks,

Hello,

> Please refer to the discussion 
> https://github.com/zephyrproject-rtos/zephyr/pull/51163 .
> 
> We intend to run Zephyr as a domU guest on Xen on Aarch32_v8R fixed 
> virtual platform.
> 
> Zephyr is trying to read GICR_TYPER which is a 64 bit register using 
> ldrd instruction.
> 
> As GICR is emulated by Xen, so this instruction gets trapped with HSR = 
> 0x9200000c.
> 
> As ISV is 0, so Xen cannot emulate this instruction.
> 
> The proposed solution is to use two sys_read32() on GICR_TYPER to return 
> the lower and upper 32 bits.
> 
> With this, HSR = 0x9383 000c, ISV=1 so ISS is valid.
> 
> Now, for Xen to emulate this read, I have proposed the modifications (in 
> my last comment).

I am confused. Looking at the emulation of GICR_TYPER in Xen 
(arch/arm/vgic-v3.c), the code should already be able to handle 32-bit 
access.

I doesn't look like we need to modify Xen. What did I miss?

Cheers,

-- 
Julien Grall


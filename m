Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A82D1EA4FF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 15:29:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfkV6-0007xz-VD; Mon, 01 Jun 2020 13:29:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFUs=7O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jfkV5-0007xq-7H
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 13:29:11 +0000
X-Inumbo-ID: e07b8f64-a40b-11ea-9dbe-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e07b8f64-a40b-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GLHrgBGOFloKOwkupYiTD8oGR2dt6jDGmP+jyKOu7VY=; b=n4Ozb6I2PA7HX5cZtUfLvdvfeP
 LDL7tQPpyZvwraa+OtdCaLig1wMkbrkEubL4HcbU4om8lTGprhPz+wDZW/GJJucm133sovO953ZnD
 t827myyAAjqKBeDw/BoTSHqgbiPCPAKs2RUAhPimKjNapHffHWgJySGvsb1876Ox46EM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jfkV4-0002Ah-Fe; Mon, 01 Jun 2020 13:29:10 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jfkV4-0003nL-93; Mon, 01 Jun 2020 13:29:10 +0000
Subject: Re: Keystone Issue
To: CodeWiz2280 <codewiz2280@gmail.com>, xen-devel@lists.xenproject.org
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
Date: Mon, 1 Jun 2020 14:29:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

I have a few questions in order to understand a bit more your problem.

On 01/06/2020 13:38, CodeWiz2280 wrote:
> Hello, I am using a Texas Instruments K2E Keystone Eval board with Linux 
> 4.19.59.  It has a 32-bit ARM Cortex A15 processor. There is keystone 
> specific code in the kernel in arch/arm/mm/pv-fixup-asm.s that executes 
> during early_paging_init for LPAE support.  This causes the kernel to 
> switch its running 32-bit address space to a 36-bit address space and 
> the hypervisor traps repeatedly and stops it from booting.

Without any log it is going to be difficult to help. Could you post the 
hypervisor log when debug is enabled?

>  I suspect 
> this is because Xen only allowed for the original 32-bit memory range 
> specified by the dom0 device tree.

How much RAM did you give to your Dom0?

> The 36-bit LPAE address is a fixed 
> offset from the 32-bit address and is not physically different memory.

I am not sure to understand this. Are you suggesting that the kernel is 
trying to relocate itself in a different part of the physical memory?

Can you provide more details on the fixed offset?

>  
> Can you suggest any way to get through this problem? I am using the 
> master branch of xen from earlier this year.  

Can you provide the exact baseline your are using? Did make any changes 
on top?

> Any help is greatly 
> appreciated.
Best regards,

-- 
Julien Grall


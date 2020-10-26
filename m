Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9227298DF3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 14:31:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12314.32086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2bD-0005Tp-IF; Mon, 26 Oct 2020 13:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12314.32086; Mon, 26 Oct 2020 13:31:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2bD-0005TQ-Eo; Mon, 26 Oct 2020 13:31:47 +0000
Received: by outflank-mailman (input) for mailman id 12314;
 Mon, 26 Oct 2020 13:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kX2bC-0005TL-3r
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:31:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24977410-667a-45d5-a7f5-07c358d0e611;
 Mon, 26 Oct 2020 13:31:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kX2bB-0004PW-1m; Mon, 26 Oct 2020 13:31:45 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kX2bA-0005DO-Qs; Mon, 26 Oct 2020 13:31:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Eey=EB=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kX2bC-0005TL-3r
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:31:46 +0000
X-Inumbo-ID: 24977410-667a-45d5-a7f5-07c358d0e611
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 24977410-667a-45d5-a7f5-07c358d0e611;
	Mon, 26 Oct 2020 13:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=COH07By8MlJXLmXlds6S5U1Em2gVSNaKhuITL1stUJc=; b=M08Fs8OscJP1U4byw5mjknMsbz
	or7OcQxCp59keMhStF4aMGrG+aE9nNQcwuYRvErF8P+Ua4M3IlMDEcy/jPKr0aIKb3qqlxE3JMzEq
	7ZHAt/zgZu37aMVw5olD4n9KTbRIzpcYlpf0GRcpXZyzqsKJQcSLy3Buh2IR1dVeYa6Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kX2bB-0004PW-1m; Mon, 26 Oct 2020 13:31:45 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kX2bA-0005DO-Qs; Mon, 26 Oct 2020 13:31:44 +0000
Subject: Re: Xen on RP4
To: Elliott Mitchell <ehem+xen@m5p.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: roman@zededa.com, xen-devel@lists.xenproject.org
References: <20201012215751.GB89158@mattapan.m5p.com>
 <c38d78bd-c011-404b-5f59-d10cd7d7f006@xen.org>
 <20201016003024.GA13290@mattapan.m5p.com>
 <23885c28-dee5-4e9a-dc43-6ccf19a94df6@xen.org>
 <20201022021655.GA74011@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221620230.12247@sstabellini-ThinkPad-T480s>
 <20201023005629.GA83870@mattapan.m5p.com>
 <alpine.DEB.2.21.2010221801490.12247@sstabellini-ThinkPad-T480s>
 <20201023211941.GA90171@mattapan.m5p.com>
 <alpine.DEB.2.21.2010231647290.12247@sstabellini-ThinkPad-T480s>
 <20201024053540.GA97417@mattapan.m5p.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4fcf4832-9266-443f-54d0-fa1fff4b6e14@xen.org>
Date: Mon, 26 Oct 2020 13:31:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201024053540.GA97417@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Elliott,

On 24/10/2020 06:35, Elliott Mitchell wrote:
> On Fri, Oct 23, 2020 at 04:59:30PM -0700, Stefano Stabellini wrote:
>> Note that I tried to repro the issue here at my end but it works for me
>> with device tree. So the swiotlb_init memory allocation failure probably
>> only shows on ACPI, maybe because ACPI is reserving too much low memory.
> 
> Found it.  Take a look at 437b0aa06a014ce174e24c0d3530b3e9ab19b18b
> 
>   PLATFORM_START(rpi4, "Raspberry Pi 4")
>       .compatible     = rpi4_dt_compat,
>       .blacklist_dev  = rpi4_blacklist_dev,
> +    .dma_bitsize    = 30,
>   PLATFORM_END
> 
> Where this is used to match against a *device-tree*.

Right. When we introduced ACPI in Xen, we made the assumption there 
would be no need for per-platform workaround.

> ACPI has a distinct
> means of specifying a limited DMA-width; the above fails, because it
> assumes a *device-tree*.

Do you know if it would be possible to infer from the ACPI static table 
the DMA-width?

If not, is there a way to uniquely identify the platform?


Cheers,

-- 
Julien Grall


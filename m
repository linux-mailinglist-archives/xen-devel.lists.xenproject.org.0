Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E92FF411
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 20:16:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72370.130251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2fRH-0007pm-Kz; Thu, 21 Jan 2021 19:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72370.130251; Thu, 21 Jan 2021 19:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2fRH-0007pN-HK; Thu, 21 Jan 2021 19:16:15 +0000
Received: by outflank-mailman (input) for mailman id 72370;
 Thu, 21 Jan 2021 19:16:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2fRG-0007pI-4C
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 19:16:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2fRE-0007EX-Br; Thu, 21 Jan 2021 19:16:12 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2fRE-0000m7-4Y; Thu, 21 Jan 2021 19:16:12 +0000
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
	MIME-Version:Date:Message-ID:From:References:To:Subject;
	bh=FK3yFg+2gUkwP+bHqC4CdP0t+FGxVqaviB64aQH6HpA=; b=eUEavnjo1hQWRQ4QN/6tef3TD4
	wmMBa2YL7FKqUoXvoAwoebpZ6wwvI+I64qiVkfy6Tg6g9BLqRkBJyTKdT7+pF5edRn+1As6HsdV9p
	KZ32nG5QxcYiwfzBm3AVMNyoAf2xvXUsci95zCjJsfGkmZIFg7utbsFgE9noCde3NCaI=;
Subject: Re: Null scheduler and vwfi native problem
To: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
From: Julien Grall <julien@xen.org>
Message-ID: <5d562573-afd1-b445-d80e-506912519b8a@xen.org>
Date: Thu, 21 Jan 2021 19:16:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 21/01/2021 10:54, Anders Törnqvist wrote:
> Hi,

Hi Anders,

Thank you for reporting the bug. I am adding Stefano and Dario as IIRC 
they were going to work on a solution.

Cheers,

> I see a problem with destroy and restart of a domain. Interrupts are not 
> available when trying to restart a domain.
> 
> The situation seems very similar to the thread "null scheduler bug" 
> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213.html.
> 
> The target system is a iMX8-based ARM board and Xen is a 4.13.0 version 
> built from https://source.codeaurora.org/external/imx/imx-xen.git.
> 
> Xen is booted with sched=null vwfi=native.
> One physical CPU core is pinned to the domu.
> Some interrupts are passed through to the domu.
> 
> When destroying the domain with xl destroy etc it does not complain but 
> then when trying to restart the domain
> again with a "xl create <domain cfg>" I get:
> (XEN) IRQ 210 is already used by domain 1
> 
> "xl list" does not contain the domain.
> 
> Repeating the "xl create" command 5-10 times eventually starts the 
> domain without complaining about the IRQ.
> 
> Inspired from the discussion in the thread above I have put printks in 
> the xen/common/domain.c file.
> In the function domain_destroy I have a printk("End of domain_destroy 
> function\n") in the end.
> In the function complete_domain_destroy have a printk("Begin of 
> complete_domain_destroy function\n") in the beginning.
> 
> With these printouts I get at "xl destroy":
> (XEN) End of domain_destroy function
> 
> So it seems like the function complete_domain_destroy is not called.
> 
> "xl create" results in:
> (XEN) IRQ 210 is already used by domain 1
> (XEN) End of domain_destroy function
> 
> Then repeated "xl create" looks the same until after a few tries I also 
> get:
> (XEN) Begin of complete_domain_destroy function
> 
> After that the next "xl create" creates the domain.
> 
> 
> I have also applied the patch from 
> https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg02469.html. 
> This does seem to change the results.
> 
> Starting the system without "sched=null vwfi=native" does not result in 
> the problem.
> 
> BR
> Anders
> 
> 
> 

-- 
Julien Grall


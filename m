Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0A9486217
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 10:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253867.435150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5P2s-0005xb-AF; Thu, 06 Jan 2022 09:26:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253867.435150; Thu, 06 Jan 2022 09:26:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5P2s-0005w0-6p; Thu, 06 Jan 2022 09:26:54 +0000
Received: by outflank-mailman (input) for mailman id 253867;
 Thu, 06 Jan 2022 09:26:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n5P2r-0005uG-2p
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 09:26:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n5P2n-0000XC-Ia; Thu, 06 Jan 2022 09:26:49 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n5P2n-0001Rx-C9; Thu, 06 Jan 2022 09:26:49 +0000
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
	bh=a8V8G+xtDAk/ftzefOk9aZexLlYBaMc9j4NMx5KPU3o=; b=01rWuOI4ANXlxRw5BjBKe5Ci4E
	GQYR9LzieW97ETf2s6CKikg9M6J02m+LhDgLGhYv7H9ZLRjXOfIsu0MBiALcUeBAZl5uaAM4CXlK/
	BaiWiVMvSUwpTN2+FM7m0u+RUB1y1KfcmKPWWJDeD1rzFNlzE07wyVrNfkFNI+izke0M=;
Message-ID: <20fbb361-b416-6965-614d-a6283a7e7550@xen.org>
Date: Thu, 6 Jan 2022 09:26:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: sched=null vwfi=native and call_rcu()
To: Stefano Stabellini <sstabellini@kernel.org>, dfaggioli@suse.com,
 george.dunlap@citrix.com
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, jgross@suse.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2201051615060.2060010@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/01/2022 00:40, Stefano Stabellini wrote:
> Hi all,

Hi,

> As you might remember, we have an outstanding issue with call_rcu() when
> sched=null vwfi=native are used. That is because in that configuration
> the CPU never goes idle so rcu_idle_enter() never gets called.
> 
> The issue was caught on the field and I managed to repro the problem
> doing the following:
> 
> xl destroy test
> xl create ./test.cfg
> 
> Resulting in the following error:
> 
> # Parsing config from ./test.cfg
> # (XEN) IRQ 54 is already used by domain 1
> 
> The test domain has 3 interrupts remapped to it and they don't get
> released before the new domain creation is requested.
> 
> Just FYI, the below hacky patch seems to reliably work-around the
> problem in my environment.
> 
> Do you have any suggestions on what would be the right way to solve
> this issue?

This issue and solution were discussed numerous time on the ML. In 
short, we want to tell the RCU that CPU running in guest context are 
always quiesced. For more details, you can read the previous thread 
(which also contains a link to the one before):

https://lore.kernel.org/xen-devel/fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se/

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CEB55FA50
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 10:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357618.586277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Syv-0001kW-Oy; Wed, 29 Jun 2022 08:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357618.586277; Wed, 29 Jun 2022 08:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6Syv-0001iZ-Lk; Wed, 29 Jun 2022 08:23:29 +0000
Received: by outflank-mailman (input) for mailman id 357618;
 Wed, 29 Jun 2022 08:23:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6Syu-0001iT-K0
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 08:23:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6Syt-0004iJ-Bq; Wed, 29 Jun 2022 08:23:27 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6Syt-0006DX-5K; Wed, 29 Jun 2022 08:23:27 +0000
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
	bh=mzau7RHWT9YKHDzGYL/HJDzSwOr7eE/vuFBO/z2bUXc=; b=pU5+SKA1SywQNXMi74on9GffjM
	QW/r8/VVg2fga6nva+xLQ43f/Pn9SYIFhXTKNwFJAmlS+fXybJrhRXG3zX2pymjlFNVvlj/O9hDx7
	iWMqa4RKBgPgtav2Uhl0BY4zuuIs0KceRvDw064UoUJTF/yZIiHPi1dJpftbI2p4kgKg=;
Message-ID: <26a1b208-7192-a64f-ca6d-c144de89ed2c@xen.org>
Date: Wed, 29 Jun 2022 09:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: dmitry.semenets@gmail.com, xen-devel@lists.xenproject.org,
 Dmytro Semenets <dmytro_semenets@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com>
 <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop>
 <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org>
 <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
 <5c986703-c932-3c7d-3756-2b885bb96e42@xen.org>
 <alpine.DEB.2.22.394.2206281538320.4389@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206281538320.4389@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/06/2022 23:56, Stefano Stabellini wrote:
>> The advantage of the panic() is it will remind us that some needs to be fixed.
>> With a warning (or WARN()) people will tend to ignore it.
> 
> I know that this specific code path (cpu off) is probably not super
> relevant for what I am about to say, but as we move closer to safety
> certifiability we need to get away from using "panic" and BUG_ON as a
> reminder that more work is needed to have a fully correct implementation
> of something.

I don't think we have many places at runtime using BUG_ON()/panic(). 
They are often used because we think Xen would not be able to recover if 
the condition is hit.

I am happy to remove them, but this should not be at the expense to 
introduce other potential weird bugs.

> 
> I also see your point and agree that ASSERT is not acceptable for
> external input but from my point of view panic is the same (slightly
> worse because it doesn't go away in production builds).

I think it depends on your target. Would you be happy if Xen continue to 
run with potentially a fatal flaw?

> 
> Julien if you are going to ack the patch feel free to go ahead.

I will do and commit it.

Cheers,

-- 
Julien Grall


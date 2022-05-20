Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6F152E97A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 11:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333646.557503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzN2-0002vS-B9; Fri, 20 May 2022 09:56:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333646.557503; Fri, 20 May 2022 09:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzN2-0002sa-8M; Fri, 20 May 2022 09:56:32 +0000
Received: by outflank-mailman (input) for mailman id 333646;
 Fri, 20 May 2022 09:56:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nrzN0-0002sM-V3
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 09:56:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrzN0-0003GQ-Ax; Fri, 20 May 2022 09:56:30 +0000
Received: from [54.239.6.186] (helo=[192.168.4.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nrzN0-0000dD-4Y; Fri, 20 May 2022 09:56:30 +0000
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
	bh=PRzw3ZRTxQMZAlyfVcQtky5xDGWzbmeaJT/z9RJpTG0=; b=ltbjWweqQUPFOijBcTdzJdnT9i
	g/S8sKIxmAEwE9EU1zwBie2+nYVBPsj/x0j21SnpHwX/zYsghEUsXKaNGvwkjTrg9BXFHXbTtfPcr
	3MmQu5yu8vNeecW5c5YSAu91xQ2WZ2rd4FUprkdi5V+BjJ10lEwStdnYRc3/ajAORJWs=;
Message-ID: <69ec386c-6d2b-635a-0d8a-b72afe09f579@xen.org>
Date: Fri, 20 May 2022 10:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3] xen/build: Add cppcheck and cppcheck-html make rules
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@arm.com>
References: <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8a8ffce11591efb284c93214b77534fa4e4134b2.1650976647.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

Since this patch has been committed, I get the following message for on 
every build (make -C xen):

which: no cppcheck in ([...])
/bin/sh: cppcheck: command not found

I wasn't expecting the build system to check every time. I think...

On 26/04/2022 13:38, Bertrand Marquis wrote:
> +cppcheck-version:
> +ifeq ($(shell which $(CPPCHECK)),)

... this is because ifeq is similar to pre-preprocessing. So it always 
get executed.

So far, the message is harmlesss (I can continue to build) but I think 
the check should really only happen when the target cppcheck-version is 
executed. So can you have a look to rework the rule?

Cheers,

-- 
Julien Grall


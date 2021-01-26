Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97079303B33
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74871.134623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MFu-0002dC-BE; Tue, 26 Jan 2021 11:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74871.134623; Tue, 26 Jan 2021 11:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MFu-0002cn-7n; Tue, 26 Jan 2021 11:11:30 +0000
Received: by outflank-mailman (input) for mailman id 74871;
 Tue, 26 Jan 2021 11:11:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4MFt-0002ci-0i
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:11:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 52b44a4e-868b-4329-9d57-cb59c6bdac97;
 Tue, 26 Jan 2021 11:11:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6ED9FABDA;
 Tue, 26 Jan 2021 11:11:27 +0000 (UTC)
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
X-Inumbo-ID: 52b44a4e-868b-4329-9d57-cb59c6bdac97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611659487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DwC9qgt7l0uXCLgPkHS6E64mkeJTEtw1Gki3uws8VPM=;
	b=aiol0t5uIag90+I92kHQLCQekj3CPFaQEuIjdr4eUddXCUDk0dCep1HjIQuiYbuXB6O15g
	xUxyWDdwkstrJ/4HUdSSnECvzZlhnR6U0iPGzHRPEO8HIkXTwSlEnPKiA4ZC57cqNVEChU
	2gJ7KGfQvL5ZvwBJPE0Y9b5AQ4gsDww=
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "iwj@xenproject.org" <iwj@xenproject.org>, "julien@xen.org"
 <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
 <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com>
 <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
Date: Tue, 26 Jan 2021 12:11:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 12:06, Bertrand Marquis wrote:
>> On 26 Jan 2021, at 09:22, Jan Beulich <jbeulich@suse.com> wrote:
>> On 25.01.2021 22:27, Stefano Stabellini wrote:
>>> @@ -77,7 +77,7 @@ config SBSA_VUART_CONSOLE
>>> 	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>>
>>> config ARM_SSBD
>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>> +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
>>> 	depends on HAS_ALTERNATIVE
>>> 	default y
>>> 	help
>>> @@ -87,7 +87,7 @@ config ARM_SSBD
>>> 	  If unsure, say Y.
>>>
>>> config HARDEN_BRANCH_PREDICTOR
>>> -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
>>> +	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
>>> 	default y
>>> 	help
>>> 	  Speculation attacks against some high-performance processors rely on
>>
>> Both of these default to y and have their _prompt_
>> conditional upon EXPERT. Which means only an expert can turn them
>> _off_. Which doesn't make it look like these are unsupported? Or
>> if anything, turning them off is unsupported?
> 
> ...You could see that as EXPERT/UNSUPPORTED options can only be
>  “modified” from their default value if EXPERT/UNSUPPORTED is activated.

But this is nothing you can recognize when configuring Xen
(i.e. seeing just these prompts).

> If this is a problem we could also change those options to be default
> to _off_ by renaming them to config DISABLE_xxxx

Yes, this would be a possibility, albeit not necessarily
one I would like.

Jan


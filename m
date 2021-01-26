Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3E4303F4E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 14:51:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75089.135115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OkO-00045a-EM; Tue, 26 Jan 2021 13:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75089.135115; Tue, 26 Jan 2021 13:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4OkO-00045B-Ar; Tue, 26 Jan 2021 13:51:08 +0000
Received: by outflank-mailman (input) for mailman id 75089;
 Tue, 26 Jan 2021 13:51:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l4OkM-000453-Ux
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 13:51:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4OkK-0007Cd-6q; Tue, 26 Jan 2021 13:51:04 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l4OkJ-0001pV-Ti; Tue, 26 Jan 2021 13:51:04 +0000
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
	bh=1tc9hFA197322mpvaJnWk9qc2mRqp+pPobOFiWuFLH8=; b=B26tgF1foXTVjOu12duHTy66OQ
	9xh4Dd3NHpUsok4LFbDoML+1Ksolxqf+7T4/Ova72QNGyYdD0hePkTScuUpovk757l7LkRqC9lw8C
	xaFh1/D8tN34GJ4o5b1N6BmBs1fZ4rUMCECkeCa3XDmO/huIWR1lmjmBzdxUTCPOI0h4=;
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 jbeulich@suse.com, wl@xen.org
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <616b0552-33fc-360e-664c-44178e5afc6a@xen.org>
Date: Tue, 26 Jan 2021 13:51:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210125212747.26676-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/01/2021 21:27, Stefano Stabellini wrote:
>   config ARM_SSBD
> -	bool "Speculative Store Bypass Disable" if EXPERT
> +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
>   	depends on HAS_ALTERNATIVE
>   	default y
>   	help
> @@ -87,7 +87,7 @@ config ARM_SSBD
>   	  If unsure, say Y.
>   
>   config HARDEN_BRANCH_PREDICTOR
> -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
> +	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
>   	default y
>   	help
>   	  Speculation attacks against some high-performance processors rely on

I read through the back and forth between Bertrand and Jan about 
"UNSUPPORTED". However, I still don't understand why those two options 
are moved to UNSUPPORTED.

Both options will only build the code to enable the mitigation. The 
decision is still based on the processor you are running on.

In addition to that, ARM_SSBD can also be forced enabled/disabled on the 
command line.

A user may want to compile out the code if the target processor is not 
the affected by the two issues. This wouldn't be much different to Xen 
deciding to not enabling the mitigation.

I would view the two options as supported but not security supported. So 
this seems to fit exactly in the definition of EXPERT rather than 
UNSUPPORTED.

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B32611C0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 15:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFdHZ-0004hx-92; Tue, 08 Sep 2020 13:03:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLT7=CR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kFdHX-0004hs-IV
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 13:03:31 +0000
X-Inumbo-ID: 38eb9191-7192-46d3-a68f-62c69cae0df0
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38eb9191-7192-46d3-a68f-62c69cae0df0;
 Tue, 08 Sep 2020 13:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=a3eKbnDaEuwbPiPGDPvUlGgofUEDWNqspnKlbC6NmM0=; b=1o2xviEscx2Xg5kLXwOXQSsW8H
 lxYMHJuaTG7Qy5VWB6SoG9QgcZxgv+D91ZXsRFCMVcuvus2DVFdsPrqKlK6247H8rAdprcN8/Otyy
 EVG9fPUljHKiPiT2T4B1v1T4TcVfYurOpGLllLTkC8AbpTRvxW4w13hc72EG3yY5Q2fI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFdHW-00048E-Eg; Tue, 08 Sep 2020 13:03:30 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kFdHW-0000d7-6O; Tue, 08 Sep 2020 13:03:30 +0000
Subject: Re: [PATCH] Arm64: fix build with gcc 10
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
References: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1edce029-34ef-4a49-fff3-c60e91bfaa64@xen.org>
Date: Tue, 8 Sep 2020 14:03:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4c3c3f21-29bf-268c-039e-5adecff05f3a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Jan,

I would suggest: "xen/arm64: Force GCC to always inline generic atomics 
helpers".

On 08/09/2020 13:53, Jan Beulich wrote:
> With gcc10 inlining is (no longer?) the default for certain atomics.

How about the following:

"Recent versions of GCC (at least GCC10) will not inline generic atomics 
helpers. Instead it will expect the software to either link with 
libatomic.so or implement the helpers.

To keep the previous behavior, force GCC to always inline the generic 
atomics helpers.

Long term we probably want to avoid relying on GCC atomics helpers as 
this doesn't allow us to switch between LSE and LL/SC atomic.
"

> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -12,6 +12,7 @@ CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-
>   
>   CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
>   CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
> +$(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
>   
>   ifneq ($(filter command line environment,$(origin CONFIG_EARLY_PRINTK)),)
>       $(error You must use 'make menuconfig' to enable/disable early printk now)
> 

-- 
Julien Grall


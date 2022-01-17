Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA3490A23
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 15:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258186.444363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Snj-0001TC-HZ; Mon, 17 Jan 2022 14:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258186.444363; Mon, 17 Jan 2022 14:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Snj-0001RM-E6; Mon, 17 Jan 2022 14:16:03 +0000
Received: by outflank-mailman (input) for mailman id 258186;
 Mon, 17 Jan 2022 14:16:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n9Sni-0001RG-EV
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 14:16:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n9Sng-0005Ec-5b; Mon, 17 Jan 2022 14:16:00 +0000
Received: from [202.153.81.7] (helo=[192.168.175.62])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n9Snf-00044k-In; Mon, 17 Jan 2022 14:16:00 +0000
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
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=3uNZUHo9f86iIDSTgNlg44jVZ3jVx/Z5w5iXWJKkRj4=; b=o4fa7nmGwFFdGTrkFBf1ben6Sz
	ao9VJVydHntdUezHETp6p34y45r9luH7R+y2+7dew37P6q/ikdK0NrGX5BgIZL1J0ECvslUrXaGgG
	FcxnNW/ahdBzgSL5qVfxbgARuFh/G9GR/LSF/2g3fTIf+Bxda48oc3z7CqjMni8hs724=;
Message-ID: <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org>
Date: Mon, 17 Jan 2022 18:15:53 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Dongjiu Geng <gengdongjiu1@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/01/2022 10:40, Dongjiu Geng wrote:
> It turns out that QEMU has been supporting GICv2 virtualization since
> v3.1.0. So remove the dependencies on GICv3.


Technically, the current form of CONFIG_QEMU allows the same binary to 
boot on QEMU with GICv2 or GICv3.

> If we want to use GICv3,
> we can select the QEMU_LEGACY configuration.

AFAIK, GICv3 is not a legacy feature... So it feels a bit odd to name it 
like that (see more below).

> 
> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> ---
>   xen/arch/arm/platforms/Kconfig | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index c93a6b2756..41e82a42ee 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -13,7 +13,15 @@ config ALL_PLAT
>   	automatically select any of the related drivers.
>   
>   config QEMU
> -	bool "QEMU aarch virt machine support"
> +	bool "QEMU aarch virt machine support >= v3.1.0"

This is a bit misleading. A user may select this thinking that this will 
select GICv3. However, this will not.

This also raises the question of what is the default GIC version in QEMU 
(i.e. if you don't pass anything on the command line)? If this is GICv3, 
then I am afraid that this patch would be a no-go for me.

Looking at overall discussion, you seem to push the patch only to allow 
building a tiny Xen for QEMU and the new vGIC.

The default Xen (i.e. make defconfig) will also work on QEMU. Given that 
the new vGIC is a still in development, I am seriously considering to 
say that if you want to try it then you have to use the default 
configuration.

@Dongjiu, is there any reason why you want to use the tiny QEMU config 
rather than the default configuration?

@Bertrand, @Stefano, what do you think?

Cheers,

-- 
Julien Grall


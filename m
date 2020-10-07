Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA09285C66
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 12:06:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3401.9777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ6Ku-0001Ol-Mw; Wed, 07 Oct 2020 10:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3401.9777; Wed, 07 Oct 2020 10:06:16 +0000
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
	id 1kQ6Ku-0001OM-Iv; Wed, 07 Oct 2020 10:06:16 +0000
Received: by outflank-mailman (input) for mailman id 3401;
 Wed, 07 Oct 2020 10:06:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FceR=DO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kQ6Kt-0001OH-5l
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:06:15 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89650c40-9ad3-4d02-920d-624753781edc;
 Wed, 07 Oct 2020 10:06:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQ6Kr-0000aG-92; Wed, 07 Oct 2020 10:06:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kQ6Kq-0001aF-Ud; Wed, 07 Oct 2020 10:06:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=FceR=DO=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kQ6Kt-0001OH-5l
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 10:06:15 +0000
X-Inumbo-ID: 89650c40-9ad3-4d02-920d-624753781edc
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 89650c40-9ad3-4d02-920d-624753781edc;
	Wed, 07 Oct 2020 10:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=QBcgr8CJNWcbv0HsNfEr0YLJ89jPfDPw8bQfvpTmvDw=; b=m+ncSQEnBoKVSmhknsISpgmTIU
	BW1WQ4z2Z5AHshw56qyDmY8CI6/k/qLfufj3ls+YAX4UDyNdMAebBPsgn8eQaXhT17v1zND4PGPZC
	FeP1Nj+HeaEqT8vqI/RJQ68YBz3NzM1yjH4qB1Q+y7a/SXSlIypN7qjvN+eLEDbve+Us=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQ6Kr-0000aG-92; Wed, 07 Oct 2020 10:06:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kQ6Kq-0001aF-Ud; Wed, 07 Oct 2020 10:06:13 +0000
Subject: Re: [PATCH v2] xen/rpi4: implement watchdog-based reset
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, roman@zededa.com
References: <20201002204717.14735-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <14712444-992f-c435-883a-388d37177beb@xen.org>
Date: Wed, 7 Oct 2020 11:06:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201002204717.14735-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/10/2020 21:47, Stefano Stabellini wrote:
> The preferred methord to reboot RPi4 is PSCI. If it is not available,

s/methord/method/

> +
> +#define PM_PASSWORD                 0x5a000000
> +#define PM_RSTC                     0x1c
> +#define PM_WDOG                     0x24
> +#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
> +#define PM_RSTC_WRCFG_CLR           0xffffffcf
> +
> +static void __iomem *rpi4_map_watchdog(void)
> +{
> +    void __iomem *base;
> +    struct dt_device_node *node;
> +    paddr_t start, len;
> +    int ret;
> +
> +    node = dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
> +    if ( !node )
> +        return NULL;
> +
> +    ret = dt_device_get_address(node, 0, &start, &len);
> +    if ( ret )
> +    {
> +        printk("Cannot read watchdog register address\n");
> +        return NULL;
> +    }
> +
> +    base = ioremap_nocache(start & PAGE_MASK, PAGE_SIZE);
> +    if ( !base )
> +    {
> +        dprintk(XENLOG_ERR, "Unable to map watchdog register!\n");

NIT: I would suggest to use printk() rather than dprintk. It would be 
useful for a normal user to know that we didn't manage to reset the 
platform and why.

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


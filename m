Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CF1C6D60
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 11:42:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWGYw-0008Ur-9N; Wed, 06 May 2020 09:41:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C64T=6U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWGYt-0008Uk-TA
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 09:41:55 +0000
X-Inumbo-ID: d2818546-8f7d-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2818546-8f7d-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RKQOmLoat1cFrMBPDuFyWmD8jgcx1D0Dku4nqxilMYQ=; b=yKcN10tuYBtr7991e5VV1n/fgq
 bdD7HB1BfVEzFR8YhJjwGEgoIHhnUoiz1JMhSUJUizqNaClMg9q28qT8bPhvFLMcHyNy+kybQ5uNS
 3QmyHPmJm7ToI5/NebfX/xIsviEccEWib9JTbUKj/YVMg69onmQ5WeoTxXHzz55Si6/g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWGYs-0000sH-6W; Wed, 06 May 2020 09:41:54 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWGYr-0000Bt-Vc; Wed, 06 May 2020 09:41:54 +0000
Subject: Re: [PATCH] Arm: fix build with CONFIG_DTB_FILE set
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f4c6b07e-c5de-ba75-c1ce-1475939f10af@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a0e21f63-f367-d32c-8d4c-baf4f9a5b21d@xen.org>
Date: Wed, 6 May 2020 10:41:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f4c6b07e-c5de-ba75-c1ce-1475939f10af@suse.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 06/05/2020 10:36, Jan Beulich wrote:
> Recent changes no longer allow modification of AFLAGS. The needed
> conversion was apparently missed in 2740d96efdd3 ("xen/build: have the
> root Makefile generates the CFLAGS").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> 
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>   
>   ifdef CONFIG_DTB_FILE
>   obj-y += dtb.o
> -AFLAGS += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
> +AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>   endif
>   
>   ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
> 

-- 
Julien Grall


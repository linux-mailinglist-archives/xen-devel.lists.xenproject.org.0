Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343FD1BFDF2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 16:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUA6g-0002Nh-CL; Thu, 30 Apr 2020 14:24:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ng0l=6O=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUA6e-0002Nc-DH
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 14:24:04 +0000
X-Inumbo-ID: 3e2565a4-8aee-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e2565a4-8aee-11ea-b9cf-bc764e2007e4;
 Thu, 30 Apr 2020 14:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KtVkbXu8J5JaGQD+k1yDh6PpeQLj0A24a9hSkroZ2KU=; b=Zak6+IyG11Qz92Hr5YIT3Sqldu
 79Bg6dN4L8SzIlAywr8lXvRWdGUZapaDv/vkFzSyvPY49yJESYSEVzWd7x4xnU0G1JIRIIm5YSrv2
 CssDX5S3P3Lfx8ndQfwjeVLCqY6zooBg1xoGYjEdYZWPCBxygmv4gQR5puZCqC4hNlAo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUA6d-0004nT-He; Thu, 30 Apr 2020 14:24:03 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUA6d-0008PW-9O; Thu, 30 Apr 2020 14:24:03 +0000
Subject: Re: [PATCH 0/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: xen-devel@lists.xenproject.org
References: <20200430124343.29886-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <18bed481-1d94-c1ec-b5d0-381bd50fd99a@xen.org>
Date: Thu, 30 Apr 2020 15:24:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430124343.29886-1-julien@xen.org>
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
Cc: Julien Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hmmm I have just realized I forgot to CC the REST.

I will resend it.

On 30/04/2020 13:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This small series is meant to make easier to experiment when using Xen.
> See patch #2 for more details.
> 
> Cheers,
> 
> Julien Grall (2):
>    xen/Kconfig: define EXPERT a bool rather than a string
>    xen: Allow EXPERT mode to be selected from the menuconfig directly
> 
>   xen/Kconfig                     | 11 +++++++++--
>   xen/Kconfig.debug               |  2 +-
>   xen/Makefile                    |  1 -
>   xen/arch/arm/Kconfig            | 10 +++++-----
>   xen/arch/x86/Kconfig            |  6 +++---
>   xen/common/Kconfig              | 14 +++++++-------
>   xen/common/sched/Kconfig        |  2 +-
>   xen/drivers/passthrough/Kconfig |  2 +-
>   8 files changed, 27 insertions(+), 21 deletions(-)
> 

-- 
Julien Grall


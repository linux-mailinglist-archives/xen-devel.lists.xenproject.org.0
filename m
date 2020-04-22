Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE41B3AA0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 10:58:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBC5-0002OB-R2; Wed, 22 Apr 2020 08:57:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l+vI=6G=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRBC5-0002O6-0x
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 08:57:21 +0000
X-Inumbo-ID: 4647d67c-8477-11ea-9e09-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4647d67c-8477-11ea-9e09-bc764e2007e4;
 Wed, 22 Apr 2020 08:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GT+ThNe2hh14lYny6gP0dey3DMvQfvU4coP96SK6oFo=; b=EK61mQF9+D/cFrMq1ZMKh0nPEj
 M3s2Y0RpFbY2AZXvQMFz+Xy30y4CV9ZGbmdkBuZOuX1y83Guswpn2X3xTNXB/1g0re+vv7z6tJ/o2
 w0s8R/Ppu04yoVKOjyK1kOiUb/f3oAsRY2IYQRcJx/FStryP/xahZ7Zruj2vEml/q1xs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRBC2-0000u8-Aj; Wed, 22 Apr 2020 08:57:18 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRBC1-0005nX-PV; Wed, 22 Apr 2020 08:57:17 +0000
Subject: Re: [PATCH v3 1/2] x86/HVM: expose VM assist hypercall
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cb2dd3ad-2f38-1576-7743-7525e77704b5@suse.com>
 <5ed6b8a1-1f05-c24b-b3a8-d170a315d92a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2c5a677e-0327-8924-7ac3-2ae7d673be94@xen.org>
Date: Wed, 22 Apr 2020 09:57:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5ed6b8a1-1f05-c24b-b3a8-d170a315d92a@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 21/04/2020 15:39, Jan Beulich wrote:
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -269,6 +269,8 @@ static inline void free_vcpu_guest_conte
>   
>   static inline void arch_vcpu_block(struct vcpu *v) {}
>   
> +#define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)

NIT: Do we want to evaluate d?

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


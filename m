Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E7232FD9
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 11:51:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k15Cu-0007Cj-El; Thu, 30 Jul 2020 09:50:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k15Cs-0007Ce-Bv
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 09:50:34 +0000
X-Inumbo-ID: 1c5ad276-d24a-11ea-aaae-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1c5ad276-d24a-11ea-aaae-12813bfff9fa;
 Thu, 30 Jul 2020 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QEDspvaZ4NzL18hLntGfWJiuWx4AGvTAqKsfCz/TN1s=; b=aqS+8cehW0pyZBVb0HnUYLsVVr
 KlRuTdOdWKezTWH/tpcR5kQh+UzHHSdxHYDdr4QCsXsg+owXwkdUYg2WIun2PIBqdAXWcZku9yKxO
 Zk0A9mC/8tkB4RQt0+RNVoNrFdXHpSqSTIVBsd92uH8soU4vzaP4DBN1ziWsG7zwI5e8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k15Co-0004wq-C7; Thu, 30 Jul 2020 09:50:30 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k15Co-0004hD-1F; Thu, 30 Jul 2020 09:50:30 +0000
Subject: Re: [PATCH 1/5] xen/memory: Introduce CONFIG_ARCH_ACQUIRE_RESOURCE
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-2-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9b8397fc-f50e-ef2b-cbaa-2298294af2e3@xen.org>
Date: Thu, 30 Jul 2020 10:50:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-2-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 28/07/2020 12:37, Andrew Cooper wrote:
> New architectures shouldn't be forced to implement no-op stubs for unused
> functionality.
> 
> Introduce CONFIG_ARCH_ACQUIRE_RESOURCE which can be opted in to, and provide
> compatibility logic in xen/mm.h
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With one question below:

Acked-by: Julien Grall <jgrall@amazon.com>


> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 1061765bcd..1b2c1f6b32 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -685,4 +685,13 @@ static inline void put_page_alloc_ref(struct page_info *page)
>       }
>   }
>   
> +#ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
> +static inline int arch_acquire_resource(
> +    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])

Any reason to change the way we indent the arguments?

> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif /* !CONFIG_ARCH_ACQUIRE_RESOURCE */
> +
>   #endif /* __XEN_MM_H__ */
> 

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EC9210F71
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 17:36:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqemP-0005uw-MK; Wed, 01 Jul 2020 15:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rv6a=AM=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jqemO-0005ur-IF
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 15:36:08 +0000
X-Inumbo-ID: 93c49bc2-bbb0-11ea-bb8b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c49bc2-bbb0-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 15:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fdKPh9+uJZZ56Z33Me4yP5f8EtRE35rWQhI3cWDExAw=; b=N/q88qtGYkqnw+K1FwugODuRFs
 1nB6Fw5zxbgpyLILgcBHj3hHcKRzxqODAz9gHzs32KifBGdlmKHJugl/Xfgv23iWB9jwQVsQBYMZm
 FiYX99NU5/IRPnFsb8xOdCpo4JDi1GKoX0TfQjAz7CMkwRnXD4Zbk90OV5qbAl+ulndA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqemF-0005Ay-G9; Wed, 01 Jul 2020 15:35:59 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jqemF-0000JG-6Q; Wed, 01 Jul 2020 15:35:59 +0000
Subject: Re: [PATCH v4 05/10] common/domain: allocate vmtrace_pt_buffer
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <0e02c97054da6e367f740ab8d2574e2d255553c8.1593519420.git.michal.leszczynski@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <3c710ce8-c561-fd73-3be8-a92456588db9@xen.org>
Date: Wed, 1 Jul 2020 16:35:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0e02c97054da6e367f740ab8d2574e2d255553c8.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 30/06/2020 13:33, Michał Leszczyński wrote:
> +static int vmtrace_alloc_buffers(struct vcpu *v)
> +{
> +    struct page_info *pg;
> +    uint64_t size = v->domain->vmtrace_pt_size;
> +
> +    if ( size < PAGE_SIZE || size > GB(4) || (size & (size - 1)) )
> +    {
> +        /*
> +         * We don't accept trace buffer size smaller than single page
> +         * and the upper bound is defined as 4GB in the specification.

This is common code, so what specification are you talking about?

I am guessing this is an Intel one, but I don't think Intel should 
dictate the common code implementation.

> +         * The buffer size must be also a power of 2.
> +         */
> +        return -EINVAL;
> +    }
> +
> +    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
> +                             MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    v->arch.vmtrace.pt_buf = pg;

v->arch.vmtrace.pt_buf is not defined on Arm. Please make sure common 
code build on all arch.

Cheers,

-- 
Julien Grall


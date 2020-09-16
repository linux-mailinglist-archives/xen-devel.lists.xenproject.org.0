Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75D926BED5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 10:09:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kISUx-0006tl-9F; Wed, 16 Sep 2020 08:09:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kISUv-0006tf-TB
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 08:09:01 +0000
X-Inumbo-ID: 2654e3cc-246e-46ed-a22f-cd31629b405c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2654e3cc-246e-46ed-a22f-cd31629b405c;
 Wed, 16 Sep 2020 08:09:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D67FAD0F;
 Wed, 16 Sep 2020 08:09:15 +0000 (UTC)
Subject: Re: [PATCH V1 10/16] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <28208039-3551-e0e5-3743-9eae78f8281c@suse.com>
Date: Wed, 16 Sep 2020 10:08:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-11-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -635,7 +635,8 @@ int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
>                            unsigned long end);
>  
>  /* Set foreign entry in the p2m table (for priv-mapping) */
> -int set_foreign_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
> +int set_foreign_p2m_entry(struct domain *d, struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn);

Once

https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg01092.html

has gone in, the new parameter wants to be const-qualified.

Jan


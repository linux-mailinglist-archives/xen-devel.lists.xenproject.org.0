Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4983C1BC3C9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:33:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSEo-0005Zn-H2; Tue, 28 Apr 2020 15:33:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTSEn-0005Zi-BM
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:33:33 +0000
X-Inumbo-ID: 9e0a19a4-8965-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e0a19a4-8965-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 15:33:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F258AB7F;
 Tue, 28 Apr 2020 15:33:31 +0000 (UTC)
Subject: Re: [PATCH 5/6] x86/pv: map and unmap page tables in
 mark_pv_pt_pages_rdonly
To: Hongyan Xia <hx242@xen.org>, Wei Liu <wl@xen.org>
References: <cover.1587116799.git.hongyxia@amazon.com>
 <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbb4a755-c450-77dd-2aa5-44c01b42a5ff@suse.com>
Date: Tue, 28 Apr 2020 17:33:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9287363e13924f4a633b47b53c23b3466e26e4a8.1587116799.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 11:52, Hongyan Xia wrote:
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -50,17 +50,17 @@ static __init void mark_pv_pt_pages_rdonly(struct domain *d,
>      unsigned long count;
>      struct page_info *page;
>      l4_pgentry_t *pl4e;
> -    l3_pgentry_t *pl3e;
> -    l2_pgentry_t *pl2e;
> -    l1_pgentry_t *pl1e;
> +    l3_pgentry_t *pl3e, *l3t;
> +    l2_pgentry_t *pl2e, *l2t;
> +    l1_pgentry_t *pl1e, *l1t;

I don't quite see why the new local variables get introduced:
unmap_domain_page(), iirc, is quite fine with a non-page-
aligned argument.

Jan


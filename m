Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F619AB92
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 14:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJcLL-0002Ky-Fh; Wed, 01 Apr 2020 12:19:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJcLK-0002Kt-17
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 12:19:38 +0000
X-Inumbo-ID: 0d88e66a-7413-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0d88e66a-7413-11ea-b58d-bc764e2007e4;
 Wed, 01 Apr 2020 12:19:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6A805AD75;
 Wed,  1 Apr 2020 12:19:36 +0000 (UTC)
Subject: Re: [PATCH 2/5] x86_64/mm: map and unmap page tables in m2p_mapped
To: Hongyan Xia <hx242@xen.org>
References: <cover.1584955616.git.hongyxia@amazon.com>
 <9b46a0bae03107fcb192e6590234b9e882965f11.1584955616.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a83f4eb5-e151-35a5-7e53-d6609c3fcb82@suse.com>
Date: Wed, 1 Apr 2020 14:19:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9b46a0bae03107fcb192e6590234b9e882965f11.1584955616.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.03.2020 10:41, Hongyan Xia wrote:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -131,27 +131,33 @@ static int m2p_mapped(unsigned long spfn)
>      unsigned long va;
>      l3_pgentry_t *l3_ro_mpt;
>      l2_pgentry_t *l2_ro_mpt;
> +    int rc = M2P_NO_MAPPED;
>  
>      va = RO_MPT_VIRT_START + spfn * sizeof(*machine_to_phys_mapping);
> -    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(va)]);
> +    l3_ro_mpt = map_l3t_from_l4e(idle_pg_table[l4_table_offset(va)]);

Along the lines of what I've said for patch 1 - read the l3e
here and unmap again right away. No need for converting
"return" to "goto" further down. Same for the l2e then.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033D1A9693
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 10:32:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOdT8-00084N-8M; Wed, 15 Apr 2020 08:32:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOdT6-00084H-VZ
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 08:32:25 +0000
X-Inumbo-ID: a1762686-7ef3-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1762686-7ef3-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 08:32:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97AB4AC12;
 Wed, 15 Apr 2020 08:32:22 +0000 (UTC)
Subject: Re: [PATCH v2 5/5] x86_64/mm: map and unmap page tables in
 destroy_m2p_mapping
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <1f6bde6f67ef214a3d4ffa81f0c55c4416c8edd4.1586352238.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <de4656ff-2fcc-2529-5ee9-2772f31e99e2@suse.com>
Date: Wed, 15 Apr 2020 10:32:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1f6bde6f67ef214a3d4ffa81f0c55c4416c8edd4.1586352238.git.hongyxia@amazon.com>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.04.2020 15:36, Hongyan Xia wrote:
> @@ -290,26 +291,30 @@ static void destroy_m2p_mapping(struct mem_hotadd_info *info)
>              continue;
>          }
>  
> -        l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]);
> -        if (!(l2e_get_flags(l2_ro_mpt[l2_table_offset(va)]) & _PAGE_PRESENT))
> +        l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]) +
> +                    l2_table_offset(va);

Either the name of the variable should be changed or you shouldn't
add in l2_table_offset(va) here. Personally I'd go with renaming
to just pl2e.

Jan


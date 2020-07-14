Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C694121F14C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 14:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvK6Z-0001ZO-Ag; Tue, 14 Jul 2020 12:32:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvK6Y-0001ZJ-3m
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 12:32:14 +0000
X-Inumbo-ID: 0b4a43aa-c5ce-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b4a43aa-c5ce-11ea-b7bb-bc764e2007e4;
 Tue, 14 Jul 2020 12:32:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 630AEAD3A;
 Tue, 14 Jul 2020 12:32:15 +0000 (UTC)
Subject: Re: [PATCH v7 08/15] x86_64/mm: switch to new APIs in setup_m2p_table
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <14aec5f25e8226a45dbc6b26fcc9981ea5f66a90.1590750232.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <625a5450-daca-0837-6977-4b0ae237d988@suse.com>
Date: Tue, 14 Jul 2020 14:32:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14aec5f25e8226a45dbc6b26fcc9981ea5f66a90.1590750232.git.hongyxia@amazon.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 13:11, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Avoid repetitive mapping of l2_ro_mpt by keeping it across loops, and
> only unmap and map it when crossing 1G boundaries.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I do think, however, that ...

> @@ -438,32 +443,29 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
>  
>              ASSERT(!(l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
>                    _PAGE_PSE));
> -            if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
> -              _PAGE_PRESENT )
> -                l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]) +
> -                  l2_table_offset(va);
> -            else
> +            if ( (l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
> +                  _PAGE_PRESENT) && !l2_ro_mpt)
> +                l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
> +            else if ( !l2_ro_mpt )
>              {

... this would be slightly neater as

            if ( l2_ro_mpt )
                /* nothing */;
            else if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
                      _PAGE_PRESENT )
                l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
            else
            {
                ...

My R-b holds if you would change it like this.

Jan


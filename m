Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B791A9542
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 09:55:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOcsl-0003QB-72; Wed, 15 Apr 2020 07:54:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoJL=57=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOcsj-0003Q6-50
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 07:54:49 +0000
X-Inumbo-ID: 60c39be6-7eee-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60c39be6-7eee-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 07:54:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93570ACB0;
 Wed, 15 Apr 2020 07:54:46 +0000 (UTC)
Subject: Re: [PATCH v2 2/5] x86_64/mm: map and unmap page tables in m2p_mapped
To: Hongyan Xia <hx242@xen.org>
References: <cover.1586352238.git.hongyxia@amazon.com>
 <e8a945defb5a4209d1f10b5f98b16a854a911c5c.1586352238.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9a9c9d8d-be9d-c6c2-fcb1-335464dde0fd@suse.com>
Date: Wed, 15 Apr 2020 09:54:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e8a945defb5a4209d1f10b5f98b16a854a911c5c.1586352238.git.hongyxia@amazon.com>
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
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -129,14 +129,14 @@ static mfn_t alloc_hotadd_mfn(struct mem_hotadd_info *info)
>  static int m2p_mapped(unsigned long spfn)
>  {
>      unsigned long va;
> -    l3_pgentry_t *l3_ro_mpt;
> -    l2_pgentry_t *l2_ro_mpt;
> +    l3_pgentry_t l3e_ro_mpt;
> +    l2_pgentry_t l2e_ro_mpt;

Preferably with the _ro_mpt tags here dropped
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


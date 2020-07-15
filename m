Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762A221371
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:20:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvl4u-0000vS-Lg; Wed, 15 Jul 2020 17:20:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvl4t-0000vN-GB
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:20:19 +0000
X-Inumbo-ID: 742a6f34-c6bf-11ea-942a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 742a6f34-c6bf-11ea-942a-12813bfff9fa;
 Wed, 15 Jul 2020 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594833618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NpUi5rCb1Mghqi/e7W+ruW3dFQi5FPlOR4vRl+xgeEs=;
 b=GPfRCp1k8n1oqs9eVded6T2TYNam70H8z8dXzknpFHAzByN8JHlUtjkO
 PGnzdVCtSjoAdkuGOhFWfUfYtvR6Hd/WhP8R1aKAEW07avLke+gM5OWX1
 Ip2UTrS2HZNUcmJx66CL0+LrFGHei4FlKjlpjnjIZGWeg/YFgtNoH3JAF E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: sY6ax7KGjdNZMhYTY+TEcliG6z5cXU3OU2uMlfkQ4N9eIV3GIjxsQdDNRcoMHBTwg+KaEAK0Yl
 J5XCWp52C/vmkY9Shl4+s5a8infloPYf75EXjdKGnISjhAHu83RAINZaUcnf2byaxZ/Px00A56
 ZBNBbvuxza6IU9IprGldY4RikdKNhYuniTwUR3N/F8R2olrqgx/x53uWXes/CGpydAMHAumTwG
 Pr+i4jJUhF6WwAJakrshm5cJBmVctfscKpungCpkyO9Qne1Uqbl2B6YZp0R2se/khph13/umDi
 +gs=
X-SBRS: 2.7
X-MesageID: 22654934
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22654934"
Date: Wed, 15 Jul 2020 19:20:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 08/11] x86/mm: add vmtrace_buf resource type
Message-ID: <20200715172011.GF7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <2129d21e7ef7e960951a8baafab01d9392dff8f3.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2129d21e7ef7e960951a8baafab01d9392dff8f3.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 tamas.lengyel@intel.com, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 07, 2020 at 09:39:47PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to map processor trace buffer using
> acquire_resource().
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/common/memory.c         | 31 +++++++++++++++++++++++++++++++
>  xen/include/public/memory.h |  1 +
>  2 files changed, 32 insertions(+)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index eb42f883df..c0a22eb60f 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1007,6 +1007,32 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>      return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>  }
>  
> +static int acquire_vmtrace_buf(struct domain *d, unsigned int id,
> +                               uint64_t frame,
> +                               uint64_t nr_frames,

frame and nr_frames should be unsigned int, as I think they can't
overflow an unsigned integer?

> +                               xen_pfn_t mfn_list[])
> +{
> +    mfn_t mfn;
> +    unsigned int i;
> +    uint64_t size;
> +    struct vcpu *v = domain_vcpu(d, id);
> +
> +    if ( !v || !v->vmtrace.pt_buf )
> +        return -EINVAL;
> +
> +    mfn = page_to_mfn(v->vmtrace.pt_buf);
> +    size = v->domain->processor_trace_buf_kb * KB(1);

I think this should be the number of pages, and then you want to
directly access d, there's no need to do v->domain->...

> +
> +    if ( (frame > (size >> PAGE_SHIFT)) ||
> +         (nr_frames > ((size >> PAGE_SHIFT) - frame)) )

Isn't this off by one (should use >=)? If size is 8 pages, you can get
pages [0,7], but requesting page 8 would be out of the range?

> +        return -EINVAL;
> +
> +    for ( i = 0; i < nr_frames; i++ )
> +        mfn_list[i] = mfn_x(mfn_add(mfn, frame + i));

You could drop the mfn variable and just do:

mfn_list[i] = mfn_x(page_to_mfn(v->vmtrace.pt_buf[frame + i]));

Thanks.


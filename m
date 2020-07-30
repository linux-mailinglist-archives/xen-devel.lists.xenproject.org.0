Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3992330A2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 12:57:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k16En-0004E8-F4; Thu, 30 Jul 2020 10:56:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k16Em-0004E3-CP
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 10:56:36 +0000
X-Inumbo-ID: 55e7c41e-d253-11ea-8d2f-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55e7c41e-d253-11ea-8d2f-bc764e2007e4;
 Thu, 30 Jul 2020 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6Ax80nf+EoQR3KIUG/ok9tKdr127h71Jeq4MlF2OY8g=; b=gbUGbRJsZlop4q1hUweM7gdU59
 9V1jcENTrb2+tmLS2NkVK+Gkzuk7GrEsnyXzpNmvPtMwEHrJ2hLNVqrDTiSW9TJXxR09Yay7skfYa
 /odVYVg88EeRhZ72SqJ3NxpWbjNc2SPbsODEdezoBahAD4nDLWJAa4NulkmfZwHuBsPM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k16Eg-0006OS-TM; Thu, 30 Jul 2020 10:56:30 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k16Eg-0000ek-J9; Thu, 30 Jul 2020 10:56:30 +0000
Subject: Re: [PATCH 2/5] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200728113712.22966-1-andrew.cooper3@citrix.com>
 <20200728113712.22966-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a3c57218-56b1-77fe-893f-b0269a6245e9@xen.org>
Date: Thu, 30 Jul 2020 11:56:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200728113712.22966-3-andrew.cooper3@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Andrew,

On 28/07/2020 12:37, Andrew Cooper wrote:
> The existing logic doesn't function in the general case for mapping a guests
> grant table, due to arbitrary 32 frame limit, and the default grant table
> limit being 64.
> 
> In order to start addressing this, rework the existing grant table logic by
> implementing a single gnttab_acquire_resource().  This is far more efficient
> than the previous acquire_grant_table() in memory.c because it doesn't take
> the grant table write lock, and attempt to grow the table, for every single
> frame.
> 
> The new gnttab_acquire_resource() function subsumes the previous two
> gnttab_get_{shared,status}_frame() helpers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> CC: Michał Leszczyński <michal.leszczynski@cert.pl>
> CC: Hubert Jasudowicz <hubert.jasudowicz@cert.pl>
> ---
>   xen/common/grant_table.c      | 93 ++++++++++++++++++++++++++++++-------------
>   xen/common/memory.c           | 42 +------------------
>   xen/include/xen/grant_table.h | 19 ++++-----
>   3 files changed, 75 insertions(+), 79 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index 9f0cae52c0..122d1e7596 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4013,6 +4013,72 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>       return 0;
>   }
>   
> +int gnttab_acquire_resource(
> +    struct domain *d, unsigned int id, unsigned long frame,
> +    unsigned int nr_frames, xen_pfn_t mfn_list[])

Any reasons for changing the way we usually indent parameters?

> +{
> +    struct grant_table *gt = d->grant_table;
> +    unsigned int i = nr_frames, tot_frames;
> +    void **vaddrs;
> +    int rc = 0;

AFAICT rc will always be initialized when used. So is it necessary?

> +
> +    /* Input sanity. */
> +    if ( !nr_frames )
> +        return -EINVAL;
> +
> +    /* Overflow checks */
> +    if ( frame + nr_frames < frame )
> +        return -EINVAL;
> +
> +    tot_frames = frame + nr_frames;
> +    if ( tot_frames != frame + nr_frames )
> +        return -EINVAL;
> +
> +    /* Grow table if necessary. */
> +    grant_write_lock(gt);
> +    switch ( id )
> +    {
> +        mfn_t tmp;
> +
> +    case XENMEM_resource_grant_table_id_shared:
> +        rc = gnttab_get_shared_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        if ( gt->gt_version != 2 )
> +        {
> +    default:
> +            rc = -EINVAL;
> +            break;
I am aware this is valid C code, but I find this construct confusing. 
Could you just duplicate the 2 lines and have a separate default case?

> +        }
> +        rc = gnttab_get_status_frame_mfn(d, tot_frames - 1, &tmp);
> +        break;
> +    }
> +
> +    /* Any errors from growing the table? */
> +    if ( rc )
> +        goto out;
> +
> +    switch ( id )
> +    {
> +    case XENMEM_resource_grant_table_id_shared:
> +        vaddrs = gt->shared_raw;
> +        break;
> +
> +    case XENMEM_resource_grant_table_id_status:
> +        vaddrs = (void **)gt->status;
> +        break;
> +    }
> +

NIT: Would it make sense to check vaddrs? This would avoid NULL 
dereference pointers if something went wrong.

> +    for ( i = 0; i < nr_frames; ++i )
> +        mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);
> +
> + out:
> +    grant_write_unlock(gt);
> +
> +    return rc;
> +}
> +

Cheers,

-- 
Julien Grall


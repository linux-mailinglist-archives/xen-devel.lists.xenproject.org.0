Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35538215584
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 12:29:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsOMM-00047q-8H; Mon, 06 Jul 2020 10:28:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7Mw=AR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jsOMK-00047i-G6
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 10:28:24 +0000
X-Inumbo-ID: 6b0d99a6-bf73-11ea-8c59-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b0d99a6-bf73-11ea-8c59-12813bfff9fa;
 Mon, 06 Jul 2020 10:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jMyAiZPQ8U87oK0loz0dL0plREpsBHkGWoX9gyZC6h0=; b=wjUD3yMbLOs6GPPJmD1fshQgzU
 RoIOYZHYgtRMh3Xz0MjjnQtoDU2a/UpJzygQMdQmLWGo/rFPYmN64akQUQgORC64l37NewvnxhN+E
 3mHp/FvOtPYcGp9t6ynrd3femDZz6CVc3xlasdhhEIFJb/L0nPb7pE+bk6ujXt68xITg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOMD-0003gm-6i; Mon, 06 Jul 2020 10:28:17 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jsOMC-00028f-Sk; Mon, 06 Jul 2020 10:28:17 +0000
Subject: Re: [PATCH v5 08/11] x86/mm: add vmtrace_buf resource type
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593974333.git.michal.leszczynski@cert.pl>
 <a306c4811973d80c83f1cb46cdbef1aa54ac6379.1593974333.git.michal.leszczynski@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <2adc4481-196e-646e-2ebf-3bcbdcbf8aa9@xen.org>
Date: Mon, 6 Jul 2020 11:28:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a306c4811973d80c83f1cb46cdbef1aa54ac6379.1593974333.git.michal.leszczynski@cert.pl>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, luwei.kang@intel.com,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 tamas.lengyel@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 05/07/2020 19:55, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to map processor trace buffer using
> acquire_resource().
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>   xen/common/memory.c         | 28 ++++++++++++++++++++++++++++
>   xen/include/public/memory.h |  1 +
>   2 files changed, 29 insertions(+)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index eb42f883df..04f4e152c0 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1007,6 +1007,29 @@ static long xatp_permission_check(struct domain *d, unsigned int space)
>       return xsm_add_to_physmap(XSM_TARGET, current->domain, d);
>   }
>   
> +static int acquire_vmtrace_buf(struct domain *d, unsigned int id,
> +                               unsigned long frame,

Shouldn't this be uint64_t to avoid truncation?

> +                               unsigned int nr_frames,
> +                               xen_pfn_t mfn_list[])
> +{
> +    mfn_t mfn;
> +    unsigned int i;
> +    struct vcpu *v = domain_vcpu(d, id);
> +
> +    if ( !v || !v->vmtrace.pt_buf )
> +        return -EINVAL;
> +
> +    mfn = page_to_mfn(v->vmtrace.pt_buf);
> +
> +    if ( frame + nr_frames > (v->domain->vmtrace_pt_size >> PAGE_SHIFT) )

frame + nr_frames could possibly overflow a 64-bit value and therefore 
still pass the check.

So I would suggest to use:

(frame > (v->domain_vm_ptrace_pt_size >> PAGE_SHIFT)) ||
(nr_frames > ((v->domain_vm_ptrace_pt_size >> PAGE_SHIFT) - frame))

Cheers,

-- 
Julien Grall


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FEB1AD8BA
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 10:38:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPMVK-000276-3L; Fri, 17 Apr 2020 08:37:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygtx=6B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPMVI-000271-2P
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 08:37:40 +0000
X-Inumbo-ID: b1285d62-8086-11ea-8c8a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1285d62-8086-11ea-8c8a-12813bfff9fa;
 Fri, 17 Apr 2020 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/8xz/0zKPNa/QJnDkWQwq8lAPPqH0LAPkGvdw/+MObg=; b=ZHr9u0A659KFm//qnVaUQgpDtK
 s+ogHCwbaIhcMj/Ws8DqNFz4wRBZ7Yk+w5v8RQHGdpyPJpio9EfnerMi1JnnDJjLFfKT8SbHZL1ab
 2SuiGHSab3NeGIJ6s6utCplY7altvF3jxrCdIjORKVGQCSUQmDZkW1alzfHpjNzh7paE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPMVD-0001Ev-D3; Fri, 17 Apr 2020 08:37:35 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPMVD-0006na-62; Fri, 17 Apr 2020 08:37:35 +0000
Subject: Re: [PATCH 3/6] x86/mem-paging: use guest handle for
 XENMEM_paging_op_prep
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
 <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d340e170-1c08-e20a-b170-c176eb00b4dd@xen.org>
Date: Fri, 17 Apr 2020 09:37:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f3c57792-d372-a70f-691b-87681b83e898@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 16/04/2020 16:46, Jan Beulich wrote:
> While it should have been this way from the beginning, not doing so will
> become an actual problem with PVH Dom0.

I think the current code is also buggy on PV dom0 because the buffer is 
not locked in memory. So you have no promise the buffer will be present 
when calling the hypercall.

> The interface change is binary
> compatible, but requires tools side producers to be re-built.
> 
> Drop the bogus/unnecessary page alignment restriction on the input
> buffer at the same time.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Is there really no way to avoid the buffer copying in libxc?
> 
> --- a/tools/libxc/xc_mem_paging.c
> +++ b/tools/libxc/xc_mem_paging.c
> @@ -26,15 +26,33 @@ static int xc_mem_paging_memop(xc_interf
>                                  unsigned int op, uint64_t gfn, void *buffer)

NIT: As you switch the handle to use const, would it make to also make 
the buffer const?

>   {
>       xen_mem_paging_op_t mpo;
> +    DECLARE_HYPERCALL_BOUNCE(buffer, XC_PAGE_SIZE,
> +                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
> +    int rc;
>   
>       memset(&mpo, 0, sizeof(mpo));
>   
>       mpo.op      = op;
>       mpo.domain  = domain_id;
>       mpo.gfn     = gfn;
> -    mpo.buffer  = (unsigned long) buffer;
>   
> -    return do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
> +    if ( buffer )
> +    {
> +        if ( xc_hypercall_bounce_pre(xch, buffer) )
> +        {
> +            PERROR("Could not bounce memory for XENMEM_paging_op %u", op);
> +            return -1;
> +        }
> +
> +        set_xen_guest_handle(mpo.buffer, buffer);
> +    }
> +
> +    rc = do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
> +
> +    if ( buffer )
> +        xc_hypercall_bounce_post(xch, buffer);
> +
> +    return rc;
>   }
>   
>   int xc_mem_paging_enable(xc_interface *xch, uint32_t domain_id,
> @@ -92,28 +110,13 @@ int xc_mem_paging_prep(xc_interface *xch
>   int xc_mem_paging_load(xc_interface *xch, uint32_t domain_id,
>                          uint64_t gfn, void *buffer)
>   {
> -    int rc, old_errno;
> -
>       errno = EINVAL;
>   
>       if ( !buffer )
>           return -1;
>   
> -    if ( ((unsigned long) buffer) & (XC_PAGE_SIZE - 1) )
> -        return -1;
> -
> -    if ( mlock(buffer, XC_PAGE_SIZE) )
> -        return -1;
> -
> -    rc = xc_mem_paging_memop(xch, domain_id,
> -                             XENMEM_paging_op_prep,
> -                             gfn, buffer);
> -
> -    old_errno = errno;
> -    munlock(buffer, XC_PAGE_SIZE);
> -    errno = old_errno;
> -
> -    return rc;
> +    return xc_mem_paging_memop(xch, domain_id, XENMEM_paging_op_prep,
> +                               gfn, buffer);
>   }
>   
>   
> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1779,7 +1779,8 @@ void p2m_mem_paging_populate(struct doma
>    * mfn if populate was called for  gfn which was nominated but not evicted. In
>    * this case only the p2mt needs to be forwarded.
>    */
> -int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l, uint64_t buffer)
> +int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
> +                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)

Shouldn't this technically be XEN_GUEST_HANDLE_64() to match the field?

Cheers,

-- 
Julien Grall


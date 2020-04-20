Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25061B1335
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 19:35:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQaJy-0007EH-7h; Mon, 20 Apr 2020 17:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQaJw-0007EC-UZ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 17:35:00 +0000
X-Inumbo-ID: 42467d8a-832d-11ea-9088-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42467d8a-832d-11ea-9088-12813bfff9fa;
 Mon, 20 Apr 2020 17:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tXAQEPqWo7QJj3gcv7v80gUq7a1pBTl1KlwSa5TIyQs=; b=uDkLISDFWu7jkzBiXD7GFK5nTT
 svW5+OUI7i12ida5e2lPNrArX0nUBVef12mwrhIqL75IbBMIytYsIThEiksSSmJBLTcauA8PXhImc
 tcCT2EQ945aNH30T5PPd0QlJj/k/dzQHIIspRZJE69qCkEBNpiW36M4ksdODu30d2DDo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQaJr-0002Ph-GY; Mon, 20 Apr 2020 17:34:55 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQaJr-0004JQ-4Z; Mon, 20 Apr 2020 17:34:55 +0000
Subject: Re: [PATCH v2 4/5] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-5-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <7f0821ed-34e8-2a63-aaab-bf781fdfb9e7@xen.org>
Date: Mon, 20 Apr 2020 18:34:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-5-paul@xen.org>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 07/04/2020 18:38, Paul Durrant wrote:
> ... and update xen-domctx to dump some information describing the record.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> 
> v2:
>   - Drop the header change to define a 'Xen' page size and instead use a
>     variable length struct now that the framework makes this is feasible
>   - Guard use of 'has_32bit_shinfo' in common code with CONFIG_COMPAT
> ---
>   tools/misc/xen-domctx.c   | 11 ++++++
>   xen/common/domain.c       | 81 +++++++++++++++++++++++++++++++++++++++
>   xen/include/public/save.h | 10 ++++-
>   3 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
> index d663522a8b..a8d3922321 100644
> --- a/tools/misc/xen-domctx.c
> +++ b/tools/misc/xen-domctx.c
> @@ -59,6 +59,16 @@ static void dump_header(struct domain_save_descriptor *desc)
>       off += desc->length;
>   }
>   
> +static void dump_shared_info(struct domain_save_descriptor *desc)
> +{
> +    DOMAIN_SAVE_TYPE(SHARED_INFO) s;
> +    READ(s);
> +    printf("    SHARED_INFO: field_width %u buffer size: %lu\n",
> +           s.field_width, desc->length - sizeof(s));
> +
> +    off += desc->length;
> +}
> +
>   static void dump_end(struct domain_save_descriptor *desc)
>   {
>       DOMAIN_SAVE_TYPE(END) e;
> @@ -125,6 +135,7 @@ int main(int argc, char **argv)
>           switch (desc.typecode)
>           {
>           case DOMAIN_SAVE_CODE(HEADER): dump_header(&desc); break;
> +        case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(&desc); break;
>           case DOMAIN_SAVE_CODE(END): dump_end(&desc); return 0;
>           default:
>               printf("Unknown type %u: skipping\n", desc.typecode);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 3dcd73f67c..8b72462e07 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -33,6 +33,7 @@
>   #include <xen/xenoprof.h>
>   #include <xen/irq.h>
>   #include <xen/argo.h>
> +#include <xen/save.h>
>   #include <asm/debugger.h>
>   #include <asm/p2m.h>
>   #include <asm/processor.h>
> @@ -1646,6 +1647,86 @@ int continue_hypercall_on_cpu(
>       return 0;
>   }
>   
> +static int save_shared_info(const struct vcpu *v, struct domain_context *c,
> +                            bool dry_run)
> +{
> +    struct domain *d = v->domain;
> +    struct domain_shared_info_context ctxt = {};
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    size_t size = hdr_size + PAGE_SIZE;
> +    int rc;
> +
> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, v, size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( !dry_run )

NIT: I think the if is not necessary here as you don't skip that much code.

> +        ctxt.field_width =
> +#ifdef CONFIG_COMPAT
> +            has_32bit_shinfo(d) ? 4 :
> +#endif
> +            8;
> +
> +    rc = domain_save_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, d->shared_info, PAGE_SIZE);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_save_end(c);
> +}
> +
> +static int load_shared_info(struct vcpu *v, struct domain_context *c)
> +{
> +    struct domain *d = v->domain;
> +    struct domain_shared_info_context ctxt = {};
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    size_t size = hdr_size + PAGE_SIZE;
> +    unsigned int i;
> +    int rc;
> +
> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, v, size, true);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_load_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    for ( i = 0; i < ARRAY_SIZE(ctxt.pad); i++ )
> +        if ( ctxt.pad[i] )
> +            return -EINVAL;
> +
> +    switch ( ctxt.field_width )
> +    {
> +#ifdef CONFIG_COMPAT
> +    case 4:
> +        d->arch.has_32bit_shinfo = 1;
> +        break;
> +#endif
> +    case 8:
> +#ifdef CONFIG_COMPAT
> +        d->arch.has_32bit_shinfo = 0;
> +#endif
> +        break;
> +
> +    default:
> +        rc = -EINVAL;
> +        break;
> +    }
> +
> +    rc = domain_load_data(c, d->shared_info, PAGE_SIZE);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_load_end(c);
> +}
> +
> +DOMAIN_REGISTER_SAVE_RESTORE(SHARED_INFO, false, save_shared_info,
> +                             load_shared_info);
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> index 7e5f8752bd..ed994a8765 100644
> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -79,6 +79,14 @@ struct domain_save_header {
>   };
>   DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
>   
> -#define DOMAIN_SAVE_CODE_MAX 1
> +struct domain_shared_info_context {
> +    uint8_t field_width;
> +    uint8_t pad[7];
> +    uint8_t buffer[]; /* Implementation specific size */

I would recommend to use buffer[XEN_FLEX_ARRAY_DIM].

Cheers,

-- 
Julien Grall


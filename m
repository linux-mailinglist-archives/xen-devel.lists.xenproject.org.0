Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB631DD0E1
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 17:14:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbmsz-0002yN-FK; Thu, 21 May 2020 15:13:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbmsx-0002yI-O9
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 15:13:27 +0000
X-Inumbo-ID: 9e97a0fe-9b75-11ea-ab21-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e97a0fe-9b75-11ea-ab21-12813bfff9fa;
 Thu, 21 May 2020 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B+SjDeAYCgLhoo+XlDyrRh7EIx9bOtUHiRaWaAa6sBA=; b=bvY/JNeUBTuRrSFDyiBNbJjVpJ
 QcblduMs03gqOg8Ns7ZtcHyhGdG90YhN75LOX0tRcR47NlHy8pcAY2UxmIJBWGS+M2aJglqrFoM0u
 +tOamkxmxqQl2DOsveAkpuSMEGgeq53+HdoZCQQMZK+pwBb9d9CSMHNkI/C37vIbFbt0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbmst-0004uQ-3a; Thu, 21 May 2020 15:13:23 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbmss-0004XY-HN; Thu, 21 May 2020 15:13:23 +0000
Subject: Re: [PATCH v4 4/5] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200521085932.10508-1-paul@xen.org>
 <20200521085932.10508-5-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <dd544d5d-aa25-f035-d96b-747f07c23513@xen.org>
Date: Thu, 21 May 2020 16:13:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521085932.10508-5-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 21/05/2020 09:59, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... and update xen-domctx to dump some information describing the record.
> 
> NOTE: The domain may or may not be using the embedded vcpu_info array so
>        ultimately separate context records will be added for vcpu_info when
>        this becomes necessary.
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
> v4:
>   - Addressed comments from Jan
> 
> v3:
>   - Actually dump some of the content of shared_info
> 
> v2:
>   - Drop the header change to define a 'Xen' page size and instead use a
>     variable length struct now that the framework makes this is feasible
>   - Guard use of 'has_32bit_shinfo' in common code with CONFIG_COMPAT
> ---
>   tools/misc/xen-domctx.c   | 78 +++++++++++++++++++++++++++++++++++++++
>   xen/common/domain.c       | 59 +++++++++++++++++++++++++++++
>   xen/include/public/save.h | 13 ++++++-
>   3 files changed, 149 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/misc/xen-domctx.c b/tools/misc/xen-domctx.c
> index 243325dfce..6ead7ea89d 100644
> --- a/tools/misc/xen-domctx.c
> +++ b/tools/misc/xen-domctx.c
> @@ -31,6 +31,7 @@
>   #include <errno.h>
>   
>   #include <xenctrl.h>
> +#include <xen-tools/libs.h>
>   #include <xen/xen.h>
>   #include <xen/domctl.h>
>   #include <xen/save.h>
> @@ -61,6 +62,82 @@ static void dump_header(void)
>   
>   }
>   
> +static void print_binary(const char *prefix, const void *val, size_t size,
> +                         const char *suffix)
> +{
> +    printf("%s", prefix);
> +
> +    while ( size-- )
> +    {
> +        uint8_t octet = *(const uint8_t *)val++;
> +        unsigned int i;
> +
> +        for ( i = 0; i < 8; i++ )
> +        {
> +            printf("%u", octet & 1);
> +            octet >>= 1;
> +        }
> +    }
> +
> +    printf("%s", suffix);
> +}
> +
> +static void dump_shared_info(void)
> +{
> +    DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
> +    bool has_32bit_shinfo;
> +    shared_info_any_t *info;
> +    unsigned int i, n;
> +
> +    GET_PTR(s);
> +    has_32bit_shinfo = s->flags & DOMAIN_SAVE_32BIT_SHINFO;
> +
> +    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: %u\n",
> +           has_32bit_shinfo ? "true" : "false", s->buffer_size);
> +
> +    info = (shared_info_any_t *)s->buffer;
> +
> +#define GET_FIELD_PTR(_f)            \
> +    (has_32bit_shinfo ?              \
> +     (const void *)&(info->x32._f) : \
> +     (const void *)&(info->x64._f))
> +#define GET_FIELD_SIZE(_f) \
> +    (has_32bit_shinfo ? sizeof(info->x32._f) : sizeof(info->x64._f))
> +#define GET_FIELD(_f) \
> +    (has_32bit_shinfo ? info->x32._f : info->x64._f)
> +
> +    n = has_32bit_shinfo ?
> +        ARRAY_SIZE(info->x32.evtchn_pending) :
> +        ARRAY_SIZE(info->x64.evtchn_pending);
> +
> +    for ( i = 0; i < n; i++ )
> +    {
> +        const char *prefix = !i ?
> +            "                 evtchn_pending: " :
> +            "                                 ";
> +
> +        print_binary(prefix, GET_FIELD_PTR(evtchn_pending[0]),
> +                 GET_FIELD_SIZE(evtchn_pending[0]), "\n");
> +    }
> +
> +    for ( i = 0; i < n; i++ )
> +    {
> +        const char *prefix = !i ?
> +            "                    evtchn_mask: " :
> +            "                                 ";
> +
> +        print_binary(prefix, GET_FIELD_PTR(evtchn_mask[0]),
> +                 GET_FIELD_SIZE(evtchn_mask[0]), "\n");
> +    }
> +
> +    printf("                 wc: version: %u sec: %u nsec: %u\n",
> +           GET_FIELD(wc_version), GET_FIELD(wc_sec), GET_FIELD(wc_nsec));
> +
> +#undef GET_FIELD
> +#undef GET_FIELD_SIZE
> +#undef GET_FIELD_PTR
> +}
> +
>   static void dump_end(void)
>   {
>       DOMAIN_SAVE_TYPE(END) *e;
> @@ -173,6 +250,7 @@ int main(int argc, char **argv)
>               switch (desc->typecode)
>               {
>               case DOMAIN_SAVE_CODE(HEADER): dump_header(); break;
> +            case DOMAIN_SAVE_CODE(SHARED_INFO): dump_shared_info(); break;
>               case DOMAIN_SAVE_CODE(END): dump_end(); break;
>               default:
>                   printf("Unknown type %u: skipping\n", desc->typecode);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..14e96c3bc2 100644
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
> @@ -1649,6 +1650,64 @@ int continue_hypercall_on_cpu(
>       return 0;
>   }
>   
> +static int save_shared_info(const struct domain *d, struct domain_context *c,
> +                            bool dry_run)
> +{
> +    struct domain_shared_info_context ctxt = {
> +#ifdef CONFIG_COMPAT
> +        .flags = has_32bit_shinfo(d) ? DOMAIN_SAVE_32BIT_SHINFO : 0,
> +#endif
> +        .buffer_size = sizeof(shared_info_t),
> +    };
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    int rc;
> +
> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_save_end(c);
> +}
> +
> +static int load_shared_info(struct domain *d, struct domain_context *c)
> +{
> +    struct domain_shared_info_context ctxt;
> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    unsigned int i;
> +    int rc;
> +
> +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> +    if ( rc || i ) /* expect only a single instance */
> +        return rc;

This will return 0 if there is multiple instance. Is it intended?

> +
> +    rc = domain_load_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( ctxt.buffer_size != sizeof(shared_info_t) )
> +        return -EINVAL;
> +
> +#ifdef CONFIG_COMPAT
> +    has_32bit_shinfo(d) = ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO;
> +#endif
Should we check the flag is not set when compat is not supported?

This would prevent someone to try restoring a compat shared info on a 
platform not support it.

> +
> +    rc = domain_load_data(c, d->shared_info, sizeof(shared_info_t));
> +    if ( rc )
> +        return rc;
> +
> +    return domain_load_end(c);
> +}
> +
> +DOMAIN_REGISTER_SAVE_LOAD(SHARED_INFO, save_shared_info, load_shared_info);
> +
>   /*
>    * Local variables:
>    * mode: C
> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> index 551dbbddb8..0e855a4b97 100644
> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -82,7 +82,18 @@ struct domain_save_header {
>   };
>   DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
>   
> -#define DOMAIN_SAVE_CODE_MAX 1
> +struct domain_shared_info_context {
> +    uint32_t flags;
> +
> +#define DOMAIN_SAVE_32BIT_SHINFO 0x00000001
> +
> +    uint32_t buffer_size;
> +    uint8_t buffer[XEN_FLEX_ARRAY_DIM]; /* Implementation specific size */
> +};
> +
> +DECLARE_DOMAIN_SAVE_TYPE(SHARED_INFO, 2, struct domain_shared_info_context);
> +
> +#define DOMAIN_SAVE_CODE_MAX 2
>   
>   #endif /* defined(__XEN__) || defined(__XEN_TOOLS__) */
>   
> 

Cheers,

-- 
Julien Grall


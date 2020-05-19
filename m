Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D455A1D98F7
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 16:07:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb2uE-0000tD-Hx; Tue, 19 May 2020 14:07:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb2uD-0000t5-AB
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 14:07:41 +0000
X-Inumbo-ID: 19272469-99da-11ea-a91d-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19272469-99da-11ea-a91d-12813bfff9fa;
 Tue, 19 May 2020 14:07:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B8783AC84;
 Tue, 19 May 2020 14:07:41 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] common/domain: add a domain context record for
 shared_info...
To: Paul Durrant <paul@xen.org>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbebc62f-8066-a60e-5717-58e46cd2d172@suse.com>
Date: Tue, 19 May 2020 16:07:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514104416.16657-5-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.2020 12:44, Paul Durrant wrote:
> @@ -61,6 +62,76 @@ static void dump_header(void)
>  
>  }
>  
> +static void print_binary(const char *prefix, void *val, size_t size,

const also for val?

> +                         const char *suffix)
> +{
> +    printf("%s", prefix);
> +
> +    while (size--)

Judging from style elsewhere you look to be missing two blanks
here.

> +    {
> +        uint8_t octet = *(uint8_t *)val++;

Following the above then also better don't cast const away here.

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
> +    shared_info_any_t *info;
> +    unsigned int i;
> +
> +    GET_PTR(s);
> +
> +    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: %u\n",
> +           s->has_32bit_shinfo ? "true" : "false", s->buffer_size);
> +
> +    info = (shared_info_any_t *)s->buffer;
> +
> +#define GET_FIELD_PTR(_f) \
> +    (s->has_32bit_shinfo ? (void *)&(info->x32._f) : (void *)&(info->x64._f))

Better cast to const void * ?

> +#define GET_FIELD_SIZE(_f) \
> +    (s->has_32bit_shinfo ? sizeof(info->x32._f) : sizeof(info->x64._f))
> +#define GET_FIELD(_f) \
> +    (s->has_32bit_shinfo ? info->x32._f : info->x64._f)
> +
> +    /* Array lengths are the same for 32-bit and 64-bit shared info */

Not really, no:

    xen_ulong_t evtchn_pending[sizeof(xen_ulong_t) * 8];
    xen_ulong_t evtchn_mask[sizeof(xen_ulong_t) * 8];

> @@ -167,12 +238,14 @@ int main(int argc, char **argv)
>          if ( (typecode < 0 || typecode == desc->typecode) &&
>               (instance < 0 || instance == desc->instance) )
>          {
> +
>              printf("[%u] type: %u instance: %u length: %u\n", entry++,
>                     desc->typecode, desc->instance, desc->length);

Stray insertion of a blank line?

> @@ -1649,6 +1650,65 @@ int continue_hypercall_on_cpu(
>      return 0;
>  }
>  
> +static int save_shared_info(const struct domain *d, struct domain_context *c,
> +                            bool dry_run)
> +{
> +    struct domain_shared_info_context ctxt = { .buffer_size = PAGE_SIZE };

Why not sizeof(shared_info), utilizing the zero padding on the
receiving side?

> +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> +    int rc;
> +
> +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> +    if ( rc )
> +        return rc;
> +
> +#ifdef CONFIG_COMPAT
> +    if ( !dry_run )
> +        ctxt.has_32bit_shinfo = has_32bit_shinfo(d);
> +#endif

Nothing will go wrong without the if(), I suppose? Better drop it
then? It could then also easily be part of the initializer of ctxt.

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
> +
> +    rc = domain_load_data(c, &ctxt, hdr_size);
> +    if ( rc )
> +        return rc;
> +
> +    if ( ctxt.pad[0] || ctxt.pad[1] || ctxt.pad[2] ||
> +         ctxt.buffer_size != PAGE_SIZE )
> +        return -EINVAL;
> +
> +#ifdef CONFIG_COMPAT
> +    d->arch.has_32bit_shinfo = ctxt.has_32bit_shinfo;
> +#endif

There's nothing wrong with using has_32bit_shinfo(d) here as well.

> --- a/xen/include/public/save.h
> +++ b/xen/include/public/save.h
> @@ -73,7 +73,16 @@ struct domain_save_header {
>  };
>  DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
>  
> -#define DOMAIN_SAVE_CODE_MAX 1
> +struct domain_shared_info_context {
> +    uint8_t has_32bit_shinfo;
> +    uint8_t pad[3];

32-(or 16-)bit flags, with just a single bit used for the purpose?

Jan


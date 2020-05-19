Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EC21D9B04
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb43e-00006t-1w; Tue, 19 May 2020 15:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb43c-00006o-Iv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:21:28 +0000
X-Inumbo-ID: 67bfc652-99e4-11ea-9887-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67bfc652-99e4-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 15:21:26 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 50so16322704wrc.11
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=wXgEDGvb5Fzh9IMx3Yk8Hp4pGlB6t9IjXAeNzQkMs4A=;
 b=Jcxdx13QVLKlLzqUmgv6xivc37j7zmyJfGh03mp75uBauVHX16k198wUwg2/7C1hr0
 V2LNNid+TmoN7T6bD3xL6qF+IZIThgwIASu1+PZX3RE6WjcRYGpFgr32wXl0KitqABS/
 SZZJ8KxaoE2p0ub5auPIrP8dg4gS9ohskuD7w2lw/QrR2r1LfKNQSG3ulGJgMLx8USWB
 7lCPJ8a1bQuZeNsyipdxqU3bg8yGerkbl5heSGiiQrtQHCkHip+p61Cr67KJphAE+5Wt
 41Erzohbf9qmUEz7CNgmYJNFu/s7CST+XNuMOgopyprCRWPhX8sxwjASGm3aXFiGmorN
 CziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=wXgEDGvb5Fzh9IMx3Yk8Hp4pGlB6t9IjXAeNzQkMs4A=;
 b=dMi2H3EUEDzUVzpR3EcZPFSz183/cJxC5M113RcldptS2PYMgtwlGogPW9f+NKGDf7
 ILurbwxa5TdCyhcQAxXS8FGJfP0UnUNFZivSGWgP7XY8426HQWth4iAl7Rgonw6XrdE8
 SsTCNNf7m7KwG59knbEWr47gNd6kYEf45TpFTDh2LnRvvvWxqlTTg61LXuYAxVAveu5g
 wP9hGkgxBfgnafM1FaewbqsQj6SidwMbCMHRCw7Po3yrWRiSHJ7Mr6IEI4edXzotJ3nl
 +Am0TlUukme2uhMa4lFz2O1OKm07mmdNwcxud0rEcVCydabdAXwGA+GS1zuPzaMa/YEI
 NUdw==
X-Gm-Message-State: AOAM531nwoLUL7yx7tTItvBzL2nSWvsm5Rtnwyd6awj9xiIjDbV8gKD4
 APx8M7DgM3tx3syXwmwmSgA=
X-Google-Smtp-Source: ABdhPJyOxuPj2dcs9nOMzT61S9PLj6jv3HlSQEwI/k2KJQo/C7I4DY/P2+2RJ/4/PE35b+hwnu/zXA==
X-Received: by 2002:a5d:4d89:: with SMTP id b9mr26965878wru.210.1589901685656; 
 Tue, 19 May 2020 08:21:25 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id w20sm18980wmk.25.2020.05.19.08.21.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 08:21:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-5-paul@xen.org>
 <bbebc62f-8066-a60e-5717-58e46cd2d172@suse.com>
In-Reply-To: <bbebc62f-8066-a60e-5717-58e46cd2d172@suse.com>
Subject: RE: [PATCH v3 4/5] common/domain: add a domain context record for
 shared_info...
Date: Tue, 19 May 2020 16:21:23 +0100
Message-ID: <000a01d62df1$28e876e0$7ab964a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQHAdhdAAmVNhmmoS0wfcA==
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 May 2020 15:08
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant <pdurrant@amazon.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: Re: [PATCH v3 4/5] common/domain: add a domain context record for shared_info...
> 
> On 14.05.2020 12:44, Paul Durrant wrote:
> > @@ -61,6 +62,76 @@ static void dump_header(void)
> >
> >  }
> >
> > +static void print_binary(const char *prefix, void *val, size_t size,
> 
> const also for val?

Yes, it can be.

> 
> > +                         const char *suffix)
> > +{
> > +    printf("%s", prefix);
> > +
> > +    while (size--)
> 
> Judging from style elsewhere you look to be missing two blanks
> here.
> 

Yes.

> > +    {
> > +        uint8_t octet = *(uint8_t *)val++;
> 
> Following the above then also better don't cast const away here.
> 
> > +        unsigned int i;
> > +
> > +        for ( i = 0; i < 8; i++ )
> > +        {
> > +            printf("%u", octet & 1);
> > +            octet >>= 1;
> > +        }
> > +    }
> > +
> > +    printf("%s", suffix);
> > +}
> > +
> > +static void dump_shared_info(void)
> > +{
> > +    DOMAIN_SAVE_TYPE(SHARED_INFO) *s;
> > +    shared_info_any_t *info;
> > +    unsigned int i;
> > +
> > +    GET_PTR(s);
> > +
> > +    printf("    SHARED_INFO: has_32bit_shinfo: %s buffer_size: %u\n",
> > +           s->has_32bit_shinfo ? "true" : "false", s->buffer_size);
> > +
> > +    info = (shared_info_any_t *)s->buffer;
> > +
> > +#define GET_FIELD_PTR(_f) \
> > +    (s->has_32bit_shinfo ? (void *)&(info->x32._f) : (void *)&(info->x64._f))
> 
> Better cast to const void * ?
> 

Ok.

> > +#define GET_FIELD_SIZE(_f) \
> > +    (s->has_32bit_shinfo ? sizeof(info->x32._f) : sizeof(info->x64._f))
> > +#define GET_FIELD(_f) \
> > +    (s->has_32bit_shinfo ? info->x32._f : info->x64._f)
> > +
> > +    /* Array lengths are the same for 32-bit and 64-bit shared info */
> 
> Not really, no:
> 
>     xen_ulong_t evtchn_pending[sizeof(xen_ulong_t) * 8];
>     xen_ulong_t evtchn_mask[sizeof(xen_ulong_t) * 8];
> 

Oh, I must have misread.

> > @@ -167,12 +238,14 @@ int main(int argc, char **argv)
> >          if ( (typecode < 0 || typecode == desc->typecode) &&
> >               (instance < 0 || instance == desc->instance) )
> >          {
> > +
> >              printf("[%u] type: %u instance: %u length: %u\n", entry++,
> >                     desc->typecode, desc->instance, desc->length);
> 
> Stray insertion of a blank line?
> 

Yes.

> > @@ -1649,6 +1650,65 @@ int continue_hypercall_on_cpu(
> >      return 0;
> >  }
> >
> > +static int save_shared_info(const struct domain *d, struct domain_context *c,
> > +                            bool dry_run)
> > +{
> > +    struct domain_shared_info_context ctxt = { .buffer_size = PAGE_SIZE };
> 
> Why not sizeof(shared_info), utilizing the zero padding on the
> receiving side?
> 

Ok, yes, I guess that would work.

> > +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> > +    int rc;
> > +
> > +    rc = DOMAIN_SAVE_BEGIN(SHARED_INFO, c, 0);
> > +    if ( rc )
> > +        return rc;
> > +
> > +#ifdef CONFIG_COMPAT
> > +    if ( !dry_run )
> > +        ctxt.has_32bit_shinfo = has_32bit_shinfo(d);
> > +#endif
> 
> Nothing will go wrong without the if(), I suppose? Better drop it
> then? It could then also easily be part of the initializer of ctxt.
> 

Ok. I said last time I wanted to keep it as it was illustrative but I'll drop it since it has now come up twice.

> > +    rc = domain_save_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc = domain_save_data(c, d->shared_info, ctxt.buffer_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    return domain_save_end(c);
> > +}
> > +
> > +static int load_shared_info(struct domain *d, struct domain_context *c)
> > +{
> > +    struct domain_shared_info_context ctxt;
> > +    size_t hdr_size = offsetof(typeof(ctxt), buffer);
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    rc = DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> > +    if ( rc || i ) /* expect only a single instance */
> > +        return rc;
> > +
> > +    rc = domain_load_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( ctxt.pad[0] || ctxt.pad[1] || ctxt.pad[2] ||
> > +         ctxt.buffer_size != PAGE_SIZE )
> > +        return -EINVAL;
> > +
> > +#ifdef CONFIG_COMPAT
> > +    d->arch.has_32bit_shinfo = ctxt.has_32bit_shinfo;
> > +#endif
> 
> There's nothing wrong with using has_32bit_shinfo(d) here as well.
> 

I just thought it looked odd.

> > --- a/xen/include/public/save.h
> > +++ b/xen/include/public/save.h
> > @@ -73,7 +73,16 @@ struct domain_save_header {
> >  };
> >  DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);
> >
> > -#define DOMAIN_SAVE_CODE_MAX 1
> > +struct domain_shared_info_context {
> > +    uint8_t has_32bit_shinfo;
> > +    uint8_t pad[3];
> 
> 32-(or 16-)bit flags, with just a single bit used for the purpose?
> 

I debated that. Given this is xen/tools-only would a bit-field be acceptable?

  Paul

> Jan



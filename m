Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BC19DCB0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 19:25:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKQ3C-0005fi-Hu; Fri, 03 Apr 2020 17:24:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fKXS=5T=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKQ3B-0005fd-2X
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 17:24:13 +0000
X-Inumbo-ID: ef0da0e0-75cf-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef0da0e0-75cf-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 17:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tENYr9AEzglSu7pLXwfkYBEAaBIn0u16L19R+hprdhs=; b=gONuvICrV/N6BA+T1OjzDRqgBC
 eXjewtRBStp7+OcuVvjwAijTNihfidvipzT9k7yjDakgdcKRdWf7EncpPB7UiSBOsSzGGX9u1x3DI
 RdKeUsXEcN89ADFCyJjYHOPEdJPtYGACfTM2BNCVcYR54fAAmZFCmmfljbZCVT3Me6Iw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKQ36-0004Sg-07; Fri, 03 Apr 2020 17:24:08 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKQ35-00081Q-Km; Fri, 03 Apr 2020 17:24:07 +0000
Subject: Re: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: paul@xen.org, xen-devel@lists.xenproject.org
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
 <002201d609d0$55a76690$00f633b0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <acd5fee0-2bf6-4573-8467-38d24827ca1f@xen.org>
Date: Fri, 3 Apr 2020 18:24:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <002201d609d0$55a76690$00f633b0$@xen.org>
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 03/04/2020 16:55, Paul Durrant wrote:
>> -----Original Message-----
> [snip]
>>> +
>>> +#include <xen/save.h>
>>> +
>>> +struct domain_context {
>>> +    bool log;
>>> +    struct domain_save_descriptor desc;
>>> +    domain_copy_entry copy;
>>
>> As your new framework is technically an extension of existing one, it
>> would be good to explain why we diverge in the definitions.
>>
> 
> I don't follow. What is diverging? I explain in the commit comment that this is a parallel framework. Do I need to justify why it is not a carbon copy of the HVM one?

Well, they are both restoring/saving guest state. The only difference is 
the existing one is focusing on HVM state.

So it would make sense long term to have only one hypercall and tell 
what you want to save. In fact, some of the improvement here would 
definitely make the HVM one nicer to use (at least in the context of LU).

 From the commit message, it is not clear to me why a new framework and 
why the infrastructure is at the same time different but not.

> 
>>> +    void *priv;
>>> +};
>>> +
>>> +static struct {
>>> +    const char *name;
>>> +    bool per_vcpu;
>>> +    domain_save_handler save;
>>> +    domain_load_handler load;
>>> +} handlers[DOMAIN_SAVE_CODE_MAX + 1];
>>> +
>>> +void __init domain_register_save_type(unsigned int tc, const char *name,
>>> +                                      bool per_vcpu,
>>> +                                      domain_save_handler save,
>>> +                                      domain_load_handler load)
>>> +{
>>> +    BUG_ON(tc > ARRAY_SIZE(handlers));
>>> +
>>> +    ASSERT(!handlers[tc].save);
>>> +    ASSERT(!handlers[tc].load);
>>> +
>>> +    handlers[tc].name = name;
>>> +    handlers[tc].per_vcpu = per_vcpu;
>>> +    handlers[tc].save = save;
>>> +    handlers[tc].load = load;
>>> +}
>>> +
>>> +int domain_save_entry(struct domain_context *c, unsigned int tc,
>>> +                      const char *name, const struct vcpu *v, void *src,
>>
>> I realize that 'src' is not const because how you define copy, however I
>> would rather prefer if we rework the interface to avoid to keep the
>> const in the definition. This may mean to have to define two callback
>> rather than one.
> 
> That seems a bit ugly for the sake of a const but I guess I could create a union with a copy_in and copy_out. I'll see how that looks.

I would really like to map the Live-Update as read-only (it is not meant 
to be modified by the new Xen) and therefore adding const here would 
enable us to catch most of the mistake at build rather than during runtime.
>> Why not adding an implicit padding? This would avoid to chase error
>> during saving because the len wasn't a multiple of 8.
>>
> 
> I don't think implicit padding is worth it. This error should only happen if a badly defined save record type is added to the code so perhaps I ought to add an ASSERT here as well as deal with the error.

I wish I would be able to say every error can be caught during review. 
Unfortunately this is not true.

If you define the size dynamically, then a misalignment may not be 
noticed until you go to prod. The implicit padding would at least allow 
you to be more resilient.

It may not be that bad as you would not be able to save the guest. 
Anyway, this would be nice a feature to have but not a must.

> 
>>> +        return -EINVAL;
>>> +
>>> +    BUG_ON(tc != c->desc.typecode);
>>> +    BUG_ON(v->vcpu_id != c->desc.instance);
>>
>> Does the descriptor really need to be filled by domain_save()? Can't it
>> be done here, so we can avoid the two BUG_ON()s?
>>
> 
> Yes it can but this serves as a sanity check that the save code is actually doing what it should. Hence why these are BUG_ON()s and not error exits.

This does not really answer to the question why the c->desc.instance and 
c->desc.typecode are not set here. What is the advantage to do it 
earlier on and still passing the information in parameters? Why not just 
setting them here?

> 
>>> +    c->desc.length = src_len;
>>> +
>>> +    rc = c->copy(c->priv, &c->desc, sizeof(c->desc));
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    return c->copy(c->priv, src, src_len);
>>> +}
>>> +
>>> +int domain_save(struct domain *d, domain_copy_entry copy, void *priv,
>>> +                unsigned long mask, bool dry_run)
>>> +{
>>> +    struct domain_context c = {
>>> +        .copy = copy,
>>> +        .priv = priv,
>>> +        .log = !dry_run,
>>> +    };
>>> +    struct domain_save_header h = {
>>> +        .magic = DOMAIN_SAVE_MAGIC,
>>> +        .version = DOMAIN_SAVE_VERSION,
>>> +    };
>>> +    struct domain_save_header e;
>>> +    unsigned int i;
>>> +    int rc;
>>> +
>>> +    ASSERT(d != current->domain);
>>> +
>>> +    if ( d->is_dying )
>>> +        return -EINVAL;
>>> +
>>> +    domain_pause(d);
>>> +
>>> +    c.desc.typecode = DOMAIN_SAVE_CODE(HEADER);
>>> +
>>> +    rc = DOMAIN_SAVE_ENTRY(HEADER, &c, d->vcpu[0], &h, sizeof(h));
>>> +    if ( rc )
>>> +        goto out;
>>> +
>>> +    for ( i = 0; i < ARRAY_SIZE(handlers); i++ )
>>
>> AFAIU, with this solution, if there are dependency between records, the
>> dependencies will have to a lower "index". I think we may have some
>> dependency with guest transparent migration such as we need to restore
>> the event ABI before restoring the event channels.
>>
> 
> Is that just a downstream implementation detail though? I would hope that there are no ordering dependencies between records.

Until now, I never managed to avoid ordering between records on the Live 
Update side.

In my previous e-mail, I suggested there are dependency between 
restoring the event ABI (such as control page...) and restoring the 
event channels. How do you suggest to solve it without imposing an order 
between records?

>>> +    {
>>> +        domain_save_handler save = handlers[i].save;
>>> +
>>> +        if ( (mask && !test_bit(i, &mask)) || !save )
>>
>> The type of mask suggests it is not possible to have more than 32
>> different types of record if we wanted to be arch agnostic. Even if we
>> focus on 64-bit arch, this is only 64 records.
>>
>> This is not very future proof, but might be ok if this is not exposed
>> outside of the hypervisor (I haven't looked at the rest of the series
>> yet). However, we at least need a BUILD_BUG_ON() in place. So please
>> make sure  DOMAIN_SAVE_CODE_MAX is always less than 64.
>>
>> Also what if there is a bit set in the mask and the record is not
>> existing? Shouldn't we return an error?
>>
> 
> TBH I think 32 will be enough... I would not expect this context space to grow very much, if at all, once transparent migration is working. I think I'll just drop the mask for now; it's not actually clear to me we'll make use of it... just seemed like a nice-to-have.

So far for Live-Update we have 20 records (not counting the Guest 
Tranparent one). We might be able to do without some, but we also didn't 
restore all the states yet.

> 
>>> +            continue;
>>> +
>>> +        memset(&c.desc, 0, sizeof(c.desc));
>>> +        c.desc.typecode = i;
>>> +
>>> +        if ( handlers[i].per_vcpu )
>>> +        {
>>> +            struct vcpu *v;
>>> +
>>> +            for_each_vcpu ( d, v )
>>> +            {
>>> +                c.desc.instance = v->vcpu_id;
>>> +
>>> +                rc = save(v, &c, dry_run);
>>> +                if ( rc )
>>> +                    goto out;
>>> +            }
>>> +        }
>>> +        else
>>> +        {
>>> +            rc = save(d->vcpu[0], &c, dry_run);
>>> +            if ( rc )
>>> +                goto out;
>>> +        }
>>> +    }
>>> +
>>> +    memset(&c.desc, 0, sizeof(c.desc));
>>> +    c.desc.typecode = DOMAIN_SAVE_CODE(END);
>>> +
>>> +    rc = DOMAIN_SAVE_ENTRY(END, &c, d->vcpu[0], &e, 0);
>>> +
>>> + out:
>>> +    domain_unpause(d);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +int domain_load_entry(struct domain_context *c, unsigned int tc,
>>> +                      const char *name, const struct vcpu *v, void *dst,
>>> +                      size_t dst_len, bool exact)
>>> +{
>>> +    int rc;
>>> +
>>> +    if ( c->log && tc != DOMAIN_SAVE_CODE(HEADER) &&
>>> +         tc != DOMAIN_SAVE_CODE(END) )
>>> +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name, dst_len);
>>> +
>>> +    BUG_ON(tc != c->desc.typecode);
>>> +    BUG_ON(v->vcpu_id != c->desc.instance);
>>
>> Is it really warrant to crash the host? What would happen if the values
>> were wrong?
>>
> 
> It would mean the code is fairly seriously buggy in that the load handler is trying to load a record other than the type it registered for, or for a vcpu other than the one it was passed.

I understand that, but is warrant to crash the host? Couldn't you just 
return an error and continue to run?

> 
>>> +
>>> +    if ( (exact ?
>>> +          (dst_len != c->desc.length) : (dst_len < c->desc.length)) ||
>>
>> Using ternary in if is really confusing. How about:
>>
>> dst_len < c->desc.length || (exact && dst_len != c->desc.length) ||
>>
>> I understand that there would be two check for the exact case but I
>> think it is better than a ternary.
> 
> I'm going to re-work this I think.
> 
>>
>> However what is the purpose of the param 'exact'? If you set it to false
>> how do you know the size you read?
> 
> The point of the exact parameter is that whether the caller can only consume a record of the correct length, or whether it can handle an undersize one which gets zero-padded. (It's the same as the zeroextend option in HVM records).
> 
>>
>>> +         !IS_ALIGNED(c->desc.length, 8) )
>>> +        return -EINVAL;
>>> +
>>> +    rc = c->copy(c->priv, dst, c->desc.length);
>>> +    if ( rc )
>>> +        return rc;
>>> +
>>> +    if ( !exact )
>>> +    {
>>> +        dst += c->desc.length;
>>> +        memset(dst, 0, dst_len - c->desc.length);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +int domain_load(struct domain *d,  domain_copy_entry copy, void *priv,
>>> +                unsigned long mask)
>>> +{
>>> +    struct domain_context c = {
>>> +        .copy = copy,
>>> +        .priv = priv,
>>> +        .log = true,
>>> +    };
>>> +    struct domain_save_header h, e;
>>> +    int rc;
>>> +
>>> +    ASSERT(d != current->domain);
>>> +
>>> +    if ( d->is_dying )
>>> +        return -EINVAL;
>>
>> What does protect you against the doing dying right after this check?
>>
> 
> Nothing. It's just to avoid doing pointless work if we can.

I wasn't thinking about pointless work but whether the rest of the code 
is relying on a sound domain. Is it going to be fine?

[...]

>>> +/* Each entry is preceded by a descriptor */
>>> +struct domain_save_descriptor {
>>> +    uint16_t typecode;
>>> +    uint16_t instance;
>>> +    /*
>>> +     * Entry length not including this descriptor. Entries must be padded
>>> +     * to a multiple of 8 bytes to make sure descriptors remain correctly
>>> +     * aligned.
>>> +     */
>>> +    uint32_t length;
>>> +};
>>> +
>>> +/*
>>> + * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
>>> + * binds these things together.
>>> + */
>>> +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
>>> +    struct __DOMAIN_SAVE_TYPE_##_x { _type t; char c[_code]; };
>>> +
>>> +#define DOMAIN_SAVE_TYPE(_x) \
>>> +    typeof (((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->t)
>>> +#define DOMAIN_SAVE_CODE(_x) \
>>> +    (sizeof (((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->c))
>>> +#define DOMAIN_SAVE_MASK(_x) (1u << DOMAIN_SAVE_CODE(_x))
>>> +
>>> +/* Terminating entry */
>>> +struct domain_save_end {};
>>> +DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);
>>> +
>>> +#define DOMAIN_SAVE_MAGIC   0x53415645
>>> +#define DOMAIN_SAVE_VERSION 0x00000001
>>> +
>>> +/* Initial entry */
>>> +struct domain_save_header {
>>> +    uint32_t magic;             /* Must be DOMAIN_SAVE_MAGIC */
>>> +    uint32_t version;           /* Save format version */
>>
>> Would it make sense to have the version of Xen in the stream?
>>
> 
> Why? How would it help?

Let's imagine in 4.14 we introduced a bug in the saving part. This is 
solved in 4.15 but somehow the version is not bumped. How would you 
differentiate the streams saved by Xen 4.14 so you can still migrate?

If you record the version of Xen in the record automatically, then you 
at least have a way to differentiate the two versions.

Cheers,

-- 
Julien Grall


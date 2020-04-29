Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0E1BDA3B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 13:03:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTkU1-0001hK-5Q; Wed, 29 Apr 2020 11:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yqvu=6N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTkU0-0001hC-2G
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 11:02:28 +0000
X-Inumbo-ID: e965e790-8a08-11ea-992b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e965e790-8a08-11ea-992b-12813bfff9fa;
 Wed, 29 Apr 2020 11:02:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E102AAE17;
 Wed, 29 Apr 2020 11:02:24 +0000 (UTC)
Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
Date: Wed, 29 Apr 2020 13:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-2-paul@xen.org>
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 19:38, Paul Durrant wrote:
> +void __init domain_register_save_type(unsigned int tc, const char *name,
> +                                      bool per_vcpu,
> +                                      domain_save_handler save,
> +                                      domain_load_handler load)
> +{
> +    BUG_ON(tc > ARRAY_SIZE(handlers));

>=

> +    ASSERT(!handlers[tc].save);
> +    ASSERT(!handlers[tc].load);
> +
> +    handlers[tc].name = name;
> +    handlers[tc].per_vcpu = per_vcpu;
> +    handlers[tc].save = save;
> +    handlers[tc].load = load;
> +}
> +
> +int domain_save_begin(struct domain_context *c, unsigned int tc,
> +                      const char *name, const struct vcpu *v, size_t len)

I find it quite odd for a function like this one to take a
struct vcpu * rather than a struct domain *. See also below
comment on the vcpu_id field in the public header.

> +{
> +    int rc;
> +
> +    if ( c->log )
> +        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name,
> +                 (unsigned long)len);
> +
> +    BUG_ON(tc != c->desc.typecode);
> +    BUG_ON(v->vcpu_id != c->desc.vcpu_id);
> +
> +    ASSERT(!c->data_len);
> +    c->data_len = c->desc.length = len;
> +
> +    rc = c->copy.write(c->priv, &c->desc, sizeof(c->desc));
> +    if ( rc )
> +        return rc;
> +
> +    c->desc.length = 0;
> +
> +    return 0;
> +}
> +
> +int domain_save_data(struct domain_context *c, const void *src, size_t len)
> +{
> +    if ( c->desc.length + len > c->data_len )
> +        return -ENOSPC;
> +
> +    c->desc.length += len;
> +
> +    return c->copy.write(c->priv, src, len);
> +}
> +
> +int domain_save_end(struct domain_context *c)

I'm sure there is a reason for the split into three load/save
functions (begin/data/end), but I can't figure it and the
description also doesn't explain it. They're all used together
only afaics, in domain_{save,load}_entry(). Or wait, there are
DOMAIN_{SAVE,LOAD}_BEGIN() macros apparently allowing separate
use of ..._begin(), but then it's still not clear why ..._end()
need to be separate from ..._data().

> +int domain_save(struct domain *d, domain_write_entry write, void *priv,
> +                bool dry_run)
> +{
> +    struct domain_context c = {
> +        .copy.write = write,
> +        .priv = priv,
> +        .log = !dry_run,
> +    };
> +    struct domain_save_header h = {

const? Perhaps even static?

> +        .magic = DOMAIN_SAVE_MAGIC,
> +        .version = DOMAIN_SAVE_VERSION,
> +    };
> +    struct domain_save_header e;
> +    unsigned int i;
> +    int rc;
> +
> +    ASSERT(d != current->domain);
> +
> +    if ( d->is_dying )
> +        return -EINVAL;

Could I talk you into using less generic an error code here, e.g.
-ESRCH or -ENXIO? There look to be further uses of EINVAL that
may want replacing.

> +    domain_pause(d);
> +
> +    c.desc.typecode = DOMAIN_SAVE_CODE(HEADER);
> +
> +    rc = DOMAIN_SAVE_ENTRY(HEADER, &c, d->vcpu[0], &h, sizeof(h));
> +    if ( rc )
> +        goto out;
> +
> +    for ( i = 0; i < ARRAY_SIZE(handlers); i++ )
> +    {
> +        domain_save_handler save = handlers[i].save;
> +
> +        if ( !save )
> +            continue;
> +
> +        memset(&c.desc, 0, sizeof(c.desc));
> +        c.desc.typecode = i;
> +
> +        if ( handlers[i].per_vcpu )
> +        {
> +            struct vcpu *v;
> +
> +            for_each_vcpu ( d, v )
> +            {
> +                c.desc.vcpu_id = v->vcpu_id;
> +
> +                rc = save(v, &c, dry_run);
> +                if ( rc )
> +                    goto out;
> +            }
> +        }
> +        else
> +        {
> +            rc = save(d->vcpu[0], &c, dry_run);
> +            if ( rc )
> +                goto out;
> +        }
> +    }
> +
> +    memset(&c.desc, 0, sizeof(c.desc));
> +    c.desc.typecode = DOMAIN_SAVE_CODE(END);
> +
> +    rc = DOMAIN_SAVE_ENTRY(END, &c, d->vcpu[0], &e, 0);

By the looks of it you're passing uninitialized e here; it's just
that the struct has no members. It would look less odd if you used
NULL here. Otherwise please don't use literal 0, but sizeof() for
the last parameter.

> +int domain_load_begin(struct domain_context *c, unsigned int tc,
> +                      const char *name, const struct vcpu *v, size_t len,
> +                      bool exact)
> +{
> +    if ( c->log )
> +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
> +                 (unsigned long)len);
> +
> +    BUG_ON(tc != c->desc.typecode);
> +    BUG_ON(v->vcpu_id != c->desc.vcpu_id);
> +
> +    if ( (exact && (len != c->desc.length)) ||
> +         (len < c->desc.length) )
> +        return -EINVAL;

How about

    if ( exact ? len != c->desc.length
               : len < c->desc.length )

? I'm also unsure about the < - don't you mean > instead? Too
little data would be compensated by zero padding, but too
much data can't be dealt with. But maybe I'm getting the sense
of len wrong ...

> +int domain_load(struct domain *d, domain_read_entry read, void *priv)
> +{
> +    struct domain_context c = {
> +        .copy.read = read,
> +        .priv = priv,
> +        .log = true,
> +    };
> +    struct domain_save_header h;
> +    int rc;
> +
> +    ASSERT(d != current->domain);
> +
> +    if ( d->is_dying )
> +        return -EINVAL;
> +
> +    rc = c.copy.read(c.priv, &c.desc, sizeof(c.desc));
> +    if ( rc )
> +        return rc;
> +
> +    if ( c.desc.typecode != DOMAIN_SAVE_CODE(HEADER) || c.desc.vcpu_id ||
> +         c.desc.flags )
> +        return -EINVAL;
> +
> +    rc = DOMAIN_LOAD_ENTRY(HEADER, &c, d->vcpu[0], &h, sizeof(h), true);
> +    if ( rc )
> +        return rc;
> +
> +    if ( h.magic != DOMAIN_SAVE_MAGIC || h.version != DOMAIN_SAVE_VERSION )
> +        return -EINVAL;
> +
> +    domain_pause(d);
> +
> +    for (;;)
> +    {
> +        unsigned int i;
> +        unsigned int flags;
> +        domain_load_handler load;
> +        struct vcpu *v;
> +
> +        rc = c.copy.read(c.priv, &c.desc, sizeof(c.desc));
> +        if ( rc )
> +            break;
> +
> +        rc = -EINVAL;
> +
> +        flags = c.desc.flags;
> +        if ( flags & ~DOMAIN_SAVE_FLAG_IGNORE )
> +            break;
> +
> +        if ( c.desc.typecode == DOMAIN_SAVE_CODE(END) ) {

Brace placement.

> +            if ( !(flags & DOMAIN_SAVE_FLAG_IGNORE) )
> +                rc = DOMAIN_LOAD_ENTRY(END, &c, d->vcpu[0], NULL, 0, true);

The public header says DOMAIN_SAVE_FLAG_IGNORE is invalid for
END.

> +            break;
> +        }
> +
> +        i = c.desc.typecode;
> +        if ( i >= ARRAY_SIZE(handlers) )
> +            break;
> +
> +        if ( (!handlers[i].per_vcpu && c.desc.vcpu_id) ||
> +             (c.desc.vcpu_id >= d->max_vcpus) )
> +            break;
> +
> +        v = d->vcpu[c.desc.vcpu_id];
> +
> +        if ( flags & DOMAIN_SAVE_FLAG_IGNORE )
> +        {
> +            /* Sink the data */
> +            rc = domain_load_entry(&c, c.desc.typecode, "IGNORED",
> +                                   v, NULL, c.desc.length, true);

IOW the read handlers need to be able to deal with a NULL dst?
Sounds a little fragile to me. Is there a reason
domain_load_data() can't skip the call to read()?

> --- /dev/null
> +++ b/xen/include/public/save.h
> @@ -0,0 +1,84 @@
> +/*
> + * save.h
> + *
> + * Structure definitions for common PV/HVM domain state that is held by
> + * Xen and must be saved along with the domain's memory.
> + *
> + * Copyright Amazon.com Inc. or its affiliates.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to
> + * deal in the Software without restriction, including without limitation the
> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> + * sell copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef __XEN_PUBLIC_SAVE_H__
> +#define __XEN_PUBLIC_SAVE_H__
> +
> +#include "xen.h"
> +
> +/* Each entry is preceded by a descriptor */
> +struct domain_save_descriptor {

Throughout this new public header, let's please play nice in name
space terms: Prefix global scope items with xen_ / XEN_
respectively, and don't introduce violations of the standard's
rules (e.g. _DOMAIN_SAVE_FLAG_IGNORE below). The latter point also
goes for naming outside of the public header, of course.

> +    uint16_t typecode;
> +    /*
> +     * Each entry will contain either to global or per-vcpu domain state.

s/contain/apply/ or drop "to"?

> +     * Entries relating to global state should have zero in this field.

Is there a reason to specify zero?

> +     */
> +    uint16_t vcpu_id;

Seeing (possibly) multi-instance records in HVM state (PIC, IO-APIC, HPET),
wouldn't it be better to generalize this to ID, meaning "vCPU ID" just for
per-vCPU state?

> +    uint32_t flags;
> +    /*
> +     * When restoring state this flag can be set in a descriptor to cause
> +     * its content to be ignored.
> +     *
> +     * NOTE: It is invalid to set this flag for HEADER or END records (see
> +     *       below).
> +     */
> +#define _DOMAIN_SAVE_FLAG_IGNORE 0
> +#define DOMAIN_SAVE_FLAG_IGNORE (1u << _DOMAIN_SAVE_FLAG_IGNORE)

As per your reply to Julien I think this wants further clarification on
the intentions with this flag. I'm also uncertain it is a good idea to
allow such partial restores - there may be dependencies between records,
and hence things can easily go wrong in perhaps non-obvious ways.

> +    /* Entry length not including this descriptor */
> +    uint64_t length;

Do you really envision descriptors with more than 4Gb of data? If so,
for 32-bit purposes wouldn't this want to be uint64_aligned_t?

> +};
> +
> +/*
> + * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
> + * binds these things together.
> + */
> +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> +    struct __DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
> +
> +#define DOMAIN_SAVE_CODE(_x) \
> +    (sizeof(((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->c))
> +#define DOMAIN_SAVE_TYPE(_x) \
> +    typeof(((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->t)

Just like the typeof() I dont think the sizeof() needs an outer
pair of parentheses. I also don't see why 0 gets parenthesized.

> +/* Terminating entry */
> +struct domain_save_end {};
> +DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);

If the header gets a __XEN__ || __XEN_TOOLS__ restriction, as
suggested by Julien, using 0 here may be fine. If not, char[0]
and typeof() aren't legal plain C and hence would need to be
avoided.

> --- /dev/null
> +++ b/xen/include/xen/save.h
> @@ -0,0 +1,152 @@
> +/*
> + * save.h: support routines for save/restore
> + *
> + * Copyright Amazon.com Inc. or its affiliates.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __XEN_SAVE_H__
> +#define __XEN_SAVE_H__
> +
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xen/init.h>

Please sort these.

> +#include <public/xen.h>
> +#include <public/save.h>

The latter includes the former anyway - is the former necessary
for some reason nevertheless?

> +struct domain_context;
> +
> +int domain_save_begin(struct domain_context *c, unsigned int tc,
> +                      const char *name, const struct vcpu *v, size_t len);
> +
> +#define DOMAIN_SAVE_BEGIN(_x, _c, _v, _len) \
> +        domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len))

In new code I'd like to ask for no leading underscores on macro
parameters as well as no unnecessary parenthesization of macro
parameters (e.g. when they simply get passed on to another macro
or function without being part of a larger expression).

> +int domain_save_data(struct domain_context *c, const void *data, size_t len);
> +int domain_save_end(struct domain_context *c);
> +
> +static inline int domain_save_entry(struct domain_context *c,
> +                                    unsigned int tc, const char *name,
> +                                    const struct vcpu *v, const void *src,
> +                                    size_t len)
> +{
> +    int rc;
> +
> +    rc = domain_save_begin(c, tc, name, v, len);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_save_data(c, src, len);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_save_end(c);
> +}
> +
> +#define DOMAIN_SAVE_ENTRY(_x, _c, _v, _src, _len) \
> +    domain_save_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_src), (_len))
> +
> +int domain_load_begin(struct domain_context *c, unsigned int tc,
> +                      const char *name, const struct vcpu *v, size_t len,
> +                      bool exact);
> +
> +#define DOMAIN_LOAD_BEGIN(_x, _c, _v, _len, _exact) \
> +        domain_load_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_len), \
> +                          (_exact));
> +
> +int domain_load_data(struct domain_context *c, void *data, size_t len);
> +int domain_load_end(struct domain_context *c);
> +
> +static inline int domain_load_entry(struct domain_context *c,
> +                                    unsigned int tc, const char *name,
> +                                    const struct vcpu *v, void *dst,
> +                                    size_t len, bool exact)
> +{
> +    int rc;
> +
> +    rc = domain_load_begin(c, tc, name, v, len, exact);
> +    if ( rc )
> +        return rc;
> +
> +    rc = domain_load_data(c, dst, len);
> +    if ( rc )
> +        return rc;
> +
> +    return domain_load_end(c);
> +}
> +
> +#define DOMAIN_LOAD_ENTRY(_x, _c, _v, _dst, _len, _exact) \
> +    domain_load_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), (_dst), (_len), \
> +                          (_exact))
> +
> +/*
> + * The 'dry_run' flag indicates that the caller of domain_save() (see
> + * below) is not trying to actually acquire the data, only the size
> + * of the data. The save handler can therefore limit work to only that
> + * which is necessary to call DOMAIN_SAVE_BEGIN/ENTRY() with an accurate
> + * value for '_len'.
> + */
> +typedef int (*domain_save_handler)(const struct vcpu *v,
> +                                   struct domain_context *h,
> +                                   bool dry_run);
> +typedef int (*domain_load_handler)(struct vcpu *v,
> +                                   struct domain_context *h);

Does a load handler have a need to modify struct domain_context?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8771D9701
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 15:04:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb1ue-00046z-7u; Tue, 19 May 2020 13:04:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jb1uc-00046u-8K
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 13:04:02 +0000
X-Inumbo-ID: 3493d952-99d1-11ea-a913-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3493d952-99d1-11ea-a913-12813bfff9fa;
 Tue, 19 May 2020 13:04:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90296AD2A;
 Tue, 19 May 2020 13:04:01 +0000 (UTC)
Subject: Re: [PATCH v3 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1da7ff1-2c3a-02d1-cfa1-18840db37566@suse.com>
Date: Tue, 19 May 2020 15:03:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514104416.16657-2-paul@xen.org>
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

On 14.05.2020 12:44, Paul Durrant wrote:
> --- /dev/null
> +++ b/xen/common/save.c
> @@ -0,0 +1,313 @@
> +/*
> + * save.c: Save and restore PV guest state common to all domain types.
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
> +#include <xen/compile.h>
> +#include <xen/save.h>
> +
> +struct domain_context {
> +    struct domain *domain;
> +    const char *name; /* for logging purposes */

With this comment, why ...

> +    struct domain_save_descriptor desc;
> +    size_t len; /* for internal accounting */
> +    union {
> +        struct domain_save_ops *save;
> +        struct domain_load_ops *load;
> +    } ops;
> +    void *priv;
> +    bool log;

... this separate field? Couldn't "no logging" simply be expressed by
name being NULL?

> +int domain_save_end(struct domain_context *c)
> +{
> +    struct domain *d = c->domain;
> +    uint8_t pad[DOMAIN_SAVE_ALIGN] = {};

Preferably moved into the more narrow scope, and probably wants making
"static const".

> +    size_t len = ROUNDUP(c->len, DOMAIN_SAVE_ALIGN) - c->len; /* padding */
> +    int rc;
> +
> +    if ( len )
> +    {
> +        rc = domain_save_data(c, pad, len);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +    ASSERT(IS_ALIGNED(c->len, DOMAIN_SAVE_ALIGN));

While you mention the auto-padding as a change in v3, it's not really
clear to me why it was introduced. Could you add half a sentence to
the description clarifying the motivation?

> +int domain_save(struct domain *d, struct domain_save_ops *ops, void *priv,
> +                bool dry_run)
> +{
> +    struct domain_context c = {
> +        .domain = d,
> +        .ops.save = ops,
> +        .priv = priv,
> +        .log = !dry_run,
> +    };
> +    static struct domain_save_header h = {

const?

> +        .magic = DOMAIN_SAVE_MAGIC,
> +        .xen_major = XEN_VERSION,
> +        .xen_minor = XEN_SUBVERSION,
> +        .version = DOMAIN_SAVE_VERSION,
> +    };
> +    struct domain_save_end e = {};

const? (static would likely be quite pointless here)

> +int domain_load(struct domain *d, struct domain_load_ops *ops, void *priv)
> +{
> +    struct domain_context c = {
> +        .domain = d,
> +        .ops.load = ops,
> +        .priv = priv,
> +        .log = true,
> +    };
> +    unsigned int instance;
> +    struct domain_save_header h;
> +    int rc;
> +
> +    ASSERT(d != current->domain);
> +
> +    rc = c.ops.load->read(c.priv, &c.desc, sizeof(c.desc));
> +    if ( rc )
> +        return rc;
> +
> +    rc = DOMAIN_LOAD_ENTRY(HEADER, &c, &instance, &h, sizeof(h));
> +    if ( rc )
> +        return rc;
> +
> +    if ( instance || h.magic != DOMAIN_SAVE_MAGIC ||
> +         h.version != DOMAIN_SAVE_VERSION )
> +        return -EINVAL;
> +
> +    domain_pause(d);
> +
> +    for (;;)
> +    {
> +        unsigned int i;
> +        domain_load_handler load;
> +
> +        rc = c.ops.load->read(c.priv, &c.desc, sizeof(c.desc));
> +        if ( rc )
> +            return rc;
> +
> +        rc = -EINVAL;
> +
> +        if ( c.desc.typecode == DOMAIN_SAVE_CODE(END) )
> +        {
> +            struct domain_save_end e;
> +
> +            rc = DOMAIN_LOAD_ENTRY(END, &c, &instance, NULL, sizeof(e));

Without using &e here I don't see how you can get away without an
"unused variable" warning.

> --- /dev/null
> +++ b/xen/include/public/save.h
> @@ -0,0 +1,80 @@
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
> +#ifndef XEN_PUBLIC_SAVE_H
> +#define XEN_PUBLIC_SAVE_H
> +
> +#include "xen.h"
> +
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)

Move #include down below here?

> +/* Entry data is preceded by a descriptor */
> +struct domain_save_descriptor {
> +    uint16_t typecode;
> +
> +    /*
> +     * Instance number of the entry (since there may by multiple of some
> +     * types of entry).

With a German bias I'm inclined to ask: "entries"?

> +     */
> +    uint16_t instance;
> +
> +    /* Entry length not including this descriptor */
> +    uint32_t length;
> +};
> +
> +/*
> + * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
> + * binds these things together.
> + */
> +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> +    struct DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };

Perhaps point out in the comment that this type is not meant to
have instantiations?

> +#define DOMAIN_SAVE_CODE(_x) \
> +    (sizeof(((struct DOMAIN_SAVE_TYPE_##_x *)(0))->c))
> +#define DOMAIN_SAVE_TYPE(_x) \
> +    typeof(((struct DOMAIN_SAVE_TYPE_##_x *)(0))->t)

Feels like I already mentioned the oddity of having parentheses
around a single token that's not a macro parameter name.

> --- /dev/null
> +++ b/xen/include/xen/save.h
> @@ -0,0 +1,165 @@
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
> +#ifndef XEN_SAVE_H
> +#define XEN_SAVE_H
> +
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <public/save.h>
> +
> +struct domain_context;
> +
> +int domain_save_begin(struct domain_context *c, unsigned int typecode,
> +                      const char *name, unsigned int instance);
> +
> +#define DOMAIN_SAVE_BEGIN(_x, _c, _instance) \
> +    domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_instance))

As per prior conversation I would have expected no leading underscores
here anymore, and no parenthesization of what is still _c. More of
these further down.

> +static inline int domain_load_entry(struct domain_context *c,
> +                                    unsigned int typecode, const char *name,
> +                                    unsigned int *instance, void *dst,
> +                                    size_t len)
> +{
> +    int rc;
> +
> +    rc = domain_load_begin(c, typecode, name, instance);

For some reason I've spotted this only here: Why is instance a pointer
parameter of the function, when typecode is a value? Both live next to
one another in struct domain_save_descriptor, and hence instance could
be retrieved at the same time as typecode.

> +/*
> + * Register save and restore handlers. Save handlers will be invoked
> + * in order of DOMAIN_SAVE_CODE().
> + */
> +#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _save, _load)            \
> +    static int __init __domain_register_##_x##_save_restore(void) \
> +    {                                                             \
> +        domain_register_save_type(                                \
> +            DOMAIN_SAVE_CODE(_x),                                 \
> +            #_x,                                                  \
> +            &(_save),                                             \
> +            &(_load));                                            \
> +                                                                  \
> +        return 0;                                                 \
> +    }                                                             \
> +    __initcall(__domain_register_##_x##_save_restore);

I'm puzzled by part of the comment: Invoking by save code looks
reasonable for the saving side (albeit END doesn't match this rule
afaics), but is this going to be good enough for the consuming side?
There may be dependencies between types, and with fixed ordering
there may be no way to insert a depended upon type ahead of an
already defined one (at least as long as the codes are meant to be
stable).

> +/*
> + * Entry points:
> + *
> + * ops:     These are callback functions provided by the caller that will
> + *          be used to write to (in the save case) or read from (in the
> + *          load case) the context buffer. See above for more detail.
> + * priv:    This is a pointer that will be passed to the copy function to
> + *          allow it to identify the context buffer and the current state
> + *          of the save or load operation.
> + * dry_run: If this is set then the caller of domain_save() is only trying
> + *          to acquire the total size of the data, not the data itself.
> + *          In this case the caller may supply different ops to avoid doing
> + *          unnecessary work.
> + */
> +int domain_save(struct domain *d, struct domain_save_ops *ops, void *priv,
> +                bool dry_run);
> +int domain_load(struct domain *d, struct domain_load_ops *ops, void *priv);

I guess ops want to be pointer to const in both cases?

Jan


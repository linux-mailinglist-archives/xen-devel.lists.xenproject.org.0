Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70BB1B12D9
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 19:21:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQa6K-00064D-3X; Mon, 20 Apr 2020 17:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQa6J-000648-3x
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 17:20:55 +0000
X-Inumbo-ID: 4a21a6b2-832b-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a21a6b2-832b-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wtln8GHRDrFjI9qICeSHTb5m0mY3Bd2zyxLBp1qD7nY=; b=u1AzQxl08Qt8ZZMu/QjU9VBc+t
 p/SNU3OtLptbLbg7csIXt5BgprTd7ohzpM6m6lQrQp4FJzdOP/hr5ltKvutkZXAHxcfP3rZf2FO4X
 NXfHy+NiK05deVI3+DPdOj9wS4pOB5jgYxchL+vrpAhqgIwfdMAA3F/LiQ6jAElBJ0tE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQa6A-00027d-Uf; Mon, 20 Apr 2020 17:20:46 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQa6A-0003PY-Di; Mon, 20 Apr 2020 17:20:46 +0000
Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <2f69484c-d043-bded-0a88-2587241aaa94@xen.org>
Date: Mon, 20 Apr 2020 18:20:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 07/04/2020 18:38, Paul Durrant wrote:
> To allow enlightened HVM guests (i.e. those that have PV drivers) to be
> migrated without their co-operation it will be necessary to transfer 'PV'
> state such as event channel state, grant entry state, etc.
> 
> Currently there is a framework (entered via the hvm_save/load() functions)
> that allows a domain's 'HVM' (architectural) state to be transferred but
> 'PV' state is also common with pure PV guests and so this framework is not
> really suitable.
> 
> This patch adds the new public header and low level implementation of a new
> common framework, entered via the domain_save/load() functions. Subsequent
> patches will introduce other parts of the framework, and code that will
> make use of it within the current version of the libxc migration stream.
> 
> This patch also marks the HVM-only framework as deprecated in favour of the
> new framework.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Cc: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v2:
>   - Allow multi-stage save/load to avoid the need to double-buffer
>   - Get rid of the masks and add an 'ignore' flag instead
>   - Create copy function union to preserve const save buffer
>   - Deprecate HVM-only framework
> ---
>   xen/common/Makefile                    |   1 +
>   xen/common/save.c                      | 329 +++++++++++++++++++++++++
>   xen/include/public/arch-arm/hvm/save.h |   5 +
>   xen/include/public/arch-x86/hvm/save.h |   5 +
>   xen/include/public/save.h              |  84 +++++++
>   xen/include/xen/save.h                 | 152 ++++++++++++
>   6 files changed, 576 insertions(+)
>   create mode 100644 xen/common/save.c
>   create mode 100644 xen/include/public/save.h
>   create mode 100644 xen/include/xen/save.h
> 
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index e8cde65370..90553ba5d7 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -37,6 +37,7 @@ obj-y += radix-tree.o
>   obj-y += rbtree.o
>   obj-y += rcupdate.o
>   obj-y += rwlock.o
> +obj-y += save.o
>   obj-y += shutdown.o
>   obj-y += softirq.o
>   obj-y += sort.o
> diff --git a/xen/common/save.c b/xen/common/save.c
> new file mode 100644
> index 0000000000..6cdac3785b
> --- /dev/null
> +++ b/xen/common/save.c
> @@ -0,0 +1,329 @@
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
> +#include <xen/save.h>
> +
> +union domain_copy_entry {
> +    domain_write_entry write;
> +    domain_read_entry read;
> +};
> +
> +struct domain_context {
> +    bool log;
> +    struct domain_save_descriptor desc;
> +    size_t data_len;

What is data_len?

> +    union domain_copy_entry copy;
> +    void *priv;
> +};
> +
> +static struct {
> +    const char *name;
> +    bool per_vcpu;
> +    domain_save_handler save;
> +    domain_load_handler load;
> +} handlers[DOMAIN_SAVE_CODE_MAX + 1];
> +
> +void __init domain_register_save_type(unsigned int tc, const char *name,
> +                                      bool per_vcpu,
> +                                      domain_save_handler save,
> +                                      domain_load_handler load)
> +{
> +    BUG_ON(tc > ARRAY_SIZE(handlers));
> +
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
> +{
> +    int rc;
> +
> +    if ( c->log )
> +        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name,
> +                 (unsigned long)len);

How about using %zu rather than a cast here?

> +
> +    BUG_ON(tc != c->desc.typecode);
> +    BUG_ON(v->vcpu_id != c->desc.vcpu_id);

I can't find any answer on my question about this part. I understand the 
code would be buggy if this happen, but is it warrant to crash the host? 
Couldn't you just return an error and continue to run?

> +
> +    ASSERT(!c->data_len);
> +    c->data_len = c->desc.length = len;
> +
> +    rc = c->copy.write(c->priv, &c->desc, sizeof(c->desc));
> +    if ( rc )
> +        return rc;
> +
> +    c->desc.length = 0;

This is confusing, why would you need to reset c->desc.length but not 
the rest of the fields?

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
> +{
> +    /*
> +     * If desc.length does not match the length specified in
> +     * domain_save_begin(), there should have been more data.
> +     */
> +    if ( c->desc.length != c->data_len )

This suggests you know in advance the size of the record. I have seen 
some cases where we don't know the size in advance. A good example if 
when saving grants. You know the maximum of grant used by the guest but 
you don't know yet the number of grants used. You might need to walk the 
"list" twice or allocate a temporary buffer. None of them are ideal.

Another example is when saving memory, we may want to compact page 
informations to save space.

This problem is going to be more relevant for LiveUpdate where we need 
to be able to create the stream in a very short amount of time. 
Allocating any temporary buffer and/or walking the list twice is going 
to kill the performance.

I would suggest to consider a different approach where you update the 
record length at the end.

FWIW, this below the current approach for the LU stream (IIRC David sent 
a prototype recently). A record is opened using lu_stream_open_record(), 
you then have two way to add data:
     - lu_stream_append() -> This takes a buffer and write to the stream.
     - lu_stream_reserve() -> Pre-allocate space in the stream and 
return a pointer to the beginning of the reserved region.
     - lu_stream_end_reservation() -> Takes the actual size in parameter 
and update the stream size.
     - lu_stream_close_record() -> Update the header with the total 
length and update the position in the stream.

> +        return -EIO;

I noticed that all the pasding check have been dropped. I still think we 
need implicit padding to harden the code.

> +
> +    c->data_len = 0;
> +
> +    return 0;
> +}
> +
> +int domain_save(struct domain *d, domain_write_entry write, void *priv,
> +                bool dry_run)
> +{
> +    struct domain_context c = {
> +        .copy.write = write,
> +        .priv = priv,
> +        .log = !dry_run,
> +    };
> +    struct domain_save_header h = {
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

I can't find an answer to my question about d->is_dying. What if the 
guest die afterwards? What does protect us against domain_kill()?

[...]

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

Same here.


> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> new file mode 100644
> index 0000000000..7e5f8752bd
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

Does this header need to be exposed outside of Xen and the tools?

> +
> +#include "xen.h"
> +
> +/* Each entry is preceded by a descriptor */
> +struct domain_save_descriptor {
> +    uint16_t typecode;
> +    /*
> +     * Each entry will contain either to global or per-vcpu domain state.
> +     * Entries relating to global state should have zero in this field.
> +     */
> +    uint16_t vcpu_id;
> +    uint32_t flags;
> +    /*
> +     * When restoring state this flag can be set in a descriptor to cause
> +     * its content to be ignored.

Could you give examples where you would want to ignore a descriptor?

> +     *
> +     * NOTE: It is invalid to set this flag for HEADER or END records (see
> +     *       below).
> +     */
> +#define _DOMAIN_SAVE_FLAG_IGNORE 0
> +#define DOMAIN_SAVE_FLAG_IGNORE (1u << _DOMAIN_SAVE_FLAG_IGNORE)
> +
> +    /* Entry length not including this descriptor */
> +    uint64_t length;
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
> +
> +/* Terminating entry */
> +struct domain_save_end {};
> +DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);
> +
> +#define DOMAIN_SAVE_MAGIC   0x53415645
> +#define DOMAIN_SAVE_VERSION 0x00000001
> +
> +/* Initial entry */
> +struct domain_save_header {
> +    uint32_t magic;             /* Must be DOMAIN_SAVE_MAGIC */
> +    uint32_t version;           /* Save format version */


I haven't seen any answer about xen version here. For the record:

"Let's imagine in 4.14 we introduced a bug in the saving part. This is
solved in 4.15 but somehow the version is not bumped. How would you
differentiate the streams saved by Xen 4.14 so you can still migrate?

If you record the version of Xen in the record automatically, then you
at least have a way to differentiate the two versions."

Cheers,

-- 
Julien Grall


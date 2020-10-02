Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18088281D88
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 23:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2346.6950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOSTe-0005Vp-GP; Fri, 02 Oct 2020 21:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2346.6950; Fri, 02 Oct 2020 21:20:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOSTe-0005VQ-CQ; Fri, 02 Oct 2020 21:20:30 +0000
Received: by outflank-mailman (input) for mailman id 2346;
 Fri, 02 Oct 2020 21:20:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kOSTd-0005VL-3t
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 21:20:29 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f131e32-399d-4791-838b-c7ea291a6ecf;
 Fri, 02 Oct 2020 21:20:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iJBK=DJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kOSTd-0005VL-3t
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 21:20:29 +0000
X-Inumbo-ID: 6f131e32-399d-4791-838b-c7ea291a6ecf
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6f131e32-399d-4791-838b-c7ea291a6ecf;
	Fri, 02 Oct 2020 21:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601673627;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=81XjHYrAMvgypDyL5q0TaY41Xh6Ind6YN24lhcqH4Bw=;
  b=K2F5lFgsAl5jOMs4cqQLxictIeK9ZEnRR3Hd4aRbBbvAkQ/xa9MHUHSJ
   SMj84nCFJ5e6X4ZZjrtZVrWZ+221IUjD4SKDhQYmmzk2bPmgzPTeZNisb
   IdG66AFLNjUzIROGugLSBKhf0+DHtX+A7uAw5NUPwke6PfBqS2aYF6BTG
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CIJKWBY5sMVNEPxYNoEd7mxy2meVTX3cwE0Y1ZQBjItqGSUNANK+q9utXgy1Td7NKuVrkSB3ey
 bKmrHp2L6zR64uBMWIfjml5ygr6/HmPDWj5ZAdfRcRGViS2SNHP7vsBd/22HWE0Hp8b92YV9oL
 h7T3BrvG4rOhfLVUAjcUcrA7VKqsWVXwV1lDC312goNGrOeq6FxnupoSAVSw98PjVfLYsIA7cy
 9l6lpfFlQvCng5hYGdQstmMpoYsYHqIMJ6jt5DNcUNXh8IyCNS6DF1G/Wuw1CPyNtz4ADzqDJ3
 muc=
X-SBRS: None
X-MesageID: 28196970
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,329,1596513600"; 
   d="scan'208";a="28196970"
Subject: Re: [PATCH v9 1/8] xen/common: introduce a new framework for
 save/restore of 'domain' context
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Julien Grall <julien@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <ian.jackson@eu.citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <20200924131030.1876-1-paul@xen.org>
 <20200924131030.1876-2-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2e51a5cb-df0c-d564-2a7b-5f2abbb5872c@citrix.com>
Date: Fri, 2 Oct 2020 22:20:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924131030.1876-2-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)

On 24/09/2020 14:10, Paul Durrant wrote:
> diff --git a/xen/common/save.c b/xen/common/save.c
> new file mode 100644
> index 0000000000..841c4d0e4e
> --- /dev/null
> +++ b/xen/common/save.c
> @@ -0,0 +1,315 @@
> +/*
> + * save.c: Save and restore PV guest state common to all domain types.

This description will be stale by the time your work is complete.

> +int domain_save_data(struct domain_context *c, const void *src, size_t len)
> +{
> +    int rc = c->ops.save->append(c->priv, src, len);
> +
> +    if ( !rc )
> +        c->len += len;
> +
> +    return rc;
> +}
> +
> +#define DOMAIN_SAVE_ALIGN 8

This is part of the stream ABI.

> +
> +int domain_save_end(struct domain_context *c)
> +{
> +    struct domain *d = c->domain;
> +    size_t len = ROUNDUP(c->len, DOMAIN_SAVE_ALIGN) - c->len; /* padding */

DOMAIN_SAVE_ALIGN - (c->len & (DOMAIN_SAVE_ALIGN - 1))

isn't vulnerable to overflow.

> +    int rc;
> +
> +    if ( len )
> +    {
> +        static const uint8_t pad[DOMAIN_SAVE_ALIGN] = {};
> +
> +        rc = domain_save_data(c, pad, len);
> +
> +        if ( rc )
> +            return rc;
> +    }
> +    ASSERT(IS_ALIGNED(c->len, DOMAIN_SAVE_ALIGN));
> +
> +    if ( c->name )
> +        gdprintk(XENLOG_INFO, "%pd save: %s[%u] +%zu (-%zu)\n", d, c->name,
> +                 c->desc.instance, c->len, len);

IMO, this is unhelpful to print out.  It also appears to be the only use
of the c->name field.

It also creates obscure and hard to follow logic based on dry_run.

> diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> new file mode 100644
> index 0000000000..551dbbddb8
> --- /dev/null
> +++ b/xen/include/public/save.h
> @@ -0,0 +1,89 @@
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
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +#include "xen.h"
> +
> +/* Entry data is preceded by a descriptor */
> +struct domain_save_descriptor {
> +    uint16_t typecode;
> +
> +    /*
> +     * Instance number of the entry (since there may be multiple of some
> +     * types of entries).
> +     */
> +    uint16_t instance;
> +
> +    /* Entry length not including this descriptor */
> +    uint32_t length;
> +};
> +
> +/*
> + * Each entry has a type associated with it. DECLARE_DOMAIN_SAVE_TYPE
> + * binds these things together, although it is not intended that the
> + * resulting type is ever instantiated.
> + */
> +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> +    struct DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
> +
> +#define DOMAIN_SAVE_CODE(_x) \
> +    (sizeof(((struct DOMAIN_SAVE_TYPE_##_x *)0)->c))
> +#define DOMAIN_SAVE_TYPE(_x) \
> +    typeof(((struct DOMAIN_SAVE_TYPE_##_x *)0)->t)

I realise this is going to make me very unpopular, but NACK.

This is straight up obfuscation with no redeeming properties.  I know
you've copied it from the exist HVMCONTEXT infrastructure, but it is
obnoxious to use there (particularly in the domain builder) and not an
example wanting copying.

Furthermore, the code will be simpler and easier to follow without it.

Secondly, and more importantly, I do not see anything in docs/specs/
describing the binary format of this stream,  and I'm going to insist
that one appears, ahead of this patch in the series.

In doing so, you're hopefully going to discover the bug with the older
HVMCONTEXT stream which makes the version field fairly pointless (more
below).

It should describe how to forward compatibly extend the stream, and
under what circumstances the version number can/should change.  It also
needs to describe the alignment and extending rules which ...

> +
> +/*
> + * All entries will be zero-padded to the next 64-bit boundary when saved,
> + * so there is no need to include trailing pad fields in structure
> + * definitions.
> + * When loading, entries will be zero-extended if the load handler reads
> + * beyond the length specified in the descriptor.
> + */

... shouldn't be this.

The current zero extending property was an emergency hack to fix an ABI
breakage which had gone unnoticed for a couple of releases.  The work to
implement it created several very hard to debug breakages in Xen.

A properly designed stream shouldn't need auto-extending behaviour, and
the legibility of the code is improved by not having it.

It is a trick which can stay up your sleeve for an emergency, in the
hope you'll never have to use it.

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
> +    uint32_t magic;                /* Must be DOMAIN_SAVE_MAGIC */
> +    uint16_t xen_major, xen_minor; /* Xen version */
> +    uint32_t version;              /* Save format version */
> +};
> +DECLARE_DOMAIN_SAVE_TYPE(HEADER, 1, struct domain_save_header);

The layout problem with the stream is the fact that this header doesn't
come first.

In the eventual future where uint16_t won't be sufficient for instance,
and uint32_t might not be sufficient for len, the version number is
going to have to be bumped, in order to change the descriptor layout.


Overall, this patch needs to be a minimum of two.  First a written
document which is the authoritative stream ABI, and the second which is
this implementation.  The header describing the stream format should not
be substantively different from xg_sr_stream_format.h

~Andrew

P.S. Another good reason for having extremely simple header files is for
the poor sole trying to write a Go/Rust/other binding for this in some
likely not-to-distant future.


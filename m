Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870F77D6FF
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 02:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584147.914600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW4Fl-00009v-Ep; Wed, 16 Aug 2023 00:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584147.914600; Wed, 16 Aug 2023 00:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW4Fl-00008A-Av; Wed, 16 Aug 2023 00:19:13 +0000
Received: by outflank-mailman (input) for mailman id 584147;
 Wed, 16 Aug 2023 00:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vYs=EB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qW4Fj-000084-5S
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 00:19:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83ae5799-3bca-11ee-8776-cb3800f73035;
 Wed, 16 Aug 2023 02:19:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B5B626370A;
 Wed, 16 Aug 2023 00:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21AEC433C8;
 Wed, 16 Aug 2023 00:19:04 +0000 (UTC)
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
X-Inumbo-ID: 83ae5799-3bca-11ee-8776-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692145146;
	bh=DfOFoL0liQgxTIxrGZTx4i3Hf4t1wTeXEA/ZgN5hlyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zq4NNwz2/i6QhAJb7Dx69xXWhSAnwHINyI+ZCH0YVYW629n8RA8kAEZKGgAI4cd96
	 wX7TA0UTA6qS0VaPwy+T2zBHMgBfDCkVnk/tmgojJ/HWs6+Zw2x096if3LsWwDd782
	 ubX0rJGpj05JiQ4o28JgHwsS4DGdPvGvdTD+bUUwIySmn0AVxnEf2E39/jDi6I1/kq
	 W+XS3IbsmWli7vIYGzaqffbqf/Lz04yY0N/HyWsFBoS0NJKh6asMyx3dMDFHfhHIFb
	 ZztMaPxoLkleCfO1KRYyH/pCLYnRao71sZp9cegN1ZjwaP3XdTX1WNdEnwu1Mz/HXu
	 tIHhUTI7CqHlQ==
Date: Tue, 15 Aug 2023 17:19:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jason Andryuk <jandryuk@gmail.com>, 
    George Dunlap <George.Dunlap@eu.citrix.com>, 
    Jan Beulich <JBeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, 
    Daniel Smith <dpsmith@apertussolutions.com>, 
    Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v3 02/10] xen/version: Introduce non-truncating
 deterministically-signed XENVER_* subops
In-Reply-To: <20230815210650.2735671-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2308151708070.6458@ubuntu-linux-20-04-desktop>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com> <20230815210650.2735671-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Aug 2023, Andrew Cooper wrote:
> Recently in XenServer, we have encountered problems caused by both
> XENVER_extraversion and XENVER_commandline having fixed bounds.
> 
> More than just the invariant size, the APIs/ABIs also broken by typedef-ing an
> array, and using an unqualified 'char' which has implementation-specific
> signed-ness.
> 
> Provide brand new ops, which are capable of expressing variable length
> strings, and mark the older ops as broken.
> 
> This fixes all issues around XENVER_extraversion being longer than 15 chars.
> Further work beyond just this API is needed to remove other assumptions about
> XENVER_commandline being 1023 chars long.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Daniel De Graaf <dgdegra@tycho.nsa.gov>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
> CC: Jason Andryuk <jandryuk@gmail.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> 
> v3:
>  * Modify dummy.h's xsm_xen_version() in the same way as flask.
> v2:
>  * Remove xen_capabilities_info_t from the stack now that arch_get_xen_caps()
>    has gone.
>  * Use an arbitrary limit check much lower than INT_MAX.
>  * Use "buf" rather than "string" terminology.
>  * Expand the API comment.
> 
> Tested by forcing XENVER_extraversion to be 20 chars long, and confirming that
> an untruncated version can be obtained.
> ---
>  xen/common/kernel.c          | 62 +++++++++++++++++++++++++++++++++++
>  xen/include/public/version.h | 63 ++++++++++++++++++++++++++++++++++--
>  xen/include/xlat.lst         |  1 +
>  xen/include/xsm/dummy.h      |  3 ++
>  xen/xsm/flask/hooks.c        |  4 +++
>  5 files changed, 131 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index f822480a8ef3..79c008c7ee5f 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -24,6 +24,7 @@
>  CHECK_build_id;
>  CHECK_compile_info;
>  CHECK_feature_info;
> +CHECK_varbuf;
>  #endif
>  
>  enum system_state system_state = SYS_STATE_early_boot;
> @@ -498,6 +499,59 @@ static int __init cf_check param_init(void)
>  __initcall(param_init);
>  #endif
>  
> +static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    struct xen_varbuf user_str;
> +    const char *str = NULL;
> +    size_t sz;
> +
> +    switch ( cmd )
> +    {
> +    case XENVER_extraversion2:
> +        str = xen_extra_version();
> +        break;
> +
> +    case XENVER_changeset2:
> +        str = xen_changeset();
> +        break;
> +
> +    case XENVER_commandline2:
> +        str = saved_cmdline;
> +        break;
> +
> +    case XENVER_capabilities2:
> +        str = xen_cap_info;
> +        break;
> +
> +    default:
> +        ASSERT_UNREACHABLE();
> +        return -ENODATA;
> +    }
> +
> +    sz = strlen(str);
> +
> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
> +        return -E2BIG;

Realistically do we want this buffer to cross page boundaries? We could
use KB(4) here or even KB(4)-4 (size of len).



> +    if ( guest_handle_is_null(arg) ) /* Length request */
> +        return sz;
> +
> +    if ( copy_from_guest(&user_str, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( user_str.len == 0 )
> +        return -EINVAL;
> +
> +    if ( sz > user_str.len )
> +        return -ENOBUFS;
> +
> +    if ( copy_to_guest_offset(arg, offsetof(struct xen_varbuf, buf),
> +                              str, sz) )
> +        return -EFAULT;
> +
> +    return sz;
> +}
> +
>  long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      bool_t deny = !!xsm_xen_version(XSM_OTHER, cmd);
> @@ -711,6 +765,14 @@ long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>  
>          return sz;
>      }
> +
> +    case XENVER_extraversion2:
> +    case XENVER_capabilities2:
> +    case XENVER_changeset2:
> +    case XENVER_commandline2:
> +        if ( deny )
> +            return -EPERM;
> +        return xenver_varbuf_op(cmd, arg);
>      }
>  
>      return -ENOSYS;
> diff --git a/xen/include/public/version.h b/xen/include/public/version.h
> index cbc4ef7a46e6..0dd6bbcb43cc 100644
> --- a/xen/include/public/version.h
> +++ b/xen/include/public/version.h
> @@ -19,12 +19,20 @@
>  /* arg == NULL; returns major:minor (16:16). */
>  #define XENVER_version      0
>  
> -/* arg == xen_extraversion_t. */
> +/*
> + * arg == xen_extraversion_t.
> + *
> + * This API/ABI is broken.  Use XENVER_extraversion2 where possible.

Like Jan and Julien I also don't like the word "broken" especially
without explanation of why it is broken next to it.

Instead, I would say:

"XENVER_extraversion is deprecated. Please use XENVER_extraversion2."

If you want to convey the message that the API has problems, then I would
say:

"XENVER_extraversion might cause truncation. Please use XENVER_extraversion2."

Or even:

"XENVER_extraversion has problems. Please use XENVER_extraversion2."



> + */
>  #define XENVER_extraversion 1
>  typedef char xen_extraversion_t[16];
>  #define XEN_EXTRAVERSION_LEN (sizeof(xen_extraversion_t))
>  
> -/* arg == xen_compile_info_t. */
> +/*
> + * arg == xen_compile_info_t.
> + *
> + * This API/ABI is broken and truncates data.

"XENVER_compile_info is deprecated and can truncate data."


> + */
>  #define XENVER_compile_info 2
>  struct xen_compile_info {
>      char compiler[64];
> @@ -34,10 +42,20 @@ struct xen_compile_info {
>  };
>  typedef struct xen_compile_info xen_compile_info_t;
>  
> +/*
> + * arg == xen_capabilities_info_t.
> + *
> + * This API/ABI is broken.  Use XENVER_capabilities2 where possible.

"XENVER_capabilities is deprecated. Please use XENVER_capabilities2."


> + */
>  #define XENVER_capabilities 3
>  typedef char xen_capabilities_info_t[1024];
>  #define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
>  
> +/*
> + * arg == xen_changeset_info_t.
> + *
> + * This API/ABI is broken.  Use XENVER_changeset2 where possible.

"XENVER_changeset is deprecated. Please use XENVER_changeset2."


> + */
>  #define XENVER_changeset 4
>  typedef char xen_changeset_info_t[64];
>  #define XEN_CHANGESET_INFO_LEN (sizeof(xen_changeset_info_t))
> @@ -95,6 +113,11 @@ typedef struct xen_feature_info xen_feature_info_t;
>   */
>  #define XENVER_guest_handle 8
>  
> +/*
> + * arg == xen_commandline_t.
> + *
> + * This API/ABI is broken.  Use XENVER_commandline2 where possible.

"XENVER_commandline is deprecated. Please use XENVER_commandline2."


> + */
>  #define XENVER_commandline 9
>  typedef char xen_commandline_t[1024];
>  
> @@ -110,6 +133,42 @@ struct xen_build_id {
>  };
>  typedef struct xen_build_id xen_build_id_t;
>  
> +/*
> + * Container for an arbitrary variable length buffer.
> + */
> +struct xen_varbuf {
> +    uint32_t len;                          /* IN:  size of buf[] in bytes. */
> +    unsigned char buf[XEN_FLEX_ARRAY_DIM]; /* OUT: requested data.         */

I realize that you just copied struct xen_build_id but I recall from
MISRA C training that we should use plain "char" for strings for good
reasons, not "unsigned char"?

If this is meant to be generic data, I think we should use uint8_t
instead.


> +};
> +typedef struct xen_varbuf xen_varbuf_t;
> +
> +/*
> + * arg == xen_varbuf_t
> + *
> + * Equivalent to the original ops, but with a non-truncating API/ABI.
> + *
> + * These hypercalls can fail for a number of reasons.  All callers must handle
> + * -XEN_xxx return values appropriately.
> + *
> + * Passing arg == NULL is a request for size, which will be signalled with a
> + * non-negative return value.  Note: a return size of 0 may be legitimate for
> + * the requested subop.
> + *
> + * Otherwise, the input xen_varbuf_t provides the size of the following
> + * buffer.  Xen will fill the buffer, and return the number of bytes written
> + * (e.g. if the input buffer was longer than necessary).
> + *
> + * Some subops may return binary data.  Some subops may be expected to return
> + * textural data.  These are returned without a NUL terminator, and while the
> + * contents is expected to be ASCII/UTF-8, Xen makes no guarentees to this
> + * effect.  e.g. Xen has no control over the formatting used for the command
> + * line.
> + */
> +#define XENVER_extraversion2 11
> +#define XENVER_capabilities2 12
> +#define XENVER_changeset2    13
> +#define XENVER_commandline2  14
> +
>  #endif /* __XEN_PUBLIC_VERSION_H__ */
>  
>  /*


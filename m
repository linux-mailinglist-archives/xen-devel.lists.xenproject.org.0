Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886B87FFE79
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 23:30:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645176.1007137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8pXv-0004GJ-8f; Thu, 30 Nov 2023 22:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645176.1007137; Thu, 30 Nov 2023 22:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8pXv-0004DC-5L; Thu, 30 Nov 2023 22:30:11 +0000
Received: by outflank-mailman (input) for mailman id 645176;
 Thu, 30 Nov 2023 22:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SKhV=HL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8pXu-0004D4-8J
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 22:30:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 042f8062-8fd0-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 23:30:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7FB65B8466B;
 Thu, 30 Nov 2023 22:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8522AC433C7;
 Thu, 30 Nov 2023 22:30:05 +0000 (UTC)
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
X-Inumbo-ID: 042f8062-8fd0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701383406;
	bh=6sfbdEBXOq2QxiQeJ3hEcfPlVY3gue2J5kdPIMlcSiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kSUS1t5p0OSNXBkCSDsf7gNS//DdHHIN5qV2xJBTz3AH+hi1wCTcH0j+c1EA7JmJE
	 kcburQkoJMgazC2Mh0B1h4RF0ZtQpAkkxeOZzHtPTM24n2NCWqZdIr+Zc70su4koZB
	 1ShERq5vSeV+QnPQiMWsMWFzNOu172ktsOObcncLrBckdXOyFbbyPZyf8p4pEOSheO
	 XpW2Nzwi78aKpxcNTHUB6l5+ZldwyP1xd/iq8EPCH2kZMuOIDdI348vwBUusnOv43a
	 mgj7N5SMy+8SQ7aibVbn5AfYPvjeDkmES3Ns+AdXNCMr3/+QWzWTtpjqPRwUVWnTxC
	 2XVwjVROrIIfQ==
Date: Thu, 30 Nov 2023 14:30:04 -0800 (PST)
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
Message-ID: <alpine.DEB.2.22.394.2311301429030.110490@ubuntu-linux-20-04-desktop>
References: <20230815210650.2735671-1-andrew.cooper3@citrix.com> <20230815210650.2735671-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi everyone following this thread,

please see:
https://marc.info/?l=xen-devel&m=170135718323946
https://cryptpad.fr/form/#/2/form/view/7ByH95Vd7KiDOvN4wjV5iUGlMuZbkVdwk7cYpZdluWo/

For a vote on the usage of the word "broken"


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
> +
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
> + */
>  #define XENVER_capabilities 3
>  typedef char xen_capabilities_info_t[1024];
>  #define XEN_CAPABILITIES_INFO_LEN (sizeof(xen_capabilities_info_t))
>  
> +/*
> + * arg == xen_changeset_info_t.
> + *
> + * This API/ABI is broken.  Use XENVER_changeset2 where possible.
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
> diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
> index 9c41948514bf..a61ba85ed0ca 100644
> --- a/xen/include/xlat.lst
> +++ b/xen/include/xlat.lst
> @@ -173,6 +173,7 @@
>  ?	build_id                        version.h
>  ?	compile_info                    version.h
>  ?	feature_info                    version.h
> +?	varbuf                          version.h
>  ?	xenoprof_init			xenoprof.h
>  ?	xenoprof_passive		xenoprof.h
>  ?	flask_access			xsm/flask_op.h
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 8671af1ba4d3..a4a920f74e6e 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -828,9 +828,12 @@ static XSM_INLINE int cf_check xsm_xen_version(XSM_DEFAULT_ARG uint32_t op)
>          block_speculation();
>          return 0;
>      case XENVER_extraversion:
> +    case XENVER_extraversion2:
>      case XENVER_compile_info:
>      case XENVER_capabilities:
> +    case XENVER_capabilities2:
>      case XENVER_changeset:
> +    case XENVER_changeset2:
>      case XENVER_pagesize:
>      case XENVER_guest_handle:
>          /* These MUST always be accessible to any guest by default. */
> diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
> index 78225f68c15c..a671dcd0322e 100644
> --- a/xen/xsm/flask/hooks.c
> +++ b/xen/xsm/flask/hooks.c
> @@ -1777,15 +1777,18 @@ static int cf_check flask_xen_version(uint32_t op)
>          /* These sub-ops ignore the permission checks and return data. */
>          return 0;
>      case XENVER_extraversion:
> +    case XENVER_extraversion2:
>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>                              VERSION__XEN_EXTRAVERSION, NULL);
>      case XENVER_compile_info:
>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>                              VERSION__XEN_COMPILE_INFO, NULL);
>      case XENVER_capabilities:
> +    case XENVER_capabilities2:
>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>                              VERSION__XEN_CAPABILITIES, NULL);
>      case XENVER_changeset:
> +    case XENVER_changeset2:
>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>                              VERSION__XEN_CHANGESET, NULL);
>      case XENVER_pagesize:
> @@ -1795,6 +1798,7 @@ static int cf_check flask_xen_version(uint32_t op)
>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>                              VERSION__XEN_GUEST_HANDLE, NULL);
>      case XENVER_commandline:
> +    case XENVER_commandline2:
>          return avc_has_perm(dsid, SECINITSID_XEN, SECCLASS_VERSION,
>                              VERSION__XEN_COMMANDLINE, NULL);
>      case XENVER_build_id:
> -- 
> 2.30.2
> 


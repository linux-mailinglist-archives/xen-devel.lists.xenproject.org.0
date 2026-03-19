Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMG3It/Du2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:37:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D9E2C8CAF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:37:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256816.1551291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39QD-0005Lc-HD; Thu, 19 Mar 2026 09:12:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256816.1551291; Thu, 19 Mar 2026 09:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39QD-0005Jv-Eg; Thu, 19 Mar 2026 09:12:05 +0000
Received: by outflank-mailman (input) for mailman id 1256816;
 Thu, 19 Mar 2026 09:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87pI=BT=bounce.vates.tech=bounce-md_30504962.69bbbdd8.v1-b0dfe5df6971463e95e172018731a3bd@srs-se1.protection.inumbo.net>)
 id 1w39QB-0005Jp-Ru
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:12:03 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab623216-2373-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 10:11:53 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fc0Lw0ybJz5Qkc82
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 09:11:52 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b0dfe5df6971463e95e172018731a3bd; Thu, 19 Mar 2026 09:11:52 +0000
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
X-Inumbo-ID: ab623216-2373-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773911512; x=1774181512;
	bh=JvP1c2ZHvz34dlQCj7CZVGcRmuz4UzHgCVvcx7e4N2w=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rgYnl/O1vMU4rwTJ7Z5xgzLEKuuxiO/ERDAULp54n9PjRjgkRjRecpJ0yKaC+kksP
	 O51wz6jC32joXWgpOn7XXrJbBw7MfonjsO0ZzcVvIAtVx0HHK1JnqHyaoqm87j7XMP
	 1x9uVOqyNCqzyPEiIse4s595K2Ypx8uGHV3HJmRFmFZLJvDILdKnEkLpZVYzIsJBvI
	 +jvGazaIRXjMO3jep9ev+c/zWtIDT8zkpVVOtEzG6QxeMzzndMeu742VFqcJ+eawAB
	 1UY+J/4tjzBR3tlzuctRcI1BZuMunmyldBkOtrfjQe7vhqRoSMmZinmEoYv/IrRgCN
	 ndMliAxj8VPmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773911512; x=1774172012; i=anthony.perard@vates.tech;
	bh=JvP1c2ZHvz34dlQCj7CZVGcRmuz4UzHgCVvcx7e4N2w=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ISgTB1QVIqvnOoD9zImwNLjHbUoFkMBxV5Uh0Z1PoAMFYH6THazyAfHSa1m5f2khV
	 zz/KY5nLvXx1tZ74y6ItuwlqEGuKOcTsPAmRiidTN1MBC9OH3NG4jxp0smNXGcayG/
	 RqsSMtuYLkbKvPIc8lTUuOynCdjstNkeSBhTGgmgIk9Y/RcSsGx5ZYMGzGvS5Er8v1
	 eIauNRSa5k1HtZgxp3eR0wbrK5/FJozjPZSKgu/frMj/WG6DvcjLzDs+3CfdbNTqrK
	 KdH1hRJ1d7NC+uF5QRjmwmJ7XXY5Voyp/jzXQPSO4yO1zgOXOVXp9EieiWVzqQtmay
	 /sg4xYcGOkbGw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2008/11]=20tools/libxl:=20add=20functions=20for=20retrieving=20and=20setting=20xenstore=20quota?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773911511551
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Nick Rosbrook" <enr0n@ubuntu.com>, "George Dunlap" <gwd@xenproject.org>
Message-Id: <abu9165dr7LfLfJf@l14>
References: <20260305135208.2208663-1-jgross@suse.com> <20260305135208.2208663-9-jgross@suse.com>
In-Reply-To: <20260305135208.2208663-9-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b0dfe5df6971463e95e172018731a3bd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260319:md
Date: Thu, 19 Mar 2026 09:11:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.01 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:url,mandrillapp.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:enr0n@ubuntu.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	NEURAL_SPAM(0.00)[0.836];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E9D9E2C8CAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 05, 2026 at 02:52:05PM +0100, Juergen Gross wrote:
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index bc35e412da..a70d9d347f 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1537,6 +1537,18 @@ void libxl_mac_copy(libxl_ctx *ctx, libxl_mac *dst, const libxl_mac *src);
>   */
>  #define LIBXL_HAVE_XEN_PLATFORM_PCI_BAR_UC
>  
> +/*
> + * LIBXL_HAVE_XENSTORE_QUOTA
> + *
> + * If this is defined the Xenstore quota related functions
> + * libxl_xsquota_global_get()
> + * libxl_xsquota_global_set()
> + * libxl_xsquota_domain_get()
> + * libxl_xsquota_domain_set()
> + * are available.
> + */
> +#define LIBXL_HAVE_XENSTORE_QUOTA
> +
>  typedef char **libxl_string_list;
>  void libxl_string_list_dispose(libxl_string_list *sl);
>  int libxl_string_list_length(const libxl_string_list *sl);
> @@ -3011,6 +3023,14 @@ static inline int libxl_qemu_monitor_command_0x041200(libxl_ctx *ctx,
>  #define libxl_qemu_monitor_command libxl_qemu_monitor_command_0x041200
>  #endif
>  
> +/* Get/set global and per-domain Xenstore quota. */
> +int libxl_xsquota_global_get(libxl_ctx *ctx, libxl_xs_quota_set *q);

Could you rename the second arg as "q_r" or "q_out" ?

> +int libxl_xsquota_global_set(libxl_ctx *ctx, libxl_xs_quota_set *q);
> +int libxl_xsquota_domain_get(libxl_ctx *ctx, uint32_t domid,
> +                             libxl_xs_quota_set *q);

Same here.

> +int libxl_xsquota_domain_set(libxl_ctx *ctx, uint32_t domid,
> +                             libxl_xs_quota_set *q);

Could we prefix them all with "libxl_xs_quota_" ? I would rather that we
only use "xs_quota" or "xsquota".

> +
>  #include <libxl_event.h>
>  
>  /*
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index bc60c46558..ca22a40c6c 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -106,6 +106,7 @@ OBJS-y += libxl_pvcalls.o
>  OBJS-y += libxl_vsnd.o
>  OBJS-y += libxl_vkb.o
>  OBJS-y += libxl_virtio.o
> +OBJS-y += libxl_xsquota.o
>  OBJS-y += libxl_genid.o
>  OBJS-y += _libxl_types.o
>  OBJS-y += libxl_flask.o
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index d64a573ff3..c5ddc40f35 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -574,6 +574,15 @@ libxl_altp2m_mode = Enumeration("altp2m_mode", [
>      (3, "limited"),
>      ], init_val = "LIBXL_ALTP2M_MODE_DISABLED")
>  
> +libxl_xs_quota_item = Struct("xs_quota_item", [
> +    ("name", string),
> +    ("val",  uint32),
> +    ])
> +
> +libxl_xs_quota_set = Struct("xs_quota_set", [

Could you use "_list" as a suffix instead? It's a bit confusing to have
the word "set" as a double meaning, with a _set() function that takes a
set.

> +    ("quota", Array(libxl_xs_quota_item, "num_quota"))
> +    ])
> +
>  libxl_domain_build_info = Struct("domain_build_info",[
>      ("max_vcpus",       integer),
>      ("avail_vcpus",     libxl_bitmap),
> diff --git a/tools/libs/light/libxl_xsquota.c b/tools/libs/light/libxl_xsquota.c
> new file mode 100644
> index 0000000000..b9afa1c914
> --- /dev/null
> +++ b/tools/libs/light/libxl_xsquota.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: LGPL-2.1-only */
> +
> +/* Xenstore quota handling functions. */
> +
> +#include "libxl_internal.h"
> +
> +static int get_quota(libxl_ctx *ctx, unsigned int domid, libxl_xs_quota_set *q,
> +                     bool (func)(struct xs_handle *h, unsigned int domid,
> +                                 char *quota, unsigned int *value))
> +{
> +    char **names;
> +    unsigned int num, i;
> +    int rc = 0;

We don't init `rc` variable in libxl function. Set `rc` to 0 just before
the "out" label.

> +    GC_INIT(ctx);
> +
> +    names = xs_get_quota_names(ctx->xsh, &num);
> +    if (!names) {
> +        /* Xenstore quota support is optional! */
> +        if (errno != ENOSYS)
> +            rc = ERROR_FAIL;
> +        q->num_quota = 0;

It feels wrong to make changes to the output argument on error, if we
can avoid it. And here, I don't see any reason to change `q`.

> +        goto out;
> +    }
> +

Can you call libxl_xs_quota_set_init() first? As you call _dispose()
later.

> +    q->num_quota = num;
> +    q->quota = libxl__calloc(NOGC, num, sizeof(*q->quota));
> +    for (i = 0; i < num; i++) {
> +        q->quota[i].name = libxl__strdup(NOGC, names[i]);
> +        if (!func(ctx->xsh, domid, q->quota[i].name, &q->quota[i].val)) {

Could you store the return value of `func()` in `ok`, and test `ok` in the
if instead?

> +            libxl_xs_quota_set_dispose(q);
> +            rc = ERROR_FAIL;
> +            break;

This can be `goto out` once free(names) is moved to the out label.

> +        }
> +    }
> +
> +    free(names);

Could you do that after the "out" label? And init `names` to NULL.

> +
> + out:
> +    GC_FREE;
> +    return rc;
> +}
> +
> +static int set_quota(libxl_ctx *ctx, unsigned int domid, libxl_xs_quota_set *q,
> +                     bool (func)(struct xs_handle *h, unsigned int domid,
> +                                 char *quota, unsigned int value))
> +{
> +    unsigned int i;
> +    int rc = 0;
> +    GC_INIT(ctx);
> +
> +    for (i = 0; i < q->num_quota; i++) {
> +        if (!func(ctx->xsh, domid, q->quota[i].name, q->quota[i].val)) {
> +            rc = ERROR_FAIL;
> +            break;

It would be better to write `goto out` instead.

> +        }
> +    }
> +
> +    GC_FREE;
> +    return rc;
> +}

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



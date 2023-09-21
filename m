Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BCF7A92BE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 10:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606214.943980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFHE-0001C9-N1; Thu, 21 Sep 2023 08:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606214.943980; Thu, 21 Sep 2023 08:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjFHE-00019h-Jt; Thu, 21 Sep 2023 08:43:12 +0000
Received: by outflank-mailman (input) for mailman id 606214;
 Thu, 21 Sep 2023 08:43:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BtKi=FF=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qjFHC-00019Y-S2
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 08:43:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e393fc64-585a-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 10:43:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-y9yC9AFJMomrr9msxjQjNg-1; Thu, 21 Sep 2023 04:43:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB882803497;
 Thu, 21 Sep 2023 08:43:01 +0000 (UTC)
Received: from redhat.com (dhcp-192-199.str.redhat.com [10.33.192.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7471020268D5;
 Thu, 21 Sep 2023 08:42:58 +0000 (UTC)
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
X-Inumbo-ID: e393fc64-585a-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695285788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWLMZ+X5Hd+F/5mLyFftJEP9/PMaQw/y62tEWzEwLSU=;
	b=URz39XSosnRz5kYYbUZ5XxJKnbp3WuM0aXZSnj/9wWIzYMiOeim/Iim0boMdTHueywgdFF
	64IpaxgZWMmTXBqxJo3U/G5c2T9KdyS/GP+6fDYGmvK9akkqU8x+vgpYcFeiMVU257UrEl
	LeNFLym/KvoX+LUR7UkzjOAKi05Q6zc=
X-MC-Unique: y9yC9AFJMomrr9msxjQjNg-1
Date: Thu, 21 Sep 2023 10:42:57 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, eblake@redhat.com,
	vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com,
	pl@kamp.de, sw@weilnetz.de, sstabellini@kernel.org,
	anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com,
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
	philmd@linaro.org, stefanha@redhat.com, fam@euphon.net,
	quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
	kraxel@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH v2 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Message-ID: <ZQwCEW4SBpI9f1Yx@redhat.com>
References: <20230920183149.1105333-1-armbru@redhat.com>
 <20230920183149.1105333-8-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920183149.1105333-8-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Am 20.09.2023 um 20:31 hat Markus Armbruster geschrieben:
> Variables declared in macros can shadow other variables.  Much of the
> time, this is harmless, e.g.:
> 
>     #define _FDT(exp)                                                  \
>         do {                                                           \
>             int ret = (exp);                                           \
>             if (ret < 0) {                                             \
>                 error_report("error creating device tree: %s: %s",   \
>                         #exp, fdt_strerror(ret));                      \
>                 exit(1);                                               \
>             }                                                          \
>         } while (0)
> 
> Harmless shadowing in h_client_architecture_support():
> 
>         target_ulong ret;
> 
>         [...]
> 
>         ret = do_client_architecture_support(cpu, spapr, vec, fdt_bufsize);
>         if (ret == H_SUCCESS) {
>             _FDT((fdt_pack(spapr->fdt_blob)));
>             [...]
>         }
> 
>         return ret;
> 
> However, we can get in trouble when the shadowed variable is used in a
> macro argument:
> 
>     #define QOBJECT(obj) ({                                 \
>         typeof(obj) o = (obj);                              \
>         o ? container_of(&(o)->base, QObject, base) : NULL; \
>      })
> 
> QOBJECT(o) expands into
> 
>     ({
> --->    typeof(o) o = (o);
>         o ? container_of(&(o)->base, QObject, base) : NULL;
>     })
> 
> Unintended variable name capture at --->.  We'd be saved by
> -Winit-self.  But I could certainly construct more elaborate death
> traps that don't trigger it.
> 
> To reduce the risk of trapping ourselves, we use variable names in
> macros that no sane person would use elsewhere.  Here's our actual
> definition of QOBJECT():
> 
>     #define QOBJECT(obj) ({                                         \
>         typeof(obj) _obj = (obj);                                   \
>         _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
>     })
> 
> Works well enough until we nest macro calls.  For instance, with
> 
>     #define qobject_ref(obj) ({                     \
>         typeof(obj) _obj = (obj);                   \
>         qobject_ref_impl(QOBJECT(_obj));            \
>         _obj;                                       \
>     })
> 
> the expression qobject_ref(obj) expands into
> 
>     ({
>         typeof(obj) _obj = (obj);
>         qobject_ref_impl(
>             ({
> --->            typeof(_obj) _obj = (_obj);
>                 _obj ? container_of(&(_obj)->base, QObject, base) : NULL;
>             }));
>         _obj;
>     })
> 
> Unintended variable name capture at --->.
> 
> The only reliable way to prevent unintended variable name capture is
> -Wshadow.
> 
> One blocker for enabling it is shadowing hiding in function-like
> macros like
> 
>      qdict_put(dict, "name", qobject_ref(...))
> 
> qdict_put() wraps its last argument in QOBJECT(), and the last
> argument here contains another QOBJECT().
> 
> Use dark preprocessor sorcery to make the macros that give us this
> problem use different variable names on every call.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>  include/qapi/qmp/qobject.h | 11 +++++++++--
>  include/qemu/atomic.h      | 17 ++++++++++++-----
>  include/qemu/compiler.h    |  3 +++
>  include/qemu/osdep.h       | 31 +++++++++++++++++++++++--------
>  4 files changed, 47 insertions(+), 15 deletions(-)
> 
> diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
> index 9003b71fd3..d36cc97805 100644
> --- a/include/qapi/qmp/qobject.h
> +++ b/include/qapi/qmp/qobject.h
> @@ -45,10 +45,17 @@ struct QObject {
>      struct QObjectBase_ base;
>  };
>  
> -#define QOBJECT(obj) ({                                         \
> +/*
> + * Preprocessory sorcery ahead: use a different identifier for the
> + * local variable in each expansion, so we can nest macro calls
> + * without shadowing variables.
> + */
> +#define QOBJECT_INTERNAL(obj, _obj) ({                          \
>      typeof(obj) _obj = (obj);                                   \
> -    _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
> +    _obj                                                        \
> +        ? container_of(&(_obj)->base, QObject, base) : NULL;    \

What happened here? The code in this line (or now two lines) seems to be
unchanged apart from a strange looking newline.

>  })
> +#define QOBJECT(obj) QOBJECT_INTERNAL((obj), MAKE_IDENTFIER(_obj))

Kevin



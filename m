Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F07A78EF97
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 16:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593987.927146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbihW-0003Tn-CF; Thu, 31 Aug 2023 14:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593987.927146; Thu, 31 Aug 2023 14:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbihW-0003RZ-9W; Thu, 31 Aug 2023 14:31:14 +0000
Received: by outflank-mailman (input) for mailman id 593987;
 Thu, 31 Aug 2023 14:31:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5iW9=EQ=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1qbihV-0003RN-F1
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 14:31:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07e666be-480b-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 16:31:12 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-QwdtIsOgPeiOv6oBBKVjRg-1; Thu, 31 Aug 2023 10:30:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3208C1C06EEB;
 Thu, 31 Aug 2023 14:30:39 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FC0F1121315;
 Thu, 31 Aug 2023 14:30:35 +0000 (UTC)
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
X-Inumbo-ID: 07e666be-480b-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693492270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kFbfLpLhuT7B1TmnESfwEKgRAeWmv+5n/w5vt4fxsA=;
	b=RMi6w5fSxB0tJSF961mxibZHVLBomdCO4SfB0FHATLak8bP9Yy5c37zgs4PazvXlpnIHnV
	p0sT/InpIjSSZFRSwddQamVk/9Mw9IcUjr33xFXPhKgN2h03mv4+KuL8a7RjKaXzg0gmVW
	LUQ7i/Ust0rbM5D1iPWL1b74NWNZSjQ=
X-MC-Unique: QwdtIsOgPeiOv6oBBKVjRg-1
Date: Thu, 31 Aug 2023 09:30:33 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, 
	vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de, 
	sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com, 
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, 
	stefanha@redhat.com, fam@euphon.net, quintela@redhat.com, peterx@redhat.com, 
	leobras@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org, 
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org, peter.maydell@linaro.org
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Message-ID: <vfkfi6uld3gbd4urmqdlzkv6djtws6mkbluc5qvwcla6btszhu@ff66zfyd7smm>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-8-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-8-armbru@redhat.com>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

On Thu, Aug 31, 2023 at 03:25:46PM +0200, Markus Armbruster wrote:

[This paragraph written last: Bear with my stream of consciousness
review below, where I end up duplicating some of the conslusions you
reached before the point where I saw where the patch was headed]

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

Which is why I've seen some projects require a strict namespace
separation: if all macro parameters and any identifiers declared in
macros use either a leading or a trailing _ (I prefer a trailing one,
to avoid risking conflicts with libc reserved namespace; but leading
is usually okay), and all other identifiers avoid that namespace, then
you will never have shadowing by calling a macro from normal code.

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

Indeed, not fully understanding the preprocessor makes for some
interesting death traps.

> 
> To reduce the risk of trapping ourselves, we use variable names in
> macros that no sane person would use elsewhere.  Here's our actual
> definition of QOBJECT():
> 
>     #define QOBJECT(obj) ({                                         \
>         typeof(obj) _obj = (obj);                                   \
>         _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
>     })

Yep, goes back to the policy I've seen of enforcing naming conventions
that ensure macros can't shadow normal code.

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

Yep, you've just proven how macros calling macros requires care, as we
no longer have the namespace protections.  If macro calls can only
form a DAG, it is possible to choose unique intermediate declarations
for every macro (although remembering to do that, and still keeping
the macro definition legible, may not be easy).  But if you can have
macros that form any sort of nesting loop (and we WANT to allow things
like MIN(MIN(a, b), c) - which is such a loop), dynamic naming becomes
the only solution.

> 
> The only reliable way to prevent unintended variable name capture is
> -Wshadow.

Yes, I would love to have that enabled eventually.

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

Sounds foreboding; hopefully not many macros are affected...

> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/qobject.h |  8 +++++---
>  include/qemu/atomic.h      | 11 ++++++-----
>  include/qemu/osdep.h       | 34 +++++++++++++++++++---------------
>  3 files changed, 30 insertions(+), 23 deletions(-)

...okay, the size of the diffstat seems tolerable (good that we don't
have many macros that expand to a temporary variable declaration and
which are likely to be heavily reused from nested contexts).

> 
> diff --git a/include/qapi/qmp/qobject.h b/include/qapi/qmp/qobject.h
> index 9003b71fd3..7b50fc905d 100644
> --- a/include/qapi/qmp/qobject.h
> +++ b/include/qapi/qmp/qobject.h
> @@ -45,10 +45,12 @@ struct QObject {
>      struct QObjectBase_ base;
>  };
>  
> -#define QOBJECT(obj) ({                                         \
> -    typeof(obj) _obj = (obj);                                   \
> -    _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
> +#define QOBJECT_INTERNAL(obj, l) ({                                     \
> +    typeof(obj) PASTE(_obj, l) = (obj);                                 \
> +    PASTE(_obj, l)                                                      \
> +        ? container_of(&(PASTE(_obj, l))->base, QObject, base) : NULL;  \
>  })
> +#define QOBJECT(obj) QOBJECT_INTERNAL((obj), __COUNTER__)

Slick!  Every call to QOBJECT() defines a unique temporary variable
name.  But as written, QOBJECT(o) expands to this (when __COUNTER__ is
1):

({
  typeof((o)) _obj1 = ((o));
  _obj1 ? container_of(&(_obj1)->base, QObject, base) : NULL;
})

which has three sets of redundant parens that could be elided.  Why do
you need to add () around obj when forwarding to QOBJECT_INTERNAL()?
The only way the expansion of the text passed through the 'obj'
parameter can contain a comma is if the user has already parenthesized
it on their end (not that I expect a comma expression to be a frequent
argument to QOBJECT(), but who knows).  Arguing that it is to silence
a syntax checker is weak; since we must NOT add parens around the
parameters to QOBJECT_INTERNAL (calling PASTE((_obj), (l)) is
obviously wrong).

Meanwhile, the repetition of three calls to PASTE() is annoying.  How
about:

#define QOBJECT_INTERNAL_2(_obj, _tmp) ({ \
  typeof _obj _tmp = _obj; \
  _tmp ? container_of(&_tmp->base, QObject, base) : NULL; \
  )}
#define QOBJECT_INTERNAL_1(_arg, _tmp) QOBJECT_INTERNAL_2(_arg, _tmp)
#define QOBJECT_INTERNAL(_arg, _ctr) \
  QOBJECT_INTERNAL_1(_arg, PASTE(_obj, _ctr))
#define QOBJECT(obj) QOBJECT_INTERNAL((obj), __COUNTER__)

or:

#define QOBJECT_INTERNAL_2(_obj, _tmp) ({ \
  typeof(_obj) _tmp = (_obj); \
  _tmp ? container_of(&_tmp->base, QObject, base) : NULL; \
  )}
#define QOBJECT_INTERNAL_1(_arg, _tmp) QOBJECT_INTERNAL_2(_arg, _tmp)
#define QOBJECT_INTERNAL(_arg, _ctr) \
  QOBJECT_INTERNAL_1(_arg, PASTE(_obj, _ctr))
#define QOBJECT(obj) QOBJECT_INTERNAL(obj, __COUNTER__)

where, in either case, QOBJECT(o) should then expand to

({
  typeof (o) _obj1 = (o);
  _obj1 ? container_of(&_obj1->base, QObject, base) : NULL;
})

>  
>  /* Required for qobject_to() */
>  #define QTYPE_CAST_TO_QNull     QTYPE_QNULL
> diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
> index d95612f7a0..3f80ffac69 100644
> --- a/include/qemu/atomic.h
> +++ b/include/qemu/atomic.h
> @@ -157,13 +157,14 @@
>      smp_read_barrier_depends();
>  #endif
>  
> -#define qatomic_rcu_read(ptr)                          \
> -    ({                                                 \
> +#define qatomic_rcu_read_internal(ptr, l)               \
> +    ({                                                  \
>      qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
> -    typeof_strip_qual(*ptr) _val;                      \
> -    qatomic_rcu_read__nocheck(ptr, &_val);             \
> -    _val;                                              \
> +    typeof_strip_qual(*ptr) PASTE(_val, l);             \
> +    qatomic_rcu_read__nocheck(ptr, &PASTE(_val, l));    \
> +    PASTE(_val, l);                                     \
>      })
> +#define qatomic_rcu_read(ptr) qatomic_rcu_read_internal((ptr), __COUNTER__)

Same observation about being able to reduce the number of PASTE()
calls by adding yet another layer of macro invocations.

>  
>  #define qatomic_rcu_set(ptr, i) do {                   \
>      qemu_build_assert(sizeof(*ptr) <= ATOMIC_REG_SIZE); \
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 21ef8f1699..9c191ebe99 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -371,18 +371,21 @@ void QEMU_ERROR("code path is reachable")
>   * have to open-code it.  Sadly, Coverity is severely confused by the
>   * constant variants, so we have to dumb things down there.
>   */
> +#define PASTE(a, b) a##b
> +#define MIN_INTERNAL(a, b, l)                                           \
> +    ({                                                                  \
> +        typeof(1 ? (a) : (b)) PASTE(_a, l) = (a), PASTE(_b, l) = (b);   \
> +        PASTE(_a, l) < PASTE(_b, l) ? PASTE(_a, l) : PASTE(_b, l);      \
> +    })

And again.

I think you are definitely on the right track to have all internal
variable declarations within a macro definition use multi-layered
expansion with the help of __COUNTER__ to ensure that the macro's
temporary variable is globally unique; so if you leave it as written,
I could live with:

Reviewed-by: Eric Blake <eblake@redhat.com>

But if you respin it to pick up any of my suggestions, I'll definitely
spend another review cycle on the result.

If it helps, here's what I ended up using in nbdkit:

https://gitlab.com/nbdkit/nbdkit/-/blame/master/common/include/unique-name.h#L36
/* https://stackoverflow.com/a/1597129
 * https://stackoverflow.com/a/12711226
 */
#define XXUNIQUE_NAME(name, counter) name ## counter
#define XUNIQUE_NAME(name, counter) XXUNIQUE_NAME (name, counter)
#define NBDKIT_UNIQUE_NAME(name) XUNIQUE_NAME (name, __COUNTER__)

https://gitlab.com/nbdkit/nbdkit/-/blame/master/common/include/minmax.h#L47
#include "unique-name.h"

#undef MIN
#define MIN(x, y) \
  MIN_1 ((x), (y), NBDKIT_UNIQUE_NAME (_x), NBDKIT_UNIQUE_NAME (_y))

...
#define MIN_1(x, y, _x, _y) ({                 \
      __auto_type _x = (x);                    \
      __auto_type _y = (y);                    \
      _x < _y ? _x : _y;                       \
    })

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA578FE36
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 15:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594615.927983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc433-0000wr-T1; Fri, 01 Sep 2023 13:18:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594615.927983; Fri, 01 Sep 2023 13:18:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc433-0000u6-Pk; Fri, 01 Sep 2023 13:18:53 +0000
Received: by outflank-mailman (input) for mailman id 594615;
 Fri, 01 Sep 2023 13:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n7sW=ER=redhat.com=eblake@srs-se1.protection.inumbo.net>)
 id 1qc432-0000u0-IW
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 13:18:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1629738a-48ca-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 15:18:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-REwgjqJMNmWwe92Rdpm8Cw-1; Fri, 01 Sep 2023 09:18:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 022B88008A4;
 Fri,  1 Sep 2023 13:18:44 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0937D200A86A;
 Fri,  1 Sep 2023 13:18:39 +0000 (UTC)
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
X-Inumbo-ID: 1629738a-48ca-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693574328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ORjCogk/T3wtJvdEQcveV1ZRZ94PW0/afyX1i5phnI=;
	b=H7BRiONjiph/CkEGcyls08cJcD6BduAvxGwmuUrWoaLsxJGjJYuMOXx5CAeSxIjt4Ju8em
	FsKjhrYWVbgr3WyAeoZuarBBdA5ISkn+IrZx1+voCLnddSgdM7/kcUJK2tlNIko7Pb6ZyZ
	JVqQirlrQlgnMMNWgRvf4fxzoBf2vpI=
X-MC-Unique: REwgjqJMNmWwe92Rdpm8Cw-1
Date: Fri, 1 Sep 2023 08:18:38 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com, 
	vsementsov@yandex-team.ru, jsnow@redhat.com, idryomov@gmail.com, sw@weilnetz.de, 
	sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org, pbonzini@redhat.com, 
	marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, 
	stefanha@redhat.com, fam@euphon.net, quintela@redhat.com, peterx@redhat.com, 
	leobras@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org, 
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org, peter.maydell@linaro.org
Subject: Re: [PATCH 7/7] qobject atomics osdep: Make a few macros more
 hygienic
Message-ID: <viam47z5ascty5zluzvj3byrrrp2fe6jh6vevcaggpozxwzabj@avo7fb3gs7bt>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-8-armbru@redhat.com>
 <vfkfi6uld3gbd4urmqdlzkv6djtws6mkbluc5qvwcla6btszhu@ff66zfyd7smm>
 <87ledqjn39.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ledqjn39.fsf@pond.sub.org>
User-Agent: NeoMutt/20230517
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

On Fri, Sep 01, 2023 at 10:48:26AM +0200, Markus Armbruster wrote:
> > Indeed, not fully understanding the preprocessor makes for some
> > interesting death traps.
> 
> We use ALL_CAPS for macros to signal "watch out for traps".
> 

> >> -#define QOBJECT(obj) ({                                         \
> >> -    typeof(obj) _obj = (obj);                                   \
> >> -    _obj ? container_of(&(_obj)->base, QObject, base) : NULL;   \
> >> +#define QOBJECT_INTERNAL(obj, l) ({                                     \
> >> +    typeof(obj) PASTE(_obj, l) = (obj);                                 \
> >> +    PASTE(_obj, l)                                                      \
> >> +        ? container_of(&(PASTE(_obj, l))->base, QObject, base) : NULL;  \
> >>  })
> >> +#define QOBJECT(obj) QOBJECT_INTERNAL((obj), __COUNTER__)
> >
> > Slick!  Every call to QOBJECT() defines a unique temporary variable
> > name.  But as written, QOBJECT(o) expands to this (when __COUNTER__ is
> > 1):
> >
> > ({
> >   typeof((o)) _obj1 = ((o));
> >   _obj1 ? container_of(&(_obj1)->base, QObject, base) : NULL;
> > })
> >
> > which has three sets of redundant parens that could be elided.  Why do
> > you need to add () around obj when forwarding to QOBJECT_INTERNAL()?
> 
> Habit: enclose macro arguments in parenthesis unless there's a specific
> need not to.
> 
> > The only way the expansion of the text passed through the 'obj'
> > parameter can contain a comma is if the user has already parenthesized
> > it on their end (not that I expect a comma expression to be a frequent
> > argument to QOBJECT(), but who knows).  Arguing that it is to silence
> > a syntax checker is weak; since we must NOT add parens around the
> > parameters to QOBJECT_INTERNAL (calling PASTE((_obj), (l)) is
> > obviously wrong).
> >
> > Meanwhile, the repetition of three calls to PASTE() is annoying.  How
> > about:
> >
> > #define QOBJECT_INTERNAL_2(_obj, _tmp) ({ \
> >   typeof _obj _tmp = _obj; \
> >   _tmp ? container_of(&_tmp->base, QObject, base) : NULL; \
> >   )}
> > #define QOBJECT_INTERNAL_1(_arg, _tmp) QOBJECT_INTERNAL_2(_arg, _tmp)
> > #define QOBJECT_INTERNAL(_arg, _ctr) \
> >   QOBJECT_INTERNAL_1(_arg, PASTE(_obj, _ctr))
> > #define QOBJECT(obj) QOBJECT_INTERNAL((obj), __COUNTER__)
> >
> > or:
> >
> > #define QOBJECT_INTERNAL_2(_obj, _tmp) ({ \
> >   typeof(_obj) _tmp = (_obj); \
> >   _tmp ? container_of(&_tmp->base, QObject, base) : NULL; \
> >   )}
> > #define QOBJECT_INTERNAL_1(_arg, _tmp) QOBJECT_INTERNAL_2(_arg, _tmp)
> > #define QOBJECT_INTERNAL(_arg, _ctr) \
> >   QOBJECT_INTERNAL_1(_arg, PASTE(_obj, _ctr))
> > #define QOBJECT(obj) QOBJECT_INTERNAL(obj, __COUNTER__)
> >
> > where, in either case, QOBJECT(o) should then expand to
> >
> > ({
> >   typeof (o) _obj1 = (o);
> >   _obj1 ? container_of(&_obj1->base, QObject, base) : NULL;
> > })
> 
> The idea is to have the innermost macro take the variable name instead
> of the counter.  "PASTE(_obj, l)" then becomes "_tmp" there, which is
> more legible.  However, we pay for it by going through two more macros.
> 
> Can you explain why you need two more?

Likewise habit, on my part (and laziness - I wrote the previous email
without testing anything). I've learned over the years that pasting is
hard (you can't mix ## with a macro that you want expanded without 2
layers of indirection), so I started out by adding two layers of
QOBJECT_INTERNAL, then wrote QOBJECT to forward to QOBJECT_INTERNAL.
But now that you asked, I actually spent the time to test with the
preprocessor, and your hunch is indeed correct: I over-compensated
becaues of my habit.

$cat foo.c
#define PASTE(_a, _b) _a##_b

#define QOBJECT_INTERNAL_2(_obj, _tmp) ({       \
  typeof _obj _tmp = _obj; \
  _tmp ? container_of(&_tmp->base, QObject, base) : NULL; \
  )}
#define QOBJECT_INTERNAL_1(_arg, _tmp) QOBJECT_INTERNAL_2(_arg, _tmp)
#define QOBJECT_INTERNAL(_arg, _ctr) \
  QOBJECT_INTERNAL_1(_arg, PASTE(_obj, _ctr))
#define QOBJECT(obj) QOBJECT_INTERNAL((obj), __COUNTER__)

QOBJECT(o)

#define Q_INTERNAL_1(_obj, _tmp) ({ \
  typeof _obj _tmp = _obj; \
  _tmp ? container_of(&_tmp->base, QObject, base) : NULL; \
  )}
#define Q_INTERNAL(_arg, _ctr) \
  Q_INTERNAL_1(_arg, PASTE(_obj, _ctr))
#define Q(obj) Q_INTERNAL((obj), __COUNTER__)

Q(o)
$ gcc -E foo.c
# 0 "foo.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "foo.c"
# 12 "foo.c"
({ typeof (o) _obj0 = (o); _obj0 ? container_of(&_obj0->base, QObject, base) : NULL; )}
# 22 "foo.c"
({ typeof (o) _obj1 = (o); _obj1 ? container_of(&_obj1->base, QObject, base) : NULL; )}

So the important part was merely ensuring that __COUNTER__ has a
chance to be expanded PRIOR to the point where ## gets its argument,
and one less layer of indirection was still sufficient for that.

> 
> Complication: the innermost macro needs to take all its variable names
> as arguments.  The macro above has just one.  Macros below have two.
> 
> Not quite sure which version is easier to understand.

Proper comments may help; once you realize that you are passing in the
unique variable name(s) to be used as the temporary identifier(s),
rather than an integer that still needs to be glued, then separating
the task of generating name(s) (which is done once per name, instead
of repeated 3 times) makes sense to me.  I also like minimizing the
number of times I have to spell out __COUNTER__; wrapping unique name
generation behind a well-named helper macro gives a better view of why
it is needed in the first place.

At any rate, this comment still applies:

> >
> > I think you are definitely on the right track to have all internal
> > variable declarations within a macro definition use multi-layered
> > expansion with the help of __COUNTER__ to ensure that the macro's
> > temporary variable is globally unique; so if you leave it as written,
> > I could live with:
> >
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> >
> > But if you respin it to pick up any of my suggestions, I'll definitely
> > spend another review cycle on the result.
> >
> > If it helps, here's what I ended up using in nbdkit:
> >
> > https://gitlab.com/nbdkit/nbdkit/-/blame/master/common/include/unique-name.h#L36
> > /* https://stackoverflow.com/a/1597129
> >  * https://stackoverflow.com/a/12711226
> >  */
> > #define XXUNIQUE_NAME(name, counter) name ## counter
> > #define XUNIQUE_NAME(name, counter) XXUNIQUE_NAME (name, counter)
> > #define NBDKIT_UNIQUE_NAME(name) XUNIQUE_NAME (name, __COUNTER__)
> >
> > https://gitlab.com/nbdkit/nbdkit/-/blame/master/common/include/minmax.h#L47
> > #include "unique-name.h"
> >
> > #undef MIN
> > #define MIN(x, y) \
> >   MIN_1 ((x), (y), NBDKIT_UNIQUE_NAME (_x), NBDKIT_UNIQUE_NAME (_y))
> >
> > ...
> > #define MIN_1(x, y, _x, _y) ({                 \
> >       __auto_type _x = (x);                    \
> >       __auto_type _y = (y);                    \
> >       _x < _y ? _x : _y;                       \
> >     })
> 
> Thanks!

and so I'm fine leaving it up to you if you want to copy the paradigm
I've seen elsewhere, or if you want to leave it as you first proposed.
The end result is the same, and it is more of a judgment call on which
form is easier for you to reason about.

But as other commenters mentioned, we already have a glue() macro, so
use that instead of PASTE(), no matter what else you choose.

Looking forward to v2!

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.
Virtualization:  qemu.org | libguestfs.org



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FE1B2B89
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 17:48:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQv7g-0002Hh-5x; Tue, 21 Apr 2020 15:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vOT2=6F=inria.fr=julia.lawall@srs-us1.protection.inumbo.net>)
 id 1jQupw-0000ZQ-MV
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 15:29:24 +0000
X-Inumbo-ID: e050e184-83e4-11ea-9e09-bc764e2007e4
Received: from mail2-relais-roc.national.inria.fr (unknown [192.134.164.83])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e050e184-83e4-11ea-9e09-bc764e2007e4;
 Tue, 21 Apr 2020 15:29:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.72,410,1580770800"; d="scan'208";a="446201452"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 17:29:02 +0200
Date: Tue, 21 Apr 2020 17:29:02 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm/xen-front: Add support for Xen PV display
 frontend
In-Reply-To: <20200421104522.GA86681@mwanda>
Message-ID: <alpine.DEB.2.21.2004211728360.3118@hadrien>
References: <20200421104522.GA86681@mwanda>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Tue, 21 Apr 2020 15:47:42 +0000
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
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oleksandr_andrushchenko@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On Tue, 21 Apr 2020, Dan Carpenter wrote:

> Hi Kernel Janitors,
>
> Here is another idea that someone could work on, fixing the
> IS_ERR_OR_NULL() checks in the xen driver.
>
> The patch c575b7eeb89f: "drm/xen-front: Add support for Xen PV
> display frontend" from Apr 3, 2018, leads to the following static
> checker warning:
>
> 	drivers/gpu/drm/xen/xen_drm_front_gem.c:140 xen_drm_front_gem_create()
> 	warn: passing zero to 'ERR_CAST'
>
> drivers/gpu/drm/xen/xen_drm_front_gem.c
>    133  struct drm_gem_object *xen_drm_front_gem_create(struct drm_device *dev,
>    134                                                  size_t size)
>    135  {
>    136          struct xen_gem_object *xen_obj;
>    137
>    138          xen_obj = gem_create(dev, size);
>    139          if (IS_ERR_OR_NULL(xen_obj))
>    140                  return ERR_CAST(xen_obj);

Are the other occurrences of this also a possible problem?  There are a
few others outside of xen.

julia

>
> This warning is old and it's actually the result of a bug I had in my
> devel version of Smatch yesterday.  xen_obj can't really be NULL, but
> if it were then the caller would return success which would probably
> create some issues.
>
> When a function returns both error pointers and NULL then NULL is a
> special case of success.  Like say you have:  "p = start_feature();".
> If there is an allocation failure, then the code should return -ENOMEM
> and the whole thing should fail.  But if the feature is optional and
> the user has disabled it in the config then we return NULL and the
> caller has to be able to accept that.  There are a lot of these
> IS_ERR_OR_NULL() checks in the xen driver...
>
> The one here is clearly buggy because returning NULL would lead to a
> run time failure.  All these IS_ERR_OR_NULL() should be checked and
> probably changed to just IS_ERR().
>
> This sort of change is probably change is probably easiest if you build
> the Smatch DB and you can check if Smatch thinks the functions return
> NULL.
>
> ~/smatch/smatch_data/db/smdb.py return_states gem_create | grep INTERNAL
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 58 |  (-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 62 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 66 | 4065035897849303040 |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
> drivers/gpu/drm/xen/xen_drm_front_gem.c | gem_create | 68 | 0,(-4095)-(-1) |      INTERNAL |  -1 |                      | struct xen_gem_object*(*)(struct drm_device*, ulong) |
>
> Smatch thinks that gem_create() sometimes returns NULL or error pointers
> but that's because of a bug in the unreleased version of Smatch and
> because gem_create() uses IS_ERR_OR_NULL().
>
>    141
>    142          return &xen_obj->base;
>    143  }
>
> regards,
> dan carpenter
>


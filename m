Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CE9675736
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 15:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481827.746983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsQC-0001Og-6T; Fri, 20 Jan 2023 14:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481827.746983; Fri, 20 Jan 2023 14:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIsQC-0001Lh-35; Fri, 20 Jan 2023 14:31:12 +0000
Received: by outflank-mailman (input) for mailman id 481827;
 Fri, 20 Jan 2023 14:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8tu/=5R=citrix.com=prvs=37768f290=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pIsQB-0001Lb-Hs
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 14:31:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fb0df9e-98cf-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 15:31:02 +0100 (CET)
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
X-Inumbo-ID: 0fb0df9e-98cf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674225062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WP3JGrHHHdeaMOu99yqNMDK9+HdgyUdkPeT5thYFZIM=;
  b=TMNWBDfcNu4uiNq13iBNKX6bDuSvXaausQLSqteOb2jpeA47zJ1pcb9U
   jNXgBM0vzxT6s2fWoIwv1C6m9AubSvPqTjRY0ngxBq8MDY0H9E3FcQg1C
   msWNVaK8rSgWIa5Se3KkrutzrXBmXu6dN4YDDup5WdO23UIJUiipWQCQy
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93561588
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:4cpdeKO4QNV6Q1jvrR2Dl8FynXyQoLVcMsEvi/4bfWQNrUpx32dVz
 zBMCzzXaKyDNmH0Kohwb9+y/UxTupPQnNJiQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uhLJ0IJ2
 dYaFC4mVSyHl92X3am9bvY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3RGJsMwxbIz
 o7A13XfHEkUKf3D8wqczUyPlsqIlzjcYqtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaNphMGUsBcO/E74gqKjKHT5m6xBGIJUzpAY9wOr9ItSHoh0
 Vrht9/xHjlurL29QGqQ7KuJtii1PTUJLGgEfmkPSg5t3jX4iNht1FSVFI8lSfPryISvQlkc3
 gxmsgAwu5MwyuIh1Zml1mv7hyKTh4XSSCoqs1C/sn2e0u9pWGK0T9X2tgSCva8bd9bxokqp5
 yZdxZXHhAwaJdTUzXHWHr1QdF28z6zdWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdJRfUtC25JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZzzfhiY
 s3CL5fyXB727JiLKxLvF48gPUIDnHhilQs/u7ilp/hY7VZuTCHMEupUWLd/Rus48LmFsG3oH
 yV3bqO3J+FkeLSmOEH/qNdDRW3m2FBnXfgaXeQLLL/cSuencUl9Y8LsLUQJINQ/wv4LybmXp
 hlQmCZwkTLCuJEOEi3SAlgLVV8ldc8XQa4TVcD0AWuV5g==
IronPort-HdrOrdr: A9a23:SvvOXqDgseM5OYblHelo55DYdb4zR+YMi2TDj3oBMyC8cqSj5q
 WTdYcgpGLJYVcqKQEdcLW7UpVoLkmsjaKdjbNhXotKPzOWy1dATrsSlrcKqgeIc0afygc078
 ZdmsNFebnN5C1B/KDHCX6DYrEdKbe8gcKVbCTlo0uFjzsGV0it1WhE4m/xKDwOeOEmbaBJZa
 Z0u/A32AZIMk5nEvhTTkN1IdQrbuekqK7b
X-IronPort-AV: E=Sophos;i="5.97,232,1669093200"; 
   d="scan'208";a="93561588"
Date: Fri, 20 Jan 2023 14:30:56 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH] build: fix building flask headers before descending
 in flask/ss/
Message-ID: <Y8qloFEsK7e+Va6L@perard.uk.xensource.com>
References: <20230120133626.55680-1-anthony.perard@citrix.com>
 <b5c7af20-2694-6f09-2c06-81e4bd338b8d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b5c7af20-2694-6f09-2c06-81e4bd338b8d@suse.com>

On Fri, Jan 20, 2023 at 03:16:51PM +0100, Jan Beulich wrote:
> On 20.01.2023 14:36, Anthony PERARD wrote:
> > Unfortunatly, adding prerequisite to "$(obj)/ss/built_in.o" doesn't
> > work because we have "$(obj)/%/built_in.o: $(obj)/% ;" in Rules.mk.
> > So, make is allow to try to build objects in "xsm/flask/ss/" before
> > generating the headers.
> > 
> > Adding a prerequisite on "$(obj)/ss" instead will fix the issue has
> > that the target used to run make in this subdirectory.
> 
> DYM "... the issue, as that's ..."?

Yes.

> > Unfortunatly, that target is also used when running `make clean`, so
> > we need to ignore it in this case. $(MAKECMDGOALS) can't be used in
> 
> s/need/want/, I guess, as nothing would break, we'd just create files
> only to delete them again right away?

Actually, I did found out that the "FORCE" target doesn't exist in
Makefile.clean, which is why I had to avoid the rule on `make clean`.
But I don't think that needs fixing.

But you can s/need/want/.

> > this case as it is empty, but we can guess which operation is done by
> > looking at the list of loaded makefiles.
> > 
> > Fixes: 7a3bcd2babcc ("build: build everything from the root dir, use obj=$subdir")
> > Reported-by: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> > --- a/xen/xsm/flask/Makefile
> > +++ b/xen/xsm/flask/Makefile
> > @@ -16,7 +16,11 @@ FLASK_H_FILES := flask.h class_to_string.h initial_sid_to_string.h
> >  AV_H_FILES := av_perm_to_string.h av_permissions.h
> >  ALL_H_FILES := $(addprefix include/,$(FLASK_H_FILES) $(AV_H_FILES))
> >  
> > -$(addprefix $(obj)/,$(obj-y)) $(obj)/ss/built_in.o: $(addprefix $(obj)/,$(ALL_H_FILES))
> > +# Adding prerequisite to descending into ss/ folder only when not running `make
> > +# clean`.
> 
> That's then for all "clean" targets, isn't it? I.e. maybe better to refer to
> `make *clean` (or `make %clean`, but I think the % could be misleading there)?

Yes, all clean targets. Referring to `make *clean` sounds good.

> I'm happy to make adjustments while committing, as long (or as far) as you
> agree with me doing so.

Yes.

Thanks,

-- 
Anthony PERARD


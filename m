Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1584733F6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 19:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246260.424705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwq2H-00026X-Um; Mon, 13 Dec 2021 18:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246260.424705; Mon, 13 Dec 2021 18:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwq2H-00024f-QA; Mon, 13 Dec 2021 18:26:53 +0000
Received: by outflank-mailman (input) for mailman id 246260;
 Mon, 13 Dec 2021 18:26:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZ7V=Q6=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mwq2F-00023o-PN
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 18:26:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b8c01fe-5c42-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 19:26:49 +0100 (CET)
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
X-Inumbo-ID: 3b8c01fe-5c42-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639420010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPFSPgzm1hHpqrOtJ71FOQQ04gHM4hHM6l1bwJhim8I=;
  b=OlRVZ7/o6DMSytLgSXfofKXCNM4TIU6Lwm0nQEo45aVw0xkXvSnsqY6y
   vI4DONL/QfyX+fGpGz/IZMEsMEGDEgxNskRLrqaiQ/EKKWyfImjgoiLgG
   A7Ga1tLOUM9tnKRaqzOZNW+1c4A2paYJcgrx9mi5YiiAYs58DBNhpbOd9
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: x0E7HybFPDv4L4iSGiXoOt+bdS6Yregvpq4sgt/tBaKaupieEEjCTGio6wb1KD3/t9RPBTQr0k
 D12ufgS0rbulYO1yQ8YRd2xrs/nJr4D1ff4f5N5h+Tj2cgualBoVucCrM6t35KBk/6yhNdvN6z
 hzMCiq2qXAFYF4Bx6L6rKsQqwUSGQ6/20PC15rM1jFkcqXrmgixpvAscMK1ktTl6Mmu5weULeG
 aSuByU/k7uX40xZjdroV8xtM303qJgykbuYhVRfrfRmxD4lDJzvgfTwTtV0M5YXphBhCfOjAF5
 eQF4v62uNH9XNygRnFGstFe0
X-SBRS: 5.1
X-MesageID: 59417079
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pO6cqKu61UJ+OKLRsfxQzPrW7+fnVGlZMUV32f8akzHdYApBsoF/q
 tZmKTiPO/3fZ2fxfY9zOt/l8hkB7MWDxtIxQQA5qS5nQnxA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj29cy2IPhWGthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplrJmVTF8XNJz1keExQyN9MRsiMvIe0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 pZANmIwPXwsZTVDF0w+JswTjN62oXf1L3pos0Cfl6g4tj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJJFsg/sD+H+5Pd5iqJPE0mdGJON4QP4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud14WtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1sDA3Dt4ade51q2VtW
 1BexKCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9sBu2oidBo0Yp1dEdMMX
 KM0kVkOjKK/wVPwNfMnC25PI5pCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrZFuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 4oFapbRlUwACLaWj+u+2dd7EG3m5EMTXfjew/G7vMbaSua/MG1+WfLX3507fIlpw/ZcmuvSp
 ynvUU5E0lvvw3bALFzSOHxkbbruW7d5rG46YnNwbQr5hSB7bNb99robers2YaIjqL5pw8lrQ
 qRXYM6HGPlOFGjKomxPcZnnoYV+Xx23ngbSbTG9aT0ycsc4FQzE89PpZCX18ywKAnblvMcyu
 eT4hAjaXYACV0JpC8OPMKCjyFa4vH48nuNuXhSXfokPKRu0qIUzcn7/lP46Jc0IOC7v/DrC2
 lbEGwocqMnMv5QxrIvDi5ebotr7COB5BEdbQTXWtO7kKSnA82O/6oZcS+LULyvFXWb59aj+N
 +VYy/bwbK8OkFpQ6tcuFr9qyeQ15sf1pq8cxQNhRS2ZY1OuA7JmA3+HwcgQ6fEdmu4H4VO7C
 hCV591XGbSVI8e0QlceKT0sYvmHyfxJyCLZ6u44IRmi6SJ6lFZdvZ6+4/VYZPRhEYZI
IronPort-HdrOrdr: A9a23:ocQMpqk0ne/x2KwYiUxB60kgm3TpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.88,203,1635220800"; 
   d="scan'208";a="59417079"
Date: Mon, 13 Dec 2021 18:26:44 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [PATCH] tools/libfsimage: Bump SONAME to 4.17
Message-ID: <YbeQZM1dbs4OV267@perard>
References: <20211213175633.30448-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211213175633.30448-1-andrew.cooper3@citrix.com>

On Mon, Dec 13, 2021 at 05:56:33PM +0000, Andrew Cooper wrote:
> Fixes: a5706b80f42e ("Set version to 4.17: rerun autogen.sh")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> 
> This gets forgotten each release.  Any chance we can move libfsimage and/or
> libacpi into libs/, where this issue would go away.

libfsimage is a weird kind of library, I don't think it's going to sit
well in libs/, and I don't think moving it just because MAJOR hasn't been
bumped is a good reason...

libacpi isn't a library, not really. It's a collection of source files
designed to be embedded into other programmes.

You know, we could simply replace "4.16" by
    $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
then we can forget libfsimage exist.

Any any case,
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
for this patch, or for using version.sh instead.

> ---
>  tools/libfsimage/common/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libfsimage/common/Makefile b/tools/libfsimage/common/Makefile
> index 24bc90e73e71..54049ebaae86 100644
> --- a/tools/libfsimage/common/Makefile
> +++ b/tools/libfsimage/common/Makefile
> @@ -1,7 +1,7 @@
>  XEN_ROOT = $(CURDIR)/../../..
>  include $(XEN_ROOT)/tools/libfsimage/Rules.mk
>  
> -MAJOR = 4.16
> +MAJOR = 4.17
>  MINOR = 0
>  
>  LDFLAGS-$(CONFIG_SunOS) = -Wl,-M -Wl,mapfile-SunOS

Thanks,

-- 
Anthony PERARD


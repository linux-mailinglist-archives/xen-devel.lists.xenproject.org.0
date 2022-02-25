Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A883D4C4AB8
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 17:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279513.477232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdT2-0006NE-Da; Fri, 25 Feb 2022 16:29:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279513.477232; Fri, 25 Feb 2022 16:29:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNdT2-0006Jy-9y; Fri, 25 Feb 2022 16:29:16 +0000
Received: by outflank-mailman (input) for mailman id 279513;
 Fri, 25 Feb 2022 16:29:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNdT0-0006Js-Mb
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 16:29:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1038ff-9658-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 17:29:11 +0100 (CET)
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
X-Inumbo-ID: 0f1038ff-9658-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645806551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dIdvA6jL2zvyGQkfeJRdJ548QoN/HZZe+YR1VWTGvzM=;
  b=PcHW9nFuJK95kXToXDb/Y8fWYoK+49w0FGeJsYne5ixsPJT4US2IQhoW
   FWMYjlUidxEQiW+ddYRmz3JlqVIH1jGLkuWFPVdvBgWxvI0GY1veN2MbP
   4ZFRXgl+YARfvITtoJ1NkzXYiiUqdk2+qJM7if1xopkMg/rsqR28Y+vWI
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64440688
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NeSUDatUmu431461TjMrfJkWvefnVFNeMUV32f8akzHdYApBsoF/q
 tZmKTqBbqveZWD0L4olbIy0/BgAvceDzIVgGQJoqSlnRCpB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQyw4bVvqYy2YLjW1nX5
 IuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8gB67lkdoRdSIAGjskNq9JoZbGfEWg5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQzMEiYPU0fUrsRIIMXjtikmkOkTzMGuGzIuZBo6HnLyRMkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S3xTOb/1q2i+TInCe9X5gdfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGkEQp3BX1FJ+nBUT++SPa+E5HMzZNLwEkwAi0yYPd3Qq/PTANVGRKatN/nc5reCN/g
 zdlgOjVLTBotbSUT1eU+bGVsS6+NEApEIMSWcMXZVBbuoe++enfmjqKF48+S/Dt0rUZDBmtm
 2jikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbrzsacowGWxFADpU
 J04dy62trFm4XalznHlfQn1NOv1j8tpyRWF6bKVI7Ev9i6251modp1K7Td1KS9Ba5hYJGC1O
 ROO4VsJvPe/2UdGi4ctMupd7OxwkMDd+SnNDKiIPrKinLArHON4wM2eTRHJhD28+KTduao+J
 Y2aYa6R4YUyUsxaIM6Nb75Fi9cDn3lmrUuKHMyT50n3gNK2OS/OIZ9YYQTmUwzMxP7dyOkj2
 40EbJXiJtQ2eLCWXxQ7BqZIdQFadSVgXMuuwyGVH8baSjdb9KgaI6e56dscl0ZNxvk9ejvgl
 p1lZnJl9Q==
IronPort-HdrOrdr: A9a23:5Xf+E62EAV186fiuMg/9zwqjBLIkLtp133Aq2lEZdPRUGvb3qy
 mLpoV+6faUskd1ZJhOo7290cW7LU80sKQFhrX5Xo3SPjUO2lHJEGgK1+KLqFfd8m/Fh41gPM
 9bAs5D4bbLbGSS4/yU3DWF
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64440688"
Date: Fri, 25 Feb 2022 16:28:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Christian Lindig <christian.lindig@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, David Scott <dave@recoil.org>,
	Wei Liu <wl@xen.org>, Edwin Torok <edvin.torok@citrix.com>
Subject: Re: [XEN PATCH v2 29/29] tools/ocaml: fix build dependency target
Message-ID: <YhkDu+oikp0Yd3sN@perard.uk.xensource.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
 <20220225151321.44126-30-anthony.perard@citrix.com>
 <C31BFB15-F511-452B-A249-1D6FDAC5F626@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <C31BFB15-F511-452B-A249-1D6FDAC5F626@citrix.com>

On Fri, Feb 25, 2022 at 03:30:59PM +0000, Christian Lindig wrote:
> 
> 
> > On 25 Feb 2022, at 15:13, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > 
> > This patch fix ".ocamldep.make" rule by always spelling the variable
> > $(OCAML_TOPLEVEL).
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> > 
> > Notes:
> >    v2:
> >    - new patch
> > 
> > tools/ocaml/libs/eventchn/Makefile   | 8 ++++----
> > tools/ocaml/libs/mmap/Makefile       | 8 ++++----
> > tools/ocaml/libs/xb/Makefile         | 8 ++++----
> > tools/ocaml/libs/xc/Makefile         | 8 ++++----
> > tools/ocaml/libs/xentoollog/Makefile | 8 ++++----
> > tools/ocaml/libs/xl/Makefile         | 8 ++++----
> > tools/ocaml/libs/xs/Makefile         | 8 ++++----
> > tools/ocaml/Makefile.rules           | 2 +-
> 
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> 
> I am fine with this but in general think that the OCaml part should be built using Dune (but invoked from Make), which is now the standard tool to build OCaml projects and is simple, fast, and accurate. Edwin maintains such a build for all development work on the OCaml side but it is not upstreamed.

ocaml-dune doesn't seems to be available on debian oldstable. So I don't
think we can use it for now.

But thanks for pointing that out.

-- 
Anthony PERARD


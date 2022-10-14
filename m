Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9225FF0C9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 17:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422936.669315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojMGm-0000kp-MC; Fri, 14 Oct 2022 15:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422936.669315; Fri, 14 Oct 2022 15:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojMGm-0000hr-J0; Fri, 14 Oct 2022 15:06:40 +0000
Received: by outflank-mailman (input) for mailman id 422936;
 Fri, 14 Oct 2022 15:06:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux67=2P=citrix.com=prvs=2791c07bb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ojMGl-0000hh-5p
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 15:06:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9b187a8-4bd1-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 17:06:34 +0200 (CEST)
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
X-Inumbo-ID: c9b187a8-4bd1-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665759994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ip0UWpQYpO1WzkjZXotVq07QzgOtRWSU7x0wB6dvT8U=;
  b=Mz4L577d0O2yOSJXUTYjm+9mtg2XvJ6bqU/KGgbFyRrl26rUKHZyHP9r
   7HhkThgnf/ZCqnmeVtLeQS0/Pjq0KJYoqSbOkGN+ZRNI7VzhLMzNlLNx/
   qOJL3ijGXm1kgcWtNVHocRyN8aZOVGs/0Jqw3Nuiu+33nIezs47HBkEZD
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82385662
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:W441b6umYy9lZ1LzA4qtcTMgK+fnVNVeMUV32f8akzHdYApBsoF/q
 tZmKW+OP/qDYmD1LdlxYd/j8h8DvMPVm99iHFRt+ylgFCMW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPakX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkUp
 fIKcyImVCvbhvDtney0c8VpvOcKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZUPxRbF+
 Dycl4j/KgsEONO1kCiry36xrN6UwALUSpgsHpTto5aGh3XMnzdOWXX6T2CTo/ajjVWlc8lCM
 EFS8S0rxYAu9UmDXtT7GRqirxasvAMYWtdWO/037keK0KW8ywqQGGUsVDNKb90i8sgsSlQC2
 1uEmdqvGDJutaGORGyU3rCOpDi2NG4eKmpqTSMcVg4E/9nLqZk+lA7SVc1kFLOpj9rzAnf7x
 DXihDgzgfAfgNAG042//EvbmHS8q57RVAk36w7LGGW/4WtRe4qNd4Gur1/B4p5oLoyUU12At
 3gsgNWF4aYFCpTlqcCWaLxTRvfzva/DaWCCxw40d3U8y9iz0yTzc5IL8hpEHx9oIJ1ZJzDQT
 ErpmioEsfe/I0CWRaNwZouwDeEjwq7hCcnpW5joUzZeXnRiXFTZpX8zPCZ8y0ioyRFxyv9nZ
 f93ZO72VR4n5bJbIC1argv3+Zsi3WgAyGzaXvgXJDz3gOPFNBZ5pVroWWZij9zVDove/W05E
 P4FbaNmLimzt8WnO0HqHXY7dwxiEJTCLcmeRzZrXuCCOBF6P2oqFuXcx7gsE6Q8wfoIyLeWo
 ijmBxIAoLYauZEgAVzQAk2PlZu1BcovxZ7FFXZE0amUN4gLPt/0sfZ3m2ofdrg77u1zpcNJo
 w0+U5zYWJxnE22fkxxENMmVkWCXXEny7e54F3H+O2ZXkl8Jb1Ghx+IIiSO0pHNTU3Pt6ZFjy
 1BivyuCKac+q81ZJJ6+QJqSI5mZ5xDxRMoas5P0H+Ru
IronPort-HdrOrdr: A9a23:ihcCLKgGL9GeUFBDqlvsGIu323BQXtoji2hC6mlwRA09TySZ//
 rBoB0+726RtN9xYgBEpTnuAsS9qB/nmaKdpLNhWotKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFebvN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.95,184,1661832000"; 
   d="scan'208";a="82385662"
Date: Fri, 14 Oct 2022 16:06:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Tim Deegan
	<tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Juergen Gross
	<jgross@suse.com>, David Scott <dave@recoil.org>, Julien Grall
	<julien@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [XEN PATCH for-4.17 v5 05/17] tools: Remove -Werror everywhere
 else
Message-ID: <Y0l66TN/w05EQr91@perard.uk.xensource.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
 <20221013130513.52440-6-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221013130513.52440-6-anthony.perard@citrix.com>

On Thu, Oct 13, 2022 at 02:05:01PM +0100, Anthony PERARD wrote:
> Patch "tools: Add -Werror by default to all tools/" have added
> "-Werror" to CFLAGS in tools/Rules.mk, remove it from every other
> makefiles as it is now duplicated.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Christian Lindig <christian.lindig@citrix.com>
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com> # tools/flask
> Acked-by: Jan Beulich <jbeulich@suse.com> # tools/*/cpu-policy
> ---
> 
> Notes:
>     missing-ack:
>     - GDBSX DEBUGGER
>     - KDD DEBUGGER
>     - XENTRACE
> 
>  tools/console/client/Makefile   | 1 -
>  tools/console/daemon/Makefile   | 1 -
>  tools/debugger/kdd/Makefile     | 1 -
>  tools/flask/utils/Makefile      | 1 -
>  tools/fuzz/cpu-policy/Makefile  | 2 +-
>  tools/misc/Makefile             | 1 -
>  tools/tests/cpu-policy/Makefile | 2 +-
>  tools/tests/depriv/Makefile     | 2 +-
>  tools/tests/resource/Makefile   | 1 -
>  tools/tests/tsx/Makefile        | 1 -
>  tools/tests/xenstore/Makefile   | 1 -
>  tools/xcutils/Makefile          | 2 --
>  tools/xenmon/Makefile           | 1 -
>  tools/xenpaging/Makefile        | 1 -
>  tools/xenpmd/Makefile           | 1 -
>  tools/xentop/Makefile           | 2 +-
>  tools/xentrace/Makefile         | 2 --
>  tools/xl/Makefile               | 2 +-
>  tools/debugger/gdbsx/Rules.mk   | 2 +-
>  tools/firmware/Rules.mk         | 2 --
>  tools/libfsimage/common.mk      | 2 +-
>  tools/libs/libs.mk              | 2 +-
>  tools/ocaml/common.make         | 2 +-
>  tools/xenstore/Makefile.common  | 1 -
>  24 files changed, 9 insertions(+), 27 deletions(-)

Missing hunk as pointed out by Andrew:

diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
index b8f1dc4590..0e4e3d02d3 100644
--- a/tools/pygrub/setup.py
+++ b/tools/pygrub/setup.py
@@ -3,7 +3,7 @@ from distutils.ccompiler import new_compiler
 import os
 import sys

-extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
+extra_compile_args  = [ "-fno-strict-aliasing" ]

 XEN_ROOT = "../.."

diff --git a/tools/python/setup.py b/tools/python/setup.py
index 8c95db7769..721a3141d7 100644
--- a/tools/python/setup.py
+++ b/tools/python/setup.py
@@ -8,7 +8,7 @@ SHLIB_libxenctrl = os.environ['SHLIB_libxenctrl'].split()
 SHLIB_libxenguest = os.environ['SHLIB_libxenguest'].split()
 SHLIB_libxenstore = os.environ['SHLIB_libxenstore'].split()

-extra_compile_args  = [ "-fno-strict-aliasing", "-Werror" ]
+extra_compile_args  = [ "-fno-strict-aliasing" ]

 PATH_XEN      = XEN_ROOT + "/tools/include"
 PATH_LIBXENTOOLLOG = XEN_ROOT + "/tools/libs/toollog"


We can see the change, or duplicate of "-Werror" in commands run by
setup.py by running `setup.py build --verbose`.

-- 
Anthony PERARD


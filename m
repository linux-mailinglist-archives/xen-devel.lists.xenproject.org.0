Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52713779102
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 15:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582434.912209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSVF-0002pP-5S; Fri, 11 Aug 2023 13:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582434.912209; Fri, 11 Aug 2023 13:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUSVF-0002mf-2X; Fri, 11 Aug 2023 13:48:33 +0000
Received: by outflank-mailman (input) for mailman id 582434;
 Fri, 11 Aug 2023 13:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hSUX=D4=citrix.com=prvs=58088f632=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qUSVD-0002mZ-KR
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 13:48:31 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf5cc135-384d-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 15:48:29 +0200 (CEST)
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
X-Inumbo-ID: bf5cc135-384d-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691761709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VcAlDHWjEj39BbRxxve0Ky/5ytlZc4/cWq9eYds5w08=;
  b=Jkp8zpgFmhrDI5oeyw8YpkOJEAfW0gnwL+oAQFaL5mSyOE1R8BK9Ysrh
   hI1TjGCnau2/rNRZc9gTRbMsatzwmu9Frn8ZC7w7g3vcMJbX83SHi4JCB
   tdHejq9HpiPMdVpLLjlNtB+X+VEsOXlrmfOzPYp4Pn6QIQS+nvH/1HdI6
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119249411
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BDpqiKo94Q0cPrzj1gqHG24VHm5eBmLJZRIvgKrLsJaIsI4StFCzt
 garIBmGO/+MZWGhfop0Pdm39R9QuZGEyoRqHFZspX83FnlHpJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GpwUmAWP6gR5weOziBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACwqagmugsDt/LGYRLVRusk7Nc/kYpxK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVRrk6VoqwmpXDe1gVr3JDmMcbPe8zMTsJQ9qqdj
 jufrj6lU01DbbRzzxKe8Vu+jKzPuRjqc5keHeyfr9pIrGWMkzl75Bo+CgLg/KjRZlSFc9BVJ
 lEQ+yEuhbMv70HtRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnM0rQT0n0
 HeZktWvAiZg2JWOUm6U/LqQqTK0OAAWIHUEaCtCShEKi/H8pKkjgxSJScxseIa8ltDvECv86
 yyLpiM5wb4UiKY2O76TpA6dxWj2/96QE1Bzv1+MNo640u9nTJKCY5WF7HqA0fVjItqkclSZp
 X4LxdfLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBcmB2zcnT2
 r/BK65A6Er27ow2pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnvfra8V+Pr
 IcBapDiJ/BjvAvWOHa/HWk7dwpiEJTGLcqu95w/mhCrfWKK513N+9eOmOh8KuSJboxel/vS/
 2HVZ6Or4AOXuJEzEi3TMioLQOq2Df5CQYcTYXRE0aCAhyJyPu5CLc43K/MKQFXQ3LA6laElF
 aVVIJno7zYmYm2vxgnxpKLV9ORKHClHTyrUV8Z5SFDTp6JdejE=
IronPort-HdrOrdr: A9a23:fvHIwK7/zkLzpo1KVQPXwFfXdLJyesId70hD6qkRc20uTiX8ra
 qTdZsgtSMc9wxhOk3I9erwQJVoIkmzyXcW2/h2AZ6YUAHtuW21Mbx45YHhzyaIIVyaygc178
 4JGJSWY+eAdGSS4/yKmzWQIpIJytOA7Ke0wcDZ0ndjTQtjdqFn6ENFGh+We3cGJzWuxqBUKH
 Nf3Kd6TvabFkg/X4CdAGQEUOjIr8DKkpX9CCR2YyIP2U2oiy6p577xGwWZ2BAFFxhI3bAp/S
 zklAP+j5/T1M1TAyW861Pu
X-Talos-CUID: 9a23:R50XjWGOSqY6LwfwqmJ700oNN8UHKUHe73mMHnO1EX9vR+OKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3A34PGsA2svp0QNDBT7w8hIoaeZjUj+KeHGkpOkbE?=
 =?us-ascii?q?9quKfOSUhHG65rhiPXdpy?=
X-IronPort-AV: E=Sophos;i="6.01,165,1684814400"; 
   d="scan'208";a="119249411"
Date: Fri, 11 Aug 2023 14:48:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 1/5] build: make cc-option properly deal with
 unrecognized sub-options
Message-ID: <9dd1134b-8bc8-4fea-a2d7-dd20bd6af9c5@perard>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
 <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <60da37cf-abec-be58-d433-e98eec0c59bd@suse.com>

On Wed, Jul 26, 2023 at 12:33:07PM +0200, Jan Beulich wrote:
> In options like -march=, it may be only the sub-option which is
> unrecognized by the compiler. In such an event the error message often
> splits option and argument, typically saying something like "bad value
> '<argument>' for '<option>'. Extend the grep invocation accordingly,
> also accounting for Clang to not mention e.g. -march at all when an
> incorrect argument was given for it.
> 
> To keep things halfway readable, re-wrap and re-indent the entire
> construct.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In principle -e "$$pat" could now be omitted from the grep invocation,
> since if that matches, both $$opt and $$arg will, too. But I thought I'd
> leave it for completeness.
> ---
> v3: Fix build with make 4.3 and newer, where the treatment of \# has
>     changed.
> v2: Further relax grep patterns for clang, which doesn't mention -march
>     when complaining about an invalid argument to it.
> 
> --- a/Config.mk
> +++ b/Config.mk
> @@ -8,6 +8,7 @@ endif
>  comma   := ,
>  open    := (
>  close   := )
> +sharp   := \#
>  squote  := '
>  #' Balancing squote, to help syntax highlighting
>  empty   :=
> @@ -90,9 +91,14 @@ PYTHON_PREFIX_ARG ?= --prefix="$(prefix)
>  # of which would indicate an "unrecognized command-line option" warning/error.
>  #
>  # Usage: cflags-y += $(call cc-option,$(CC),-march=winchip-c6,-march=i586)
> -cc-option = $(shell if test -z "`echo 'void*p=1;' | \
> -              $(1) $(2) -c -o /dev/null -x c - 2>&1 | grep -- $(2:-Wa$(comma)%=%) -`"; \
> -              then echo "$(2)"; else echo "$(3)"; fi ;)
> +cc-option = $(shell pat='$(2:-Wa$(comma)%=%)'; \
> +                    opt="$${pat%%=*}" arg="$${pat$(sharp)*=}"; \
> +                    if test -z "`echo 'void*p=1;' | \
> +                                 $(1) $(2) -c -o /dev/null -x c - 2>&1 | \
> +                                 grep -e "$$pat" -e "$$opt" -e "$$arg" -`"; \
> +                    then echo "$(2)"; \
> +                    else echo "$(3)"; \
> +                    fi;)

This patch looks fine. Shouldn't the comment been updated as well? At
the moment, it only discuss about -Wno-*, which it seems is why `grep`
was introduced in the first place.

But isn't it doing doing pattern matching on an error message going to
lead sometime to false positive? Linux's build system seems to works
fine by just using the exit value. They've got a few trick to deal with
-Wno-* and with clang.

For -Wno-$(warning), they test -W$(warning) instead. For clang, they've
enable additional warnings:
    -Werror=unknown-warning-option
    -Werror=ignored-optimization-argument
    -Werror=option-ignored
    -Werror=unused-command-line-argument


In any case, the patch is fine.
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD


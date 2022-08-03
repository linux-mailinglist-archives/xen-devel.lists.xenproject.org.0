Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6751588DA1
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 15:47:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379951.613874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJEi4-0006Ai-62; Wed, 03 Aug 2022 13:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379951.613874; Wed, 03 Aug 2022 13:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJEi4-00067G-3H; Wed, 03 Aug 2022 13:46:52 +0000
Received: by outflank-mailman (input) for mailman id 379951;
 Wed, 03 Aug 2022 13:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJEi3-00067A-3n
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 13:46:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8438272-1332-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 15:46:49 +0200 (CEST)
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
X-Inumbo-ID: b8438272-1332-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659534409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WptN2SJy6HMB7et3GLfEisQs6VTmgj4z1ok3GC+UcQo=;
  b=O5etkYK7paBwgllmYhG70+o6HvdzQAhh0V0VTnlz1YchAa8mQOctb1OM
   An8Y8J+3353VfFFzRjxxe695uyWRNC0T5F3z4Z5GvFd5a1bP6uO3dF1p7
   vssCsSvYhe8659Djgub4F0f46DopRYxbcn+VLKpwxDa7p4lntYbHm38cZ
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76533930
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EoQKS6vAxr7QYF0h/5ZT9snk8efnVHZeMUV32f8akzHdYApBsoF/q
 tZmKW+Oa/bZa2qjL94nPduz8BxU7J+Hzd9gSFRp/ClgHygU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4GhA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FdcC67hlWXFgz
 qERJRIhNQmi1tuq4q3uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3Fb4SIIYfbHp09ckCw/
 UXv3EjpRUwmPePEkxqqrW2mt+PBknauMG4VPOLhraM76LGJ/UQIEwEfX1a/pfi/i2a9VshZJ
 khS/TAhxYAt8GS7Q9+7WAe3yFaItwARc8BdGOo77EeK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65uAZAhmpn
 WrM9nJnwexO04hbjM1X4GwrnRr2vImXXFYlyD6KV2+HwlhgRd+ce663vA2zAel7EGqJcrWQl
 CFaxpnCtL1XUMvleD+lG7tUQuzwjxqRGHiF2AM0QcF8n9i40yT7Fb289g2SM6uA3iwsXTbyK
 HHetgpKjHO4FCv7NPQnC25d5ilD8EQBKTgGfqqNBja2SsItHDJrBQk3DaJq40jjkVI3jYY0M
 oqBfMCnAB4yUPo6nWboGrtHj+R3l0jSIF8/oriil3yaPUe2PibJGd/pznPUBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqzGLnFnhTdCBTLc2n9KRqmhureFUO9JcJV6CMmtvMuuVNw8xoqws/1
 iriCx4BlACm3SCvxMfjQikLVY4DlK1X9RoTVRHA937zs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:k4Q0lq98/f716FUN+Wtuk+DgI+orL9Y04lQ7vn2YSXRuE/Bws/
 re+8jzsiWE7gr5OUtQ/exoV5PtfZqxz/FICMwqTM6ftWrdyQ6VxeNZnOjfKlTbckWUnINgPO
 VbAspD4bXLfCBHZK3BgDVQfexP/OW6
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="76533930"
Date: Wed, 3 Aug 2022 14:46:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v1 4/7] tools/ocaml: Makefile to drive dune
Message-ID: <Yup8Kb4iL5pXqys9@perard.uk.xensource.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <322ec0c9af480e9b8a6246d0a2cdb4e308a5900c.1659116941.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <322ec0c9af480e9b8a6246d0a2cdb4e308a5900c.1659116941.git.edvin.torok@citrix.com>

On Fri, Jul 29, 2022 at 06:53:27PM +0100, Edwin Török wrote:
> create a separate Makefile that can be used to drive dune.
> 
> Usage:
> `make -f Makefile.dune`
> 
> There are some files that need to be created by the Makefile based
> build system (such as all the C code in $(XEN_ROOT)/tools/libs),
> and those need to exist before dune runs.
> 
> Although it'd be possible to automatically call the necessary makefile
> rules from dune, it wouldn't work reliably:
> * dune uses sandboxing by default (only files declared or known as
>   dependencies are visible to individual build commands,
>   symlinks/hardlinks are used by dune to implement this)
> * the dune builds always run in a _build subdir, and calling the
>   makefiles from there would get the wrong XEN_ROOT set
> * running the make command in the source tree would work, but dune still
>   wouldn't immediately see the build dependencies since they wouldn't
>   have been copied/linked under _build
> 
> The approach here is to:
> * use the Makefile to build C-only prerequisites (i.e. most of Xen)
> * use Dune only to build the OCaml parts once the C prerequisites exist
> * dune has dependencies declared on the C bits, so if they are missing
>   you will get an error about a missing rule to create them instead of a
>   cryptic compilation error
> * dune is still optional - the old Makefile based buildsystem is still
>   there for now
> * use dune exclusively for new code going forward (e.g. OCaml test-suites)
> 
> The workspace file needs to be generated by make because this currently
> cannot be generated by dune, and it doesn't support including external
> files. But could be generated by configure?

Potentially, but ./configure doesn't have access to the list of
xen libraries, so I'm not sure it would be a good idea.

> LD_LIBRARY_PATH needs to be set, because even with -Wl,-rpath
> executables wouldn't be able to run using the just-built libraries,
> unless we'd also link all the transitive dependencies of libs.
> 
> No functional change.
> 
> Signed-off-by: Edwin Török <edvin.torok@citrix.com>
> ---
>  Makefile                          |  5 ++
>  tools/ocaml/Makefile.dune         | 88 +++++++++++++++++++++++++++++++
>  tools/ocaml/dune-workspace.dev.in |  2 +
>  tools/ocaml/dune-workspace.in     | 18 +++++++
>  4 files changed, 113 insertions(+)
>  create mode 100644 tools/ocaml/Makefile.dune
>  create mode 100644 tools/ocaml/dune-workspace.dev.in
>  create mode 100644 tools/ocaml/dune-workspace.in

You've added dune-workspace* to .gitignore in the previous patch, should
the addition be done in this patch instead? (Also feel free to create
"tools/ocaml/.gitignore".

> diff --git a/Makefile b/Makefile
> index b93b22c752..ddb33c3555 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -68,6 +68,11 @@ build-tools-oxenstored: build-tools-public-headers
>  	$(MAKE) -s -C tools/libs
>  	$(MAKE) -C tools/ocaml build-tools-oxenstored
>  
> +.PHONY: build-tools-oxenstored-prepare
> +build-tools-oxenstored-prepare: build-tools-public-headers
> +	test -f tools/config.status || (cd tools && ./configure --with-xenstored=oxenstored)

No, do not run ./configure from the makefile. ./configure needs to be
run before running make.

> +	$(MAKE) -C tools/libs V=

No, do not start a build of the libraries from the root make file. If a
user were to run `make build-tools-oxenstored-prepare build-tools`, we
would end up with 2 make running `make -C tools/libs` concurrently which
isn't going to end well.

> diff --git a/tools/ocaml/Makefile.dune b/tools/ocaml/Makefile.dune
> new file mode 100644
> index 0000000000..eca9cac0ca
> --- /dev/null
> +++ b/tools/ocaml/Makefile.dune
> @@ -0,0 +1,88 @@
> +XEN_ROOT = $(CURDIR)/../..
> +all: dune-all-check
> +
> +# Dune by default uses all available CPUs. Make doesn't.
> +# Query the available CPUs and use all available for any of the make rules we call out to.
> +# -O is also needed with parallel make such that the build error and the build command causing
> +#  the error are close together and not interspersed with other output
> +NPROC=$(shell getconf _NPROCESSORS_ONLN)
> +MAKEN=$(MAKE) -j$(NPROC) -O

Please, don't change those options, I don't think these options belong
to a Makefile.

> +# We want to link and use the Xen libraries built locally
> +# without installing them system-wide
> +# (the system-wide one installed from packages will likely be too old and not match the locally
> +# built one anyway).
> +#
> +# Set LIBRARY_PATH and LD_LIBRARY_PATH so that the linker
> +# finds the proper libraries and the various dune commands
> +# work (e.g. running tests, utop, etc.).
> +#
> +# The Makefile based buildsystem would use -Wl,-rpath-link= here,
> +# but that only works during linking, not runtime.
> +# There is a -Wl, -rpath= that can be used, but that only works
> +# for libraries linked directly to the main executable:
> +# the dependencies of those libraries won't get found on the rpath
> +# (the rpath of the executable is apparently not used during that search).

That's why you do -Lpath -Wl,-rpath=path. Would the files generated in
tools/pkg-config/ would be useful for dune?

LD_LIBRARY_PATH is kind of expected to run binaries, but how is
LIBRARY_PATH used, and by which process?

> +# Use environment variables, because that way we don't make any permanent alternations (rpath)
> +# to the executable, so once installed system-wide it won't refer to build paths anymore.
> +#
> +# Dune cannot be used to generate this file: the env-vars stanza doesn't support %{read:}, :include,
> +# and dune-workspace doesn't support (include) stanzas.
> +# So for now generate it from this Makefile
> +# Cannot start with comment, so add auto-generated comment at the end
> +LIB_DIRS=$(abspath $(wildcard ../libs/*/.))

Do you need all those libs? Can't you instead list the library needed
or use the value listed in "tools/libs/uselibs.mk" ?

> +LIBRARY_PATH=$(subst $(eval) ,:,$(LIB_DIRS))
> +../dune-workspace ../dune-workspace.dev: dune-workspace.in dune-workspace.dev.in Makefile.dune
> +	@( sed -e "s|@LIBRARY_PATH@|$(LIBRARY_PATH)|" <$< \
> +	&& echo "; DO NOT EDIT: autogenerated from ocaml/dune-workspace.in") >../dune-workspace
> +	@cat ../dune-workspace dune-workspace.dev.in >../dune-workspace.dev
> +
> +# for location of various libs which moves between Xen versions
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +XEN_DEPS=$(XEN_libxenctrl)/libxenctrl.so
> +XEN_DEPS+=$(XEN_libxenevtchn)/libxenevtchn.so
> +XEN_DEPS+=$(XEN_libxenguest)/libxenguest.so
> +
> +# Cannot be generated from dune
> +# Tell the user how to generate them
> +../include/xen/xen.h ../config.status $(XEN_DEPS):
> +	echo "Missing C headers or libraries" >&2
> +	echo "Run make -C $(XEN_ROOT) build-tools-oxenstored-prepare -j$$(nproc)" >&2
> +	exit 1
> +
> +# dune would refuse to run if there are build artifacts in the source directory
> +# if we detect anything then run make clean to ensure these are removed
> +# don't always call 'make clean' because it takes ~1.6s
> +.PHONY: dune-pre
> +dune-pre: ../config.status | ../include/xen/xen.h ../dune-workspace $(XEN_DEPS)
> +	$(MAKEN) clean -s

I think it would be much better to tell the user to run clean themself,
like we do in the hypervisor tree when trying to do an out-of-tree
build. See rule "outputmakefile" in "xen/Makefile".

> +
> +# Convenience targets
> +dune-syntax-check: dune-pre
> +	dune build @check
> +
> +dune-all-check: dune-pre ../dune-workspace.dev
> +	# Test build with multiple compiler versions
> +	# requires opam switches for each to be already installed
> +	dune build --workspace=../dune-workspace.dev @check @install @runtest
> +
> +check: dune-pre
> +	dune runtest --no-buffer
> +
> +# approximatively equivalent to Dune 3.0 --release mode
> +dune-oxenstored: dune-pre
> +	dune build --root .. --ignore-promoted-rules --no-config \
> +           --profile release --always-show-command-line \
> +           --promote-install-files --default-target @install
> +
> +-include $(XEN_ROOT)/config/Paths.mk

I think make should fail if "Paths.mk" doesn't exist, could you remove
the dash ? (Also, at this point, "Paths.mk" should already exist because
Rules.mk checks that ./configure has run.)
)
> +
> +# skip doc, it'd install an extra LICENSE file that is already installed by other rules
> +INSTALL_SECTIONS=bin,etc,lib,sbin
> +dune-install: dune-oxenstored
> +	dune install --destdir=$(DESTDIR) --prefix=$(prefix) --libdir=$(shell ocamlfind printconf destdir) --mandir=$(mandir) --etcdir=$(sysconfdir) --docdir=$(docdir) --sections=$(INSTALL_SECTIONS)

Each option here could be on there own line, for clarity.

> +
> +dune-uninstall: dune-oxenstored
> +	dune uninstall --destdir=$(DESTDIR) --prefix=$(prefix) --libdir=$(shell ocamlfind printconf destdir) --mandir=$(mandir) --etcdir=$(sysconfdir) --docdir=$(docdir)
> diff --git a/tools/ocaml/dune-workspace.dev.in b/tools/ocaml/dune-workspace.dev.in
> new file mode 100644
> index 0000000000..2ca831a048
> --- /dev/null
> +++ b/tools/ocaml/dune-workspace.dev.in
> @@ -0,0 +1,2 @@
> +(context default)
> +(context (opam (switch 4.02.3) (profile release)))
> diff --git a/tools/ocaml/dune-workspace.in b/tools/ocaml/dune-workspace.in
> new file mode 100644
> index 0000000000..c963a6e599
> --- /dev/null
> +++ b/tools/ocaml/dune-workspace.in
> @@ -0,0 +1,18 @@
> +(lang dune 2.1)
> +
> +(env
> +  ; we need to support older compilers so don't make deprecation warnings fatal
> + (dev
> +  (flags (:standard -w -3))
> +   (env-vars
> +    (LD_LIBRARY_PATH @LIBRARY_PATH@)
> +    (LIBRARY_PATH @LIBRARY_PATH@)
> +   ))
> + (release
> +  (env-vars
> +   (OCAMLRUNPARAM b)
> +    (LD_LIBRARY_PATH @LIBRARY_PATH@)

Shouldn't this line (and the next) been aligned with the previous one?

> +    (LIBRARY_PATH @LIBRARY_PATH@)
> +  )
> +  (flags (:standard -strict-sequence -strict-formats -principal -w @18))
> +  (ocamlopt_flags -nodynlink)))

Thanks,

-- 
Anthony PERARD


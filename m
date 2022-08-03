Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8828858911C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 19:17:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380024.614007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJHz9-0006xU-33; Wed, 03 Aug 2022 17:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380024.614007; Wed, 03 Aug 2022 17:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJHz8-0006uh-Vh; Wed, 03 Aug 2022 17:16:42 +0000
Received: by outflank-mailman (input) for mailman id 380024;
 Wed, 03 Aug 2022 17:16:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+C7S=YH=citrix.com=prvs=207fd374a=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oJHz7-0006ub-8W
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 17:16:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07d34939-1350-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 19:16:39 +0200 (CEST)
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
X-Inumbo-ID: 07d34939-1350-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659546999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eQoAdHT5dbNSD36yC2LmXZUisoV9kBTALUb7ZouunUE=;
  b=aIeAW3Ur+A6EY2sHEHSlY8VR+VXMLPIE61QEN2tF9hNy92NiveeRBoG5
   T4EYGP5IgPiInoNBki8jiH29eNWgzi5q/mvd8cYHtIIRyHxZ/PlpAtfmM
   TjmvB1M4cd6Mxqr2AKb3rfDnR9MOUdfF+XM37oN6kpcZJbDYWW4/UkeCn
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77733935
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7nGLhqpMuSWZx0/B4W0GyXTRCsxeBmI5ZRIvgKrLsJaIsI4StFCzt
 garIBnTOPeMNmb9c98nPoixpk5T7ZLcn4UxGVNkq380FHwbo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GtD5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUR38FRHH1M8
 MA1JRU1V0ispvya/b2kH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWKJYfRFJ4I9qqej
 ljL4yfhPT0xCJ/F9TOo43yqvOjtwhquDer+E5Xnr6U30TV/3Fc7EwYKXFG2pf24jE+WWN9FL
 UEQvC00osAa60iDXtT7GRqirxasshcCVvJKHuY96QXLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/HhvYUygxTnXttlVqmvgbXI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyEr73uaBMp5ADrc2+A1johS6+7S7Gn9g2OhRpfF7p1XmVtr
 VBdxZXPsLhTVMzX/MCeaL5TRe/0vp5pJBWZ2AcyRMd5qlxB7lb5JehtDCdCyFCF2yruURvge
 wfttAxY//e/11P6PPYsM+pd5ynHpJUM9OgJtdiON7KimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05kWvqGbpBi+FwmnFWKYbvqXfTlkzP7FZjTCTNFedt3KWmNIjVE59oUC2Kq
 o0CZqNmOj1UUfHkYzm/zLP/2WsidCFjbbir+pM/SwJ2ClA5cI3XI6OOnOhJlk0Mt/g9q9okC
 VngChEIkgWu2yWvxMfjQikLVY4DlK1X9RoTVRHA937xs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:aZbCJ66ISQAxi14X6wPXwM7XdLJyesId70hD6qhwISY6TiW9rb
 HLoB19726StN9xYgBEpTnuAsS9qB/nmaKdpLNhW4tKPzOW2ldATrsD0WKK+VSJcEfDH6xmpM
 RdmsBFeaTN5DNB7PoSjjPWL+od
X-IronPort-AV: E=Sophos;i="5.93,214,1654574400"; 
   d="scan'208";a="77733935"
Date: Wed, 3 Aug 2022 18:16:26 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Edwin Torok <edvin.torok@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v1 4/7] tools/ocaml: Makefile to drive dune
Message-ID: <YuqtarzV3E9tr5f+@perard.uk.xensource.com>
References: <cover.1659116941.git.edvin.torok@citrix.com>
 <322ec0c9af480e9b8a6246d0a2cdb4e308a5900c.1659116941.git.edvin.torok@citrix.com>
 <Yup8Kb4iL5pXqys9@perard.uk.xensource.com>
 <9DEFAAE6-970F-4A0E-A136-089C6D36B41C@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9DEFAAE6-970F-4A0E-A136-089C6D36B41C@citrix.com>

On Wed, Aug 03, 2022 at 03:37:19PM +0000, Edwin Torok wrote:
> > On 3 Aug 2022, at 14:46, Anthony PERARD <anthony.perard@citrix.com> wrote:
> > On Fri, Jul 29, 2022 at 06:53:27PM +0100, Edwin Török wrote:
> >> +.PHONY: build-tools-oxenstored-prepare
> >> +build-tools-oxenstored-prepare: build-tools-public-headers
> >> +	test -f tools/config.status || (cd tools && ./configure --with-xenstored=oxenstored)
> > 
> > No, do not run ./configure from the makefile. ./configure needs to be
> > run before running make.
> 
> 
> Perhaps I can add the necessary instructions to a README in tools/ocaml instead of this Makefile rule (which was here for documentation/convenience reasons).

That would be fine.

> The toplevel configure can fail due to various missing dependencies, but for OCaml just the configure in tools should be sufficient.

:-), it doesn't looks like the others ./configure have much dependencies
that aren't also needed in tools, so I don't think it make sense to
avoid the toplevel ./configure at this time. We don't really test
running ./configure in only a subsystem so it's probably best to avoid
documenting it. You can always run `./configure --disable-{xen,docs}` to
run the minimum amount of ./configure.

> > 
> >> +	$(MAKE) -C tools/libs V=
> > 
> > No, do not start a build of the libraries from the root make file. If a
> > user were to run `make build-tools-oxenstored-prepare build-tools`, we
> > would end up with 2 make running `make -C tools/libs` concurrently which
> > isn't going to end well.
> 
> 
> I'd like a single command to build everything needed related to oxenstored, without necessarily building the rest of Xen (which could either take a long time, or fail due to missing dependencies).

Easy:
    ./configure && make -C tools/include && make -C tools/libs
Hopefully, this would be enough, will keep working for a while. But it
might break. (I would try to keep that command above working but who
knows if change would be needed)

> Ideally Xen wouldn't use recursive invocations of make, but just one single makefile that is aware of all source files (and you could then refer to objects/libraries in another directory as dependencies)
> and what I'd like to do could be achieved by simply asking 'make' to build tools/ocaml/xenstored/oxenstored and let it figure out the minimal set of code that needs to be built for that.
> However such a change would be quite invasive to the build system (and there probably was a reason to use recursive makefiles, they might have some advantage I'm not aware of).

Non-recursive makefiles, I want that as well!! :-)
I'm working on it:
    [XEN PATCH v3 00/25] Toolstack build system improvement, toward non-recursive makefiles
    https://lore.kernel.org/all/20220624160422.53457-1-anthony.perard@citrix.com/
But that's going to take a while. There's till a lot of patches that I
haven't posted yet.

> Where do you recommend to put this rule instead, should it be in `tools/ocaml`? (although in that case it'd have to do a make invocation in `../libs` which isn't necessarily nicer)
> 
> Or should it be a shell script instead that invokes all the necessary make rules with the right flags, e.g. tools/ocaml/dev-build.sh?
>  (and in that case there'd be no risk of the user running multiple make rules if the script itself takes no parameters).

I'm not sure, these are just kind of "optimisation" to workaround our
build system. It could easily apply to many subdir in tools/, but
there's no documentation for it. One could run make in most subdir after
just running `./configure && make -C tools/include && make -C
tools/libs`, but I don't think we should document it. As documenting it
makes it harder to make changes if needed.

> >> diff --git a/tools/ocaml/Makefile.dune b/tools/ocaml/Makefile.dune
> >> new file mode 100644
> >> index 0000000000..eca9cac0ca
> >> --- /dev/null
> >> +++ b/tools/ocaml/Makefile.dune
> >> @@ -0,0 +1,88 @@
> >> +XEN_ROOT = $(CURDIR)/../..
> >> +all: dune-all-check
> >> +
> >> +# Dune by default uses all available CPUs. Make doesn't.
> >> +# Query the available CPUs and use all available for any of the make rules we call out to.
> >> +# -O is also needed with parallel make such that the build error and the build command causing
> >> +#  the error are close together and not interspersed with other output
> >> +NPROC=$(shell getconf _NPROCESSORS_ONLN)
> >> +MAKEN=$(MAKE) -j$(NPROC) -O
> > 
> > Please, don't change those options, I don't think these options belong
> > to a Makefile.
> 
> 
> this Makefile is not (yet) linked to the toplevel makefiles, it is only used it you explicitly
> 'make -f Makefile.dune', in which case it saves some typing if you don't have to specify -j every time.

Use the "alias" built-in from your shell, if you want to have -j$(nproc)
added to you `make` commands.

> Would there be another way to achieve this? e.g. a dotfile in user home that make knows about?

There's .bashrc or .zshrc or ..., make doesn't need to know. ;-)

> (I think rpmbuild can be configured that way to use the correct -j flag, but I'm not aware whether Make can).
> Perhaps the above dev-build.sh would be the solution here too (move the settings that don't belong into a makefile into a convenience shell script)
> 
> > 
> >> +# We want to link and use the Xen libraries built locally
> >> +# without installing them system-wide
> >> +# (the system-wide one installed from packages will likely be too old and not match the locally
> >> +# built one anyway).
> >> +#
> >> +# Set LIBRARY_PATH and LD_LIBRARY_PATH so that the linker
> >> +# finds the proper libraries and the various dune commands
> >> +# work (e.g. running tests, utop, etc.).
> >> +#
> >> +# The Makefile based buildsystem would use -Wl,-rpath-link= here,
> >> +# but that only works during linking, not runtime.
> >> +# There is a -Wl, -rpath= that can be used, but that only works
> >> +# for libraries linked directly to the main executable:
> >> +# the dependencies of those libraries won't get found on the rpath
> >> +# (the rpath of the executable is apparently not used during that search).
> > 
> > That's why you do -Lpath -Wl,-rpath=path. Would the files generated in
> > tools/pkg-config/ would be useful for dune?
> > 
> > LD_LIBRARY_PATH is kind of expected to run binaries, but how is
> > LIBRARY_PATH used, and by which process?
> 
> I think LIBRARY_PATH is used by gcc/ld to find the just built libraries. I can try without them, but ISTR linking failing.
> I could use the rpath flags, but then my binary would end up with rpaths inside, which isn't necessarily what I want
> (although I think that is what happens currently). The overriden rpath/library_path/ld_library_path is only needed on the development machine,
> not when deployed onto a box with the rest of the libraries installed into the correct places.
> 
> I think distributions would typically remove all the rpath handling code anyway, so the only user of rpaths left would be developers,
> where setting LD_LIBRARY_PATH/LIBRARY_PATH is less intrusive than modifying all the build rules to add the rpaths.
> I can try to see whether there is a non-intrusive way of adding rpaths, perhaps including a certain file wherever linker flags are specified,
> which could be initially empty, but could contain rpaths when needed (or other compiler/linker flags).
> Then at least rpath handling would be done in only one place (and only one place to immediately undo in the patchqueue).

Use of $LD_LIBRARY_PATH is fine, it's already used in several places. I
guess "-Wl,-rpath" could be used instead but is probably best to avoid as
not normally needed.

Now about link time, normally we seem to have the full path to the
library we want to link to, or we provide '-L' via pkg-config file.
Then, when a library is links against another one, and the linker wants
to know where this library is, we use "-rpath-link" and I might be
wrong but this probably doesn't add anything in the library.

It seems to me that $LIBRARY_PATH might be useful for external project,
we would want to links against the libraries that aren't yet installed
on the system. But event that isn't needed as we generates
"tools/pkg-config/" which have the needed flags. We use that for
building qemu for example, and I think qemu's configure can make use of
that.

> >> +# Use environment variables, because that way we don't make any permanent alternations (rpath)
> >> +# to the executable, so once installed system-wide it won't refer to build paths anymore.
> >> +#
> >> +# Dune cannot be used to generate this file: the env-vars stanza doesn't support %{read:}, :include,
> >> +# and dune-workspace doesn't support (include) stanzas.
> >> +# So for now generate it from this Makefile
> >> +# Cannot start with comment, so add auto-generated comment at the end
> >> +LIB_DIRS=$(abspath $(wildcard ../libs/*/.))
> > 
> > Do you need all those libs? Can't you instead list the library needed
> > or use the value listed in "tools/libs/uselibs.mk" ?
> 
> Indeed, I think some Xen source paths changed since this patch was originally written, an explicit list is probably a better choice now,
> since there are a lot of libs there that are not necessarily needed (e.g. xenlight)

I'd mostly like to avoid $(wildcard ) if possible.

> >> +LIBRARY_PATH=$(subst $(eval) ,:,$(LIB_DIRS))
> >> +../dune-workspace ../dune-workspace.dev: dune-workspace.in dune-workspace.dev.in Makefile.dune
> >> +	@( sed -e "s|@LIBRARY_PATH@|$(LIBRARY_PATH)|" <$< \
> >> +	&& echo "; DO NOT EDIT: autogenerated from ocaml/dune-workspace.in") >../dune-workspace
> >> +	@cat ../dune-workspace dune-workspace.dev.in >../dune-workspace.dev
> >> +
> >> +# for location of various libs which moves between Xen versions
> >> +include $(XEN_ROOT)/tools/Rules.mk
> >> +
> >> +XEN_DEPS=$(XEN_libxenctrl)/libxenctrl.so
> >> +XEN_DEPS+=$(XEN_libxenevtchn)/libxenevtchn.so
> >> +XEN_DEPS+=$(XEN_libxenguest)/libxenguest.so
> >> +
> >> +# Cannot be generated from dune
> >> +# Tell the user how to generate them
> >> +../include/xen/xen.h ../config.status $(XEN_DEPS):
> >> +	echo "Missing C headers or libraries" >&2
> >> +	echo "Run make -C $(XEN_ROOT) build-tools-oxenstored-prepare -j$$(nproc)" >&2
> >> +	exit 1
> >> +
> >> +# dune would refuse to run if there are build artifacts in the source directory
> >> +# if we detect anything then run make clean to ensure these are removed
> >> +# don't always call 'make clean' because it takes ~1.6s
> >> +.PHONY: dune-pre
> >> +dune-pre: ../config.status | ../include/xen/xen.h ../dune-workspace $(XEN_DEPS)
> >> +	$(MAKEN) clean -s
> > 
> > I think it would be much better to tell the user to run clean themself,
> > like we do in the hypervisor tree when trying to do an out-of-tree
> > build. See rule "outputmakefile" in "xen/Makefile".
> 
> 
> I could attempt to detect an unclean tree and abort the build instead with a message saying to run 'make clean'.

The comment already speak detecting unclean source tree, but I guess it
probably still run `make clean` even if clean.

> However detecting an unclean tree isn't necessarily trivial (although I think dune itself would detect and abort the build, so perhaps I can reuse that,
> I'll have to do some experiments).
> Does Xen support out-of-tree builds btw? That might be another option in maintaining a clean source tree without build artifacts.

The toolstack build system doesn't support out-of-tree build. But my
work on non-recursive makefile would potentially allow that.

Having the dune stuff not been run when running for example `make
build-tools` is probably going to make this kind of things awkward at
first. That is both dune and make buids could be use in parallel (not
necessary at the same time) if the developer doesn't pay attention. I
guess later if could have something like `./configure
--enable-ocaml-dune`, there will be less risk of having the make build
ocaml stuff instead of dune as intended by a developer. Also, this could
allow to test dune build in our CI.

Cheers,

-- 
Anthony PERARD


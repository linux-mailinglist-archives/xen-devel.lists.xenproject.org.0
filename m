Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935699D2F2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 17:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818743.1232031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0N2h-0002Bh-Q3; Mon, 14 Oct 2024 15:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818743.1232031; Mon, 14 Oct 2024 15:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0N2h-00029g-Md; Mon, 14 Oct 2024 15:31:31 +0000
Received: by outflank-mailman (input) for mailman id 818743;
 Mon, 14 Oct 2024 15:31:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UBJe=RK=bounce.vates.tech=bounce-md_30504962.670d394f.v1-a2a95156427d4fe882ac8822c5642252@srs-se1.protection.inumbo.net>)
 id 1t0N2g-00029H-Vm
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 15:31:31 +0000
Received: from mail136-14.atl41.mandrillapp.com
 (mail136-14.atl41.mandrillapp.com [198.2.136.14])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6170cde0-8a41-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 17:31:29 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-14.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4XS1RM1RwCz705jTx
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 15:31:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a2a95156427d4fe882ac8822c5642252; Mon, 14 Oct 2024 15:31:27 +0000
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
X-Inumbo-ID: 6170cde0-8a41-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1728919887; x=1729180387;
	bh=qPNWSB8Aaiwjl1oUliY/TuxzP0RaqIWeE0ZoghhhNyg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=QjtOKgWnfy2df/9kjUqGcA+Lz1qcs0Boyesuqcyrr3gdHAzxmWmeypFrSoML0JZc4
	 sqth6SjmTKSaVKM7Z5/Db3SOFV8z6/q+eZLCe70R0VO+aGLqyS4HAYROMM0K5ghHOv
	 VsVaWyv3yuz7TPBjzX9/smmdxj5FSsUZFyNIgNjjujs9cauSqnB8oDrKDtunIIaezY
	 LXkIaHVG5UX0VTUAiF320SZn6hLQMDOCrmbG5Y1MqrznYMP/I2pqvwD6hDZrHM2gpQ
	 hjeunUOZio1/QMq87ut7iI7JAoIMTH6UUYPH61Bbn9ctQeW/qs530gW0JHPYozjI/S
	 ECU1i0Q4SzaGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1728919887; x=1729180387; i=anthony.perard@vates.tech;
	bh=qPNWSB8Aaiwjl1oUliY/TuxzP0RaqIWeE0ZoghhhNyg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DaPXCbOJ9xviS4TZ8GsqSlg/86FF2SmYHF0vVHNdJWeZhbUv/y60c7/FXmZraDsVS
	 mKh+J67YHWa7V635pl70pjdPNLBoOgcVb8sYu0wG0Wu/Jf8tv2sl4qy3SsPdIeWhU0
	 Yfphnwvg25+PNU64eAZZRdjS6GlYr7CcTGRBmMxZkAry81I7RHFzSFMWTvnOukWL6p
	 mNu+W3w2DdB9SdLuxDYtVlYCyyHk3PkSTLAnYJWkIyU2E0KM53Xitv2sQi3R3zr3uZ
	 ZgJptUyckQjz5+iYVvUIIgvf5MyUiLdTWK/82NjIKvrFz7SU8EmY/VoCbBOm4UVwub
	 5MeKdZOWi3ZLQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=202/6]=20x86/boot:=20create=20a=20C=20bundle=20for=2032=20bit=20boot=20code=20and=20use=20it?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1728919885576
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <Zw05Tb8UvCQAIo+n@l14>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com> <20241014085332.3254546-3-frediano.ziglio@cloud.com>
In-Reply-To: <20241014085332.3254546-3-frediano.ziglio@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a2a95156427d4fe882ac8822c5642252?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241014:md
Date: Mon, 14 Oct 2024 15:31:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 1199291d2b..23ad274c89 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,4 +1,5 @@
>  obj-bin-y += head.o
> +obj-bin-y += built_in_32.o

I don't quite like that this new object name is "built_in_32.o",
It's really closed to "built_in.*" which is used by Rules.mk to collect
all objects in a subdirectory. I don't really have a better suggestion at
the moment.

> @@ -9,9 +10,6 @@ targets   += $(obj32)
>  
>  obj32 := $(addprefix $(obj)/,$(obj32))
>  
> -$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
> -$(obj)/head.o: $(obj32:.32.o=.bin)
> -
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
> @@ -25,14 +23,34 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>  $(obj)/%.32.o: $(src)/%.c FORCE
>  	$(call if_changed_rule,cc_o_c)
>  
> +orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
>  LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
>  
> -%.bin: %.lnk
> -	$(OBJCOPY) -j .text -O binary $< $@
> -
> -%.lnk: %.32.o $(src)/build32.lds
> -	$(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> -
> -clean-files := *.lnk *.bin
> +$(obj)/build32.final.lds: AFLAGS-y += -DFINAL
> +$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.lds.S FORCE
> +	$(call if_changed_dep,cpp_lds_S)
> +
> +# link all 32bit objects together
> +$(obj)/built_in_32.tmp.o: $(obj32)
> +	$(LD32) -r -o $@ $^
> +
> +$(obj)/built_in_32.%.bin: $(obj)/build32.%.lds $(obj)/built_in_32.tmp.o
> +## link bundle with a given layout

Could you put the comment aligned with the rest of the recipe? That way
it won't visually separate the rule into several pieces. You can
prefix it with @ so it doesn't show in build logs:

        @# comments

> +	$(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32.$(*F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o

I think this wants to be: -T $(filter %.lds,$^) -Map $(patsubst %.bin,%.map,$@) -o $(patsubst %.bin,%.o,$@) $(filter %.o,$^)

:-(, maybe that's lots of $(patsubst,), not sure which is better between
$(patsubst,) and using the stem $*.

Also, if something tries to use built_in_32.tmp.bin, we have a rule that
remove it's prerequisite.

BTW, everything is kind of temporary in a build system, beside the few
files that we want to install on a machine, so having a target named
with "*tmp*" isn't great. But having a rule that create "*tmp*" file but
remove them before the end of its recipe is fine (or those *tmp* aren't
use outside of this recipe).

> +## extract binaries from object
> +	$(OBJCOPY) -j .text -O binary $(obj)/built_in_32.$(*F).o $@
> +	rm -f $(obj)/built_in_32.$(*F).o
> +
> +# generate final object file combining and checking above binaries
> +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin

So, "other" isn't part of "final", I don't really know what those two
things contains so naming wise I can't suggest anything useful.

But, is "built_in_32.S" really only depends on those two .bin? SHouldn't
it get regenerated if the script changes, or the .lds that --script
option seems to use? What is the "--map" option, an input or output?
But I guess we can ignore the ".map" file because it's part of the
".bin".

Another thing that might be useful to do, is to use the "if_changed"
make macro, that way if the command line of the script changes, make
can remake the output. But maybe it's a bit complicated for this recipe
because it doesn't uses $< or $^.

> +	$(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> +		--script $(obj)/build32.final.lds \
> +		--bin1 $(obj)/built_in_32.other.bin \
> +		--bin2 $(obj)/built_in_32.final.bin \
> +		--map $(obj)/built_in_32.final.map \
> +		--exports cmdline_parse_early,reloc \
> +		--output $@
> +
> +clean-files := built_in_32.*.bin built_in_32.*.map build32.*.lds
> diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
> similarity index 70%
> rename from xen/arch/x86/boot/build32.lds
> rename to xen/arch/x86/boot/build32.lds.S
> index 56edaa727b..50c167aef0 100644
> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -15,22 +15,47 @@
>   * with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -ENTRY(_start)
> +#ifdef FINAL
> +# define GAP 0
> +# define MULT 0
> +# define TEXT_START
> +#else
> +# define GAP 0x010200
> +# define MULT 1
> +# define TEXT_START 0x408020
> +#endif
> +# define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)

Is  ^ this a stray space?


Overall, it's kind of mostly style comment that I had, so feel free to
ignore most of them.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


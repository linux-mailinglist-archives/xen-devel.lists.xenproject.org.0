Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFABE2B8292
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30143.59925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQuK-0006Ec-DM; Wed, 18 Nov 2020 17:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30143.59925; Wed, 18 Nov 2020 17:06:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfQuK-0006ED-9d; Wed, 18 Nov 2020 17:06:12 +0000
Received: by outflank-mailman (input) for mailman id 30143;
 Wed, 18 Nov 2020 17:06:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfQuJ-0006E8-JA
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:06:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfQuH-0006OZ-0e; Wed, 18 Nov 2020 17:06:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfQuG-0003S9-IY; Wed, 18 Nov 2020 17:06:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQuJ-0006E8-JA
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=/qFNyiA3BfnYruEBT82L9stlJ/cQVe0b/IUto/WKBBE=; b=ApldwFrtlGqJ+z56orykA3TL3l
	5FCNNpkmOQcnEKxgioNcorSjmTY9eRsOnV41rqlZ+auiDQgXRqqwVy7Uor9MwHe1EzE63uAYYGRGz
	pc9YcYS1YHDhF6gJZ47gx98091q0oGExH5sq7fsUZ+T3cRH2xOCJy4199rua2h3wcrSY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQuH-0006OZ-0e; Wed, 18 Nov 2020 17:06:09 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfQuG-0003S9-IY; Wed, 18 Nov 2020 17:06:08 +0000
Subject: Re: [PATCH v2 2/8] lib: collect library files in an archive
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <78dccec2-064f-d4b1-1865-eb3f1f14247a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <67740969-1ab1-db7f-5e3c-b15a20c1be8b@xen.org>
Date: Wed, 18 Nov 2020 17:06:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <78dccec2-064f-d4b1-1865-eb3f1f14247a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Anthony)

Hi Jan,

On 23/10/2020 11:17, Jan Beulich wrote:
> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
> just to avoid bloating binaries when only some arch-es and/or
> configurations need generic library routines, combine objects under lib/
> into an archive, which the linker then can pick the necessary objects
> out of.
> 
> Note that we can't use thin archives just yet, until we've raised the
> minimum required binutils version suitably.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/Rules.mk          | 33 +++++++++++++++++++++++++++------
>   xen/arch/arm/Makefile |  6 +++---
>   xen/arch/x86/Makefile |  8 ++++----
>   xen/lib/Makefile      |  3 ++-

IIRC, Anthony worked on the build systems. If I am right, it would be 
good to get a review from him.

>   4 files changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 333e19bec343..e59c7f213f77 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -41,12 +41,16 @@ ALL_OBJS-y               += $(BASEDIR)/xsm/built_in.o
>   ALL_OBJS-y               += $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
>   ALL_OBJS-$(CONFIG_CRYPTO)   += $(BASEDIR)/crypto/built_in.o
>   
> +ALL_LIBS-y               := $(BASEDIR)/lib/lib.a
> +
>   # Initialise some variables
> +lib-y :=
>   targets :=
>   CFLAGS-y :=
>   AFLAGS-y :=
>   
>   ALL_OBJS := $(ALL_OBJS-y)
> +ALL_LIBS := $(ALL_LIBS-y)
>   
>   SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>                                               $(foreach w,1 2 4, \
> @@ -60,7 +64,14 @@ include Makefile
>   # ---------------------------------------------------------------------------
>   
>   quiet_cmd_ld = LD      $@
> -cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
> +cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
> +               --start-group $(filter %.a,$(real-prereqs)) --end-group
> +
> +# Archive
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_ar = AR      $@
> +cmd_ar = rm -f $@; $(AR) cPrs $@ $(real-prereqs)
>   
>   # Objcopy
>   # ---------------------------------------------------------------------------
> @@ -86,6 +97,10 @@ obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
>   # tell kbuild to descend
>   subdir-obj-y := $(filter %/built_in.o, $(obj-y))
>   
> +# Libraries are always collected in one lib file.
> +# Filter out objects already built-in
> +lib-y := $(filter-out $(obj-y), $(sort $(lib-y)))
> +
>   $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
>   
>   ifeq ($(CONFIG_COVERAGE),y)
> @@ -129,19 +144,25 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
>   c_flags += $(CFLAGS-y)
>   a_flags += $(CFLAGS-y) $(AFLAGS-y)
>   
> -built_in.o: $(obj-y) $(extra-y)
> +built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
>   ifeq ($(obj-y),)
>   	$(CC) $(c_flags) -c -x c /dev/null -o $@
>   else
>   ifeq ($(CONFIG_LTO),y)
> -	$(LD_LTO) -r -o $@ $(filter-out $(extra-y),$^)
> +	$(LD_LTO) -r -o $@ $(filter-out lib.a $(extra-y),$^)
>   else
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out $(extra-y),$^)
> +	$(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out lib.a $(extra-y),$^)
>   endif
>   endif
>   
> +lib.a: $(lib-y) FORCE
> +	$(call if_changed,ar)
> +
>   targets += built_in.o
> -targets += $(filter-out $(subdir-obj-y), $(obj-y)) $(extra-y)
> +ifneq ($(strip $(lib-y)),)
> +targets += lib.a
> +endif
> +targets += $(filter-out $(subdir-obj-y), $(obj-y) $(lib-y)) $(extra-y)
>   targets += $(MAKECMDGOALS)
>   
>   built_in_bin.o: $(obj-bin-y) $(extra-y)
> @@ -155,7 +176,7 @@ endif
>   PHONY += FORCE
>   FORCE:
>   
> -%/built_in.o: FORCE
> +%/built_in.o %/lib.a: FORCE
>   	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o
>   
>   %/built_in_bin.o: FORCE
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 296c5e68bbc3..612a83b315c8 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -90,14 +90,14 @@ endif
>   
>   ifeq ($(CONFIG_LTO),y)
>   # Gather all LTO objects together
> -prelink_lto.o: $(ALL_OBJS)
> -	$(LD_LTO) -r -o $@ $^
> +prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
> +	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
>   
>   # Link it with all the binary objects
>   prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
>   	$(call if_changed,ld)
>   else
> -prelink.o: $(ALL_OBJS) FORCE
> +prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
>   	$(call if_changed,ld)
>   endif
>   
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 9b368632fb43..8f2180485b2b 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -132,8 +132,8 @@ EFI_OBJS-$(XEN_BUILD_EFI) := efi/relocs-dummy.o
>   
>   ifeq ($(CONFIG_LTO),y)
>   # Gather all LTO objects together
> -prelink_lto.o: $(ALL_OBJS)
> -	$(LD_LTO) -r -o $@ $^
> +prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
> +	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
>   
>   # Link it with all the binary objects
>   prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y) FORCE
> @@ -142,10 +142,10 @@ prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $
>   prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
>   	$(call if_changed,ld)
>   else
> -prelink.o: $(ALL_OBJS) $(EFI_OBJS-y) FORCE
> +prelink.o: $(ALL_OBJS) $(ALL_LIBS) $(EFI_OBJS-y) FORCE
>   	$(call if_changed,ld)
>   
> -prelink-efi.o: $(ALL_OBJS) FORCE
> +prelink-efi.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
>   	$(call if_changed,ld)
>   endif
>   
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 53b1da025e0d..b8814361d63e 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,2 +1,3 @@
> -obj-y += ctype.o
>   obj-$(CONFIG_X86) += x86/
> +
> +lib-y += ctype.o

May I ask why all the code movement by ctype was done after this patch?

Cheers,

-- 
Julien Grall


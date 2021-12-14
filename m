Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA747488F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 17:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246916.425843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxB4N-0000ib-FN; Tue, 14 Dec 2021 16:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246916.425843; Tue, 14 Dec 2021 16:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxB4N-0000gL-An; Tue, 14 Dec 2021 16:54:27 +0000
Received: by outflank-mailman (input) for mailman id 246916;
 Tue, 14 Dec 2021 16:54:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxB4L-0000gC-Jg
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 16:54:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxB4K-0004KH-Io; Tue, 14 Dec 2021 16:54:24 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxB4K-0002AD-CF; Tue, 14 Dec 2021 16:54:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=upQLjFNoZXCyppKCSlH6HchYl35o/wg3rq4iXzg9dGY=; b=fjqb3aOaUdtKGk2UZeqB7xO7HX
	+MqnHW9YVa3k2Mt7Z+HnwAipNkN9tebH25yb8ql7Yqk1qNYk3El4LJmMaFmpYD4utG4y/lt6gzHci
	Zffcg7icA37P9LDedZ9eGIiX7p7I5Zx3qI3pjEtq2iwl9PyBrHRCa2SH/Ecc1OUu7U7g=;
Message-ID: <f9a5844a-6e70-cb10-a5b8-4bdf55751f5f@xen.org>
Date: Tue, 14 Dec 2021 16:54:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 01/47] build: factorise generation of the linker
 scripts
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-2-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/11/2021 13:39, Anthony PERARD wrote:
> In Arm and X86 makefile, generating the linker script is the same, so
> we can simply have both call the same macro.
> 
> We need to add *.lds files into extra-y so that Rules.mk can find the
> .*.cmd dependency file and load it.
> 
> Change made to the command line:
> - Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
> - Added -D__LINKER__ even it is only used by Arm's lds.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> 
> Notes:
>      v6:
>      - CPP already used instead of CC -E
>      - -Ui386 already removed
>      - cpp_flags is now a macro
>      - rebased
>      
>      v5:
>      - rename cc_lds_S to cpp_lds_S as the binary runned is now CPP
>      - Use new cpp_flags instead of the open-coded filter of a_flags.
>      
>      v4:
>      - fix rebuild by adding FORCE as dependency
>      - Use $(CPP)
>      - remove -Ui386
>      - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
>        still mandatory for if_changed (or cmd) macro to work.
> 
>   xen/Rules.mk          | 4 ++++
>   xen/arch/arm/Makefile | 6 ++++--
>   xen/arch/x86/Makefile | 6 ++++--
>   3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 5e0699e58b2b..d21930a7bf71 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -238,6 +238,10 @@ cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
>   %.s: %.S FORCE
>   	$(call if_changed,cpp_s_S)
>   
> +# Linker scripts, .lds.S -> .lds
> +quiet_cmd_cpp_lds_S = LDS     $@
> +cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
> +
>   # Add intermediate targets:
>   # When building objects with specific suffix patterns, add intermediate
>   # targets that the final targets are derived from.
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 07f634508eee..a3a497bafe89 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -67,6 +67,8 @@ obj-y += vsmc.o
>   obj-y += vpsci.o
>   obj-y += vuart.o
>   
> +extra-y += xen.lds
> +
>   #obj-bin-y += ....o
>   
>   ifneq ($(CONFIG_DTB_FILE),"")
> @@ -132,8 +134,8 @@ $(TARGET)-syms: prelink.o xen.lds
>   .PHONY: include
>   include:
>   
> -xen.lds: xen.lds.S
> -	$(CPP) -P $(a_flags) -D__LINKER__ -MQ $@ -o $@ $<
> +xen.lds: xen.lds.S FORCE

Sorry, I haven't really followed the build system rework. Could you 
explain why it is necessary to add FORCE?

> +	$(call if_changed,cpp_lds_S)
>   
>   dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
>   
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 69b6cfaded25..669e16e72690 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -78,6 +78,7 @@ obj-y += sysctl.o
>   endif
>   
>   extra-y += asm-macros.i
> +extra-y += xen.lds
>   
>   ifneq ($(CONFIG_HVM),y)
>   x86_emulate.o: CFLAGS-y += -Wno-unused-label
> @@ -238,6 +239,7 @@ endif
>   note_file_option ?= $(note_file)
>   
>   ifeq ($(XEN_BUILD_PE),y)
> +extra-y += efi.lds
>   $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
>   ifeq ($(CONFIG_DEBUG_INFO),y)
>   	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
> @@ -290,8 +292,8 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
>   	$(call move-if-changed,$@.new,$@)
>   
>   efi.lds: AFLAGS-y += -DEFI
> -xen.lds efi.lds: xen.lds.S
> -	$(CPP) -P $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
> +xen.lds efi.lds: xen.lds.S FORCE
> +	$(call if_changed,cpp_lds_S)
>   
>   boot/mkelf32: boot/mkelf32.c
>   	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<

Cheers,

-- 
Julien Grall


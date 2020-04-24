Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF171B70D0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:28:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRudE-0002BJ-Hy; Fri, 24 Apr 2020 09:28:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WQMg=6I=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jRudD-0002BE-0v
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:28:23 +0000
X-Inumbo-ID: f11942e2-860d-11ea-9476-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f11942e2-860d-11ea-9476-12813bfff9fa;
 Fri, 24 Apr 2020 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AHYVIHhVlAkflAFAsRfBbteTI7tbMMuMALWu9YVmlV8=; b=pusYgODybTlp/jvi1FUiqNbmbc
 GW4qoNdK/H+LV/8lTRmXZWKLTm2scGJipXaQGa1JW9+nQS3ddqmQ44iOBTa3yJIzhAsKy0SM00Hgh
 92hJ8a3JrSCDp9rpCdLXjIr+IviJY7lENDIOFiCipZG1TLPCE5z5Y96A1fEONIQ3puKk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jRud7-00043m-95; Fri, 24 Apr 2020 09:28:17 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jRud6-00060d-Rg; Fri, 24 Apr 2020 09:28:17 +0000
Subject: Re: [XEN PATCH v5 07/16] xen/build: Start using if_changed
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20200421161208.2429539-1-anthony.perard@citrix.com>
 <20200421161208.2429539-8-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ae6ab56-c93b-a26a-8d1c-bc79307d7e79@xen.org>
Date: Fri, 24 Apr 2020 10:28:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421161208.2429539-8-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 21/04/2020 17:11, Anthony PERARD wrote:
> This patch start to use if_changed introduced in a previous commit.
> 
> Whenever if_changed is called, the target must have FORCE as
> dependency so that if_changed can check if the command line to be
> run has changed, so the macro $(real-prereqs) must be used to
> discover the dependencies without "FORCE".
> 
> Whenever a target isn't in obj-y, it should be added to extra-y so the
> .*.cmd dependency file associated with the target can be loaded. This
> is done for xsm/flask/ and both common/lib{elf,fdt}/ and
> arch/x86/Makefile.
> 
> For the targets that generate .*.d dependency files, there's going to
> be two dependency files (.*.d and .*.cmd) until we can merge them
> together in a later patch via fixdep from Linux.
> 
> One cleanup, libelf-relocate.o doesn't exist anymore.
> 
> We import cmd_ld and cmd_objcopy from Linux v5.4.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

For the Arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> 
> Notes:
>      v4:
>      - typos
>      - fix missing FORCE in libfdt/Makefile
>      - typo flask vs flash in xsm
>      - in xsm, use *_H_DEPEND in command lines of mkaccess and mkflask
>        instead of $(real-prereq) to avoid including the script as argument of
>        itself.
> 
>   xen/Rules.mk               | 68 +++++++++++++++++++++++++++-----------
>   xen/arch/arm/Makefile      |  4 +--
>   xen/arch/x86/Makefile      |  1 +
>   xen/arch/x86/efi/Makefile  |  7 ++--
>   xen/common/libelf/Makefile | 12 ++++---
>   xen/common/libfdt/Makefile | 11 +++---
>   xen/xsm/flask/Makefile     | 17 +++++++---
>   7 files changed, 85 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index 21cac7f5f51a..2e28c572305a 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -56,6 +56,18 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>   
>   include Makefile
>   
> +# Linking
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_ld = LD      $@
> +cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
> +
> +# Objcopy
> +# ---------------------------------------------------------------------------
> +
> +quiet_cmd_objcopy = OBJCOPY $@
> +cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
> +
>   define gendep
>       ifneq ($(1),$(subst /,:,$(1)))
>           DEPS += $(dir $(1)).$(notdir $(1)).d
> @@ -164,29 +176,47 @@ else
>   	$(CC) $(c_flags) -c $< -o $@
>   endif
>   
> -%.o: %.S Makefile
> -	$(CC) $(a_flags) -c $< -o $@
> +quiet_cmd_cc_o_S = CC      $@
> +cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
> +
> +%.o: %.S FORCE
> +	$(call if_changed,cc_o_S)
> +
> +
> +quiet_cmd_obj_init_o = INIT_O  $@
> +define cmd_obj_init_o
> +    $(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | while read idx name sz rest; do \
> +        case "$$name" in \
> +        .*.local) ;; \
> +        .text|.text.*|.data|.data.*|.bss) \
> +            test $$sz != 0 || continue; \
> +            echo "Error: size of $<:$$name is 0x$$sz" >&2; \
> +            exit $$(expr $$idx + 1);; \
> +        esac; \
> +    done; \
> +    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
> +endef
> +
> +$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
> +	$(call if_changed,obj_init_o)
> +
> +quiet_cmd_cpp_i_c = CPP     $@
> +cmd_cpp_i_c = $(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
> +
> +quiet_cmd_cc_s_c = CC      $@
> +cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
>   
> -$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o Makefile
> -	$(OBJDUMP) -h $< | sed -n '/[0-9]/{s,00*,0,g;p;}' | while read idx name sz rest; do \
> -		case "$$name" in \
> -		.*.local) ;; \
> -		.text|.text.*|.data|.data.*|.bss) \
> -			test $$sz != 0 || continue; \
> -			echo "Error: size of $<:$$name is 0x$$sz" >&2; \
> -			exit $$(expr $$idx + 1);; \
> -		esac; \
> -	done
> -	$(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
> +quiet_cmd_s_S = CPP     $@
> +cmd_s_S = $(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
>   
> -%.i: %.c Makefile
> -	$(CPP) $(filter-out -Wa$(comma)%,$(c_flags)) $< -o $@
> +%.i: %.c FORCE
> +	$(call if_changed,cpp_i_c)
>   
> -%.s: %.c Makefile
> -	$(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
> +%.s: %.c FORCE
> +	$(call if_changed,cc_s_c)
>   
> -%.s: %.S Makefile
> -	$(CPP) $(filter-out -Wa$(comma)%,$(a_flags)) $< -o $@
> +%.s: %.S FORCE
> +	$(call if_changed,cpp_s_S)
>   
>   # Add intermediate targets:
>   # When building objects with specific suffix patterns, add intermediate
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 9f1ab2335756..b79ad55646bd 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -97,8 +97,8 @@ prelink_lto.o: $(ALL_OBJS)
>   prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o
>   	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
>   else
> -prelink.o: $(ALL_OBJS)
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +prelink.o: $(ALL_OBJS) FORCE
> +	$(call if_changed,ld)
>   endif
>   
>   $(TARGET)-syms: prelink.o xen.lds
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index a805e9982e85..44137d919b66 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -71,6 +71,7 @@ obj-$(CONFIG_TBOOT) += tboot.o
>   obj-y += hpet.o
>   obj-y += vm_event.o
>   obj-y += xstate.o
> +extra-y += asm-macros.i
>   
>   x86_emulate.o: x86_emulate/x86_emulate.c x86_emulate/x86_emulate.h
>   
> diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> index 490d791aae2d..3e4c395b7535 100644
> --- a/xen/arch/x86/efi/Makefile
> +++ b/xen/arch/x86/efi/Makefile
> @@ -1,7 +1,10 @@
>   CFLAGS-y += -fshort-wchar
>   
> -%.o: %.ihex
> -	$(OBJCOPY) -I ihex -O binary $< $@
> +quiet_cmd_objcopy_o_ihex = OBJCOPY $@
> +cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
> +
> +%.o: %.ihex FORCE
> +	$(call if_changed,objcopy_o_ihex)
>   
>   boot.init.o: buildid.o
>   
> diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
> index 464c448d9d37..a92326c982e9 100644
> --- a/xen/common/libelf/Makefile
> +++ b/xen/common/libelf/Makefile
> @@ -1,12 +1,16 @@
>   obj-bin-y := libelf.o
>   nocov-y += libelf.o
> +libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
>   
>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> +OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>   
>   CFLAGS-y += -Wno-pointer-sign
>   
> -libelf.o: libelf-temp.o Makefile
> -	$(OBJCOPY) $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
> +libelf.o: libelf-temp.o FORCE
> +	$(call if_changed,objcopy)
>   
> -libelf-temp.o: libelf-tools.o libelf-loader.o libelf-dominfo.o #libelf-relocate.o
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +libelf-temp.o: $(libelf-objs) FORCE
> +	$(call if_changed,ld)
> +
> +extra-y += libelf-temp.o $(libelf-objs)
> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
> index e2a5e59380a0..6bd207cf8ffa 100644
> --- a/xen/common/libfdt/Makefile
> +++ b/xen/common/libfdt/Makefile
> @@ -1,14 +1,17 @@
>   include Makefile.libfdt
>   
>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
> +OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>   
>   obj-y += libfdt.o
>   nocov-y += libfdt.o
>   
>   CFLAGS-y += -I$(BASEDIR)/include/xen/libfdt/
>   
> -libfdt.o: libfdt-temp.o Makefile
> -	$(OBJCOPY) $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
> +libfdt.o: libfdt-temp.o FORCE
> +	$(call if_changed,objcopy)
>   
> -libfdt-temp.o: $(LIBFDT_OBJS)
> -	$(LD) $(XEN_LDFLAGS) -r -o $@ $^
> +libfdt-temp.o: $(LIBFDT_OBJS) FORCE
> +	$(call if_changed,ld)
> +
> +extra-y += libfdt-temp.o $(LIBFDT_OBJS)
> diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
> index 6db396347b1f..eebfceecc5fb 100644
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -20,12 +20,21 @@ AV_H_FILES = include/av_perm_to_string.h include/av_permissions.h
>   ALL_H_FILES = $(FLASK_H_FILES) $(AV_H_FILES)
>   
>   $(obj-y) ss/built_in.o: $(ALL_H_FILES)
> +extra-y += $(ALL_H_FILES)
>   
> -$(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND)
> -	$(CONFIG_SHELL) policy/mkflask.sh $(AWK) include $(FLASK_H_DEPEND)
> +mkflask := policy/mkflask.sh
> +quiet_cmd_mkflask = MKFLASK $@
> +cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
>   
> -$(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND)
> -	$(CONFIG_SHELL) policy/mkaccess_vector.sh $(AWK) $(AV_H_DEPEND)
> +$(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
> +	$(call if_changed,mkflask)
> +
> +mkaccess := policy/mkaccess_vector.sh
> +quiet_cmd_mkaccess = MKACCESS VECTOR $@
> +cmd_mkaccess = $(CONFIG_SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
> +
> +$(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
> +	$(call if_changed,mkaccess)
>   
>   obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
>   flask-policy.o: policy.bin
> 

-- 
Julien Grall


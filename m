Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1ABA6BFE0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 17:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924312.1327584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvfEW-0007Ry-33; Fri, 21 Mar 2025 16:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924312.1327584; Fri, 21 Mar 2025 16:28:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvfEV-0007Oq-Vk; Fri, 21 Mar 2025 16:28:31 +0000
Received: by outflank-mailman (input) for mailman id 924312;
 Fri, 21 Mar 2025 16:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMoj=WI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tvfEU-0007Ok-Eb
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 16:28:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 858309f8-0671-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 17:28:29 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e673822f76so3550828a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 09:28:29 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebcd0cefdcsm1586358a12.58.2025.03.21.09.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 09:28:27 -0700 (PDT)
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
X-Inumbo-ID: 858309f8-0671-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742574508; x=1743179308; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQVWrsgHFakcCxfbElvHPfVm4H97p6wNtLwEGYOXOac=;
        b=PPvD1/pY2oAjzQMwJauV4WG8TG3IpDhg6nasNbS/ddgKt//AiIX8mf8e4iqhcRi8s7
         3mIbwxOaeT/7g5sheIUhedkiojoMMQZFHwfxnqeZZbNYAD4GgQmd436qXa7QIOtY7GQZ
         H5kAbLoUuvmzCnMMVYlzdIQNfi1iCOyeza13IyBlR5hi9tOQg2vB2UAayiRJiNSfQWe4
         p8GvELZg4nHevYigIThUBDbDTD1h5z0wY0dpWLQFcAyIP7PJPtwzeZL49v0jI5TEKl73
         yGoRq5mq2eivOPy1UD+LPdx7UZw95OQE9ebAqWJWPy9+yyniHVaRCkHeRPYsXxrY8ErQ
         jz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742574508; x=1743179308;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EQVWrsgHFakcCxfbElvHPfVm4H97p6wNtLwEGYOXOac=;
        b=D54Bibv95rKGd225Lw8Z+I670/+j5gv4yEtnVtJeWYbH9BlWpKXWtjgviDXCnkaY3l
         EWjuAGJAx6WsGq3e08EpLPRedVmljs8daQkxNhLgQthkR66LLDdQo89PQOV7s8xaElLu
         EuX0GQMkukNIeIVfkGiHoLZQh1yTWm4JnU9c6d9y9RvbC/WvktniIkACRWwZNw2cVioH
         kOst8S3gDoBoCUaX/HGDC+FbknobYwohgmoTTY/cI0809yBm3cg0DLIkE1W1LKigcF/Y
         /2X+IyOAKeomY81bVL3XA/k5d8aQwwftN7Ar3jxCQoVXpIVV/0p/3sbbfVgNeDN9Q02w
         3Ezg==
X-Forwarded-Encrypted: i=1; AJvYcCUYK6Fg0KGoP5tW9mM3g93YoGO1IxCmWxbO2KWUqskIYovoRB1bqtG3cbuKHEVR1EPHjzpXhtS5Qsc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnFBm9Maa8S84WhvOh/K7kOsIhcpO2Y8d14vjDgA/EKyyQ1nAx
	c1NuOJjISuTms9kncO2Nj5rJtVdpVu4Xv9sBM/oqAWtx3vXFaK9M
X-Gm-Gg: ASbGncsD53jhnAf8EFMIsDTjVIDsgFKL0gkSuIS8m3/wXcw7Mull3/NpOQgvy8ryVNc
	OknkEHee12IlDrXcTBnB4+PQ+wINwiNc2O7j36Acde6KO9SeBM0evz9o9Q8afOikqD7cU31kQTE
	TDTdwkOWGetUvuIXa6VNq5AEYMDw/KkQcmjck5SGgn93Dv2cE7qH31kHv3ilk7/NSvf0r4qQTj5
	ITO2DpJcbzOSqeK6b3PtI7iYBymSBiNrskjbByhIL7TTSSPiqUakFhK6ElPp7CEMEISh1s8ydG4
	kmZ11TYrJSMMPJ9LPc1ZTsBak1T7luPwg+UI8Hak8KsES13c3qrjB6nd7QvVrD81xSZQqc6Ilzp
	LWkJjRvvluTjM5+9aeJCB
X-Google-Smtp-Source: AGHT+IGvub3MNvbsnlPd52yDi5syBO5c1Kn6IOqufsUvNuO0ujGvTXHwi/pbmwKtb2xK/2yw603jUw==
X-Received: by 2002:a05:6402:234e:b0:5e7:b092:3114 with SMTP id 4fb4d7f45d1cf-5ebcd4337e2mr3784492a12.9.1742574508188;
        Fri, 21 Mar 2025 09:28:28 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------7NuG1c9dBtYdsZQgG2a7P1vp"
Message-ID: <9558d87f-582f-4e0f-ad2b-bb78e6e53f1e@gmail.com>
Date: Fri, 21 Mar 2025 17:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen: remove -N from the linker command line
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20250318173547.59475-1-roger.pau@citrix.com>
 <20250318173547.59475-4-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250318173547.59475-4-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------7NuG1c9dBtYdsZQgG2a7P1vp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/18/25 6:35 PM, Roger Pau Monne wrote:
> It's unclear why -N is being used in the first place.  It was added by
> commit 40828c657dd0c back in 2004 without any justification.
>
> When building a PE image it's actually detrimental to forcefully set the
> .text section as writable.  The GNU LD man page contains the following
> warning regarding the -N option:
>
>> Note: Although a writable text section is allowed for PE-COFF targets, it
>> does not conform to the format specification published by Microsoft.
> Remove the usage of -N uniformly on all architectures, assuming that the
> addition was simply done as a copy and paste of the original x86 linking
> rune.
>
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
>   xen/arch/arm/Makefile   |  6 +++---
>   xen/arch/ppc/Makefile   |  6 +++---
>   xen/arch/riscv/Makefile |  6 +++---

I think it is enough Jan's Reviewed-by, but just in case:
  Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   xen/arch/x86/Makefile   | 12 ++++++------
>   4 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 4837ad467a06..129a109d6ec5 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -97,19 +97,19 @@ ifeq ($(CONFIG_ARM_64),y)
>   endif
>   
>   $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>   	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>   	    $(dot-target).0.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).1.o -o $@
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
> index 655d212f6687..cf27bcebb25a 100644
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -12,19 +12,19 @@ $(TARGET): $(TARGET)-syms
>   	cp -f $< $@
>   
>   $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>   	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>   	    $(dot-target).0.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).1.o -o $@
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index b0c8270a9947..516f5d505ca8 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -16,19 +16,19 @@ $(TARGET): $(TARGET)-syms
>   	$(OBJCOPY) -O binary -S $< $@
>   
>   $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>   	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
>   	    $(dot-target).0.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).1.o -o $@
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index f59c9665fdd0..c2f1dcf301d6 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -139,19 +139,19 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
>   CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>   
>   $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
>   	$(NM) -pa --format=sysv $(dot-target).0 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).0.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).0.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(dot-target).0.o -o $(dot-target).1
>   	$(NM) -pa --format=sysv $(dot-target).1 \
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
>   		> $(dot-target).1.S
>   	$(MAKE) $(build)=$(@D) $(dot-target).1.o
> -	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
> +	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
>   	    $(orphan-handling-y) $(dot-target).1.o -o $@
>   	$(NM) -pa --format=sysv $@ \
>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> @@ -212,7 +212,7 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
>   	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
>   endif
>   	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
> -	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< $(relocs-dummy) \
> +	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
>   	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
>   	                -o $(dot-target).$(base).0 &&) :
>   	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
> @@ -222,7 +222,7 @@ endif
>   		> $(dot-target).0s.S
>   	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
>   	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
> -	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
> +	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< \
>   	                $(dot-target).0r.o $(dot-target).0s.o $(note_file_option) \
>   	                -o $(dot-target).$(base).1 &&) :
>   	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
> @@ -231,7 +231,7 @@ endif
>   		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>   		> $(dot-target).1s.S
>   	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
> -	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
> +	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
>   	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
>   	      $(note_file_option) -o $@
>   	$(NM) -pa --format=sysv $@ \
--------------7NuG1c9dBtYdsZQgG2a7P1vp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/18/25 6:35 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250318173547.59475-4-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">It's unclear why -N is being used in the first place.  It was added by
commit 40828c657dd0c back in 2004 without any justification.

When building a PE image it's actually detrimental to forcefully set the
.text section as writable.  The GNU LD man page contains the following
warning regarding the -N option:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Note: Although a writable text section is allowed for PE-COFF targets, it
does not conform to the format specification published by Microsoft.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Remove the usage of -N uniformly on all architectures, assuming that the
addition was simply done as a copy and paste of the original x86 linking
rune.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
 xen/arch/arm/Makefile   |  6 +++---
 xen/arch/ppc/Makefile   |  6 +++---
 xen/arch/riscv/Makefile |  6 +++---</pre>
    </blockquote>
    <pre>I think it is enough Jan's Reviewed-by, but just in case:
 Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250318173547.59475-4-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 xen/arch/x86/Makefile   | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4837ad467a06..129a109d6ec5 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -97,19 +97,19 @@ ifeq ($(CONFIG_ARM_64),y)
 endif
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \
 	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 655d212f6687..cf27bcebb25a 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -12,19 +12,19 @@ $(TARGET): $(TARGET)-syms
 	cp -f $&lt; $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \
 	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index b0c8270a9947..516f5d505ca8 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -16,19 +16,19 @@ $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $&lt; $@
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \
 	    $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index f59c9665fdd0..c2f1dcf301d6 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -139,19 +139,19 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
 CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
 
 $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).0.S
 	$(MAKE) $(build)=$(@D) $(dot-target).0.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \
 	    $(dot-target).0.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		&gt; $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
-	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $&lt; $(build_id_linker) \
+	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $&lt; $(build_id_linker) \
 	    $(orphan-handling-y) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
@@ -212,7 +212,7 @@ ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
 endif
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $&lt; $(relocs-dummy) \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $&lt; $(relocs-dummy) \
 	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
 	                -o $(dot-target).$(base).0 &amp;&amp;) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
@@ -222,7 +222,7 @@ endif
 		&gt; $(dot-target).0s.S
 	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
-	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $&lt; \
+	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $&lt; \
 	                $(dot-target).0r.o $(dot-target).0s.o $(note_file_option) \
 	                -o $(dot-target).$(base).1 &amp;&amp;) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).1) \
@@ -231,7 +231,7 @@ endif
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		&gt; $(dot-target).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
-	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $&lt; \
+	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $&lt; \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
 	      $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $@ \
</pre>
    </blockquote>
  </body>
</html>

--------------7NuG1c9dBtYdsZQgG2a7P1vp--


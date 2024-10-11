Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA54699A229
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 12:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816923.1231016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szDLF-0005PG-4y; Fri, 11 Oct 2024 10:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816923.1231016; Fri, 11 Oct 2024 10:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szDLF-0005MT-2F; Fri, 11 Oct 2024 10:57:53 +0000
Received: by outflank-mailman (input) for mailman id 816923;
 Fri, 11 Oct 2024 10:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SPWD=RH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1szDLD-0005MN-0T
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 10:57:51 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7373c5d-87bf-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 12:57:48 +0200 (CEST)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a995f56ea2dso302937666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 03:57:48 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a7ec5800sm201797366b.19.2024.10.11.03.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 03:57:47 -0700 (PDT)
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
X-Inumbo-ID: a7373c5d-87bf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728644268; x=1729249068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9VOY4HNxnSKMilqY8I1r2wq3xhRy/1SsaUOUpiFil1w=;
        b=lXcjei+nIRh60RmDAId+mMc3tRjF92aGdbJoX9hV6n7L6OLF9Jkv7pD0Bo5qD32qI6
         XF6UIygpIOsBk5gDZkiX3PdYx9ji8X70PVHXKtxVluoI8INjA4VBpFs+FidANG5oLK4i
         e5FgH6u450vPHl14wjRFiuzPbQq1opr4zrB6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728644268; x=1729249068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VOY4HNxnSKMilqY8I1r2wq3xhRy/1SsaUOUpiFil1w=;
        b=MvZFUi+fny61tfTwR8K2gXshxcPD34+6IAvci7PNP3uF5/oW2YXHS0TQRMMeo/Ozs6
         fDte4HTidKtyL3tLePfEcKthg5RwirTuIyPxyKeI0T7KEZWtBgdx/IvxU0gzUYNnGbPL
         Tcj4Q/IJ9hex4dAglotmVN8mfsRTD3mBh7j8yQN413P0s0up5r/MxhZQYwEIs4jehpB8
         sapZjWZ7qOpBPRLbLTcb/fh9I525AFqOkqHJ/zcWcV5mukUT3shR7NV/Gmk+ll9WCgp+
         CNR4dlAFIA/kJ8SMKsb3U/Iz/lsCEBTzGYDBgeg7xYgRV/y2y4m/BHYn/VKd+hYH17jX
         D2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL7++/YPtKQx4muNLlwjRna9YZtEnO37rM/02RevQSUEfilJ8OoVSFG6+eTbh6Gsq5BqUcxL3M1RU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw7+7OTXXcwP5kmYIdwnx+jEhOTZEIBHOZvWcF92Ok9P1ZEv2S
	KUmBH3VnCOk9evNKltJPYHG51r54VpmhQFlV8xU66xaBaXa0Z4+AcOUbJTUJYPo=
X-Google-Smtp-Source: AGHT+IEe1mAkpEN5z+LOMDS41nQOE+pVp/K/F7JvjAC97tWG5ccBzRXsD6WCLt7wjqRRf7VnmLuUDw==
X-Received: by 2002:a17:907:e6a4:b0:a99:61d1:348f with SMTP id a640c23a62f3a-a99b95a6ebemr173449666b.52.1728644268084;
        Fri, 11 Oct 2024 03:57:48 -0700 (PDT)
Message-ID: <293bb092-0ea5-4a9b-805d-f23b9b5b13e5@citrix.com>
Date: Fri, 11 Oct 2024 11:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Makefile only] [PATCH v3 1/5] x86/boot: create a C bundle for 32
 bit boot code and use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241011085244.432368-1-frediano.ziglio@cloud.com>
 <20241011085244.432368-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20241011085244.432368-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/2024 9:52 am, Frediano Ziglio wrote:
> <snip>
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

The makefile changes here are not the easiest to follow, because there
are two related things being done.

I experimented, and came up with the following:

   
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/fz-32b-v3.1

which splits the obj32 transformation out of the "totally change how we
link things" which is the purpose of this patch.  The end result is much
clearer to follow IMO.

I've got some other comments, which I've included in the branch, but are
presented here for posterity.

> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index ff0f965876..4cf0d7e140 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,15 +1,18 @@
> +obj32 := cmdline.o
> +obj32 += reloc.o
> +
>  obj-bin-y += head.o
> +obj-bin-y += built_in_32.o
>  
> -head-bin-objs := cmdline.o reloc.o
> +obj32 := $(patsubst %.o,%.32.o,$(obj32))

We're already used to writing out foo.init.o, so just have the .32.o in
list.

This makes patch 3 slightly more obvious, where you're not listing the
same .o in two different obj lists.

>  
> -nocov-y   += $(head-bin-objs)
> -noubsan-y += $(head-bin-objs)
> -targets   += $(head-bin-objs)
> +nocov-y   += $(obj32)
> +noubsan-y += $(obj32)
> +targets   += $(obj32)
>  
> -head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
> +obj32 := $(addprefix $(obj)/,$(obj32))
>  
>  $(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
> -$(obj)/head.o: $(head-bin-objs:.o=.bin)

The AFLAGS-y was only for the .incbin's, so can go away here too.

>  
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> @@ -17,17 +20,46 @@ CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
>  CFLAGS_x86_32 += -nostdinc -include $(filter %/include/xen/config.h,$(XEN_CFLAGS))
>  CFLAGS_x86_32 += $(filter -I% -O%,$(XEN_CFLAGS)) -D__XEN__
>  
> +LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))

Because this is :=, it needs to be after ...

> +
>  # override for 32bit binaries
> -$(head-bin-objs): CFLAGS_stack_boundary :=
> -$(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
> +$(obj32): CFLAGS_stack_boundary :=
> +$(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>  
>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)

... this.

>  
> -%.bin: %.lnk
> -	$(OBJCOPY) -j .text -O binary $< $@
> +$(obj)/%.32.o: $(src)/%.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/build32.final.lds: AFLAGS-y += -DFINAL
> +$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.lds.S
> +	$(call if_changed_dep,cpp_lds_S)

FORCE needs to be a prerequisite to use $(call if_changed_dep)  (Sorry -
I missed this one in the branch I pushed.)

> +
> +orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
> +
> +# link all object files together

All 32bit objects.  It isn't even all objects today (head.o isn't included).

> +$(obj)/built_in_32.tmp.o: $(obj32)
> +	$(LD32) -r -o $@ $(obj32)

$^

> +
> +$(obj)/built_in_32.%.bin: $(obj)/build32.%.lds $(obj)/built_in_32.tmp.o
> +## link bundle with a given layout
> +	$(LD32) $(orphan-handling-y) -N -T $< -Map $(obj)/built_in_32.$(*F).map -o $(obj)/built_in_32.$(*F).o $(obj)/built_in_32.tmp.o
> +## extract binaries from object
> +	$(OBJCOPY) -j .text -O binary $(obj)/built_in_32.$(*F).o $@
> +	rm -f $(obj)/built_in_32.$(*F).o
>  
> -%.lnk: %.o $(src)/build32.lds
> -	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> +# generate final object file combining and checking above binaries
> +$(obj)/built_in_32.o: $(obj)/built_in_32.other.bin $(obj)/built_in_32.final.bin
> +	$(PYTHON) $(srctree)/tools/combine_two_binaries \
> +		--script $(obj)/build32.final.lds \
> +		--bin1 $(obj)/built_in_32.other.bin --bin2 $(obj)/built_in_32.final.bin \
> +		--map $(obj)/built_in_32.final.map \
> +		--exports cmdline_parse_early,reloc \
> +		--section-header '.section .init.text, "ax", @progbits' \
> +		--output $(obj)/built_in_32.s
> +	$(CC) -c $(obj)/built_in_32.s -o $@.tmp
> +	rm -f $(obj)/built_in_32.s $@
> +	mv $@.tmp $@

$(obj)/built_in_32.S: and --output $@

The build system already knows how to turn a .S into a .o.  This form
removed an opencoded $(CC), and leaves built_in_32.S around as an
intermediate to be inspected.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D18890A4A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 20:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699171.1091828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpvqk-0001Cy-P5; Thu, 28 Mar 2024 19:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699171.1091828; Thu, 28 Mar 2024 19:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpvqk-0001AB-M6; Thu, 28 Mar 2024 19:55:46 +0000
Received: by outflank-mailman (input) for mailman id 699171;
 Thu, 28 Mar 2024 19:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Cl4=LC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rpvqj-0001A5-FS
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 19:55:45 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2947a782-ed3d-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 20:55:44 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4154d24cc77so684525e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 12:55:43 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bq21-20020a5d5a15000000b00341cb22a8d4sm2523839wrb.108.2024.03.28.12.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 12:55:42 -0700 (PDT)
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
X-Inumbo-ID: 2947a782-ed3d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711655743; x=1712260543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/IDWIb0SW/9AwfUtyXDUxnhS3iY9i8OmmoOsMrW3rw=;
        b=Joh588nFHaMeMgr8moGYz63A16n8mOoAxiy3JCFmSTB4UxWKxJCCVNoCNq5CvwBDgU
         3VMwFMAiqPyvmSI3Z/GehAeRrjDaD4/n738NIjroh9S8ad/V01NAfehn4VaRwT3UBCQ3
         Md31up1SeRGk6P5VmMUQ1D/gxZo8M3sX/UVHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655743; x=1712260543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/IDWIb0SW/9AwfUtyXDUxnhS3iY9i8OmmoOsMrW3rw=;
        b=KzDkVSSur7s/QnoONkiMCt0Q3Evu0vzXgjxpiSrakcurau5jVHsgNAM1jjnSsCrlse
         5SbnAsW2j1T8SwpKfsvDTEw/mzk00t3so6gIrJunuK4iAOEcQY8dI4mf+l0lP+bdnnXy
         FJrRPxYMhGvqkshKA3IdXKzRf/vuYGGTZ105fPYuCvqkpELpEofC9s+7zg8Ckl6GL1eW
         p/HCrGdwv9iLO7kzVTmQdHbXOGgZL1jEZ4YAGCdtawVhZErrmFHcKRYDZKeNQbRIXqVR
         Iuf7nhdOMBIZrl5dRUNpvJqXuT7SUR9nLjVcX2iTRBpagPGpHOaxwyF3sI0u+mjvCFve
         aQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2tGSC+p1mGiPfHCmLINDmSpT6WtDDvn2rw49qZjkUW4tompuZBHZ9/P5+59ApSz9Z2KQzhfbnKglG3rHdN/keiLuDO2sKm+8AQJkrIO4=
X-Gm-Message-State: AOJu0YwTVsdx18DuqZG8wGz8raf4yWWLrK9FOzaHuWyvEx8JW0SUMBOM
	q05CDLyhIMFtw6xHYnrBUKc7bngV6rVtcxCLoRDPdJvimOaA75I7hqK7iry11UEUSVLKmrRlLry
	2Cbc=
X-Google-Smtp-Source: AGHT+IFzacOYI2OJoZDJ5c2kX9wF4hZCfGhQLSK6M5dF0WbDQ9QHurO7sRCJ7ryML1IGEVjOMtyrPw==
X-Received: by 2002:a5d:4d07:0:b0:341:cf9b:c8e with SMTP id z7-20020a5d4d07000000b00341cf9b0c8emr45383wrt.50.1711655743040;
        Thu, 28 Mar 2024 12:55:43 -0700 (PDT)
Message-ID: <ff5e2e70-a8d1-49cd-a15d-eb65a58eab34@citrix.com>
Date: Thu, 28 Mar 2024 19:55:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/video: add boot_video_info offset generation to
 asm-offsets
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-2-roger.pau@citrix.com>
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
In-Reply-To: <20240328153523.4155-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/03/2024 3:35 pm, Roger Pau Monne wrote:
> Currently the offsets into the boot_video_info struct are manually encoded in
> video.S, which is fragile.  Generate them in asm-offsets.c and switch the
> current code to use those instead.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

R-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for looking at this.  As you're touching these lines, there are a
few style fixes.

> diff --git a/xen/arch/x86/boot/video.S b/xen/arch/x86/boot/video.S
> index 0ae04f270f8c..a4b25a3b34d1 100644
> --- a/xen/arch/x86/boot/video.S
> +++ b/xen/arch/x86/boot/video.S
> @@ -26,32 +26,13 @@
>  /* Force 400 scan lines for standard modes (hack to fix bad BIOS behaviour */
>  #undef CONFIG_VIDEO_400_HACK
>  
> -/* Positions of various video parameters passed to the kernel */
> -/* (see also include/linux/tty.h) */
> -#define PARAM_CURSOR_POS        0x00
> -#define PARAM_VIDEO_MODE        0x02
> -#define PARAM_VIDEO_COLS        0x03
> -#define PARAM_VIDEO_LINES       0x04
> -#define PARAM_HAVE_VGA          0x05
> -#define PARAM_FONT_POINTS       0x06
> -#define PARAM_CAPABILITIES      0x08
> -#define PARAM_LFB_LINELENGTH    0x0c
> -#define PARAM_LFB_WIDTH         0x0e
> -#define PARAM_LFB_HEIGHT        0x10
> -#define PARAM_LFB_DEPTH         0x12
> -#define PARAM_LFB_BASE          0x14
> -#define PARAM_LFB_SIZE          0x18
> -#define PARAM_LFB_COLORS        0x1c
> -#define PARAM_VESAPM_SEG        0x24
> -#define PARAM_VESAPM_OFF        0x26
> -#define PARAM_VESA_ATTRIB       0x28
>  #define _param(param) bootsym(boot_vid_info)+(param)
>  
>  video:  xorw    %ax, %ax
>          movw    %ax, %gs        # GS is zero
>          cld
>          call    basic_detect    # Basic adapter type testing (EGA/VGA/MDA/CGA)
> -        cmpb    $0,_param(PARAM_HAVE_VGA)
> +        cmpb    $0,_param(BVI_have_vga)

Space

> @@ -160,16 +141,16 @@ mopar_gr:
>  dac_set:
>  # set color size to DAC size
>          movzbw  bootsym(dac_size), %ax
> -        movb    %al, _param(PARAM_LFB_COLORS+0)
> -        movb    %al, _param(PARAM_LFB_COLORS+2)
> -        movb    %al, _param(PARAM_LFB_COLORS+4)
> -        movb    %al, _param(PARAM_LFB_COLORS+6)
> +        movb    %al, _param(BVI_lfb_colors+0)
> +        movb    %al, _param(BVI_lfb_colors+2)
> +        movb    %al, _param(BVI_lfb_colors+4)
> +        movb    %al, _param(BVI_lfb_colors+6)

Spaces

> diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
> index d8903a3ce9c7..91da6b9d3885 100644
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -16,6 +16,10 @@
>  #include <xen/multiboot.h>
>  #include <xen/multiboot2.h>
>  
> +#ifdef CONFIG_VIDEO
> +# include "../boot/video.h"
> +#endif
> +
>  #define DEFINE(_sym, _val)                                                 \
>      asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
>                     :: "i" (_val) )
> @@ -208,4 +212,26 @@ void __dummy__(void)
>  
>      OFFSET(DOMAIN_vm_assist, struct domain, vm_assist);
>      BLANK();
> +
> +#ifdef CONFIG_VIDEO
> +    DEFINE(BVI_size, sizeof(struct boot_video_info));
> +    OFFSET(BVI_cursor_pos, struct boot_video_info, orig_x);
> +    OFFSET(BVI_video_mode, struct boot_video_info, orig_video_mode);
> +    OFFSET(BVI_video_cols, struct boot_video_info, orig_video_cols);
> +    OFFSET(BVI_video_lines, struct boot_video_info, orig_video_lines);
> +    OFFSET(BVI_have_vga, struct boot_video_info, orig_video_isVGA);
> +    OFFSET(BVI_font_points, struct boot_video_info, orig_video_points);
> +    OFFSET(BVI_capabilities, struct boot_video_info, capabilities);
> +    OFFSET(BVI_lfb_linelength, struct boot_video_info, lfb_linelength);
> +    OFFSET(BVI_lfb_width, struct boot_video_info, lfb_width);
> +    OFFSET(BVI_lfb_height, struct boot_video_info, lfb_height);
> +    OFFSET(BVI_lfb_depth, struct boot_video_info, lfb_depth);
> +    OFFSET(BVI_lfb_base, struct boot_video_info, lfb_base);
> +    OFFSET(BVI_lfb_size, struct boot_video_info, lfb_size);
> +    OFFSET(BVI_lfb_colors, struct boot_video_info, colors);
> +    OFFSET(BVI_vesapm_seg, struct boot_video_info, vesapm.seg);
> +    OFFSET(BVI_vesapm_off, struct boot_video_info, vesapm.off);
> +    OFFSET(BVI_vesa_attrib, struct boot_video_info, vesa_attrib);
> +    BLANK();
> +#endif /* CONFIG_VIDEO */

BVI_size traditionally goes last.  MB2 (which I guess you copied?) is a
little odd.

I'd like to start vertically aligning this for readability, like I
started with EFRAME_*.

Happy to fold of all of these tweaks on commit.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C2CBDF25A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 16:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143723.1477364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92lP-00065a-Ss; Wed, 15 Oct 2025 14:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143723.1477364; Wed, 15 Oct 2025 14:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v92lP-00062Z-Pw; Wed, 15 Oct 2025 14:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1143723;
 Wed, 15 Oct 2025 14:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6Sp=4Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v92lO-00062T-Kx
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 14:46:02 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aaf35c60-a9d5-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 16:46:01 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b5c18993b73so293247366b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Oct 2025 07:46:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5ccd1b0287sm243766666b.62.2025.10.15.07.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 07:45:59 -0700 (PDT)
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
X-Inumbo-ID: aaf35c60-a9d5-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539560; x=1761144360; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKs9itulzQQ+jNbelCLQuIxW9DWyqT3F86f0Qi/uvBk=;
        b=hDBFWgK20TK7CAJelj41Yk7SfQujw735j6S31BgAfXN4D5x4kEHo1a2aT1fqbXuRRr
         xPZ/PEKtYyQueCnT7nclIJ2L9nR1DIQx1F7CWrd9ILntPBuDNAtD9djO8xNGbzI5JDrV
         O50QF1wycQv/bo7P2gZRZdI5yc/4D9TkZgoON2ivp2ldeCYBCWtEFC6EAAsYS803915b
         EEUy6xqCGzfY4xqmn5mkgBktszp/xVad52VXcdeDjTb7wfmBcykoQikdktqtbkia2RrI
         6v7w0BIKwIcohAqpbz+j0i5uTjBgZt+X6hMiilytNztgwTLE+6fJZHVInuvM/C2Ci8ly
         jceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539560; x=1761144360;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZKs9itulzQQ+jNbelCLQuIxW9DWyqT3F86f0Qi/uvBk=;
        b=rBuEZfKdQOlpNPZKXjtpnSiPARV8zHlyrsgYhZiynVWaBoJ/5gPcnG50HYpqN+Hm7b
         ibiFK0nnmEYv72q39gB/vwqxJTb+ouML1LeLC4+YSL/JGldkslzNw4kVez3nTx3Ow4H7
         bkxxtuV+GdMeG5Th9w7uWCuKSZW5yq3GUAqDpmHmSJWFAe5LCv2roH0ZxztMmknqVqAs
         nBvy03LZI84xvQdlBkfn5R/xJl88aAi1jqpPr8e4ehS+HyhRlQ6JlKbtWICzOJaRrWtg
         qtgA1wQpl8BLtgp0lfhGdnpHvvcQv/5PnhnLaQ3igRWrMLtE2CIEE92HK5QUPmUWXGcF
         ThOg==
X-Forwarded-Encrypted: i=1; AJvYcCXYwZRHMEJ2OPSJsD+eqaEl9n52Eei0rD0gYXBMgX4+AaELADwuhaifHb7bTQub+/BoPZQk2xKFVG4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymH1SiHeWOlTbjE3sdc+8BEEdCvBASoOftURRuwtd7H3O6WNBX
	lEbl1wbV59SKH01Fbz/AK5ASJBw2bG/ov6aGx/29ZGhnxS9ufzVnXM9v
X-Gm-Gg: ASbGncsphkZE7t6bmmZ1SIeKrzMoMvl8RIp8rMSRTbXfko6E8QlEitebppAI2SK0rsn
	0bRjXKAb+9tinRZIMq0JVT4+h58x8kfX3nwks9MXciTVLcGeYiKKvyYlnV6okPFGBtlIjp5ilgk
	zcgsExMxdJUcstvLf8MyltTBESG8I502yMtWFhxTBmnB13cPn9Lf04Y9QPETa6G2Uqm3WmZ31Ch
	jod38KKRMRY9pPhIe+sx0QoOgLzKDqTUZkTQVChx2ZTI1T/JxmOasREoKi2PLQh1xWlda66Z/Cr
	PctK70OytuKQdMcp/qghRYhgtvK2qh/y+Vm0kMnp44Xn8kS7vM2X4qj16+HXj5zwZt+N/AWovPt
	5mWZV4lD9Z0fayAZ2DuVL6WoniROaJ2W7fcEJgXOl191idYRD6B1ZYP17SXDqtMnXsIGBHCPSsL
	APFJRYZVrQ6+msUfrlxZGC6zG3cORayM4K
X-Google-Smtp-Source: AGHT+IEkPBiCv32zZoT4kaiPzP0pgTvxtZwvWcDInRLb6+3HdJW5CcbetL8Gm2QiZphXDNKbtuHASw==
X-Received: by 2002:a17:907:7f21:b0:b60:18d5:429a with SMTP id a640c23a62f3a-b6018d54f6bmr140152066b.22.1760539560161;
        Wed, 15 Oct 2025 07:46:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------1r4Qo87DkbuaKK5doL0P01vW"
Message-ID: <1689c6cb-da7a-4dbf-b23c-3ce85c22e303@gmail.com>
Date: Wed, 15 Oct 2025 16:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Fix edd=off to skip mbr
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251013211139.8750-1-jason.andryuk@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251013211139.8750-1-jason.andryuk@amd.com>

This is a multi-part message in MIME format.
--------------1r4Qo87DkbuaKK5doL0P01vW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/13/25 11:11 PM, Jason Andryuk wrote:
> When the fixes commit re-arranged the code, it made edd=off jump to the
> mbr code instead of returning from the function.  Previously edd_done
> was immediately before ret and skipped the MBR check.
>
> Replace edd_done with .Ledd_mbr_sig for the start of the MBR checking,
> and replace .Ledd_mbr_sig_skip with .Ledd_done to exit from the function.
>
> edd=off jumps to .Ledd_done to return from the function, and internal
> jumps go to .Ledd_mbr_sig to check edd=skipmbr.
>
> Fixes: 5ec164fd61bd ("x86/boot: re-arrange how/when we do disk I/O")
> Signed-off-by: Jason Andryuk<jason.andryuk@amd.com>

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   xen/arch/x86/boot/edd.S | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/x86/boot/edd.S b/xen/arch/x86/boot/edd.S
> index 3df712bce1..02437511b2 100644
> --- a/xen/arch/x86/boot/edd.S
> +++ b/xen/arch/x86/boot/edd.S
> @@ -25,7 +25,7 @@
>   
>   get_edd:
>           cmpb    $2, bootsym(opt_edd)            # edd=off ?
> -        je      edd_done
> +        je      .Ledd_done
>   
>   # Do the BIOS Enhanced Disk Drive calls
>   # This consists of two calls:
> @@ -48,7 +48,7 @@ edd_check_ext:
>           movb    $0x41, %ah                      # 0x41 Check Extensions Present
>           movw    $0x55AA, %bx                    # magic
>           int     $0x13                           # make the call
> -        jc      edd_done                        # no more BIOS devices
> +        jc      .Ledd_mbr_sig                   # no more BIOS devices
>   
>           cmpw    $0xAA55, %bx                    # is magic right?
>           jne     edd_next                        # nope, next...
> @@ -96,13 +96,13 @@ edd_legacy_done:
>   
>   edd_next:
>           incb    %dl                             # increment to next device
> -        jz      edd_done
> +        jz      .Ledd_mbr_sig
>           cmpb    $EDD_INFO_MAX,bootsym(boot_edd_info_nr)
>           jb      edd_check_ext
>   
> -edd_done:
> +.Ledd_mbr_sig:
>           cmpb    $1, bootsym(opt_edd)            # edd=skipmbr ?
> -        je      .Ledd_mbr_sig_skip
> +        je      .Ledd_done
>   
>   # Read the first sector of each BIOS disk device and store the 4-byte signature
>   .Ledd_mbr_sig_start:
> @@ -160,7 +160,7 @@ edd_done:
>           jb      .Ledd_mbr_sig_read
>   .Ledd_mbr_sig_done:
>           popw    %es
> -.Ledd_mbr_sig_skip:
> +.Ledd_done:
>           ret
>   
>   GLOBAL(boot_edd_info_nr)
--------------1r4Qo87DkbuaKK5doL0P01vW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/13/25 11:11 PM, Jason Andryuk
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251013211139.8750-1-jason.andryuk@amd.com">
      <pre wrap="" class="moz-quote-pre">When the fixes commit re-arranged the code, it made edd=off jump to the
mbr code instead of returning from the function.  Previously edd_done
was immediately before ret and skipped the MBR check.

Replace edd_done with .Ledd_mbr_sig for the start of the MBR checking,
and replace .Ledd_mbr_sig_skip with .Ledd_done to exit from the function.

edd=off jumps to .Ledd_done to return from the function, and internal
jumps go to .Ledd_mbr_sig to check edd=skipmbr.

Fixes: 5ec164fd61bd ("x86/boot: re-arrange how/when we do disk I/O")
Signed-off-by: Jason Andryuk <a class="moz-txt-link-rfc2396E" href="mailto:jason.andryuk@amd.com">&lt;jason.andryuk@amd.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:20251013211139.8750-1-jason.andryuk@amd.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/x86/boot/edd.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/edd.S b/xen/arch/x86/boot/edd.S
index 3df712bce1..02437511b2 100644
--- a/xen/arch/x86/boot/edd.S
+++ b/xen/arch/x86/boot/edd.S
@@ -25,7 +25,7 @@
 
 get_edd:
         cmpb    $2, bootsym(opt_edd)            # edd=off ?
-        je      edd_done
+        je      .Ledd_done
 
 # Do the BIOS Enhanced Disk Drive calls
 # This consists of two calls:
@@ -48,7 +48,7 @@ edd_check_ext:
         movb    $0x41, %ah                      # 0x41 Check Extensions Present
         movw    $0x55AA, %bx                    # magic
         int     $0x13                           # make the call
-        jc      edd_done                        # no more BIOS devices
+        jc      .Ledd_mbr_sig                   # no more BIOS devices
 
         cmpw    $0xAA55, %bx                    # is magic right?
         jne     edd_next                        # nope, next...
@@ -96,13 +96,13 @@ edd_legacy_done:
 
 edd_next:
         incb    %dl                             # increment to next device
-        jz      edd_done
+        jz      .Ledd_mbr_sig
         cmpb    $EDD_INFO_MAX,bootsym(boot_edd_info_nr)
         jb      edd_check_ext
 
-edd_done:
+.Ledd_mbr_sig:
         cmpb    $1, bootsym(opt_edd)            # edd=skipmbr ?
-        je      .Ledd_mbr_sig_skip
+        je      .Ledd_done
 
 # Read the first sector of each BIOS disk device and store the 4-byte signature
 .Ledd_mbr_sig_start:
@@ -160,7 +160,7 @@ edd_done:
         jb      .Ledd_mbr_sig_read
 .Ledd_mbr_sig_done:
         popw    %es
-.Ledd_mbr_sig_skip:
+.Ledd_done:
         ret
 
 GLOBAL(boot_edd_info_nr)
</pre>
    </blockquote>
  </body>
</html>

--------------1r4Qo87DkbuaKK5doL0P01vW--


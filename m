Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F0C5E45F
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 17:36:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162786.1490307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJwmn-0006Jh-16; Fri, 14 Nov 2025 16:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162786.1490307; Fri, 14 Nov 2025 16:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJwmm-0006H4-UM; Fri, 14 Nov 2025 16:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1162786;
 Fri, 14 Nov 2025 16:36:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJwml-0006Gw-Gz
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 16:36:31 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ce0f77-c178-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 17:36:30 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-64149f78c0dso3497508a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 08:36:30 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a498102sm4042494a12.24.2025.11.14.08.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 08:36:29 -0800 (PST)
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
X-Inumbo-ID: 12ce0f77-c178-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763138190; x=1763742990; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RATeqMgtNYio0MBZfJKvc4WkCiH5PtaCMi+RWfYf0Pc=;
        b=i+PeM2YoclgW/5y6ITfhdsEhRPEkFT+92OJWAKeWudJ0j0XCSI5rfY7tLFJy9YQR7d
         hwukXdVnKerYt9GOHwHwBqZajmHGO7YA9I0GjU9IQHDzVe4909s6Kfk3omH9G6nK0DmJ
         dgyjwrmBVez1nRhngFqsFY8xLtVpQAkpXD52JLVMjMld3Zxl4dVuvyzyRcwWyMr45h8m
         WTpJkxg0u93u9LUO1rGq4FEc6MW02mFTaHrfgiPHbUAW5hYi4/wAVCkECIvvECFNsRcn
         Mgxe1DN7hYoJEhiP9YHl6VF96audjQn8TqeIpJUpICdk8xrg/JIeGTQaL3BH4iZkN88I
         qagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763138190; x=1763742990;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RATeqMgtNYio0MBZfJKvc4WkCiH5PtaCMi+RWfYf0Pc=;
        b=J6XPYfWv/zReNlbH6Ip5woU6h6RJ/SUG4WLpocFY5FHgrrpGkmPwQL0QNSw5SfLOWe
         Qf6lFG/2FCKwosE/WkMSUq5tQifZq+M3rXGth5vKLT+KC29xnwG2hiJ/Zsk84LvvU70e
         036l3ODCbKoAdsruOtimha0j1N3DnIdguPZ7SkQd+AK/TTNQWf2N7//8W7m734DuXbxU
         zaOLLZK25tNwZhR0os9Pgo1f/3/tq4P7M8y0OUYmzPx3p9l86lAJqD0CniFt668HjDup
         u+C1QI/C13VIltLoBKph/QnKviyMixyZwpCcEfSCXaJiMEaiq8v7Zl7UegQMYa7+8TUr
         oKOw==
X-Forwarded-Encrypted: i=1; AJvYcCX5ib11mBfzG/NWi0wLb60tufVAX0b06NZ/jahGh2K9dz74uXK37yYux3Jtptwa8kAlM3ozo0pYDFE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFzNc9zNrpm3oASTgFX80hPv2GI/Jv95OUni3wy3inzzj7HHBW
	r1D7dE2xtn1GiL/zD1jeczpi/1Z4Ac6TjRC1H5ycDyj8O9kigw8Ns87O
X-Gm-Gg: ASbGncv+kR6dZmGJ+COe7b0D4Wk1LA4WZJ3y93s+DMQGtxJV7J4eFage20Ha5BhdfOM
	v5/AnywffvqTGuHXcA/t6fH89RGAezStw04x8UlV0rVrrNy5knU8O6OPNr+CMmYv1juoy15okGh
	n0dm9aVsQHGEjXs+xPj6b7Dodxnx+MeZHAWj24cxT12oVruS7U3ED1z3nHfQW3KY+e9/CRUWDC7
	KSiJ2Gvrif9LewVMMEctHhA9GzGbPKvwxoPhV19I4e8q6HgcSwRA7xSmBO73FdL11RgdYeCmC56
	tSkWFKISX+ytty0cirPm73bUysFv7+G1pljHknS70Ov+y2ZD9qvhMINf81FGwp28Per9JarLvx6
	VsMNu8DAOtGgwuU31fseUAXt08XbeF+tyUIM6iWTxPtGi8S8BQVro95AJnDFjkzbxUzkjfPlsZU
	6Z5G9yFe/+QAGPlnzjQjg0D/kPQFr20tu5Q7dEGVnpcXXmggO0Zg==
X-Google-Smtp-Source: AGHT+IEy3ZJUmZJcUPsd/LTTkravs36fsKRRHjeb43/D2dLHfxTpBnN+EwuafJ8l2As8nwCfZysw6Q==
X-Received: by 2002:a17:907:25c4:b0:b6d:6d66:e8e9 with SMTP id a640c23a62f3a-b73679623edmr375395766b.61.1763138189799;
        Fri, 14 Nov 2025 08:36:29 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------zktd4dPiueMU1ucWXh2UWr1O"
Message-ID: <5a5422b8-e8a5-4662-bea1-4604bdfd3d3b@gmail.com>
Date: Fri, 14 Nov 2025 17:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/ucode: Add extra rows to the entrysign model
 table (again)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251114152447.272823-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251114152447.272823-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------zktd4dPiueMU1ucWXh2UWr1O
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/14/25 4:24 PM, Andrew Cooper wrote:
> Link:https://git.kernel.org/tip/dd14022a7ce96963aa923e35cf4bcc8c32f95840
> Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> Found because AMD have released ucode to fix RDSEED on this CPU, and I
> cross-referenced the tables.
>
> Again, for 4.21 even at this juncture.  It wants backporting everywhere in due
> course.

The same as for previous/another patch:
   Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   xen/arch/x86/cpu/microcode/amd.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index 550b8c1e57ec..4a7573c885e5 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -659,6 +659,7 @@ void __init amd_check_entrysign(void)
>       case 0x0b1010: fixed_rev = 0x47; break;
>       case 0x0b2040: fixed_rev = 0x32; break;
>       case 0x0b4040: fixed_rev = 0x32; break;
> +    case 0x0b4041: fixed_rev = 0x02; break;
>       case 0x0b6000: fixed_rev = 0x32; break;
>       case 0x0b6080: fixed_rev = 0x32; break;
>       case 0x0b7000: fixed_rev = 0x32; break;
--------------zktd4dPiueMU1ucWXh2UWr1O
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
    <div class="moz-cite-prefix">On 11/14/25 4:24 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251114152447.272823-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Link: <a class="moz-txt-link-freetext" href="https://git.kernel.org/tip/dd14022a7ce96963aa923e35cf4bcc8c32f95840">https://git.kernel.org/tip/dd14022a7ce96963aa923e35cf4bcc8c32f95840</a>
Fixes: ff8228ab4658 ("x86/ucode: Relax digest check when Entrysign is fixed in firmware")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Found because AMD have released ucode to fix RDSEED on this CPU, and I
cross-referenced the tables.

Again, for 4.21 even at this juncture.  It wants backporting everywhere in due
course.</pre>
    </blockquote>
    <pre>The same as for previous/another patch:
  Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
    href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251114152447.272823-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/x86/cpu/microcode/amd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 550b8c1e57ec..4a7573c885e5 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -659,6 +659,7 @@ void __init amd_check_entrysign(void)
     case 0x0b1010: fixed_rev = 0x47; break;
     case 0x0b2040: fixed_rev = 0x32; break;
     case 0x0b4040: fixed_rev = 0x32; break;
+    case 0x0b4041: fixed_rev = 0x02; break;
     case 0x0b6000: fixed_rev = 0x32; break;
     case 0x0b6080: fixed_rev = 0x32; break;
     case 0x0b7000: fixed_rev = 0x32; break;
</pre>
    </blockquote>
  </body>
</html>

--------------zktd4dPiueMU1ucWXh2UWr1O--


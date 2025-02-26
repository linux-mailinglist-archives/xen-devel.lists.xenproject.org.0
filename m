Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E64A46CF0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 22:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897253.1305956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnOXS-0001Uv-02; Wed, 26 Feb 2025 21:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897253.1305956; Wed, 26 Feb 2025 21:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnOXR-0001Sn-Ti; Wed, 26 Feb 2025 21:01:53 +0000
Received: by outflank-mailman (input) for mailman id 897253;
 Wed, 26 Feb 2025 21:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wRt1=VR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tnOXR-0001Sh-0S
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 21:01:53 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e648ded6-f484-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 22:01:50 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5461a485a72so179740e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 13:01:50 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443bcd51sm2228e87.160.2025.02.26.13.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 13:01:49 -0800 (PST)
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
X-Inumbo-ID: e648ded6-f484-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740603710; x=1741208510; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XvlCCwXCC3V4EL0Hb3a9PkgVKaioYQSI1vAVJN2ZFM=;
        b=aPH2oLFVOcb1ATyZPUIe6nBt2DXzOADkj7Xy4MZ1fj8a4xwKDl9VTJSydwQ+tPVbxl
         Lyj1WsFb7q9E4uWIBcjBjtzbtpiyN+QklJJKCxko1+UQRibvgNCQ07A+UoIqtcgiNsMG
         IKLh2e1SchEvvEXBT1RtCkXYurpmxrEudQ8WVljh/0P57+5oGXD2rB8pYviMMw5qrhoI
         h1r/e2pJrmuwSOE4V6SKwzZhg02aJSSiSJwOajlIhUHlsz6x4rbEYDzICbxmm7YmyLOa
         2DkOASGjJJCdj305DYJYS1l8MHLez7du+NyIHphFfJ6FbHaIUK9G7VIZVqeGYvYfOYXY
         vJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740603710; x=1741208510;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8XvlCCwXCC3V4EL0Hb3a9PkgVKaioYQSI1vAVJN2ZFM=;
        b=nzUoVCGza++GU//jKay3D4lSSDByp5ZOL/Z9831T8AQYD5MANiI8/F3qoe4ebnH9kf
         Lrg0f6qE5y3YdwJ06nrxOkh6tVzU2Wy98EC4elswsY9Am89FZhXV7qMYwlUBbd3igE4K
         HirTb4KZJXNpsn85Hde6RXccoBtRetPvdbqz6T3yOBM4ag5NzOLRo8S3y1umifhUU9sH
         +NOtE5JwT42dYFnjwSJsSpyd0rxXgxpxMYubK0tO+LymdHYf1b9tQPmUJkzDV8Pr+uW4
         KsGVLPFWthgG/pd4j4Hnh8K9wZX5MR3ItiNS+6R1UbOMT6lUrTZgeGU5eTcV3rwon293
         4X/A==
X-Forwarded-Encrypted: i=1; AJvYcCUAPu4CGJavEzkgqJTYYV+2oGW8pgWOfxybd/rQGDcdEoJFBRKW9Pc7k/faPYnFVWoAx8URWE8xr4E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywyc00FHk+ygoF/15gCTQaInj4c/tB7vDtZqNLRsWagQqBk357F
	XK7XEU/YXXwkw72Kd3Gk+wDIFQO2nJG5YiZ97H3O2zONdeq3SHXYWEgbrQ==
X-Gm-Gg: ASbGncv6wR8jj+mtf4tDwxATruKYqEuACdyJCYP+JMm9leIy4J7bU11ZxTwxoZUr74P
	oahHIZyJeUceJSKvwh5X75KRusaGJw3fPissvxWl2QH4R4alyzdTDFyjDUISNqa1M0+3nNbQPQE
	TPYBz9ZrWOX0CSw1eArQRd+teH00v+juGxcd/P9i38eXNVmBRE6VimNrGDstevWGnsrBYTsecHB
	xI118CMLA9T+L+JeY+MFjrEl3w5REnlgZwRLTRu1/u3doApg/MlcVuV7eNigbXKVom12zi1oIWq
	ODGA8NJEsya2ldK9P+BDMU4+h5XYYgaztlM=
X-Google-Smtp-Source: AGHT+IEwXm1rgfm6KXLm0wxsNTb2KxombBVy8fXXCQthniRB1on2oR6qJc+8zQRh3keGw6XqVbwdrw==
X-Received: by 2002:a05:6512:3f2a:b0:549:39ca:13fe with SMTP id 2adb3069b0e04-5493c5b85bamr3083814e87.41.1740603709755;
        Wed, 26 Feb 2025 13:01:49 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ZQVFoV9k7j0ALoD6sMN615ED"
Message-ID: <f22e1d84-45a4-4d9d-a2e0-3b880b8d7704@gmail.com>
Date: Wed, 26 Feb 2025 22:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250226172050.1300771-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------ZQVFoV9k7j0ALoD6sMN615ED
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/26/25 6:20 PM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> Depends on "xen/riscv: make zbb as mandatory"
> ---
>   xen/arch/riscv/include/asm/bitops.h | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
> index d22eec1e87c7..df3df93520c5 100644
> --- a/xen/arch/riscv/include/asm/bitops.h
> +++ b/xen/arch/riscv/include/asm/bitops.h
> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>   #undef NOT
>   #undef __AMO
>   
> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
> +#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
> +
> +#define arch_heightl(x) __builtin_popcountl(x)
> +
>   #endif /* ASM__RISCV__BITOPS_H */
>   
>   /*

LGRM: Reviewed-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

> base-commit: 7cf163879c5add0a4f7f9c987b61f04f8f7051b1
> prerequisite-patch-id: 9ee1f7ebf5d34b1c565ee2d3d4fb319164bb8bcd
> prerequisite-patch-id: 8a05c87c8d051a3ac0820887f676bbd318e4ae88
> prerequisite-patch-id: 6b56e42d130d8b5ee39457b6760b05cc6e16b049
> prerequisite-patch-id: c139f1f5741d695cd5e5aa6be904edcb61b73885
> prerequisite-patch-id: 99f8b701000e9ee11060934e627a988ddf9aaaa7

Could you please tell me how do you generate this one?

~ Oleksii

--------------ZQVFoV9k7j0ALoD6sMN615ED
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
    <div class="moz-cite-prefix">On 2/26/25 6:20 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250226172050.1300771-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:20250226172050.1300771-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Depends on "xen/riscv: make zbb as mandatory"</pre>
    </blockquote>
    <blockquote type="cite"
      cite="mid:20250226172050.1300771-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/riscv/include/asm/bitops.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
index d22eec1e87c7..df3df93520c5 100644
--- a/xen/arch/riscv/include/asm/bitops.h
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
 #undef NOT
 #undef __AMO
 
+#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
+#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
+#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
+#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
+
+#define arch_heightl(x) __builtin_popcountl(x)
+
 #endif /* ASM__RISCV__BITOPS_H */
 
 /*
</pre>
    </blockquote>
    <pre>LGRM: Reviewed-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.</pre>
    <blockquote type="cite"
      cite="mid:20250226172050.1300771-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
base-commit: 7cf163879c5add0a4f7f9c987b61f04f8f7051b1
prerequisite-patch-id: 9ee1f7ebf5d34b1c565ee2d3d4fb319164bb8bcd
prerequisite-patch-id: 8a05c87c8d051a3ac0820887f676bbd318e4ae88
prerequisite-patch-id: 6b56e42d130d8b5ee39457b6760b05cc6e16b049
prerequisite-patch-id: c139f1f5741d695cd5e5aa6be904edcb61b73885
prerequisite-patch-id: 99f8b701000e9ee11060934e627a988ddf9aaaa7</pre>
    </blockquote>
    <pre>Could you please tell me how do you generate this one?</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------ZQVFoV9k7j0ALoD6sMN615ED--


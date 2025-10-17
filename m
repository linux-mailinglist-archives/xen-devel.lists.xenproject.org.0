Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1BBE8D46
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 15:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145199.1478313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9kT0-00012y-0a; Fri, 17 Oct 2025 13:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145199.1478313; Fri, 17 Oct 2025 13:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9kSz-00011S-UF; Fri, 17 Oct 2025 13:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1145199;
 Fri, 17 Oct 2025 13:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vay5=42=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v9kSy-00011G-UH
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 13:25:56 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfc34a48-ab5c-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 15:25:56 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-63c444fe704so245705a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 06:25:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c134141sm19045054a12.34.2025.10.17.06.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 06:25:55 -0700 (PDT)
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
X-Inumbo-ID: cfc34a48-ab5c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760707555; x=1761312355; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgS9zmI+/7b9FcLYt9Iza8f/bxKDs83ZeWeGjzjEzZU=;
        b=HB+JQFC7QI51ga0qwjJf6pM5ZHcdlAQUtcLjW0+lTjPYsD6kqWeyCQtrggezB+XhP6
         ohpMLuppFobVlQHMmbCDlBVGpYy3UHUge6IZQVMJArEW/qjGgj3n3zwoVk6wsd1rRQoC
         Lqi5IlogMRt6mZZ4BdJryk83d5mMzg4OamPSgGLOkbho7IZzS2E8RlgY/uDp2wTGMkuF
         r8Rsv1rqrSU6t0X8amOSHGBUXF7zLXLhASSXSXMR8HupHts4vVS63uq9ksPP4Uyup15K
         Ed76hv1Scni8QgYzwmJ/Wl08srq3smVdh08CMTfoXG+xYl59hLNesz3GhskeP0DoojnJ
         +1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760707555; x=1761312355;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgS9zmI+/7b9FcLYt9Iza8f/bxKDs83ZeWeGjzjEzZU=;
        b=abiZanTqRKcXvfIie3SdrAvgs3rKEQkNT//BAfnk/NJ6JOUxSi3HGJm1xxTwxWyVnn
         3BseBjkudSEveCjtp3kZIK6LVqtPbZaUm5pYHdjLukKJum2D2ss3slVoP/v5yDsXfodN
         dEpLtfVtFq/hXVZGzuM4X6U7XZkAXJdj9inJWVybQkzSyERI2AndN0elBFIkIn/Fy+6I
         jAU7OgWScmPxmTPPcTQrzMUg2jT9zNfAcUxfiY3ROLf5l6hcv4xrfKneZWSjsmwTDu9d
         G0diniYNwms1k/DvPQqbQjaV6RnjQWZckVqLsK7D5gaT+dsfuOpElZ/aKDHmYuFJw/kv
         PYvg==
X-Forwarded-Encrypted: i=1; AJvYcCXaP20NvixKjmO0dAujR7yrYWb89a/3AZyx8hfYU4hxkRTpc3z4sEnGVwi7HKgmjD7qcgwQ4ZPV0WA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqfPk6azhwP56P7B0lGDQCuZZ6qVGqJV0JMRS00XFiwdMqGGPj
	CQKDSkBLqmFnGYxIuFrNfuiAY0EnzREWblhZOA6tmn3yVER3k77LdWlDD3rubQ==
X-Gm-Gg: ASbGncv2WVpOZYSCn39NQwh/kSK+c/MTmFzsNDd6jOwnoL/9zi2M4PAsFd+Id/koq30
	NX2+XS55fzS2S6itXcnHrXZ+05csLDbw6NauE/tztS7ss7nleLnR9d+NC5FCWe6MG1SvOJosBlH
	3zztiN+iAfeBWXUJ3YvmSZ5YU2vJze2P6nCKFwrJMHmosZQ7DKy/WJvagr7rJuG7GBpZJvpVExg
	b1z890/fxoyutCvG/kUTFEZLtVVVBf9o9jci9LKjHp8xPlbg3EBzf/+TVO7Ag0wDDHax9uWFDpJ
	+vIG0dwRfcO+8g/hrGiU1yj6l9Q6/QM+Nqjbzk1AuPartyF5+P4SSsbCqAL/0xIAhFf2vTgn3e/
	f8HXsdLOXsUK3NApT0TRNSUQj1/E2zVHke7AQHKHjvpTorxsaXNEIIZ20ACYQswkWE+nQazRo6n
	z6Tckpw3GW9XntRGbKAMXp5Aqmx50HkoKIrXDl3lGZdtZSm5+mYlx7Ze+OIniKgTvbLu4=
X-Google-Smtp-Source: AGHT+IFdadC86EyeO7qYW1fQkHG2Zz5/1L6LUcB2GLghwevzPPu7ihPazNP/U4zirwSgru32xfbuyg==
X-Received: by 2002:a05:6402:1471:b0:63b:69e1:7a53 with SMTP id 4fb4d7f45d1cf-63c1f6b4d1cmr3371987a12.21.1760707555348;
        Fri, 17 Oct 2025 06:25:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------NcLsiwYpvCVyv4aFyxDKepn8"
Message-ID: <805ce5a2-afeb-4fbb-b070-9b662b462c7e@gmail.com>
Date: Fri, 17 Oct 2025 15:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/ucode: Fix missing printk() newline in
 ucode_probe_amd()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251016232646.2688404-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251016232646.2688404-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------NcLsiwYpvCVyv4aFyxDKepn8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/17/25 1:26 AM, Andrew Cooper wrote:
> Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich<JBeulich@suse.com>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>
> For 4.21.  This is a formatting fix with basically 0 risk.
>
> It is encouraging that no-one has reported this bug so far, because it
> suggests that no-one has turned off digest checking and then looked at dmesg.

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   xen/arch/x86/cpu/microcode/amd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
> index a5729229a403..59332da2b827 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -519,7 +519,7 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
>       if ( !opt_digest_check && boot_cpu_data.family >= 0x17 )
>       {
>           printk(XENLOG_WARNING
> -               "Microcode patch additional digest checks disabled");
> +               "Microcode patch additional digest checks disabled\n");
>           add_taint(TAINT_CPU_OUT_OF_SPEC);
>       }
>   
--------------NcLsiwYpvCVyv4aFyxDKepn8
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
    <div class="moz-cite-prefix">On 10/17/25 1:26 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251016232646.2688404-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Fixes: 630e8875ab36 ("x86/ucode: Perform extra SHA2 checks on AMD Fam17h/19h microcode")
Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:JBeulich@suse.com">&lt;JBeulich@suse.com&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

For 4.21.  This is a formatting fix with basically 0 risk.

It is encouraging that no-one has reported this bug so far, because it
suggests that no-one has turned off digest checking and then looked at dmesg.</pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251016232646.2688404-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/x86/cpu/microcode/amd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index a5729229a403..59332da2b827 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -519,7 +519,7 @@ void __init ucode_probe_amd(struct microcode_ops *ops)
     if ( !opt_digest_check &amp;&amp; boot_cpu_data.family &gt;= 0x17 )
     {
         printk(XENLOG_WARNING
-               "Microcode patch additional digest checks disabled");
+               "Microcode patch additional digest checks disabled\n");
         add_taint(TAINT_CPU_OUT_OF_SPEC);
     }
 
</pre>
    </blockquote>
  </body>
</html>

--------------NcLsiwYpvCVyv4aFyxDKepn8--


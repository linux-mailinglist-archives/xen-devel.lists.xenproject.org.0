Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E869A04811
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 18:20:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866742.1278096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDFK-0005Uf-VI; Tue, 07 Jan 2025 17:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866742.1278096; Tue, 07 Jan 2025 17:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVDFK-0005QI-SV; Tue, 07 Jan 2025 17:20:02 +0000
Received: by outflank-mailman (input) for mailman id 866742;
 Tue, 07 Jan 2025 17:20:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QnJ5=T7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVDFK-0005FA-CM
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 17:20:02 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0306a5e-cd1b-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 18:20:00 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54025432becso16538407e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 09:20:00 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832050sm5203894e87.250.2025.01.07.09.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 09:19:59 -0800 (PST)
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
X-Inumbo-ID: a0306a5e-cd1b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736270400; x=1736875200; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W7H/ynRfDyCOwGwTQA/D5+HSBsFv0UOs9+tG3siBDRE=;
        b=ip44o8ym73mSLCXwxcXqn9grhG9bwYQ1lMtpzG0o4QafYU+29ft66NMuAcsddo44gM
         tG4vTXGTtWpHb2ebbojbTEuCj0Y2VfRCjQsCxfetIrbZZjOzX2Ar8k7BbGpCA543XigJ
         MajPKVhZ1AeOnOKxq3hRn7L54OVIah80u2pjZ7MWhH156SSV23uGZsYQzQ8gdSA9BuVh
         O7CjXCHpJ14RzxYtgTRIb9lJMbzFRjt6d2htyoWow3FPw1/4tToA35NAMoigE2DWe/aB
         /drpdpHptyk3GZiRGFpko+b5V2lruGXxLb6Q63BIBJugQX9kkejLamGnKHXPbw2Nn25v
         sFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270400; x=1736875200;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W7H/ynRfDyCOwGwTQA/D5+HSBsFv0UOs9+tG3siBDRE=;
        b=ZyYLy8HlzysTk3QAVLRbvAdywhYBue82HGe685UNGIOSIcuEhJpf6e47gp7EDr1ARQ
         koqbfQwjrlno4zJ15rSBT6UG25D3Po45x6gs6bl/iwPxwK5l0qdMarWjISWp+THItP3b
         tb/zawg56GdVXokmwDHOAz60aJrgsHvTX8IVJHIzKZQOEDOXzVO76ooV+HUQGdPsgt+u
         mmQ8Shld63mukZ6tV6mr8H0ye3chi1ASjnocI9M+AImUAahyP4VgdaYWveUFjEDkjgpf
         2pYEPXEJq9dJTg8xgbKYYIJc1myEnHEbrFxWjbCQwmC4jgF7/PMGAn7Lz4HbihrRDA5l
         xXZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKCGI5DXpw64ley8xLffhCwEVAqKf58vEOC7cZjQkjo+N7PkXsJNcR16esQxoZNmU9M30hNaE98s0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydzuoyhqJ5KzQXvxQXXZQuBG3aYSiBLZQZGEyj/fX/Nzg2XTT0
	WVpERzkQ/5XRtZ1umYmUMrgORKg6Oahw2GdudIfaLzHd9XNRx4SK
X-Gm-Gg: ASbGncv9TOIqurDUnZk0YmvDay1LaiWFCn1v7cDId2UU2p4BAna/+EJa36lGHSwobkl
	xxK7mLQA7gbNpuP/377Vr13d9b0dr5X5FBfoOLV/lDwtU6xbbSlv8vJ5tTCde62iGG+vITEjpLB
	9c8cSqcDVVy5IzeD2ovAus06vPaEWZJ3NQTOnWTVvf6+4Q2wXM3S+/mrHY58/rQW6gPQwatA6iJ
	aIfN2v1blLOxJGdXWXXgEyEjpYa2qnQCP/5pDCbRYJvl1QjOCYq63mnaXFNlTM+izLavg==
X-Google-Smtp-Source: AGHT+IHP9Fh5K/WdeHPCL/DUkdxLOqZimnO8WuMTtyHiTVToMTjHxZljxmHz9uIPAdEovVMdMkNa3g==
X-Received: by 2002:a05:6512:3b08:b0:542:23b3:d82c with SMTP id 2adb3069b0e04-542295244aamr21108187e87.3.1736270399961;
        Tue, 07 Jan 2025 09:19:59 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------6vxAePtrhmi5yKrdjAaaRm4b"
Message-ID: <f62147a9-baad-49c4-8598-fb57a3505084@gmail.com>
Date: Tue, 7 Jan 2025 18:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: ffa: add changelog entries for FF-A improvements
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Community Manager <community.manager@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com>

This is a multi-part message in MIME format.
--------------6vxAePtrhmi5yKrdjAaaRm4b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 1/7/25 10:02 AM, Bertrand Marquis wrote:
> Add a CHANGELOG entry for release 4.20 to mention the various
> improvements and fixes that have been done in the FF-A support since
> 4.19 release.
>
> Signed-off-by: Bertrand Marquis<bertrand.marquis@arm.com>

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   CHANGELOG.md | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8507e6556a56..d58a2ffd130b 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -22,6 +22,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
>        forwarding the calls to EL3 FW if coming from hwdom.
>      - Support for LLC (Last Level Cache) coloring.
> +   - Several FF-A support improvements: add indirect messages support, transmit
> +     RXTX buffer to the SPMC, fix version negotication and partition
> +     information retrieval.
>    - On x86:
>      - xl suspend/resume subcommands.
>   
--------------6vxAePtrhmi5yKrdjAaaRm4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Bertrand,
</pre>
    <div class="moz-cite-prefix">On 1/7/25 10:02 AM, Bertrand Marquis
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com">
      <pre wrap="" class="moz-quote-pre">Add a CHANGELOG entry for release 4.20 to mention the various
improvements and fixes that have been done in the FF-A support since
4.19 release.

Signed-off-by: Bertrand Marquis <a class="moz-txt-link-rfc2396E" href="mailto:bertrand.marquis@arm.com">&lt;bertrand.marquis@arm.com&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
cite="mid:059ad52a5d2aa6fb7fabe44fe2a99d8b73c1b907.1736240334.git.bertrand.marquis@arm.com">
      <pre wrap="" class="moz-quote-pre">
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8507e6556a56..d58a2ffd130b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -22,6 +22,9 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Basic handling for SCMI requests over SMC using Shared Memory, by allowing
      forwarding the calls to EL3 FW if coming from hwdom.
    - Support for LLC (Last Level Cache) coloring.
+   - Several FF-A support improvements: add indirect messages support, transmit
+     RXTX buffer to the SPMC, fix version negotication and partition
+     information retrieval.
  - On x86:
    - xl suspend/resume subcommands.
 
</pre>
    </blockquote>
  </body>
</html>

--------------6vxAePtrhmi5yKrdjAaaRm4b--


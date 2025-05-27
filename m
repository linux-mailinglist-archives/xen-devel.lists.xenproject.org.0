Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64BAC523E
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 17:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998616.1379340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwO4-0005LJ-3v; Tue, 27 May 2025 15:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998616.1379340; Tue, 27 May 2025 15:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJwO4-0005J8-1J; Tue, 27 May 2025 15:38:44 +0000
Received: by outflank-mailman (input) for mailman id 998616;
 Tue, 27 May 2025 15:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQZn=YL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uJwO2-0005J1-Nx
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 15:38:42 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9fb2510-3b10-11f0-b894-0df219b8e170;
 Tue, 27 May 2025 17:38:40 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad574992fcaso675749366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 08:38:40 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8962b2c3bsm65688466b.113.2025.05.27.08.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 May 2025 08:38:39 -0700 (PDT)
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
X-Inumbo-ID: a9fb2510-3b10-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748360320; x=1748965120; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrUl5ky/RX3+pJxj1HeD9lpoWrX2PDQKHjieULJvXWw=;
        b=CbU5c72U+ZiF3Z957akoxHspa7fnBd3PJgNhY3XDUpu6mMRp2an10wj9kCB7kMH7cF
         XXmSmKpYyuVENddJt7VX3yOZCflB8DgNVTmbFKut56oSYg9DuM2qcCEUbjPmzdJiAsGG
         CwDPeAi3XwkxYHGc2gwdSjo1QTOEgGzTVY+qlm9P+taBZc2+5lC+IML+mKOMFKTVsXOR
         8HAQQ1WBqxV76099G/kXAYXQNMggwRyP54m6VbBAFyxrHL9KOG8TT01k0HW/mnacySxm
         xFTSC+XKVFxdMSAb9IISWFbcEIaQuBpBB3zTcikmNOO5CjwHM2QgFidF1EyeCZEV8Lcg
         SfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748360320; x=1748965120;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VrUl5ky/RX3+pJxj1HeD9lpoWrX2PDQKHjieULJvXWw=;
        b=pYgPQQN6aDk/8SRo+sMFFgLVjOmaut+ZmPfDTTa+GO1mjz4MfN8wC2xEcuYZjzbopr
         Z/TlqzoyvpNVTMJkxoLsnMrn6r3UDc23p8JWQQpzNO0uCZ7eXeMUO7hVj0Mjgo+zxGWm
         Y6d8GDfvVS3SPVbGd+SW4ipdqp9XR2dJqQOmIE52HLIAL6sP+d5s/S94xRYjdyHCkPe/
         VHI6sdRY6QFyvvrjWxPcTxjbBmwDwsRuj4I1wny5RByZHvcEM8eUPRmO0WcAxUFvwN0B
         u4cUfKn/kXnzJq+qBVrsdJ/8pWSVqaeA/eiVCoIWmmSODuoKL3EDcZ9FKCpmBTqiGNb+
         Zt7g==
X-Forwarded-Encrypted: i=1; AJvYcCUsUPHlPNt7EESJvTYV5TY250Whxbrkf4+i6SAPBoDGbhOTUCRx2K42QYRzhjBj0O/c09nhgRcFkfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzRQZHDy5oBgLa/FUtFFoJ8xdEq6GO2iuypJYSQVVRkabk/h435
	47LA9PDBDw/HjKJsuYTg3DkX7hzpeo3HwDjZw9dryl/3FJ9k7Io+uYJm
X-Gm-Gg: ASbGncuoe13OeLCZgdi3ZpeMo3qholgJp4r+PFNwD4+oe5EAmsJ/mQtxrCzThC25hbv
	7eePrzl6XPJtfvKxD9DoNCNA8hKeG0Krj74CDP/82GN766i7oTMQ2b/s6yLPVggKRlwGHx/bers
	iqALOu9/wiZT08Q4wO/Dcgfi0ig/VFVCIq2r8+Qi8Bf3DtnoMveMULVWz/5bCABu/375UkLjXH5
	XLQB4vCxsxUplMLTkI2TWT3/6ENnmR/OrslukB/KgOduMQ/cZjp3y0rvhMY0asuEh2PXFs6fHAU
	x6PdQh0GCNhNBDMfFwt+Aez1gIfsqrhkgXQ5MX121TByutCgW7zdb9JngaUeOFUK56GkhszElFN
	oUX7fo+gxtBsDFNhX7hNE/8d/
X-Google-Smtp-Source: AGHT+IGLkFPPrTnYJz476VtYH4bTIKtYsc+EPSdVu6KwMrPCyuoI1lV0Cf8mej6vVORg02CnKYbPqw==
X-Received: by 2002:a17:906:c153:b0:ad5:55db:e40d with SMTP id a640c23a62f3a-ad85b12060fmr1104796666b.34.1748360319989;
        Tue, 27 May 2025 08:38:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SlhkdWn3jvvfRgtLnKhgME1i"
Message-ID: <87034726-3a26-4146-ad05-655058b9eba9@gmail.com>
Date: Tue, 27 May 2025 17:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 1 4/4] CHANGELOG: Mention Xen suspend/resume to
 RAM feature on arm64
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Community Manager <community.manager@xenproject.org>
References: <cover.1748337249.git.mykola_kvach@epam.com>
 <1035d97375bad4b3e6f86e78cbe4e46abdbc2de9.1748337249.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1035d97375bad4b3e6f86e78cbe4e46abdbc2de9.1748337249.git.mykola_kvach@epam.com>

This is a multi-part message in MIME format.
--------------SlhkdWn3jvvfRgtLnKhgME1i
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Mykola,

On 5/27/25 11:18 AM, Mykola Kvach wrote:
> From: Mykola Kvach<mykola_kvach@epam.com>
>
> Signed-off-by: Mykola Kvach<mykola_kvach@epam.com>
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ec452027f5..fc89ed6e09 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   
>    - On Arm:
>       - Ability to enable stack protector
> +    - Support guest suspend/resume to/from RAM
>   
>   ### Removed
>    - On x86:

According to your commit message, suspend/resume will only work for Arm64.
I think it would be good to mention that in the|CHANGELOG.md| as well.

Also, this implementation adds suspend/resume support via vPSCI, which
I believe is also worth noting in the|CHANGELOG.md|.

Thanks.

~ Oleksii

--------------SlhkdWn3jvvfRgtLnKhgME1i
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello Mykola,
</pre>
    <div class="moz-cite-prefix">On 5/27/25 11:18 AM, Mykola Kvach
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1035d97375bad4b3e6f86e78cbe4e46abdbc2de9.1748337249.git.mykola_kvach@epam.com">
      <pre wrap="" class="moz-quote-pre">From: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>

Signed-off-by: Mykola Kvach <a class="moz-txt-link-rfc2396E" href="mailto:mykola_kvach@epam.com">&lt;mykola_kvach@epam.com&gt;</a>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ec452027f5..fc89ed6e09 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -26,6 +26,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
 
  - On Arm:
     - Ability to enable stack protector
+    - Support guest suspend/resume to/from RAM
 
 ### Removed
  - On x86:
</pre>
    </blockquote>
    <pre data-start="50" data-end="196">According to your commit message, suspend/resume will only work for Arm64.
I think it would be good to mention that in the <code data-start="173"
    data-end="187">CHANGELOG.md</code> as well.</pre>
    <pre data-start="198" data-end="322">Also, this implementation adds suspend/resume support via vPSCI, which
I believe is also worth noting in the <code data-start="307"
    data-end="321">CHANGELOG.md</code>.</pre>
    <pre data-start="324" data-end="331" data-is-last-node=""
    data-is-only-node="">Thanks.</pre>
    <pre>
~ Oleksii
</pre>
  </body>
</html>

--------------SlhkdWn3jvvfRgtLnKhgME1i--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE506C153C9
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 15:49:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152201.1482705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDl08-0001La-Gp; Tue, 28 Oct 2025 14:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152201.1482705; Tue, 28 Oct 2025 14:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDl08-0001Ie-E5; Tue, 28 Oct 2025 14:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1152201;
 Tue, 28 Oct 2025 14:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v5JP=5F=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vDl06-0001IY-SY
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 14:48:42 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 318e9456-b40d-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 15:48:40 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-63c0c9a408aso9822493a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 07:48:40 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7efb97b3sm9142518a12.30.2025.10.28.07.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 07:48:39 -0700 (PDT)
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
X-Inumbo-ID: 318e9456-b40d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761662920; x=1762267720; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4btSMuob+PTJpCRrox18oIJa5C7occWVFLgfYrw6T8=;
        b=hTpQoVk1LmQhPVuj6G6JBtywT68THtq3/P1PJb3dpbhJPoXPCNwZRLo0UMvSGDGPNG
         LYi839Vei1Bxg8nqCgVHCLgHFhp/zRY6X92LpdO5OjoscHAbEgIG6QI/NA5cFtUfysT+
         ZvEburqfs8GywlSSchjKtd/PcAIQHuBdGWlzsGqCf34lu4lYINVbbnpDR7uZTva6uIE2
         Qp7WhASLOGofYPWXyYpH4A3pbyHMJlyl6jJIvOKd/SLsh0yYlNo7mta1xjW4tOk//cal
         2zeR/5aLcjrjZ8nZw7YH1ulGGt5Q6Z82Olx0xc3LaZ2rHr4X+i7QwkRxt44FX/iRPA8n
         1cEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761662920; x=1762267720;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z4btSMuob+PTJpCRrox18oIJa5C7occWVFLgfYrw6T8=;
        b=K+feOOk0GXZHccbF/PjGDGFokKQEniO0lYHf2xzq5wWf2nWJvG0IKzYCzH7mOXEA3p
         DyPHYcosHeuFCY5jhVAmilR9+Y6yI2mbaefJ4rMpy67OtCbZR6mYVIlIqOBHOsufB9hO
         kNyaiQq0CWjcVzK8hCWKtLPPVtUuK45NGJF8dhbqxNS2t6OqD2ToNg1y6ZJO23kSMq74
         EDZsYd4ty9nugm+EzQc20OXNqsuZysWFpfoen8rRQ9k3dhnjcb+cYW0JiMxJHTuw8xfv
         ZRdHinTy74pD2oUiOIkrafkZ87lBlv5aEFa0bUqXr7dig8dk0dOWCv7w/DcrM5eW+AAg
         SiRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPv0xN7qzkDdAL0iptiHNlUeILfD7BeDEsPwh3nb8PuacHWecQ5KqR6x7WgpUjfjZ45+4R3aY6ZCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywuu//2T1epXKM0wpFwxwn8CGgTAsRPS7a4gxtErh+2CC6SCajf
	WFB3m9m8aHLtJ9nWkX79qSp0vR4m9KTnLFOV5iD2VtjDbo6neAgtkjf2
X-Gm-Gg: ASbGncs3GBAr2mLsUAf3kF2phDeZvwBnZdnT9HvjFcXxAA5tH+xCoEROVAbZxNoDhJF
	Tlsv70a5oJcX4rfTTrot6iR1cp85ojZ5ieq/rZaeIetKqIim/tqccPwX/Jjk+JMLJWs9KusY/wR
	dKcCdfgLt7oCELxwwSeufT1EkJopL4Qast+PgE//dljfHDsdnnIdLwHycwXNT0mrl2LpwInbdY3
	4bj2J3aTXrFWVFAkQELZZoGaiXCvo05D6GwRWTi8zJxVmIX9/J/Okz97i7GmIWFAA6PL9/T8NCo
	7JdNTIipyfCP72mbVyQbpDpNxzE63Ls+6qaLzg3vDgCFjJCnNmEF+va0t6gI54DE9vpZ6pV97Gz
	bisJuwtYH96WFV4olIRjHLmpAJNxcwGPKiA+aLpMp+AF0D4gcqIi30qfyMmMp6aWHlYFasOEJx7
	D2lBDPzrBJQgmevYgfBemo+wcQJXT5bEW+M3/q7/6tlsQwqepE/g==
X-Google-Smtp-Source: AGHT+IFgYgrngfRbAk6BAyRTC4eugSvR2IwDvzumFXvIL9rBu94x/NAu+cCR6c8iZa6MXCqZGUxTuA==
X-Received: by 2002:a05:6402:1e8e:b0:63c:2d6:f471 with SMTP id 4fb4d7f45d1cf-63ed8272f41mr3334814a12.26.1761662919958;
        Tue, 28 Oct 2025 07:48:39 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------upk826oVDRl1JuuHYfOJbA5W"
Message-ID: <14a05be4-74d6-406b-a1aa-76ba2ca7f951@gmail.com>
Date: Tue, 28 Oct 2025 15:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 0/5] x86/ucode: Support loading latest ucode from
 linux-firwmare
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251027221702.3362552-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------upk826oVDRl1JuuHYfOJbA5W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/25 11:16 PM, Andrew Cooper wrote:
> linux-firmware now contains microcode signed with the new signature scheme.
> Xen currently refuses to load these as we've not updated the digest list.
>
> The plan was always to stop using the digest list in due course, which is what
> this series does.  A fix for the RDSEED vulnerability is imminent, and it's
> critical that Xen can load this microcode.
>
> As such, this is intended for backport to all trees including security trees,
> and therefore really does need to get into Xen 4.21

Considering that it is security related and will be backported anyway it should
be considered to be in Xen 4.21:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> Andrew Cooper (5):
>    x86/ucode: Abort parallel load early on any control thread error
>    x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
>    x86/ucode: Cross check the minimum revision
>    x86/ucode: Refine the boundary checks for Entrysign
>    x86/ucode: Relax digest check when Entrysign is fixed in firmware
>
>   docs/misc/xen-command-line.pandoc    |   7 +-
>   xen/arch/x86/cpu/microcode/amd.c     | 158 +++++++++++++++++++++++++--
>   xen/arch/x86/cpu/microcode/core.c    |   6 +-
>   xen/arch/x86/cpu/microcode/private.h |   2 +
>   xen/arch/x86/flushtlb.c              |   3 +-
>   xen/arch/x86/include/asm/flushtlb.h  |   5 +
>   6 files changed, 165 insertions(+), 16 deletions(-)
>
--------------upk826oVDRl1JuuHYfOJbA5W
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
    <div class="moz-cite-prefix">On 10/27/25 11:16 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251027221702.3362552-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">linux-firmware now contains microcode signed with the new signature scheme.
Xen currently refuses to load these as we've not updated the digest list.

The plan was always to stop using the digest list in due course, which is what
this series does.  A fix for the RDSEED vulnerability is imminent, and it's
critical that Xen can load this microcode.

As such, this is intended for backport to all trees including security trees,
and therefore really does need to get into Xen 4.21</pre>
    </blockquote>
    <pre>Considering that it is security related and will be backported anyway it should
be considered to be in Xen 4.21:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251027221702.3362552-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

Andrew Cooper (5):
  x86/ucode: Abort parallel load early on any control thread error
  x86/ucode: Refine TLB flush fix for AMD Fam17h CPUs
  x86/ucode: Cross check the minimum revision
  x86/ucode: Refine the boundary checks for Entrysign
  x86/ucode: Relax digest check when Entrysign is fixed in firmware

 docs/misc/xen-command-line.pandoc    |   7 +-
 xen/arch/x86/cpu/microcode/amd.c     | 158 +++++++++++++++++++++++++--
 xen/arch/x86/cpu/microcode/core.c    |   6 +-
 xen/arch/x86/cpu/microcode/private.h |   2 +
 xen/arch/x86/flushtlb.c              |   3 +-
 xen/arch/x86/include/asm/flushtlb.h  |   5 +
 6 files changed, 165 insertions(+), 16 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------upk826oVDRl1JuuHYfOJbA5W--


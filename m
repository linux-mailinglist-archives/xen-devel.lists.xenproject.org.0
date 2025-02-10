Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB4A2E729
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 10:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884456.1294161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPjR-00024h-Lm; Mon, 10 Feb 2025 09:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884456.1294161; Mon, 10 Feb 2025 09:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPjR-00022N-Hm; Mon, 10 Feb 2025 09:05:33 +0000
Received: by outflank-mailman (input) for mailman id 884456;
 Mon, 10 Feb 2025 09:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thPjQ-00022H-OW
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 09:05:32 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e4478c1-e78e-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 10:05:31 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5450cc1669eso680804e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 01:05:31 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450ca84c7fsm259248e87.246.2025.02.10.01.05.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 01:05:30 -0800 (PST)
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
X-Inumbo-ID: 2e4478c1-e78e-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739178331; x=1739783131; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+rYTGexAhoMiyVuE0cQUckuKZ++46SmPwynITA5gZw=;
        b=jPCHfsw3rBlVSx6ByByO0gsQctbKcnmRB3d/VGlopFTwb2Gm6JmTlGhEoGy2EdSBnX
         9eM+lXDDrLhBrRWQT1H3/A+ggSqO6BwnMUCxQXHxmt3d3CKTWgGgxSJlhg+4pZjKyVRQ
         79M14UhyB9WGyJJb0iko56RJIpZyOAqYrHzIDBXZPEqwe79UhwsoSkjjsADbIVNmPOzZ
         RqR7B5lAbfrvBW2zYI5X150GD8uGWwWoC5d8iUl5Qr5iKegqWbnDEB1nyO2uwbJZf+8I
         zWisbecX7SW+wFVB/hjiGm0Y5lOe/SyM5LUcZQrkL4BVuZL8oll0d6GdwWIo2+h7e0KW
         dDrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739178331; x=1739783131;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T+rYTGexAhoMiyVuE0cQUckuKZ++46SmPwynITA5gZw=;
        b=XcZvnYA6h6IBR/oDw5iRvq4mzkQvMdXjvyj8a0eqSF0o4BoZg3ZPRA9kkNSf4dQmMP
         RUzvh1bLaJPoZEms1ptalVZeFUC2N22b2rKvHCTRhCLD7TswP0svYV/QeBxdu5RLh7/n
         disN4krreuP2PReF7p/AnHuuLHhHTdlXo/1TduQTRz2T/fNO6xcR3jQZ/Si0JGDl+a34
         8m0pUKCyB1WHrMBNxtxYIGm1UWOBZapHSodYp1xXU6uEBYafGhJ6XG38FEonSUKSrDDz
         zlclAmm0cd1L0+d9+2L6eeEzbyqsBZD3dv7LCdMnQl4Lh6npJ7sxvQbK6SibpRM6DmFh
         OzVw==
X-Forwarded-Encrypted: i=1; AJvYcCXgvM3195oyN7SLFoWwAO0HMv5Vg1aiFOoVcjTv7OSiVkhq2wwBlgmmgSvSegiy3Yekjb1hxWqlzQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy08jxRT3qiRKQg3MT4ntF08K87ZtWeyK1JSyWlOJm3NEPY7OP+
	w+DvX5VUmTdmZUcUZCDJ4LYnyCv9+j/QvRGySihIiVO3ritGKLLC
X-Gm-Gg: ASbGncubCXGsHxUfjEaxMzpkyH5NJniTqnUneO/EBs5KHIJ+illpK10rQ24QBBw8urk
	Ibq+G6fs4L6NPid0pe0W4PHQ+9Ki30htFBO37M/K64yToIn7nnnCdgnlQa0BpiQIyiJ8vZyKJnb
	oQmXYHbTHKJd20/2qQYJqVk9ssXDRSrFUJ/h4yU9uRam6cL3itRKiVtbJkHSa17/4SmeXAA4AWw
	ex9F2nmaTVEUMnNgYnzef99mh6YFEfBsSZmR4PCCgOsmyTZHFcakiPvikvQsEzsbqPS/1MNhNmS
	xGkRQ5juvCeYIW5YmyY4KLHAkIA=
X-Google-Smtp-Source: AGHT+IF5z5iqh3qWJrN/bnwYRNXLKb5KyELeLenjJDpwe88BWYQpLXqyvRZR976lkUamCPaTOZDA6A==
X-Received: by 2002:a05:6512:2254:b0:545:5de:f46e with SMTP id 2adb3069b0e04-54505def563mr1816755e87.39.1739178331264;
        Mon, 10 Feb 2025 01:05:31 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------VNeXBlzjFKD04pG7X6VhbF4D"
Message-ID: <359347d3-9a5f-4672-98d6-4c497d960059@gmail.com>
Date: Mon, 10 Feb 2025 10:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/3] RISCV: Bugfixes and UBSAN
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250207220122.380214-1-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------VNeXBlzjFKD04pG7X6VhbF4D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/7/25 11:01 PM, Andrew Cooper wrote:
> One bugfix, and two minor patches to get UBSAN working with RISCV.  They
> should be considered for 4.20 at this juncture.

Considering that RISC-V port isn't really usable and changes are quite straightforward
and low risk:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> I tried to get this working everywhere, but:
>
> 1) ARM32 has some problem with dump_execution_state() and dies with an
>     undefined instruction error.
>
> 2) PPC doesn't get any console output, and also appears to have no exception
>     handling either.  Also, when it doesn't succeed, it takes ages to fail.
>
> Andrew Cooper (3):
>    RISCV/boot: Run constructors during setup
>    RISCV/asm: Use CALL rather than JAL
>    RISCV: Activate UBSAN in testing
>
>   automation/gitlab-ci/build.yaml        |  3 +++
>   xen/arch/riscv/Kconfig                 |  1 +
>   xen/arch/riscv/entry.S                 |  2 +-
>   xen/arch/riscv/include/asm/processor.h |  2 ++
>   xen/arch/riscv/riscv64/head.S          | 12 ++++++------
>   xen/arch/riscv/setup.c                 |  2 ++
>   xen/arch/riscv/traps.c                 |  2 +-
>   xen/common/ubsan/ubsan.c               |  5 ++++-
>   8 files changed, 20 insertions(+), 9 deletions(-)
>
--------------VNeXBlzjFKD04pG7X6VhbF4D
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
    <div class="moz-cite-prefix">On 2/7/25 11:01 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">One bugfix, and two minor patches to get UBSAN working with RISCV.  They
should be considered for 4.20 at this juncture.</pre>
    </blockquote>
    <pre>Considering that RISC-V port isn't really usable and changes are quite straightforward
and low risk:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-1-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">

I tried to get this working everywhere, but:

1) ARM32 has some problem with dump_execution_state() and dies with an
   undefined instruction error.

2) PPC doesn't get any console output, and also appears to have no exception
   handling either.  Also, when it doesn't succeed, it takes ages to fail.

Andrew Cooper (3):
  RISCV/boot: Run constructors during setup
  RISCV/asm: Use CALL rather than JAL
  RISCV: Activate UBSAN in testing

 automation/gitlab-ci/build.yaml        |  3 +++
 xen/arch/riscv/Kconfig                 |  1 +
 xen/arch/riscv/entry.S                 |  2 +-
 xen/arch/riscv/include/asm/processor.h |  2 ++
 xen/arch/riscv/riscv64/head.S          | 12 ++++++------
 xen/arch/riscv/setup.c                 |  2 ++
 xen/arch/riscv/traps.c                 |  2 +-
 xen/common/ubsan/ubsan.c               |  5 ++++-
 8 files changed, 20 insertions(+), 9 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------VNeXBlzjFKD04pG7X6VhbF4D--


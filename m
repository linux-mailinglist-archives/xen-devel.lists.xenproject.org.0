Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05DA05699
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 10:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867024.1278426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSGP-00036d-5e; Wed, 08 Jan 2025 09:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867024.1278426; Wed, 08 Jan 2025 09:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVSGP-00035C-32; Wed, 08 Jan 2025 09:22:09 +0000
Received: by outflank-mailman (input) for mailman id 867024;
 Wed, 08 Jan 2025 09:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVSGO-000356-DN
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 09:22:08 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076c4e0e-cda2-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 10:22:06 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54263b52b5aso5985462e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 01:22:06 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238216b5sm5411159e87.182.2025.01.08.01.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 01:22:05 -0800 (PST)
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
X-Inumbo-ID: 076c4e0e-cda2-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736328126; x=1736932926; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqjpxfWCdZecqBpZCVlxu72FWvO6Hft/ghe6n7jAKT8=;
        b=iyhoOYGjZoenBP3yX+BhzPvsCsIiJt+g1TbnYjKTC8PqMxeLCwDolHHPGKVLE9cATM
         6ivSh2B7raZAYvpmlToXHBwupl0k1YjRrLtp0Gh0zjQ0elJJAIiLL8z7bxEeVHGo81B6
         JKL1OejCHG8T5hqjGsJr6talHVK0uzX/kQqSmm4gbQvnYNq6p9QvOYYzR1Bf0bo9ewOj
         n+MWQtEyz0v1cHh0lVobsnchzpPgplUfulZtwCZAOf9Gm24wWgtQqIxXDaN6tAS3IbAJ
         wxujqdZtgr4NXnu1NftLsGPzpfynv26zlqhpYTjprPWRmrzA0VS22ll0okrHl0VF3oIJ
         9I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328126; x=1736932926;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rqjpxfWCdZecqBpZCVlxu72FWvO6Hft/ghe6n7jAKT8=;
        b=IBedHbjFWwLHTWNlgtFofHx68DCe/Ow20U71YaYxyt9tMh1f7gNCHr5SOAq0HEpUz6
         +tf5q9cLlBc1uUxyrqzwg8S1mukURkAXySD884z01NXTZg6PJ+QUrQNi3+rA7sPBeB+c
         Lqkp2HevG0QqBfOGIo8qFue+b8ublCHwCB0GQjRItC56QiuvsM/SjctQfRgFZ2x45tm1
         MXxhxCFwl2h3XNAMHXZhrsDR9i8unag41qw9/2/D5skpThnn3Znh5cTCcxjswAiE1FO/
         z7879cPvm6vP1O+kYeqMPrghsHb3GK9+U1K9NunOHl0GMpKyGJI2Eu54RT1X4nV4vBVT
         e59w==
X-Forwarded-Encrypted: i=1; AJvYcCUzwQQ1ZTo6ZoKsecroZGi37t+qG5whMpglmNsl7PyfupoV51aEPDser76Bz5e+NLUVDVo6as9lpSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH3j54XoBaTwB//HR2O3ppicvmdg6ZcGnkMXTWjGkcNy1psL5l
	qbcxf8HKxCxTykJX+hMFxB1TAf34X7HCbLw6eQSi8Dg+j6EZPlY3
X-Gm-Gg: ASbGnctYsknXWvj3+7ZiD4CaiU1Uh34L4Dk9A7tb1r6P8HmK3NnqtS5h1pLHV5amE6c
	yjYRhfqnSMFgvU1KVU5pQy8cSpjT1nBS+r3RksEET06OwNkLX7aqsrM/hxkDDgEuOzhWu//SMUN
	glYmG8Jw3g3hL3XEdQRzNdCPzcbJpO2bGvyI++hqTPzW4lvGjbxZv5Yg8hbHhlUrKzl7ofi+TU8
	71oQIPb980sM6WuIbLoWsInOrwpd9R2mnVXfGlOYQ7pYSii/m/h6f81OPbR8pT/woziXA==
X-Google-Smtp-Source: AGHT+IEzxkEAw/AmB3IPINzU5suGu9f0me7IeePa5c0D37rgcGveXFOIqhpyiYOzlFOn7p2qVVp0Aw==
X-Received: by 2002:a05:6512:3d25:b0:540:2fe6:6a3a with SMTP id 2adb3069b0e04-54284824497mr591204e87.57.1736328125802;
        Wed, 08 Jan 2025 01:22:05 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------INxmOHM58UpMOZnvV7rjrCbl"
Message-ID: <e365acba-a98c-45f5-b8b4-f566f6c03d70@gmail.com>
Date: Wed, 8 Jan 2025 10:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH] xen/arm64: Drop relocate_and_switch_ttbr() stub
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250108075719.84967-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250108075719.84967-1-michal.orzel@amd.com>

This is a multi-part message in MIME format.
--------------INxmOHM58UpMOZnvV7rjrCbl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/25 8:57 AM, Michal Orzel wrote:
> In the original patch e7a80636f16e ("xen/arm: add cache coloring support
> for Xen image"), the stub was added under wrong assumption that DCE
> won't remove the function call if it's not static. This assumption is
> incorrect as we already rely on DCE for cases like this one. Therefore
> drop the stub, that otherwise would be a place potentially prone to
> errors in the future.
>
> Suggested-by: Julien Grall<julien@xen.org>
> Signed-off-by: Michal Orzel<michal.orzel@amd.com>
> ---
> As suggested by Julien, we should have it for 4.20. Leaving a stub like that
> without something like BUG_ON inside can potentially lead to problems in
> the future provided the function misuse slipped through the review process.
> ---

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

>   xen/arch/arm/arm64/mmu/mm.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 26361c4fe4c0..c1efa1348aee 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -171,8 +171,6 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
>        */
>       update_identity_mapping(false);
>   }
> -#else
> -void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
>   #endif
>   
>   void __init switch_ttbr(uint64_t ttbr)
--------------INxmOHM58UpMOZnvV7rjrCbl
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
    <div class="moz-cite-prefix">On 1/8/25 8:57 AM, Michal Orzel wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250108075719.84967-1-michal.orzel@amd.com">
      <pre wrap="" class="moz-quote-pre">In the original patch e7a80636f16e ("xen/arm: add cache coloring support
for Xen image"), the stub was added under wrong assumption that DCE
won't remove the function call if it's not static. This assumption is
incorrect as we already rely on DCE for cases like this one. Therefore
drop the stub, that otherwise would be a place potentially prone to
errors in the future.

Suggested-by: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
Signed-off-by: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
---
As suggested by Julien, we should have it for 4.20. Leaving a stub like that
without something like BUG_ON inside can potentially lead to problems in
the future provided the function misuse slipped through the review process.
---</pre>
    </blockquote>
    <pre><font face="monospace">Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></font></pre>
    <pre><font face="monospace">~ Oleksii</font>
</pre>
    <blockquote type="cite"
      cite="mid:20250108075719.84967-1-michal.orzel@amd.com">
      <pre wrap="" class="moz-quote-pre">
 xen/arch/arm/arm64/mmu/mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 26361c4fe4c0..c1efa1348aee 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -171,8 +171,6 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
      */
     update_identity_mapping(false);
 }
-#else
-void __init relocate_and_switch_ttbr(uint64_t ttbr) {}
 #endif
 
 void __init switch_ttbr(uint64_t ttbr)
</pre>
    </blockquote>
  </body>
</html>

--------------INxmOHM58UpMOZnvV7rjrCbl--


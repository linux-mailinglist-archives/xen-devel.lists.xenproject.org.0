Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6282BA1D64A
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877885.1288038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOgC-00078V-Qd; Mon, 27 Jan 2025 12:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877885.1288038; Mon, 27 Jan 2025 12:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOgC-00076Z-NG; Mon, 27 Jan 2025 12:57:28 +0000
Received: by outflank-mailman (input) for mailman id 877885;
 Mon, 27 Jan 2025 12:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcOgA-00076M-HJ
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:57:26 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41b41f53-dcae-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 13:57:25 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3a227b82so4016796e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:57:25 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8379be8sm1296968e87.204.2025.01.27.04.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:57:24 -0800 (PST)
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
X-Inumbo-ID: 41b41f53-dcae-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982645; x=1738587445; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWefbBTCeVOk62mw1ZLnk+eLCt1n5rifbFY1laAebzU=;
        b=WaHgmcXfVLYY5g8JvGOFsKgaS4mQBuLI+r6AuiT/Ufb8NCafIx0jFw6YRYY0q09o4O
         iFV8/LqKOnRAzdFz8d0ao/f8+fCZ6aNbZr63q8e32m9HPlKf7Gd9rkxTVYUniRn+QuXq
         4HpLf8tfD6frkiVLftR8Gx/6cXKkLnYADkJMICwFIslreGVO7pVpQ0PHGwCjkKR/h95h
         +IagtJaxAoLQ/KwnA+dNyDgWnK/AxVG/Z681OKDy7yY2YgE2yanpqa3iJAA/adsAHi4a
         vAnlRqE+vqN2Y4ik7L75kZHpuYpEjQqszQB2LOz5WMRSVtr98MOnV2n64zQOyb6+8yVG
         eEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982645; x=1738587445;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWefbBTCeVOk62mw1ZLnk+eLCt1n5rifbFY1laAebzU=;
        b=mW9sGjb+pVAILDeblTh8TGmI7fLWvfJC0pfkqtAdbcZ5f8+lSKMm9p60XmQFNbNSEV
         lhbEh5DQuus0llWdZr7Dv5OkuzneXfuRd255sBZ1n+2M2Nn8mF5cwjBvqkhAqOgDh+5C
         ISKaRYAASua9iWAnmyoTpx2WGqwypSQsAbx5lcuN6/hMBPK0V6Ecp9wf7DxiW3WhUZLM
         h23ZfgJKwh7Eln1xDICG8YjPQZkj2U4pJgu0T34SNKEpurNO8T63p1nS14AsFKVl/4/9
         AOz8xeM3ZxeQZOwXI8qhKKs1SuaMjUuLoPODfL7BykL7/2cPkBPOQtDBFLoD3W1/jdy3
         VyAw==
X-Forwarded-Encrypted: i=1; AJvYcCVSocrJEjdVqa7V0XBU2usdsqDnn9a1WwaJvF62bNeftg7F2L7AynhszMbOFtIGFJnjobt4ni40pQE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ7AUJHQOTj7rFz6Z8/R9lopgUiNC0L6P3jws4Pm/3NTkUy6u0
	rOMWU2X49Ph8RsbBBhNN2pC4gXFNr3Qq7IwRblZlJkthE0kWgtSC
X-Gm-Gg: ASbGncsX0KjIl8MfKt/QBYLyU5iXu9kyDtnJRYB2xujS/rsTMSyYrKC245agT0+PVG4
	j5vMPeq/LQd0Mb/ecpTlQzNvsIe49EQIXDh36ph4RmZvHGbJYRSGEF1joaamsoVY8Zj48zIQxU9
	REPGFtZMM65JVqnu+qf8iXINKoSSigkJvDyCMPgnh+C/NNJ6Oz70WZg/Ighs54OE/G8tIjlEGGw
	2ReOjICTSTnGLVB6MxtDUajmsACQapQKJPwJUlqvrEj+cdBzCeQDNHRwx0VMvk8jtv9ERpd4j2i
	l3CfHiVLVLhfClXVOw==
X-Google-Smtp-Source: AGHT+IGTo+4NTDlsk05yDhdc8NJvuN/hzuvqBVYnlbbV9kfAyx5HQbgBYH3YqWT2/HVoC4MFY9cF3w==
X-Received: by 2002:a19:7618:0:b0:540:3594:aa39 with SMTP id 2adb3069b0e04-5439c218d67mr12071453e87.5.1737982644948;
        Mon, 27 Jan 2025 04:57:24 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------BL6x5PA2XTBJl4e10ja4Dq8l"
Message-ID: <c50c70a6-d408-47a1-a97c-cde9b62108ad@gmail.com>
Date: Mon, 27 Jan 2025 13:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.20][PATCH 0/2] xen/arm CONFIG_PHYS_ADDR_T_32=y fixes
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250127104556.175641-1-michal.orzel@amd.com>

This is a multi-part message in MIME format.
--------------BL6x5PA2XTBJl4e10ja4Dq8l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 11:45 AM, Michal Orzel wrote:
> This series contains build fixes when CONFIG_PHYS_ADDR_T_32=y.
>
> @Oleksii:
> This is a release blocker.

Agree, we can't proceed with release if we have build issues. So with proper review:

R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> Michal Orzel (2):
>    device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
>    xen/arm: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
>
>   xen/arch/arm/include/asm/mm.h    | 2 +-
>   xen/common/device-tree/bootfdt.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
--------------BL6x5PA2XTBJl4e10ja4Dq8l
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
    <div class="moz-cite-prefix">On 1/27/25 11:45 AM, Michal Orzel
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250127104556.175641-1-michal.orzel@amd.com">
      <pre wrap="" class="moz-quote-pre">This series contains build fixes when CONFIG_PHYS_ADDR_T_32=y.

@Oleksii:
This is a release blocker.</pre>
    </blockquote>
    <pre>Agree, we can't proceed with release if we have build issues. So with proper review:</pre>
    <pre>R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>Thanks.
</pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:20250127104556.175641-1-michal.orzel@amd.com">
      <pre wrap="" class="moz-quote-pre">

Michal Orzel (2):
  device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
  xen/arm: Fix build issue when CONFIG_PHYS_ADDR_T_32=y

 xen/arch/arm/include/asm/mm.h    | 2 +-
 xen/common/device-tree/bootfdt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

</pre>
    </blockquote>
  </body>
</html>

--------------BL6x5PA2XTBJl4e10ja4Dq8l--


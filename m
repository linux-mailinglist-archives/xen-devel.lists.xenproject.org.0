Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C8A2E6D9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 09:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884426.1294131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPTp-0006AC-SB; Mon, 10 Feb 2025 08:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884426.1294131; Mon, 10 Feb 2025 08:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thPTp-00068j-OV; Mon, 10 Feb 2025 08:49:25 +0000
Received: by outflank-mailman (input) for mailman id 884426;
 Mon, 10 Feb 2025 08:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMFa=VB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1thPTo-00068d-0U
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 08:49:24 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec140feb-e78b-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 09:49:22 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so4661790e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 00:49:22 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450c4d4989sm285836e87.192.2025.02.10.00.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 00:49:20 -0800 (PST)
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
X-Inumbo-ID: ec140feb-e78b-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739177361; x=1739782161; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kq9KXMaORsH6NPJu+cLjHPa/ww81bQIOsjsLvzAPuTE=;
        b=BZXQbd+0hq2FciMy5s47fapeqsGDClsepG4jz48cOLJeOs9flVyDNT2ghBSz/YzQip
         /2NuYr85fh7YCrgnGfpzp8LwZgVFDay3TSkCBoci+SfiazRG0kJsAW+rxrBfCUsOzRq5
         BOy0t9fX/1dBHQ5bfPejmVIDwkEX3qQwKKORCX8wJLnkOCzmBsdhk1tm5FvzpGpCg734
         /KPvimRkCGmfdkKUBz0kCR3ZKV74SR1sNINdRtrHoenY7fIzUWAYS3GTgc2koMZN4vDv
         vTZOUItYHVt7tqRYzscvZH2QCHeSHs5LACofNmbMqMQ9GaSpPMzMR6eK6zwyIFkeVTAI
         NT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739177361; x=1739782161;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kq9KXMaORsH6NPJu+cLjHPa/ww81bQIOsjsLvzAPuTE=;
        b=QNM8/bX4YihTF0BpWffvcSzuOHummghDPisphUAOoxcG16zuZ1dwcoJ2LrXWOTWttH
         mnmV6VOO3WXUfR8azhsh9aoq7OBN4tkYty7FiiEKWS7PReDY/pFWUcDKpMAx/sqM6Vw/
         MBhKEAo2rALgNb7psP9x/ucPhxvjCEygl2qZsTjO0P6DegvqVoqLA4AcnmzQW1gqF/qb
         PivQxnP7eYCJ17QFnXNBnVqlH/UdO2XXbkPzIWnMOOgEk4szqCGM4JVshCpQdAIDakJE
         N2h7yuLMOmkxKzfqB7Rx/eIcx3G1AsVv7HS3MEuNtqbEjo6cttswIcIqCsthoqoT7eRq
         dVoA==
X-Forwarded-Encrypted: i=1; AJvYcCXxJ6G9X0C0jUMj/u+K0sItmCVYuqdYz62+/oZbRV7mhPqyob+BZprLRrm03LBdGEUwsdQeqy2cXFk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxjdJPo3UqX67BlnmNr9dShBcYV0OAyeD8s1HDYow62rBVScWk
	DxEL8CxuOZFPHz/XC8i53EBnkCYBigS5/TM6UkmxbpHe18xEBiGb
X-Gm-Gg: ASbGncvUKkWQkro369E9btD1Lv4pcJwbt1LKx1xwCWMU2ao/kgtPgJRtfN+Jz6JnVbo
	fnfz+QdAmUrPdL0wj2g5gFoHHnBfttWY6C9p53CHkJP8+zkOEISzw9AA1NK7lIDPEdfI5b7gQJ2
	+1PubbV4ooDwpXASpVutF7uPovzcRkB4kKmqAu5u+OYwciJOR9YBqRKoY4BKX0NuqjDhZIMJEpw
	fBl9SK5SVkUd6FvdIvnxiu+UuA/DBc2txPGFzy5R+pUuFw2ifEFdi4wJ3bPI4U+TCPHygEX82uv
	UrO1E7Zm4LGKzjVow4qmS7Iz/J4=
X-Google-Smtp-Source: AGHT+IGnfHcs91eSYR3ubXqmsKEailRZmdxvd6AR1gTrOsZGQs1twFz0oS30mxUWkbdYzcOpgelESA==
X-Received: by 2002:a05:6512:3ba2:b0:545:ebf:145f with SMTP id 2adb3069b0e04-5450ebf1d0dmr305076e87.53.1739177361011;
        Mon, 10 Feb 2025 00:49:21 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------t1q0IwALVUg4Ku0CruccBYih"
Message-ID: <c07c0942-8dce-4ced-91a4-2c84418fbcb3@gmail.com>
Date: Mon, 10 Feb 2025 09:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 1/3] RISCV/boot: Run constructors during setup
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20250207220122.380214-1-andrew.cooper3@citrix.com>
 <20250207220122.380214-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250207220122.380214-2-andrew.cooper3@citrix.com>

This is a multi-part message in MIME format.
--------------t1q0IwALVUg4Ku0CruccBYih
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2/7/25 11:01 PM, Andrew Cooper wrote:
> Without this, RISC-V isn't running boot time selftests when they're compiled
> in.
>
> Signed-off-by: Andrew Cooper<andrew.cooper3@citrix.com>
> ---
> CC: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> CC: Anthony PERARD<anthony.perard@vates.tech>
> CC: Michal Orzel<michal.orzel@amd.com>
> CC: Jan Beulich<jbeulich@suse.com>
> CC: Julien Grall<julien@xen.org>
> CC: Roger Pau Monné<roger.pau@citrix.com>
> CC: Stefano Stabellini<sstabellini@kernel.org>
>
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1660821676
>
> For-4.20.  Boot selftests are new in 4.20, and work in each other
> archtiecture.

LGTM:

Reviewed-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


> ---
>   xen/arch/riscv/setup.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 38ca4f3baa1b..f2b6e684ac69 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -109,6 +109,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>        */
>       system_state = SYS_STATE_boot;
>   
> +    init_constructors();
> +
>       if ( acpi_disabled )
>       {
>           printk("Booting using Device Tree\n");
--------------t1q0IwALVUg4Ku0CruccBYih
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
    <div class="moz-cite-prefix">On 2/7/25 11:01 PM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">Without this, RISC-V isn't running boot time selftests when they're compiled
in.

Signed-off-by: Andrew Cooper <a class="moz-txt-link-rfc2396E" href="mailto:andrew.cooper3@citrix.com">&lt;andrew.cooper3@citrix.com&gt;</a>
---
CC: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
CC: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>
CC: Michal Orzel <a class="moz-txt-link-rfc2396E" href="mailto:michal.orzel@amd.com">&lt;michal.orzel@amd.com&gt;</a>
CC: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
CC: Julien Grall <a class="moz-txt-link-rfc2396E" href="mailto:julien@xen.org">&lt;julien@xen.org&gt;</a>
CC: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
CC: Stefano Stabellini <a class="moz-txt-link-rfc2396E" href="mailto:sstabellini@kernel.org">&lt;sstabellini@kernel.org&gt;</a>

<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1660821676">https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1660821676</a>

For-4.20.  Boot selftests are new in 4.20, and work in each other
archtiecture.</pre>
    </blockquote>
    <pre>LGTM:

Reviewed-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <br>
    <blockquote type="cite"
      cite="mid:20250207220122.380214-2-andrew.cooper3@citrix.com">
      <pre wrap="" class="moz-quote-pre">
---
 xen/arch/riscv/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 38ca4f3baa1b..f2b6e684ac69 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -109,6 +109,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
      */
     system_state = SYS_STATE_boot;
 
+    init_constructors();
+
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
</pre>
    </blockquote>
  </body>
</html>

--------------t1q0IwALVUg4Ku0CruccBYih--


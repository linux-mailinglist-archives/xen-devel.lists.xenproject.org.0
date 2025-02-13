Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D272A33F2D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 13:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887425.1296908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYKv-0003cq-8z; Thu, 13 Feb 2025 12:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887425.1296908; Thu, 13 Feb 2025 12:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiYKv-0003a5-5A; Thu, 13 Feb 2025 12:28:57 +0000
Received: by outflank-mailman (input) for mailman id 887425;
 Thu, 13 Feb 2025 12:28:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=horU=VE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiYKt-0003Zg-Pu
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 12:28:55 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 163a6ae6-ea06-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 13:28:53 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5450cf3ef63so822777e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 04:28:53 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09aad5sm163757e87.75.2025.02.13.04.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 04:28:52 -0800 (PST)
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
X-Inumbo-ID: 163a6ae6-ea06-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739449733; x=1740054533; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zq9RrKVmskIpH3BGvMZgfoQajWg2j6S9frUbtWyidWY=;
        b=SnkWc+CIv/bbEpv04es1zW1IRTsEkiCoew9pIGENIDpoEwlMt8MtShld2MLuCxcpCi
         wCQVhxeMzumzXqeC6qfiU3RJxPchrc7r21N+IkddWuLUvc9EBDbKFpZV/qZ2VXnQVyka
         oLVmKdqupfatfzjt74eXZE6acAep7V5Zcf9rJCLVIAjb2nVdtXXbsOvwEm8GCl/rc9O0
         H95bAI2P49HAaqP9J3YGImjcxYAfaDpuem5Vmyf9L1VpbMw6hLZKj10ccXZZfNQ1bBtg
         MKtKQnIjdYCE3551g36hY2zR+mygQf/PpiIKrv70sa2+Uk0MYD5OAbJhLiqIxyHtYA7e
         rOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739449733; x=1740054533;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zq9RrKVmskIpH3BGvMZgfoQajWg2j6S9frUbtWyidWY=;
        b=SFLkoe9pU9uEmqshE1qA67uwaoJpbrwax6PPnKcpstO/3jiSEP20ooltBmPv/blRWy
         otoW74+WCe1+74TfjRP5vD/PBF1ZJUVpcnlHJnD+CVzROqVa7uNrPZFnUFe1vYmz+BiY
         iQ2MzcfxvMCVebLuouQOvEEpLTdMCeOt7ixh7Tt6F74C7jVgYpxfiGP5aR/U9Xt9SiQd
         UWLWfxBU31GK2HUPyaog7akx/4BfCtq23OtkAS/LDgxUY331qx1+9mOXwoqN82IXJmbn
         mvRRyjuJCm7indiouUhIuapcIHiFfQx08E3QbmfSE8W/s6vIEfA+nJ03N62hGIfy0JdX
         xSEw==
X-Forwarded-Encrypted: i=1; AJvYcCUaovgOeNpQNMO+G6E4NPd8tN5F13EazA2/JepNOhnqkCcoeC8O+4ohebASycPdbNTTXyu/nJq41fQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiVTVYQiO5t8j0siRHIsfvJRInMElRpyKV/VWhSCdr6cn8SRBO
	OgcRQilEuSldQIT5zXRl9dsyD5u/B7HbQ1syDnS3mamXVTzZrLmi
X-Gm-Gg: ASbGnctLa0ePoPmzMFaRkshnm/F0C5h7WMlB0IswIZpFy0axiMlaGDY+uOWNNsY5Bav
	/lhck8Mo8boOBALHiYU7acM+XxPojeozf6P9KxGSNPBz0uUV0hDaWqZXQnocRWxyaZgPefSN3j8
	0+kJnJE/Yj/iNOORo9Wns9umdLRJkfQmYy7C03GL9ELHa5r35QUU4Ri8mRA8st31IZ256dGING6
	Gpx0MNlzNHSsJ306WJXksSj2tXu1tdC4S4BbLVEKC46Wq2WFA+mPWUOROyweZskSCrs1Cg8a6qx
	co2LcSK+JBJMFf655uF4kRU+v2Q=
X-Google-Smtp-Source: AGHT+IGCAusv0DJ0m+Q90d0KIVg+uuNVQIXNNwf3QjGg/W30OpVP6LOnmhtTjjGu8pdGJu/B5+Z38w==
X-Received: by 2002:a05:6512:318c:b0:545:e19:ba1c with SMTP id 2adb3069b0e04-5451dd95435mr1017624e87.19.1739449732698;
        Thu, 13 Feb 2025 04:28:52 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------0dGxOqihbg1tziqw8hTB4x6N"
Message-ID: <3862c852-7493-4955-a94b-ba44a9485c1c@gmail.com>
Date: Thu, 13 Feb 2025 13:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20] x86/HVM: use XVFREE() in hvmemul_cache_destroy()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <96c4125e-1d40-4e79-838d-852517b9d5f4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <96c4125e-1d40-4e79-838d-852517b9d5f4@suse.com>

This is a multi-part message in MIME format.
--------------0dGxOqihbg1tziqw8hTB4x6N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/13/25 12:10 PM, Jan Beulich wrote:
> My adjustments to move from xmalloc() et al to respective xvmalloc()
> flavors was flawed - a freeing instance wasn't converted.
>
> Fixes: 23d60dbb0493 ("x86/HVM: allocate emulation cache entries dynamically")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> ---
> Noticed while backporting, where the conversion needs undoing.

Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

~ Oleksii

>
> --- a/xen/arch/x86/include/asm/hvm/emulate.h
> +++ b/xen/arch/x86/include/asm/hvm/emulate.h
> @@ -123,7 +123,7 @@ static inline void hvmemul_cache_destroy(struct vcpu *v)
>       unsigned int i;
>   
>       for ( i = 0; i < ARRAY_SIZE(v->arch.hvm.hvm_io.mmio_cache); ++i )
> -        XFREE(v->arch.hvm.hvm_io.mmio_cache[i]);
> +        XVFREE(v->arch.hvm.hvm_io.mmio_cache[i]);
>       XVFREE(v->arch.hvm.hvm_io.cache);
>   }
>   bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
--------------0dGxOqihbg1tziqw8hTB4x6N
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
    <div class="moz-cite-prefix">On 2/13/25 12:10 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:96c4125e-1d40-4e79-838d-852517b9d5f4@suse.com">
      <pre wrap="" class="moz-quote-pre">My adjustments to move from xmalloc() et al to respective xvmalloc()
flavors was flawed - a freeing instance wasn't converted.

Fixes: 23d60dbb0493 ("x86/HVM: allocate emulation cache entries dynamically")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
Noticed while backporting, where the conversion needs undoing.</pre>
    </blockquote>
    <pre>Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a></pre>
    <pre>~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:96c4125e-1d40-4e79-838d-852517b9d5f4@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/xen/arch/x86/include/asm/hvm/emulate.h
+++ b/xen/arch/x86/include/asm/hvm/emulate.h
@@ -123,7 +123,7 @@ static inline void hvmemul_cache_destroy(struct vcpu *v)
     unsigned int i;
 
     for ( i = 0; i &lt; ARRAY_SIZE(v-&gt;arch.hvm.hvm_io.mmio_cache); ++i )
-        XFREE(v-&gt;arch.hvm.hvm_io.mmio_cache[i]);
+        XVFREE(v-&gt;arch.hvm.hvm_io.mmio_cache[i]);
     XVFREE(v-&gt;arch.hvm.hvm_io.cache);
 }
 bool hvmemul_read_cache(const struct vcpu *v, paddr_t gpa,
</pre>
    </blockquote>
  </body>
</html>

--------------0dGxOqihbg1tziqw8hTB4x6N--


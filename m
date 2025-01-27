Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CC8A1D5F3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 13:33:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877823.1287968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOIL-0000zz-Kn; Mon, 27 Jan 2025 12:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877823.1287968; Mon, 27 Jan 2025 12:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcOIL-0000wn-H5; Mon, 27 Jan 2025 12:32:49 +0000
Received: by outflank-mailman (input) for mailman id 877823;
 Mon, 27 Jan 2025 12:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qVGR=UT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tcOIK-0000wb-0i
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 12:32:48 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf0b9803-dcaa-11ef-99a4-01e77a169b0f;
 Mon, 27 Jan 2025 13:32:44 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-30616d71bb0so44938811fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 04:32:44 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076bc1959bsm14225921fa.65.2025.01.27.04.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 04:32:43 -0800 (PST)
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
X-Inumbo-ID: cf0b9803-dcaa-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981164; x=1738585964; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYsOKgKs6QIh/MzVkzOvySFSRtn/Gg7Yh4FgdM6G/bo=;
        b=SBfXKtH/EdtL7Ij0ehuIt385nkaNlwNv6FsAhceCUmRhE8/hViQT3bHXG7Bb4L8BWw
         7V712LWVpxmSTZuQZhzuxXOcHTNHD55n5TENxJE2LsmPCypc0Wn5jnUetDpeBkXXQ/gr
         f7+Cb4PQ9oS2coQb4yCWwZU0F9+0TFZHWEkQ3ylZOiki2HGZe2cHUvf60lbseNOElcd4
         xMJpxcrpxSeyGe3YjQK50+yZMWIUddqNnfxZfqWJhgVqU1uTZ2TYkvoy9djAKGBSVF1y
         U8xHcPCG4e6KekbGM2tsaO8TKp2mhUR7h772rTyEoMqHo/nrf5BwsqrNfxprJcshq6Pt
         ZUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981164; x=1738585964;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pYsOKgKs6QIh/MzVkzOvySFSRtn/Gg7Yh4FgdM6G/bo=;
        b=CiJZkkyiy91Z5OOj5qlSN2cxrqW48TMTL7bc5c87wbOnQL5+a0nvkZ4wDPci8fnXnC
         oJXiLCNXk/QMcNxfbRGihhm/y7bETcLoHQgA8WIsKFLMjlt5ws++YuC+qTvt6sgVlUmb
         Thq4AqtwgZWxjLw14bVfVW9280KfIh7g6eQ/0KLU4uSZYsJ4Ea9+yUe8/k9uNeOHT+D5
         +Q8PPuz0K14VOyv3Ick3GGF0O9vlH8AZbbGZyM6hPSfqk127JXAgAizGcRbK/G3Od720
         oAy07JTx7SUt451yvz0xCtled0K8rnWdtKnlPdmrtARusR5YU3rcdZ2+9WLICLdHYMdJ
         /sig==
X-Forwarded-Encrypted: i=1; AJvYcCU5TOwftV75Wr7A0UwU0FXhBWsuFt1UfRCxkfwik+NtdymGgIwRCevm0DlEB+BNUxVndfay7jsiGYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6wVMrSC5ZKwqeEJsBHB+XsY2GRApI6AmUsRJqLbFM/7uIbL0/
	//MGUrn6S2VCZUtk0Y5VG/atkq+oYfo2vxOfNstkut+nBSN/0dAL
X-Gm-Gg: ASbGncuvaTIbai5eLlnoQdtr4b0tNnpNoNcr92dRjnVk1n4tRrbRf5UGOlzet8SHnjc
	WDzunTuQRgPP09SD98HrBqiKlKymV6k5qpumtYXZ3q1jpDRwn75RPZLtBPZduxfXGtAjvpMZwfd
	UjAfiQVcYspDkak+140tUm5OGesOsVGn3h56a6NkmqR/C77/t/EKK6sIJ+NTFUY3GS5q+tAaivi
	LphXKGzHfZXqvllO2jMVTVTP9lUqH7yCntmwmfG9s8O2HlbwhtIJ+3AefmzIwcH2a6tUidVQVI2
	sm28pTDy7hyfERpApA==
X-Google-Smtp-Source: AGHT+IHuVGo9tdCcuqIxSVuClEs7Qk6HrCNSrwiEoacIrgSRFOSX1fptOiSK9hA8caFllnHd4saw8g==
X-Received: by 2002:a2e:b4a9:0:b0:302:1b18:2bfa with SMTP id 38308e7fff4ca-3072cb138a4mr126038691fa.23.1737981163998;
        Mon, 27 Jan 2025 04:32:43 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------8OGWoqas89DZyY0eDNG0dih0"
Message-ID: <b97527b4-b68a-4206-bfb9-27dee3ef8e31@gmail.com>
Date: Mon, 27 Jan 2025 13:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/riscv: update defintion of vmap_to_mfn()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1737391102.git.oleksii.kurochko@gmail.com>
 <bf85f6987c2a2f3374ad47fc0bf1513d69372b1f.1737391102.git.oleksii.kurochko@gmail.com>
 <2bf6ef11-fb4e-40ef-b258-dd9314cba791@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2bf6ef11-fb4e-40ef-b258-dd9314cba791@suse.com>

This is a multi-part message in MIME format.
--------------8OGWoqas89DZyY0eDNG0dih0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 11:09 AM, Jan Beulich wrote:
> On 20.01.2025 17:54, Oleksii Kurochko wrote:
>> vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
>> either the direct map region or Xen's linkage region (XEN_VIRT_START).
>> An assertion will occur if it is used with other regions, in particular for
>> the VMAP region.
>>
>> Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
>> a PA (as Arm does, for example), software page table walking (pt_walk()) is
>> used for the VMAP region to obtain the PA.
>>
>> Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich<jbeulich@suse.com>
>
>> --- a/xen/arch/riscv/include/asm/mm.h
>> +++ b/xen/arch/riscv/include/asm/mm.h
>> @@ -25,7 +25,7 @@ paddr_t pt_walk(vaddr_t va);
>>   #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
>>   #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
>>   #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
>> -#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
>> +#define vmap_to_mfn(va)     maddr_to_mfn(pt_walk((vaddr_t)(va)))
> With this being the first use of pt_walk(), I wonder whether the function might
> better return mfn_t (and simply ignore the low 12 bits of Vthe incoming VA; see
> my respective comment on the earlier patch). After all it is quite natural for
> a page table walk to return a page frame number, not a physical address.

I think it would be really better to return mfn_t (now I understand your comment on the earlier
patch better,if only I had read this comment first...)

Thanks.

~ Oleksii

--------------8OGWoqas89DZyY0eDNG0dih0
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
    <div class="moz-cite-prefix">On 1/27/25 11:09 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2bf6ef11-fb4e-40ef-b258-dd9314cba791@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.01.2025 17:54, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
either the direct map region or Xen's linkage region (XEN_VIRT_START).
An assertion will occur if it is used with other regions, in particular for
the VMAP region.

Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
a PA (as Arm does, for example), software page table walking (pt_walk()) is
used for the VMAP region to obtain the PA.

Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Reviewed-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -25,7 +25,7 @@ paddr_t pt_walk(vaddr_t va);
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
 #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
-#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
+#define vmap_to_mfn(va)     maddr_to_mfn(pt_walk((vaddr_t)(va)))
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
With this being the first use of pt_walk(), I wonder whether the function might
better return mfn_t (and simply ignore the low 12 bits of Vthe incoming VA; see
my respective comment on the earlier patch). After all it is quite natural for
a page table walk to return a page frame number, not a physical address.</pre>
    </blockquote>
    <pre>I think it would be really better to return mfn_t (now I understand your comment on the earlier
patch better, <span class="Y2IQFc" lang="en">if only I had read this comment first</span>...)

Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------8OGWoqas89DZyY0eDNG0dih0--


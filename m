Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941D9A5CA3C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 17:05:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908627.1315747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts26e-0004Nj-E4; Tue, 11 Mar 2025 16:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908627.1315747; Tue, 11 Mar 2025 16:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts26e-0004Lr-BU; Tue, 11 Mar 2025 16:05:24 +0000
Received: by outflank-mailman (input) for mailman id 908627;
 Tue, 11 Mar 2025 16:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHpu=V6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ts26c-0004LY-W7
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 16:05:22 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2009fd3-fe92-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 17:05:21 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac2ab99e16eso394393766b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 09:05:20 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2397358b8sm946097266b.109.2025.03.11.09.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 09:05:19 -0700 (PDT)
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
X-Inumbo-ID: a2009fd3-fe92-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741709120; x=1742313920; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzHd6iMMLXuYYCM1EzL52RSbRwWbnidC35UGy6Zl3PA=;
        b=O1lDBPoOnrNV39a0ABAq1dNM/HhbBfvA+FbNLqepapspGXThzMtpKC5bX1VwtTnLGA
         pLLO8H9S5uuExLLTsCjFByLeqmeqO9FZZl2yqZpdaGusN1LCZ44CIGNBdRo+vQYyZfUH
         OiwPdoKc0OxMty9br001gKqJ0H9egnO3zR5XpLxQKBGzOsWcUJk44+sjUs/uocBL8G8U
         Ia/RAxbc0bHK92IDtnE2c8CTpzEYJDCi8gbZEJnvEKUn0S0zY6i4hoc1NzaXbntuOQp3
         U5MPSINHruZ1Z/sb85tEpE/PDHgDHA80SXiWR8c22JHxzm4gwrCcDjJHd/jXaTsE+Fck
         zOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741709120; x=1742313920;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UzHd6iMMLXuYYCM1EzL52RSbRwWbnidC35UGy6Zl3PA=;
        b=fNWhjB18uhYmd631yoJbyB9AU6TYAz5vO5AkdPbdjVf+bn72+pDfbQJXzmConPcI6w
         rRbrW9ri+AwgCTtihkmemYW/q8kpTY/tDSjgpDpc/DZ52JtwCpVYSDGe+I+3B+yjTjsB
         o3FqLQzeLNnzklZmZAcnDWNTqQbKUCwWZ2/QyUw0Dp1n5Hf6ilA5jLO2VjQgQgJIp8Uf
         Y7hPGQiNsEOx9gbl70vg+Pro6AVd+XRpyDt+BQnxoEhJiw16E0z7JMuJ6X26D/eaRNMm
         bJez66LUohzGZnNPhbOyFHZFP/Dkvx8vzh7DRgM4rCENz5Tc8KOsHwm+ZcJWGyvRkqkB
         m88A==
X-Forwarded-Encrypted: i=1; AJvYcCWTQzsfu08+SCuCR7aJ34VRtHGol+/z2n9MO6/kTOL343Bh+MbKZwi5oZ3qHFCT7Gx8+t7EhgnbCfg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKMpPJfaeRtnLY7mzfiPqZ3aMhlMGLlOBMSR1leWxVV02fcW20
	kv/+h7M+qPE5GALZ2I8K6AnQX2v3H9hTCXd9NncEiZiQHDLYzvjD
X-Gm-Gg: ASbGncsk5wvzUEwo9hGq3sg2scL0uJ8aM+iTMi/EWIrwZQHJWbaixnnzsUn18oOs/wo
	vm1ICUBcebyF2GC3lDc8NTOs9TBj3/guW86OjjaXZGQAtEZeHMzJDAWPiOa0+It4UJCSB1kXoYG
	2nSHZxsPvZPJlfYjVz20xbwCKv8wPcpaocIWW2NLeffc61u9XRMPMQwr5jZgWCIWXQwgvGShnoP
	tcf0GGUKJkcW/3wsJ0GVXhYMVS80m7zNEJuHA/eV2lMC4dI+bb1HrspKoxK87o6qGRGY8awp2f0
	6FexHwGcU0wsd3so797fvzHo4E/Te0Qq3DCS0/x8rK1p7iQsRvW+qMe518TxR5M27g1gs8CAEcR
	X5VNyVudPLCIArGgaxxVi
X-Google-Smtp-Source: AGHT+IHPtH2YCe19JU0eMdlCRjXCcXvn7E3iKMqnC6VjbOd3ze9nqHs2bFU0fKZU3q0Gv+40cxVuZg==
X-Received: by 2002:a17:906:3a85:b0:ac2:7adb:ee3b with SMTP id a640c23a62f3a-ac27adbf21emr1301703066b.1.1741709119385;
        Tue, 11 Mar 2025 09:05:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------5lscqloy2ZpsvI6lomN0fsQK"
Message-ID: <5b22cfc5-f796-46bc-8cc4-090ab66d88b5@gmail.com>
Date: Tue, 11 Mar 2025 17:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/riscv: add H extenstion to -march
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <32ebe4032b7968157d5cadbc2f6aa1d9f2d363c9.1741707803.git.oleksii.kurochko@gmail.com>
 <c55c4f19-21e2-4115-b7f6-ba4752cc2e56@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c55c4f19-21e2-4115-b7f6-ba4752cc2e56@suse.com>

This is a multi-part message in MIME format.
--------------5lscqloy2ZpsvI6lomN0fsQK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/11/25 4:48 PM, Jan Beulich wrote:
> On 11.03.2025 16:45, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/arch.mk
>> +++ b/xen/arch/riscv/arch.mk
>> @@ -9,7 +9,8 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
>>   riscv-march-$(CONFIG_RISCV_64) := rv64
>>   riscv-march-y += ima
>>   riscv-march-$(CONFIG_RISCV_ISA_C) += c
>> -riscv-march-y += _zicsr_zifencei_zbb
>> +h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
> Instead of a version check, did you consider probing the compiler? With the
> hard-coded version, how are things going to work with Clang?

Initially, it was implemented using:

+$(h-extension-name)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name))

with

+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)

But it seems that we still need this hard-coded version for h-extension-name
because of this behavior that h extensions should be longer then single letter
for some compilers.

Probably, we could consider option to check "hfence.gvma" twice:
h-insn := "hfence.gvma"
$(call check-extension,h)

hh-insn := "hfence.gvma"
$(call check-extension,hh)

And filter-out/skip the second check-extension if the previous one check succeeded.
But it looks a weird.

~ Oleksii



--------------5lscqloy2ZpsvI6lomN0fsQK
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
    <div class="moz-cite-prefix">On 3/11/25 4:48 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c55c4f19-21e2-4115-b7f6-ba4752cc2e56@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.03.2025 16:45, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -9,7 +9,8 @@ riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64
 riscv-march-$(CONFIG_RISCV_64) := rv64
 riscv-march-y += ima
 riscv-march-$(CONFIG_RISCV_ISA_C) += c
-riscv-march-y += _zicsr_zifencei_zbb
+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Instead of a version check, did you consider probing the compiler? With the
hard-coded version, how are things going to work with Clang?</pre>
    </blockquote>
    <pre>Initially, it was implemented using:</pre>
    <pre>+$(h-extension-name)-insn := "hfence.gvma"
+$(call check-extension,$(h-extension-name))</pre>
    <pre>with</pre>
    <pre>+h-extension-name := $(call cc-ifversion,-lt,1301, hh, h)</pre>
    <pre>But it seems that we still need this hard-coded version for h-extension-name
because of this behavior that h extensions should be longer then single letter
for some compilers.

Probably, we could consider option to check "hfence.gvma" twice:
h-insn := "hfence.gvma"
$(call check-extension,h)

hh-insn := "hfence.gvma"
$(call check-extension,hh)

And filter-out/skip the second check-extension if the previous one check succeeded.
But it looks a weird.

~ Oleksii



</pre>
  </body>
</html>

--------------5lscqloy2ZpsvI6lomN0fsQK--


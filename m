Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD639A9D192
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 21:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968496.1358059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Olp-0002ur-Kl; Fri, 25 Apr 2025 19:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968496.1358059; Fri, 25 Apr 2025 19:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Olp-0002sh-IG; Fri, 25 Apr 2025 19:31:33 +0000
Received: by outflank-mailman (input) for mailman id 968496;
 Fri, 25 Apr 2025 19:31:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=snHQ=XL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u8Oln-0002sb-Vz
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 19:31:32 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a13282-220b-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 21:31:30 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac25d2b2354so389123766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Apr 2025 12:31:30 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e7260sm178614566b.49.2025.04.25.12.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 12:31:29 -0700 (PDT)
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
X-Inumbo-ID: e3a13282-220b-11f0-9eb3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745609490; x=1746214290; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAe1kjc9XeQAvI8QbAKLI5idXVstovLCpXSu1HNW8e8=;
        b=NRnTXS2LFpOZltV3EGGvP5Us1ah61PghvtdKJT7uguOANcSk52D2PKw4OcZUgWFgUQ
         LMhXJMP+Es7LzK/V21CmfohxSZFtEpyDtqS5EzziKVrdPYOxgOPYGDcyV6cZwcI0vKUv
         RbI6tbRS2lBppra9/wErg7s0hzXc0aZRO+yTrFZDBSAikioMOOXnsBSc5/xM0I17mutO
         +cRjwE3N2n8v66DGVePm9oeGXKzVTBF2eBFV0XtvE5cQVa7gSE1L5ncOBaLjsvBUfcm+
         Daj5M5s6hbdmngFpM7Z+WBu2mXpz4w+4wqI3yDhqoKqPMjz8P9F41P2AxMCnWMatEMfn
         1Gww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745609490; x=1746214290;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TAe1kjc9XeQAvI8QbAKLI5idXVstovLCpXSu1HNW8e8=;
        b=ZDeBVGS+dU5Qj/O2Cc4poedaEqCGKLDnosXF3LHe1il2kHCskpFIGCwN7nBnAr9q6g
         2E0ijlkhBuOwVmXapyAjuFcwgEUygILUECO5BlRTCZBK0zOYSHS1Ue0Xa/+4qQ5DBbeg
         ISXQm31P/U6MAcbEUFc4++Gtd+StnMKEiZhPD35MZc7BgtF+UpjMa0KbXC5cy33B30Xs
         UxiSs2Oae/XosvVc858nPK0u+Gzl6BW8zYz5O75De78/x5pHgHvS+o6fewnzCWDpEvf2
         IFhT7LC48v4SshKFp/8UBPO2RSqSxZkaXG2T4+ZeJGNIQkgo5Vydqrfx1DYVbw+406+K
         JQZw==
X-Forwarded-Encrypted: i=1; AJvYcCWTwuXqxewp+mRq72HNAkFw40f2laS/0JxAsftEM6dAi5nJqvnbbZQM7/dMn8TJOwwG0DYqVKOEqkk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykALQXwUkNZ64+AqYKm4wIlQN7iJtuZyd7w+Jg/hqkNFrDu2hn
	Jy1xypIXfWabulu+iLWauGlyP83gHkrHzHchuj7lgauh4X9dS09t
X-Gm-Gg: ASbGncsYoeCJRDs+7OChP4/gcJW64NTRyt4M9xMlfjt9CN10+Ej8ql+u2DiyZIeXXTQ
	kJCZcYiiO3zmXgofJ4CubkyyDtOUKdVoFMlaenLFmii9DwhIYrYR/aFfJt8OdXVHEX8xQ71TBip
	XHUPW3FzderDbf+W8bMUCUFzoA4m8v3/jq+b9PJbVsDbl7JrvnFNWgwNoeouEYQ/Q6hfFCOytuZ
	vrg/9pvAzqbLaYfk5KVIF7CB8dOXm4+d8DmG7DpckLsqdbK7IM6S/B7jt8VUHut7xr8p7e6gn9s
	t89yo8tXFLuLPL8rN1Ik/ZShAF32HuNmgX1ty8fFgM/EXYpP9WeTDSerszqHBWQm32uN0ZT21fB
	CYrBhygj5vJZYT54XZoliVfxwjYo=
X-Google-Smtp-Source: AGHT+IHZOCIsYf5tu+m5PcTHmT8CaTZOHRNXVIe6ur8yIe1Xp8vW8UTdD8rFh26hsZpS8vhsnRE1hA==
X-Received: by 2002:a17:907:7f26:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-ace713fd0c6mr343200466b.52.1745609489954;
        Fri, 25 Apr 2025 12:31:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------QNxNomG2MzxUG3HCadje2v90"
Message-ID: <36eaf6df-4474-4252-bc82-054a7d00343a@gmail.com>
Date: Fri, 25 Apr 2025 21:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/14] xen/riscv: implementation of aplic and imsic
 operations
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <74a07ed7c596bbcf581010685e01bfdfa19164f5.1744126720.git.oleksii.kurochko@gmail.com>
 <3426df1b-938a-4d20-a533-dd6695473db0@suse.com>
 <5f922b70-d4c2-4e6e-ad05-f91afc70ee73@gmail.com>
 <d63a6410-7053-4f75-aeda-6cd4e36bd302@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d63a6410-7053-4f75-aeda-6cd4e36bd302@suse.com>

This is a multi-part message in MIME format.
--------------QNxNomG2MzxUG3HCadje2v90
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/22/25 9:02 AM, Jan Beulich wrote:
> On 18.04.2025 12:43, Oleksii Kurochko wrote:
>> On 4/15/25 4:53 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -14,12 +14,68 @@
>>>>    #include <xen/errno.h>
>>>>    #include <xen/init.h>
>>>>    #include <xen/macros.h>
>>>> +#include <xen/spinlock.h>
>>>>    #include <xen/xmalloc.h>
>>>>    
>>>>    #include <asm/imsic.h>
>>>>    
>>>>    static struct imsic_config imsic_cfg;
>>>>    
>>>> +#define imsic_csr_set(c, v)     \
>>>> +do {                            \
>>>> +    csr_write(CSR_SISELECT, c); \
>>>> +    csr_set(CSR_SIREG, v);      \
>>>> +} while (0)
>>>> +
>>>> +#define imsic_csr_clear(c, v)   \
>>>> +do {                            \
>>>> +    csr_write(CSR_SISELECT, c); \
>>>> +    csr_clear(CSR_SIREG, v);    \
>>>> +} while (0)
>>> Coming back to these (the later patch adds one more here): How expensive are
>>> these CSR writes? IOW would it perhaps make sense to maintain a local cache
>>> of the last written SISELECT value, to avoid writing the same one again if
>>> the same windowed register needs accessing twice in a row?
>> CSRs belong to the HART, so access to them is very fast.
> Can you back this by any data? I view CSRs as somewhat similar to x86'es MSRs,
> and access (writes in particular) to some of them is rather slow.

CSR read 1 cycle, CSR write 7 cycles on Microchip platform. ~ Oleksii

--------------QNxNomG2MzxUG3HCadje2v90
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
    <div class="moz-cite-prefix">On 4/22/25 9:02 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:d63a6410-7053-4f75-aeda-6cd4e36bd302@suse.com">
      <pre wrap="" class="moz-quote-pre">On 18.04.2025 12:43, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/15/25 4:53 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -14,12 +14,68 @@
  #include &lt;xen/errno.h&gt;
  #include &lt;xen/init.h&gt;
  #include &lt;xen/macros.h&gt;
+#include &lt;xen/spinlock.h&gt;
  #include &lt;xen/xmalloc.h&gt;
  
  #include &lt;asm/imsic.h&gt;
  
  static struct imsic_config imsic_cfg;
  
+#define imsic_csr_set(c, v)     \
+do {                            \
+    csr_write(CSR_SISELECT, c); \
+    csr_set(CSR_SIREG, v);      \
+} while (0)
+
+#define imsic_csr_clear(c, v)   \
+do {                            \
+    csr_write(CSR_SISELECT, c); \
+    csr_clear(CSR_SIREG, v);    \
+} while (0)
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Coming back to these (the later patch adds one more here): How expensive are
these CSR writes? IOW would it perhaps make sense to maintain a local cache
of the last written SISELECT value, to avoid writing the same one again if
the same windowed register needs accessing twice in a row?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
CSRs belong to the HART, so access to them is very fast.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Can you back this by any data? I view CSRs as somewhat similar to x86'es MSRs,
and access (writes in particular) to some of them is rather slow.</pre>
    </blockquote>
    <pre><span data-teams="true">CSR read 1 cycle, CSR write 7 cycles on Microchip platform.

~ Oleksii</span></pre>
  </body>
</html>

--------------QNxNomG2MzxUG3HCadje2v90--


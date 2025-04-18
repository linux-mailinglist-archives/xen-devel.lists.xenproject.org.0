Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516EA93622
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 12:43:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958870.1351452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jC2-0004AF-Is; Fri, 18 Apr 2025 10:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958870.1351452; Fri, 18 Apr 2025 10:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jC2-00048i-FJ; Fri, 18 Apr 2025 10:43:34 +0000
Received: by outflank-mailman (input) for mailman id 958870;
 Fri, 18 Apr 2025 10:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h7fJ=XE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5jC1-00048a-6v
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 10:43:33 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8150bb8-1c41-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 12:43:31 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e5dce099f4so2162070a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 03:43:31 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ef426c4sm103158266b.131.2025.04.18.03.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 03:43:29 -0700 (PDT)
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
X-Inumbo-ID: f8150bb8-1c41-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744973010; x=1745577810; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEbPa/pzUMQsdSWCW1halMa+PHcQbDlyFlKR/wjWMeo=;
        b=TJdEHgRVyWSBBGUFK8uzYKTi5EjhveO6nazpo1D1D5VPpd+kClaF+nEVFZyaxBr6hu
         EB6t86jlV+YQBAZHNXnbhIzU6DBFAQBfTN7mT9WMdVkTvDHQfLaFeZjl6IsyYosTA+gU
         29Cq1DsvHUs8lKViz03a+GjqlpPwx2UNV7oUCRCArQ1Atdy76RJsub4u0JAFt64gFPZ8
         DRdebiaDuYlPPQZE/L2ZsYv31VoLTISOEZRfJgWU8tqw3PyYC7KDmhdbLNr4uUk87C/X
         FM1L+J98L4BgSNEkyg6HgrDmUP8+YuWql2qKr14iSnTwXKRxfucW3xuNNLFOyIgEqkYB
         7gnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744973010; x=1745577810;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yEbPa/pzUMQsdSWCW1halMa+PHcQbDlyFlKR/wjWMeo=;
        b=uVV4low/WtpRZEQbPqexGNRkFcfPqxMSYBM+cl2BJXJILES08fS5Y3XwDcmumu9gLA
         w6Hy71TBsaokAN9QmbhD4sgSSUxyVRF2Ro3bfXDii/CjhokYTKX/UPR86j2Ps6e2D49Z
         QZ8JNiyickSKg7Cw09UwKVic+fxlNZJ7IuVFii0kANKI7dXUx/DcB9/uDlXuW8NNh0ba
         iK0POHMzeuyECHM84itjfsp9CXeopk+PgBg89DEHrEsqNILnZ7D3ONp1zB+g6uoktmH4
         C2RD3Sx0B4dBxQtTF4zZAfLVLSbbuFHIMV3EuguxyeZcqJgpgC7X9gZWJ6tjm1iSLHHq
         KVKg==
X-Forwarded-Encrypted: i=1; AJvYcCUxJwzKPyuJVZ1OPlXLXp4krCqirZ3KasXXGvbYUrWemHPpOCd+gW2fJkUlIn0phQ182PJRysIYJlI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6yDQIzyzCe9QJj0HzZbywky7rvpnb2wKrjKN7WOZGhVntSBwI
	bUKgnZ4jKsFVY5Jt0eUt71BJDKH+VQTQq9LM/K7eSuBy6qVn+XWT
X-Gm-Gg: ASbGncuwmR1M2KgtHWhqJLhpkJ353WOI9ZhwzT/cILGnvEUFUsW/YFu7Bce24sro8lN
	SgpzbMbVAgrx7IOe5P49isGQXDAe5AML89AtHix6hhyiJbGreYp85IP+fEIMb/1x80TrGj2+NoD
	V1DY4l9E2rTgCi/aWgkDMF6LnP43oOTEClBS2w4/2L+dQt9RmLZVeTJgTgEHRl3MUA05o4yD9IZ
	rlI3tv5tYYZ/+4W6UVjv0XDY5DAnZNDN2QU9f6xEFsxuseIPrWYcJgtAEA/h+ZWpJQY/COhZQJV
	7SFTqx51/7Tv7kOsiaxVl5PwUSCCP6NNS/9J7sCmGccXGgoLA585mENDtAuGKIazAkz/l0cLZaB
	7cv1rjWZTjgcrvVm/
X-Google-Smtp-Source: AGHT+IFcsATAyaipO/CpgYC6nljHY9vuOU7dWZsLYcHZjRFj5Lyw2vfEMFaFT2a5KvezuOAQEx7f0Q==
X-Received: by 2002:a17:907:1c14:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-acb74b508b5mr187508966b.28.1744973009934;
        Fri, 18 Apr 2025 03:43:29 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------IyaPS0A001legdRB9vMjL0ql"
Message-ID: <5f922b70-d4c2-4e6e-ad05-f91afc70ee73@gmail.com>
Date: Fri, 18 Apr 2025 12:43:28 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <3426df1b-938a-4d20-a533-dd6695473db0@suse.com>

This is a multi-part message in MIME format.
--------------IyaPS0A001legdRB9vMjL0ql
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 4:53 PM, Jan Beulich wrote:
> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -14,12 +14,68 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/macros.h>
>> +#include <xen/spinlock.h>
>>   #include <xen/xmalloc.h>
>>   
>>   #include <asm/imsic.h>
>>   
>>   static struct imsic_config imsic_cfg;
>>   
>> +#define imsic_csr_set(c, v)     \
>> +do {                            \
>> +    csr_write(CSR_SISELECT, c); \
>> +    csr_set(CSR_SIREG, v);      \
>> +} while (0)
>> +
>> +#define imsic_csr_clear(c, v)   \
>> +do {                            \
>> +    csr_write(CSR_SISELECT, c); \
>> +    csr_clear(CSR_SIREG, v);    \
>> +} while (0)
> Coming back to these (the later patch adds one more here): How expensive are
> these CSR writes? IOW would it perhaps make sense to maintain a local cache
> of the last written SISELECT value, to avoid writing the same one again if
> the same windowed register needs accessing twice in a row?

CSRs belong to the HART, so access to them is very fast.

~ Oleksii

--------------IyaPS0A001legdRB9vMjL0ql
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
    <div class="moz-cite-prefix">On 4/15/25 4:53 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:3426df1b-938a-4d20-a533-dd6695473db0@suse.com">
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
      <pre wrap="" class="moz-quote-pre">
Coming back to these (the later patch adds one more here): How expensive are
these CSR writes? IOW would it perhaps make sense to maintain a local cache
of the last written SISELECT value, to avoid writing the same one again if
the same windowed register needs accessing twice in a row?</pre>
    </blockquote>
    <pre><span data-teams="true">CSRs belong to the HART, so access to them is very fast.</span></pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------IyaPS0A001legdRB9vMjL0ql--


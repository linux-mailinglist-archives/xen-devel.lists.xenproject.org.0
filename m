Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7547AC217B
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 12:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995570.1377906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIPxH-0007ti-72; Fri, 23 May 2025 10:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995570.1377906; Fri, 23 May 2025 10:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIPxH-0007rf-4L; Fri, 23 May 2025 10:48:47 +0000
Received: by outflank-mailman (input) for mailman id 995570;
 Fri, 23 May 2025 10:48:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=59Zg=YH=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uIPxF-0007rZ-PN
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 10:48:45 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f4f0025-37c3-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 12:48:44 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad56cbc7b07so797422166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 03:48:44 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06df95sm1224891966b.56.2025.05.23.03.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 03:48:43 -0700 (PDT)
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
X-Inumbo-ID: 7f4f0025-37c3-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997324; x=1748602124; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+A1cJGqWgP5bAJfb8biQqWtC6WRG6IS7NoQbEdLXSgE=;
        b=DXtO3TmSNmeJVSz3wkxVuY/UD/sIu1mCkx5mpzMdgJgeEK1IZz4KeTELRBlOkFqDa7
         L9Rcjw5Iv8XeLI0z7Ch9rhcmUimg61dvZDWi5oiLEBgdisAk/N6u/C1oTgbsn4UC3W2y
         lRfyM4TSo/6hBlakmakjT/sDosi5QPkM98c1guPguC6nxEV3KaxvKIFefi6hhonUEa2v
         l4AAtS081hXF6Hn0QIGLVD1QjC8AudOXBqPlX67/QEGlGQrjiETlyDU8rgJZTnoe21yi
         9eVrgBXCrKEVlKmXaL8v7uUn/q3/WeamU5LGIEF4rsewFFftlf3F53UMd8FXX/zeN0MY
         K4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997324; x=1748602124;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+A1cJGqWgP5bAJfb8biQqWtC6WRG6IS7NoQbEdLXSgE=;
        b=Wt9sxLSuuapGFqteCFso28V/1o9TnZbJb5MNUMnGhNsDv+TceyAJ4DhVF3eb0CjGAO
         VJwRc+OA6N5ABZOgtIDIvxpweV/nDCE/hQ/emLI+HPYpRy8uT1wDX/9NgczuL8ebVJcQ
         27yzYR23hbhY7d8w6pVyvvS3x9LT9dAbobsuX0JIspiTxdzYs4qjIn8PLGm3lthDqIFv
         Utt0/c0xWtpR2f4vOTFYogZdwHGuSlPjpm8NLZmdJWEUXWtQ/yFb+f803gGhyg1rff/G
         7K55lvCYTH299gjiqHhZZIbRiuCwVMFgmIBATujk+qUX/4eUYX9qZ4iPn38dMVAQk9vy
         4KAg==
X-Forwarded-Encrypted: i=1; AJvYcCXiC32qooWP1nbH2bltmw6FUNUL5KAk/XGxe0BxPdiF7YMmkkRk6QyikIN+UWc5pdl33vofKhI862U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYj6+4P48b3a06ADUQ79RjRQjCbXsyal02Um/lWKmP9pBUex2M
	WxpQbP9WXmqzlnr6GTl1WfOf3OZKO85Cw8XVU/UEhNQbDywUVFbyjvaZ
X-Gm-Gg: ASbGncscTm9R72C2TQ8tQYEClSy9yvNZ2acg0kD4YyTKiGg4v3r02ROH8AFRXBqE9eh
	3o5vVa+DyDp7Nmk1B9CswtXS2sFJtQbAw+gdoZm1rY4818gaOAzEB5Y3iWQavfacFwt/sWaYMZl
	orLixe8Skz6K5JvowSTwnmmugudM5CnanMfH6ZnrsnfohIKihvl19mJbE1FedCfD+ujDfOO+S/m
	1X5jZA91hEyg2BLVgWOTXVfuNXZBbeUUSlV2NuH2vnG84g5DHE3uhPCEw5mUJFOZvj6dJK12jz3
	4N/qlQhuFWzVtpPz6nAFyCafZFMU7srXg9Qr7aM0U/Q4eWUXDgc+OQ1T7Pi7yg59SJK0wjYQ/ip
	K79fCNJHT0H98EsqKjurYxnC+0LxauqjeLNo=
X-Google-Smtp-Source: AGHT+IF73ODRYeUHr6WPb8eNaBmOWS3qpC7GDp+naTBEA1yis6bD5H+jD2V+qwQjNnXO9Sx4O51k0w==
X-Received: by 2002:a17:907:cd0e:b0:ad2:1b0e:bfe5 with SMTP id a640c23a62f3a-ad708387de3mr248074266b.7.1747997323893;
        Fri, 23 May 2025 03:48:43 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------QCDiYtWx5Vc5VkJ7z2UP5fLh"
Message-ID: <5e17710a-cac3-409d-99fd-454d836ed3a8@gmail.com>
Date: Fri, 23 May 2025 12:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <9f822cfaa058167982c85b3ca3f722881552a75e.1746805907.git.oleksii.kurochko@gmail.com>
 <c6f1f14a-c5d1-454e-bf79-74d3e60855f7@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c6f1f14a-c5d1-454e-bf79-74d3e60855f7@suse.com>

This is a multi-part message in MIME format.
--------------QCDiYtWx5Vc5VkJ7z2UP5fLh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/20/25 5:04 PM, Jan Beulich wrote:
> On 09.05.2025 17:57, Oleksii Kurochko wrote:
>> Refactor pte_t to be a union which hold page table entry plus
>> pt_t and pt_walk_t structures to simpilfy p2m functions.
> Is this really simplifying things? I really view ...
>
>> Also, introduce some helpers which are using pt_walk_t.
> ... these helpers as confusing things, by using the wrong part of the
> union relative to what their names are. (I'll re-phrase this some at
> the bottom.)
>
> With the union it's also unclear to me how to know which part of the
> union is the one that's valid to use, when there's no auxiliary info
> available.

Everything is valid to use and depends on the context if it is convenient
or not. It is hard to come up with a rule when and what should be used.

>
>> --- a/xen/arch/riscv/include/asm/page.h
>> +++ b/xen/arch/riscv/include/asm/page.h
>> @@ -99,15 +99,67 @@
>>   
>>   #endif
>>   
>> -/* Page Table entry */
>>   typedef struct {
>> +    unsigned long v:1;
>> +    unsigned long r:1;
>> +    unsigned long w:1;
>> +    unsigned long x:1;
>> +    unsigned long u:1;
>> +    unsigned long g:1;
>> +    unsigned long a:1;
>> +    unsigned long d:1;
>> +    unsigned long rsw:2;
>> +#if RV_STAGE1_MODE == SATP_MODE_SV39
>> +    unsigned long ppn0:9;
>> +    unsigned long ppn1:9;
>> +    unsigned long ppn2:26;
>> +    unsigned long rsw2:7;
>> +    unsigned long pbmt:2;
>> +    unsigned long n:1;
>> +#elif RV_STAGE1_MODE == SATP_MODE_SV48
>> +    unsigned long ppn0:9;
>> +    unsigned long ppn1:9;
>> +    unsigned long ppn2:9;
>> +    unsigned long ppn3:17;
>> +    unsigned long rsw2:7;
>> +    unsigned long pbmt:2;
>> +    unsigned long n:1;
>> +#else
> Imo you want to settle on whether you want to use bitfields or #define-s
> to manipulate page table entries. Using a mix is going to be confusing
> (or worse).

Generally, I am okay to use something one.
But technically it is the same things from result point of view, just
different is access of a field by using a union or do a bit manipulation operations.

>
>> +#error "Add proper bits for SATP_MODE"
>> +#endif
>> +} pt_t;
>> +
>> +typedef struct {
>> +    unsigned long rsw:10;
>> +#if RV_STAGE1_MODE == SATP_MODE_SV39 || RV_STAGE1_MODE == SATP_MODE_SV48
>> +    unsigned long ppn: 44;
> Nit: Why's there a blank after the colon here when there's none anywhere else?
>
>> +static inline void pte_set_mfn(pte_t *pte, mfn_t mfn)
>> +{
>> +    pte->walk.ppn = mfn_x(mfn);
>> +}
>> +
>> +static inline mfn_t pte_get_mfn(pte_t pte)
>> +{
>> +    return _mfn(pte.walk.ppn);
>> +}
> Following to my remark at the top - if you do it this way, what use are the
> ppn<N> fields?

|ppn<N>| isn't actually used; it was added only to follow the PTE format specified
in the architecture spec. Technically,|ppn<N>| could be merged into|ppn|,
but IMO, keeping|ppn<N>| improves self-documentation of the page table format.

~ Oleksii

--------------QCDiYtWx5Vc5VkJ7z2UP5fLh
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
    <div class="moz-cite-prefix">On 5/20/25 5:04 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c6f1f14a-c5d1-454e-bf79-74d3e60855f7@suse.com">
      <pre wrap="" class="moz-quote-pre">On 09.05.2025 17:57, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Refactor pte_t to be a union which hold page table entry plus
pt_t and pt_walk_t structures to simpilfy p2m functions.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Is this really simplifying things? I really view ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Also, introduce some helpers which are using pt_walk_t.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... these helpers as confusing things, by using the wrong part of the
union relative to what their names are. (I'll re-phrase this some at
the bottom.)

With the union it's also unclear to me how to know which part of the
union is the one that's valid to use, when there's no auxiliary info
available.</pre>
    </blockquote>
    <pre>Everything is valid to use and depends on the context if it is convenient
or not. It is hard to come up with a rule when and what should be used.

</pre>
    <blockquote type="cite"
      cite="mid:c6f1f14a-c5d1-454e-bf79-74d3e60855f7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -99,15 +99,67 @@
 
 #endif
 
-/* Page Table entry */
 typedef struct {
+    unsigned long v:1;
+    unsigned long r:1;
+    unsigned long w:1;
+    unsigned long x:1;
+    unsigned long u:1;
+    unsigned long g:1;
+    unsigned long a:1;
+    unsigned long d:1;
+    unsigned long rsw:2;
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    unsigned long ppn0:9;
+    unsigned long ppn1:9;
+    unsigned long ppn2:26;
+    unsigned long rsw2:7;
+    unsigned long pbmt:2;
+    unsigned long n:1;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    unsigned long ppn0:9;
+    unsigned long ppn1:9;
+    unsigned long ppn2:9;
+    unsigned long ppn3:17;
+    unsigned long rsw2:7;
+    unsigned long pbmt:2;
+    unsigned long n:1;
+#else
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Imo you want to settle on whether you want to use bitfields or #define-s
to manipulate page table entries. Using a mix is going to be confusing
(or worse).</pre>
    </blockquote>
    <pre>Generally, I am okay to use something one.
But technically it is the same things from result point of view, just
different is access of a field by using a union or do a bit manipulation operations.

</pre>
    <blockquote type="cite"
      cite="mid:c6f1f14a-c5d1-454e-bf79-74d3e60855f7@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#error "Add proper bits for SATP_MODE"
+#endif
+} pt_t;
+
+typedef struct {
+    unsigned long rsw:10;
+#if RV_STAGE1_MODE == SATP_MODE_SV39 || RV_STAGE1_MODE == SATP_MODE_SV48
+    unsigned long ppn: 44;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Nit: Why's there a blank after the colon here when there's none anywhere else?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static inline void pte_set_mfn(pte_t *pte, mfn_t mfn)
+{
+    pte-&gt;walk.ppn = mfn_x(mfn);
+}
+
+static inline mfn_t pte_get_mfn(pte_t pte)
+{
+    return _mfn(pte.walk.ppn);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Following to my remark at the top - if you do it this way, what use are the
ppn&lt;N&gt; fields?</pre>
    </blockquote>
    <pre><code data-start="60" data-end="68">ppn&lt;N&gt;</code> isn't actually used; it was added only to follow the PTE format specified
in the architecture spec. Technically, <code data-start="182"
    data-end="190">ppn&lt;N&gt;</code> could be merged into <code
    data-start="212" data-end="217">ppn</code>,
but IMO, keeping <code data-start="246" data-end="254">ppn&lt;N&gt;</code> improves self-documentation of the page table format.

~ Oleksii
</pre>
  </body>
</html>

--------------QCDiYtWx5Vc5VkJ7z2UP5fLh--


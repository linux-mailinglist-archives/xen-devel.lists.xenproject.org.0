Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E499D5045
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 17:00:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841571.1257061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9at-0008Ko-H5; Thu, 21 Nov 2024 15:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841571.1257061; Thu, 21 Nov 2024 15:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9at-0008Ix-EO; Thu, 21 Nov 2024 15:59:47 +0000
Received: by outflank-mailman (input) for mailman id 841571;
 Thu, 21 Nov 2024 15:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XSdi=SQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tE9as-0008Ir-0x
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 15:59:46 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d721112-a821-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 16:59:40 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so198624666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 07:59:40 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f437ff46sm97529566b.189.2024.11.21.07.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 07:59:39 -0800 (PST)
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
X-Inumbo-ID: 9d721112-a821-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjlkNzIxMTEyLWE4MjEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjA0NzgwLjIzNDczMiwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732204780; x=1732809580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VdH+thfqZelFVASrjRhsY4bCjuF+9L41q89tWe1sRFI=;
        b=f+ec8DLMsffHWhanTGZNQZ9yKJG58SzwM1COttDMdDZTLZn6bceo7woTcAMoanOvXF
         7X3c6MpAzM6khddA158UB95SphK6xTR3y4Tx3ltfG5czh9rDpIS2cmbv9qnrFAPqV68G
         DxId3mdYFfsaSPmN3n0IaDQHmG4h5N+Juf0BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732204780; x=1732809580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdH+thfqZelFVASrjRhsY4bCjuF+9L41q89tWe1sRFI=;
        b=FuWXM7raF52T7iDCR8X5qhxdYe83xk5iwVKbhRVSvRE+r/RwuW9X8yB9XryyRHaXVE
         o4SPVCQ+QOH/PQ7OKi/1EN7LqUar+87MyY1J7LmJPmnldv+HFMcru8j/EpCq6kiIqpTN
         2G7CJZ1v034v3mBcyCJm77kj8A3zbbUglFse8FUPNT5O6i6q5YV7oxeP5gXPhqxXJX9+
         MUX9dgdgCp2jmMUdBSZvSD9RqqpNVEH6pOF5lZT3OeNmPVVaUWT8Njxm7+9GYclJf4mh
         10q2Hhvmg3uGPpGMAjVt5lEK8eUweVE4ImPuSJV1w/Ym/nKf4wDFUz8XFtTMhTxvGanf
         OJSQ==
X-Gm-Message-State: AOJu0YxhZkAal525KyEK/UGmHOB4iYugSDUM9t5unsfrGwn1S41fe3PG
	Ts4hPQM0vIIfJICbYA+uRrav0IrjZ3R7V/CrGQWPEmJvqJvsJ2ylqx3ynyELAHk=
X-Gm-Gg: ASbGncsM9170fGk5sqC8WOWI31V5pX2MaGZUfi/D3srD7Xe4+BPdoSl8s9kstOyT1MK
	LC/Jm0rjgllDMf/ct9+VibCUW206xBPk8SsZvzAkrKK6sxa46Pwh9eW7NOB96I6DL9adNyuTRN+
	TOk8Kr66qHjb6Hq2F9BQ66OW/WhUE3JzIe0qKSI1rSkGPDKckylyDrpqTTPqdtADt3+LTFaOjQy
	XFw60+MjZkhCYDoV9DZfBnPk4wUKAjc3F3iUk/g7N2ceXxzbMguf7pQtXiBHe8=
X-Google-Smtp-Source: AGHT+IEq5Cw1BecZsrctK3/USlyu3+DFcxMasXPsHxaD7fHqG8y8N2QDGyiltfvZQ+sh1od8+2ICqw==
X-Received: by 2002:a17:907:9452:b0:a9a:67a9:dc45 with SMTP id a640c23a62f3a-aa4dd50a559mr761322866b.3.1732204779630;
        Thu, 21 Nov 2024 07:59:39 -0800 (PST)
Message-ID: <8a4d1e32-ea48-491e-8ea2-c8cf4c1f934c@citrix.com>
Date: Thu, 21 Nov 2024 15:59:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
 <CACHz=Zh+qvzgrXBZPbSR=5oTEk2kz9b+zfZHEk8pwmGmrVpAmw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CACHz=Zh+qvzgrXBZPbSR=5oTEk2kz9b+zfZHEk8pwmGmrVpAmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2024 3:19 pm, Frediano Ziglio wrote:
> On Thu, Nov 21, 2024 at 2:50 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> for_each_set_bit()'s use of a double for loop had an accidental bug with a
>> break in the inner loop leading to an infinite outer loop.
>>
>> Adjust for_each_set_bit() to avoid this behaviour, and add extend
>> test_for_each_set_bit() with a test case for this.
>>
>> Fixes: ed26376f20bf ("xen/bitops: Introduce for_each_set_bit()")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Frediano Ziglio <frediano.ziglio@cloud.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>>
>> Both GCC and Clang seem happy with this, even at -O1:
>>
>>   https://godbolt.org/z/o6ohjrzsY
>> ---
>>  xen/common/bitops.c      | 16 ++++++++++++++++
>>  xen/include/xen/bitops.h |  2 +-
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
>> index 91ae961440af..0edd62d25c28 100644
>> --- a/xen/common/bitops.c
>> +++ b/xen/common/bitops.c
>> @@ -110,6 +110,22 @@ static void __init test_for_each_set_bit(void)
>>
>>      if ( ull != ull_res )
>>          panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
>> +
>> +    /* Check that we break from the middle of the loop */
>> +    ui = HIDE(0x80001008U);
>> +    ui_res = 0;
>> +    for_each_set_bit ( i, ui )
>> +    {
>> +        static __initdata unsigned int count;
>> +
>> +        if ( count++ > 1 )
>> +            break;
>> +
>> +        ui_res |= 1U << i;
>> +    }
>> +
>> +    if ( ui_res != 0x1008 )
>> +        panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_res);
>>  }
>>
>>  static void __init test_multiple_bits_set(void)
>> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
>> index 79615fb89d04..448b2d3e0937 100644
>> --- a/xen/include/xen/bitops.h
>> +++ b/xen/include/xen/bitops.h
>> @@ -299,7 +299,7 @@ static always_inline attr_const unsigned int fls64(uint64_t x)
>>   * A copy of @val is taken internally.
>>   */
>>  #define for_each_set_bit(iter, val)                     \
>> -    for ( typeof(val) __v = (val); __v; )               \
>> +    for ( typeof(val) __v = (val); __v; __v = 0 )       \
>>          for ( unsigned int (iter);                      \
>>                __v && ((iter) = ffs_g(__v) - 1, true);   \
>>                __v &= __v - 1 )
>>
>> base-commit: e0058760a0c7935ad0690d8b9babb9050eceedf0
> Not a fun of static variables but it's just in the test,

Oh, I guess I can do it with just a local variable.  Incremental diff is:

@@ -86,7 +86,7 @@ static void __init test_fls(void)
 
 static void __init test_for_each_set_bit(void)
 {
-    unsigned int  ui,  ui_res = 0;
+    unsigned int  ui,  ui_res = 0, tmp;
     unsigned long ul,  ul_res = 0;
     uint64_t      ull, ull_res = 0;
 
@@ -113,12 +113,11 @@ static void __init test_for_each_set_bit(void)
 
     /* Check that we break from the middle of the loop */
     ui = HIDE(0x80001008U);
+    tmp = 0;
     ui_res = 0;
     for_each_set_bit ( i, ui )
     {
-        static __initdata unsigned int count;
-
-        if ( count++ > 1 )
+        if ( tmp++ > 1 )
             break;
 
         ui_res |= 1U << i;


> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Thanks.  This turns out to be a whole lot easier than I was fearing.

~Andrew


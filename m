Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11ABB6399
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 10:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136385.1472970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4auR-0006RX-JI; Fri, 03 Oct 2025 08:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136385.1472970; Fri, 03 Oct 2025 08:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4auR-0006PQ-GV; Fri, 03 Oct 2025 08:12:59 +0000
Received: by outflank-mailman (input) for mailman id 1136385;
 Fri, 03 Oct 2025 08:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TaDF=4M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v4auP-0006PI-VI
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 08:12:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4a06510-a030-11f0-9d14-b5c5bf9af7f9;
 Fri, 03 Oct 2025 10:12:56 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb78ead12so369306766b.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 01:12:56 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486a177c9csm378896466b.89.2025.10.03.01.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 01:12:55 -0700 (PDT)
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
X-Inumbo-ID: c4a06510-a030-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759479176; x=1760083976; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skKuIPY2BwIoWMDC1fVExexzwB2MkrdKJIr5P+Yftng=;
        b=Nsql7wsmtZwTHcUgv2AdCRWjY/VoTqFrOR8afnebfNLHWNa7Mgx6nkjuLvL4swCVPU
         QOOqPkugKLshjka0MZcCAWt6RtogWClYh0PHGVweEfnehHMVf6SQr+2cCsSn/8Y0T6Np
         PJJvdlPqoJ3x05GrImz+7ropUI/2MpsM16IHP7vk5pEsqqNQIQvf7y62VoZ+YE9YTu9s
         PaomSDqHHQ7yaLFDYqQFnU8oyfCAB/kDkXrjAi+0jYsjJabQmzI3E2sPtjrtx3vQnafr
         01ZqUCZLtPSw+2BX6jaD6T8gRM717vDYs3EVTa4ukrUquZgIBrOJ5GrBXHWR66rBzaLA
         Hy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759479176; x=1760083976;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skKuIPY2BwIoWMDC1fVExexzwB2MkrdKJIr5P+Yftng=;
        b=xG06mDwYDwCyHXAELfMefIY7K+bedE1gVl3FUSmizkst99+G/y+dXSxFiHUUeM0EHk
         9IxtPY3iq/nJJ1jOBpNi+J1K7F5FgLRuOmOiAqS1CJ31EdK0guQCmSUtVE4DXdpcr0+k
         gJkj+zMSqSjoGMYwCZbovb/NvU8p/jqILsqMQnkFhGFb4CUmXXoDUWW0K8Jyjw8iDiDZ
         iRobuW5sn8cRqJXdgOSCR6uXTCWhElAzCuckTgA5bd605lLS8lNyY55zSPrYy/3gn4tg
         jTHFFuZdTNrVUn9aM7CQbsX/nrzxwpr3TiuCBUmbXNnw7qitJmhPD3Qghif9DKEdBPiR
         0JCA==
X-Forwarded-Encrypted: i=1; AJvYcCUzVfac2MyyyYD0io5p8zLRGJ3GjWN1aWesOmhrWK1ixWEJD9kZ2kgz9NjnkOc+YzgURN/UCOkMqgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEZTQelAH52LkmNTWJUHHFYXii6a2p9btZqz5m/tQU8xX2yddZ
	7thWjIb38HdLNPM0gGXdAF3HU1RrkHYofA3NrvVfiNc548saMYndRZ6x
X-Gm-Gg: ASbGnctsx+Ktdbay25/j6BtURAvrAVvhPFGfDCCPsnG4oJb6hIse1jmTSluqa1LDtMc
	08Opd6yHyZs6cNnCGrqLP4xNHRJ9gxiclm4nEmnaILkv3jiMHiKsZaeS0Jn3T8yTw1ez9TtqNgY
	GT+4W30Tw/FjgRcAXUZG5KSWyAnVmQO129xrt56J4rDpKo5ZFpurlkjIfTT/TvdQwW6rIeLwflx
	7XJO+lkN8+xSWH48ZaqOjq8LpoOe6yS/D0ztIRSxWXWDS3Zkvk492vzoQTF2ojT9C0Q4P70oyV5
	RKb3AYR8vcJiPn2foR82b3dI7SiXzqyxBCt/T3JexaZlH5jYkn+sLDv/UvOODBdrIwKEfzvTFy+
	g6KQ+wCWrcNNpDptz93vVnMB9YR8k+lZGiyp+NFxtgPlSMbymniO5O3tTsZzrXHEb7FflfbYTyf
	TzsipS4rEk/AQSJpQyBEN+wdRiGexZVPZLtJ0=
X-Google-Smtp-Source: AGHT+IFf4KnZpzbEypEicCmdCmzrDw8Qx7It+XVb0t6afLDTeCS8/xgup/rrlKx6PjPpku8NfTxmYg==
X-Received: by 2002:a17:907:9724:b0:b40:9156:1bf0 with SMTP id a640c23a62f3a-b49befd3051mr262782166b.0.1759479175624;
        Fri, 03 Oct 2025 01:12:55 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------brhXKpSGIs4hevo20c4xq2xZ"
Message-ID: <64ec79c3-a16d-481c-995c-96c187e62475@gmail.com>
Date: Fri, 3 Oct 2025 10:12:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Support LLVM raw profile versions 8, 9, and 10
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <12f2f3bd9010422004c38c23f6758c87df8682a5.1757951300.git.samaan.dehghan@gmail.com>
 <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
 <2c1c305b-a7c2-4da5-be96-3895e284032b@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2c1c305b-a7c2-4da5-be96-3895e284032b@citrix.com>

This is a multi-part message in MIME format.
--------------brhXKpSGIs4hevo20c4xq2xZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/2/25 11:53 AM, Andrew Cooper wrote:
> On 01/10/2025 11:09 pm, Saman Dehghan wrote:
>> This change enables compatibility for measuring code coverage
>> with Clang versions 14 through 20 by supporting their
>> respective raw profile formats.
>>
>> 1- Add support for LLVM raw profile versions 8, 9, and 10
>> 2- Initialized llvm_profile_header for all versions based on llvm source code in
>>     `compiler-rt/include/profile/InstrProfData.inc` for each version.
>> 3- We tested this patch for all clang versions from 14 through 20 on both ARM and X86 platform
>>
>> Signed-off-by: Saman Dehghan<samaan.dehghan@gmail.com>
> CC-ing Oleksii.  This should be considered for 4.21 at this point.
>
> Coverage is an optional feature, off-by-default, but Xen does support
> GCC and Clang (older Clang at least), and right now newer Clang simply
> malfunctions.

In this case, I agree that it should be considered for 4.21:
  Release-Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> I guess I should update
> https://xenbits.xen.org/docs/latest/hypervisor-guide/code-coverage.html
> given the new toolchain baselines.
>
>> ---
>>   xen/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++-----------
>>   xen/include/xen/types.h    |  1 +
>>   2 files changed, 57 insertions(+), 22 deletions(-)
>>
>> diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
>> index 517b2aa8c2..f92f10654c 100644
>> --- a/xen/common/coverage/llvm.c
>> +++ b/xen/common/coverage/llvm.c
>> @@ -44,27 +44,55 @@
>>       ((uint64_t)'f' << 16) | ((uint64_t)'R' << 8)  | ((uint64_t)129)
>>   #endif
>>   
>> -#define LLVM_PROFILE_VERSION    4
>> +#if __clang_major__ >= 19
>> +#define LLVM_PROFILE_VERSION    10
>> +#define LLVM_PROFILE_NUM_KINDS  3
>> +#elif __clang_major__ == 18
>> +#define LLVM_PROFILE_VERSION    9
>>   #define LLVM_PROFILE_NUM_KINDS  2
>> +#elif __clang_major__ >= 14
>> +#define LLVM_PROFILE_VERSION    8
>> +#define LLVM_PROFILE_NUM_KINDS  2
>> +#else
>> +#error "Unsupported Clang version"
>> +#endif
> Does this exclude Clang 13?
>
> Our baseline is 11 or later.  How hard would it be to support those too?
>
>>   
>>   struct llvm_profile_data {
>>       uint64_t name_ref;
>>       uint64_t function_hash;
>> -    void *counter;
>> -    void *function;
>> -    void *values;
>> +    intptr_t *relative_counter;
>> +#if __clang_major__ >= 18
>> +    intptr_t *relative_bitmap;
>> +#endif
>> +    intptr_t *function;
>> +    intptr_t *values;
>>       uint32_t nr_counters;
>>       uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
>> +#if __clang_major__ >= 18
>> +    uint32_t numbitmap_bytes;
>> +#endif
>>   };
>>   
>>   struct llvm_profile_header {
>>       uint64_t magic;
>>       uint64_t version;
>> -    uint64_t data_size;
>> -    uint64_t counters_size;
>> +    uint64_t binary_ids_size;
>> +    uint64_t num_data;
>> +    uint64_t padding_bytes_before_counters;
>> +    uint64_t num_counters;
>> +    uint64_t padding_bytes_after_counters;
>> +    uint64_t num_bitmap_bytes;
>> +    uint64_t padding_bytes_after_bitmap_bytes;
>>       uint64_t names_size;
>> +#if __clang_major__ >= 18
>>       uint64_t counters_delta;
>> +    uint64_t bitmap_delta;
>> +#endif
>>       uint64_t names_delta;
>> +#if __clang_major__ >= 19
>> +    uint64_t num_vtables;
>> +    uint64_t vnames_size;
>> +#endif
>>       uint64_t value_kind_last;
>>   };
>>   
>> @@ -76,19 +104,20 @@ struct llvm_profile_header {
>>    */
>>   int __llvm_profile_runtime;
>>   
>> -extern const struct llvm_profile_data __start___llvm_prf_data[];
>> -extern const struct llvm_profile_data __stop___llvm_prf_data[];
>> -extern const char __start___llvm_prf_names[];
>> -extern const char __stop___llvm_prf_names[];
>> -extern uint64_t __start___llvm_prf_cnts[];
>> -extern uint64_t __stop___llvm_prf_cnts[];
>> +extern char __start___llvm_prf_data[];
>> +extern char __stop___llvm_prf_data[];
>> +extern char __start___llvm_prf_names[];
>> +extern char __stop___llvm_prf_names[];
>> +extern char __start___llvm_prf_cnts[];
>> +extern char __stop___llvm_prf_cnts[];
>> +
>> +#define START_DATA      ((const char *)__start___llvm_prf_data)
>> +#define END_DATA        ((const char *)__stop___llvm_prf_data)
>> +#define START_NAMES     ((const char *)__start___llvm_prf_names)
>> +#define END_NAMES       ((const char *)__stop___llvm_prf_names)
>> +#define START_COUNTERS  ((char *)__start___llvm_prf_cnts)
>> +#define END_COUNTERS    ((char *)__stop___llvm_prf_cnts)
>>   
>> -#define START_DATA      ((const void *)__start___llvm_prf_data)
>> -#define END_DATA        ((const void *)__stop___llvm_prf_data)
>> -#define START_NAMES     ((const void *)__start___llvm_prf_names)
>> -#define END_NAMES       ((const void *)__stop___llvm_prf_names)
>> -#define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
>> -#define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
> Why change these from char to void ?
>
>>   
>>   static void cf_check reset_counters(void)
>>   {
>> @@ -107,10 +136,15 @@ static int cf_check dump(
>>       struct llvm_profile_header header = {
>>           .magic = LLVM_PROFILE_MAGIC,
>>           .version = LLVM_PROFILE_VERSION,
>> -        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
>> -        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
>> -        .names_size = END_NAMES - START_NAMES,
>> -        .counters_delta = (uintptr_t)START_COUNTERS,
>> +        .binary_ids_size = 0,
>> +        .num_data = (((intptr_t)END_DATA + sizeof(struct llvm_profile_data) - 1)
>> +                - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data),
> I can see why we might want to round-down END, but this doesn't need
> casting to intptr_t irrespective of char vs void.
>
>> +        .padding_bytes_before_counters = 0,
>> +        .num_counters = (((intptr_t)END_COUNTERS + sizeof(uint64_t) - 1)
>> +                - (intptr_t)START_COUNTERS) / sizeof(uint64_t),
>> +        .padding_bytes_after_counters = 0,
>> +        .names_size = (END_NAMES - START_NAMES) * sizeof(char),
> sizeof(char) is by definition 1.
>
>> +        .counters_delta = (uintptr_t)START_COUNTERS - (uintptr_t)START_DATA,
>>           .names_delta = (uintptr_t)START_NAMES,
>>           .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
>>       };
>> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
>> index 73ddccbbd5..799bfe0b95 100644
>> --- a/xen/include/xen/types.h
>> +++ b/xen/include/xen/types.h
>> @@ -18,6 +18,7 @@ typedef signed long ssize_t;
>>   
>>   typedef __PTRDIFF_TYPE__ ptrdiff_t;
>>   typedef __UINTPTR_TYPE__ uintptr_t;
>> +typedef __INTPTR_TYPE__ intptr_t;
>>   
>>   /*
>>    * Users of this macro are expected to pass a positive value.
--------------brhXKpSGIs4hevo20c4xq2xZ
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
    <div class="moz-cite-prefix">On 10/2/25 11:53 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2c1c305b-a7c2-4da5-be96-3895e284032b@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 01/10/2025 11:09 pm, Saman Dehghan wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This change enables compatibility for measuring code coverage
with Clang versions 14 through 20 by supporting their
respective raw profile formats.

1- Add support for LLVM raw profile versions 8, 9, and 10
2- Initialized llvm_profile_header for all versions based on llvm source code in 
   `compiler-rt/include/profile/InstrProfData.inc` for each version.
3- We tested this patch for all clang versions from 14 through 20 on both ARM and X86 platform

Signed-off-by: Saman Dehghan <a class="moz-txt-link-rfc2396E" href="mailto:samaan.dehghan@gmail.com">&lt;samaan.dehghan@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
CC-ing Oleksii.  This should be considered for 4.21 at this point.

Coverage is an optional feature, off-by-default, but Xen does support
GCC and Clang (older Clang at least), and right now newer Clang simply
malfunctions.</pre>
    </blockquote>
    <pre>In this case, I agree that it should be considered for 4.21:
 Release-Acked-By: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii
</pre>
    <blockquote type="cite"
      cite="mid:2c1c305b-a7c2-4da5-be96-3895e284032b@citrix.com">
      <pre wrap="" class="moz-quote-pre">

I guess I should update
<a class="moz-txt-link-freetext" href="https://xenbits.xen.org/docs/latest/hypervisor-guide/code-coverage.html">https://xenbits.xen.org/docs/latest/hypervisor-guide/code-coverage.html</a>
given the new toolchain baselines.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">---
 xen/common/coverage/llvm.c | 78 +++++++++++++++++++++++++++-----------
 xen/include/xen/types.h    |  1 +
 2 files changed, 57 insertions(+), 22 deletions(-)

diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
index 517b2aa8c2..f92f10654c 100644
--- a/xen/common/coverage/llvm.c
+++ b/xen/common/coverage/llvm.c
@@ -44,27 +44,55 @@
     ((uint64_t)'f' &lt;&lt; 16) | ((uint64_t)'R' &lt;&lt; 8)  | ((uint64_t)129)
 #endif
 
-#define LLVM_PROFILE_VERSION    4
+#if __clang_major__ &gt;= 19
+#define LLVM_PROFILE_VERSION    10
+#define LLVM_PROFILE_NUM_KINDS  3
+#elif __clang_major__ == 18
+#define LLVM_PROFILE_VERSION    9
 #define LLVM_PROFILE_NUM_KINDS  2
+#elif __clang_major__ &gt;= 14
+#define LLVM_PROFILE_VERSION    8
+#define LLVM_PROFILE_NUM_KINDS  2
+#else
+#error "Unsupported Clang version"
+#endif
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does this exclude Clang 13?

Our baseline is 11 or later.  How hard would it be to support those too?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 struct llvm_profile_data {
     uint64_t name_ref;
     uint64_t function_hash;
-    void *counter;
-    void *function;
-    void *values;
+    intptr_t *relative_counter;
+#if __clang_major__ &gt;= 18
+    intptr_t *relative_bitmap;
+#endif
+    intptr_t *function;
+    intptr_t *values;
     uint32_t nr_counters;
     uint16_t nr_value_sites[LLVM_PROFILE_NUM_KINDS];
+#if __clang_major__ &gt;= 18
+    uint32_t numbitmap_bytes;
+#endif
 };
 
 struct llvm_profile_header {
     uint64_t magic;
     uint64_t version;
-    uint64_t data_size;
-    uint64_t counters_size;
+    uint64_t binary_ids_size;
+    uint64_t num_data;
+    uint64_t padding_bytes_before_counters;
+    uint64_t num_counters;
+    uint64_t padding_bytes_after_counters;
+    uint64_t num_bitmap_bytes;
+    uint64_t padding_bytes_after_bitmap_bytes;
     uint64_t names_size;
+#if __clang_major__ &gt;= 18
     uint64_t counters_delta;
+    uint64_t bitmap_delta;
+#endif
     uint64_t names_delta;
+#if __clang_major__ &gt;= 19
+    uint64_t num_vtables;
+    uint64_t vnames_size;
+#endif
     uint64_t value_kind_last;
 };
 
@@ -76,19 +104,20 @@ struct llvm_profile_header {
  */
 int __llvm_profile_runtime;
 
-extern const struct llvm_profile_data __start___llvm_prf_data[];
-extern const struct llvm_profile_data __stop___llvm_prf_data[];
-extern const char __start___llvm_prf_names[];
-extern const char __stop___llvm_prf_names[];
-extern uint64_t __start___llvm_prf_cnts[];
-extern uint64_t __stop___llvm_prf_cnts[];
+extern char __start___llvm_prf_data[];
+extern char __stop___llvm_prf_data[];
+extern char __start___llvm_prf_names[];
+extern char __stop___llvm_prf_names[];
+extern char __start___llvm_prf_cnts[];
+extern char __stop___llvm_prf_cnts[];
+
+#define START_DATA      ((const char *)__start___llvm_prf_data)
+#define END_DATA        ((const char *)__stop___llvm_prf_data)
+#define START_NAMES     ((const char *)__start___llvm_prf_names)
+#define END_NAMES       ((const char *)__stop___llvm_prf_names)
+#define START_COUNTERS  ((char *)__start___llvm_prf_cnts)
+#define END_COUNTERS    ((char *)__stop___llvm_prf_cnts)
 
-#define START_DATA      ((const void *)__start___llvm_prf_data)
-#define END_DATA        ((const void *)__stop___llvm_prf_data)
-#define START_NAMES     ((const void *)__start___llvm_prf_names)
-#define END_NAMES       ((const void *)__stop___llvm_prf_names)
-#define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
-#define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why change these from char to void ?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 static void cf_check reset_counters(void)
 {
@@ -107,10 +136,15 @@ static int cf_check dump(
     struct llvm_profile_header header = {
         .magic = LLVM_PROFILE_MAGIC,
         .version = LLVM_PROFILE_VERSION,
-        .data_size = (END_DATA - START_DATA) / sizeof(struct llvm_profile_data),
-        .counters_size = (END_COUNTERS - START_COUNTERS) / sizeof(uint64_t),
-        .names_size = END_NAMES - START_NAMES,
-        .counters_delta = (uintptr_t)START_COUNTERS,
+        .binary_ids_size = 0,
+        .num_data = (((intptr_t)END_DATA + sizeof(struct llvm_profile_data) - 1)
+                - (intptr_t)START_DATA) / sizeof(struct llvm_profile_data),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I can see why we might want to round-down END, but this doesn't need
casting to intptr_t irrespective of char vs void.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        .padding_bytes_before_counters = 0,
+        .num_counters = (((intptr_t)END_COUNTERS + sizeof(uint64_t) - 1)
+                - (intptr_t)START_COUNTERS) / sizeof(uint64_t),
+        .padding_bytes_after_counters = 0,
+        .names_size = (END_NAMES - START_NAMES) * sizeof(char),
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
sizeof(char) is by definition 1.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        .counters_delta = (uintptr_t)START_COUNTERS - (uintptr_t)START_DATA,
         .names_delta = (uintptr_t)START_NAMES,
         .value_kind_last = LLVM_PROFILE_NUM_KINDS - 1,
     };
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 73ddccbbd5..799bfe0b95 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -18,6 +18,7 @@ typedef signed long ssize_t;
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 typedef __UINTPTR_TYPE__ uintptr_t;
+typedef __INTPTR_TYPE__ intptr_t;
 
 /*
  * Users of this macro are expected to pass a positive value.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------brhXKpSGIs4hevo20c4xq2xZ--


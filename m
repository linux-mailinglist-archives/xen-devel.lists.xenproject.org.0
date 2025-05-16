Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B90AB9A2D
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:30:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986837.1372352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsKt-00036N-2x; Fri, 16 May 2025 10:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986837.1372352; Fri, 16 May 2025 10:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsKs-00034w-VO; Fri, 16 May 2025 10:30:38 +0000
Received: by outflank-mailman (input) for mailman id 986837;
 Fri, 16 May 2025 10:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFsKr-00034q-Ht
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:30:37 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88a9ebb-3240-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:30:27 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a0af41faa5so1060028f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 03:30:27 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d0fasm2461191f8f.8.2025.05.16.03.30.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 03:30:26 -0700 (PDT)
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
X-Inumbo-ID: c88a9ebb-3240-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747391427; x=1747996227; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGFAzIqle5bFXnLYqA97v+UXHOVGWk8Y1pP980RKSzI=;
        b=YGf/mEfZX5KIXifqJtcUgj9w0rH4aM1JVdT99u0MPYstzylckbG2SdB9Stn1kVwgho
         rX+sPRIQTKgs3FvaqnOKR443qzolr0+2ZrCaGPi+U7478wAQC74FBvWr2lRL4mOmcKRs
         vMrQhTdAqCZjGf+GLk9VazdCOAUx/CKOWgrS9CmvA08MP8nFZff/ZHEWDxu7GG2WcyU1
         WHV4jBkvHk71UyYPBvavFQ1OmmNqsgH9Fsm8QiQ4PfX5KFmM0GW9flyDE5ko7lqzoxT/
         yzonOMBRAz5sxyM6Il6R86l/Lgpc9kyee0mPMyVgZGwCsjSMcxltUTwujXbaSr9s+ldg
         WF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391427; x=1747996227;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGFAzIqle5bFXnLYqA97v+UXHOVGWk8Y1pP980RKSzI=;
        b=KudjAxVbsj+7ra85c6vaxTxghWYAgMMX/4DPZghKT8wwnqslklrFt+FJp/A5jHrdO7
         kfyhFuK7gNTmTJHBYzhr06f2rcThTpT3bnk0KBzpf95YajtsW0jiy2HSVtPyYOoh4L73
         tAzWPJ+YlHYEzF3YL1DRh149HT0ZMi5fWrJOqh9mOOxh8vz5gp7YEwwj1Aa3T3orojP9
         lPCeqBcj6xqCOaZNDp1hLggLO2j40RUNTVVbLAHMlX9rvjN84ILMk6BAjJFzLb07bFHR
         nQnNBg6O462T3VcpuO528HT7PMjq6w8zWQaBWvJ8Jy9pWYvQlf8pdZ5cznUpQ5bNXRmW
         VtHw==
X-Forwarded-Encrypted: i=1; AJvYcCW0rYEUF8k9oWr1iYZ37lbDCzA495vYRYolVobVLsMWmQZTBhuZulCUrDIxnZxquRWDkY3RZHKmq0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVV+V6ImkJPb9W/36KF4oxoq6xB5lgV1MynGmVVPwwJxAWULpQ
	gYK4L+grruirPqDc8Z1R2lAjSgnVueKS3gjT7169NZiIMYqC/mV3qse7
X-Gm-Gg: ASbGncuq+LuIKQnW3/J0aKIOybjc1jz2MwHNGOUbpKO1qkN0cmN16so7nLyYNbDjQx0
	L1DfwGZOXoWXQvQoxvls2va7yoD0Pswm1QeuVqjIyhCDC5jdg9SCo8V/9BRlj4VWfTT8NoCl6T2
	JQxt2Mo2h2W6yslzPIIZsjy58monnAAT/J86b+8uNrl2eNOFtvDE3g0A2v2KqQiNl0TRmYdQIDi
	6xjCt68Cn+OB2DZRpn7cTORhMB46HhkS+tm4gC81+pIKVjyrhVh0rRmqIngkoI3VNozk2CqF9Ix
	xF0ILfcSWhEF6B3vZm7jrPXG7GTk9QzqpSWEYVHtXUkd6A/7Keanwb7XB6b9RESgqe155WAIbU9
	Qe8yZWj6MQ6NnELJCh66IPWoH
X-Google-Smtp-Source: AGHT+IHTl4/QVNzyZEu/4YGFgfak5x2zXUD0cAzGm9ePLh/U0buHDQdhryLy0/sOIX0wQ70FeM1UEQ==
X-Received: by 2002:a05:6000:2af:b0:3a1:f5cf:9553 with SMTP id ffacd0b85a97d-3a35fe6628amr1700349f8f.6.1747391426445;
        Fri, 16 May 2025 03:30:26 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------DoFTsLVLewXu9u8IxN10XzQx"
Message-ID: <cd0004ac-a475-40e8-98d0-e2af16ef2c5c@gmail.com>
Date: Fri, 16 May 2025 12:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] xen/riscv: add ioremap_*() variants using
 ioremap_attr()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <0258c1ac04a73b7d3f9f849507539a329b2998e3.1746530883.git.oleksii.kurochko@gmail.com>
 <0fbe380e-2011-4238-9847-a007c754af6f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0fbe380e-2011-4238-9847-a007c754af6f@suse.com>

This is a multi-part message in MIME format.
--------------DoFTsLVLewXu9u8IxN10XzQx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/14/25 4:32 PM, Jan Beulich wrote:
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> @@ -583,3 +584,36 @@ void *__init arch_vmap_virt_end(void)
>>   {
>>       return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>>   }
>> +
>> +static void *ioremap_attr(paddr_t start, size_t len, pte_attr_t attributes)
>> +{
>> +    mfn_t mfn = _mfn(PFN_DOWN(start));
>> +    unsigned int offs = start & (PAGE_SIZE - 1);
>> +    unsigned int nr = PFN_UP(offs + len);
>> +    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
>> +
>> +    if ( ptr == NULL )
>> +        return NULL;
>> +
>> +    return ptr + offs;
>> +}
>> +
>> +void __iomem *ioremap_nocache(paddr_t start, size_t len)
>> +{
>> +    return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
>> +}
> Why do you need both this and ...
>
>> +void __iomem *ioremap_cache(paddr_t start, size_t len)
>> +{
>> +    return ioremap_attr(start, len, PAGE_HYPERVISOR);
>> +}
>> +
>> +void __iomem *ioremap_wc(paddr_t start, size_t len)
>> +{
>> +    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>> +}
>> +
>> +void *ioremap(paddr_t pa, size_t len)
>> +{
>> +    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>> +}
> ... this? And why's the 1st parameter named differently for this last
> one? Can't they all be in sync in this regard?

Originally, I thought|ioremap_nocache()| was needed because it is used in
common code. However, I now realize that the calls to|ioremap_nocache()|
in|xen/drivers/char| are also ARM-specific. I assume all the
UART drivers currently using|ioremap_nocache|() are intended for ARM.

I'll drop|ioremap_nocache()| for RISC-V, and I think it makes sense to
create a separate patch to clean this up for ARM as well.

~ Oleksii

--------------DoFTsLVLewXu9u8IxN10XzQx
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
    <div class="moz-cite-prefix">On 5/14/25 4:32 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0fbe380e-2011-4238-9847-a007c754af6f@suse.com">
      <pre wrap="" class="moz-quote-pre">On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -583,3 +584,36 @@ void *__init arch_vmap_virt_end(void)
 {
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
+
+static void *ioremap_attr(paddr_t start, size_t len, pte_attr_t attributes)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(start));
+    unsigned int offs = start &amp; (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *ptr = __vmap(&amp;mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
+
+    if ( ptr == NULL )
+        return NULL;
+
+    return ptr + offs;
+}
+
+void __iomem *ioremap_nocache(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why do you need both this and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+void __iomem *ioremap_cache(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR);
+}
+
+void __iomem *ioremap_wc(paddr_t start, size_t len)
+{
+    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
+}
+
+void *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... this? And why's the 1st parameter named differently for this last
one? Can't they all be in sync in this regard?</pre>
    </blockquote>
    <pre data-start="59" data-end="336" class="">Originally, I thought <code
    data-start="81" data-end="100">ioremap_nocache()</code> was needed because it is used in
common code. However, I now realize that the calls to <code
    data-start="188" data-end="207">ioremap_nocache()</code>
in <code data-start="211" data-end="229">xen/drivers/char</code> are also ARM-specific. I assume all the
UART drivers currently using <code data-start="81" data-end="100">ioremap_nocache</code>() are intended for ARM.</pre>
    <pre data-start="338" data-end="467" class="">I'll drop <code
    data-start="348" data-end="367">ioremap_nocache()</code> for RISC-V, and I think it makes sense to
create a separate patch to clean this up for ARM as well.

~ Oleksii</pre>
  </body>
</html>

--------------DoFTsLVLewXu9u8IxN10XzQx--


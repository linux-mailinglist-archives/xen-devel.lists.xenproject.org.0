Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26382A73293
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929224.1331852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmgj-0000po-Gh; Thu, 27 Mar 2025 12:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929224.1331852; Thu, 27 Mar 2025 12:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txmgj-0000mw-Dh; Thu, 27 Mar 2025 12:50:25 +0000
Received: by outflank-mailman (input) for mailman id 929224;
 Thu, 27 Mar 2025 12:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txmgi-0000mm-C0
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:50:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bdc5b5a-0b0a-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 13:50:22 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso142398666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 05:50:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3ef869fb5sm1255598466b.15.2025.03.27.05.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 05:50:21 -0700 (PDT)
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
X-Inumbo-ID: 0bdc5b5a-0b0a-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743079822; x=1743684622; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg1WMwzD3+fzmKMGZo5L4BsVNyNbawIpifObTOODDxU=;
        b=EMyWLYaQ1Wu9VspACrdiA647Jt3sLydxKNWGG21RsX903qrHBnl0H23RL5rA2aaCKT
         xmBtC3iGHUTNkOT7HFqZW65a06oUe3f+rnqO806GJv2pHqSXvowSKrSJ1QqqiGs4UVom
         /QCmZYvPaRgUaN6mLjOsJr/kMwjM/5aGYVwr9ksO68gUwPQ7G9gVVdA5cIThCwbdKFv5
         wXbG1kph4GqTMUH4YLL0JisgQ6g/2T9af74K30IVIc+AumFoHqSaBKQQTYeTx3tJLiWY
         uSfHKQtO0KY+MDyTKfFiIg4smG+4fSBSL3SmSY7KOMo9eHBvXqZBdrqGSjNG8L7FzCnb
         /K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079822; x=1743684622;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yg1WMwzD3+fzmKMGZo5L4BsVNyNbawIpifObTOODDxU=;
        b=U/uqjSRjt+XAWckvmFZlW4n/GrPvl9lLgtdKSRDs77XlPU9ipJhKG44cgXgufgmLkQ
         KxjOQpzzxNFN5LxC2vnSBESk/Pg8JeYB8ayqijIshWdgElHr7LiRb8L4mz7D5vxFrinh
         O65RKC4qpRZK4blKEoLqE+tf0SPd2fsuWexKJUkz1RXZ8GC0MAXYBHHZs0XwBpMtGG9t
         NBOHBvtYRSPHV3H1l/8u6gYoy00Z5Gr31dbyPUXhmeOWxmLNIFaS+Ju6cvIdq8nuAPRw
         AG8rrEu+4E6keB9Hf3ze/nKJ7XeYpWX9H5qgnQCRcWJ5TdVMJc/1oNV2c4Zl7NMiUFxx
         23vA==
X-Forwarded-Encrypted: i=1; AJvYcCW+Q/stAMxwziJI5+zGy+ZuxbVjbGRnCmsle97ZS6YocDoP8DpvxXQAgGezPsmZCh/vOjNuOCCD8fY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTY7n0dJMYdmaTvXwAsRYjBLbxb6tDynhEwH696sz2DtuAB4Cg
	UdtXr9ejLMKL2wWQ8fSgB7aUTG7O+x2P5JVRRQUGG4hDruc1iUwP
X-Gm-Gg: ASbGncvuYT1t5OYzl3dtOQJBI7ZRdVb1NO3K700/Qo8n6R/L3/L5wIRrDD0M0A2UbDr
	kKc/Sd5sd75kIbIVRJ+/Trw7uRME9kSXb3tWXjcT1ChT7UDner5YfDUoMJvjHDKdjI+1VqxLnKl
	IBN/L72/vxk5qZz2g93wbV1KrcH76eUloISFa3Y8slBLgx6XfoiIX1B5Z24TKKUoDg8A9GzDY//
	Z1tAsgH9/MIYB479zed2PfgY+ttP/UA8u6rjmDigWgTkTfP3BruopXMhDbgIhk78PnpkNf2vfnb
	RN4k/fCBqld6Ws3sakvjpFLtoKeg8SbZa/DKS2cEcYdG8NRvMQLsD8Rsbo84VzAkancbJ+8gfMm
	PIInk14/sPQrw1SzgZoJb
X-Google-Smtp-Source: AGHT+IGORP23OnU8NN6oUdzohHzJuDFbsyNhYR7+cO7lCLxJ8jn6gtQTJabkZUQxerJxNKUTCv3rMQ==
X-Received: by 2002:a17:907:3609:b0:ac2:7a6d:c927 with SMTP id a640c23a62f3a-ac6fb14ec0dmr368581366b.50.1743079821572;
        Thu, 27 Mar 2025 05:50:21 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------eWyI60p0nnfMTdBRG0QyofGh"
Message-ID: <c3d6a46c-c372-43f2-81d4-8128ebcb1b2b@gmail.com>
Date: Thu, 27 Mar 2025 13:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <4f085bcbf5b6f1bc42824bfb08724e8a9bbd4918.1743005389.git.oleksii.kurochko@gmail.com>
 <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com>

This is a multi-part message in MIME format.
--------------eWyI60p0nnfMTdBRG0QyofGh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/27/25 1:44 AM, Andrew Cooper wrote:
> On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
>> index d888b2314d..dbbf2fce62 100644
>> --- a/xen/include/xen/config.h
>> +++ b/xen/include/xen/config.h
>> @@ -98,4 +98,13 @@
>>   #define ZERO_BLOCK_PTR ((void *)-1L)
>>   #endif
>>   
>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
>> +
>> +#define BITS_PER_BYTE   __CHAR_BIT__
>> +#define BITS_PER_INT    (__SIZEOF_INT__ << 3)
>> +#define BITS_PER_LONG   (BYTES_PER_LONG << 3)
>> +#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ << 3)
>> +
>> +#define POINTER_ALIGN   __SIZEOF_POINTER__
> See how much nicer this is.  This patch possibly wants to wait until
> I've fixed the compiler checks to update to the new baseline, or we can
> just say that staging is staging and corner case error messages are fine.

Do you mean this patch:https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/?

I haven't checked clang but if to look at gcc then these builtin macros was introduced in
024a85aeb6a("c-cppbuiltin.c (builtin_define_type_sizeof): New function.") and it seems like even older then gcc5
contains this patch:
$ git tag --contains 024a85aeb6a912811d917f737eaad39140c2fb0c
   ...
   releases/gcc-4.3.0
   ...

Am I missing something?

>
> One thing, you have to replace the "<< 3" as you're hard-coding 8 here
> and ignoring __CHAR_BIT__.
>
> I'd suggest keeping the BITS_PER_BYTE on the LHS, e.g:
>
> #define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)
>
> which tabulates better.

Thanks. I'll update that and send the new patch version.

~ Oleksii

--------------eWyI60p0nnfMTdBRG0QyofGh
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
    <div class="moz-cite-prefix">On 3/27/25 1:44 AM, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com">
      <pre wrap="" class="moz-quote-pre">On 26/03/2025 5:47 pm, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/xen/include/xen/config.h b/xen/include/xen/config.h
index d888b2314d..dbbf2fce62 100644
--- a/xen/include/xen/config.h
+++ b/xen/include/xen/config.h
@@ -98,4 +98,13 @@
 #define ZERO_BLOCK_PTR ((void *)-1L)
 #endif
 
+#define BYTES_PER_LONG  __SIZEOF_LONG__
+
+#define BITS_PER_BYTE   __CHAR_BIT__
+#define BITS_PER_INT    (__SIZEOF_INT__ &lt;&lt; 3)
+#define BITS_PER_LONG   (BYTES_PER_LONG &lt;&lt; 3)
+#define BITS_PER_LLONG  (__SIZEOF_LONG_LONG__ &lt;&lt; 3)
+
+#define POINTER_ALIGN   __SIZEOF_POINTER__
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
See how much nicer this is.  This patch possibly wants to wait until
I've fixed the compiler checks to update to the new baseline, or we can
just say that staging is staging and corner case error messages are fine.</pre>
    </blockquote>
    <pre>Do you mean this patch: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/">https://lore.kernel.org/xen-devel/20250320153241.43809-3-andrew.cooper3@citrix.com/</a>?

I haven't checked clang but if to look at gcc then these builtin macros was introduced in
024a85aeb6a("c-cppbuiltin.c (builtin_define_type_sizeof): New function.") and it seems like even older then gcc5
contains this patch:
$ git tag --contains 024a85aeb6a912811d917f737eaad39140c2fb0c
  ...
  releases/gcc-4.3.0
  ...

Am I missing something?
</pre>
    <blockquote type="cite"
      cite="mid:17a808cf-e676-4c30-9068-34a9a4d568d7@citrix.com">
      <pre wrap="" class="moz-quote-pre">

One thing, you have to replace the "&lt;&lt; 3" as you're hard-coding 8 here
and ignoring __CHAR_BIT__.

I'd suggest keeping the BITS_PER_BYTE on the LHS, e.g:

#define BITS_PER_INT    (BITS_PER_BYTE * __SIZEOF_INT__)

which tabulates better.</pre>
    </blockquote>
    <pre>Thanks. I'll update that and send the new patch version.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------eWyI60p0nnfMTdBRG0QyofGh--


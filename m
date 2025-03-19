Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF63A695C4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 18:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920989.1325027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwrX-00071z-3G; Wed, 19 Mar 2025 17:05:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920989.1325027; Wed, 19 Mar 2025 17:05:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuwrW-00070I-Vg; Wed, 19 Mar 2025 17:05:50 +0000
Received: by outflank-mailman (input) for mailman id 920989;
 Wed, 19 Mar 2025 17:05:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTXv=WG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuwrV-00070C-S7
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 17:05:49 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67a07409-04e4-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 18:05:48 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac25313ea37so1362177666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 10:05:48 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149d0bc1sm1053936866b.105.2025.03.19.10.05.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 10:05:47 -0700 (PDT)
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
X-Inumbo-ID: 67a07409-04e4-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403948; x=1743008748; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8I+jk5Xqoa7f7e8E11bmoLcYhdvkBlXUlAE7X4ZcoA=;
        b=MIpwpDvafw+K5w/IOX6aREYJWMdMpVf9D3snH/vp3Mfu2e6YCD2sZpiOImhNZVI5Mv
         rIGRaiPBMSdn1PpAUIsFeMdr08PzC1yojYLcS7MZ5QZNLUntvmdZYcjhjqkLAOiv3QS1
         Ipuq+68Er1ymNpedOFZ/Qx8n9bL3oSZVESoG0xxFADvMKqKQU2nt5J9BQpaHfO/wpY1/
         A0lQzhGBj7Bj3Q8Ire6PqVJc/5d5F2JANymNfeNp8SvLE67d847QbzrbbF8MAZzwXWtj
         bHTfwEfohGanThJp1KMVlwaSOVe1vNMMIxsaYNyzB9q5jayvdVkqGNPShwvIfiOzQWHl
         4IPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403948; x=1743008748;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M8I+jk5Xqoa7f7e8E11bmoLcYhdvkBlXUlAE7X4ZcoA=;
        b=snx9WtNHPkhaNd/IF857+i1+QJe3vNbRAUvptL3KGTadATp/oDecKhlINNWOa8gj5V
         gT634oBRi5Ns6pl9KhL09gHL0Lz4lpkRDH+t1Ga38dNzhv49d8N9t0B56Ol/ok5AHx8r
         VWhNRTfEcwWXb53tjN8VMkG/h8XZsoVLwC+5U4i9e/2j9lJOi9k/z+P0Nuu3WekIdT56
         befqDVqEei42XKC1Py6kIGOe/Ex+fpkITSk0rX48MnRJN5bQWUolsTd/PzKxZhbWNBkB
         d0aF0Rw+31Cu68eAn/alLVW91LRimTbS7BPgqizdBqcG5EKD6mMQmtjXo7XQtc8+5twu
         BUHg==
X-Forwarded-Encrypted: i=1; AJvYcCXk5+famh4Wm+zYrAPxlpxPEQVbb8ATMWxWZcWyFQk7Q7hz4cm/eHZmu9rG1hQof/F6epK988LBa5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0JxjpFEh9fnIlh9h3qxrlouXz/kkLsTll6mHE/12ir63dBDIA
	t+BoB+AK6rFOFRNX0r09X2A1ETZRqId2a/RQSQnpuxqeBnfxEaVZ
X-Gm-Gg: ASbGnctY/FTN3x7vG/TByW5uL5tk925dZLaQ3tndeMrt+0SpGz+lr5sA+hMB1W9tpy3
	TRBbDMrhYSc+t2cx7R419MF+4YpL/Bw7ORnAYUF9r0Z6ZK+L9A8g9sOyh1iW9rdbb9yOH0XH1Ll
	ZPXLRuSB3hjdgXQFrBij1tpAuEU2+I3p0aTTToLzM3JKqxfpdodRVFWFXEECfSBuj9xaZhfn81E
	nEkIaNkPy75iY6hxnsEnwrH+cd7nQXXUBjzRSBkHDKPY/uREwVJwD7QgyL103fOGSzT0oStcfoO
	XfmjJzBpTl415/WIgw1KRFO6qKu/DxzI6G9e1vXp5EHa2WegqOIwW7gRFz0UDYumsayp3QHsyEb
	Dyo2RErbucZNtgWHHrEXm
X-Google-Smtp-Source: AGHT+IEi8u+C6OT4xWL0PFFUXqqZD1M/jQuy+wjHz1dEDGaOvbXwKWJ4bKVbypQba1l+JJunao6tTw==
X-Received: by 2002:a17:907:3fa6:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac3b7e7de86mr312055966b.32.1742403947845;
        Wed, 19 Mar 2025 10:05:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------PmtPq30k6G48vI80VGTRdYa2"
Message-ID: <aa1d8b9b-a02a-4134-92f7-f350fc537da2@gmail.com>
Date: Wed, 19 Mar 2025 18:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen/riscv: introduce intc_preinit()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <d89d647a0b71b0a0bc8aeb90395b28bcab15074e.1741709885.git.oleksii.kurochko@gmail.com>
 <c9f6bfcc-cf74-42bf-bcf3-65ca6c89bdd5@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c9f6bfcc-cf74-42bf-bcf3-65ca6c89bdd5@suse.com>

This is a multi-part message in MIME format.
--------------PmtPq30k6G48vI80VGTRdYa2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/17/25 4:46 PM, Jan Beulich wrote:
> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -16,6 +16,7 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/early_printk.h>
>>   #include <asm/fixmap.h>
>> +#include <asm/intc.h>
>>   #include <asm/sbi.h>
>>   #include <asm/setup.h>
>>   #include <asm/smp.h>
>> @@ -128,6 +129,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       preinit_xen_time();
>>   
>> +    intc_preinit();
> And there's only ever going to be a single interrupt controller type on RISC-V?
> IOW - no abstraction needed?

Yes, we are going to have a single interrupt controller on RISC-V.
At least, at the moment in downstream we don't have other cases. make_intc_node() (it is
introduced only in downstream) which is used during domain build also expects
only having one interrupt controller.

Also, Arm lives for a long time with single interrupt controller.

~ Oleksii

--------------PmtPq30k6G48vI80VGTRdYa2
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
    <div class="moz-cite-prefix">On 3/17/25 4:46 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c9f6bfcc-cf74-42bf-bcf3-65ca6c89bdd5@suse.com">
      <pre wrap="" class="moz-quote-pre">On 11.03.2025 17:19, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -16,6 +16,7 @@
 #include &lt;asm/cpufeature.h&gt;
 #include &lt;asm/early_printk.h&gt;
 #include &lt;asm/fixmap.h&gt;
+#include &lt;asm/intc.h&gt;
 #include &lt;asm/sbi.h&gt;
 #include &lt;asm/setup.h&gt;
 #include &lt;asm/smp.h&gt;
@@ -128,6 +129,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     preinit_xen_time();
 
+    intc_preinit();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And there's only ever going to be a single interrupt controller type on RISC-V?
IOW - no abstraction needed?</pre>
    </blockquote>
    <pre>Yes, we are going to have a single interrupt controller on RISC-V.
At least, at the moment in downstream we don't have other cases. make_intc_node() (it is
introduced only in downstream) which is used during domain build also expects
only having one interrupt controller.

Also, Arm lives for a long time with single interrupt controller.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------PmtPq30k6G48vI80VGTRdYa2--


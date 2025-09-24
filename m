Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39BB99953
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 13:31:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129331.1469336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NiT-0001ne-I1; Wed, 24 Sep 2025 11:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129331.1469336; Wed, 24 Sep 2025 11:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1NiT-0001lZ-El; Wed, 24 Sep 2025 11:31:21 +0000
Received: by outflank-mailman (input) for mailman id 1129331;
 Wed, 24 Sep 2025 11:31:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9CQP=4D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v1NiS-0001lT-8J
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 11:31:20 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd3bcab1-9939-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 13:31:19 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-62fc89cd630so8088882a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 04:31:19 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5f121f2sm12674695a12.28.2025.09.24.04.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 04:31:17 -0700 (PDT)
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
X-Inumbo-ID: fd3bcab1-9939-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758713478; x=1759318278; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPFDb3PbtCP5J2g852+Vzx93vzGoEbOujSKET5GEjgU=;
        b=luUXoBSeKX+vgs0QKGes7ZdA6qJwoYSJyf8/QdkkuBReH7dVcWC+cu0vqEf34ROgF5
         GX1TSXXZ2eSbBj9b3tXn05QOBbCV5qgeo/v8/nXvTgjej7uAWdgAejkpOFZ8DOUBKyog
         DcW1/u6zzjzEtIsg4Sl41WN+Dp7CgeM5I35HJXcGj/ZfDrNdbqh/HhJaUlsJGoCXeKyV
         ylEgpB2bwPriqOa4IKV+mfMJt+kRFJfeyHP/1GDUl2VmhPA2+2vBpz9o8MZPbeYfaFLe
         pHDZvBTqBI8hRY+sJEHeYP4ln9hGzqSpms7htz7C2vGs7mum3T6fR7TXCu5sWuyEjufM
         4lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758713478; x=1759318278;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LPFDb3PbtCP5J2g852+Vzx93vzGoEbOujSKET5GEjgU=;
        b=DIMFvmeqVunFVb9dP80awLbJN3qmXzEYYKT+iYm2S6yB08JPDOcO5HyjEsjx67mtAr
         yx32ZRQO2rOP16NCN/4E/K+lqIsjVGGItsZRHn3TnyUnXg4KBrF6X2r93qyKDO/jSKqL
         bODgOYFzEAfGulrTNImGDMrpILwInECztm9TgVWEpsjMw1wZ1KhLiqmmX6HXdvl0vcZt
         Y9Eu4rsZUtY/eFzZ2yscTBgE01bS3nzE20NKtVS+p2NrRaUbuKvtzWzjYWSeqHh0Sm4N
         2gwENXsFHiMCRy2iGu3c7sqnml3VXOGiP8DKjIxlbZy34yKqY3vFl+lgfRv+BHFS1Ofk
         pZlg==
X-Forwarded-Encrypted: i=1; AJvYcCW8tky87BeUfGAJ/G1jeJ4x6VDSgdAVYWrz+yk9hH2fTUDAZcRe/WWl5zTh98Z0vwLjHDejWp7zOfc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZX/BN2O/7xZYKmC71eJgl92YUhWFp22HTcf7FUgJ2x8MNgPrA
	/g+dA8UtxJNmoV9QLxIbu5FmhX/hW9WQXTPDXXU7afHvb4rywryt+2eV
X-Gm-Gg: ASbGncvyIOt1a2fl/2Bd0TPo9ywg5FStbOZ/dFRa2impWd6Q88/Qsyj4FciXk0C27dQ
	lMk9OgvSw2SNBgimdvTxw7BcgdGqdl75tP10NAVKHWe3DXHlpqVCMtJ1XVKqEIXp7KQQiHhBNbL
	hmqUeO1dmEINXvC866LSTOwC1DRBnZ0cBVUZ0752QbwmEviWTPPg2KsDCca8DyZvphX6bZ5N1dA
	TTkPr8r/FMxNn8PRprzcWzp9XelfdSX5itLWNnhvvVF+vBnol5jxKgX3fG7m2ucT8ewGb7wRl7X
	CP45LBIfc55RwEVhRpKw6Dudw+toD/BHguwGamTnFH0S0ffTOJ/CQvZRS1pGNk2LHsUX5MLpme+
	GL6vVPnS/4AQv/A6VyZWHyKw8acK9XipSaxkF9JLtW8cIAvBphh/cXQBRw87vZyEgH7l443A2
X-Google-Smtp-Source: AGHT+IFcNa1vMx5+l6VzxZ2nObDBx+4GF2C0kd1VIk0Eikj2mNMYn0Rq7/I00cVr3UOrfdGrR4VnPA==
X-Received: by 2002:a05:6402:2690:b0:631:a0ed:6471 with SMTP id 4fb4d7f45d1cf-63467678a38mr4779058a12.2.1758713478155;
        Wed, 24 Sep 2025 04:31:18 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------d2qVW7ePvJk7iwiPY4HR0j6d"
Message-ID: <0c4e446b-abe1-481c-91a6-60a49459b486@gmail.com>
Date: Wed, 24 Sep 2025 13:31:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/18] xen/riscv: detect and initialize G-stage mode
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <7cc37e612db4a0bfe72b63a475d3a492b2e68c83.1758145428.git.oleksii.kurochko@gmail.com>
 <b7fa50ae-8094-4451-8326-53c975f7b441@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b7fa50ae-8094-4451-8326-53c975f7b441@suse.com>

This is a multi-part message in MIME format.
--------------d2qVW7ePvJk7iwiPY4HR0j6d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/18/25 5:54 PM, Jan Beulich wrote:
> On 17.09.2025 23:55, Oleksii Kurochko wrote:
>> --- /dev/null
>> +++ b/xen/arch/riscv/p2m.c
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#include <xen/init.h>
>> +#include <xen/lib.h>
>> +#include <xen/macros.h>
>> +#include <xen/sections.h>
>> +
>> +#include <asm/csr.h>
>> +#include <asm/flushtlb.h>
>> +#include <asm/riscv_encoding.h>
>> +
>> +unsigned long __ro_after_init gstage_mode;
>> +
>> +void __init gstage_mode_detect(void)
>> +{
>> +    unsigned int mode_idx;
>> +
>> +    const struct {
> static and __initconst.
>
>> +        unsigned long mode;
> Here and also for the global var: Why "long", when it's at most 4 bits?

No specific reason now. In the first version of this function they were used
directly to write a value to CSR register which is 'unsigned long'.
Considering that MASK_INSR() and MASK_EXTR() are used, 'char' should be enough
to describe mode.

>
>> +        unsigned int paging_levels;
>> +        const char *name;
> More efficiently char[8]?

I wanted to be sure that the name will always have correct length. But I agree
that char[8] is more efficient and a length could be checked "manually". I will
use char[8] instead of 'char *'.

>
>> +    } modes[] = {
>> +        /*
>> +         * Based on the RISC-V spec:
>> +         *   When SXLEN=32, the only other valid setting for MODE is Sv32,
> The use of "other" is lacking some context here.

I will add the following:
   Bare mode is always supported, regardless of SXLEN.

>
>> +         *   a paged virtual-memory scheme described in Section 10.3.
> Section numbers tend to change. Either to disambiguate by also spcifying
> the doc version, or (preferably) you give the section title instead.

I will take that into account in the future. For now, I think that this part
of the comment could be just dropped as here it doesn't matter what is a scheme
of Sv32.

>> --- a/xen/arch/riscv/setup.c
>> +++ b/xen/arch/riscv/setup.c
>> @@ -22,6 +22,7 @@
>>   #include <asm/early_printk.h>
>>   #include <asm/fixmap.h>
>>   #include <asm/intc.h>
>> +#include <asm/p2m.h>
>>   #include <asm/sbi.h>
>>   #include <asm/setup.h>
>>   #include <asm/traps.h>
>> @@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>>   
>>       console_init_postirq();
>>   
>> +    gstage_mode_detect();
> I find it odd for something as fine grained as this to be called from top-
> level start_xen(). Imo this wants to be a sub-function of whatever does
> global paging and/or p2m preparations (or even more generally guest ones).

It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
when the latter is introduced.
Probably, I will move the current patch after p2m_init() is introduced to make
gstage_mode_detect() static function.

Thanks.

~ Oleksii

--------------d2qVW7ePvJk7iwiPY4HR0j6d
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
    <div class="moz-cite-prefix">On 9/18/25 5:54 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b7fa50ae-8094-4451-8326-53c975f7b441@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.09.2025 23:55, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/p2m.c
@@ -0,0 +1,91 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include &lt;xen/init.h&gt;
+#include &lt;xen/lib.h&gt;
+#include &lt;xen/macros.h&gt;
+#include &lt;xen/sections.h&gt;
+
+#include &lt;asm/csr.h&gt;
+#include &lt;asm/flushtlb.h&gt;
+#include &lt;asm/riscv_encoding.h&gt;
+
+unsigned long __ro_after_init gstage_mode;
+
+void __init gstage_mode_detect(void)
+{
+    unsigned int mode_idx;
+
+    const struct {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
static and __initconst.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        unsigned long mode;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Here and also for the global var: Why "long", when it's at most 4 bits?</pre>
    </blockquote>
    <pre>No specific reason now. In the first version of this function they were used
directly to write a value to CSR register which is 'unsigned long'.
Considering that MASK_INSR() and MASK_EXTR() are used, 'char' should be enough
to describe mode.

</pre>
    <blockquote type="cite"
      cite="mid:b7fa50ae-8094-4451-8326-53c975f7b441@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+        unsigned int paging_levels;
+        const char *name;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
More efficiently char[8]?</pre>
    </blockquote>
    <pre>I wanted to be sure that the name will always have correct length. But I agree
that char[8] is more efficient and a length could be checked "manually". I will
use char[8] instead of 'char *'.

</pre>
    <blockquote type="cite"
      cite="mid:b7fa50ae-8094-4451-8326-53c975f7b441@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    } modes[] = {
+        /*
+         * Based on the RISC-V spec:
+         *   When SXLEN=32, the only other valid setting for MODE is Sv32,
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
The use of "other" is lacking some context here.</pre>
    </blockquote>
    <pre>I will add the following:
  Bare mode is always supported, regardless of SXLEN.

</pre>
    <blockquote type="cite"
      cite="mid:b7fa50ae-8094-4451-8326-53c975f7b441@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+         *   a paged virtual-memory scheme described in Section 10.3.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Section numbers tend to change. Either to disambiguate by also spcifying
the doc version, or (preferably) you give the section title instead.</pre>
    </blockquote>
    <pre>I will take that into account in the future. For now, I think that this part
of the comment could be just dropped as here it doesn't matter what is a scheme
of Sv32.

</pre>
    <blockquote type="cite"
      cite="mid:b7fa50ae-8094-4451-8326-53c975f7b441@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -22,6 +22,7 @@
 #include &lt;asm/early_printk.h&gt;
 #include &lt;asm/fixmap.h&gt;
 #include &lt;asm/intc.h&gt;
+#include &lt;asm/p2m.h&gt;
 #include &lt;asm/sbi.h&gt;
 #include &lt;asm/setup.h&gt;
 #include &lt;asm/traps.h&gt;
@@ -148,6 +149,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     console_init_postirq();
 
+    gstage_mode_detect();
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I find it odd for something as fine grained as this to be called from top-
level start_xen(). Imo this wants to be a sub-function of whatever does
global paging and/or p2m preparations (or even more generally guest ones).</pre>
    </blockquote>
    <pre>It makes sense. I will move the call to gstage_mode_detect() into p2m_init()
when the latter is introduced.
Probably, I will move the current patch after p2m_init() is introduced to make
gstage_mode_detect() static function.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------d2qVW7ePvJk7iwiPY4HR0j6d--


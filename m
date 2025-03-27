Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A2A72CBC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 10:50:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928833.1331483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjsX-00076K-Ju; Thu, 27 Mar 2025 09:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928833.1331483; Thu, 27 Mar 2025 09:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txjsX-00073q-H7; Thu, 27 Mar 2025 09:50:25 +0000
Received: by outflank-mailman (input) for mailman id 928833;
 Thu, 27 Mar 2025 09:50:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eznr=WO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txjsV-00073k-Ro
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 09:50:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6b8fc25-0af0-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 10:50:22 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ac6ed4ab410so119058466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 02:50:22 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efb52c17sm1205261266b.101.2025.03.27.02.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 02:50:21 -0700 (PDT)
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
X-Inumbo-ID: e6b8fc25-0af0-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743069022; x=1743673822; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0syIvsvukLHj+49FXh8nJVa0XcU3Hs7yr6lTgKow/t8=;
        b=jhWdJDIWMr+bjV66rRJWL4V5TIca70NbswAIiUGDqdaHRK+tyoH5jZF5PLievv3EQg
         gJlQKgPLmZwkLbbK1X0GzdGpOZ9UqimebGtDvvZBd171WzepIIPnzuOiNymXSKxjfr+N
         DqVYc+GIAORtXCGvcN7RhIs8ws4UOxvKo9qA+ywgPSSz/wtVqyuZxAjrFEVMEKk/VbBS
         QeBrcXQBi/sKeXoMih7mx1NDtHF9FaD7LANRgc8n3V5nGeahkxLhS8rPFDsFDGEsBzyp
         kOtv9CaXMNlVpfa3Pk73GO7b9m6VIqrZtPjgF6AYJDsmaOEr5P7aVMULZtBPV1QOY7pu
         Knmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743069022; x=1743673822;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0syIvsvukLHj+49FXh8nJVa0XcU3Hs7yr6lTgKow/t8=;
        b=VYUx41xMSgueg0sNyJ9LSc4tNB3dl72/ku3V51h61HRXlFBAZMchnCS2qcEEaCISBE
         HDp2hDNMC3eP992fWx7vvDliNnuy11WhVn8kASzFWRVOy30i2uRqPOQ44RTGuDXUOd5r
         EBr6xEtczRuWbjtT/7UgEUdCtTFWXcpGpXAbmbgYOWkeFpeDCw5dN0b3wn1WHdiouj3u
         64m/DtwdUeKYI+izqA/cEE8PAaJ/wRvU1kN8J2CRiPyzMzA8MfSJdBG2AJ3gk0+q4Y8W
         CQjyheUe5VzIIrKO2UsN2QJzmTYss2J7Xt7RfAyaYDrdHgFAR6KpBPQkxB+lruXmhPoi
         JnNA==
X-Forwarded-Encrypted: i=1; AJvYcCX+xfAqcdO9O8ywI+h7rwUZZ5d1aqlQGfoS1VVQs45p1X8G3GJRsk1ZrtW954A2wzyl9okuCAZzXIM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxr+3lasSV9WpGCzBwEMs7ll7A7enOREIwBYY7KFN8RTYAU20Lp
	PG8hxEcXnMDUnss18SaSv+B6qLIEePDyJIy6CWppi5JMZw5XByqU
X-Gm-Gg: ASbGncs4a8PF9/KdYYDfV0AJGxkzA/Y4i7gOcb9f1QLqxoGjTerc8LdZt4qPiko0kSC
	JWMJLWOHu6TiqdiYOSqTJ12zUN/MTfgwdpWn7KOAu0muaOzpsFp5KdcKKlm+pfpNfSur3mPQeh6
	oAOVEu3fEY3VhMsBnU+8WN57Q5wjRhpeGugaOFSFd8rxiS2DE5sJ6Xcpvl7COZiD9GQYf9hhYvS
	O1G5r0H7628wtCnqOgdQhdDbAr7inzoSCJsngsq1izgulDvamvc/7anePxYn/rjsK6H3YI7OUe1
	nG/SJBYDOWKm/D/SjTQNw9uOWRoomtnAlMOWviJ8BTSmdDlPPl1xIx+Kh9inyhEUU9EcjOjtLyk
	3JKsYdoNAFcZ6wDunknLLaSjZttmQDW0=
X-Google-Smtp-Source: AGHT+IFuNauv2gsArJsG0j7pD5dXNgSBe59Z23kjZye3uXWDjdrwt6oHWOrG9BTVZupip9o0gfCpPw==
X-Received: by 2002:a17:907:608c:b0:ac1:e2e0:f8d6 with SMTP id a640c23a62f3a-ac6fae9bf39mr219739966b.17.1743069022021;
        Thu, 27 Mar 2025 02:50:22 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------l7IhU0QX0DPtO1uAdi9JAc6z"
Message-ID: <af2fce79-ddf0-4cda-a834-9b255a2d0223@gmail.com>
Date: Thu, 27 Mar 2025 10:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] xen/riscv: implement basic aplic_preinit()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <1a04711f46a1c0a7cdf709abc37f143747215495.1742918184.git.oleksii.kurochko@gmail.com>
 <f0945e3a41e911b5dfd005a8d15aa0d668d8e3cf.1742918184.git.oleksii.kurochko@gmail.com>
 <e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com>
 <242f04d2-50b6-4ce1-8710-6dae2f940b9e@gmail.com>
 <b0af1e38-9c27-469e-8bc9-321d3c49dd2c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <b0af1e38-9c27-469e-8bc9-321d3c49dd2c@suse.com>

This is a multi-part message in MIME format.
--------------l7IhU0QX0DPtO1uAdi9JAc6z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/27/25 8:39 AM, Jan Beulich wrote:
> On 26.03.2025 17:49, Oleksii Kurochko wrote:
>> On 3/26/25 4:19 PM, Jan Beulich wrote:
>>> On 25.03.2025 18:36, Oleksii Kurochko wrote:
>>>> Introduce preinitialization stuff for the RISC-V Advanced Platform-Level
>>>> Interrupt Controller (APLIC) in Xen:
>>>>    - Implementing the APLIC pre-initialization function (`aplic_preinit()`),
>>>>      ensuring that only one APLIC instance is supported in S mode.
>>>>    - Initialize APLIC's correspoinding DT node.
>>>>    - Declaring the DT device match table for APLIC.
>>>>    - Setting `aplic_info.hw_version` during its declaration.
>>>>    - Declaring an APLIC device.
>>>>
>>>> Since Microchip originally developed aplic.c [1], an internal discussion
>>>> with them led to the decision to use the MIT license instead of the default
>>>> GPL-2.0-only.
>>>>
>>>> [1]https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d
>>>>
>>>> Signed-off-by: Romain Caritey<Romain.Caritey@microchip.com>
>>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>> You recall that From: != 1st S-o-b is unusual, and wants some explanation.
>>> IOW it's unclear who the original author of this patch is.
>> I'm not 100% sure who should be the author. Such patch doesn't exist before but I took the changes
>> based on the changes mentioned in commit message as [1].
>>
>> If you think that the author should be Romain, I am okay with that.
> I can't sensibly form an opinion here. This needs settling between him and you.
>  From your reply I'm not even convinced his S-o-b is legitimately there then.
> You may want to use another, less standard tag in such a case (like the
> Co-developed-by: that I've seen in use here and there) to still give credit to
> him.

I'll have a conversation with Romain and then just re-send the patch.

>
>>>> --- /dev/null
>>>> +++ b/xen/arch/riscv/aplic.c
>>>> @@ -0,0 +1,49 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +
>>>> +/*
>>>> + * xen/arch/riscv/aplic.c
>>>> + *
>>>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>>>> + *
>>>> + * Copyright (c) 2023-2024 Microchip.
>>>> + * Copyright (c) 2024-2025 Vates
>>>> + */
>>>> +
>>>> +#include <xen/errno.h>
>>>> +#include <xen/init.h>
>>>> +#include <xen/types.h>
>>>> +
>>>> +#include <asm/device.h>
>>>> +#include <asm/intc.h>
>>>> +
>>>> +static struct intc_info aplic_info = {
>>>> +    .hw_version = INTC_APLIC
>>>> +};
>>> Is this going to be written to (much) post-init? IOW - __read_mostly or
>>> even __ro_after_init?
>> I think that __read_mostly would be better because intc_info structure in the future
>> will contain member "void *private". And in `private` it can be a data which can
>> be changed.
> You mean the pointer can change? Or merely what it points to, i.e. ...
>
>> For example, `private` can contain an aplic_priv structure:
>> struct aplic_priv {
>>       /* number of irqs */
>>       uint32_t   nr_irqs;
>>
>>       /* base physical address and size */
>>       paddr_t    paddr_start;
>>       paddr_t    paddr_end;
>>       uint64_t   size;
>>
>>       /* registers */
>>       struct aplic_regs   *regs;
>>
>>       /* imsic configuration */
>>       const struct imsic_config *imsic_cfg;
>> };
>>
>> and regs from aplic_priv structure can be changed in runtime.
> ... the contents of such a struct? In this latter case the struct instance
> here can still be __ro_after_init as long as the pointer is set from an
> __init function.

I meant that the data will be changed. The pointer will be initialized once
in the following way:
static struct intc_info aplic_info = {
     .hw_version = INTC_APLIC,
     .private = &aplic
};

I will update for both structures __ro_after_init() then.

Thanks for clarification.

~ Oleksii

--------------l7IhU0QX0DPtO1uAdi9JAc6z
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
    <div class="moz-cite-prefix">On 3/27/25 8:39 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b0af1e38-9c27-469e-8bc9-321d3c49dd2c@suse.com">
      <pre wrap="" class="moz-quote-pre">On 26.03.2025 17:49, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 3/26/25 4:19 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 25.03.2025 18:36, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Introduce preinitialization stuff for the RISC-V Advanced Platform-Level
Interrupt Controller (APLIC) in Xen:
  - Implementing the APLIC pre-initialization function (`aplic_preinit()`),
    ensuring that only one APLIC instance is supported in S mode.
  - Initialize APLIC's correspoinding DT node.
  - Declaring the DT device match table for APLIC.
  - Setting `aplic_info.hw_version` during its declaration.
  - Declaring an APLIC device.

Since Microchip originally developed aplic.c [1], an internal discussion
with them led to the decision to use the MIT license instead of the default
GPL-2.0-only.

[1]<a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d">https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d</a>

Signed-off-by: Romain Caritey<a class="moz-txt-link-rfc2396E" href="mailto:Romain.Caritey@microchip.com">&lt;Romain.Caritey@microchip.com&gt;</a>
Signed-off-by: Oleksii Kurochko<a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">You recall that From: != 1st S-o-b is unusual, and wants some explanation.
IOW it's unclear who the original author of this patch is.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I'm not 100% sure who should be the author. Such patch doesn't exist before but I took the changes
based on the changes mentioned in commit message as [1].

If you think that the author should be Romain, I am okay with that.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I can't sensibly form an opinion here. This needs settling between him and you.
From your reply I'm not even convinced his S-o-b is legitimately there then.
You may want to use another, less standard tag in such a case (like the
Co-developed-by: that I've seen in use here and there) to still give credit to
him.</pre>
    </blockquote>
    <pre>I'll have a conversation with Romain and then just re-send the patch.
</pre>
    <blockquote type="cite"
      cite="mid:b0af1e38-9c27-469e-8bc9-321d3c49dd2c@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">--- /dev/null
+++ b/xen/arch/riscv/aplic.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: MIT */
+
+/*
+ * xen/arch/riscv/aplic.c
+ *
+ * RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) 2023-2024 Microchip.
+ * Copyright (c) 2024-2025 Vates
+ */
+
+#include &lt;xen/errno.h&gt;
+#include &lt;xen/init.h&gt;
+#include &lt;xen/types.h&gt;
+
+#include &lt;asm/device.h&gt;
+#include &lt;asm/intc.h&gt;
+
+static struct intc_info aplic_info = {
+    .hw_version = INTC_APLIC
+};
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Is this going to be written to (much) post-init? IOW - __read_mostly or
even __ro_after_init?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
I think that __read_mostly would be better because intc_info structure in the future
will contain member "void *private". And in `private` it can be a data which can
be changed.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You mean the pointer can change? Or merely what it points to, i.e. ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">For example, `private` can contain an aplic_priv structure:
struct aplic_priv {
     /* number of irqs */
     uint32_t   nr_irqs;

     /* base physical address and size */
     paddr_t    paddr_start;
     paddr_t    paddr_end;
     uint64_t   size;

     /* registers */
     struct aplic_regs   *regs;

     /* imsic configuration */
     const struct imsic_config *imsic_cfg;
};

and regs from aplic_priv structure can be changed in runtime.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the contents of such a struct? In this latter case the struct instance
here can still be __ro_after_init as long as the pointer is set from an
__init function.</pre>
    </blockquote>
    <pre>I meant that the data will be changed. The pointer will be initialized once
in the following way:
static struct intc_info aplic_info = {
    .hw_version = INTC_APLIC,
    .private = &amp;aplic
};

I will update for both structures __ro_after_init() then.

Thanks for clarification.

~ Oleksii</pre>
  </body>
</html>

--------------l7IhU0QX0DPtO1uAdi9JAc6z--


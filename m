Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4608DA71C41
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 17:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928161.1330911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTwJ-00086X-ED; Wed, 26 Mar 2025 16:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928161.1330911; Wed, 26 Mar 2025 16:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txTwJ-00084M-B3; Wed, 26 Mar 2025 16:49:15 +0000
Received: by outflank-mailman (input) for mailman id 928161;
 Wed, 26 Mar 2025 16:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+Jq=WN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1txTwI-00084G-0A
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 16:49:14 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3edff558-0a62-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 17:49:12 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so53622a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 09:49:12 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ebccf68f3fsm9617474a12.7.2025.03.26.09.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 09:49:11 -0700 (PDT)
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
X-Inumbo-ID: 3edff558-0a62-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743007752; x=1743612552; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUxEysJocX7bC9IyLUJ5Z2yv6RoHGMcILEI42ADUp+I=;
        b=ft68BRjm7byzs0GPN4sqi9Ntn8dBpS/SMhutIJA7e3heuF/Yk50oxIaR8EvmHMmeIY
         +FZj14YPvP8IB8u4N2flrHcnGz1Qb2YCy6SA49OP+w72XR2F8jslbHeM1GnBOv8sXOul
         w8oLR3i3CzPRC2Yzcst9ZSCNEdUu1zxEN2enOji01lGgYPeHcqtR6Usk6JSK2FvVhH8l
         bNZc8Yp0nHZ9Wh5CUsbwn7lRs1svtP5TE7DI2aEJo8+m6iQb6GW3ovMBwrxNw+A2RI4t
         gLsRaR23AISYRXeyVzuldSqF+I1JNpt2m3kWlJ/JEYQBYt03pNipt5V+NycAmdW7tqQk
         DNwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007752; x=1743612552;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LUxEysJocX7bC9IyLUJ5Z2yv6RoHGMcILEI42ADUp+I=;
        b=OeacJIohkoDiZOY0qOR9QCWdeJJCTyd1Rkvb3ityVjQJnWOpfaizDEwrci8jidgmyD
         2F7vciHNIP/Nmv/wZ6xmTGIouq/mE0RfdTOy0PsXpeDQvqDGSgqg+vNUQCRHM29dys7E
         Xt0LmVY0GAt0cjXAcfWHaLxOxjHGaFcfVaeYJeCsYnXfYDLwKws6Su/oJuJq58a3ambJ
         v3u/PmnZqmTple3rR/JU4WIoEt33MeSl73hGNuQjQPkLqx7kfBnlEijZaTTgUbD5LYiw
         kt+MKX+wa6K6Iaw/5mZth/1MSxq4DXG9mNyEmvbJtyi0U0QFVykNlv+Nn9zzIfzcZLZB
         JQZA==
X-Forwarded-Encrypted: i=1; AJvYcCWXFY/xRXp0CabPCNy61YFMt3Y+8qWGVPRyexKjqw/9c+UJJ/Z5nxcUujo2DndUIHwV/LkuIP5RlSA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/5aEeqVARLbilhjD3S72FKCX5R0kLEvShUyNd6FDmdajIToBK
	LOBTCtlRRd0LqUb/2Oyx/3PjhrgoBqNXlLk/3BDDBexgk+HVJ7c0uzu0Vw==
X-Gm-Gg: ASbGncsaQv5Hfluz8qMppziXhZuqfLZ7HgeLx5gu/y02ZZ7dClUA1MLBUwQ2GWD84uQ
	u6IUNvPY6dEGizd8wpXKSgUEp6pkaXqFTv2vtjEO+jkh2BcVmRwmFvTE92BtSmLIE5zG4cVawcy
	UuETDmwaoLAcDYvCmInWd1tecspLhHtL92dgEq38V+WzFuxEKTH557QfJgMruXRaaHXgwAw9fZP
	vuYWZB/hSIpOjB51E4VWjHOVrKPXrzAksOscb46Wqtvir9BETcrDtg+xF2ZLSPNZ7Cc/rhkkuKI
	oc08y9Cb2qAJURSrAJs9FGsduB2FwdxTnN9TT4FB2x60xzrCobY1gGAov9ho5kSB4d7lY80xkIX
	ZwVCCr7zq0gRlL31cT/V+
X-Google-Smtp-Source: AGHT+IHstFr2ksVj3XvJae2znj+gmc5zBdmbsR2bvxIJCOzh1TY7SHjl0j/TTrUsXLIzWeFw7DGwUw==
X-Received: by 2002:a05:6402:5187:b0:5e8:c0a7:4244 with SMTP id 4fb4d7f45d1cf-5ed8e28ce26mr259646a12.9.1743007751664;
        Wed, 26 Mar 2025 09:49:11 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------KgO8pkE1PVinCeeWiVCG9sqG"
Message-ID: <242f04d2-50b6-4ce1-8710-6dae2f940b9e@gmail.com>
Date: Wed, 26 Mar 2025 17:49:10 +0100
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com>

This is a multi-part message in MIME format.
--------------KgO8pkE1PVinCeeWiVCG9sqG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/25 4:19 PM, Jan Beulich wrote:
> On 25.03.2025 18:36, Oleksii Kurochko wrote:
>> Introduce preinitialization stuff for the RISC-V Advanced Platform-Level
>> Interrupt Controller (APLIC) in Xen:
>>   - Implementing the APLIC pre-initialization function (`aplic_preinit()`),
>>     ensuring that only one APLIC instance is supported in S mode.
>>   - Initialize APLIC's correspoinding DT node.
>>   - Declaring the DT device match table for APLIC.
>>   - Setting `aplic_info.hw_version` during its declaration.
>>   - Declaring an APLIC device.
>>
>> Since Microchip originally developed aplic.c [1], an internal discussion
>> with them led to the decision to use the MIT license instead of the default
>> GPL-2.0-only.
>>
>> [1]https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d
>>
>> Signed-off-by: Romain Caritey<Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> You recall that From: != 1st S-o-b is unusual, and wants some explanation.
> IOW it's unclear who the original author of this patch is.

I'm not 100% sure who should be the author. Such patch doesn't exist before but I took the changes
based on the changes mentioned in commit message as [1].

If you think that the author should be Romain, I am okay with that.

>
>> --- /dev/null
>> +++ b/xen/arch/riscv/aplic.c
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: MIT */
>> +
>> +/*
>> + * xen/arch/riscv/aplic.c
>> + *
>> + * RISC-V Advanced Platform-Level Interrupt Controller support
>> + *
>> + * Copyright (c) 2023-2024 Microchip.
>> + * Copyright (c) 2024-2025 Vates
>> + */
>> +
>> +#include <xen/errno.h>
>> +#include <xen/init.h>
>> +#include <xen/types.h>
>> +
>> +#include <asm/device.h>
>> +#include <asm/intc.h>
>> +
>> +static struct intc_info aplic_info = {
>> +    .hw_version = INTC_APLIC
>> +};
> Is this going to be written to (much) post-init? IOW - __read_mostly or
> even __ro_after_init?

I think that __read_mostly would be better because intc_info structure in the future
will contain member "void *private". And in `private` it can be a data which can
be changed. For example, `private` can contain an aplic_priv structure:
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

>
> With authorship clarified and this variable adjusted according to whatever
> the longer term use of it is
> Acked-by: Jan Beulich<jbeulich@suse.com>

Thanks.

~ Oleksii

--------------KgO8pkE1PVinCeeWiVCG9sqG
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
    <div class="moz-cite-prefix">On 3/26/25 4:19 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com">
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

[1] <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d">https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d</a>

Signed-off-by: Romain Caritey <a class="moz-txt-link-rfc2396E" href="mailto:Romain.Caritey@microchip.com">&lt;Romain.Caritey@microchip.com&gt;</a>
Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You recall that From: != 1st S-o-b is unusual, and wants some explanation.
IOW it's unclear who the original author of this patch is.</pre>
    </blockquote>
    <pre>I'm not 100% sure who should be the author. Such patch doesn't exist before but I took the changes
based on the changes mentioned in commit message as [1].

If you think that the author should be Romain, I am okay with that.
</pre>
    <blockquote type="cite"
      cite="mid:e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
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
      <pre wrap="" class="moz-quote-pre">
Is this going to be written to (much) post-init? IOW - __read_mostly or
even __ro_after_init?</pre>
    </blockquote>
    <pre>I think that __read_mostly would be better because intc_info structure in the future
will contain member "void *private". And in `private` it can be a data which can
be changed. For example, `private` can contain an aplic_priv structure:
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
    <blockquote type="cite"
      cite="mid:e9fddc7d-feb3-4fd0-830f-de4b7ef17bba@suse.com">
      <pre wrap="" class="moz-quote-pre">

With authorship clarified and this variable adjusted according to whatever
the longer term use of it is
Acked-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a></pre>
    </blockquote>
    <pre>Thanks.</pre>
    <pre>~ Oleksii
</pre>
  </body>
</html>

--------------KgO8pkE1PVinCeeWiVCG9sqG--


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBAEA9368D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 13:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958944.1351493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jww-0007B5-Of; Fri, 18 Apr 2025 11:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958944.1351493; Fri, 18 Apr 2025 11:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jww-00077v-Kc; Fri, 18 Apr 2025 11:32:02 +0000
Received: by outflank-mailman (input) for mailman id 958944;
 Fri, 18 Apr 2025 11:32:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h7fJ=XE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5jwu-00077m-P5
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 11:32:00 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd461357-1c48-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 13:31:58 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5e61d91a087so2752466a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 04:31:58 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec913cfsm108560166b.80.2025.04.18.04.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Apr 2025 04:31:57 -0700 (PDT)
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
X-Inumbo-ID: bd461357-1c48-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744975918; x=1745580718; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJrFDW1uQXDUTPMV0PWRonteObr+Tui2beKJMNiw11k=;
        b=KbSl5XQ1Ee2OaBbFZ6w92K0Fi6TmbW+rwTgItaNw+lAih5dK9Dg27t9p2zy8g3di6Q
         CqnMLGak19tnWbjWPXaYVBEl9xzn2no3vdKTFFbQm7oD/VY21aaljRjwu42Yv2o0oLmv
         ZkFa2bnojT1epf6L8T+siXnAcVFkvD5X0/uNdf2TgwUreCexqdXzzD2oKftExFue8Rz2
         3DaVWleCFLiddmfutqe/dv/KU/AlU9B2Bbj+ZrPdgleXLar0ek6i0yjmp5Jy3c6FJI/d
         aWuLzP5ycgYISJ+4OVQwRwLA6Kynx1bbMfJSqtSRUDesxktK5Z3QizKqkvRtemsbaBf2
         fMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975918; x=1745580718;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJrFDW1uQXDUTPMV0PWRonteObr+Tui2beKJMNiw11k=;
        b=cKe61zpUe17Z/G1wEHjmN6fJse8RUS+5eMFjpszKMDm54VbpdUv4tmkAuhif6KPUcD
         EEnOG/93ip+SJ3aJk02sPx+6GiF8zNlLgXh1pfy4ZKsJKOa2Sua8Rd2i2kgcgnLwH2ZU
         nfonNA5ZGc4tNldofTw88Pn+yrk9erhT4XqMDj6Qw3ycM/GfVKWqCOaHE8AZfd3YvC4u
         M3NJxXW7hctcndze1gwBLYO/0f7vcNAz3VUD81pTu4UfJh6Nv88sM1SYEmGLFezpZdF5
         R8Om7Kluf8uhtjfSrDe2SIfgF4FBJHD4ReinM8yai4FxHXgXxtoO9zNb9b/L0JGaIgva
         7SFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw9QO3cXEgRoh7CkoIObI036DdPn0xgNasdqI8TxWZQkvZB405mIGCDOZPJSguRK16NHug4QhC5AE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+q0By2oSe3Fdrs4rMmLL/cOsU70JFbXmgjJgA7mwiGQkFyX70
	YxfiI/MZfJnEFGlRPDJEI20AlwKL11IE35MAk1txbscJciXBcOKh
X-Gm-Gg: ASbGncvLnYVekRqlZ5XrHMAZCmbDNVfJMmTb4vvScAIW4Y+polydwTtAhbZimqx4iYC
	F7T3b8imacHUjmfWkP8m91wl0T1dHrya/RQn0xBV8IWHkd7ZOVVZSBWOArQrkKHNDqcLUrV3eyf
	ZKdVaoYU1L9MQxVIkT89AnGUi0TBlruxvq8zZNEdUeg69yEMgj3yDWMEfrhvtawm3sQZ8awReRt
	L5ImNPPuP1GonOEYsxb4No0GKRj6u1OP4EbYNDjyH7oYna9sJoyiheRrNOg+MTnTjKEkaYvy8Ur
	gsMgRVpmuPLT8dBdloyuOhyGshfMHI/vtSceA+WdvzsI9lxrQUUBeCZ6y+qXmRrQ0nPBigMmWOj
	m5J1FZuS3klYchsig
X-Google-Smtp-Source: AGHT+IEDC6jPYwbdtZuxrguspVbkY2/sFF7Z2KOHQLrkHkqaXMq2VhPVNm4VQVKNQ92rlOP4J6wcow==
X-Received: by 2002:a17:906:dc89:b0:aca:c7c5:f935 with SMTP id a640c23a62f3a-acb74ea8f76mr157622166b.61.1744975917919;
        Fri, 18 Apr 2025 04:31:57 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------FPk9gRSiKMP70wNvdX0HCAms"
Message-ID: <5d211530-fe1b-4f83-a8a9-cf41603e4fd3@gmail.com>
Date: Fri, 18 Apr 2025 13:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/14] xen/riscv: aplic_init() implementation
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
 <1d023045be49ae93d41d552f9c9a79972fa4e84b.1744126720.git.oleksii.kurochko@gmail.com>
 <a7008eee-04d2-4e61-b66a-ff659e3b99db@suse.com>
 <a54ef262-92fc-453d-898e-70636c2918fd@gmail.com>
 <f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com>
 <fd24bee3-bbbd-4701-a34c-08b64ea0af5a@gmail.com>
 <2795e63a-fc37-4ab9-8348-ab2f609f1734@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2795e63a-fc37-4ab9-8348-ab2f609f1734@suse.com>

This is a multi-part message in MIME format.
--------------FPk9gRSiKMP70wNvdX0HCAms
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/17/25 5:30 PM, Jan Beulich wrote:
> On 17.04.2025 17:21, Oleksii Kurochko wrote:
>> On 4/16/25 12:30 PM, Jan Beulich wrote:
>>> On 16.04.2025 12:15, Oleksii Kurochko wrote:
>>>> On 4/14/25 12:04 PM, Jan Beulich wrote:
>>>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>>>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>>>>>> +    if ( !rc )
>>>>>> +        panic("%s: IDC mode not supported\n", node->full_name);
>>>>>> +
>>>>>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>>>>>> +    if ( !imsic_node )
>>>>>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>>>>>> +
>>>>>> +    /* check imsic mode */
>>>>>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>>>>>> +                                    irq_range, ARRAY_SIZE(irq_range));
>>>>>> +    if ( rc && (rc != -EOVERFLOW) )
>>>>>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>>>>>> +               node->full_name, imsic_node->full_name);
>>>>> Why exactly is EOVERFLOW tolerable here?
>>>> QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
>>>> For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
>>>> interested in the S-mode IMSIC node.
>>>>
>>>> The IMSIC node includes this information in the|"interrupts-extended"| property,
>>>> which has the following format:
>>>>      interrupt-extended = {<interrupt-controller-phandle>, <machine_mode>},...
>>>> The number of such|<phandle, mode>| pairs depends on the number of CPUs the platform has.
>>>>
>>>> For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:
>>>>
>>>>      if ( irq_range[1] == IRQ_M_EXT )
>>>>
>>>> Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
>>>> has more then one CPU as we passed irq_range[2] as an argument but the amount of values
>>>> in "interrupts-extended" property will be (2 * CPUS_NUM).
>>>>
>>>> I can update the comment above dt_property_read_u32_array() for more clearness.
>>> Yet my question remains: Why would it be okay to ignore the remaining entries,
>>> and hence accept -EOVERFLOW as kind-of-success?
>> Because for other entries the IMSIC mode will be the same and the difference will be only in
>> interrupt controller's phandle
> And we can blindly take this for granted? Would you mind extending the
> comment that's there to include this aspect?

I tried to compile dtc with different modes in interrupt-extends and compilation doesn't failed, so
it's not really granted.
Just to be sure, I'll check all items of interrupts-extend not just the first one.

~ Oleksii

>> which we don't care about in this function and cares only about
>> in imisic_init(), look at usage of imsic_get_parent_hartid().
--------------FPk9gRSiKMP70wNvdX0HCAms
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
    <div class="moz-cite-prefix">On 4/17/25 5:30 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2795e63a-fc37-4ab9-8348-ab2f609f1734@suse.com">
      <pre wrap="" class="moz-quote-pre">On 17.04.2025 17:21, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 4/16/25 12:30 PM, Jan Beulich wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 16.04.2025 12:15, Oleksii Kurochko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On 4/14/25 12:04 PM, Jan Beulich wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On 08.04.2025 17:57, Oleksii Kurochko wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">+    rc = dt_property_read_u32(node, "msi-parent", &amp;imsic_phandle);
+    if ( !rc )
+        panic("%s: IDC mode not supported\n", node-&gt;full_name);
+
+    imsic_node = dt_find_node_by_phandle(imsic_phandle);
+    if ( !imsic_node )
+        panic("%s: unable to find IMSIC node\n", node-&gt;full_name);
+
+    /* check imsic mode */
+    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
+                                    irq_range, ARRAY_SIZE(irq_range));
+    if ( rc &amp;&amp; (rc != -EOVERFLOW) )
+        panic("%s: unable to find interrupt-extended in %s node\n",
+               node-&gt;full_name, imsic_node-&gt;full_name);
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Why exactly is EOVERFLOW tolerable here?
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
interested in the S-mode IMSIC node.

The IMSIC node includes this information in the|"interrupts-extended"| property,
which has the following format:
    interrupt-extended = {&lt;interrupt-controller-phandle&gt;, &lt;machine_mode&gt;},...
The number of such|&lt;phandle, mode&gt;| pairs depends on the number of CPUs the platform has.

For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:

    if ( irq_range[1] == IRQ_M_EXT )

Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
has more then one CPU as we passed irq_range[2] as an argument but the amount of values
in "interrupts-extended" property will be (2 * CPUS_NUM).

I can update the comment above dt_property_read_u32_array() for more clearness.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Yet my question remains: Why would it be okay to ignore the remaining entries,
and hence accept -EOVERFLOW as kind-of-success?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Because for other entries the IMSIC mode will be the same and the difference will be only in
interrupt controller's phandle
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
And we can blindly take this for granted? Would you mind extending the
comment that's there to include this aspect?</pre>
    </blockquote>
    <pre>I tried to compile dtc with different modes in interrupt-extends and compilation doesn't failed, so
it's not really granted.
Just to be sure, I'll check all items of interrupts-extend not just the first one.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:2795e63a-fc37-4ab9-8348-ab2f609f1734@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">which we don't care about in this function and cares only about
in imisic_init(), look at usage of imsic_get_parent_hartid().
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------FPk9gRSiKMP70wNvdX0HCAms--


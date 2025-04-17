Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C6A9214E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958033.1351005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R3g-0006NQ-Fy; Thu, 17 Apr 2025 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958033.1351005; Thu, 17 Apr 2025 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5R3g-0006KI-Cf; Thu, 17 Apr 2025 15:21:44 +0000
Received: by outflank-mailman (input) for mailman id 958033;
 Thu, 17 Apr 2025 15:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uBz4=XD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u5R3e-0006Hx-6e
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:21:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8801726-1b9f-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 17:21:39 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5f4d0da2d2cso1839919a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:21:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f36f06c4fcsm10332272a12.47.2025.04.17.08.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:21:37 -0700 (PDT)
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
X-Inumbo-ID: a8801726-1b9f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744903298; x=1745508098; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDAWnaEDb1sPmHehzsSnkJ66i5CUDsvUp3PSnMsGBtU=;
        b=ClzCGja9OyGodXZ+7xBZIdPN1ApoZQ7TClswGHBuNBKzOQ955lva2t+Yp/PNoVOu78
         5AVHmnzTZr0n9OM/g2vSGpgu2YD6i4LO9mQ88oWf70jIaQaEmAZIRDnAxyIfDvSBwNBe
         3e/LA1gIgJSqxXCYWGrDiM2IdD8slRRNlOYv+eVTnBR6IUFVF0KRLqyYQkBIr6vbhiUW
         3KPdiDjIJsXq3XGy/BgejiBphWcxQ/1MBf4dmfXKBAd4JjWfCVx3Gwo62rVguJ0vIdyj
         pbbaDabgjx3H5p/wbnbjUW5UaPu4TO7g0MDPOrPVgdpxLvslHmWizR9GOP7Za6ppH85y
         8Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744903298; x=1745508098;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cDAWnaEDb1sPmHehzsSnkJ66i5CUDsvUp3PSnMsGBtU=;
        b=QbCwY7XHsfELDalDqTBbioNDE/jnnHWy6CsEdDapV2Uq/NmsbMOWb7X8K+Eh3HzwTf
         KEgsi4ep3PfmYfUWR6GEsvyC2scEMfxxq1sELaPsRbVXmIe606j3x1oDfNUz7HQgoR6+
         P26IdRM4xGSnsIC37r2vvLbR8AMoWaV/eDexZ56jZabweTk3Tn1oE6G4gRo0Ofqpf54b
         Hdhc/0AHR2jdGuPco0CljXptMorPT53deKYvMBq+cKsI8VktYu5soAmwiu/22D7Ttn4U
         MgfsgYF9dkoz2Rj3C0Ay5P5B4lONoRbnhKLpuAKDvjMf35js/RoFL02zAJiljmcUMqAo
         oeyg==
X-Forwarded-Encrypted: i=1; AJvYcCV103X4a4zvVO56d9GmkszByA0P/EUz5kZL6LQWF6Q8SMsR4qc4uGtqEh9RsROAnqDW2YDO/7AR4NI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxgIrzYBMyzc9/e4Tn8v9QbF+9yUKuv5w5gkVVigUwlIRdG/3w
	GoDoU35tineyHjkc9Ra2LkewgMveatD1d7gqnEmxJC/lZtWX05dg
X-Gm-Gg: ASbGnctX31S7H7ELyvlcoLbkV4Ov2aX/vdKhrwOELGwonfShl0BVeiSAHibfnF6anaW
	SDAuZ/CkUxRg+5HEFv83I808SGzwwCjS9N+PR9ZVjYapEcxbFD+NUA5XXj06aNCLKCl4kVR39Bu
	kO/FlJKRzY3joyrp3UnAwty7PSyzUy7iqO+krAbp51dxpFSdgx41G4lWN6OIu0lFoVGoycviRmq
	d8eHPLNwntbyABAQ3xZVaCbpXb8biskzsd72HuImQoB2646P2HGty5+W2gqtZ8gJZxR881pkLXI
	NyTu/VycIxseaBn49aPvrqN2cRZVCdhkNy1vQrZwURB0r0/CTvNk1wxtyCPYDyJEwe8gC6y7uIy
	kD0strggd7CxzxJjF
X-Google-Smtp-Source: AGHT+IHrA8QI5e34qR1WzyVvkmHJuSMtH3r5Ssd2wGh2Fdkc880AtWsmouYv5Q+Qm8f/watmWPCK8Q==
X-Received: by 2002:a05:6402:2807:b0:5e5:bfab:524 with SMTP id 4fb4d7f45d1cf-5f4b7344956mr6345175a12.3.1744903298290;
        Thu, 17 Apr 2025 08:21:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LuKeqvjzdwFuE6CNzf9vZr0o"
Message-ID: <fd24bee3-bbbd-4701-a34c-08b64ea0af5a@gmail.com>
Date: Thu, 17 Apr 2025 17:21:37 +0200
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
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com>

This is a multi-part message in MIME format.
--------------LuKeqvjzdwFuE6CNzf9vZr0o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/16/25 12:30 PM, Jan Beulich wrote:
> On 16.04.2025 12:15, Oleksii Kurochko wrote:
>> On 4/14/25 12:04 PM, Jan Beulich wrote:
>>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>>> +    rc = dt_property_read_u32(node, "msi-parent", &imsic_phandle);
>>>> +    if ( !rc )
>>>> +        panic("%s: IDC mode not supported\n", node->full_name);
>>>> +
>>>> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
>>>> +    if ( !imsic_node )
>>>> +        panic("%s: unable to find IMSIC node\n", node->full_name);
>>>> +
>>>> +    /* check imsic mode */
>>>> +    rc = dt_property_read_u32_array(imsic_node, "interrupts-extended",
>>>> +                                    irq_range, ARRAY_SIZE(irq_range));
>>>> +    if ( rc && (rc != -EOVERFLOW) )
>>>> +        panic("%s: unable to find interrupt-extended in %s node\n",
>>>> +               node->full_name, imsic_node->full_name);
>>> Why exactly is EOVERFLOW tolerable here?
>> QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
>> For the hypervisor, we don’t really care about the M-mode IMSIC node — we're only
>> interested in the S-mode IMSIC node.
>>
>> The IMSIC node includes this information in the|"interrupts-extended"| property,
>> which has the following format:
>>     interrupt-extended = {<interrupt-controller-phandle>, <machine_mode>},...
>> The number of such|<phandle, mode>| pairs depends on the number of CPUs the platform has.
>>
>> For our purposes, to determine whether the IMSIC node corresponds to M-mode or not, it’s sufficient to read only the first pair and check the mode like this:
>>
>>     if ( irq_range[1] == IRQ_M_EXT )
>>
>> Thereby dt_property_read_u32_array() will return -EOVERFLOW in the case when a platfrom
>> has more then one CPU as we passed irq_range[2] as an argument but the amount of values
>> in "interrupts-extended" property will be (2 * CPUS_NUM).
>>
>> I can update the comment above dt_property_read_u32_array() for more clearness.
> Yet my question remains: Why would it be okay to ignore the remaining entries,
> and hence accept -EOVERFLOW as kind-of-success?

Because for other entries the IMSIC mode will be the same and the difference will be only in
interrupt controller's phandle which we don't care about in this function and cares only about
in imisic_init(), look at usage of imsic_get_parent_hartid().

>
>>>> +    aplic.regs = ioremap(paddr, size);
>>>> +    if ( !aplic.regs )
>>>> +        panic("%s: unable to map\n", node->full_name);
>>>> +
>>>> +    /* Setup initial state APLIC interrupts */
>>>> +    aplic_init_hw_interrupts();
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static const struct intc_hw_operations __ro_after_init aplic_ops = {
>>> const or __ro_after_init?
>> What’s wrong with using both?|const| ensures the variable can't be changed at compile time,
>> while|__ro_after_init| makes it read-only at runtime after initialization is complete.
> No, const makes it read-only at compile- and run-time.__ro_after_init,
> putting the item into a special section, makes it writable at init-time.
> Due to the const, the compiler wouldn't emit any writes. But we can
> also avoid stray writes by having the item live in .rodata.

Oh, right, `const` will add the variable to .rodata.
Then I think it is enough to have `const` as aplic_ops is going to be initialized once and
then only read will happen.

>
>> Probably,|__initconst| would be a better fit:
>>     static const struct intc_hw_operations __initconst aplic_ops = {
>>
>> Or even|__initconstrel|, since the|struct intc_hw_operations| contains pointers.
> Well, if this variable isn't accessed post-init, sure. That seems pretty
> unlikely though, considering it contains pointers to hook functions.

Sure, .init section is going to be freed after init-time.

~ Oleksii


--------------LuKeqvjzdwFuE6CNzf9vZr0o
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
    <div class="moz-cite-prefix">On 4/16/25 12:30 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com">
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
        <pre wrap="" class="moz-quote-pre">
QEMU generates two IMSIC device tree nodes: one for M-mode and one for S-mode.
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
      <pre wrap="" class="moz-quote-pre">
Yet my question remains: Why would it be okay to ignore the remaining entries,
and hence accept -EOVERFLOW as kind-of-success?</pre>
    </blockquote>
    <pre>Because for other entries the IMSIC mode will be the same and the difference will be only in
interrupt controller's phandle which we don't care about in this function and cares only about
in imisic_init(), look at usage of imsic_get_parent_hartid().

</pre>
    <blockquote type="cite"
      cite="mid:f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">+    aplic.regs = ioremap(paddr, size);
+    if ( !aplic.regs )
+        panic("%s: unable to map\n", node-&gt;full_name);
+
+    /* Setup initial state APLIC interrupts */
+    aplic_init_hw_interrupts();
+
+    return 0;
+}
+
+static const struct intc_hw_operations __ro_after_init aplic_ops = {
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">const or __ro_after_init?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
What’s wrong with using both?|const| ensures the variable can't be changed at compile time,
while|__ro_after_init| makes it read-only at runtime after initialization is complete.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
No, const makes it read-only at compile- and run-time.__ro_after_init,
putting the item into a special section, makes it writable at init-time.
Due to the const, the compiler wouldn't emit any writes. But we can
also avoid stray writes by having the item live in .rodata.</pre>
    </blockquote>
    <pre>Oh, right, `const` will add the variable to .rodata.
Then I think it is enough to have `const` as aplic_ops is going to be initialized once and
then only read will happen.

</pre>
    <blockquote type="cite"
      cite="mid:f2da2ec5-e457-4d2c-b2fe-49c7356760e1@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Probably,|__initconst| would be a better fit:
   static const struct intc_hw_operations __initconst aplic_ops = {

Or even|__initconstrel|, since the|struct intc_hw_operations| contains pointers.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Well, if this variable isn't accessed post-init, sure. That seems pretty
unlikely though, considering it contains pointers to hook functions.</pre>
    </blockquote>
    <pre>Sure, .init section is going to be freed after init-time.

~ Oleksii</pre>
    <br>
  </body>
</html>

--------------LuKeqvjzdwFuE6CNzf9vZr0o--


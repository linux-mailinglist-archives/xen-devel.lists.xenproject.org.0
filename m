Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC34ABA08E
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 18:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987310.1372672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFxWU-0005uI-PS; Fri, 16 May 2025 16:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987310.1372672; Fri, 16 May 2025 16:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFxWU-0005sh-M5; Fri, 16 May 2025 16:02:58 +0000
Received: by outflank-mailman (input) for mailman id 987310;
 Fri, 16 May 2025 16:02:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n8HW=YA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uFxWT-0005sb-6m
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 16:02:57 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3abaa500-326f-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 18:02:55 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ad53cd163d9so115465166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 09:02:55 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06eab7sm179338866b.58.2025.05.16.09.02.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 09:02:53 -0700 (PDT)
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
X-Inumbo-ID: 3abaa500-326f-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747411375; x=1748016175; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUienFC1r/f0w7zuWvbx5XKWZ6H0hs1mvolVLxJVeAQ=;
        b=NPQhqou31oN2FBLVi+S+oYmgn/CArgxKOzPpqV4Agmevu0lIlez2jvArfhcmHb/PzJ
         Zzvjf1SdqeVNVQjoaKNvFSYx4nqWKWgMbjCRAGhKYg9evyk9LmB/O5yg8pI2C3BaCmWF
         25AGsQkBsVP1WLxjcmapjRXT64Y981LYG75B25qYJlRMpnxIP8E0I1cosjAC2hQNHED+
         gNwkgwWjWCubpGobTd4vH/UvzXdWtpqGnSkH9UvYDyUvNuA+nKf1yOBtN5+dqg2VBzDr
         AwzVD3AiUYTRu+mT3tPMdNwQiHBNrrYRcDg7O7fFvWb75nUzH/pRtHy6woxIR1jOGv5T
         GQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747411375; x=1748016175;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUienFC1r/f0w7zuWvbx5XKWZ6H0hs1mvolVLxJVeAQ=;
        b=ByzmwgUStP0GTcOQFu3BMFx48ajcv/yNGvRsiChduPLofbqTvyXFdp75dBdxrvmzyM
         t3Na11Wsp6q4VOcAGCBFpRsFAV7pOOKSieOWo/g8lXTCLJVTPLY9A/cKgV8d+uSdEp1P
         QtDLLxl0R9/WnhW5g69F1WqDLpvSm+uGR6a9E5plmxq19AdKOwmnQs4TfKK0HEDBSLtY
         9F0vhNix+ohdVdepsmJ+WWWzG56gc98iSMLJqyOiulJDryatwDYaDLFP2CSqbcOvl0cv
         GIw9mIDNgNs+OQ829/qGw0X7SFE4mP2abi/4VdVwlOjOvCSZuK0qq9qLInfQdWGUZyDj
         6K5g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4ljvbnYAjj5hOEbzooBY3Dl8zTuIk/NWoyzifDTFMSWbbE3I2GCnW9JLL3v35fAuHno31x6zjys=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQKQKnMyk/b6uzYC7NuPp46kOQXVW8KWj/nOLpW0GM7QoT51rv
	QIPDW2uBZ0Nuz56zPPFzwl9bh4K2LncA+e+CCHXuKRmeVh2B7keFN4R9
X-Gm-Gg: ASbGnctWQrc+fMETX9bDq/xtgksvss5A3iLCKp5iAWqAj17i3/aDvlYupftIpGuiUpR
	n4g1GwN55Xnl0lGnbz0+EeluRBgOo0o35jYc0j6GzXoN77NMHrebsZxjltETpcWnvwtzdDfv+Aa
	sAn/U/cxl84nTkMb5swR93H1HXO7Q5TpMTpNcT5xh8Nc12Pgx7Xy6fov1y1LmlPv+51GVK45yu9
	r6JzBNsvfBs827Ti2SYhHG/wV4jDPfK5OkL3Qr33KZtV455bdBEjGzwL8ujyB4jZ2E1j+QCCdb5
	RGprxpZJ+tErkhCAM3D/zgrrwLYUsoNSfgqUSOdplJgAYcyYLBPCPZkVTjctEOMk5REty8Rf8q9
	58ksPoQq/DNyI5h82DU2iba1p
X-Google-Smtp-Source: AGHT+IE31Ett3nQY3Zb7F7GgMnYvREyt0TDVjv8zPe1VFs8CW5BVxlhA8uoru0RhM2HlgjvSSU2fFQ==
X-Received: by 2002:a17:907:7f20:b0:ad2:1f65:8569 with SMTP id a640c23a62f3a-ad52d4cac82mr385029766b.28.1747411374346;
        Fri, 16 May 2025 09:02:54 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------s5zO9QC0mthSFHmFvQACGQQ9"
Message-ID: <125e918d-7c0f-43dd-8ab9-c0e0bcbf640e@gmail.com>
Date: Fri, 16 May 2025 18:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] xen/riscv: dt_processor_cpuid() implementation
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <4e4b3a018e8dacbe85cc080d9209e2ba3cdf4330.1746530883.git.oleksii.kurochko@gmail.com>
 <df77a5c5-de45-4432-a86f-d120e9417d86@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <df77a5c5-de45-4432-a86f-d120e9417d86@suse.com>

This is a multi-part message in MIME format.
--------------s5zO9QC0mthSFHmFvQACGQQ9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/25 9:56 AM, Jan Beulich wrote:
> (adding Bertrand as the one further DT maintainer, for a respective question
> below)
>
> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>> Implements dt_processor_hartid()
> There's no such function (anymore).
>
>> to get the hart ID of the given
>> device tree node and do some checks if CPU is available and given device
>> tree node has proper riscv,isa property.
>>
>> As a helper function dt_get_cpuid() is introduced to deal specifically
>> with reg propery of a CPU device node.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> Changes in V2:
>>   - s/of_get_cpu_hwid()/dt_get_cpu_id().
>>   - Update prototype of dt_get_cpu_hwid(), use pointer-to-const for cpun arg.
>>   - Add empty line before last return in dt_get_cpu_hwid().
>>   - s/riscv_of_processor_hartid/dt_processor_cpuid().
>>   - Use pointer-to_const for node argument of dt_processor_cpuid().
>>   - Use for hart_id unsigned long type as according to the spec for RV128
>>     mhartid register will be 128 bit long.
>>   - Update commit message and subject.
>>   - use 'CPU' instead of 'HART'.
> Was this is good move? What is returned ...
>
>> --- a/xen/arch/riscv/include/asm/smp.h
>> +++ b/xen/arch/riscv/include/asm/smp.h
>> @@ -26,6 +26,9 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
>>   
>>   void setup_tp(unsigned int cpuid);
>>   
>> +struct dt_device_node;
>> +int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid);
> ... here isn't a number in Xen's CPU numbering space. From earlier discussions I'm
> not sure it's a hart ID either, so it may need further clarification (and I'd
> expect RISC-V to have suitable terminology to tell apart the different entities).

 From device tree point of view (https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt)
it is just hart which is defined as a hardware execution context, which contains all the state mandated by
the RISC-V ISA: a PC and some registers.
And also based on this for DT binding:
   For example, my Intel laptop is
   described as having one socket with two cores, each of which has two hyper
   threads.  Therefore this system has four harts.
They are using just harts and in DT it will look like 4 node with a number in reg property which they
call hart. So from DT point of view hartid is pretty fine to use.

 From specification point of view (https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_hardware_platform_terminology):
   A RISC-V hardware platform can contain one or more RISC-V-compatible processing cores together
   with other non-RISC-V-compatible cores, fixed-function accelerators, various physical memory
   structures, I/O devices, and an interconnect structure to allow the components to communicate.

   A component is termed a core if it contains an independent instruction fetch unit. A RISC-V-
   compatible core might support multiple RISC-V-compatible hardware threads, or harts, through
   multithreading.
and (https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_software_execution_environments_and_harts):
   From the perspective of software running in a given execution environment, a hart is a resource that
   autonomously fetches and executes RISC-V instructions within that execution environment. In this
   respect, a hart behaves like a hardware thread resource even if time-multiplexed onto real hardware by
   the execution environment. Some EEIs support the creation and destruction of additional harts, for
   example, via environment calls to fork new harts.

DT's CPU node should be refer to core plus hardware thread (or threads in case of multithreading)
in reg property to be close to the spec(?) but basically in DT they IMO just describe what in the sepc
is called an independent instruction fetch unit.

I still think that it is fine just to use hart_id. If to be close more to a spec the unit_id(?)
but it is more confusing IMO with what is use in RISC-V's DT binding.

>
>> @@ -10,3 +13,66 @@ void __init smp_prepare_boot_cpu(void)
>>       cpumask_set_cpu(0, &cpu_possible_map);
>>       cpumask_set_cpu(0, &cpu_online_map);
>>   }
>> +
>> +/**
>> + * dt_get_cpuid - Get the cpuid from a CPU device node
>> + *
>> + * @cpun: CPU number(logical index) for which device node is required
>> + *
>> + * Return: The cpuid for the CPU node or ~0ULL if not found.
>> + */
>> +static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
>> +{
>> +    const __be32 *cell;
>> +    int ac;
> This is bogus (should be unsigned int afaict), but dictated by ...
>
>> +    uint32_t len;
>> +
>> +    ac = dt_n_addr_cells(cpun);
> ... the return value here and ...
>
>> +    cell = dt_get_property(cpun, "reg", &len);
>> +    if ( !cell || !ac || ((sizeof(*cell) * ac) > len) )
>> +        return ~0ULL;
> (Nit: This doesn't match the return type of the function; same for
> the function comment. Also, what if sizeof(*cell) * ac < len?)
>
>> +    return dt_read_number(cell, ac);
> ... the function parameter type here.

I think that we can declare ac as unsigned int even dt_n_addr_cells
return int as basically it returns be32_to_cpu(*ip) which return unsigned
int and it isn't expected to be a big value so overflow of INT_MAX shouldn't
happen and it won't affect a size argument of dt_read_number().

> In fact, that function is raising
> another question: If the "size" argument is outside of [0, 2], the value
> returned is silently truncated.

Usually address-cells is 1 or 2, so it isn't expected to be higher (but DT tells
that the value is u32 so it could be higher then 2). And I think it could be also
explained by bitness of an architecture.
I think I see address-cells equal to 3 for something connected to PCI, but
probably another one functions should be used to read.

>
> More generally - are there any plans to make DT code signed-ness-correct?
>
>> +/*
>> + * Returns the cpuid of the given device tree node, or -ENODEV if the node
>> + * isn't an enabled and valid RISC-V hart node.
>> + */
>> +int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
>> +{
>> +    const char *isa;
>> +
>> +    if ( !dt_device_is_compatible(node, "riscv") )
>> +    {
>> +        printk("Found incompatible CPU\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    *cpuid = dt_get_cpuid(node);
>> +    if ( *cpuid == ~0UL )
>> +    {
>> +        printk("Found CPU without CPU ID\n");
>> +        return -ENODEV;
>> +    }
>> +
>> +    if ( !dt_device_is_available(node))
>> +    {
>> +        printk("CPU with cpuid=%lu is not available\n", *cpuid);
>> +        return -ENODEV;
>> +    }
>> +
>> +    if ( dt_property_read_string(node, "riscv,isa", &isa) )
>> +    {
>> +        printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
>> +        return -ENODEV;
>> +    }
>> +
>> +    if ( isa[0] != 'r' || isa[1] != 'v' )
>> +    {
>> +        printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
>> +        return -ENODEV;
>> +    }
>> +
>> +    return 0;
>> +}
> I view it as unhelpful that all errors result in -ENODEV. Yes, there are log
> messages for all of the cases, but surely there are errno values better
> representing the individual failure reasons?

I will update that to:

@@ -46,6 +46,7 @@ static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
  int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
  {
      const char *isa;
+    int ret;
  
      if ( !dt_device_is_compatible(node, "riscv") )
      {
@@ -57,7 +58,7 @@ int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
      if ( *cpuid == ~0UL )
      {
          printk("Found CPU without CPU ID\n");
-        return -ENODEV;
+        return -EINVAL;
      }
  
      if ( !dt_device_is_available(node))
@@ -66,16 +67,16 @@ int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
          return -ENODEV;
      }
  
-    if ( dt_property_read_string(node, "riscv,isa", &isa) )
+    if ( (ret = dt_property_read_string(node, "riscv,isa", &isa)) )
      {
          printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
-        return -ENODEV;
+        return ret;
      }
  
      if ( isa[0] != 'r' || isa[1] != 'v' )
      {
          printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
-        return -ENODEV;
+        return -EINVAL;
      }
  
      return 0;

I think it's better now.

Thanks.

~ Oleksii

--------------s5zO9QC0mthSFHmFvQACGQQ9
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
    <div class="moz-cite-prefix">On 5/15/25 9:56 AM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:df77a5c5-de45-4432-a86f-d120e9417d86@suse.com">
      <pre wrap="" class="moz-quote-pre">(adding Bertrand as the one further DT maintainer, for a respective question
below)

On 06.05.2025 18:51, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Implements dt_processor_hartid()
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
There's no such function (anymore).

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">to get the hart ID of the given
device tree node and do some checks if CPU is available and given device
tree node has proper riscv,isa property.

As a helper function dt_get_cpuid() is introduced to deal specifically
with reg propery of a CPU device node.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
Changes in V2:
 - s/of_get_cpu_hwid()/dt_get_cpu_id().
 - Update prototype of dt_get_cpu_hwid(), use pointer-to-const for cpun arg.
 - Add empty line before last return in dt_get_cpu_hwid().
 - s/riscv_of_processor_hartid/dt_processor_cpuid().
 - Use pointer-to_const for node argument of dt_processor_cpuid().
 - Use for hart_id unsigned long type as according to the spec for RV128
   mhartid register will be 128 bit long.
 - Update commit message and subject.
 - use 'CPU' instead of 'HART'.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Was this is good move? What is returned ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">--- a/xen/arch/riscv/include/asm/smp.h
+++ b/xen/arch/riscv/include/asm/smp.h
@@ -26,6 +26,9 @@ static inline void set_cpuid_to_hartid(unsigned long cpuid,
 
 void setup_tp(unsigned int cpuid);
 
+struct dt_device_node;
+int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... here isn't a number in Xen's CPU numbering space. From earlier discussions I'm
not sure it's a hart ID either, so it may need further clarification (and I'd
expect RISC-V to have suitable terminology to tell apart the different entities).</pre>
    </blockquote>
    <pre>From device tree point of view (<a class="moz-txt-link-freetext" href="https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt">https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt</a>)
it is just hart which is defined as a hardware execution context, which contains all the state mandated by
the RISC-V ISA: a PC and some registers.
And also based on this for DT binding:
  For example, my Intel laptop is
  described as having one socket with two cores, each of which has two hyper
  threads.  Therefore this system has four harts.
They are using just harts and in DT it will look like 4 node with a number in reg property which they
call hart. So from DT point of view hartid is pretty fine to use.

From specification point of view (<a class="moz-txt-link-freetext" href="https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_hardware_platform_terminology">https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_hardware_platform_terminology</a>):
  A RISC-V hardware platform can contain one or more RISC-V-compatible processing cores together
  with other non-RISC-V-compatible cores, fixed-function accelerators, various physical memory
  structures, I/O devices, and an interconnect structure to allow the components to communicate.

  A component is termed a core if it contains an independent instruction fetch unit. A RISC-V-
  compatible core might support multiple RISC-V-compatible hardware threads, or harts, through
  multithreading.
and (<a class="moz-txt-link-freetext" href="https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_software_execution_environments_and_harts">https://riscv.github.io/riscv-isa-manual/snapshot/unprivileged/#_risc_v_software_execution_environments_and_harts</a>):
  From the perspective of software running in a given execution environment, a hart is a resource that
  autonomously fetches and executes RISC-V instructions within that execution environment. In this
  respect, a hart behaves like a hardware thread resource even if time-multiplexed onto real hardware by
  the execution environment. Some EEIs support the creation and destruction of additional harts, for
  example, via environment calls to fork new harts.</pre>
    <pre>DT's CPU node should be refer to core plus hardware thread (or threads in case of multithreading)
in reg property to be close to the spec(?) but basically in DT they IMO just describe what in the sepc
is called an independent instruction fetch unit.

I still think that it is fine just to use hart_id. If to be close more to a spec the unit_id(?)
but it is more confusing IMO with what is use in RISC-V's DT binding.

</pre>
    <blockquote type="cite"
      cite="mid:df77a5c5-de45-4432-a86f-d120e9417d86@suse.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">@@ -10,3 +13,66 @@ void __init smp_prepare_boot_cpu(void)
     cpumask_set_cpu(0, &amp;cpu_possible_map);
     cpumask_set_cpu(0, &amp;cpu_online_map);
 }
+
+/**
+ * dt_get_cpuid - Get the cpuid from a CPU device node
+ *
+ * @cpun: CPU number(logical index) for which device node is required
+ *
+ * Return: The cpuid for the CPU node or ~0ULL if not found.
+ */
+static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
+{
+    const __be32 *cell;
+    int ac;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
This is bogus (should be unsigned int afaict), but dictated by ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    uint32_t len;
+
+    ac = dt_n_addr_cells(cpun);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the return value here and ...

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    cell = dt_get_property(cpun, "reg", &amp;len);
+    if ( !cell || !ac || ((sizeof(*cell) * ac) &gt; len) )
+        return ~0ULL;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
(Nit: This doesn't match the return type of the function; same for
the function comment. Also, what if sizeof(*cell) * ac &lt; len?)

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return dt_read_number(cell, ac);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
... the function parameter type here. </pre>
    </blockquote>
    <pre>I think that we can declare ac as unsigned int even dt_n_addr_cells
return int as basically it returns be32_to_cpu(*ip) which return unsigned
int and it isn't expected to be a big value so overflow of INT_MAX shouldn't
happen and it won't affect a size argument of dt_read_number().</pre>
    <blockquote type="cite"
      cite="mid:df77a5c5-de45-4432-a86f-d120e9417d86@suse.com">
      <pre wrap="" class="moz-quote-pre">In fact, that function is raising
another question: If the "size" argument is outside of [0, 2], the value
returned is silently truncated.</pre>
    </blockquote>
    <pre>Usually address-cells is 1 or 2, so it isn't expected to be higher (but DT tells
that the value is u32 so it could be higher then 2). And I think it could be also
explained by bitness of an architecture.
I think I see address-cells equal to 3 for something connected to PCI, but
probably another one functions should be used to read.

</pre>
    <blockquote type="cite"
      cite="mid:df77a5c5-de45-4432-a86f-d120e9417d86@suse.com">
      <pre wrap="" class="moz-quote-pre">

More generally - are there any plans to make DT code signed-ness-correct?

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/*
+ * Returns the cpuid of the given device tree node, or -ENODEV if the node
+ * isn't an enabled and valid RISC-V hart node.
+ */
+int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
+{
+    const char *isa;
+
+    if ( !dt_device_is_compatible(node, "riscv") )
+    {
+        printk("Found incompatible CPU\n");
+        return -ENODEV;
+    }
+
+    *cpuid = dt_get_cpuid(node);
+    if ( *cpuid == ~0UL )
+    {
+        printk("Found CPU without CPU ID\n");
+        return -ENODEV;
+    }
+
+    if ( !dt_device_is_available(node))
+    {
+        printk("CPU with cpuid=%lu is not available\n", *cpuid);
+        return -ENODEV;
+    }
+
+    if ( dt_property_read_string(node, "riscv,isa", &amp;isa) )
+    {
+        printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
+        return -ENODEV;
+    }
+
+    if ( isa[0] != 'r' || isa[1] != 'v' )
+    {
+        printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
+        return -ENODEV;
+    }
+
+    return 0;
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I view it as unhelpful that all errors result in -ENODEV. Yes, there are log
messages for all of the cases, but surely there are errno values better
representing the individual failure reasons?</pre>
    </blockquote>
    <pre>I will update that to:

@@ -46,6 +46,7 @@ static unsigned long dt_get_cpuid(const struct dt_device_node *cpun)
 int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
 {
     const char *isa;
+    int ret;
 
     if ( !dt_device_is_compatible(node, "riscv") )
     {
@@ -57,7 +58,7 @@ int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
     if ( *cpuid == ~0UL )
     {
         printk("Found CPU without CPU ID\n");
-        return -ENODEV;
+        return -EINVAL;
     }
 
     if ( !dt_device_is_available(node))
@@ -66,16 +67,16 @@ int dt_processor_cpuid(const struct dt_device_node *node, unsigned long *cpuid)
         return -ENODEV;
     }
 
-    if ( dt_property_read_string(node, "riscv,isa", &amp;isa) )
+    if ( (ret = dt_property_read_string(node, "riscv,isa", &amp;isa)) )
     {
         printk("CPU with cpuid=%lu has no \"riscv,isa\" property\n", *cpuid);
-        return -ENODEV;
+        return ret;
     }
 
     if ( isa[0] != 'r' || isa[1] != 'v' )
     {
         printk("CPU with cpuid=%lu has an invalid ISA of \"%s\"\n", *cpuid, isa);
-        return -ENODEV;
+        return -EINVAL;
     }
 
     return 0;

I think it's better now.

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------s5zO9QC0mthSFHmFvQACGQQ9--


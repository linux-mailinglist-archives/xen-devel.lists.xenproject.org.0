Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4687978B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691914.1078494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk44W-0006aR-FA; Tue, 12 Mar 2024 15:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691914.1078494; Tue, 12 Mar 2024 15:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk44W-0006Y3-By; Tue, 12 Mar 2024 15:29:44 +0000
Received: by outflank-mailman (input) for mailman id 691914;
 Tue, 12 Mar 2024 15:29:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk44V-0006Xx-3Y
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:29:43 +0000
Received: from 6.mo560.mail-out.ovh.net (6.mo560.mail-out.ovh.net
 [87.98.165.38]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 586a62f1-e085-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 16:29:41 +0100 (CET)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.2.160])
 by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4TvHd101YSz1MM3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 15:29:40 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-jtmlx (unknown [10.111.174.132])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AABA91FDEF;
 Tue, 12 Mar 2024 15:29:39 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.101])
 by ghost-submission-6684bf9d7b-jtmlx with ESMTPSA
 id cyWVIuN08GV4KwEAiIGgIA
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 15:29:39 +0000
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
X-Inumbo-ID: 586a62f1-e085-11ee-afdd-a90da7624cb6
Authentication-Results:garm.ovh; auth=pass (GARM-101G0040df681a7-86c7-4fd3-8bfb-ef3eef196769,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Content-Type: multipart/alternative;
 boundary="------------juIWivVt0CzXpc1PTNT10FKB"
Message-ID: <c0fb2c1f-a759-4328-96f7-d4795d2fe4d9@3mdeb.com>
Date: Tue, 12 Mar 2024 16:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/9] x86/smp: drop x86_cpu_to_apicid, use
 cpu_data[cpu].apicid instead
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
 <b85ecee7-65ce-47f0-8e9d-cdc056d337fb@xen.org>
 <24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com>
X-Ovh-Tracer-Id: 8422857205134043504
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtkfffgggfuffvvehfhfgjsegrtderredtvdejnecuhfhrohhmpefmrhihshhtihgrnhcujfgvsggvlhcuoehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepkeevfeevudffvdelfeeuudegtdeggfegheegudegleefiedtffekgfeiheejjeegnecuffhomhgrihhnpeigkeeipgeigedrshgspdefmhguvggsrdgtohhmnecukfhppeduvdejrddtrddtrddupddvudejrddujedurdeiuddrvdehpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeitddpmhhouggvpehsmhhtphhouhht

This is a multi-part message in MIME format.
--------------juIWivVt0CzXpc1PTNT10FKB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 7.02.2024 17:41, Jan Beulich wrote:
> On 02.02.2024 19:11, Julien Grall wrote:
>> Hi,
>>
>> On 14/11/2023 17:50, Krystian Hebel wrote:
>>> Both fields held the same data.
>>>
>>> Signed-off-by: Krystian Hebel<krystian.hebel@3mdeb.com>
>>> ---
>>>    xen/arch/x86/boot/x86_64.S           |  8 +++++---
>>>    xen/arch/x86/include/asm/asm_defns.h |  2 +-
>>>    xen/arch/x86/include/asm/processor.h |  2 ++
>>>    xen/arch/x86/include/asm/smp.h       |  4 ----
>>>    xen/arch/x86/numa.c                  | 15 +++++++--------
>>>    xen/arch/x86/smpboot.c               |  8 ++++----
>>>    xen/arch/x86/x86_64/asm-offsets.c    |  4 +++-
>>>    7 files changed, 22 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
>>> index b85b47b5c1a0..195550b5c0ea 100644
>>> --- a/xen/arch/x86/boot/x86_64.S
>>> +++ b/xen/arch/x86/boot/x86_64.S
>>> @@ -20,15 +20,17 @@ ENTRY(__high_start)
>>>            jz      .L_stack_set
>>>    
>>>            /* APs only: get stack base from APIC ID saved in %esp. */
>>> -        mov     $-1, %rax
>>> -        lea     x86_cpu_to_apicid(%rip), %rcx
>>> +        mov     $0, %rax
>>> +        lea     cpu_data(%rip), %rcx
>>> +        /* cpu_data[0] is BSP, skip it. */
>>>    1:
>>>            add     $1, %rax
>>> +        add     $CPUINFO_X86_sizeof, %rcx
>>>            cmp     $NR_CPUS, %eax
>>>            jb      2f
>>>            hlt
>>>    2:
>>> -        cmp     %esp, (%rcx, %rax, 4)
>>> +        cmp     %esp, CPUINFO_X86_apicid(%rcx)
>>>            jne     1b
>>>    
>>>            /* %eax is now Xen CPU index. */
>> As mentioned in an earlier patch, I think you want to re-order the
>> patches. This will avoid to modify twice the same code within the same
>> series (it is best to avoid if you can).
> I second this request. Even more so that there's an unexplained move
> from starting at $-1 to starting at $0 (in which case you really want
> to use xor, not mov).
Will do. This may even result in squashing some patches together.
>>> --- a/xen/arch/x86/numa.c
>>> +++ b/xen/arch/x86/numa.c
>>> @@ -54,14 +54,13 @@ bool __init arch_numa_unavailable(void)
>>>    /*
>>>     * Setup early cpu_to_node.
>>>     *
>>> - * Populate cpu_to_node[] only if x86_cpu_to_apicid[],
>>> - * and apicid_to_node[] tables have valid entries for a CPU.
>>> - * This means we skip cpu_to_node[] initialisation for NUMA
>>> - * emulation and faking node case (when running a kernel compiled
>>> - * for NUMA on a non NUMA box), which is OK as cpu_to_node[]
>>> - * is already initialized in a round robin manner at numa_init_array,
>>> - * prior to this call, and this initialization is good enough
>>> - * for the fake NUMA cases.
>>> + * Populate cpu_to_node[] only if cpu_data[], and apicid_to_node[]
> You mean cpu_physical_id() here, and then this change wants doing when
> switching to that, imo.
You mean s/cpu_data[]/cpu_physical_id()/ or something else?
>>> + * tables have valid entries for a CPU. This means we skip
>>> + * cpu_to_node[] initialisation for NUMA emulation and faking node
>>> + * case (when running a kernel compiled for NUMA on a non NUMA box),
>>> + * which is OK as cpu_to_node[] is already initialized in a round
>>> + * robin manner at numa_init_array, prior to this call, and this
>>> + * initialization is good enough for the fake NUMA cases.
>>>     */
> Also if you're already re-wrapping this comment, please make better use
> of line width.
>
>>> --- a/xen/arch/x86/x86_64/asm-offsets.c
>>> +++ b/xen/arch/x86/x86_64/asm-offsets.c
>>> @@ -159,7 +159,9 @@ void __dummy__(void)
>>>        OFFSET(IRQSTAT_softirq_pending, irq_cpustat_t, __softirq_pending);
>>>        BLANK();
>>>    
>>> -    OFFSET(CPUINFO_features, struct cpuinfo_x86, x86_capability);
>>> +    OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);
>> The rename seems to be unrelated to this patch. Can you clarify?
> I agree some renaming wants doing, but separately. That's because we
> use CPUINFO_ as a prefix for two entirely different structure's offsets
> right now. I'm not convinced of CPUINFO_X86_ as the new prefix though:
> Uses are against cpu_data[], so CPUDATA_ may be better. Might be good
> if Andrew and/or Roger could voice their view.
Yes, this was because after adding APIC ID to this structure I tried to use
CPUINFO_sizeof in the assembly, and bad things happened.
>
> Jan
>
>>> +    OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
>>> +    DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
>>>        BLANK();
>>>    
>>>        OFFSET(MB_flags, multiboot_info_t, flags);
>> Cheers,
>>
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com  | @3mdeb_com

--------------juIWivVt0CzXpc1PTNT10FKB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 7.02.2024 17:41, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com">
      <pre class="moz-quote-pre" wrap="">On 02.02.2024 19:11, Julien Grall wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi,

On 14/11/2023 17:50, Krystian Hebel wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Both fields held the same data.

Signed-off-by: Krystian Hebel <a class="moz-txt-link-rfc2396E" href="mailto:krystian.hebel@3mdeb.com">&lt;krystian.hebel@3mdeb.com&gt;</a>
---
  xen/arch/x86/boot/x86_64.S           |  8 +++++---
  xen/arch/x86/include/asm/asm_defns.h |  2 +-
  xen/arch/x86/include/asm/processor.h |  2 ++
  xen/arch/x86/include/asm/smp.h       |  4 ----
  xen/arch/x86/numa.c                  | 15 +++++++--------
  xen/arch/x86/smpboot.c               |  8 ++++----
  xen/arch/x86/x86_64/asm-offsets.c    |  4 +++-
  7 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index b85b47b5c1a0..195550b5c0ea 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -20,15 +20,17 @@ ENTRY(__high_start)
          jz      .L_stack_set
  
          /* APs only: get stack base from APIC ID saved in %esp. */
-        mov     $-1, %rax
-        lea     x86_cpu_to_apicid(%rip), %rcx
+        mov     $0, %rax
+        lea     cpu_data(%rip), %rcx
+        /* cpu_data[0] is BSP, skip it. */
  1:
          add     $1, %rax
+        add     $CPUINFO_X86_sizeof, %rcx
          cmp     $NR_CPUS, %eax
          jb      2f
          hlt
  2:
-        cmp     %esp, (%rcx, %rax, 4)
+        cmp     %esp, CPUINFO_X86_apicid(%rcx)
          jne     1b
  
          /* %eax is now Xen CPU index. */
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
As mentioned in an earlier patch, I think you want to re-order the 
patches. This will avoid to modify twice the same code within the same 
series (it is best to avoid if you can).
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I second this request. Even more so that there's an unexplained move
from starting at $-1 to starting at $0 (in which case you really want
to use xor, not mov).</pre>
    </blockquote>
    Will do. This may even result in squashing some patches together.<span
    style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -54,14 +54,13 @@ bool __init arch_numa_unavailable(void)
  /*
   * Setup early cpu_to_node.
   *
- * Populate cpu_to_node[] only if x86_cpu_to_apicid[],
- * and apicid_to_node[] tables have valid entries for a CPU.
- * This means we skip cpu_to_node[] initialisation for NUMA
- * emulation and faking node case (when running a kernel compiled
- * for NUMA on a non NUMA box), which is OK as cpu_to_node[]
- * is already initialized in a round robin manner at numa_init_array,
- * prior to this call, and this initialization is good enough
- * for the fake NUMA cases.
+ * Populate cpu_to_node[] only if cpu_data[], and apicid_to_node[]
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You mean cpu_physical_id() here, and then this change wants doing when
switching to that, imo.</pre>
    </blockquote>
    You mean s/cpu_data[]/cpu_physical_id()/ or something else?<span
    style="white-space: pre-wrap">
</span>
    <blockquote type="cite"
      cite="mid:24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+ * tables have valid entries for a CPU. This means we skip
+ * cpu_to_node[] initialisation for NUMA emulation and faking node
+ * case (when running a kernel compiled for NUMA on a non NUMA box),
+ * which is OK as cpu_to_node[] is already initialized in a round
+ * robin manner at numa_init_array, prior to this call, and this
+ * initialization is good enough for the fake NUMA cases.
   */
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Also if you're already re-wrapping this comment, please make better use
of line width.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -159,7 +159,9 @@ void __dummy__(void)
      OFFSET(IRQSTAT_softirq_pending, irq_cpustat_t, __softirq_pending);
      BLANK();
  
-    OFFSET(CPUINFO_features, struct cpuinfo_x86, x86_capability);
+    OFFSET(CPUINFO_X86_features, struct cpuinfo_x86, x86_capability);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The rename seems to be unrelated to this patch. Can you clarify?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I agree some renaming wants doing, but separately. That's because we
use CPUINFO_ as a prefix for two entirely different structure's offsets
right now. I'm not convinced of CPUINFO_X86_ as the new prefix though:
Uses are against cpu_data[], so CPUDATA_ may be better. Might be good
if Andrew and/or Roger could voice their view.</pre>
    </blockquote>
    Yes, this was because after adding APIC ID to this structure I tried
    to use<br>
    CPUINFO_sizeof in the assembly, and bad things happened.<br>
    <blockquote type="cite"
      cite="mid:24dc1f13-3add-4b5f-9e2d-a18286b691eb@suse.com">
      <pre class="moz-quote-pre" wrap="">

Jan

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+    OFFSET(CPUINFO_X86_apicid, struct cpuinfo_x86, apicid);
+    DEFINE(CPUINFO_X86_sizeof, sizeof(struct cpuinfo_x86));
      BLANK();
  
      OFFSET(MB_flags, multiboot_info_t, flags);
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Cheers,

</pre>
      </blockquote>
    </blockquote>
    Best regards,<br>
    <pre class="moz-signature" cols="72">-- 
Krystian Hebel
Firmware Engineer
<a class="moz-txt-link-freetext" href="https://3mdeb.com">https://3mdeb.com</a> | @3mdeb_com</pre>
  </body>
</html>

--------------juIWivVt0CzXpc1PTNT10FKB--


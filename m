Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CADB1DA4E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 16:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073169.1436091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1sE-0007bL-OA; Thu, 07 Aug 2025 14:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073169.1436091; Thu, 07 Aug 2025 14:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk1sE-0007Zn-LK; Thu, 07 Aug 2025 14:45:42 +0000
Received: by outflank-mailman (input) for mailman id 1073169;
 Thu, 07 Aug 2025 14:45:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oMMd=2T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uk1sE-0007Zg-11
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 14:45:42 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fc259f2-739d-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 16:45:39 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-615622ed677so1339075a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 07:45:39 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3b77sm1318755966b.51.2025.08.07.07.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 07:45:38 -0700 (PDT)
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
X-Inumbo-ID: 2fc259f2-739d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754577939; x=1755182739; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3dtB2UQAds/eEd9AXjbKtecDjX2KM26MD4NWqTfa3hk=;
        b=ABPTdbK9H1hDaWD6yupQ/mXdWQMx920iQ8X3gbVuqYVO8+SwhAuoQ6Js8xcZ8FT7/B
         ZZOaQByKeOo9A5RVFo/3SPeci2z+onFeHNkg8l8LEaXLQQlChvVI8v99YWugAjY7749F
         G9KIcmPaNgznrYQjwfQUuZ7kJAd9FX1Ju+VkG6l47e+KDV661X5AfeviiM3klXEnRfD0
         Mds1BO56A8dEnvuE0nJI7/so71LPGct7DrJ0l5NeAOEMcIgUd7WZik8DCy0x9zvonTYz
         NXIlKktFVE/KvfNlh4e4I5HrEa1vmpVwGrmHC3AbjjNxL+s7NUhUES9TJ2szZdDOOKP4
         F48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754577939; x=1755182739;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3dtB2UQAds/eEd9AXjbKtecDjX2KM26MD4NWqTfa3hk=;
        b=UqwLQfYaUkkHm6raEipA0dAlExvYo8i4x+ABldJw/wxEkpBGq5nMrjchvSLoGAzi3d
         oSwuFWv8hwwRzANCWZ88Y4awjkFPpGhNAWKakmylgSa0PKXumG9p58VPKrimCFWOvPH0
         PPA+JWlWLNmviF/oyRLOPjMJNi6yOmyoKSHHicU1MDf0inmaDjg70K0A3TZVegS2/iUs
         UB7OuYRWAHAHOWMHltAu1o3RND986QWToKi3LZujX/87kIU9m93DUpdORehrMYYJ5fM7
         2YRItpAIElBdwk5T7vlGvr5XpBd/5yHN3uAQlgL48xRS2RMyfFWUiVS8Ya8tMFbuo3xg
         J/tw==
X-Forwarded-Encrypted: i=1; AJvYcCWz5/IPUrr806zNYKkIa7RZUknIEHx5bBrShqV0TK/+XEAXNsUQqIcBVCrNfqBCbnhIttfVrkumoyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpHIQtzrC+BNBvts2aXVz7woxiwhdh+Zpron1SQV/paj5XPWNa
	3R5yMTl5LRCQoP/U1fcYL7SbESv0THGpf0eKCqVoSy2VWNJVWFkQ5HG+
X-Gm-Gg: ASbGncuXbAuS01znjKVndBQB4bAaifeRqdWnrpaWcMSvmgB5L1Cp4L5zE8cY5GX9GJn
	86hBDQRhRu5ccN+KPZkT7OvonbOBkHEBXrE80QB8E69aZmDdVwUkyWONs2fg04fdiK4RpnDRkTU
	G1UP3LgcPhIaTZ+iJxKwmLh+jFnecnJ3lOnkePF4nOCroMNMGWb2LGJtg9Gc1RZm5TjoDHzulek
	VawPIOs92wTEKhMcQZKfI44YCR+RitTJvgPSU/vNENfATODnjUXhOjA7/M/K9mv0/ZSsCcQgivb
	RWDRSN+DVY9i8c9snLB0Z2FAPP+QGS7ZVKwVnwrV+5usLTuCaC5XHjQJEnU4yvpK8H7BTeXgBfH
	Q/IjszYXao2sZ+R9J8/ltV0N0M8k1ElP5DDgkNxzDaOiPYQUqKSzKFRQL0UhD+qQ4lMLX/GM=
X-Google-Smtp-Source: AGHT+IGQsYKSg3bV/lfeo/zWtA/8fpkC/HBVpVn95XA00YN65EhLngc5yefxdbWwG+T4HbOYLbdiRg==
X-Received: by 2002:a17:906:6a09:b0:ade:6e3:7c4 with SMTP id a640c23a62f3a-af9c1cc3c71mr17577466b.23.1754577938738;
        Thu, 07 Aug 2025 07:45:38 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------34lT01JwO04vhqMxTRkKLy9A"
Message-ID: <0737c844-650c-403a-a802-e1215faa2916@gmail.com>
Date: Thu, 7 Aug 2025 16:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/20] xen/riscv: introduce VMID allocation and
 manegement
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <d61f5f831ac8045055a1775ee710d4f2fe8dcc26.1753973161.git.oleksii.kurochko@gmail.com>
 <cd1a0c64-49d7-4ae1-8dec-b3b1de3f1d09@suse.com>
 <bcf4c3aa-5c09-4171-a4f5-85110d6e634f@gmail.com>
 <6ddee574-6fe2-4de7-b000-a3af0b2c9d12@suse.com>
 <cc6bb8a7-ed22-4d3e-a352-fa305f0ea56a@gmail.com>
 <affb589c-0e4e-46c1-a2c7-d09b6cca0a6c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <affb589c-0e4e-46c1-a2c7-d09b6cca0a6c@suse.com>

This is a multi-part message in MIME format.
--------------34lT01JwO04vhqMxTRkKLy9A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/7/25 12:11 PM, Jan Beulich wrote:
>>>>>> +    unsigned long old;
>>>>>> +
>>>>>> +    /* Figure-out number of VMID bits in HW */
>>>>>> +    old = csr_read(CSR_HGATP);
>>>>>> +
>>>>>> +    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
>>>>>> +    vmid_bits = csr_read(CSR_HGATP);
>>>>>> +    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
>>>>> Nit: Stray blank.
>>>>>
>>>>>> +    vmid_bits = flsl(vmid_bits);
>>>>>> +    csr_write(CSR_HGATP, old);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * We polluted local TLB so flush all guest TLB as
>>>>>> +     * a speculative access can happen at any time.
>>>>>> +     */
>>>>>> +    local_hfence_gvma_all();
>>>>> There's no guest running. If you wrote hgat.MODE as zero, as per my
>>>>> understanding now new TLB entries could even purely theoretically appear.
>>>> It could be an issue (or, at least, it is recommended) when hgatp.MODE is
>>>> changed:
>>>>     If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
>>>>     (and rs2 set to either x0 or the VMID) must be executed to order subsequent
>>>>     guest translations with the MODE change—even if the old MODE or new MODE
>>>>     is Bare.
>>>> On other hand it is guaranteed that, at least, on Reset (and so I assume
>>>> for power on) that:
>>>>     If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
>>>>     fields are reset to 0.
>>>>
>>>> So it seems like if no guest is ran then there is no need even to write
>>>> hgatp.MODE as zero, but it might be sense to do that explicitly just to
>>>> be sure.
>>>>
>>>> I thought it was possible to have a running guest and perform a CPU hotplug.
>>> But that guest will run on another hart.
>>>
>>>> In that case, I expect that during the hotplug,|vmidlen_detect()| will be
>>>> called and return the|vmid_bits| value, which is used as the active VMID.
>>>> At that moment, the local TLB could be speculatively polluted, I think.
>>>> Likely, it makes sense to call vmidlen_detect() only once for each hart
>>>> during initial bringup.
>>> That may bring you more problems than it solves. You'd need to stash away
>>> the value originally read somewhere. And that somewhere isn't per-CPU data.
>>>
>>>>> In fact, with no guest running (yet) I'm having a hard time seeing why
>>>>> you shouldn't be able to simply write the register with just
>>>>> HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
>>>>> whether "old" needs restoring; writing plain zero afterwards ought to
>>>>> suffice. You're in charcge of the register, after all.
>>>> It make sense (but I don't know if it is a possible case) to be sure that
>>>> HGATP.MODE remains the same, so there is no need to have TLB flush. If
>>>> HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
>>>> above.
>>>>
>>>> If we agreed to keep local_hfence_gvma_all() then I think it isn't really
>>>> any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.
>>>>
>>>> Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
>>>> to check that in vmidlen_detect() and panic if it isn't zero) and if
>>>> vmidlen_detect() function will be called before any guest domain(s) will
>>>> be ran then I could agree that we don't need local_hfence_gvma_all() here.
>>>>
>>>> As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
>>>> set to zero.
>>>>
>>>> Does it make sense?
>>> Well - I'd like the pre-conditions to be understood better. For example, can
>>> a hart really speculate into guest mode, when the hart is only in the
>>> process of being brought up?
>> I couldn't explicit words that a hart can't speculate into guest mode
>> either on bring up or during its work.
>>
>> But there are some moments in the spec which tells:
>>     Implementations with virtual memory are permitted to perform address
>>     translations speculatively and earlier than required by an explicit
>>     memory access, and are permitted to cache them in address translation
>>     cache structures—including possibly caching the identity mappings from
>>     effective address to physical address used in Bare translation modes and
>>     M-mode.
>> And here:
>>     Implementations may also execute the address-translation algorithm
>>     speculatively at any time, for any virtual address, as long as satp is
>>     active (as defined in Section 10.1.11). Such speculative executions have
>>     the effect of pre-populating the address-translation cache.
> That's satp though, not hgatp.
>
>> Where it is explicitly mentioned that speculation can happen in*any time*.
>> And at the same time:
>>     Speculative executions of the address-translation algorithm behave as
>>     non-speculative executions of the algorithm do, except that they must
>>     not set the dirty bit for a PTE, they must not trigger an exception,
>>     and they must not create address-translation cache entries if those
>>     entries would have been invalidated by any SFENCE.VMA instruction
>>     executed by the hart since the speculative execution of the algorithm began.
>> What I read as if TLB was empty before it will stay empty.
>>
>> Also, despite of the fact here it is mentioned that when V=0 two-stage address
>> translation is inactivated:
>>     The current virtualization mode, denoted V, indicates whether the hart is
>>     currently executing in a guest. When V=1, the hart is either in virtual
>>     S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest OS running
>>     in VS-mode. When V=0, the hart is either in M-mode, in HS-mode, or in
>>     U-mode atop an OS running in HS-mode. The virtualization mode also
>>     indicates whether two-stage address translation is active (V=1) or
>>     inactive (V=0).
>> But on the same side, writing to hgatp register activates it:
>>     The hgatp register is considered active for the purposes of
>>     the address-translation algorithm unless the effective privilege mode
>>     is U and hstatus.HU=0.
>> And if so + considering that speculation could happen at any time, and
>> we are in HS-mode, not it U mode then I would say that it could really
>> speculate into guest mode.
> Hmm, that leaves some things to be desired. What I'm particularly puzzled
> by is that there's nothing said either way towards speculation through SRET.
> That's the important aspect here aiui, because without that the hart can't
> speculate into guest mode.
>
> But yes, in the absence of any clear indication to the contrary, I think
> you want to keep the local_hfence_gvma_all() (with a suitable comment).

Interesting that for VS-stage translation is explicitly mention that it is
possible to stop speculation:
   No mechanism is provided to atomically change vsatp and hgatp together.
   Hence, to prevent speculative execution causing one guest’s VS-stage
   translations to be cached under another guest’s VMID, world-switch code
   should zero vsatp, then swap hgatp, then finally write the new vsatp value.
   Similarly, if henvcfg.PBMTE need be world-switched, it should be switched
   after zeroing vsatp but before writing the new vsatp value, obviating
   the need to execute an HFENCE.VVMA instruction.
So if VSATP is 0 then there is no speculation as there is no need to execute
HFENCE.VVMA.

>
>>>>>> +    data->max_vmid = BIT(vmid_len, U) - 1;
>>>>>> +    data->disabled = !opt_vmid_enabled || (vmid_len <= 1);
>>>>> Actually, what exactly does it mean that "VMIDs are disabled"? There's
>>>>> no enable bit that I could find anywhere. Isn't it rather that in this
>>>>> case you need to arrange to flush always on VM entry (or always after a
>>>>> P2M change, depending how the TLB is split between guest and host use)?
>>>> "VMIDs are disabled" here means that TLB flush will happen each time p2m
>>>> is changed.
>>> That's better described as "VMIDs aren't used" then?
>> It sounds a little bit just like an opposite to "disabled" (i.e. means
>> basically the same), but I am okay to use "used" instead.
> If you want to stick to using "disabled", then how about "VMID use is
> disabled"? (You probably meanwhile understood that what I'm after is it
> becoming clear that this is a software decision, not something you can
> enforce in hardware.)

"VMID use is disabled" really sounds more clear. Thanks.

~ Oleksii

--------------34lT01JwO04vhqMxTRkKLy9A
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
    <div class="moz-cite-prefix">On 8/7/25 12:11 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:affb589c-0e4e-46c1-a2c7-d09b6cca0a6c@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+    unsigned long old;
+
+    /* Figure-out number of VMID bits in HW */
+    old = csr_read(CSR_HGATP);
+
+    csr_write(CSR_HGATP, old | HGATP_VMID_MASK);
+    vmid_bits = csr_read(CSR_HGATP);
+    vmid_bits =  MASK_EXTR(vmid_bits, HGATP_VMID_MASK);
</pre></blockquote><pre wrap="" class="moz-quote-pre">Nit: Stray blank.

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">+    vmid_bits = flsl(vmid_bits);
+    csr_write(CSR_HGATP, old);
+
+    /*
+     * We polluted local TLB so flush all guest TLB as
+     * a speculative access can happen at any time.
+     */
+    local_hfence_gvma_all();
</pre></blockquote><pre wrap="" class="moz-quote-pre">There's no guest running. If you wrote hgat.MODE as zero, as per my
understanding now new TLB entries could even purely theoretically appear.
</pre></blockquote><pre wrap="" class="moz-quote-pre">It could be an issue (or, at least, it is recommended) when hgatp.MODE is
changed:
   If hgatp.MODE is changed for a given VMID, an HFENCE.GVMA with rs1=x0
   (and rs2 set to either x0 or the VMID) must be executed to order subsequent
   guest translations with the MODE change—even if the old MODE or new MODE
   is Bare.
On other hand it is guaranteed that, at least, on Reset (and so I assume
for power on) that:
   If the hypervisor extension is implemented, the hgatp.MODE and vsatp.MODE
   fields are reset to 0.

So it seems like if no guest is ran then there is no need even to write
hgatp.MODE as zero, but it might be sense to do that explicitly just to
be sure.

I thought it was possible to have a running guest and perform a CPU hotplug.
</pre></blockquote><pre wrap="" class="moz-quote-pre">But that guest will run on another hart.

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">In that case, I expect that during the hotplug,|vmidlen_detect()| will be
called and return the|vmid_bits| value, which is used as the active VMID.
At that moment, the local TLB could be speculatively polluted, I think.
Likely, it makes sense to call vmidlen_detect() only once for each hart
during initial bringup.
</pre></blockquote><pre wrap="" class="moz-quote-pre">That may bring you more problems than it solves. You'd need to stash away
the value originally read somewhere. And that somewhere isn't per-CPU data.

</pre><blockquote type="cite" style="color: #007cff;"><blockquote
      type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">In fact, with no guest running (yet) I'm having a hard time seeing why
you shouldn't be able to simply write the register with just
HGATP_VMID_MASK, i.e. without OR-ing in "old". It's even questionable
whether "old" needs restoring; writing plain zero afterwards ought to
suffice. You're in charcge of the register, after all.
</pre></blockquote><pre wrap="" class="moz-quote-pre">It make sense (but I don't know if it is a possible case) to be sure that
HGATP.MODE remains the same, so there is no need to have TLB flush. If
HGATP.MODE is changed then it will be needed to do TLB flush as I mentioned
above.

If we agreed to keep local_hfence_gvma_all() then I think it isn't really
any sense to restore 'old' or OR-ing it with HGATP_VMID_MASK.

Generally if 'old' is guaranteed to be zero (and, probably, it makes sense
to check that in vmidlen_detect() and panic if it isn't zero) and if
vmidlen_detect() function will be called before any guest domain(s) will
be ran then I could agree that we don't need local_hfence_gvma_all() here.

As an option we can do local_hfence_gvma_all() only if 'old' value wasn't
set to zero.

Does it make sense?
</pre></blockquote><pre wrap="" class="moz-quote-pre">Well - I'd like the pre-conditions to be understood better. For example, can
a hart really speculate into guest mode, when the hart is only in the
process of being brought up?
</pre></blockquote><pre wrap="" class="moz-quote-pre">I couldn't explicit words that a hart can't speculate into guest mode
either on bring up or during its work.

But there are some moments in the spec which tells:
   Implementations with virtual memory are permitted to perform address
   translations speculatively and earlier than required by an explicit
   memory access, and are permitted to cache them in address translation
   cache structures—including possibly caching the identity mappings from
   effective address to physical address used in Bare translation modes and
   M-mode.
And here:
   Implementations may also execute the address-translation algorithm
   speculatively at any time, for any virtual address, as long as satp is
   active (as defined in Section 10.1.11). Such speculative executions have
   the effect of pre-populating the address-translation cache.
</pre></blockquote><pre wrap="" class="moz-quote-pre">That's satp though, not hgatp.

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap=""
      class="moz-quote-pre">Where it is explicitly mentioned that speculation can happen in <b
      class="moz-txt-star"><span class="moz-txt-tag">*</span>any time<span
      class="moz-txt-tag">*</span></b>.
And at the same time:
   Speculative executions of the address-translation algorithm behave as
   non-speculative executions of the algorithm do, except that they must
   not set the dirty bit for a PTE, they must not trigger an exception,
   and they must not create address-translation cache entries if those
   entries would have been invalidated by any SFENCE.VMA instruction
   executed by the hart since the speculative execution of the algorithm began.
What I read as if TLB was empty before it will stay empty.

Also, despite of the fact here it is mentioned that when V=0 two-stage address
translation is inactivated:
   The current virtualization mode, denoted V, indicates whether the hart is
   currently executing in a guest. When V=1, the hart is either in virtual
   S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest OS running
   in VS-mode. When V=0, the hart is either in M-mode, in HS-mode, or in
   U-mode atop an OS running in HS-mode. The virtualization mode also
   indicates whether two-stage address translation is active (V=1) or
   inactive (V=0).
But on the same side, writing to hgatp register activates it:
   The hgatp register is considered active for the purposes of
   the address-translation algorithm unless the effective privilege mode
   is U and hstatus.HU=0.
And if so + considering that speculation could happen at any time, and
we are in HS-mode, not it U mode then I would say that it could really
speculate into guest mode.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Hmm, that leaves some things to be desired. What I'm particularly puzzled
by is that there's nothing said either way towards speculation through SRET.
That's the important aspect here aiui, because without that the hart can't
speculate into guest mode.

But yes, in the absence of any clear indication to the contrary, I think
you want to keep the local_hfence_gvma_all() (with a suitable comment).</pre></pre>
    </blockquote>
    <pre>Interesting that for VS-stage translation is explicitly mention that it is
possible to stop speculation:
  No mechanism is provided to atomically change vsatp and hgatp together.
  Hence, to prevent speculative execution causing one guest’s VS-stage
  translations to be cached under another guest’s VMID, world-switch code
  should zero vsatp, then swap hgatp, then finally write the new vsatp value.
  Similarly, if henvcfg.PBMTE need be world-switched, it should be switched
  after zeroing vsatp but before writing the new vsatp value, obviating
  the need to execute an HFENCE.VVMA instruction.
So if VSATP is 0 then there is no speculation as there is no need to execute
HFENCE.VVMA.
</pre>
    <blockquote type="cite"
      cite="mid:affb589c-0e4e-46c1-a2c7-d09b6cca0a6c@suse.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap=""
      class="moz-quote-pre">

</pre><blockquote type="cite" style="color: #007cff;"><blockquote
      type="cite" style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">+    data-&gt;max_vmid = BIT(vmid_len, U) - 1;
+    data-&gt;disabled = !opt_vmid_enabled || (vmid_len &lt;= 1);
</pre></blockquote><pre wrap="" class="moz-quote-pre">Actually, what exactly does it mean that "VMIDs are disabled"? There's
no enable bit that I could find anywhere. Isn't it rather that in this
case you need to arrange to flush always on VM entry (or always after a
P2M change, depending how the TLB is split between guest and host use)?
</pre></blockquote><pre wrap="" class="moz-quote-pre">"VMIDs are disabled" here means that TLB flush will happen each time p2m
is changed.
</pre></blockquote><pre wrap="" class="moz-quote-pre">That's better described as "VMIDs aren't used" then?
</pre></blockquote><pre wrap="" class="moz-quote-pre">It sounds a little bit just like an opposite to "disabled" (i.e. means
basically the same), but I am okay to use "used" instead.
</pre></blockquote><pre wrap="" class="moz-quote-pre">If you want to stick to using "disabled", then how about "VMID use is
disabled"? (You probably meanwhile understood that what I'm after is it
becoming clear that this is a software decision, not something you can
enforce in hardware.)</pre></pre>
    </blockquote>
    <pre>"VMID use is disabled" really sounds more clear. Thanks.

~ Oleksii
</pre>
  </body>
</html>

--------------34lT01JwO04vhqMxTRkKLy9A--


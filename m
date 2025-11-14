Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245EC5C42A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 10:28:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162378.1490046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJq62-0006Dq-Fi; Fri, 14 Nov 2025 09:27:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162378.1490046; Fri, 14 Nov 2025 09:27:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJq62-0006BR-Cm; Fri, 14 Nov 2025 09:27:58 +0000
Received: by outflank-mailman (input) for mailman id 1162378;
 Fri, 14 Nov 2025 09:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jk/=5W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vJq60-0006BG-M0
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 09:27:56 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c7b551e-c13c-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 10:27:43 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so272134866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Nov 2025 01:27:43 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad44b4sm351744066b.28.2025.11.14.01.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Nov 2025 01:27:41 -0800 (PST)
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
X-Inumbo-ID: 2c7b551e-c13c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763112463; x=1763717263; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVKERs91mOCm7IAcUp0XjHIoVNY8W/5iSvj/CJSrAxM=;
        b=m7fSZgu1dsIumR+9NdtmGqzS2CajQPzp9SAOe8rtk4ZndLgFtALv8WhsxFTbEVZBxa
         n2dPqi5aivvJbDs9IsdNkA7ZwCfyyio069Xlp9E4X3p4QhEC9stXHOmpIDaTCyBOzz/E
         yqIrv8knXoHX31hflGD8Dg+2wSCeRqS1YTBktxPX3DcYF5P3U7uW7gVTY/5eu3+GtBJ5
         kdueu9TAxSS1gF8FdV9vayfvMH2ajT0vPMGlYt6oS6kXLNPP4YDUBFF+83r6hdBo9WOq
         oRsO6Jv6liWpzxlvm2ZbYoAihGlkneR0bOPMjB038QQQq2pFNA2PrZue6WRjWKQZCjhq
         HoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763112463; x=1763717263;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MVKERs91mOCm7IAcUp0XjHIoVNY8W/5iSvj/CJSrAxM=;
        b=J8JY9JtnnuE38skqszalsWApqSVc6d7SUXwGuXdSJw1jIQGDTzVgJrXX/XxSrdcyp2
         MiDGxPNlyPGQoRJA2MpTUzoIVgMbGMgXcCGfHjjSVrpjQjE9HlM1yZPW7SF+YPIwxYfB
         HS0z+2iHcm/HwD79a0l2esmCXSnnyUHCe0QDtOgTSYT5DLmjkVCIHzbRdSMWm9KOyk8D
         rcxH52V3L2e3ZjI4Z4QDkpacJVqbq5oCmJRqziiox69GKYggn0T5xudd9g72iVw5zr6s
         rYvDaZZJFS8k372sHQjjH2G38v8sAnsoodEBL3hDdkkSneBLTkSvCaoNztFF9fluGY41
         VTnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp45wHrut3DcBYetT6cYUHFTrgbBfJy0riK9XKK6rvrqJAJBvfRSpCgBMFR8hZn4ogK5g8d5v3Zfk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDWwaWTbcxwGb6KopmmXkaw5pEqJcoDqi8XN7txJOZ4g8tlfAe
	ty+5CwxK+08MXLxqtX1IKWWsDE++DQlZ5pYFhDusBEwBwUFAZj1YaW0k
X-Gm-Gg: ASbGncvsILsWRcHMLrXTk2YwlY5vmMugfaaxkqIjk1sgXBtA8OGbXrKaIAF1VPiH/Td
	uuqqZoop6qiKBHy67bK7aJDIuRTb+5yl7d4GV1PqnNeshr2lf2sdl98O1z2KrOnZa3jZaJEeinm
	+bXWRbt2pWwEOBE0sxpe/50bJLSKApUesx3tOfNnFmrYUPvUTk7SR1A1ujP7U2lM121bO/oADfA
	rPASpRj6bkMrnVZoKMGVCLQSVptskWgf/O5najf6oh37TODZmVm+Dj33D+AxvuHXBo/nGMjMNAC
	xbAUVujf8cGsNpOaD2UBT8nu0OgIlq862vT+1+uFmQfhG5m2q6rTygS7nhP06GgZIBR8nlnlHjq
	w9x2r4Nx5cjZLcwLeiAgXk3Hak4o/4BnAL+ZwGCdU7ThokEZRQMc82JIlRDiBtrOdXkrcnceALF
	GteP9JqEc6NHrNlboYmRyuPmZZG7yMURwrT+CK0ixq/+RNmcURaw==
X-Google-Smtp-Source: AGHT+IHEaP8TA9rtQXfFZUrU/3l/kbFb7PCQik0PalKgyIrzSacPlF2MeFnEr6vaOmM8+p5GlffotA==
X-Received: by 2002:a17:907:da9:b0:b72:60d9:32b0 with SMTP id a640c23a62f3a-b7367828bd4mr236797866b.3.1763112461559;
        Fri, 14 Nov 2025 01:27:41 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------ihJQpW5AIiAsY4FgPUKoUE3H"
Message-ID: <cf96c62e-cac0-4b18-9524-0703c6492453@gmail.com>
Date: Fri, 14 Nov 2025 10:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [for 4.22 v5 02/18] xen/riscv: introduce VMID allocation and
 manegement
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <bdbe6c13991c2d166614795d43db3f71d790c00f.1760974017.git.oleksii.kurochko@gmail.com>
 <7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com>
Content-Language: en-US
In-Reply-To: <7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com>

This is a multi-part message in MIME format.
--------------ihJQpW5AIiAsY4FgPUKoUE3H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/6/25 3:05 PM, Jan Beulich wrote:
> On 20.10.2025 17:57, Oleksii Kurochko wrote:
>
> +static unsigned int vmidlen_detect(void)
> +{
> +    unsigned int vmid_bits;
> +
> +    /*
> +     * According to the RISC-V Privileged Architecture Spec:
> +     *   When MODE=Bare, guest physical addresses are equal to supervisor
> +     *   physical addresses, and there is no further memory protection
> +     *   for a guest virtual machine beyond the physical memory protection
> +     *   scheme described in Section "Physical Memory Protection".
> +     *   In this case, the remaining fields in hgatp must be set to zeros.
> +     * Thereby it is necessary to set gstage_mode not equal to Bare.
> +     */
> +    ASSERT(gstage_mode != HGATP_MODE_OFF);
> +    csr_write(CSR_HGATP,
> +              MASK_INSR(gstage_mode, HGATP_MODE_MASK) | HGATP_VMID_MASK);
> +    vmid_bits = MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
> +    vmid_bits = flsl(vmid_bits);
> +    csr_write(CSR_HGATP, _AC(0, UL));
> +
> +    /*
> +     * From RISC-V spec:
> +     *   Speculative executions of the address-translation algorithm behave as
> +     *   non-speculative executions of the algorithm do, except that they must
> +     *   not set the dirty bit for a PTE, they must not trigger an exception,
> +     *   and they must not create address-translation cache entries if those
> +     *   entries would have been invalidated by any SFENCE.VMA instruction
> +     *   executed by the hart since the speculative execution of the algorithm
> +     *   began.
> +     *
> +     * Also, despite of the fact here it is mentioned that when V=0 two-stage
> +     * address translation is inactivated:
> +     *   The current virtualization mode, denoted V, indicates whether the hart
> +     *   is currently executing in a guest. When V=1, the hart is either in
> +     *   virtual S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest
> +     *   OS running in VS-mode. When V=0, the hart is either in M-mode, in
> +     *   HS-mode, or in U-mode atop an OS running in HS-mode. The
> +     *   virtualization mode also indicates whether two-stage address
> +     *   translation is active (V=1) or inactive (V=0).
> +     * But on the same side, writing to hgatp register activates it:
> +     *   The hgatp register is considered active for the purposes of
> +     *   the address-translation algorithm unless the effective privilege mode
> +     *   is U and hstatus.HU=0.
> +     *
> +     * Thereby it leaves some room for speculation even in this stage of boot,
> +     * so it could be that we polluted local TLB so flush all guest TLB.
> +     */
> +    local_hfence_gvma_all();
> That's a lot of redundancy with gstage_mode_detect(). The function call here
> actually renders the one there redundant, afaict. Did you consider putting a
> single instance at the end of it in pre_gstage_init()? Otherwise at least
> don't repeat the comment here, but merely point at the other one?

Agree, it could be moved to the end of pre_gstage_init().


>> +    return vmid_bits;
>> +}
>> +
>> +void vmid_init(void)
> This (and its helper) isn't __init because you intend to also call it during
> bringup of secondary processors?

Yes, I wasn't able to find that VMIDLEN is guaranteed to be same for all
harts.

>> +    unsigned int vmid_len = vmidlen_detect();
>> +    struct vmid_data *data = &this_cpu(vmid_data);
>> +
>> +    BUILD_BUG_ON((HGATP_VMID_MASK >> HGATP_VMID_SHIFT) >
>> +                 (BIT((sizeof(data->max_vmid) * BITS_PER_BYTE), UL) - 1));
>> +
>> +    data->max_vmid = BIT(vmid_len, U) - 1;
>> +    data->used = opt_vmid && (vmid_len > 1);
>> +
>> +    if ( g_vmid_used < 0 )
>> +    {
>> +        g_vmid_used = data->used;
>> +        printk("VMIDs use is %sabled\n", data->used ? "en" : "dis");
>> +    }
>> +    else if ( g_vmid_used != data->used )
>> +        printk("CPU%u: VMIDs use is %sabled\n", smp_processor_id(),
>> +               data->used ? "en" : "dis");
>> +
>> +    /* Zero indicates 'invalid generation', so we start the count at one. */
>> +    data->generation = 1;
>> +
>> +    /* Zero indicates 'VMIDs use disabled', so we start the count at one. */
>> +    data->next_vmid = 1;
>> +}
>> +
>> +void vmid_flush_vcpu(struct vcpu *v)
>> +{
>> +    write_atomic(&v->arch.vmid.generation, 0);
>> +}
>> +
>> +void vmid_flush_hart(void)
>> +{
>> +    struct vmid_data *data = &this_cpu(vmid_data);
>> +
>> +    if ( !data->used )
>> +        return;
>> +
>> +    if ( likely(++data->generation != 0) )
>> +        return;
>> +
>> +    /*
>> +     * VMID generations are 64 bit.  Overflow of generations never happens.
>> +     * For safety, we simply disable ASIDs, so correctness is established; it
>> +     * only runs a bit slower.
>> +     */
>> +    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);
> Is logging of the function name of any value here?

Agree, there is no any sense for the logging of the function name.

>   Also, despite the x86
> original havinbg it like this - generally no full stops please if log
> messages. "VMID generation overrun; disabling VMIDs\n" would do.

Sure, I will drop it and will try to not add it in such cases. But could you
please remind (if I asked that before) me what is the reason why full stop
shouldn't be presented in such cases?

>> +bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
>> +{
>> +    struct vmid_data *data = &this_cpu(vmid_data);
>> +
>> +    /* Test if VCPU has valid VMID. */
> x86 has a ->disabled check up from here; why do you not check ->used?

The x86 comment confused me, at first I thought the check was related to
erratum #170, but now I see that it might actually be useful here, so I'll add:
     if ( !data->used )
         goto disabled;

Thanks.

~ Oleksii

--------------ihJQpW5AIiAsY4FgPUKoUE3H
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
    <div class="moz-cite-prefix">On 11/6/25 3:05 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com">
      <pre wrap="" class="moz-quote-pre">On 20.10.2025 17:57, Oleksii Kurochko wrote:

+static unsigned int vmidlen_detect(void)
+{
+    unsigned int vmid_bits;
+
+    /*
+     * According to the RISC-V Privileged Architecture Spec:
+     *   When MODE=Bare, guest physical addresses are equal to supervisor
+     *   physical addresses, and there is no further memory protection
+     *   for a guest virtual machine beyond the physical memory protection
+     *   scheme described in Section "Physical Memory Protection".
+     *   In this case, the remaining fields in hgatp must be set to zeros.
+     * Thereby it is necessary to set gstage_mode not equal to Bare.
+     */
+    ASSERT(gstage_mode != HGATP_MODE_OFF);
+    csr_write(CSR_HGATP,
+              MASK_INSR(gstage_mode, HGATP_MODE_MASK) | HGATP_VMID_MASK);
+    vmid_bits = MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
+    vmid_bits = flsl(vmid_bits);
+    csr_write(CSR_HGATP, _AC(0, UL));
+
+    /*
+     * From RISC-V spec:
+     *   Speculative executions of the address-translation algorithm behave as
+     *   non-speculative executions of the algorithm do, except that they must
+     *   not set the dirty bit for a PTE, they must not trigger an exception,
+     *   and they must not create address-translation cache entries if those
+     *   entries would have been invalidated by any SFENCE.VMA instruction
+     *   executed by the hart since the speculative execution of the algorithm
+     *   began.
+     *
+     * Also, despite of the fact here it is mentioned that when V=0 two-stage
+     * address translation is inactivated:
+     *   The current virtualization mode, denoted V, indicates whether the hart
+     *   is currently executing in a guest. When V=1, the hart is either in
+     *   virtual S-mode (VS-mode), or in virtual U-mode (VU-mode) atop a guest
+     *   OS running in VS-mode. When V=0, the hart is either in M-mode, in
+     *   HS-mode, or in U-mode atop an OS running in HS-mode. The
+     *   virtualization mode also indicates whether two-stage address
+     *   translation is active (V=1) or inactive (V=0).
+     * But on the same side, writing to hgatp register activates it:
+     *   The hgatp register is considered active for the purposes of
+     *   the address-translation algorithm unless the effective privilege mode
+     *   is U and hstatus.HU=0.
+     *
+     * Thereby it leaves some room for speculation even in this stage of boot,
+     * so it could be that we polluted local TLB so flush all guest TLB.
+     */
+    local_hfence_gvma_all();
</pre>
      <pre wrap="" class="moz-quote-pre">That's a lot of redundancy with gstage_mode_detect(). The function call here
actually renders the one there redundant, afaict. Did you consider putting a
single instance at the end of it in pre_gstage_init()? Otherwise at least
don't repeat the comment here, but merely point at the other one?</pre>
    </blockquote>
    <pre>Agree, it could be moved to the end of pre_gstage_init().</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    return vmid_bits;
+}
+
+void vmid_init(void)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">This (and its helper) isn't __init because you intend to also call it during
bringup of secondary processors?</pre>
    </blockquote>
    <pre>Yes, I wasn't able to find that VMIDLEN is guaranteed to be same for all
harts.

</pre>
    <blockquote type="cite"
      cite="mid:7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+    unsigned int vmid_len = vmidlen_detect();
+    struct vmid_data *data = &amp;this_cpu(vmid_data);
+
+    BUILD_BUG_ON((HGATP_VMID_MASK &gt;&gt; HGATP_VMID_SHIFT) &gt;
+                 (BIT((sizeof(data-&gt;max_vmid) * BITS_PER_BYTE), UL) - 1));
+
+    data-&gt;max_vmid = BIT(vmid_len, U) - 1;
+    data-&gt;used = opt_vmid &amp;&amp; (vmid_len &gt; 1);
+
+    if ( g_vmid_used &lt; 0 )
+    {
+        g_vmid_used = data-&gt;used;
+        printk("VMIDs use is %sabled\n", data-&gt;used ? "en" : "dis");
+    }
+    else if ( g_vmid_used != data-&gt;used )
+        printk("CPU%u: VMIDs use is %sabled\n", smp_processor_id(),
+               data-&gt;used ? "en" : "dis");
+
+    /* Zero indicates 'invalid generation', so we start the count at one. */
+    data-&gt;generation = 1;
+
+    /* Zero indicates 'VMIDs use disabled', so we start the count at one. */
+    data-&gt;next_vmid = 1;
+}
+
+void vmid_flush_vcpu(struct vcpu *v)
+{
+    write_atomic(&amp;v-&gt;arch.vmid.generation, 0);
+}
+
+void vmid_flush_hart(void)
+{
+    struct vmid_data *data = &amp;this_cpu(vmid_data);
+
+    if ( !data-&gt;used )
+        return;
+
+    if ( likely(++data-&gt;generation != 0) )
+        return;
+
+    /*
+     * VMID generations are 64 bit.  Overflow of generations never happens.
+     * For safety, we simply disable ASIDs, so correctness is established; it
+     * only runs a bit slower.
+     */
+    printk("%s: VMID generation overrun. Disabling VMIDs.\n", __func__);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Is logging of the function name of any value here?</pre>
    </blockquote>
    <pre>Agree, there is no any sense for the logging of the function name.

</pre>
    <blockquote type="cite"
      cite="mid:7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com">
      <pre wrap="" class="moz-quote-pre"> Also, despite the x86
original havinbg it like this - generally no full stops please if log
messages. "VMID generation overrun; disabling VMIDs\n" would do.</pre>
    </blockquote>
    <pre>Sure, I will drop it and will try to not add it in such cases. But could you
please remind (if I asked that before) me what is the reason why full stop
shouldn't be presented in such cases?

</pre>
    <blockquote type="cite"
      cite="mid:7e9671b3-6972-45b8-9cba-4447fa802fe2@suse.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+bool vmid_handle_vmenter(struct vcpu_vmid *vmid)
+{
+    struct vmid_data *data = &amp;this_cpu(vmid_data);
+
+    /* Test if VCPU has valid VMID. */
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">x86 has a -&gt;disabled check up from here; why do you not check -&gt;used?</pre>
    </blockquote>
    <pre>The x86 comment confused me, at first I thought the check was related to
erratum #170, but now I see that it might actually be useful here, so I'll add:
    if ( !data-&gt;used )
        goto disabled;

Thanks.

~ Oleksii</pre>
  </body>
</html>

--------------ihJQpW5AIiAsY4FgPUKoUE3H--


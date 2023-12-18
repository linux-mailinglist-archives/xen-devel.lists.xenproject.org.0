Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DAF817711
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 17:12:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656217.1024302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGDr-0002rI-OY; Mon, 18 Dec 2023 16:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656217.1024302; Mon, 18 Dec 2023 16:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFGDr-0002pc-LO; Mon, 18 Dec 2023 16:12:03 +0000
Received: by outflank-mailman (input) for mailman id 656217;
 Mon, 18 Dec 2023 16:12:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFGDq-0002pP-92
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 16:12:02 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c7f89d5-9dc0-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 17:12:00 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so32237125e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 08:12:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c1d0f00b003feae747ff2sm45417784wms.35.2023.12.18.08.11.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 08:11:59 -0800 (PST)
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
X-Inumbo-ID: 2c7f89d5-9dc0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702915920; x=1703520720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shGVjf43tMOH73NeyaHX2b3j/JcOM4HvLfHH0Zbub5s=;
        b=WoA9PYxUOR/l0TClR4DU01JwxNlshTDBbgc1FfIFOfpcMY3lJhaKfHXUgO//vZbPAm
         Xlv1nx5rJBnapb/7BxTQjk5CDe2HJrKyFJQYp09zOxdOr4QEEe7SnRTGdVoWJ++gy/h/
         +UWfChpKbdJx32vWN1ESjDPW528S0jFO5kVI1Hbip6leWDxZvznl3G8mcW5rH6zuq4T3
         9rnlCiXC6h1Q2D69qC3E85Z6BJQm/jiUXXR4sdYdFy+WpBAf+OqHaDpXBcNfq+43eV5f
         mUYUcrFAEuvIeadaWQb05DOcG5190iqgWK2fyXafgHwSYoETWM2wjR0B0t0muXdpO419
         FyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915920; x=1703520720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shGVjf43tMOH73NeyaHX2b3j/JcOM4HvLfHH0Zbub5s=;
        b=dMFYSPrGbKOSRMjWJA/kc/2zHiD2ukL5/Qt7zPMgN3Plj3FRmEn4UGvX6VsSQ3pdX8
         dlMEsBCcq4fN0WOFW6+BcWK5XzPpHHieccU60h4EB+WTVrAWvjB/f+2gQu4fd1ebgm4O
         rAHDa9+FBVcGoK4lYtxpK3LNQVXhT9+fzkXvhrvoB6QiEDm15xiIqv6Pl8/RYG8wW4iK
         eZC+Cb+09WOlERha2oXDoqPiKHoHtYBEKdzkkxaR9G/chS++fskb8E2Cmxn9zyizTdwv
         AA0ePn3lTu18xoqdz0XPC74LlQ1uejUhsKF05tPNirxpGYSU4vY4/fbPlv8axWgVbFao
         hibQ==
X-Gm-Message-State: AOJu0YzvLPP3/A34N87uHL80awH7cVWCf68DZbH880Ttv/gwwb1ZuwNr
	CoaevmYcBB0sV30d4NWMA2Kf
X-Google-Smtp-Source: AGHT+IEP3Ta/JZi0q9mB+NtoZBEpKWXWOpj3lGoXT9G8Rc7gku3gvnbpaeJDiGCW0CknACLHw4SbCg==
X-Received: by 2002:a7b:cb95:0:b0:40c:1946:be03 with SMTP id m21-20020a7bcb95000000b0040c1946be03mr9348616wmi.111.1702915919701;
        Mon, 18 Dec 2023 08:11:59 -0800 (PST)
Message-ID: <f7217f06-05e0-4091-8b9a-ee33adad69ff@suse.com>
Date: Mon, 18 Dec 2023 17:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] x86: limit issuing of IBPB during context switch
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <29e2b527-16b8-e72d-f625-781aedf21bc4@suse.com> <ZYBi83-LWEwywUuD@macbook>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ZYBi83-LWEwywUuD@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 16:19, Roger Pau Monné wrote:
> On Tue, Feb 14, 2023 at 05:11:40PM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -2005,17 +2005,26 @@ void context_switch(struct vcpu *prev, s
>>      }
>>      else
>>      {
>> +        unsigned int feat_sc_rsb = X86_FEATURE_SC_RSB_HVM;
>> +
>>          __context_switch();
>>  
>>          /* Re-enable interrupts before restoring state which may fault. */
>>          local_irq_enable();
>>  
>>          if ( is_pv_domain(nextd) )
>> +        {
>>              load_segments(next);
>>  
>> +            feat_sc_rsb = X86_FEATURE_SC_RSB_PV;
>> +        }
>> +
>>          ctxt_switch_levelling(next);
>>  
>> -        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
>> +        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
>> +             (!(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) ||
>> +              /* is_idle_domain(prevd) || */
> 
> I would rather add a comment to note that the idle domain always has
> SCF_entry_ibpb clear, rather than leaving this commented check in the
> condition.
> 
>> +              !boot_cpu_has(feat_sc_rsb)) )

Oh, for completeness: For v5 I have this

@@ -2092,17 +2092,26 @@ void context_switch(struct vcpu *prev, s
     }
     else
     {
+        unsigned int feat_sc_rsb = X86_FEATURE_SC_RSB_HVM;
+
         __context_switch();
 
         /* Re-enable interrupts before restoring state which may fault. */
         local_irq_enable();
 
         if ( is_pv_domain(nextd) )
+        {
             load_segments(next);
 
+            feat_sc_rsb = X86_FEATURE_SC_RSB_PV;
+        }
+
         ctxt_switch_levelling(next);
 
-        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
+        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
+             (!(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) ||
+              /* is_idle_domain(prevd) || */
+              (!cpu_has_auto_ibrs && !boot_cpu_has(feat_sc_rsb))) )
         {
             static DEFINE_PER_CPU(unsigned int, last);
             unsigned int *last_id = &this_cpu(last);

i.e. with the cpu_has_auto_ibrs check added.

Jan


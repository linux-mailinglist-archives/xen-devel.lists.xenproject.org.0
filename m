Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3D0CFADEB
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 21:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196477.1514284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdDON-0000SI-Gg; Tue, 06 Jan 2026 20:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196477.1514284; Tue, 06 Jan 2026 20:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdDON-0000Q7-Dk; Tue, 06 Jan 2026 20:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1196477;
 Tue, 06 Jan 2026 20:10:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xx60=7L=gmail.com=akmarkov45@srs-se1.protection.inumbo.net>)
 id 1vdDOL-0000Q1-SX
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 20:10:58 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea886b0-eb3b-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 21:10:56 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-59b679cff1fso692290e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 12:10:55 -0800 (PST)
Received: from [192.168.1.66] (95-24-239-83.broadband.corbina.ru.
 [95.24.239.83]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6a2c02fcsm516228e87.33.2026.01.06.12.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 12:10:53 -0800 (PST)
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
X-Inumbo-ID: cea886b0-eb3b-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767730254; x=1768335054; darn=lists.xenproject.org;
        h=in-reply-to:cc:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3UTB1lNTQeoNfnkSkfwz+TsiIQzBrduP5eAxBGpTQs=;
        b=gKEz0TsTgksrlsggf3QVaxl+NA/NtlXzBN5tLNDI8Zx1VvWYTz5BXGBxP2YRfsJ3Ja
         YrTtIcz2DXWyPKaMOskkubNbGKciiYLuCV/h+Ze6DUEEW+Ofwe6AkWBfBfy+SohQsXiM
         tvqD/NADb+J9SzD2YL+21XcE/gUYQ7/NKi8h/C0qgqHwi03hYwLWTLC8gBH9a/8J9NPe
         AuD/UyEyZvGTcqHUVwbsyA1iiCpa1IUqu/pOgXcrHbyza2j5yBxxvOYGs0W7b5jriYBl
         40kW+fwY1fGVvaPajbPAXnZhw8aRihkgPbDdW8UUT7j7lf8VUx2eLKsSxLhCjyphTZpb
         kPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767730254; x=1768335054;
        h=in-reply-to:cc:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3UTB1lNTQeoNfnkSkfwz+TsiIQzBrduP5eAxBGpTQs=;
        b=c2lnFPNuRIY8T9dHxTYhsT8ktVTS8VSgAftw05HbUfNTnRDbzOQ8X2/gCfnm+ccf4g
         0jZsjxZMLidpLpNqpH7pj4Dgf7PX+0PECRep8WP8235uvMGXfKLq+re9U915v56tzt4r
         8EH1cNQAJYRyroFoTsqL2X17SjmGzWcc/fIdHtBuMrbQzmQYU3BRdFPoRAq4U24sjPn9
         ua3zQbRkfS34xGOyNQnLMi9TeHnOolTRIJ2k6b5IjiWikW0sqrMZuQRrfN7wGpynRR5c
         xHwn7pCuFKrwjvXH0G9u0Q7CX1ClWlk1vlPZR0a9IrIE6J/lEVDC/BNaR5AIYNnXwZUO
         5HZw==
X-Gm-Message-State: AOJu0YyjC1uUxi3xMGF3IokE8fewcSUXZGjNNWW3smJNEIcTttoqFkxX
	5kC7NJZBi1KBGopxSa8eaU2QemP5+vrUYakdvVqVXi1cmnTptrw0YxJq9M8S7yS1iwA=
X-Gm-Gg: AY/fxX5tcshyV3XcU/BgNxreW8yO9rQgB23sIOpKa/yAc38jbtsjDPgaYk/psb09/AN
	RWQBkVVYJrCDmmqN+v52QCP9SktR3o7iYUJc+K+deAB9Piw/ZPz5QXaCtrAooNRzacJbCBSYKkO
	YFcaN6ERXo3MHrjbrUWVqYUfMyh7byiDjZPvAPCcIAbdQ07pdGImEnsy+UMRN2omJjbjSRgBaiS
	UF0IyhWPCeVl0f6idjwAXKUi7NV7nSxuwH3FJS1w6u2Nnp324q3HIl6oaRG+R/k89BfwgOQVp3N
	pXzZl1Iui8Bq7Zjol3QcfIRvUZxDoOcx2HBafQYpo3H3eOYzjY6XmXEbj2dacA9fEMDnhBznJwY
	DFI+vyhjmxsDhg3xmSBQF5O1AVr88rcTiHhFSyKG0/2SOvRiMG0qUwGuaCBiKpi6P8Enx/jSRkt
	/c0ptEuRj6Fr6z39fWqtB4FWlpzheBst0GmG4qO0LAiiWaGpr4t5Y47yv1Nb0K
X-Google-Smtp-Source: AGHT+IHwnilKl5BndLuLZeNs0nq1DIFFkNMYA/jKYARJ6qW7pJolE5NLSvbiM/4fJQ8g0MVzZIaJmA==
X-Received: by 2002:ac2:4e12:0:b0:597:cf12:bea6 with SMTP id 2adb3069b0e04-59b6f043818mr60073e87.48.1767730253926;
        Tue, 06 Jan 2026 12:10:53 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------aYSA0nJRu5if1P0AvfxZyP59"
Message-ID: <4a6b6307-9014-4c4c-8c23-3673efa2d1b1@gmail.com>
Date: Tue, 6 Jan 2026 23:10:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] x86/time: deal with negative deltas in get_s_time_fixed()
To: xen-devel@lists.xenproject.org
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
 <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>
Content-Language: ru
From: =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com
In-Reply-To: <1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com>

This is a multi-part message in MIME format.
--------------aYSA0nJRu5if1P0AvfxZyP59
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, I'm not sure about the other places. In hvm_load_cpu_ctxt 
(xen/arch/x86/hvm/hvm.c ), it was easy to catch because 
process_pending_softirqs is frequently called there, which in turn 
processes softirqs from the timer (where the timestamp is updated). 
After I fixed sync_tsc in hvm_load_cpu_ctxt, the problem stopped 
reproducing under no load. However, when the number of vCPUs is 4 times 
greater than the number of CPUs (under heavy load), the problem rarely 
reoccurs (mostly during snapshot restores during 
process_pending_softirqs calls), and this is no longer a simple case. If 
get_s_time_fixed can indeed be interrupted during execution after 
rdtsc_ordered, then the current fix is ​​insufficient. It's necessary to 
atomically copy "t->stamp" to the stack using local_irq_disable and 
local_irq_enable (as in local_time_calibration), and then work with the 
copy, confident in its lifetime and immutability. But until 
get_s_time_fixed is proven to be interruptible, this is premature, so 
your fix is ​​sufficient. I think I need more information and testing to 
say more.

Regarding the other scale_delta calls, if they include values 
​​calculated from externally saved tsc values ​​that could have become 
stale during the process_pending_softirqs call, this definitely needs to 
be fixed.

Here's the problematic code from dwm.exe, if that helps:

void __fastcall 
CPartitionVerticalBlankScheduler::UpdateCurrentTime(CPartitionVerticalBlankScheduler 
*this) {
     uint64_t *xor_time_ptr = (uint64_t *)((char *)this + 0x3E40);
     CPartitionVerticalBlankScheduler *scheduler = this;
     LARGE_INTEGER *current_time_ptr = (LARGE_INTEGER *)((char *)this + 
0x3E30);
     uint64_t previous_time = *((_QWORD *)this + 0x7C6); // 0x3e30
     uint64_t address_high = ((_QWORD)this + 0x3E40) << 32;
     uint64_t xor_key = ((uint64_t)this + 0x3E40) | address_high;

     // validate internal state
     if ((previous_time ^ xor_key) != *((_QWORD *)this + 0x7C8)) { // 0x3e40
         char exception_record[0x98];
         memset(exception_record, 0, sizeof(exception_record));
         *(int *)exception_record = 0x88980080; // MILERR_INTERNALERROR

         uint64_t computed_xor = *xor_time_ptr ^ ((uint64_t)xor_time_ptr 
| address_high);
         int param_count = 4;
         int previous_time_high = (int)(previous_time >> 32);
         uint32_t previous_time_low = (uint32_t)previous_time;
         int computed_xor_high = (int)(computed_xor >> 32);
         uint32_t computed_xor_low = (uint32_t)computed_xor;

RaiseFailFastException((PEXCEPTION_RECORD)exception_record, nullptr, 0);
         previous_time = *((_QWORD *)scheduler + 1990);
     }

     // get current timestamp
     *((_QWORD *)scheduler + 0x7C7) = previous_time; // 0x3e38
     QueryPerformanceCounter(current_time_ptr);

     LARGE_INTEGER new_time = *current_time_ptr;
     uint64_t last_previous_time = *((_QWORD *)scheduler + 0x7C7); // 0x3e38

     // check if time go backward
     if (new_time.QuadPart < last_previous_time) {
         char exception_record[0x98];
         memset(exception_record, 0, sizeof(exception_record));
         *(int *)exception_record = 0x8898009B; // 
MILERR_QPC_TIME_WENT_BACKWARD

         int new_time_high = new_time.HighPart;
         uint32_t new_time_low = new_time.LowPart;
         int last_previous_high = (int)(last_previous_time >> 32);
         uint32_t last_previous_low = (uint32_t)last_previous_time;
         int frequency_high = g_qpcFrequency.HighPart;
         uint32_t frequency_low = g_qpcFrequency.LowPart;

         int64_t time_delta = last_previous_time - new_time.QuadPart;
         int64_t millis_delta = (1000 * time_delta) / 
g_qpcFrequency.QuadPart;
         int millis_high = (int)(millis_delta >> 32);
         uint32_t millis_low = (uint32_t)millis_delta;

         int param_count = 8;

RaiseFailFastException((PEXCEPTION_RECORD)exception_record, nullptr, 0);
         new_time = *(LARGE_INTEGER *)((char *)scheduler + 15920);
     }

     *xor_time_ptr = new_time.QuadPart ^ xor_key;
}

Thanks.

06.01.2026 16:58, Jan Beulich пишет:
> Callers may pass in TSC values from before the local TSC stamp was last
> updated (this would in particular be the case when the TSC was latched, a
> time rendezvous occurs, and the latched value is used only afterwards).
> scale_delta(), otoh, deals with unsigned values, and hence would treat
> negative incoming deltas as huge positive values, yielding entirely bogus
> return values.
>
> Fixes: 88e64cb785c1 ("x86/HVM: use fixed TSC value when saving or restoring domain")
> Reported-by: Антон Марков<akmarkov45@gmail.com>
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> ---
> An alternative might be to have scale_delta() deal with signed deltas, yet
> that seemed more risky to me.
>
> There could likely be more Fixes: tags; the one used is the oldest
> applicable one, from what I can tell.
>
> A similar issue looks to exist in read_xen_timer() and its read_cycle()
> helper, if we're scheduled out (and beck in) between reading of the TSC
> and calculation of the delta (involving ->tsc_timestamp). Am I
> overlooking anything there?
>
> stime2tsc() guards against negative deltas by using 0 instead; I'm not
> quite sure that's correct either.
>
> amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
> comment towards the TSC being "sane", but is that correct? Due to
> TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
> wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
> calling tsc_ticks2ns()?
>
> A similar issue looks to exist in tsc_get_info(), again when rdtsc()
> possibly returns a huge value due to TSC_ADJUST. Once again I wonder
> whether we shouldn't subtract boot_tsc_stamp.
>
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1649,8 +1649,13 @@ s_time_t get_s_time_fixed(u64 at_tsc)
>           tsc = at_tsc;
>       else
>           tsc = rdtsc_ordered();
> -    delta = tsc - t->stamp.local_tsc;
> -    return t->stamp.local_stime + scale_delta(delta, &t->tsc_scale);
> +
> +    if ( tsc >= t->stamp.local_tsc )
> +        delta = scale_delta(tsc - t->stamp.local_tsc, &t->tsc_scale);
> +    else
> +        delta = -scale_delta(t->stamp.local_tsc - tsc, &t->tsc_scale);
> +
> +    return t->stamp.local_stime + delta;
>   }
>   
>   s_time_t get_s_time(void)
>
--------------aYSA0nJRu5if1P0AvfxZyP59
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">Hi, I'm not sure
            about the other places.</span></span> <span
          class="jCAhz ChMk0b"><span class="ryNqvb">In hvm_load_cpu_ctxt
            (xen/arch/x86/hvm/hvm.c ), it was easy to catch because
            process_pending_softirqs is frequently called there, which
            in turn processes softirqs from the timer (where the
            timestamp is updated).</span></span> <span
          class="jCAhz ChMk0b"><span class="ryNqvb">After I fixed
            sync_tsc in hvm_load_cpu_ctxt, the problem stopped
            reproducing under no load.</span></span> <span
          class="jCAhz ChMk0b"><span class="ryNqvb">However, when the
            number of vCPUs is 4 times greater than the number of CPUs
            (under heavy load), the problem rarely reoccurs (mostly
            during snapshot restores during process_pending_softirqs
            calls), and this is no longer a simple case.</span></span> <span
          class="jCAhz ChMk0b"><span class="ryNqvb">If get_s_time_fixed
            can indeed be interrupted during execution after
            rdtsc_ordered, then the current fix is ​​insufficient. It's
            necessary to atomically copy "t-&gt;stamp" to the stack
            using local_irq_disable and
            local_irq_enable (as in local_time_calibration), and then
            work with the copy, confident in its lifetime and
            immutability.</span></span> <span class="jCAhz ChMk0b"><span
            class="ryNqvb">But until get_s_time_fixed is proven to be
            interruptible, this is premature, so your fix is
            ​​sufficient.</span></span> <span class="jCAhz ChMk0b"><span
            class="ryNqvb">I think I need more information and testing
            to say more.</span></span><span class="jCAhz ChMk0b"><span
            class="ryNqvb"> </span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb"><br>
          </span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">Regarding the other
            scale_delta calls, if they include values ​​calculated from
            externally saved tsc values ​​that could have become stale
            during the process_pending_softirqs call, this definitely
            needs to be fixed.</span></span><span class="jCAhz ChMk0b"><span
            class="ryNqvb"> </span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb"><br>
          </span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">Here's the
            problematic code from dwm.exe, if that helps:</span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb"><br>
          </span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">void __fastcall
CPartitionVerticalBlankScheduler::UpdateCurrentTime(CPartitionVerticalBlankScheduler
            *this) {<br>
                uint64_t *xor_time_ptr = (uint64_t *)((char *)this +
            0x3E40);<br>
                CPartitionVerticalBlankScheduler *scheduler = this;<br>
                LARGE_INTEGER *current_time_ptr = (LARGE_INTEGER
            *)((char *)this + 0x3E30);<br>
                uint64_t previous_time = *((_QWORD *)this + 0x7C6); //
            0x3e30<br>
                uint64_t address_high = ((_QWORD)this + 0x3E40) &lt;&lt;
            32;<br>
                uint64_t xor_key = ((uint64_t)this + 0x3E40) |
            address_high;<br>
            <br>
                // validate internal state<br>
                if ((previous_time ^ xor_key) != *((_QWORD *)this +
            0x7C8)) { // 0x3e40<br>
                    char exception_record[0x98];<br>
                    memset(exception_record, 0,
            sizeof(exception_record));<br>
                    *(int *)exception_record = 0x88980080; //
            MILERR_INTERNALERROR<br>
            <br>
                    uint64_t computed_xor = *xor_time_ptr ^
            ((uint64_t)xor_time_ptr | address_high);<br>
                    int param_count = 4;<br>
                    int previous_time_high = (int)(previous_time
            &gt;&gt; 32);<br>
                    uint32_t previous_time_low =
            (uint32_t)previous_time;<br>
                    int computed_xor_high = (int)(computed_xor &gt;&gt;
            32);<br>
                    uint32_t computed_xor_low = (uint32_t)computed_xor;<br>
            <br>
                   
            RaiseFailFastException((PEXCEPTION_RECORD)exception_record,
            nullptr, 0);<br>
                    previous_time = *((_QWORD *)scheduler + 1990);<br>
                }<br>
            <br>
                // get current timestamp<br>
                *((_QWORD *)scheduler + 0x7C7) = previous_time; //
            0x3e38<br>
                QueryPerformanceCounter(current_time_ptr);<br>
            <br>
                LARGE_INTEGER new_time = *current_time_ptr;<br>
                uint64_t last_previous_time = *((_QWORD *)scheduler +
            0x7C7); // 0x3e38<br>
            <br>
                // check if time go backward<br>
                if (new_time.QuadPart &lt; last_previous_time) {<br>
                    char exception_record[0x98];<br>
                    memset(exception_record, 0,
            sizeof(exception_record));<br>
                    *(int *)exception_record = 0x8898009B; //
            MILERR_QPC_TIME_WENT_BACKWARD<br>
            <br>
                    int new_time_high = new_time.HighPart;<br>
                    uint32_t new_time_low = new_time.LowPart;<br>
                    int last_previous_high = (int)(last_previous_time
            &gt;&gt; 32);<br>
                    uint32_t last_previous_low =
            (uint32_t)last_previous_time;<br>
                    int frequency_high = g_qpcFrequency.HighPart;<br>
                    uint32_t frequency_low = g_qpcFrequency.LowPart;<br>
            <br>
                    int64_t time_delta = last_previous_time -
            new_time.QuadPart;<br>
                    int64_t millis_delta = (1000 * time_delta) /
            g_qpcFrequency.QuadPart;<br>
                    int millis_high = (int)(millis_delta &gt;&gt; 32);<br>
                    uint32_t millis_low = (uint32_t)millis_delta;<br>
            <br>
                    int param_count = 8;<br>
            <br>
                   
            RaiseFailFastException((PEXCEPTION_RECORD)exception_record,
            nullptr, 0);<br>
                    new_time = *(LARGE_INTEGER *)((char *)scheduler +
            15920);<br>
                }<br>
            <br>
                *xor_time_ptr = new_time.QuadPart ^ xor_key;<br>
            }<br>
            <br>
          </span></span></span></div>
    <div class="lRu31" dir="ltr"><span class="HwtZe" lang="en"><span
          class="jCAhz ChMk0b"><span class="ryNqvb">Thanks.</span></span></span><span
        class="ZSCsVd"></span></div>
    <div aria-hidden="true" class="UdTY9 WdefRb" data-location="2">
      <div class="kO6q6e"><br>
      </div>
    </div>
    <p></p>
    <div class="moz-cite-prefix">06.01.2026 16:58, Jan Beulich пишет:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1f539879-3083-41d5-a2c5-c63c9161f0bf@suse.com">
      <pre wrap="" class="moz-quote-pre">Callers may pass in TSC values from before the local TSC stamp was last
updated (this would in particular be the case when the TSC was latched, a
time rendezvous occurs, and the latched value is used only afterwards).
scale_delta(), otoh, deals with unsigned values, and hence would treat
negative incoming deltas as huge positive values, yielding entirely bogus
return values.

Fixes: 88e64cb785c1 ("x86/HVM: use fixed TSC value when saving or restoring domain")
Reported-by: Антон Марков <a class="moz-txt-link-rfc2396E" href="mailto:akmarkov45@gmail.com">&lt;akmarkov45@gmail.com&gt;</a>
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
An alternative might be to have scale_delta() deal with signed deltas, yet
that seemed more risky to me.

There could likely be more Fixes: tags; the one used is the oldest
applicable one, from what I can tell.

A similar issue looks to exist in read_xen_timer() and its read_cycle()
helper, if we're scheduled out (and beck in) between reading of the TSC
and calculation of the delta (involving -&gt;tsc_timestamp). Am I
overlooking anything there?

stime2tsc() guards against negative deltas by using 0 instead; I'm not
quite sure that's correct either.

amd_check_erratum_1474() (next to its call to tsc_ticks2ns()) has a
comment towards the TSC being "sane", but is that correct? Due to
TSC_ADJUST, rdtsc() may well return a huge value (and the TSC would then
wrap through 0 at some point). Shouldn't we subtract boot_tsc_stamp before
calling tsc_ticks2ns()?

A similar issue looks to exist in tsc_get_info(), again when rdtsc()
possibly returns a huge value due to TSC_ADJUST. Once again I wonder
whether we shouldn't subtract boot_tsc_stamp.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1649,8 +1649,13 @@ s_time_t get_s_time_fixed(u64 at_tsc)
         tsc = at_tsc;
     else
         tsc = rdtsc_ordered();
-    delta = tsc - t-&gt;stamp.local_tsc;
-    return t-&gt;stamp.local_stime + scale_delta(delta, &amp;t-&gt;tsc_scale);
+
+    if ( tsc &gt;= t-&gt;stamp.local_tsc )
+        delta = scale_delta(tsc - t-&gt;stamp.local_tsc, &amp;t-&gt;tsc_scale);
+    else
+        delta = -scale_delta(t-&gt;stamp.local_tsc - tsc, &amp;t-&gt;tsc_scale);
+
+    return t-&gt;stamp.local_stime + delta;
 }
 
 s_time_t get_s_time(void)

</pre>
    </blockquote>
  </body>
</html>

--------------aYSA0nJRu5if1P0AvfxZyP59--


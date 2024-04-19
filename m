Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5968AAB6F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 11:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708885.1108061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxkVh-00021G-RU; Fri, 19 Apr 2024 09:26:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708885.1108061; Fri, 19 Apr 2024 09:26:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxkVh-0001yF-Nx; Fri, 19 Apr 2024 09:26:21 +0000
Received: by outflank-mailman (input) for mailman id 708885;
 Fri, 19 Apr 2024 09:26:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxkVg-0001y5-0l
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 09:26:20 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e00318a5-fe2e-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 11:26:17 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d858501412so24429091fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 02:26:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b0041896d2a05fsm5716638wmq.5.2024.04.19.02.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 02:26:16 -0700 (PDT)
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
X-Inumbo-ID: e00318a5-fe2e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713518777; x=1714123577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mptRQuyZhRf0D9CPACR8baOYEH+BNXM9LR+CiGhVZ9U=;
        b=f6QbdppTP2s3k/92B4Ec8yIki9+7BTUQ+U9PYVstvCTnDhEUFUnqhnzGCf2tZc3Eme
         B3DMoH8TW/nzyBy+Jp29RB4cIeVaVFHR9kSJlAppdWXG1bUPEpNNetnZBAgPTOPh/wDe
         ZT1acOsUEClMnJbuSWHZ565ViCq1oMrf7qN2fDUearhnJz66xR1vdBwbbotu+4L1b4dp
         CGRTsLzQnn1edqMEKtqVzd3HeBWkkWipzPWz6vmyWR91CyIF7kYmJ0bPHiE4iQl2eLye
         LmOOpV6nyyXcaDmI3H/0I8fAgsXCe3uMnenNSLHojYGM6luC7UrnKV7k3ItScElW4Hw7
         6CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713518777; x=1714123577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mptRQuyZhRf0D9CPACR8baOYEH+BNXM9LR+CiGhVZ9U=;
        b=o/5oX69rMiXUozkDwV/UFAX6BkMcJgr4qYeC0MXm/CWi72VF5xqoRkdgOomLyJFzFR
         kqaZ2EYJ2BUhPu5rdXi41Cocr2T+ZonU3ZW//d3rpdCuIT5tSNXTbbWha0OsFFrGF0gF
         whoUR5P/l+YNoUHWYR3pwMIGDZQdwW4HpVGBpaW7fXP5rLI/XISKDD7qjXEmXYJX1+P1
         zLrki28ZXPRBdp4AD7zEN0nZr94RkaTJzK+j6c3fIiYX0Ig1U/EVWwZr0X96LrftatOC
         BPwW35b9/LXA+ecxZMM9+PlbsNmR+C3v2SEcM1LSqcTzI2VkEVp5S/cmq4J5IBasGmGN
         pzXA==
X-Forwarded-Encrypted: i=1; AJvYcCWzjsUOdnO1l8i8PUaaY1oS7rQW/H2rHWO0CVW0mFc/28/LoC3wouvL45gcHSG9HBJheOrf8+Bn9gdYr+6jhkv7vLKMbNtrWAdqA4wyHz8=
X-Gm-Message-State: AOJu0Ywe1LQd2tw4kfIHHn11CVpVNP6Vs+Hc3eMZ2vD5r5vmsljt7l9C
	x0baU7GVaK9faeiMSZOdFgWWNIb6N8bXsngVgT1I9P6qWUrrjb5+ZXZr9jm+3g==
X-Google-Smtp-Source: AGHT+IFl2+BK8MPT/bn7JLqcZRmPSSdAknTYWqVsU6M1znaRHXk42f047BqoRc42BScCfNyyl2i/GA==
X-Received: by 2002:a2e:8249:0:b0:2d9:f00c:d2d5 with SMTP id j9-20020a2e8249000000b002d9f00cd2d5mr879724ljh.46.1713518776931;
        Fri, 19 Apr 2024 02:26:16 -0700 (PDT)
Message-ID: <bcb3b5f9-7226-47ed-ada6-4ebcffa47b6e@suse.com>
Date: Fri, 19 Apr 2024 11:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/video: do not assume a video mode to be
 unconditionally present
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240328153523.4155-1-roger.pau@citrix.com>
 <20240328153523.4155-3-roger.pau@citrix.com>
 <87601c5e-2ee3-4d3f-b4eb-0f509bcf1c2b@suse.com> <ZiIgb4Wnv-GCOoyx@macbook>
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
In-Reply-To: <ZiIgb4Wnv-GCOoyx@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 09:42, Roger Pau Monné wrote:
> On Tue, Apr 02, 2024 at 11:49:20AM +0200, Jan Beulich wrote:
>> On 28.03.2024 16:35, Roger Pau Monne wrote:
>>> There's no reason to assume VGA text mode 3 to be unconditionally available.
>>> With the addition of booting Xen itself in PVH mode there's a boot path that
>>> explicitly short-circuits all the real-mode logic, including the VGA detection.
>>>
>>> Leave the default user selected mode as text mode 3 in boot_vid_mode, but do
>>> not populate boot_vid_info with any default settings.  It will either be
>>> populated by the real-mode video detection code, or left zeroed in case
>>> real-mode code is skipped.
>>>
>>> Note that only PVH skips the real-mode portion of the boot trampoline,
>>> otherwise the only way to skip it is to set `no-real-mode` on the command line,
>>> and the description for the option already notes that VGA would be disabled as
>>> a result of skipping real-mode bootstrap.
>>>
>>> This fixes Xen incorrectly reporting:
>>>
>>> (XEN) Video information:
>>> (XEN)  VGA is text mode 80x25, font 8x16
>>>
>>> When booted as a PVH guest.
>>
>> And what effect does this have on a bare-metal boot with no-real-mode in use?
>> The default on x86 hardware still is that in the absence of other information,
>> a VGA of some kind can be assumed to be there. Yes, there are headless
>> systems, but better assume VGA is there when there's not than the other way
>> around.
> 
> But that contradicts the text of the 'no-real-mode' option, which
> explicitly notes:
> 
> "Do not execute real-mode bootstrap code when booting Xen. This option
> should not be used except for debugging. It will effectively disable
> the vga option, which relies on real mode to set the video mode."

Well. Even without setting a video mode, _some_ mode is set (by firmware) as
long as there is a VGA. In the absence of a "vga=" option iirc we'd retrieve
that setting, unless we're not allowed to by "no-real-mode". In which case,
as indicated, we may still be better off guessing a basic mode than kind of
suggesting the absence of any VGA.

Besides, when booting from EFI vga= is respected despite not going through
real mode. So the quoted text isn't quite right anyway.

Jan

>> What I would have expected is for the PVH boot path to clear boot_vid_info.
> 
> Well, my intention was to fix both PVH and also make the
> implementation of the 'no-real-mode' option consistent with the
> documentation.
> 
> Thanks, Roger.



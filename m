Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB3CF74B3
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 09:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195869.1513753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2NV-0006zl-0c; Tue, 06 Jan 2026 08:25:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195869.1513753; Tue, 06 Jan 2026 08:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd2NU-0006we-Tw; Tue, 06 Jan 2026 08:25:20 +0000
Received: by outflank-mailman (input) for mailman id 1195869;
 Tue, 06 Jan 2026 08:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd2NT-0006wY-OB
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 08:25:19 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3af73827-ead9-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 09:25:16 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so5633975e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 00:25:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f703a8csm29200215e9.13.2026.01.06.00.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:25:15 -0800 (PST)
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
X-Inumbo-ID: 3af73827-ead9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767687916; x=1768292716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R4VKNmVVls93J6OR2UhGYpb0oYUKE4ugmobwaWTQuR8=;
        b=ehPngQhUu0wRnqntESfYAXbffELUTtO/eoX76kzRZOZXtXqJaeh6cj8GTQEtlsfzP2
         VjQkD8SXWEfahuxEw6a0Ru++B6aTB10hHwhe8+coJQR1JLiM/tmfeUsawQhpNiNnJFkW
         9Yc5d8VwBbrnzbydiU3bJnrpSSEouwqR9RpXpn/aBuB6PlQtSXphJnaUWvHHj6iRrSW6
         8ydw96dykknVQqMau9Olty4LNsoc1cI4+LAVxJEl9JWgFPnbyjQThtz2DInP6KLXvoae
         BUWZLOs1L9g+u+Bk/2NBL3QZOv16wBS/sGUjODdX98CC1IO4i+JJsJ5ZrREbbP0q2xDr
         3Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767687916; x=1768292716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4VKNmVVls93J6OR2UhGYpb0oYUKE4ugmobwaWTQuR8=;
        b=QGyp9XW4gRqJEQVsKLJ2pNnlc2xnRlnOm8yZJqGh90+Lcf7zMpzA6gvqMEDEuRfmp5
         gHyOc5Vt60q/Hzce10wo+cD7oxvzAsCJu182rqeZc7YzR7xrVyjLeVqw9K5Ky4xBG5eu
         SHHacYy1evpUOkcPvhWkkAKnEFu5IuAh/Khxby7rhgNq/PHXxZFJPVQc7sfwVldMfq0v
         iKB8V8W9UJZLxRGtx7Yw6gE4UM9U2Scq5shFZUP29lkrYT65DF68CuZJ7Geil0GR7T+A
         nuM5P5aBthnz10rUXD0DAXnimpxN1/6yLLN6bdKD8d0PfDAsOthmTqTK4VFxRjzzhmwh
         gWFw==
X-Gm-Message-State: AOJu0YzTu6GM1JMGm+EZgIxVeLPeP0LGcZ5VTU0PjT3iVb8wueT7nUfb
	LF3xkicI5QDja83MjE+3lzNG6jLm2/T7EEx5GY66lT/7q8s9BRjSrQUzviJ51crN6g==
X-Gm-Gg: AY/fxX6C6bGUAzdpnGS5n8mkeTQDAvoH5lsxnDvftmymDAjsni3prJAcjqPOANX/blG
	qR3M8l5eQmUBF75BKEFJLEwz2Gn12+fT2/hLIe+nPXWDmo2a4lFR6G9kUyPJg/fSUtMktgF/RF7
	qlAz+qWFKwjm8Xu2/NRS3TK16xaxABCkl9Fy8n1pByXizJR1+1MxssDgkWSVbDowZN6ilYcC0S3
	DWZ96gkrjGS3Jae+jZ/7Ab9lCJjL7u1jkL6sNQAgt4lQBrAmDZlL5PmbSPCU2xsE9HNltxfXAb8
	cpU6rYT1NpImyHZUGNxHFIj6NhXykNkVFOzybEKI9axgSo4Aw9dmDL0Rhp2GShtO7bzQN96m7Od
	p6Xa5o7IAKgp74zBMwTEXR6olEeuNyk+64CrduKnYMs2/zqyjxbF76nS/h99EmbQ0Xc7LotfB+5
	mM22V853leWphQqoT5VU5x2uDm7afDBqhru3jdFaaR1IzYajwa8hKRS/Sy3zpd0DNQV39KnQZg1
	fFZJxgz75CyBA==
X-Google-Smtp-Source: AGHT+IGyPTJy5z2RuQeqInH3J6Jdg8Y1GNDK48TdBWmFkBbTVeBzKIYIgoQJ+4D/mtIOgLOhKonQbg==
X-Received: by 2002:a05:600c:1384:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-47d7f066fcamr21839395e9.3.1767687916111;
        Tue, 06 Jan 2026 00:25:16 -0800 (PST)
Message-ID: <6f02aca2-eaca-48b8-a2f3-4afff42ad264@suse.com>
Date: Tue, 6 Jan 2026 09:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Cpufreq drivers not working on T480S
To: Jason Andryuk <jandryuk@gmail.com>, Milky <milky_way_303030@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <dg8zeLW4X3RWRJt-1jas5pAqHft5GbxYxS5mNwc4ONE8tDEruL1-5a_e-vQu1RdOUWsMXxKe_Igcewy2zcbnOfkaGVG7y6hXLcLd78HI1po=@proton.me>
 <CAKf6xpsN_RnY2dHnXKj_-UySf1z0auye2qy=KHOEhcBbZ1un9A@mail.gmail.com>
 <NqFx_tXl0Zmx2ft7YVNGodkDcUFK7nA8KWUQMjOmD0y4T5W3-sTcGxCt7ViSRObUeJog3069xTY0ODZIG5hrX-Th2MvE95dSze13MGQ2tOY=@proton.me>
 <CAKf6xpvtF_cE7vMb9JfsVLkYH1XRXZG3nj+QO_72-zKJ3Cxh9w@mail.gmail.com>
 <DkXw78UBxXYCLNKCoThGPM1kde5JwARo3NhWtlBBrrFtLFVTnwNlwDlZYzuNlSdAs9XzE0aDPqgt9dri9YKJULULBXwJLEcEgbLOgzkVSVU=@proton.me>
 <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CAKf6xptg+0KrsjrmLD1iZFuT411S+7Pz9-HSX8L-KwQFR8o3Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 02:03, Jason Andryuk wrote:
> On Tue, Dec 30, 2025 at 8:50 PM Milky <milky_way_303030@proton.me> wrote:
>> (Re-CC'ing the ML because I forgot by accident. Hopefully the quoted
>> sections provide sufficient context)
>>
>> On Tuesday, December 30th, 2025 at 10:44 AM, Jason Andryuk <jandryuk@gmail.com> wrote:
> 
>> As suggested, I added the debug parameters to the dom0 kernel. Before or
>> after `modprobe xen-acpi-processor dyndbg==pmf`, there is no useful
>> debug information that I could find, apart from the
>> `xen_acpi_processor:get_max_acpi_id` message as seen below.
>>
>> ```
>> # sudo dmesg | grep xen.acpi
>> [    2.282851] Kernel command line: placeholder root=/dev/mapper/qubes_dom0-root ro rd.luks.uuid=<...> rd.lvm.lv=qubes_dom0/root rd.lvm.lv=qubes_dom0/swap plymouth.ignore-serial-consoles 6.6.77-1.qubes.fc37.x86_64 x86_64 rhgb loglevel=9 "dyndbg=module xen_acpi_processor +p" "xen_acpi_processor.dyndbg=func * +p" rd.qubes.hide_all_usb
>> [    5.224092] xen_acpi_processor: Max ACPI ID: 6
> 
> You successfully turned on dyndbg to get that output, but there is no
> further output.  This makes me think something else is wrong and
> xen-acpi-processor doesn't upload anything.
> 
> The call here https://elixir.bootlin.com/linux/v6.18.2/source/drivers/xen/xen-acpi-processor.c#L557
> to
> https://elixir.bootlin.com/linux/v6.18.2/source/drivers/acpi/processor_perflib.c#L421
> goes into some acpi code.  Maybe there are other messages in dmesg
> around the same time?  Maybe you'd have to turn on more debugging to
> get them.
> 
>> # sudo lsmod | grep xen_acpi
>> <no output>
>>
>> # sudo modprobe xen-acpi-processor dyndbg==pmf
>> modprobe: ERROR: could not insert 'xen_acpi_processor': No such device
>> ```
> 
>>> Maybe also with Xen's command line try cpufreq=xen:no-hwp to disable
>>> HWP and see if the regular ACPI cpufreq driver works better.
>>>
>>> I'm thinking it's something where xen-acpi-processor didn't upload
>>> ACPI CPU data, which means cpufreq isn't running. That may also be
>>> why you see that bogus CPU frequency.
>>
>> After booting with `xen:no-hwp`, I wasn't sure how to check if the
>> regular ACPI cpufreq driver is operational. Is `xenpm` still the
>> correct way to query for CPU info? I've tried the following:
>>
>> ```
>> # sudo xl dmesg | grep -i hwp
>> (XEN) Command line: placeholder cpufreq=xen:no-hwp,verbose loglvl=all dom0_mem=min:1024M dom0_mem=max:4096M ucode=scan smt=off gnttab_max_frames=2048 gnttab_max_maptrack_frames=4096 no-real-mode edd=off
>> (XEN) HWP: 1 notify: 1 act-window: 1 energy-perf: 1 pkg-level: 0 peci: 0
>> (XEN) HWP: Hardware Duty Cycling (HDC) supported, enabled
>> (XEN) HWP: HW_FEEDBACK not supported
> 
> no-hwp failed to disable HWP.  But if there is no ACPI CPU data, it
> wouldn't work either.

There isn't any "no-hwp" option that we would recognize, is there? Iirc HWP
isn't enabled by default, so simply not saying "cpufreq=hwp" should disable
the driver? (I already found the original report confusing in this regard,
hence why I preferred to not reply so far. I wonder if there are local
patches in use.)

Jan


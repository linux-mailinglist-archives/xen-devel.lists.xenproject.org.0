Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326389681B8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787624.1197040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Oz-0005ut-F3; Mon, 02 Sep 2024 08:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787624.1197040; Mon, 02 Sep 2024 08:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2Oz-0005sh-AQ; Mon, 02 Sep 2024 08:27:09 +0000
Received: by outflank-mailman (input) for mailman id 787624;
 Mon, 02 Sep 2024 08:27:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl2Ox-0005sb-8g
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:27:07 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 234fc354-6905-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 10:27:06 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f406034874so46234861fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:27:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226ccff4bsm4983502a12.70.2024.09.02.01.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:27:04 -0700 (PDT)
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
X-Inumbo-ID: 234fc354-6905-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725265625; x=1725870425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GoTQn6I7MLQR2OJGJvDH0fCBD+On8v6yW8aWimVHlu0=;
        b=cna8v6LgBakcsmK090fk9Jz43qyFZ76R3LrRGCU6lk/MpstzYO2988LP4ShMPpFmxd
         2VtySYDlJ8vKJltPtCmsvXLtJS9yUcWytBkEe9ziUG5leh1XFtm8CBg5VeSGrxZECUzl
         nJhumOgRm5CoBh9eITcL71KHU4mh6NMiuhhjrz9akB6akA0bOAudV4VLr3w6cOTS9iw3
         kgKZOzvv4TNS2X4y/xva30ux6LovTjiW9dpVtSkTVLyirfr+NF7pRaJ7QMMJTDrYPp1s
         PxvkgRB1KiRNxOWERsYJJyKTeyjQxhYgwhjr+9sRFEh0X5kAF4QHWGYctQ/hNZ5LEVXA
         NI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265625; x=1725870425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoTQn6I7MLQR2OJGJvDH0fCBD+On8v6yW8aWimVHlu0=;
        b=bu70z2ZpXmW1Kl9nOEVo2KnZojRvCiD+OUPoJr5ck7qt9yMCYqdvtBdqqDYBUf2v8W
         rNjwXfOEMcLU89hMhLmmkYPpcYrKkgmmCOKg1Rddc/NxDUpG6nBslEigM3JyMBHayfuE
         GrOppYAPVbl3u2m6yYpS6OZO1rhEq7Ny0rqu7U1gxIDUSC5DMK9J84vdpbk7/1i7+RmM
         N1bHQrqcelrgzXsEzuJxFHlJokducWnuoNBYhixhlFFj/07ye3/uL3Pg7JbB3wR4/BHD
         a5+Hr+ti4k4ZQGKRs4Lfk8NmluSYWZ3IgSa6HrOSDrN1T6SIVnGQ4YHkwS04sHbZJA8q
         ZxPA==
X-Gm-Message-State: AOJu0YxKGnnjA5JXuA3tFxjqrrkqYi/MW/rACF6523HGtj82puFJm+SX
	wiR/wsp2AbZpPSnLYl5aIiey6wul1XoDNQsdc/bwmFWQ4dNzG0vu9oR0ZEJUjw==
X-Google-Smtp-Source: AGHT+IEwLEfijmDtXsHoPcDpNSl7DvNaGwt7qw+mxpHr37tyv8DMfYe24xTEeSuxpOgUSNmwY3MNGw==
X-Received: by 2002:a2e:9b50:0:b0:2f3:f2b6:6ccb with SMTP id 38308e7fff4ca-2f6106e5145mr68796801fa.26.1725265625094;
        Mon, 02 Sep 2024 01:27:05 -0700 (PDT)
Message-ID: <cb0177d9-f50c-4332-96b5-bcaec86d195a@suse.com>
Date: Mon, 2 Sep 2024 10:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen_netfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7
 results in crash
To: Arthur Borsboom <arthurborsboom@gmail.com>
References: <CALUcmUn2s-d-OS5MO-jsqPk+ReumV09V5PndN8VqqndSm=wTdQ@mail.gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <CALUcmUn2s-d-OS5MO-jsqPk+ReumV09V5PndN8VqqndSm=wTdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2024 10:54, Arthur Borsboom wrote:
> After upgrading kernel 6.9.10 to 6.10.7 all Xen PVH VM's became unavailable.
> Downgrading the kernel back to 6.9.10 makes the VM's work again.

I don't think I can help with the crash, but: How did you conclude it's
xen-netfront? The data you provide ...

> Snippet stack trace + kernel logs (good and bad) attached.
> 
> Sep 01 08:59:21 web3.aramgroup.com kernel: xen_netfront: Initialising Xen
> virtual ethernet driver
> Sep 01 08:59:21 web3.aramgroup.com systemd-udevd[248]: vfb-0: Worker [250]
> terminated by signal 9 (KILL).
> Sep 01 08:59:21 web3.aramgroup.com kernel: BUG: kernel NULL pointer
> dereference, address: 0000000000000060
> Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: supervisor read access in
> kernel mode
> Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: error_code(0x0000) -
> not-present page
> Sep 01 08:59:21 web3.aramgroup.com kernel: PGD 0 P4D 0
> Sep 01 08:59:21 web3.aramgroup.com kernel: Oops: Oops: 0000 [#1] PREEMPT
> SMP PTI
> Sep 01 08:59:21 web3.aramgroup.com kernel: CPU: 0 PID: 250 Comm:
> (udev-worker) Not tainted 6.10.7-arch1-1 #1
> 2b2df360fbb0436393dc89f6589e9eeea2964ecb
> Sep 01 08:59:21 web3.aramgroup.com kernel: RIP:
> 0010:video_is_primary_device+0x9/0x40
> Sep 01 08:59:21 web3.aramgroup.com kernel: Code: 48 89 d8 5b c3 cc cc cc cc
> 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3
> 0f 1e fa 0f 1f 44 00 00 <48> 81 7f 60 80 e3 54 90 74 07 31 c0 c3 cc cc cc
> cc 53 48 89 fb 48
> Sep 01 08:59:21 web3.aramgroup.com kernel: RSP: 0000:ffffbb06808d7a60
> EFLAGS: 00010246
> Sep 01 08:59:21 web3.aramgroup.com kernel: RAX: 0000000000000000 RBX:
> ffff90ca41367800 RCX: 0000000000000000
> Sep 01 08:59:21 web3.aramgroup.com kernel: RDX: 0000000000000000 RSI:
> 0000000000000246 RDI: 0000000000000000
> Sep 01 08:59:21 web3.aramgroup.com kernel: RBP: 0000000000000000 R08:
> 0000000000000060 R09: 0000000000000000
> Sep 01 08:59:21 web3.aramgroup.com kernel: R10: ffffbb06808d7a78 R11:
> 0000000000000006 R12: ffffbb06808d7a90
> Sep 01 08:59:21 web3.aramgroup.com kernel: R13: ffff90ca41367a88 R14:
> ffff90ca41367a60 R15: ffff90cb41330788
> Sep 01 08:59:21 web3.aramgroup.com kernel: FS:  000072bfd74c0880(0000)
> GS:ffff90ce33a00000(0000) knlGS:0000000000000000
> Sep 01 08:59:21 web3.aramgroup.com kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
> 0000000080050033
> Sep 01 08:59:21 web3.aramgroup.com kernel: CR2: 0000000000000060 CR3:
> 0000000001326002 CR4: 00000000003706f0
> Sep 01 08:59:21 web3.aramgroup.com kernel: DR0: 0000000000000000 DR1:
> 0000000000000000 DR2: 0000000000000000
> Sep 01 08:59:21 web3.aramgroup.com kernel: DR3: 0000000000000000 DR6:
> 00000000fffe0ff0 DR7: 0000000000000400
> Sep 01 08:59:21 web3.aramgroup.com kernel: Call Trace:
> Sep 01 08:59:21 web3.aramgroup.com kernel:  <TASK>
> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? __die_body.cold+0x19/0x27
> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? page_fault_oops+0x15a/0x2d0
> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? __kernfs_new_node+0x17d/0x200
> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? exc_page_fault+0x81/0x190
> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? asm_exc_page_fault+0x26/0x30
> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
> video_is_primary_device+0x9/0x40
> Sep 01 08:59:21 web3.aramgroup.com kernel:  do_fb_registered+0x100/0x110
> Sep 01 08:59:21 web3.aramgroup.com kernel:  fbcon_fb_registered+0x4d/0x70
> Sep 01 08:59:21 web3.aramgroup.com kernel:  register_framebuffer+0x198/0x2a0
> Sep 01 08:59:21 web3.aramgroup.com kernel:  xenfb_probe+0x30d/0x430
> [xen_fbfront 61323dae510a72b3d2c332a2b0273cf6365e9002]

... clearly points at xen-fbfront. And surely the people to help with that
is not the same set as those to help with a networking issue.

Jan


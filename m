Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7C5968232
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787638.1197060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2c9-0001Xt-Qf; Mon, 02 Sep 2024 08:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787638.1197060; Mon, 02 Sep 2024 08:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2c9-0001VX-NL; Mon, 02 Sep 2024 08:40:45 +0000
Received: by outflank-mailman (input) for mailman id 787638;
 Mon, 02 Sep 2024 08:40:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uQw9=QA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sl2c8-0001VR-7k
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:40:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09a6debc-6907-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:40:42 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a83597ce5beso638345566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:40:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c24sm524053666b.196.2024.09.02.01.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:40:41 -0700 (PDT)
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
X-Inumbo-ID: 09a6debc-6907-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725266441; x=1725871241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJwAWqQOipJUMsq9zHV70b5qiGqiDUj5DdejIzDaoFE=;
        b=Bq+oQZFotxn74C7s5J5R1Q5XT836mKMJaBKSd13/KKhoctyj3YLDAoPIn/KdGWbgRp
         jDEnoZB/ppYxihKdE0hbUbstSuogiyARTikXuXwnLk+SWmaonshwiCuZSKiBQ+TfiFm6
         5TYsuPGkxYZXeDOtRWA9X9yuY60ZquE1AGcckPBwDQK43FZgOUVGrav3FK5IdxnwxcxW
         DbEWp6AjUvs70HL5Y0qgS7ZpLmLLOqYCs17xJm/yA9qVrN4Ry3av58FDv8htx92TdHxp
         fHIB8dTMeGf1Q8I6W0lN6Eqy8GegBlrUmGpUsdGNG86mxRAlDtmkzw/GjT0pCQj9Dp95
         /YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725266441; x=1725871241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJwAWqQOipJUMsq9zHV70b5qiGqiDUj5DdejIzDaoFE=;
        b=nT4LsHFSU7sf7P6mLdc5OguASAiytJMS7QnDiB3Txn5igQ++VR1cZXkL0YHqhyXc0P
         qh+Q1L5eE6HbnUyZJjYxl2Vl41T7WkjoPoDuSYHc7o5ifVzBcF6Wl/a3mHyOH3rFgFya
         wwd/zevUFHfrhZP4X+k0o6xPwNqL/uu+sxnTf3gylXAq02oRrWvlTgAC39KTUMqk8UjB
         tgjOZCIOISS3hH7uYS8HsHELi9jRQWhqH7wRPODLjqP1hqJSxpZVW/pdTsWNTb/PHoXx
         /hCBTGVGdmbUllpAlUhfjKlR9L6Zjofqu3fCpOMpqJbYIoMPInc6e6lxB4F+D/wgbcLs
         Odjw==
X-Gm-Message-State: AOJu0YyN10ILU1Mf17J34vZ7xuPQX+MfO+s/tblvzhkapkupL5PrWq12
	Avau08SsJLg3h7aQC8s6Vr1zWhhjc2mPf2xIw+OSQLsIJC8/ViNxM/udhyAtXQ==
X-Google-Smtp-Source: AGHT+IFpbuU5/xvPYVC1Cm0dXuC/M+RTDftHbYlX9alEbCS9mQNXN+ryPyNT7uzQbAkFuo6WSHyeKA==
X-Received: by 2002:a17:907:d589:b0:a7a:c7f3:580d with SMTP id a640c23a62f3a-a89a2924ab3mr930142066b.25.1725266441396;
        Mon, 02 Sep 2024 01:40:41 -0700 (PDT)
Message-ID: <c1df267e-2d91-4510-85ed-80ade16a1a50@suse.com>
Date: Mon, 2 Sep 2024 10:40:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen_netfront] - Xen PVH VM: kernel upgrade 6.9.10 > 6.10.7
 results in crash
To: Arthur Borsboom <arthurborsboom@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <CALUcmUn2s-d-OS5MO-jsqPk+ReumV09V5PndN8VqqndSm=wTdQ@mail.gmail.com>
 <cb0177d9-f50c-4332-96b5-bcaec86d195a@suse.com>
 <CALUcmU=2LH9GnCGDgkcDKgXm+S8gbGDv3F7q+hgxCUK9azWXTQ@mail.gmail.com>
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
In-Reply-To: <CALUcmU=2LH9GnCGDgkcDKgXm+S8gbGDv3F7q+hgxCUK9azWXTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 10:32, Arthur Borsboom wrote:
> On Mon, 2 Sept 2024 at 10:27, Jan Beulich <jbeulich@suse.com> wrote:
> 
>> On 01.09.2024 10:54, Arthur Borsboom wrote:
>>> After upgrading kernel 6.9.10 to 6.10.7 all Xen PVH VM's became
>> unavailable.
>>> Downgrading the kernel back to 6.9.10 makes the VM's work again.
>>
>> I don't think I can help with the crash, but: How did you conclude it's
>> xen-netfront? The data you provide ...
>>
>>> Snippet stack trace + kernel logs (good and bad) attached.
>>>
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: xen_netfront: Initialising
>> Xen
>>> virtual ethernet driver
>>> Sep 01 08:59:21 web3.aramgroup.com systemd-udevd[248]: vfb-0: Worker
>> [250]
>>> terminated by signal 9 (KILL).
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: BUG: kernel NULL pointer
>>> dereference, address: 0000000000000060
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: supervisor read access
>> in
>>> kernel mode
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: #PF: error_code(0x0000) -
>>> not-present page
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: PGD 0 P4D 0
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: Oops: Oops: 0000 [#1] PREEMPT
>>> SMP PTI
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: CPU: 0 PID: 250 Comm:
>>> (udev-worker) Not tainted 6.10.7-arch1-1 #1
>>> 2b2df360fbb0436393dc89f6589e9eeea2964ecb
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: RIP:
>>> 0010:video_is_primary_device+0x9/0x40
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: Code: 48 89 d8 5b c3 cc cc
>> cc cc
>>> 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
>> f3
>>> 0f 1e fa 0f 1f 44 00 00 <48> 81 7f 60 80 e3 54 90 74 07 31 c0 c3 cc cc cc
>>> cc 53 48 89 fb 48
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: RSP: 0000:ffffbb06808d7a60
>>> EFLAGS: 00010246
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: RAX: 0000000000000000 RBX:
>>> ffff90ca41367800 RCX: 0000000000000000
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: RDX: 0000000000000000 RSI:
>>> 0000000000000246 RDI: 0000000000000000
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: RBP: 0000000000000000 R08:
>>> 0000000000000060 R09: 0000000000000000
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: R10: ffffbb06808d7a78 R11:
>>> 0000000000000006 R12: ffffbb06808d7a90
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: R13: ffff90ca41367a88 R14:
>>> ffff90ca41367a60 R15: ffff90cb41330788
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: FS:  000072bfd74c0880(0000)
>>> GS:ffff90ce33a00000(0000) knlGS:0000000000000000
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: CS:  0010 DS: 0000 ES: 0000
>> CR0:
>>> 0000000080050033
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: CR2: 0000000000000060 CR3:
>>> 0000000001326002 CR4: 00000000003706f0
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: DR0: 0000000000000000 DR1:
>>> 0000000000000000 DR2: 0000000000000000
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: DR3: 0000000000000000 DR6:
>>> 00000000fffe0ff0 DR7: 0000000000000400
>>> Sep 01 08:59:21 web3.aramgroup.com kernel: Call Trace:
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  <TASK>
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? __die_body.cold+0x19/0x27
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
>> page_fault_oops+0x15a/0x2d0
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
>> __kernfs_new_node+0x17d/0x200
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ? exc_page_fault+0x81/0x190
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
>> asm_exc_page_fault+0x26/0x30
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  ?
>>> video_is_primary_device+0x9/0x40
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  do_fb_registered+0x100/0x110
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:
>> fbcon_fb_registered+0x4d/0x70
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:
>> register_framebuffer+0x198/0x2a0
>>> Sep 01 08:59:21 web3.aramgroup.com kernel:  xenfb_probe+0x30d/0x430
>>> [xen_fbfront 61323dae510a72b3d2c332a2b0273cf6365e9002]
>>
>> ... clearly points at xen-fbfront. And surely the people to help with that
>> is not the same set as those to help with a networking issue.
> 
> My interpretation of the stack trace is wrong.
> 
> How can I get this to the right people?
> Shall I send another mail with [xen-fbfront] in the subject?

This may help. You may also be lucky to catch the attention without re-sending.
I can't really suggest which one's better; it's likely all up to you.

Jan


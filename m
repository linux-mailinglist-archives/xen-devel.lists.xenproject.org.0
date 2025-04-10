Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F786A83E3A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945077.1343345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2o2A-0004du-5U; Thu, 10 Apr 2025 09:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945077.1343345; Thu, 10 Apr 2025 09:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2o2A-0004aq-1l; Thu, 10 Apr 2025 09:17:18 +0000
Received: by outflank-mailman (input) for mailman id 945077;
 Thu, 10 Apr 2025 09:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2o28-0004ak-QU
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:17:16 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 982f10a8-15ec-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:17:16 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso4568985e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:17:15 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893773b6sm4160704f8f.27.2025.04.10.02.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:17:14 -0700 (PDT)
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
X-Inumbo-ID: 982f10a8-15ec-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744276635; x=1744881435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+mho9wvkejLlm6AszfDqYkJMQ0h1PNyKmhEcs9ot+UE=;
        b=JO6q8swQuzfmiWklQN0abZPxOGgx1ekuM47gmwMCAtw0QLRAe5D78pNf68G2UBeY4T
         owk6XrmMbpLWYbwC+LWdK1FeaeReq3l2gmqOmWoS8sOwq4ydmNGh/m15ebyZ50ceCsHK
         L1mIXRFodLFXzq6zHnoEzng9Z1123EhyiTaZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744276635; x=1744881435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mho9wvkejLlm6AszfDqYkJMQ0h1PNyKmhEcs9ot+UE=;
        b=XJr0+aJr+vKeMOarBMMgBjXnN/Hagmtw2vviHoQ++JxOaJYQaGeY7j7y5HoLp/UrHZ
         AB1rnYCg3zsyoPkhvkMTpaXQRAg7eEczoKmI9QQlRX70xgZmw/Ls+/5McWPwhkjn59mw
         OGBGSPZe22xl/g1JnrlrylG46xmhElmqmRtYct+/VzNr558t1aeZVi9CE2zPxT6OfiOd
         Px9fWQ47QKuX6Vddn+Fa88VGbY3MydK1BBi2LLunzC2RIFGnYiJFNcTX/d1q46Wlygb4
         Bks+NdzvPDHcU5dUB5zWxL+KgrtrJj6pnOcHszwPtudqdNYtKk9c324N63j0jR3UKYX1
         Kqjg==
X-Forwarded-Encrypted: i=1; AJvYcCVKsI2MSxi3f+WhRhB/ffjhfhk1HPLoyBAkzQNmnTEi7Y/2BJoK93ByHBeHGim/3I0JcH6594PmZng=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPx5u51xgMtmgBHOcg20hlputpamcbtFMF4/c3SB39QifstT26
	1opF9KiH9fXZ/6heSdINAnXezSQo5Fk3xWvNaZcwLaNi4PsoL21hahVoZvDgHTQ=
X-Gm-Gg: ASbGncuV0fN9nJmLwcjjLOONq7OWazO61kKmEwVTjlIh/Pnm6ywRQ7StgFX5FUiLgNF
	0MqsEN95WNDZII5iXcRTemKNh3pLpAY/w8mD11l8CkPKj7fV7z++5khM90pHGtcIpf9u+1YbC7i
	k9gHER1v5B4PI/ORZGWdbosCuVYI+X2lu8Ms7EYK5IsGoioeHvubsyVZmmuK37ISWRYK6Z9nTYB
	+uZae3M5xZcNoBFgo7ZdJMq2cjQd1mS+0Kl1hmY+cmTfRxaZn5/kd493y1jkEd3vYIpC3opOLEO
	8L67qB76ixTbKvv3rxB1hmobqjgNo9BWmZHYN93OaHpzQM0ZxW6jhR69AGxIY59xgcdatji16QX
	HuHtZNg==
X-Google-Smtp-Source: AGHT+IHU5miKtAVTMDa4h79t1oCR1l5nVpHTc/c98RAgghuEPjBYed+q5TjM3TWoKHrtQ+a6omnVdA==
X-Received: by 2002:a05:600c:34c2:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-43f2d7af675mr22818355e9.3.1744276635321;
        Thu, 10 Apr 2025 02:17:15 -0700 (PDT)
Message-ID: <5da1f4ec-43ca-4279-88dd-b51d57b306e4@citrix.com>
Date: Thu, 10 Apr 2025 10:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH TEST-ARTEFACTS 0/8] Cleanup and Linux ARM64 support
To: Jason Andryuk <jason.andryuk@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
 <828cabc9-512f-4c2f-a7d7-b9c8963c1300@citrix.com>
 <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f7b820af-b548-4dc3-9af7-9d2214a232b2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 1:09 am, Jason Andryuk wrote:
> On 2025-04-09 13:01, Andrew Cooper wrote:
>> On 09/04/2025 5:36 pm, Andrew Cooper wrote:
>>> Various bits of cleanup, and support for arm64 Linux builds.
>>>
>>> Run using the new Linux 6.6.86 on (most) x86, and ARM64:
>>>   
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1760667411
>>
>> Lovely, Linux 6.6.86 is broken for x86 PVH.  It triple faults very
>> early on.
>>
>> Sample log:
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9673797450
>>
>> I guess we'll have to stay on 6.6.56 for now.  (Only affects the final
>> patch.)
>
> This is an AMD system:
>
> (XEN) [    2.577549] d0v0 Triple fault - invoking HVM shutdown action 1
> (XEN) [    2.577557] RIP:    0008:[<0000000001f851d4>]
>
> The instruction:
> ffffffff81f851d4:       0f 01 c1                vmcall
>
> vmcall is the Intel instruction, and vmmcall is the AMD one, so CPU
> detection is malfunctioning.
>
> (Early PVH is running identity mapped, so it's offset from
> ffffffff80000000)
>
> There are no debug symbols in the vmlinux I extracted from the bzImage
> from gitlab, but I can repro locally with on 6.6.86.  It's unclear to
> me why it's failing.
>
> Trying:
> diff --git i/arch/x86/xen/enlighten.c w/arch/x86/xen/enlighten.c
> index 0219f1c90202..fb4ad7fe3e34 100644
> --- i/arch/x86/xen/enlighten.c
> +++ w/arch/x86/xen/enlighten.c
> @@ -123,11 +123,10 @@ noinstr void *__xen_hypercall_setfunc(void)
>         if (!boot_cpu_has(X86_FEATURE_CPUID))
>                 xen_get_vendor();
>
> -       if ((boot_cpu_data.x86_vendor == X86_VENDOR_AMD ||
> -            boot_cpu_data.x86_vendor == X86_VENDOR_HYGON))
> -               func = xen_hypercall_amd;
> -       else
> +       if (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
>                 func = xen_hypercall_intel;
> +       else
> +               func = xen_hypercall_amd;
>
>         static_call_update_early(xen_hypercall, func);
>
> But it still calls xen_hypercall_intel().  So maybe x86_vendor isn't
> getting set and ends up as 0 (X86_VENDOR_INTEL)?
>
> That's as far as I got here.
>
> Different but related, on mainline master, I also get a fail in
> vmcall. There, I see in the disassembly that
> __xen_hypercall_setfunc()'s calls to xen_get_vendor() is gone. 
> xen_get_vendor() seems to have been DCE-ed.  There is some new code
> that hardcodes features - "x86/cpufeatures: Add {REQUIRED,DISABLED}
> feature configs" - which may be responsible.

6.6.74 is broken too.  (That's the revision that the ARM tests want). 
So it broke somewhere between .56 and .74 which narrows the bisect a little.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1761323774

In Gitlab, both AMD and Intel are failing in roughly the same way.

~Andrew


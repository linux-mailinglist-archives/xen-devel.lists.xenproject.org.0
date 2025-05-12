Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1F2AB3456
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:01:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981129.1367520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPyV-0006mR-On; Mon, 12 May 2025 10:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981129.1367520; Mon, 12 May 2025 10:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPyV-0006kU-L7; Mon, 12 May 2025 10:01:31 +0000
Received: by outflank-mailman (input) for mailman id 981129;
 Mon, 12 May 2025 10:01:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPyU-0006kO-01
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:01:30 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1229c687-2f18-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:01:28 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ad238c68b35so370004366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:01:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad22f16271esm449859566b.103.2025.05.12.03.01.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:01:27 -0700 (PDT)
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
X-Inumbo-ID: 1229c687-2f18-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747044087; x=1747648887; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7eYMI+U6ZtMCOHreDEjup5mxhVO3mWqxrAvjpfknON8=;
        b=R7YxMroxjaHb+ie3OjNgcTo/W3z/sOfZMf1Mf7bIogwYTHPzaMIRr4nTm0KC/Mi44x
         fjojlEl4M4e3HO02NWmYcBwdkIO7Ngo2FTvRKXyOYz/33x2ZGnsSUwtMnClmO2GWbjh5
         CVXp104l3+e7P/BPgqshCFolrf8P/Z39doEUcamvTCYZALJWFlgaNFNZOmdpGYHadRTx
         HGoxcCU/8s/YXfaZe3mGL7+YpHAcW9YvOMjPTHGZMIHmxSohG1r1QL7IrkOktQ5wEEpy
         VYZcAyVs+5eaaQSUExMnP7uH13500RunPQ/T7GgGoDTnbKfpsDzUlHlNu06U7pehLfc9
         IErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747044087; x=1747648887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7eYMI+U6ZtMCOHreDEjup5mxhVO3mWqxrAvjpfknON8=;
        b=xRjOiUxg+/JeXkd7l6ZMs4gRBAQXiVws0JFEP91S8roIq6QX6xPsp+Vx8ldHIhENAc
         eq0UdJRIKfNxk6VuNJiZKzoGgj4Jlx4NXJ6TvJHwPC/Pl+bGlIW5k6aFu+vqOottpI6p
         sGj6x7Y/CVFj10cbHjTvo9X/tD8nRerCBgGTEtuXYKIEjsxetqu4KNG8+xA55ikoYaW+
         SzfGNaID5aAj3IJnXomg/g1cib/NxagVoBuNWkHAQYs9F1oiqptGU6vzjgEOPmWMioyv
         FcQZsW/pun0fUwtTVZzao12cRy2+MIVNXvAxSCgO42zzavyEuyEE3vguQBZClER3MRng
         dazA==
X-Gm-Message-State: AOJu0YwMj/NjKYX+hLqB5oHwytPByjIf3WHH3dENgSPtLEBVDsq70KuU
	u6DNDrY21fVyTJBxwAMNiljsNag3FFwyLFPuOa0Y++VXLHmsBKNtzAkOmIKfrtyPPq8qEcU6jEM
	=
X-Gm-Gg: ASbGncuzbxpjBu7hGlMp6ZlaYAtUL+d13/eW/1BoNJ73khIMBODYvsk1rvvrCyUO/LF
	S1PvYGq4ruDx2DnroGAQkQgILxxP59dyqF+vVmmxheX6vM4YG1vKfTyD5eeyWLE579lRKB+55OJ
	VvUNPFDmnMeluswJxM88BEYelaxBX7iHkqahM9150z3ni9lFzvVbshGdi3SIvzDIpN6abYBhhKR
	0QyaGbzLhpJuCNMiBBKhbdg+54USOWXPGpHCADpdLsJPYjIH7QPUfytU+zGpK5K+OYjps8CSYS2
	m9F2A6V3JVTcb4JFFLn8sfrqHeI4hkeDPW8NhAouQmoxVC4eS7rN/JyGb4/cfcQrWwm2Tw0uYk0
	zGQYAiqjNtcTzSSoHqzxQ0+Dhx8jna6Td/ueP
X-Google-Smtp-Source: AGHT+IFFVbLPTdVb6oEG7MIPByXWkEzPFkhX4MEq4zQYRmGloNeQkXZcbqxiLNdFlc5stmb8douxaw==
X-Received: by 2002:a17:907:7fa6:b0:ad2:40f4:c251 with SMTP id a640c23a62f3a-ad240f4cad2mr649827666b.35.1747044087371;
        Mon, 12 May 2025 03:01:27 -0700 (PDT)
Message-ID: <57f4b57d-9382-4844-b29c-19f678642fa5@suse.com>
Date: Mon, 12 May 2025 12:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Issues on Zen4 (hw12) runner
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <aB0XtEor2rCxBKWR@mail-itl>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <aB0XtEor2rCxBKWR@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.05.2025 22:44, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I wanted to post another revision of the series adding hw12 runner,
> hoping that all known issues are fixed now, but unfortunately there is
> still something broken. I've rebased my series on top of staging
> (ed9488a0d) and got this pipeline:
> 
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1807819142
> (note due to some added debugging, some tests are incorrectly marked as
> success even if they failed...)
> 
> 1. USB ethernet doesn't work on PVH dom0: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> There supposed to be an USB ethernet device connected to the USB
> controller at c3:00.4. In the PV dom0 case it's detected as:
> 
>     [    3.911555] usb 7-1.4: new high-speed USB device number 3 using xhci_hcd
>     [    4.004201] usb 7-1.4: New USB device found, idVendor=0bda, idProduct=8153, bcdDevice=30.00
>     [    4.004675] usb 7-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=6
>     [    4.005079] usb 7-1.4: Product: USB 10/100/1000 LAN
>     [    4.005349] usb 7-1.4: Manufacturer: Realtek
>     [    4.005599] usb 7-1.4: SerialNumber: 684D35
> 
> But it's not there on PVH. The USB controller itself is detected, just
> not device(s) connected to it. This applies to other controllers too
> (there should be about 3 or 4 other USB devices - none of them show up).
> 
> 2. There is a bunch of "unhandled memory read" errors during PVH dom0
> startup: https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/9978694739
> 
>     (XEN) [    4.026323] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
>     (XEN) [    4.026789] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
>     (XEN) [    4.027247] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0020 size 1
>     (XEN) [    4.027671] arch/x86/hvm/emulate.c:417:d0v0 unhandled memory read from 0xfedc0021 size 1
>     ...
> 
> This repeats several times. Could be related to the USB issue above?

Yes.

> There is also, likely related:
> 
>     (XEN) [    5.002036] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
>     (XEN) [    5.002365] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0
>     (XEN) [    5.002693] arch/x86/hvm/vmsi.c:845:d0v9 0000:c1:00.1: PIRQ 2484: unsupported address 0

Not very likely - these are (sadly) normal to see when MSIs are being turned
off by the kernel.

Jan


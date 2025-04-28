Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A588A9EE96
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 13:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970527.1359193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MMN-0008Te-Vm; Mon, 28 Apr 2025 11:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970527.1359193; Mon, 28 Apr 2025 11:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9MMN-0008Rc-SY; Mon, 28 Apr 2025 11:09:15 +0000
Received: by outflank-mailman (input) for mailman id 970527;
 Mon, 28 Apr 2025 11:09:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Olx=XO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9MMM-0008RW-VR
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 11:09:14 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 374debe6-2421-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 13:09:13 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so3921382f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 04:09:13 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073ca56d5sm10940294f8f.32.2025.04.28.04.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 04:09:12 -0700 (PDT)
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
X-Inumbo-ID: 374debe6-2421-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745838552; x=1746443352; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S1NY60bvctsPrKwpYhtExbVQ+qryrxMit8VBWB0Yd5k=;
        b=emfioHBgtMIVb3km9HVJF3R+ZaIa2KBmmM6M460nkldIhiIKhXEZGJjlETFA7Gzmnh
         95MzrWUp2OP/1FQNCE1eq7+apwFVtVh+eut9SXhRiNDXiJPv6cgTLvolRKDi0kmDwEc3
         sg/3Cn6nWeSooMd9rfsmk5ONgB7XjNNrD6Z6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838552; x=1746443352;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1NY60bvctsPrKwpYhtExbVQ+qryrxMit8VBWB0Yd5k=;
        b=MX+BcYfTI2OIsS1qQXLsPll8JBbIAj9v1EWIUVyjbFHAIqhMCcneimXlZaTDbHIPKn
         PmEFM93ebm9IsNLnCiaII9mwrPiKXCKu5evoiF3EJ94cCGx2faPVJQb+dU78nZORCmD4
         7d3WAfm/Hj5i7Bgv+98h2L9djjPUGtqtjLIxac0l61dP8VWR6SK/O9EYf+cy7orO4k1S
         FiosGd8ieAlNQc3niiUXbqOyxg8hfzExXbrCU6gPO1y/yxCIXAG8y3WL3tKBwmZwEDkd
         +jbyNTgSMVCfkMCxWEzopOg2rk+2JoiuuQICsarouH//sirqbrRP9BZuqYqZOWeHC8Zg
         692g==
X-Forwarded-Encrypted: i=1; AJvYcCW7JTqAiDwZC/KaggKyNuGjXj6w7MGySVZFsskrybW9vaVOrG7zSMEaWzM0rkod9KqcjLFgAoWoiwg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi1Q05RzVH+2YOfSpoz/KgvGyEFxgAgC++/laTEK+rIyHdWd6N
	kxlb/IEamp16JNhdKg0lVkfdXSppw0GQlUR8FqBE1BUetX+hSWHq7srOQCvqUHA=
X-Gm-Gg: ASbGncumHIfX8eJki7zXopWVFzjf1hoplcB+LyI/LAyAOr+B88O6OnynZ72V2l3o47T
	yVR4TyyEhE5hq/Rii1yzyyzBcilJT3wqxevC2Wep9qb0aS8ENOluuyoQ1NwDtFIxK0X3bFB6FBH
	AVfnmVpKFo3psOYFRi1b42K0axIvztf/LUJgamr3jvnDCvhKZie4UCccfbFD8wyrlxOz5aiQSPb
	o9bPNKnQ9dJzIRGVJwiQhBqUXaICG9yJ0D79q0GLWapBhiOZS9v1Ri3izRY0385gNmbdOlVjlQ4
	6Xk+NMXuF5zrrrA8RKt8pknAupF2zCxaIqq+VVmun4Uz/UZYxNlWHjaIKhosLxpjkzs2ujJeWYF
	pVZwCmA==
X-Google-Smtp-Source: AGHT+IGPMGGqkxVbJpZDRRUwIdKcvcZYGnx67AbXfna85HzHFppMBnp36zExfM0knaNzNPC//a19PA==
X-Received: by 2002:a05:6000:43c6:20b0:3a0:6f3b:79f0 with SMTP id ffacd0b85a97d-3a06f3b7a21mr8358553f8f.21.1745838552536;
        Mon, 28 Apr 2025 04:09:12 -0700 (PDT)
Message-ID: <c9bd33a1-712a-489d-a887-fa4cdc0cb516@citrix.com>
Date: Mon, 28 Apr 2025 12:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Ariadne Conill <ariadne@ariadne.space>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "Alexander M . Merritt" <alexander@edera.dev>
References: <20250425234331.65875-1-ariadne@ariadne.space>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250425234331.65875-1-ariadne@ariadne.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/04/2025 12:43 am, Ariadne Conill wrote:
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> index 6989af38f1..0305374a06 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn = HV_HCALL_MFN;
> +        void *hcall_page = alloc_xenheap_page();
> +        if ( !hcall_page )
> +            panic("Hyper-V: Failed to allocate hypercall trampoline page");

\n

~Andrew


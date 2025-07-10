Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981C2AFFA37
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 08:54:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039088.1411086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZlAI-0005Mz-VK; Thu, 10 Jul 2025 06:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039088.1411086; Thu, 10 Jul 2025 06:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZlAI-0005KV-Rr; Thu, 10 Jul 2025 06:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1039088;
 Thu, 10 Jul 2025 06:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZlAH-0005KP-5K
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 06:53:53 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0d66857-5d5a-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 08:53:47 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so433832f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 23:53:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42abd8esm11598605ad.54.2025.07.09.23.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jul 2025 23:53:46 -0700 (PDT)
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
X-Inumbo-ID: a0d66857-5d5a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752130427; x=1752735227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8W9z5h+UqeqpiD77294H3OyCwYfHus5evQS9J42fkKw=;
        b=GVfUKTFKCcliSe+Dll71kecDUOBJdhF/fqYwncLOkgig3vc2nKcImwMP1Px4LchbBU
         PR7vcIZbxJ7V+ymhuMkNO0fndmGRnIUecNukFJdfqHMXQCHlS8jrZAPMldZ4TiON+rx2
         db/LzEMIAZLuy+o+f1XBen5AmAYB4thQr325gyeKPFhas0pLduNkuuPJUaKG15nm4yaW
         HnetPgJp3PR9ziUhEBTWgz7JtOtPTeLljpFmuK31cGOVojZHUwzhkCL5/lDoJmaltrZY
         nb7eJJLT1dChZtSzUSP7u5+OW+HPJnHq1WZR7UyfsxYeYvMJTESWC1x/dDSYNrOGbjNw
         FyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752130427; x=1752735227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8W9z5h+UqeqpiD77294H3OyCwYfHus5evQS9J42fkKw=;
        b=jDaHp9ZsNFHQ9ghJyTmlvIfk2SrRWJfmtAV2MBMdZDS3oXZ5rUzJ3RFiTm1DBfujJe
         eieeo4Qgt8ILoorUG60X/AKWBMp3Q/txUm1WL8dDr8aKlSwSHVvTmdC+Cby1Jk8QYUdn
         mZMH7R3M3oRceTZE6FatjSBAistsUqgh3x53ILtak5iO0EmX93/GOC4XSPKTvr4Pc3V4
         CtxU1iABI14tJWMvlNIkQCL9TsdlGCMZk/H6lEwQo+Ri2zncMOHnh00P39qZdJo/acgh
         SVCVAVD2faI1EPcSdajDer9qs+Go+QJTLDNof5jhIua1PBw7G+UYqU4/bsvBaDGSn0PH
         SM9g==
X-Forwarded-Encrypted: i=1; AJvYcCWBJza6Ikyw7jy5aOO/xURFm3kcdROaJPDRv2dpbvoRuXgOtZbgsiFR8SUdflVnA6VanCdLF+Upoyo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwPyuebsTC7pm3y3QYCkX+IRQ5G28LU19/+WopgaI+NBHGw5m2
	ZBEHRRGV+M2AGjF9xhSDozOrM/9zNrl+euZiyNsurxhyeEFRWxQ8NlKrVEOGlw3lCg==
X-Gm-Gg: ASbGncvQvW1xRaTFTzhl6IQasIbp76xjpaKBYdAXK67vNBCP0yXHz5majjPHWakaMxD
	vVbGKqr+aE0X4X0H13MVmlekOo+xolL5FuZ9AGXfPSTXynavgo5dX7Hv6+fdAwRjtJBkpCCl1wl
	8hCHu/cjL3R9YQpFnFLcUqU9i6+IwrSzToAqsSHLa020MU/Rl4oVDgiBYnGT+6OW/gP7k+LXK4A
	qzTNLTtK/tDw3affdXQ4C6PlglCikt5XD66B+Vy/RdQnAF3F5chUjz95aU08FwSvkjohWbm+YOU
	Tyr+n6655qeGcqWfQsgWhbEEho3qBTfOrpsynarn/GwjeAZ68q/GSGHhZbZiZPGEYVRLGD01EoV
	k9yKagnw16TKNNqTqu+0yWFGIsvjGcAQp6K4yje7Rq/BlYb8=
X-Google-Smtp-Source: AGHT+IGguHccPJdJB5pssckA/6+CvgABliH/bbGFmxOkhWjRkdptPov2t+46dUt21bBf6laTdWfdmw==
X-Received: by 2002:a05:6000:2906:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b5e44e9d0dmr4553565f8f.17.1752130426967;
        Wed, 09 Jul 2025 23:53:46 -0700 (PDT)
Message-ID: <5f6df28e-8f67-486d-b227-23b3d173b06d@suse.com>
Date: Thu, 10 Jul 2025 08:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: don't send IPI to sync TSC when it is
 reliable
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Xenia.Ragiadakou@amd.com, alejandro.garciavallejo@amd.com,
 Jason.Andryuk@amd.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
 <20250708183238.3104638-1-stefano.stabellini@amd.com>
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
In-Reply-To: <20250708183238.3104638-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 20:32, Stefano Stabellini wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -2297,11 +2297,7 @@ static void cf_check time_calibration(void *unused)
>      };
>  
>      if ( clocksource_is_tsc() )
> -    {
> -        local_irq_disable();
> -        r.master_stime = read_platform_stime(&r.master_tsc_stamp);
> -        local_irq_enable();
> -    }
> +        return;

Assuming the rendezvous can indeed be entirely skipped, I agree that there's
no point calling read_platform_stime() here. Yet to yield a consistent
result, more changes are then necessary imo:
- as indicated before, the invocation of this function from
  verify_tsc_reliability() when plt_tsc was chosen is then entirely
  pointless,
- time_calibration_nop_rendezvous() would then apparently want purging, not
  the least to make clear that TIME_CALIBRATE_SOFTIRQ is never raised in
  this mode (one of your goals after all, aiui),
- the function being a timer handler, it would be preferable if the timer
  wasn't ever activated in this mode (at which point rather than returning
  early, the code above could simply be purged, maybe replaced by e.g. an
  assertion),
- the above in particular requires dealing with cpu_frequency_change() (the
  other of the two places where the timer is actually activated).
Some care may be needed in all of this taking into consideration that the
platform timer change to TSC happens late. Albeit commit f954a1bf5f74
("x86/time: change initiation of the calibration timer") has imo eliminated
the main concern here.

As to skipping the rendezvous: Besides invoking the calibration softirq,
time_calibration_nop_rendezvous() also updates the per-CPU cpu_calibration
fields. There would thus need to be a pretty formal proof that calculations
involving ->local_stime or ->local_tsc can't possibly degrade or even
degenerate when they remain at their boot-time values. (As to
->master_stime, afaict the field simply isn't used at all in that mode,
which is a fair part of the reason why the code change above is okay _if_
the rendezvous itself can be eliminated. The justification for that could
also do with extending some, considering that much of the involved code is
pretty subtle.) Alternatively, if such a proof turned out impossible,
another way of updating the fields every once in a while would need adding.

Finally, what you do here isn't entirely reliable as to your apparent end
goal: "clocksource=tsc" is respected only when tsc_check_reliability()
completes with an acceptable outcome. There's certainly some variability in
this across multiple runs, i.e. if things went extremely bad, once in blue
moon you may end up with the TSC being rejected for use as platform timer.

Jan


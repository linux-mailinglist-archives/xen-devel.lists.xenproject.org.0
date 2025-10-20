Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79CCBF23C4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 17:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146493.1478911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsET-0002Zt-Dx; Mon, 20 Oct 2025 15:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146493.1478911; Mon, 20 Oct 2025 15:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAsET-0002XJ-Ae; Mon, 20 Oct 2025 15:55:37 +0000
Received: by outflank-mailman (input) for mailman id 1146493;
 Mon, 20 Oct 2025 15:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAsES-0002XD-A6
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 15:55:36 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3667586a-adcd-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 17:55:34 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso2843765f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 08:55:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3affsm15797534f8f.12.2025.10.20.08.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 08:55:33 -0700 (PDT)
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
X-Inumbo-ID: 3667586a-adcd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760975734; x=1761580534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/mJqCJK536KJp7Bt1rJ0cF+KFLkuGGe4GVR33t3Qo3w=;
        b=eJOBko3FJqx+7cG5xMzDo8hAVKN2JqgcvLSow00PniBVKTQ5osAYm7S68hfz2IsP1F
         h2CsR765AobRwL5K1o9t34bBIx2yL2E7bstlZk5XuVZnzknXk7cae11WuNcCV0NqfobZ
         Y5BhOYhPPOYpNMhWKdKP2pnqGTvwnd2KxT0/00u8d113qPQpNX8mbGzgF9OE5GPAFVYa
         THxDeIqNj4+BEJJD+hP4Wen9o+NHx/L2U0ar06xEwdXSwIvUyG+1uSsoE3OH9gD0tQ80
         byGRavnACO76fgOFLanjBKDTMWrm36+YIne5hX+Qiiu+OcxX/d4oRLPMAuzdcJdeptFU
         yBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975734; x=1761580534;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mJqCJK536KJp7Bt1rJ0cF+KFLkuGGe4GVR33t3Qo3w=;
        b=TDd/yYQQrQlY/P8sNvFxnqpV8sqD876adz9DAazxAZQGkRFuMDn3mu6Yj80iPdtA89
         0DLeHKWg7Or0Td8Qn19tB4sDwz6dvPA65XbwjMJ4gV4c8+vLU8CtsTDZhnm3RgbI6iUL
         geNWL7ubVNezXaK6AZRLE9s9aMjaLVV0Lp8dPv0e+vwMwkKknJjxr6dcpKLsDsfocQMh
         gtJTm8oqrRiTYAJuJqIE0k2s4olG0szZqBJe74s3Dus+VJIiVExCfRoxAMrxPwdQRm/N
         OGjFKz9b93bW7BAjwTYxuzt0+wkhLGHXDAEKZOnpBqHZXxKFncAgyALJHpuem2csJh8z
         mMAg==
X-Forwarded-Encrypted: i=1; AJvYcCU7IYnrtvdSaAMLyIL7vM77/uiKCkL2oK5wwWd+qtQOiLAa3+C5s0abwW758OxxDnV/a3NtmBZRe6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzhLOAifaUrEZO/FR2thqA1Zwkf9d/UxeerUU0WI+qmHsVtJkO
	TDAtNuY/Y/XD2u/bV5Ygr119a+c9bJzEyI6cEhIEvXrT8UDjRSNkZ66rrC4vy2W3Sw==
X-Gm-Gg: ASbGncv9vpm4uGPJBUC2haQr9z4WQFAf8LhdvNUmva9fcmCpbt4hWe9jLQ2MWzxbmU5
	nGBg70uiT4LrUGzKxMt59A+2YQaBC21bivz9uJp9KkFwZTrbuh+F90nNPJS92kFrdXNbCBHDWb2
	0MKSSQfnnjl8/n0cUkPo6jj3ot9/Z6VstsfeTF7qD2d9m9aUBIZIjd/1yZlIEwe5cR3AY6YTf6s
	7nuFTW2nJhbdRQpWBrLVTkCeUk9MR6TSzlntTYeAa64tm5JF9e5ge+QCQsitZY0t+S+IjXAaXLy
	7l6WbAqiTJ76pYVaE7NRSBhY8E8NCCWoNa9bxhJY37YqdTjD6NukB0uAB5hmGvYPo97Fhf+Z18s
	uhHQrdMpaoh5SEZt/FedlRaTDPhhqijfI1xB+A+YGBeHiUIyycq/1pD99Fjq4wnCoCdzqXqznhW
	3nprTx4wNKmzhDckeQ8Dbz5vdcCeA2dP6LgvJOpspe++pk4hv1JWsVWY4uHN8r
X-Google-Smtp-Source: AGHT+IHFQtXih/chSI0CpS559EkllQ9i6USZBEZFWp2wGYev8qWWd6KVaiEJiyiASHhL7LWW7V56Wg==
X-Received: by 2002:a05:6000:2406:b0:427:9d7:870f with SMTP id ffacd0b85a97d-42709d78818mr7884343f8f.5.1760975733657;
        Mon, 20 Oct 2025 08:55:33 -0700 (PDT)
Message-ID: <4fb57b9e-2a39-471a-a629-e8cd00997f22@suse.com>
Date: Mon, 20 Oct 2025 17:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/ucode: Abort parallel load early on any control
 thread error
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251020131955.2928261-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 15:19, Andrew Cooper wrote:
> EIO is not the only error that ucode_ops.apply_microcode() can produce.
> EINVAL, EEXISTS and ENXIO can be generated too, each of which mean that Xen is
> unhappy in some way with the proposed blob.

Yes, yet wasn't that the case already when the EIO check was added? Were we
perhaps trying to deal with a certain level of asymmetry in the system? I
think a little more is needed here, also to ...

> Some of these can be bypassed with --force, which will cause the parallel load
> to be attempted.
> 
> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")

... justify there being a Fixes: tag. It would also seem possible that the
check was intentional and correct at the time of introduction, but was
rendered stale by some later change.

Jan


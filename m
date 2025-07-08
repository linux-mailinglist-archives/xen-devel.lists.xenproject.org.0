Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603F3AFCC1A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:31:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036535.1408790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8Pu-000746-5Z; Tue, 08 Jul 2025 13:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036535.1408790; Tue, 08 Jul 2025 13:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8Pu-00071N-2Y; Tue, 08 Jul 2025 13:31:26 +0000
Received: by outflank-mailman (input) for mailman id 1036535;
 Tue, 08 Jul 2025 13:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8Ps-00070H-Jz
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:31:24 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d75d1094-5bff-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:31:23 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3285425f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:31:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce359d0a0sm12102135b3a.4.2025.07.08.06.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:31:22 -0700 (PDT)
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
X-Inumbo-ID: d75d1094-5bff-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751981483; x=1752586283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KdGdkYdlCL6qZfpewcbP97xSkD3l7tDDwgBlQuikcdg=;
        b=GO5t1Nr9C3rijuG5QtSGyu3Db+I458noyzoIGFyGE/qeU7HXs/jbKIV+QIm02+Lkzi
         oqwo5OulF3WxXfCmyevNyriYmiJCXznj/FEs1agkxOMtUjEmKe9s7oyCMGsGAuJ+VKVo
         MSfYxJ7vpE+HOJ+1y0IIKP1Zoq8Z76Tc2F2BBFfO+OaSbXFlV1qHiFuKFCUzMyiBxTpS
         Ke5lzjIN57YO9RXZjF6HPXUH3whBLpltyazdGI4MNSr0D8PHCD7+iNOMA4kjizYo7I2k
         dz1Beo23aFjNM9d6ERczGBbW3WHiCSxSQ5Jg/yxO4wCVVcGKl+o7/933kchxKePOVrOE
         N+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751981483; x=1752586283;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KdGdkYdlCL6qZfpewcbP97xSkD3l7tDDwgBlQuikcdg=;
        b=CLoOPAiVT89GvlXQUmmiNSZbPsF0unyQZ2Ck/lbj/ie/pBnTa+QeqaCfuYKksSYKfr
         eEpgMTqJm37xdBfnAQRFP6V8v4Bz6xnRjWGX6zEzNd07zRGdrHSYhWOCqGxaRZwvx4Wz
         ZVsM4SJ8MWOSIWj3gY8IjBpBqi+rmV4FTG5eKFxswx3dc33wPwGy1z74Bb5HoadzDVjt
         khr73uSxVArKui1gA8OGZNAVJhRqW8UI+HWDXjwMBuNPf9FIMSfEXJyVYZgkdI0kBOA1
         +MX1V7R+X1OkOoYl/wPobPNFLz19yyEeHyKswWGdnKAEPvXpEEZ8SEDcA6ACJAx1kykk
         /K1g==
X-Gm-Message-State: AOJu0Yx5l9NtHybs2FnYJ1NSuhL2TlBSMMkd1B9tGzEIpOHf07GIu3se
	dQHX0FFOw5J5xY4G6b7Bx5RK/XaXRTfvKuOK29ztLW+EJU8I3v5O1BazRuLeSifdpN/oXyNe3zL
	xxjM=
X-Gm-Gg: ASbGncvT8o6FFT7LceI6ricaU7iZ/+KB8cNLbku+ztvCtY9FKV4MJbqL4itU0r3ic7d
	4OxcIaho05gHZTLQg9IOPHGdADryKuJfhHBiETVCD1DSSNsVx9zWdhAyF7TOUVTVi77AEzlbTVt
	jaFH+WxHgtUKQwQGxD8VP/idlLnRyIPE4HmzIBHtwNAmYF0Z+Y2zXLM17VYKpIXP28mMzL/g73F
	wg5xwkEUmbBlVtWItgiDtTfyKeO8OmNtF+XRyAD2tiLRJ64d86vAZ/4aMmrozlWun0uPPU3PHUE
	e0pOIRtZw9fJFUSFJ/ziq8Lnuds7CSgnv0CsaVkdzC2gd6fBHR23QZOMnOumxMmwC11aeoCrV+D
	q0WZKKbgWsrxSMnpHczshvCeH7EAenD4qKBsWrgtS0bcap4I=
X-Google-Smtp-Source: AGHT+IElhqBWLVPhHA8s0gjxnbrnjZfLkh3yzxapVtMrCJkcD/IH5yLq5IFH8BKh+tnPcCOmz+Z0Jg==
X-Received: by 2002:adf:e185:0:b0:3a6:e1bb:a083 with SMTP id ffacd0b85a97d-3b49701ca8dmr13901808f8f.25.1751981482855;
        Tue, 08 Jul 2025 06:31:22 -0700 (PDT)
Message-ID: <6d283128-4aaf-4f52-8e96-7a4ebe292be3@suse.com>
Date: Tue, 8 Jul 2025 15:31:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Xen real-time x86
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xenia.Ragiadakou@amd.com,
 alejandro.garciavallejo@amd.com, Jason.Andryuk@amd.com
References: <alpine.DEB.2.22.394.2507071657440.605088@ubuntu-linux-20-04-desktop>
 <aGzu4A_nk3dAScxt@macbook.local>
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
In-Reply-To: <aGzu4A_nk3dAScxt@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.07.2025 12:11, Roger Pau Monné wrote:
> On Mon, Jul 07, 2025 at 05:06:53PM -0700, Stefano Stabellini wrote:
>> Hi all,
>>
>> This short patch series improves Xen real-time execution on AMD x86
>> processors.
>>
>> The key to real-time performance is deterministic guest execution times
>> and deterministic guest interrupt latency. In such configurations, the
>> null scheduler is typically used, and there should be no IPIs or other
>> sources of vCPU execution interruptions beyond the guest timer interrupt
>> as configured by the guest, and any passthrough interrupts for
>> passthrough devices.
>>
>> This is because, upon receiving a critical interrupt, the guest (such as
>> FreeRTOS or Zephyr) typically has a very short window of time to
>> complete the required action. Being interrupted in the middle of this
>> critical section could prevent the guest from completing the action
>> within the allotted time, leading to malfunctions.
> 
> There's IMO still one pending issue after this series on x86, maybe
> you have addressed this with some local patch.

Not just one, I think. We use IPIs for other purposes as well. The way
I read the text above, all of them are a (potential) problem.

Jan

>  Interrupt forwarding
> from Xen into HVM/PVH guests uses a softirq to do the injection, which
> means there's a non-deterministic window of latency between when the
> interrupt is received by Xen, as to when it's injected to the guest,
> because the softirq might not get processed right after being set as
> pending (there might be other softirqs to process, or simply Xen might
> be busy doing some other operation).
> 
> I think you want to look into adding a new command line option or
> similar, that allows selecting whether guest IRQs are deferred to a
> softirq for injection, or are injected as part of the processing done
> in the IRQ handler itself.
> 
> Otherwise there will always be a non-deterministic amount of latency
> on x86 w.r.t. HVM/PVH passthrough guest interrupts.  Haven't you seen
> some weird/unexpected variance when doing this passthrough interrupt
> latency measurements on x86?
> 
> Regards, Roger.



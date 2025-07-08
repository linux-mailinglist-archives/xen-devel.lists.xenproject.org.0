Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C46AFCB70
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:09:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036508.1408761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ84B-0001NR-1X; Tue, 08 Jul 2025 13:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036508.1408761; Tue, 08 Jul 2025 13:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ84A-0001Ke-Ul; Tue, 08 Jul 2025 13:08:58 +0000
Received: by outflank-mailman (input) for mailman id 1036508;
 Tue, 08 Jul 2025 13:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ849-0001KF-P2
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:08:57 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3c6ae44-5bfc-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 15:08:55 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-555024588b1so4278793e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:08:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c22066258sm2058136a91.16.2025.07.08.06.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:08:52 -0700 (PDT)
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
X-Inumbo-ID: b3c6ae44-5bfc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751980135; x=1752584935; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7KekoaMNauZKbz3qk6Iw8jGjKpFkL83x06Ti17rB/Og=;
        b=ABX4eaiT70jvWznDCiH+k/BYqUMQ8uDEGt9SPXS7Id3q96wiQs4/iyOoMTQ4BhtUrH
         FTmji6EdfFESmL2R3fBsBuIkocwAvRG21Asj+MR4Z8wxrfaynoFkFOKOrDcUlUNLkbbA
         ZZafXvASjzQzTVZW4UNr30ywCsjjYNcs7NOxGxcmBV7Vm0BLmUxoQptaoJG8cgkEsVDX
         bWuW5tdUEI3VANBBXjVfKdGLVPIi96TxOU6yOg3qOAeBs5VbNKHFn8bFayqT/dPFzkBp
         F/mGKkWr191GVJa+5X8HjSdBQi5MfNupzIRxqKEYBpJqJOFjZaC0cGWjAW4xpNAes/n9
         MiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751980135; x=1752584935;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KekoaMNauZKbz3qk6Iw8jGjKpFkL83x06Ti17rB/Og=;
        b=XrW9PYtjU6MOF799nVZIz5UbQw6LeeIHzUaJ+PpYDtWhAsZGKwGwYnz+Bu2093BJPF
         VvGWIm2U2XDAugEirfbd+orOD/I5lSVgVPeq/jJMKakEdiagMLTIF1wDixkuTyKQLhf6
         JNUqGGuvJozIf3Xm3HnSS6zC1b1vBtWpxZ8XHg3VfIdnzdIOdD/JRP4sHUyhjj/FKbUd
         8u3BG0hjrT9GRnAypt93VnUDIxY8Ed6SAqGubN8jPZgUUem9AHV3M3ckr8jhdk7hY9th
         63ao9ycrDJ1JkTqQ9cBug4oOZmk0yQ+IeRd8YljOF4M7FfvIuAxh2JFf+aG+bdhPMVoy
         nbDw==
X-Forwarded-Encrypted: i=1; AJvYcCXmVQ8kBUZjeyW6iJMrOmiJRAN8zKiVT8O1ZqzcXKkijB3MPJ9PZojwFZsIkIBQ3rFSlm8gYLTuEVc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywsv2c0HWEUScgLPRkrDWcWv30wqrWFV06HBrYNZAqBPTdbvuHQ
	XQ699knqRIFQLFS5oWMrjBddlifgZF8KFwyvyTDO+M9qBLjcM6OzELz2ksZwum4deQ==
X-Gm-Gg: ASbGncvN2wepX0mt877gIHkjNc8EjKxpcJzSSWUPEtZ2BO7CUBp8r4TzAPoc0IaZkpn
	PpFSXN3AWqskuAWhaLiHA9vuI4wiZGXAEen/Zg0EBsbhYs3Zoyni7mx5U9zk1YRL477XawhaXiS
	xmq8988Qsm+LTA7m5DCMVS8tlUKby9Yxp+i0xARksQkp4EMgq7EP+sREm+Da2lMlbG2FYhdOpyb
	U/lJzLPFj+6tStKfG4w51C7c3q+h6Zu7BNgoR2MKUSp88/NvqErM5VuYty2vKYfS090KEPSQGTz
	fxhVXL/JvQb58o2c4E56khQk1zS8uCBLC/5ORre8xPuYHBZQHhx3uNzJCftsMwJ9UMA7npAE4OJ
	2JEC7WC3DvcSn47vWhETd3VPv1NQvlfd61SHqETtFPaZM1GM=
X-Google-Smtp-Source: AGHT+IGG8pkPomVCjucBow/bw7S7LpjdXN/+slthNI/QYf7erQz6GV6yvf8iv3as3yG5bmqUumddnA==
X-Received: by 2002:ac2:4219:0:b0:553:647a:e488 with SMTP id 2adb3069b0e04-557a1421a11mr3716933e87.12.1751980133097;
        Tue, 08 Jul 2025 06:08:53 -0700 (PDT)
Message-ID: <f08a1d0a-68c2-41c8-9f1c-5bf82300661c@suse.com>
Date: Tue, 8 Jul 2025 15:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/idle: Implement support for Meteor Lake
To: Alex XZ Cypher Zero <me@alex0.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <4f6cad808ae9ada51e873a411d774dafad4a49cd.1751969384.git.me@alex0.net>
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
In-Reply-To: <4f6cad808ae9ada51e873a411d774dafad4a49cd.1751969384.git.me@alex0.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 12:09, Alex XZ Cypher Zero wrote:
> Adds support for Meteor Lake C-states, following the reference implementation in Linux.
> 
> Signed-off-by: Alex XZ Cypher Zero <me@alex0.net>

I'm sorry, but this still isn't quite how it wants to be done. Besides some
of the metadata from the Linux commits that wants to be there, it's also
pretty helpful if what we pull in is done in the same order as Linux had
things appear. Unless of course this isn't possible or doesn't make sense
(yet), like e.g. for Linux commit 9f0112938277. That one we will want once
we gained AMX support.

Furthermore, ...

> --- a/xen/arch/x86/cpu/mwait-idle.c
> +++ b/xen/arch/x86/cpu/mwait-idle.c
> @@ -678,6 +678,28 @@ static struct cpuidle_state __read_mostly adl_l_cstates[] = {
>  	{}
>  };
>  
> +static struct cpuidle_state __read_mostly mtl_l_cstates[] = {

... this wants to be const, as well as ...

> +	{
> +		.name = "C1E",
> +		.flags = MWAIT2flg(0x01),
> +		.exit_latency = 1,
> +		.target_residency = 1,
> +	},
> +	{
> +		.name = "C6",
> +		.flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.exit_latency = 140,
> +		.target_residency = 420
> +	},
> +	{
> +		.name = "C10",
> +		.flags = MWAIT2flg(0x60) | CPUIDLE_FLAG_TLB_FLUSHED,
> +		.exit_latency = 310,
> +		.target_residency = 930
> +	},
> +	{}
> +};
> +
>  static struct cpuidle_state __read_mostly spr_cstates[] = {
>  	{
>  		.name = "C1",
> @@ -1083,6 +1105,10 @@ static struct idle_cpu __read_mostly idle_cpu_adl_l = {
>  	.state_table = adl_l_cstates,
>  };
>  
> +static struct idle_cpu __read_mostly idle_cpu_mtl_l = {

... this. (Some of the entries can't be, which unfortunately makes it not
straightforward, i.e. you cannot simply copy such attributes from adjacent
entries in some of the cases.)

I've Cc-ed you on the one patch in the series that corresponds to this one.
Feel free to provide a Reviewed-by:.

Jan


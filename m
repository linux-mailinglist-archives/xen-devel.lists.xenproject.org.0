Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JfpD0pTnWk2OgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:29:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B8183081
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239452.1540859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumq7-0002L2-Lu; Tue, 24 Feb 2026 07:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239452.1540859; Tue, 24 Feb 2026 07:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumq7-0002JL-I3; Tue, 24 Feb 2026 07:28:15 +0000
Received: by outflank-mailman (input) for mailman id 1239452;
 Tue, 24 Feb 2026 07:28:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vumq6-0002JF-Az
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 07:28:14 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e492425-1152-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Feb 2026 08:28:09 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43638a33157so4799823f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 23:28:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d54760sm24660629f8f.35.2026.02.23.23.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 23:28:08 -0800 (PST)
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
X-Inumbo-ID: 5e492425-1152-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771918089; x=1772522889; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SeHk9VCB7wbO+bOOvBB7puZdUQENm13Dj4e6lE/8VSw=;
        b=LZot+N94lCEfESC7cq/lFg7c1KGJN6738HgB9n9qQwQeRi0xz7fbQzfh0tKiMqIryC
         u/7NKYZJBnpGRu5LQa7ItBVtsGXMNrlc8XMTByCV6rBxpqPJc9eFX9QH2C1eMCV6KOLq
         G1/vSRnBrnIarBcsKL44m81W69kPbBvwaRX9QcizTQAMupFKYDvh9OwMbyIejsqpvIzs
         lurPYIO7ifooMROrYkyruoI4wozSOWAQzjRTXHdhqcSkKaTTs8I5zPwT8wEiUexVkkec
         pBFWlnjfUGN3P3izq2gLMUMVIh8MZtPTWZk7wJX0+jfWyn8Qf3bPxsWzdEefiARevvAg
         CI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918089; x=1772522889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeHk9VCB7wbO+bOOvBB7puZdUQENm13Dj4e6lE/8VSw=;
        b=Y/78y5mg60haBoY8Maomq/qqKP8g1u7fFrjfV2Ftql8aZRMW6tHdI/YSvDqGXDOFRN
         kDo3xc1aI35OQ/0J1/SeMrRoKqci1ffnhYzwc/WoJ6JxkHZtyUQXao5ph4BpqlL3mx9G
         px5Lh14nHBDnrbacxsXCFxVDMNdMzA56PvwUy5pAe80SHLBzPKIctJ6MQTLZ8u0OSA65
         2hLPh9bGTvBrStC3yhR0u1l5fARRUG22nC0fO6S0Nw+vSXCS1IPaJrSrV2piCxZwxV2N
         NOKXFh139yMHkY6j98Yk5Vkx/t5swopObGGYietqUe58+zmL8v/b1Bt1MejLjYeOAMCB
         ZOBA==
X-Forwarded-Encrypted: i=1; AJvYcCVSbTOLbDrnQlARL3eh4r/qIS6vg0oIqHdCoCJJWrVx3Gl6/Wp3FXHrG8nAeRANh/+RMUqCLNc6L9Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiyHK8l/9k2cVEkzxBm9DPoq1L+3noSaR5p9itx2Bj9tY8Iz7/
	MLfjPfTQwvwml9v7+/107weuKD8ng7vxn4Yvdhah//w4KRYxr0VXYfC3jy5sVM3XUQ==
X-Gm-Gg: ATEYQzyVW0+hp2Ud5bfjAM0h0LMGOIDEaxZRSo96BC+17dYez+R2flJyQcKnUTqJsDi
	MkaLBon0z+26ofH8XzEZNOF3+LDSNprU5RTEG34o7ekSW1ks4QhZGiKIiibe60yPHgOL2b19Dlu
	TzsThNYEcvWI0uc8Iql7TegDv1VfKFViyqMH1PQ9qr8vfeGVRQswtW5eYzwY+FCmkRiSekR9IGt
	i/RFI0rvzSgoibIc9nSwbMteMGLAcjVnrcHxTo0soEruU+o7Yazics/o63OaAgFHf04FNDpj5RN
	lu1zNMYRxEB8hrOqmxQ0oR1tscdyYwD+VIz9ma+PV1RHJv0rAZ3FZDd4wOdhFM/rAfXaRaY982M
	fHoB7egGP0+Rt1aLdMeyVy2WTvrAB52chIqYUH+W9oQgcm7H7f5PxMjYnnheMFClj8vcsIWmgaB
	Rz0eJ4QVRA7BDCkcnaIO+rPHwNuCA5xBUh0/6QZ0bVissVB2DBuABsseUE/X2pjow9MsmamjT6a
	L4NqbXsM6YxAKw=
X-Received: by 2002:a05:6000:402b:b0:433:2f55:7cab with SMTP id ffacd0b85a97d-4396f174f18mr20794815f8f.37.1771918088759;
        Mon, 23 Feb 2026 23:28:08 -0800 (PST)
Message-ID: <e983d7a2-2c8a-46d4-8112-0d2f2045c93f@suse.com>
Date: Tue, 24 Feb 2026 08:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/acpi-processor: fix _CST detection using undersized
 evaluation buffer
To: David Thomson <dt@linux-mail.net>
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, jgross@suse.com
References: <20260223195602.17122-1-dt@linux-mail.net>
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
In-Reply-To: <20260223195602.17122-1-dt@linux-mail.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,linux-mail.net:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dt@linux-mail.net,m:boris.ostrovsky@oracle.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A37B8183081
X-Rspamd-Action: no action

On 23.02.2026 20:56, David Thomson wrote:
> read_acpi_id() attempts to evaluate _CST using a stack buffer of
> sizeof(union acpi_object) (48 bytes), but _CST returns a nested Package
> of sub-Packages (one per C-state, each containing a register descriptor,
> type, latency, and power) requiring hundreds of bytes. The evaluation
> always fails with AE_BUFFER_OVERFLOW.
> 
> On modern systems using FFH/MWAIT entry (where pblk is zero), this
> causes the function to return before setting the acpi_id_cst_present
> bit. In check_acpi_ids(), flags.power is then zero for all Phase 2 CPUs
> (physical CPUs beyond dom0's vCPU count), so push_cxx_to_hypervisor() is
> never called for them.
> 
> On a system with dom0_max_vcpus=2 and 8 physical CPUs, only PCPUs 0-1
> receive C-state data. PCPUs 2-7 are stuck in C0/C1 idle, unable to
> enter C2/C3. This costs measurable wall power (4W observed on an Intel
> Core Ultra 7 265K with Xen 4.20).
> 
> The function never uses the _CST return value -- it only needs to know
> whether _CST exists. Replace the broken acpi_evaluate_object() call with
> acpi_has_method(), which correctly detects _CST presence using
> acpi_get_handle() without any buffer allocation. This brings C-state
> detection to parity with the P-state path, which already works correctly
> for Phase 2 CPUs.
> 
> Fixes: 59a568029181 ("xen/acpi-processor: C and P-state driver that uploads said data to hypervisor.")
> Signed-off-by: David Thomson <dt@linux-mail.net>
> ---
>  drivers/xen/xen-acpi-processor.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
> index 2967039..67a4afc 100644
> --- a/drivers/xen/xen-acpi-processor.c
> +++ b/drivers/xen/xen-acpi-processor.c
> @@ -379,11 +379,8 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
>  			 acpi_psd[acpi_id].domain);
>  	}
>  
> -	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
> -	if (ACPI_FAILURE(status)) {
> -		if (!pblk)
> -			return AE_OK;
> -	}
> +	if (!acpi_has_method(handle, "_CST") && !pblk)
> +		return AE_OK;

I understand you reflect original behavior in this regard, but why involve any
ACPI function here at all when pblk is non-zero? I.e. why not swap the operands
of && ? Object evaluation could have wanted side effects (in which case,
however, some different change would be needed here), but checking for method
presence surely hasn't.

Jan


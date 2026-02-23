Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEAKOFlynGmcGAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:29:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA07178BC8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239138.1540575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXs3-0001PB-4l; Mon, 23 Feb 2026 15:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239138.1540575; Mon, 23 Feb 2026 15:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuXs3-0001Mn-1t; Mon, 23 Feb 2026 15:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1239138;
 Mon, 23 Feb 2026 15:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuXs1-0001Mc-5Q
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:29:13 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66fbfd03-10cc-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 16:29:11 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso39294285e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 07:29:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d401aasm19564315f8f.23.2026.02.23.07.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:29:10 -0800 (PST)
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
X-Inumbo-ID: 66fbfd03-10cc-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771860551; x=1772465351; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gFlJ93/U6MaTgj11pa6beJp1TBJaxcQo28pmKK0kFcI=;
        b=ZwkTZkB34hYrKpPZTo/EnRk9u4PaWbSbtkXiAu+7penUQHuG5i2relQqEMEBSymEPz
         9V0xP5cW5pGRg4MS3/fF+95Q1yo66HbGKDMMo0wh0YgVcGou5Y3RvcTXOxRk9q2DDy/9
         88CRU4/oKW9Bkh+tlmMS/ugclSUjFflsX9ZFxGyal8JgDddIY2A4IAplW/l2uQdqQLYA
         mYXN8CgTATepTCq/AtZzQOM+U1F5p4nzIXS9J9r5MiNREieuQ3Z/ndYVM2P9n0atDNvM
         z2xD7Ge2zZWMI/j3PLdRfJRq3NOwSNFRYpJAYGqK5ndfylgmiTFcUDGXtPYdxFq/CSgk
         CB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771860551; x=1772465351;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFlJ93/U6MaTgj11pa6beJp1TBJaxcQo28pmKK0kFcI=;
        b=g2PfcdG7xjz97TN+uctJHI09s/foNKW8mn9KJ7CLV5OawrJdPVTypfmQW1oUt/iAjg
         /WDUBO3JFUQ7pVheQhrdMunkqn41atWubvlItIDyCDhCt7E2wyp/MMhQF0TPzRamJAj6
         DzDuLDmRa6EAIMWwAYm6aijHagpHBLdQ7vauSCM+PS8lTXqfcj8hlQ0fVwKMEty1PSpL
         1wqmpk+s7c4WB79x746W2qGEyEEAT/Sfs/fNzS8U1abG+iloZPjdLu4wEQ2Z/kzp1MJE
         AXZcrB9fZuJoqKW+2naLQsGp5UUn0lGh/P8ntKYdmw4T14P++B7XmajCB1GWBu7D0R85
         O/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVyJa403Jes0h4v5PKnDcjgg1L78rnJvvwVnyIy4qTvhBbbEu37FC7nzI4bJr8cYIR+81zJw3tZmCg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1bjKrqLcPsMl3gd0O4+BB6c4x1HOsqlv5R3kH/iaksVl2Y2Oq
	WCVYoZHvG09XDGWguGDkYVM4FPdUhF5jYvH1nsX3XiY4C2DBlZO+gwADe10NpYlphA==
X-Gm-Gg: AZuq6aIvSHhX6JU9nipPYgTY6HJBxNuiJIYgvZ1A+JvvAhuZI/JsEApOxjqeZKoK4ow
	LxdaTPYmhsk4K82gzZ6mhutytIk6u28frJjqr5fiaq26PdFSsZv9IbUNUWWBE7zL157ccZ3/JI+
	PLg7+mm/fNskjiiXVcLlrPT6NWaGqzH1FDSEMWOcZ8Lt0yilRok7FjZ0fyHoQ75cZdQCge39BPo
	1/3pvaf43hTE/3wUesddrpLy5QcrxLsTCu92VPdeEx4h+1Vh5uCXdxjs65rnFrUPfOXf7JwG4CG
	xfnnvcPcwIpQwhbJs8AJndCgoW/PSuYc0TMLg4nYnJ92lV29GOUgtg8+KTmW+sNPoAQcPgd38x7
	2sJF2jC+cy+E2uxPGITx7z/UdsibJkOd4T/pdvArB/uUH8wijs0KH+TNjiWMzxQHPhBX8tx7JeO
	/n4UOhPZA6Do0n930BhF9LmZEMy3/pvGife5chjtvRnvip2/pzWpxgL8nkKjwy5upwoVd849TNI
	7VB90l4jRarPcoE6igWG72ekw==
X-Received: by 2002:a05:600c:450c:b0:483:7783:537b with SMTP id 5b1f17b1804b1-483a96365camr147724835e9.24.1771860550704;
        Mon, 23 Feb 2026 07:29:10 -0800 (PST)
Message-ID: <75f05c4d-5c1d-4fc2-953f-2beb11467116@suse.com>
Date: Mon, 23 Feb 2026 16:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/platform: Adjust temperature sensors MSRs
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tu Dinh <ngoc-tu.dinh@vates.tech>, xen-devel@lists.xenproject.org
References: <08370f3b8b224493b8e66e8503a2fe0d07b73c33.1771600155.git.teddy.astie@vates.tech>
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
In-Reply-To: <08370f3b8b224493b8e66e8503a2fe0d07b73c33.1771600155.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ngoc-tu.dinh@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1FA07178BC8
X-Rspamd-Action: no action

On 20.02.2026 16:53, Teddy Astie wrote:
> Temperature sensors MSR were previously assumed to be available when "DTS"
> CPUID bit is set. This is not really the case :
>  * MSR_IA32_THERM_STATUS is gated behind ACPI CPUID bit, only DTS-related bits
> of this MSR are gated behind the DTS CPUID
>  * MSR_PACKAGE_THERM_STATUS is gated behind "PTM" CPUID
> 
> Also adjust the MSR_TEMPERATURE_TARGET which is not architectural, but stable
> in practice, and required to be exposed for reliably querying CPU temperature.
> 
> Fixes: 615c9f3f820 ("x86/platform: Expose DTS sensors MSR")
> Reported-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -89,9 +89,26 @@ static bool msr_read_allowed(unsigned int msr)
>          return cpu_has_srbds_ctrl;
>  
>      case MSR_IA32_THERM_STATUS:
> +        return host_cpu_policy.basic.acpi;
> +
> +    /*
> +     * This MSR is present on most Intel Core-family CPUs since Nehalem but is not an
> +     * architectural MSR. No CPUID bit enumerates this MSR.
> +     *
> +     * This MSR exposes "temperature target" that is needed to compute the CPU
> +     * temperature. The "temperature target" is a model specific value, and this MSR is
> +     * the only known method of getting the one used for the CPU. On some CPU models with
> +     * Intel SST-PP, the "temperature target" can vary over time.
> +     *
> +     * We assume all Intel CPUs with DTS may support this MSR; but reads can fail in case
> +     * the platform doesn't actually support this MSR.
> +     */
>      case MSR_TEMPERATURE_TARGET:
> +        return boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
> +            host_cpu_policy.basic.digital_temp_sensor;

Personally I think indentation wants to be three deeper here, but this is one
of the grey areas of our style. I may take the liberty to adjust it while
committing.

Jan


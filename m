Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH5rOanTr2kfcgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:17:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5450E2472AA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 09:17:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249866.1547249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzsH7-0001ln-Fi; Tue, 10 Mar 2026 08:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249866.1547249; Tue, 10 Mar 2026 08:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzsH7-0001jp-CR; Tue, 10 Mar 2026 08:17:09 +0000
Received: by outflank-mailman (input) for mailman id 1249866;
 Tue, 10 Mar 2026 08:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzsH5-0001jj-UG
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 08:17:07 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8683dd29-1c59-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 09:17:06 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso32667265e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 01:17:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541a6bc3bsm60097875e9.2.2026.03.10.01.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 01:17:05 -0700 (PDT)
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
X-Inumbo-ID: 8683dd29-1c59-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773130625; x=1773735425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fRACD4x7N8wd8Fy91xzLuO2yKCsx3uFmszHJJ8SyNGg=;
        b=g9xoQwi5jmkPEpoWKnL9DPj3AxCaZzUTRCbJ99d3j3j5h4at9wPJR91iuCz/um3fPh
         xYClO+X7xNcBJvGnMuMo+PirmTsmpV7eNT9HDZuZqSoQGdEpXwq5qZK+pIE/NMBr2dKZ
         4w4UvXpE1a1e8beNrv/7N5vpU2gHVIuvmQ0y1vmX66OUrPpuqkGraa8wc6mD6ZDixDg+
         XMYnjI44NmJbAHTYqpu7cLV971aKD+pX1liC63oWGUjvoCxxJ/stAuq0iMFIfE9zcR/r
         FG6bspRsUYM1oC+Mg6p27Nua9dgGzJgPw6kKnP1yAhvj2UuT/P7AgKvOJbEDTe9TQzbF
         pWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130625; x=1773735425;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRACD4x7N8wd8Fy91xzLuO2yKCsx3uFmszHJJ8SyNGg=;
        b=xB7sVPzw+Pw98iJtCDAzOrXvzrwJWuepwN5X7cm4vK101Egnfnrx+4ZD9KeOr1lD1C
         wNpsBm34qWyCtFw3wh7EogPgBmjjhBDvUJiVxHruEHEK7iDpnIRNATNxbrnBV9ObHLES
         fGo3VEd4AyfrQXuehRFIiqqS2TVNVcVc6DJ1lp8sm0uFr+5P+ErZyOc6bizfelbJZcFe
         h4WAL9LPUpPXyDnrTczRXLWznhbosxQ/B3JFAZkJ9WMdji9c81kkpeZhQtnov40HCIgT
         7ZS7J28X9slrmZ28rQa9fevfyOMlM9FenOloi5hgqUxUpMRdzdX+y2qZmeGHO7yY4o+M
         /liQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHUojwm4RZoI1Vgxf/Q3Oxw4SQTQrsbI2D8241iyFa/LKZ/L7F6NfJYntj2/W4IblKKWq+Sh5fhV0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzn7ZIqG+/H57VSUwKrsiLuiZ7aqAv6lYxxRA1hO6ahA9NltMUP
	nO0ZHy9rh9BL1MPmXvF5M/c4sEVvV0prqDbthmjC6w02AIie0tEXACzQx+4stwk0oQ==
X-Gm-Gg: ATEYQzxYxS+YlZSAHAjXJ0xkK4QVtBurqLAi96V/O0hgZT4c+c7i+lO2dPI1iCZeDbx
	atHI0uvsuCXkXFYYM0+rVWwM6oTPikTocP5i1zFoEd4FYJnBN0eSP63JbGcwPUJo2K8DihZKmYs
	r5rEND1ixWnSKpx7BzhRukzjNQh6p2r5CKp/nnfLkzs43uwE8DbuuFSghromvAj/53nEBLzYtVm
	/ysnOA+HAx3cuyx5hsbyxsZu/cHcWGtO6fPW8jv51/nDX7Ky9JkUxLuE5fvwHInRAQgkWF+oDO6
	CpZGwZHfcxvGAua9F45otW4a21cZDMAhl570LrwQmUpnvB8CwOFC1AjiFQ/3LV57Sb+iAaXJQGP
	xgf8cu3AMvI/FmWHwh3mbN4OCiuSwCEwwKuC7rCQyxY/1KSTnjPOLTLNpVlKe7WmpgS5bRwEnus
	A9xUWvIw86d5bPFj+o9IQahv6bDiyB+d5uXY9FOBOcRAa/wyT47Cn5GALO89ZXmR+9MCUyexjrP
	5MN3DWZ//LtxjY=
X-Received: by 2002:a05:600c:5250:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4852fe93587mr185229035e9.15.1773130625377;
        Tue, 10 Mar 2026 01:17:05 -0700 (PDT)
Message-ID: <6a4d68e3-e640-4f74-be74-132f094db752@suse.com>
Date: Tue, 10 Mar 2026 09:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
 <3201951150104f17593e16c7ba00ada51ac1e10f.1772814110.git.oleksii.kurochko@gmail.com>
 <2de7f459-00b3-4968-aaa2-9067cb0c4aa4@suse.com>
Content-Language: en-US
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
In-Reply-To: <2de7f459-00b3-4968-aaa2-9067cb0c4aa4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5450E2472AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 09:11, Jan Beulich wrote:
> On 06.03.2026 17:33, Oleksii Kurochko wrote:
>> +void __init init_csr_masks(void)
>> +{
>> +    /*
>> +     * The mask specifies the bits that may be safely modified without
>> +     * causing side effects.
>> +     *
>> +     * For example, registers such as henvcfg or hstateen0 contain WPRI
>> +     * fields that must be preserved. Any write to the full register must
>> +     * therefore retain the original values of those fields.
>> +     */
>> +#define INIT_CSR_MASK(csr, field, mask) do { \
>> +        register_t old = csr_read_set(CSR_##csr, mask); \
>> +        csr_masks.field = csr_swap(CSR_##csr, old); \
>> +    } while (0)
>> +
>> +#define INIT_RO_ONE_MASK(csr, field, mask) do { \
>> +        register_t old = csr_read_clear(CSR_HSTATEEN0, mask); \
>> +        csr_masks.ro_one.field = csr_swap(CSR_##csr, old) & mask; \
>> +    } while (0)
>> +
>> +    INIT_CSR_MASK(HEDELEG, hedeleg, HEDELEG_AVAIL_MASK);
>> +    INIT_CSR_MASK(HIDELEG, hideleg, HIDELEG_AVAIL_MASK);
>> +
>> +    INIT_CSR_MASK(HENVCFG, henvcfg, HENVCFG_AVAIL_MASK);
>> +
>> +    if ( riscv_isa_extension_available(NULL, RISCV_ISA_EXT_smstateen) )
>> +    {
>> +        INIT_CSR_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
>> +        INIT_RO_ONE_MASK(HSTATEEN0, hstateen0, HSTATEEN0_AVAIL_MASK);
>> +    }
> 
> The 3rd macro parameters are now redundant. At the example of INIT_CSR_MASK(),
> you could now have
> 
> #define INIT_CSR_MASK(csr, field) do { \
>         register_t old = csr_read_set(CSR_ ## csr, csr ## _AVAIL_MASK); \
>         csr_masks.field = csr_swap(CSR_ ## csr, old); \
>     } while (0)
> 
> This would reduce the risk of incomplete editing after copy-and-paste, or
> other typo-ing.
> 
> Note also that ## being a binary operator, ./CODING_STYLE wants us to put
> blanks around it just like for non-pre-processor binary operators. I'll
> try to remember to make that adjustment when committing.

Oh, I'm also going to replace the bogus CSR_HSTATEEN0 inside the
INIT_RO_ONE_MASK() macro definition.

Jan


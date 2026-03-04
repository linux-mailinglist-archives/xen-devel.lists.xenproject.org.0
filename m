Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N3SA5hMqGmvsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:15:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B5202614
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245592.1544948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnwS-0001lh-7O; Wed, 04 Mar 2026 15:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245592.1544948; Wed, 04 Mar 2026 15:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnwS-0001jB-3p; Wed, 04 Mar 2026 15:15:16 +0000
Received: by outflank-mailman (input) for mailman id 1245592;
 Wed, 04 Mar 2026 15:15:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxnwQ-0001j5-H3
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:15:14 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eebe7bf4-17dc-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 16:15:09 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4838c15e3cbso63626675e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 07:15:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851a82cdf7sm24196915e9.0.2026.03.04.07.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 07:15:08 -0800 (PST)
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
X-Inumbo-ID: eebe7bf4-17dc-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772637309; x=1773242109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yX3yE1gNgEZzFEo3P5s6U8ni5U3DyiFcDvDdauRDwkk=;
        b=eDW2DyMwwwppWw6Zmd/bNxJNBa26id0+YSxvR8CAVX9mZuomP4uY/RY4XaEoNqbQ9d
         fFqsm6y9JCCwtyM1M0cWompjbH+FOieOnvzC5AQepHxWzmTUPOgrodB3VJkaUNkkpD9m
         zzt/07HrksGY/Uv67M0ajhdSQKJi9cphmId0KsNnxyDQiIQGJGpad3ZuJ7Tq37UkhpwS
         IwhIcOXr/Nf/U82JWL2UJuOTRapltT0zY1yg3BAlilLBnL+adwDB+6cL71SX+gbz+Fs9
         i49pluSLx0KctcGaKx5V2vDprx+ItRWp2WiU5nTpNSO9xvPqFd8k6y1I3UZIFI3zM331
         xoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772637309; x=1773242109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX3yE1gNgEZzFEo3P5s6U8ni5U3DyiFcDvDdauRDwkk=;
        b=s+XUctOhz15bH/Tqam3FcMMmGPKGJy6SEM6twnPdNBUlQq0ahxO2uhrC1S4psGGBkk
         EYwa+T+ghKpPMH3kW2uVtYNFTzUdQ1tKnqdGQ2IeHHlTShAg2HZGgnALw1Czeyg5UVCV
         8go9JU3P1EE5AVoT1YR7mMuEb+tQnkhbXaA9hybKRCj4MpXBDb1DQXchEOZaPf0vjqKM
         ZUA5oIS7o8iK9NxCjBASF2nCn5YGNJTfLPSJy48W+pPKTxlneuQrNdDr6EyzBk/YRPK3
         DzyJc0A6GapAlGWinfspKNMVZRfPjn7HotWaT+ioX6u5UxB0ey5/onwkeqhvHgpk6w8c
         4aaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWjpgSat+Yak9wL92RsYFPOCI92yMclAdhKH3lGodG3uYnb4GMGz40HQWG2xNzZUYEkJ9qwPCGz3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPEVdSkQ6n2OyY96Za+h35yPPvj5GVv3bH+SNtcaNnihQEzwS8
	pF7c+/IHtpYXD9H/aT2GDSMnCOag2vWD/d8MkBdKuUg+2ngts4q8JUnPY+f4gTm5FA==
X-Gm-Gg: ATEYQzyHaUKe25NzBo4TEpBfOCt+PfDEovEG2b8zxNPw+Kec8xgtY644d5MaJXO62nn
	RV5XDg+upccJgWqAeMuF4lnDcUoY9qZIPk4KdHVTquWv4AWT4Mye6+kSDK1364uLxBHnvH4ruat
	vFZKEZ2J1rFUUP2VSS6F7jLxPfUG7h2ILEjYD/mYprXVF7c9XBJCqiR44rJP2NTxTQdWaEmiIfI
	3hCeOQ8ErU2oZgZfSLq6moLzn+sKehtwnrdtDhD012k6opA1VB9XvTix1E99EyhZsLd/+YqnOSE
	rdISlwd/pqJh1ijbm2mfmhYuBxgvT7BvQxqMKMaN43w77Num/n1Knrj+a5wu74u7MRUutNErxgh
	rLFYuruu2f7q9ZhHc/M5r9uwzsQKB6zzftPO/L94Xr42LSdPO28SGsCfKIP9z5MoxQ/D7UEtY5b
	lxM//ggi2MW0Xr2Ms9iKWBea+sHEGnWxePrp3jsG1CNgtS3r90UaoDU09uLt+1i2P/3xnKZfHGs
	mbuTefpBSWh2jo=
X-Received: by 2002:a05:600c:46cf:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-485198cb8d3mr36295325e9.34.1772637308574;
        Wed, 04 Mar 2026 07:15:08 -0800 (PST)
Message-ID: <675ae59f-52fa-41a9-b15e-b889313a88ae@suse.com>
Date: Wed, 4 Mar 2026 16:15:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/14] xen/riscv: detect and store supported hypervisor
 CSR bits at boot
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1772016457.git.oleksii.kurochko@gmail.com>
 <a17b6a117726904a9384dc7d9cc140672d3b0453.1772016457.git.oleksii.kurochko@gmail.com>
 <4b67f8cb-43d4-4f18-b2b6-156e21330887@suse.com>
 <7e1f3962-2dd0-4843-8976-40452437a52a@gmail.com>
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
In-Reply-To: <7e1f3962-2dd0-4843-8976-40452437a52a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 759B5202614
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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

On 04.03.2026 15:54, Oleksii Kurochko wrote:
> On 3/3/26 1:23 PM, Jan Beulich wrote:
>> On 26.02.2026 12:51, Oleksii Kurochko wrote:
>>> +void __init init_csr_masks(void)
>>> +{
>>> +    /*
>>> +     * The mask specifies the bits that may be safely modified without
>>> +     * causing side effects.
>>> +     *
>>> +     * For example, registers such as henvcfg or hstateen0 contain WPRI
>>> +     * fields that must be preserved. Any write to the full register must
>>> +     * therefore retain the original values of those fields.
>>> +     */
>>> +#define INIT_CSR_MASK(csr, field, mask) do { \
>>> +        old = csr_read(CSR_##csr); \
>>> +        csr_write(CSR_##csr, (old & ~(mask)) | (mask)); \
>> I (now) agree csr_swap() can't be used here, but isn't the above
>>
>>      old = csr_read_set(CSR_##csr, mask);
>>
>> ?
> 
> Agree, csr_read_set() could be used.
> 
>>> +        csr_masks.field = csr_swap(CSR_##csr, old); \
>>> +    } while (0)
>>> +
>>> +    register_t old;
>> Since the macro uses the variable, this decl may better move up.
>>
>>> +    INIT_CSR_MASK(HEDELEG, hedeleg, ULONG_MAX);
>>> +    INIT_CSR_MASK(HIDELEG, hideleg, ULONG_MAX);
>>> +
>>> +    INIT_CSR_MASK(HENVCFG, henvcfg, _UL(0xE0000003000000FF));
>> This raw hex number (also the other one below) isn't quite nice. Can we have
>> a #define for this, please? It doesn't need to live in a header file if it's
>> not going to be used anywhere else.
> 
> Sure, would it be okay to define them inside this init_csr_masks() or at the top
> of the file would be better?

Either would work imo, as long as you don't expect other uses of these
constants. Personally I'd likely put them not at the top of the file, but
immediately ahead of the function.

Jan


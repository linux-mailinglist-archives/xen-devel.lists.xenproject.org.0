Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPjlEUz5r2mmdwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:58:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9823249D3C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 11:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249996.1547406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzumi-0000xm-E2; Tue, 10 Mar 2026 10:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249996.1547406; Tue, 10 Mar 2026 10:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzumi-0000wK-B5; Tue, 10 Mar 2026 10:57:56 +0000
Received: by outflank-mailman (input) for mailman id 1249996;
 Tue, 10 Mar 2026 10:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzumh-0000wE-47
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 10:57:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc8fcf2f-1c6f-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 11:57:53 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4852ff06541so30154225e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 03:57:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485244b6e9esm202889655e9.5.2026.03.10.03.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 03:57:51 -0700 (PDT)
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
X-Inumbo-ID: fc8fcf2f-1c6f-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773140272; x=1773745072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GDrKToaCfFiwyWhaD+7oB4TG1h69l9pLvYTca8ZWrOY=;
        b=Is9tX7uQZ8+u4WKo8vGGV76aaOpN+OVvnetrxGn0cXVbj7vou7UUVGDK3m4L5M4hGE
         MGxrkU8dqioYaPRdzFNVP9iySWp4tWBM8gMWQoyaXLRH9AZeicY6zLDwYoawIUSuFSnp
         Wvd5pW+DnMsmItEfJq1Nr3lY/KIdeclVINdKNU0zgptzbk6g+3ICtR4Rwh1XdVRUkwed
         lRgjq1JOne54RO/VrDf3no2MpxCi+CHThvHMEfkFl0MoIKAQg5l/lHBZaF/xf6dTq0LD
         LRO8v2+490TqUyeyREov/rdown7N1z7q1aKZ4LmY1giaw9niZHAHc4CQg5PG8+365pKg
         JwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773140272; x=1773745072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDrKToaCfFiwyWhaD+7oB4TG1h69l9pLvYTca8ZWrOY=;
        b=X1E9bcMhN9g7f3sgviA8Wiuj4kWiSdAPEtPa8Kwhc8Rnfkjc10yvMJQngB7WJgwE7i
         Y/Q1lVaqS5Uk6nZFJHkqSHZj3D5f94oVWbsJNYuWlcqX2itW6u0K2HT71/YIiIpD+OW8
         OSkeIJh4JjQMV0wkla0IucNHZWmeZXl4LwC5QTBNzSQNFj9blpsLt/v3Csdy+XJ/f7D+
         nXGb1UHwIY0JnY90uPakxbkkUJRwZKJfd9liV2QEUvFWNQGTjA+NkQkJyB/2n4jqagCq
         KU+1uTr6Dd0WWrsp2Q2Pd1fvYKfgtOgqE2EjL2U6opfWb9hwbYpP9wW5bXj/vT4O2uez
         REFA==
X-Forwarded-Encrypted: i=1; AJvYcCW6OQoHTvdR7gzEo2rd9yuM8+PPETv+8LK9V/u41Tmbs5adRNvPAZcSRyXDk05LOKCYY+Rn1WYF3XI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxa6/+PEueg3johBPRyB5uCI08QLSeG/QKiPDRE2sXDyMHO3sCO
	zOj2w3U3PxkU5Douw/J3yD+NRwQDqRykWwV1XVDaqIIRuXNQvXwCZ255BsRJ2WgJMw==
X-Gm-Gg: ATEYQzz1rt4pcEEZo9ZJM9d5z6ykWIvFN8hnwBo7uS/A0Z76+9CZzz2LUbdwCiHKUBx
	5TXMrXO8McpbFS+CIprSf2h2wCnXAlSzN9d++VH9HkyF/ovgDQBX9Yr2zGo/37tH7x0jPVZWPqq
	Yqx46tVOD0xJ+wZ6wjth/3r/Gjd1FdQphGONeMwDflKJ5xLrsTr3ILuOU6M70hAEBVvNLwuLP1w
	h9Aq/mOsri5Cq206v6nQksqCl9nabCz77QZOrN7FbUdEr+0vjQgzte+RMzr37sTrW10e2VvAXUO
	wXkhT0UirkD3e2tDG1f6UjFwpnHCPub88VVBUQOwksX/seBduKyx9CPy9OB0NEc/27PMe50qbhV
	QUs0AblR+K9DoAg7g2ljnmjEg3F/2Y7AvSXn5c4R8n7WNHH9zWswgKq53OsiQ2DFQT2lBjlNYvx
	cJnve643C9LhzJe8X47+XIaorfZ/oAgv3D38brhNsxBLm/ey21a2Z7emwRpPDHXbJ41VGCm4Sd2
	FO7K7n/8QXSdOQ=
X-Received: by 2002:a05:600c:1e88:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-48526916beamr265027065e9.7.1773140272233;
        Tue, 10 Mar 2026 03:57:52 -0700 (PDT)
Message-ID: <785c0042-55c6-4738-aad3-fd88bee3f047@suse.com>
Date: Tue, 10 Mar 2026 11:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86: Remove x86 prefixed names misc
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
 <20260304195350.837593-6-kevin.lampis@citrix.com>
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
In-Reply-To: <20260304195350.837593-6-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A9823249D3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[boot_cpu_data.family:url,suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 20:53, Kevin Lampis wrote:
> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -216,12 +216,12 @@ void disable_lapic_nmi_watchdog(void)
>  {
>      if (nmi_active <= 0)
>          return;
> -    switch (boot_cpu_data.x86_vendor) {
> +    switch (boot_cpu_data.vendor) {
>      case X86_VENDOR_AMD:
>          wrmsrns(MSR_K7_EVNTSEL0, 0);
>          break;
>      case X86_VENDOR_INTEL:
> -        switch (boot_cpu_data.x86) {
> +        switch (boot_cpu_data.family) {
>          case 6:
>              wrmsrns(MSR_P6_EVNTSEL(0), 0);
>              break;

I think here we would benefit from switching to Xen style at this occasion.
Fair parts of the file are already Xen style, and this function would then
end up almost correct.

> @@ -362,7 +362,7 @@ static void setup_p4_watchdog(void)
>          clear_msr_range(0x3F1, 2);
>      /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
>         docs doesn't fully define it, so leave it alone for now. */
> -    if (boot_cpu_data.x86_model >= 0x3) {
> +    if (boot_cpu_data.model >= 0x3) {
>          /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
>          clear_msr_range(0x3A0, 26);
>          clear_msr_range(0x3BC, 3);

This may want leaving as is, to match the rest of the function, but ...

> @@ -387,16 +387,16 @@ void setup_apic_nmi_watchdog(void)
>      if ( nmi_watchdog == NMI_NONE )
>          return;
>  
> -    switch ( boot_cpu_data.x86_vendor )
> +    switch ( boot_cpu_data.vendor )
>      {
>      case X86_VENDOR_AMD:
>          setup_k7_watchdog();
>          break;
>  
>      case X86_VENDOR_INTEL:
> -        switch (boot_cpu_data.x86) {
> +        switch (boot_cpu_data.family) {

... this (again to match the rest of the function) would want adjusting again.
With that (again, happy to make the adjustments while committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMpFCmJ7eGkFqQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 09:46:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6DE913C8
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 09:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214103.1524491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkehR-0007zV-NC; Tue, 27 Jan 2026 08:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214103.1524491; Tue, 27 Jan 2026 08:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkehR-0007wR-JZ; Tue, 27 Jan 2026 08:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1214103;
 Tue, 27 Jan 2026 08:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkehQ-0007wL-4t
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 08:45:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 829e96db-fb5c-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 09:45:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee807a4c5so56068155e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 00:45:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bee30dsm43677975e9.6.2026.01.27.00.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 00:45:18 -0800 (PST)
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
X-Inumbo-ID: 829e96db-fb5c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769503519; x=1770108319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j0lunYaDLihrnJO5eAtL6TCuk7qVk3WpMu49PZnkiLU=;
        b=KWaU/SUZJ3gyMyLJbDlMPAZbe/tTSdL9kg2YJRT9A3uvLPuDLtQXMha1E2MVROSjzo
         yasnhNovEe2qE1aX1vnm/SCLatyWnYcR6q+C4ZhKN2an3CAOyE6oN+99jlGwEO5C4H+b
         J/vQ9+ibadYyQ+68X+48mY5lQCscNPe3jC67SValdd+e8e18jf2YJF6abOgmQjHwFmZT
         gkXMGmvy0Q7ANLSzoH/qRThEhXMYHOiHKht0sYINjh6bSUnBF/Q4/KblDMyRahmmzmoC
         hjf8dWLWOrPMH5zCnRYag3ljMCtnGjzOUltLEkgAoMQvVolpG1ZPvPjArkzVZ2Y8UQ3J
         Xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769503519; x=1770108319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0lunYaDLihrnJO5eAtL6TCuk7qVk3WpMu49PZnkiLU=;
        b=YsY0cAa6q6GGs5GfmN0kc4BEMoeYiq4MpriPVKh39XnHvDUQxvI0SDM6kMKzMpEHcE
         pymYhTSFbB/0X/QE5Jz/soIsr7TfNVHxaU8xHjh4sBlX4t5dgraEtTrwc9cj+4zaufeR
         PGrDBvET9iDX1ORewggIUgO/k81cw0op28p+XOXqXvK5QyvjQzdTisEgCTjsr7G1+GHJ
         Q1yazJ6kK/nNLSLcsBWQCuADx3x1CfYNlqzscPrEOvpnneqy0oMybGVEseDnUl03P1e7
         bKE0ytzioXJtF9kn+J2TMPhwrcg6fUeVz+meHGkVFDgA9rZLom3jFdU+rcq5zvJoijnu
         rgJw==
X-Forwarded-Encrypted: i=1; AJvYcCUd1i9/E+g69d7S+RZnUXbtjlsqdidViqSzeVy4gBoN8FazPNB0IjyLLkLE6azS43n+X/pxFm7pBgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAS+lGu7MjaoIORQoZ09GZFl5JetQwb6xUe9gqY0BWyqo5Tci/
	G7B5PAD2WVbtaOg61e6YaHiUHnwbHiuMf9m2AMJeua/GG+IkKf73iv8Y/xxySKbpig==
X-Gm-Gg: AZuq6aK3KNpCRxHlMX35CGlus75WKNMvsxgrgFW8yTwIsmSIj+wIX5JyHJMYVjnKnHN
	tC3+nM+sipu7r0l3NPhqb2mTP1cTObAVkqEq0AYtT6B7O1OJYF9LAU/uc37GFcp7/BX+Vtgcfj6
	Ae0VoWfc1r2abO32ZD6etalaIoWN+DzXQWsN4sboJ3YaSiiNXukzemD1Dn01CNf0ykoFCl27Wmg
	ZLerPJidF3ZJfdihvLiQq3XSBrwATcljOpmTT11J346tpmYY9GvRrGsOJWYTwVdh2/SVbCg/2Uj
	grIHID/zQpcJy1u/JQcjI9PKcQN2HoTZa8PVNiHYHhlG0oBaiS5A+3+IbkF3HEwq0uAXQ5i6MZY
	5ndQ7r6ikM2VcjcZ/F+dG0Z+MEoxyesOrjIXEiT2WCjM2+fMQPRH4TmJtzssqrp5MtQcUE0Fi71
	01pa1ZbRMDS8PTC82nELly6mDY02zL2Nunw5YUOUGKzzBqzHZHd5j2A3XTdCXZu5Lspc3tS68W1
	ms=
X-Received: by 2002:a05:600c:1992:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-48069c74078mr11165435e9.33.1769503519088;
        Tue, 27 Jan 2026 00:45:19 -0800 (PST)
Message-ID: <caf342ec-33bf-48ca-90f0-28129a10168a@suse.com>
Date: Tue, 27 Jan 2026 09:45:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cpufreq/hwp: move driver data into policy
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <8441ada5-e2ed-4d79-822c-ecf1ce3c9484@suse.com>
 <26ef0e68-efca-4b9a-a210-76b5426da130@amd.com>
 <8bad1a32-d59c-4dba-8c35-b28fcb16f39c@suse.com>
 <3b9a40d3-ecd8-44cf-a310-620ed55abc68@amd.com>
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
In-Reply-To: <3b9a40d3-ecd8-44cf-a310-620ed55abc68@amd.com>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7E6DE913C8
X-Rspamd-Action: no action

On 26.01.2026 21:17, Jason Andryuk wrote:
> On 2026-01-26 04:08, Jan Beulich wrote:
>> On 23.01.2026 23:35, Jason Andryuk wrote:
>>> On 2026-01-22 04:42, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
>>>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>>>
>>>> -static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
>>>
>>> ... here is tracked and filled per-CPU.
>>>
>>> Do we need cpufreq_add_cpu() to force hw_all = 1 for HWP (and maybe
>>> AMD-CPPC) to ensure that policy is allocated per-CPU?
>>
>> ... this being a correct thing to do, hence our code imo would better be
>> resilient to it being different somewhere.
>>
>>> Are we implicitly relying on shared_type == CPUFREQ_SHARED_TYPE_HW to do
>>> that for us?
>>
>> Right now we do, I believe, without - as said above - this being actually
>> mandated by the spec.
> 
> HWP doesn't need ACPI data.  I wrote the driver according to the SDM, 
> which is just MSRs.  It's Xen that needs ACPI data to initialize and use 
> cpufreq.

Maybe we should see about lifting that restriction then? Becoming
independent of Dom0's xen-acpi-processor driver would be quite a
meaningful gain, I suppose. See e.g. the thread rooted at
https://lists.xen.org/archives/html/xen-devel/2025-12/msg01114.html.

> Regardless of that, it looks like the checks for cpu_online() and 
> performance_pminfo[] would constrain CPU accesses, so:
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBzcKW73jWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:53:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11212F20A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229392.1535361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYzx-0006qa-Hq; Thu, 12 Feb 2026 15:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229392.1535361; Thu, 12 Feb 2026 15:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYzx-0006o8-Ei; Thu, 12 Feb 2026 15:52:57 +0000
Received: by outflank-mailman (input) for mailman id 1229392;
 Thu, 12 Feb 2026 15:52:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqYzv-0006nz-Oz
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:52:55 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4116610-082a-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 16:52:53 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4359a302794so10780f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 07:52:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783dfc55dsm12757517f8f.20.2026.02.12.07.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 07:52:52 -0800 (PST)
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
X-Inumbo-ID: e4116610-082a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770911573; x=1771516373; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TVU4LvAFto0AsoBWVrkvW779D6IJdLhue9W/0fGfHog=;
        b=Sm3RUdrqVjvm5dAXOPPytsPv7AJvkxl39TLcN0ePaX7Iz9+F1x/TXSYHtfkDKoIvNX
         o+goP7MCb6w16M0F6JBfk1kwLAN9JrWsmDxMQe3TDMxzjWDgjIHVTzSvkpRUp3PETjfh
         4l3hcxj5ZZXQumRkprw/T3MmL6jFooOH4zDabMV2Z/O2hQQxAa6Ok4LNmePS1eFAeK24
         lMVvK6HrFNjSb8xmeL7hdZLOwsILYQKPZM979MMrRrSAXJeoi+ntVL2YAg3QHugrqid4
         fRwcxYoYlegig+fE2MwDVeCCXXcYx1D1LYNM9Y+veKMkWkIqLm2yPweD0ETaRWghlWQU
         amDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911573; x=1771516373;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVU4LvAFto0AsoBWVrkvW779D6IJdLhue9W/0fGfHog=;
        b=dbeoe5fzvZd/erSYWKdyi1QLvPAM92OM4d0zMBWM9HWzn0KCUl/z7qSAy0vNU5odj4
         S952jZo12imS16sqgswGZuzohVN1Q31Uk5XlFbfi5WraymQPzgxMVdMO/Uv31zoq9Zwy
         wEqU9jsu3eBbMvQHYpVnZuoJ4eohTstIcFpmfpeB2Wfx9dlk2F3jZxQiUEHnTOogG6cg
         gp+PK2ghVG0l8wc+q0DOsVVGd6MYdpqTtiNjv0rs6ihg3EdyTRJ/kZg8zi8vFO3qoWhQ
         aJNp0jLvYXvncqkafaVnqGLdLU6hHpLT7m03PMfD2Rg2+0/3fWHAGDg20pDy6Pv98Ipr
         qH7A==
X-Forwarded-Encrypted: i=1; AJvYcCXw837Kw+fJ7CgusNVfcofpsIcRGcNBHCY/aOFsJSZ8Ht1CTsO8/GwfvFup6YhKlg89ye/x6eIcKm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy93hc2geve8WMOZqFqVRf/Tn2pAlFzTqsP/P+SRkY3TjhL6M9O
	YwHu57ixcURBI9saT2InRe0fPcPM3432t3H7FxwsQEdQZCCQdRkWUhC6hTTRiDBWQg==
X-Gm-Gg: AZuq6aKIOXIr7Yxo1xTwEm0PeFC8FVxyqMrHxilCJkSFZI/Wyp79ksYbCH+zMqaekmJ
	2dR0FbUIpSe2UkY5Ym9DZFlrAr2qd7w8/7z+WGG0VQX62NCQmECdTfimwWt4vR2TGPoCv7FCv9A
	S7ArGUoILV7/l3uKfGoBTcrYkukICuKEVmGgRAkrewpCB3xtaGls/8JoLzLPwK+rXc8oro1QHwp
	fhagZNJkQtdkUvUBST8mvNscl2jbs03o3NXz1nCJcBXfXeHT4AR7HnQQZ15BWLaGtf5oHPp9Uy2
	WwgAJgJSn7PhhzyGL5otraZ5fClWBS734uDRqNl6xfgBrgFRMQhqIoJAjn5ezt7KOKXfOwTW90M
	0wUUbr9N76EA1IZqy8BpVdKW6FgZaUDHLAyKE0PJRYLDtgA5Wdjq21ooM04urlUrl2sFk4zL/9Z
	yHjYmSxAGPuoTl0qNB5VDr/4L0T2CzrbrnvCzfBjw+Ysh9SzxAbNlPbicmryeI+oZfyHf9xgnsa
	JVvY2USkcbLT2pUouXHIJYzFQ==
X-Received: by 2002:a05:6000:1883:b0:436:1989:46b7 with SMTP id ffacd0b85a97d-4378acad908mr5778052f8f.15.1770911572829;
        Thu, 12 Feb 2026 07:52:52 -0800 (PST)
Message-ID: <36d3244d-c1cb-4b55-ae7e-9dfa7c632a43@suse.com>
Date: Thu, 12 Feb 2026 16:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/12] x86/acpi: Migrate vendor checks to cpu_vendor()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
 <20260206161539.209922-10-alejandro.garciavallejo@amd.com>
 <3504e0eb-973c-427f-98ac-27801819e175@suse.com>
 <DGD3DFQLJI17.2Y9ML8QC93NOU@amd.com>
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
In-Reply-To: <DGD3DFQLJI17.2Y9ML8QC93NOU@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1B11212F20A
X-Rspamd-Action: no action

On 12.02.2026 16:34, Alejandro Vallejo wrote:
> On Thu Feb 12, 2026 at 12:52 PM CET, Jan Beulich wrote:
>> On 06.02.2026 17:15, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>> @@ -178,7 +178,7 @@ static void cf_check do_get_hw_residencies(void *arg)
>>>      struct cpuinfo_x86 *c = &current_cpu_data;
>>>      struct hw_residencies *hw_res = arg;
>>>  
>>> -    if ( c->x86_vendor != X86_VENDOR_INTEL || c->x86 != 6 )
>>> +    if ( !(cpu_vendor() & X86_VENDOR_INTEL) || c->x86 != 6 )
>>>          return;
>>>  
>>>      switch ( c->x86_model )
>>> @@ -915,8 +915,7 @@ void cf_check acpi_dead_idle(void)
>>>              mwait(cx->address, 0);
>>>          }
>>>      }
>>> -    else if ( (current_cpu_data.x86_vendor &
>>> -               (X86_VENDOR_AMD | X86_VENDOR_HYGON)) &&
>>> +    else if ( cpu_vendor() & (X86_VENDOR_AMD | X86_VENDOR_HYGON) &&
>>
>> While we certainly make that assumption, shouldn't you add explicit checks
>> that APs' vendors match the BSP's, in order to be able to also replace
>> current_cpu_data uses? Or do we have such a check, and I'm merely overlooking
>> it?
> 
> In generic_identify()
> 
> 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
> 	if (boot_cpu_data.x86_vendor != c->x86_vendor)
> 		printk(XENLOG_ERR "CPU%u vendor %u mismatch against BSP %u\n",
> 		       smp_processor_id(), c->x86_vendor,
> 		       boot_cpu_data.x86_vendor);
> 
> But I'm not sure why this is not a panic() (I thought it was). Such check
> triggering can only mean a Hypervisor bug and a security hole.
> 
> Do you see a problem with s/printk/panic/ here?

Well, yes and no. If we settle on the other panic() to remain, maybe this one
would be okay-ish, too. Otoh anything in AP bringup would better not panic,
but simply fail onlining that particular CPU.

Jan


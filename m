Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PnLAfrCeGmltAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:51:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1495214
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 14:51:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214764.1525003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjTe-0000qL-Se; Tue, 27 Jan 2026 13:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214764.1525003; Tue, 27 Jan 2026 13:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkjTe-0000oC-Pv; Tue, 27 Jan 2026 13:51:30 +0000
Received: by outflank-mailman (input) for mailman id 1214764;
 Tue, 27 Jan 2026 13:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkjTd-0000o6-7E
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 13:51:29 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46dcd1cd-fb87-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 14:51:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48069a48629so6832415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 05:51:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066bfb59asm57903085e9.7.2026.01.27.05.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 05:51:27 -0800 (PST)
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
X-Inumbo-ID: 46dcd1cd-fb87-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769521887; x=1770126687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=istqqe0rEvWv+HUvgB7VDvo1joVXj7+I9uV3orz/9A0=;
        b=gz3xsmiABxelRrtIU/+MHTPdWH3af4VWVx+udTD0FnMRd1yF304IAV4qq/+JZpkjZp
         65hdDLTjMJcqzbm0gFD8irALAZaZ/it+zxpWfPJkma8cAzUqctwzJyo9lTIoPMUL5jgG
         SgifL8JVqEnwtHellkJ6GQDW+WilSZ2g5NuISOxMAOpeDkOoEVTq2BYWyiGKkXZFugge
         FOWtlD6x8ZNHbeFyOFc5tcJEjtLycSi70/9BQrfVJ9UBN3Ex58VnTezbwXEmjkco6OHY
         Fh4/a4hhjMy2Y7/7wRZNS3HiD0m5zvMtBuufWqlSLMDDGcm6e6dhNlF2v8qEvOdk5dGi
         EEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769521887; x=1770126687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=istqqe0rEvWv+HUvgB7VDvo1joVXj7+I9uV3orz/9A0=;
        b=EpjhckzoUI+eHffhSKuC+HCp1ksAfyUfyviHW8Zuf3I/GDdpBgwqkj/JyjxsFQIG3q
         YIR9OybGNEYTE6Oc2QgZCgRCYAguZfaaIO0pi3oQYLlm+QlhOqemhBiLVORz/ISbHBmv
         sAfYZ7uSY397ebnKHVmdtu0ErlUSg8ndaboFh+SbzJrgv1I/XfVp7yMlgczb0pPv529/
         Hjwzi2M4qBDUrhzygqrXW41gXQFE742NxkXYfaJfUEUtTaDyGeNNsadYAqEO0H/KhuJH
         M+woWvcTpzHxSdXaddLsibvra68vUzNsfhr32g5sePANR5PA8MDnHeVP54QS323XzufB
         ETRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVV27tU8KV6uAFkvM4YfkOv+3mBoF0UqoSTnY6UJmrwMGugdE76EIsJGTpXe11SkWTtGhZjc++S42M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKsqaVMZcHszRPxXOThzU2rt+EpOvRwq7263Uf4ziv3cMVFFME
	o7iNNlsSiPrZ3q/lpW1Axghp/wdi+flhxFIB8wi8kxvpvv1jgaxKv40x73OOHf/kfA==
X-Gm-Gg: AZuq6aKfui58eo4wquzv7MgFmqN6x8HkTJsui2+HXivvN3TKQqgK4sfkFliZ+J6uqBS
	z8+NeOfxAvDM+9foE8MX4f2zvdR0NXc9qzCwIEN//cYcNNTna5aymi+3eOAAYXNCclmt+uPyt+s
	syEkvemirmBb7R/APpsw8A0WmiCcCtwYoaE6vJuIHh5NMmeaRY6sl4Tu44zPg9tHcoN+W/qWnG1
	8ziP+aVO6VQ+B+WFCVVtI62WX4Y9m3MvaNPxBCD1QLFYbXkoVtHITeFdG0z4bmSVJnbZ2mGE2yX
	mnBqVnxPL/gIqdTVWPXJcdx67xLB7m4K6X6kEVLXZdaxHofnzTbuTqa7HhOWLdssugDX5PfFPYm
	hjpkJKKlqxYoywQL/iHmF2lhgTv8R1zcUfQ0Vl61l4iatCv9bDSo6p3dk/FStZamK9CGmp2Up+2
	vmdbBr6+9s1mPgeNWAU3JY1YdKIsLsmvh7OcAxcrwzxVlwkurdJ7bgnAM90kzGA5rnOsJmIjxke
	Js=
X-Received: by 2002:a05:600c:3105:b0:480:3a72:5238 with SMTP id 5b1f17b1804b1-48069c6098bmr25741335e9.30.1769521887240;
        Tue, 27 Jan 2026 05:51:27 -0800 (PST)
Message-ID: <73799a9d-9834-4019-90bf-caf91ad0069f@suse.com>
Date: Tue, 27 Jan 2026 14:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] x86/cpu: Fold generic_identify() into its single
 caller
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julian Vetter <julian.vetter@vates.tech>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
 <20260126175345.2078371-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260126175345.2078371-5-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6AE1495214
X-Rspamd-Action: no action

On 26.01.2026 18:53, Andrew Cooper wrote:
> This makes the correctness of future changes more obvious.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Especially with the way the diff is presented, could I talk you into ...

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -455,10 +455,13 @@ void reset_cpuinfo(struct cpuinfo_x86 *c, bool keep_basic)
>      CPU_DATA_INIT((*c));
>  }
>  
> -static void generic_identify(struct cpuinfo_x86 *c)
> +void identify_cpu(struct cpuinfo_x86 *c)
>  {
>  	uint64_t val;
>  	u32 eax, ebx, ecx, edx, tmp;
> +	int i;

... taking the opportunity and make this unsigned int?

Jan


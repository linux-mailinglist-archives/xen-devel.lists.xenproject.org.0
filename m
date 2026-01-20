Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CekEiK0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0062D48200
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208918.1521047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBlB-0005yw-UF; Tue, 20 Jan 2026 13:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208918.1521047; Tue, 20 Jan 2026 13:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBlB-0005wj-Rf; Tue, 20 Jan 2026 13:27:05 +0000
Received: by outflank-mailman (input) for mailman id 1208918;
 Tue, 20 Jan 2026 13:27:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viBlB-0005wd-04
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:27:05 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b53c0346-f603-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 14:27:03 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so50799205e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 05:27:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8c05c3sm242097895e9.11.2026.01.20.05.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 05:27:02 -0800 (PST)
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
X-Inumbo-ID: b53c0346-f603-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768915623; x=1769520423; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ro5fZMz1QFlYEX9GcN9zu5ztXhQFBw1ixLnJ/d8V9y8=;
        b=ayVep8E1LCVrhz/yc++D/Vb5/ccHESOqr5rvt7qA7LAGjLKbaBZQtFVffk42OOYetj
         BjKc6WyoQP0uJbGJRVohUrWkcPQtoO2ivRScPjnoYwySlZ1fcfMS9Eg+m3XLWwD3FgHQ
         /nJGxYhnw+JTDkVYkmcxz4PN0evNNJmgiHgk6EcKsPWpLMykZQeL2roA59d4Bh4WM+gH
         3/aLD8Ozi0h1g9dpzlgURZZnkXbrVXv6j/OwbWNPJlByeP50QKwb/geJIWuUX/92X1Jn
         7IbNR8wXYUgylimJljTQL+Z9Loc6/8vyDK2GOF5UbeaEKYHxbLzCRhUXNAOFWA/QoB+k
         1vXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768915623; x=1769520423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ro5fZMz1QFlYEX9GcN9zu5ztXhQFBw1ixLnJ/d8V9y8=;
        b=Cx3X6J2cW+rfbG1M9holE+JZ5Tad6X4gp7LiALyENCR9hK/oufRbBl3Uq4lyJ4lbn+
         eOV7i+sA5QilfKK+L6Yxe2mjRtUcJX9dJlO7sv5VmuEPV5PIIfYW50gDptHWtNcHAfk4
         i5WyDgG0Aa0/FCXptqRTKfIQra0MNn7RnmBmLgC3RUgZ9rnzqHQV1+mTr+67PlyFENYw
         DhxziXn0VOjQbiJOnymhVFJkMvgCNm2vXk41KOCKDAwmyhkeijl03zHNNuOUQ/IQ/a5o
         D+S9y/rbqQyccc3/ynmULzqzaSg47dFd7YJkQ/p2q/3/gS65+zByUPU2/8ChzaV/WvNN
         k74Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTe5pJt1SC+9QG/cjSHQ3ehEApWrCo8JII3ePTkMJZtoYkC0MrSQCQIqJSVAbNrfikcC3jlYeJQuM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8BAVdMnr5itBJLDNUVJbGEV8iX1uFkDeRXKkMXWWEZslZL5xe
	sP5YUwGyWVq6Go1/wxIggg2ckqJBShrVpA7m777vFLgk/6UIx8EPQhRkrjmdE/mmZg==
X-Gm-Gg: AY/fxX6z1OtNTuofqhsoD938/uXO+tslY7WnFFnlpRc4CCGNOJarZwLghpRiFm/0eUq
	SrAZRW3bQcBOHIm0DqV2EU+HEn57exhU1h/5oC4XfW24TYqnzhLM26JbN+3odMwW3G05vBT2RmG
	zdqO0ggqqQFE2CJ4FQxwPJiNbzgE1UsQKhapqEcXXkmzwDbzfSMCEUD8ZDyvPgkFxuyjqz2FxeK
	7WNBzaenlZ4izeYOic3LNRGKgzm5Zty9d96CJMGTcQ9s8DZIHzb5LKo2p9OvxqU1kceGp0wos31
	wXmcew9QUDyPZD9ZYw29Cy7jQ9O48Y+D6CfJJg0WtX14DHlo8ezSDuwjbK09Yb2FB0jowO6QOF6
	mykDJKp9DqQ44IaYR3NoIqPDT1nTpvqyqbPZ+4Nq6KdwGkzuJJl9WADdi4jxfXH7WhfqBqAwie6
	ayjzSFuNEt4q4GeRLn2WJzafaQwuCq2jd7bvjHEADZNWy0cBHQh7u5G7BW4jN+cBXqaO3/7cvhf
	HQ=
X-Received: by 2002:a05:600c:4ecd:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-4803e7e7c57mr22395545e9.18.1768915623054;
        Tue, 20 Jan 2026 05:27:03 -0800 (PST)
Message-ID: <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
Date: Tue, 20 Jan 2026 14:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/svm: Intercept Bus Locks for HVM guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20260120095353.2778-1-alejandro.garciavallejo@amd.com>
 <20260120095353.2778-3-alejandro.garciavallejo@amd.com>
 <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
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
In-Reply-To: <5a4aa1d9-dafb-453c-bd4c-8da860519f01@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: 0062D48200
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 14:18, Andrew Cooper wrote:
> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>          GENERAL2_INTERCEPT_RDPRU;
>>  
>> +    if ( cpu_has_bus_lock_thresh )
>> +    {
>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
> 
> |=
> 
>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
> 
> Really?  The APM states:
> 
> On processors that support Bus Lock Threshold (indicated by CPUID
> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
> VMRUN, this value is loaded into an internal count register. Before the
> processor executes a bus lock in the guest, it checks the value of this
> register. If the value is greater than 0, the processor executes the bus
> lock successfully and decrements the count. If the value is 0, the bus
> lock is not executed and a #VMEXIT to the VMM is taken.
> 
> So according to the APM, setting the count to 1 will permit one bus lock
> then exit (fault style) immediately before the next.  This also says
> that a count of 0 is a legal state.

But then you'd livelock the guest as soon as it uses a bus lock. Are you
suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
all other times?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG3PHD60b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A493482A7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208959.1521089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBsd-00011c-Db; Tue, 20 Jan 2026 13:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208959.1521089; Tue, 20 Jan 2026 13:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viBsd-0000yV-AZ; Tue, 20 Jan 2026 13:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1208959;
 Tue, 20 Jan 2026 13:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viBsc-0000yP-S2
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 13:34:46 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c88f307a-f604-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 14:34:45 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47f3b7ef761so30785565e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 05:34:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801fe44b37sm102211415e9.12.2026.01.20.05.34.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 05:34:44 -0800 (PST)
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
X-Inumbo-ID: c88f307a-f604-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768916085; x=1769520885; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yh6uUep2v4139MULI5v+0nX6QdvAhnoFj/UdwM/pElg=;
        b=Z5TH5zL6qjYnS7F0L66RNWZve4srwmPWuhCftvonvJAmmh3GxQWo+X4LjCVls+aO1i
         d3IgzsqpOQpUigyEpakbbSyxA5An4iTdpDX7HUjk2JawMBcR/sS1+XKPPCls0O15rnZn
         D1cv1+Re3pp1wFjt4J4xzP/Ma1cPrSDehd/jqp8RFhg50BhkVFiSXuX7rD5/ArwcTysx
         r5lNleJLzhuseXBhSrGyZ8HO9JQVVDxXyjo5bJ4gaw2R7CFYywvTqscsvrODt4unetq6
         CdCF6RhtWT3QKuypbBIpvfqbVneS06PZP07HlJYjH0hpi1QZVzGpl2ED5qF0st/Uaj6r
         rDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916085; x=1769520885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yh6uUep2v4139MULI5v+0nX6QdvAhnoFj/UdwM/pElg=;
        b=Oh10pZ5vToM9irEY0RIgX63MdD+x64ubSGzX2X39/pF0OEfDujsqYpyMOQrDQTe7lI
         zvyD1JXBBi+fqeB339O9/CBhBX69LMuO+MwbV9ZqHRCIcE0WB1eIjRnxQH6dHIbGuboA
         RFDP51MxQScR+1wVMjQ5xGdjTkyVlNtg6bBaj7/9Mg8slOk6GwSQoswfLuZqd4RU06UW
         XXGMXXx5PrqRD2x39c52Qp2UBWSePDNQYB6Bkv+/oblsF5NlweiVnXfkQ5gejyreLtIx
         8U1voBi03Dq4OUVgEDTZRT1K1LOHPaWxTEtIzqAQYuq/HY6TfSWIj/5CAdIpZkI1dXJF
         V5gA==
X-Forwarded-Encrypted: i=1; AJvYcCXxceqlZdDmcdlHbQLx1yIDUKVTA/Ti2fspgKq2T5tJOD5OoXoGoZn05nEfu2L3g2N9VY4+fnH/suI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIabXImXkZgwHhovcsqyOTD8LJG36LFM2bd9Nv/q1hsWC0jSuz
	2HcmmfR87eujILZw3upwAvhDHXAeo8VAYSGZiVgu3T9FhOy3Owm6D1KoDx88Uu8eFg==
X-Gm-Gg: AY/fxX7w+T2mDawDWVykPmkyjnFHypwxG8MKCDLoujZtSqQvqB5KB2eSEACTJIe/aYJ
	hQ4PH4K2qxhzaBrQEuFNb6OmZ/1ibFJ/aLv9I7c5hA8YvtiagqKVby/KLP5jUNsvya/bZVp16r3
	wLzeaeW5EtDIsvNwCXixIHgfoAsDgIcxbfS0RtNfljjSPlP/yqWb2cC2VPRrBr9FrpZTE2iHh0U
	xIyw5StCZ+Unh1n6oxQtx+m1dOfrICTeMKrnZUiRFuAomYL9+Nla2oYF0aSbBC1dmS2zb6/DqNq
	n6aBxJqg5AvIE8XDzwN/c0qbSp9wicmcbi8DllIyiwD84RVBS5GutVhlOP93Ro4DrW8Vssxw21g
	aF4YVTMOLFHYJILuTTub0LQpgIevoJ1LwzFGKqYkS/T8YO8LJUajjRTHMVYn6WQXDdRqU9wNqK2
	VoovxhRyJc4dlBt9OW0FcEgRHTBg3yw3SZ0QdOcXGrrsqlMtlHNzN8hgjwj0mXT9Hhrs2Ammk8b
	Ts=
X-Received: by 2002:a05:600c:4e05:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-480416867d8mr5249075e9.21.1768916084924;
        Tue, 20 Jan 2026 05:34:44 -0800 (PST)
Message-ID: <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
Date: Tue, 20 Jan 2026 14:34:43 +0100
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
 <00f36b33-65d5-4681-84d5-e1b2cbd8830d@suse.com>
 <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
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
In-Reply-To: <b8df289c-a770-4186-b922-dbfba1bbbfc6@citrix.com>
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
X-Rspamd-Queue-Id: 2A493482A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 14:29, Andrew Cooper wrote:
> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>  
>>>> +    if ( cpu_has_bus_lock_thresh )
>>>> +    {
>>>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>>> |=
>>>
>>>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>>> Really?  The APM states:
>>>
>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
>>> VMRUN, this value is loaded into an internal count register. Before the
>>> processor executes a bus lock in the guest, it checks the value of this
>>> register. If the value is greater than 0, the processor executes the bus
>>> lock successfully and decrements the count. If the value is 0, the bus
>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>
>>> So according to the APM, setting the count to 1 will permit one bus lock
>>> then exit (fault style) immediately before the next.  This also says
>>> that a count of 0 is a legal state.
>> But then you'd livelock the guest as soon as it uses a bus lock. Are you
>> suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
>> all other times?
> 
> I should have been clearer.  I'm complaining at the "trigger
> immediately" comment, because I don't think that's a correct statement
> of how hardware behaves.

In turn I should have looked at the patch itself before commenting. The
other setting to 1 is what makes sense, and what ought to prevent a
livelock. The one here indeed raises questions.

Jan


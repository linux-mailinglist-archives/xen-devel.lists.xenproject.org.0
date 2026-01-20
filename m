Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKm7NSC0b2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B96481F8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:58:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209048.1521167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCXZ-0002TK-AG; Tue, 20 Jan 2026 14:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209048.1521167; Tue, 20 Jan 2026 14:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCXZ-0002RN-7a; Tue, 20 Jan 2026 14:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1209048;
 Tue, 20 Jan 2026 14:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viCXX-0002RH-KN
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:17:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b00b6294-f60a-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 15:17:01 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801d1daf53so38387795e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 06:17:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47f4b2672d6sm312046325e9.14.2026.01.20.06.16.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 06:17:00 -0800 (PST)
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
X-Inumbo-ID: b00b6294-f60a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768918621; x=1769523421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ivYj0JM7gFDh5SiBScTEsztjhvkAlR13S/xH0TUM0c=;
        b=AmcdHY+QjcQx/WLhPtItAhtpC75BkVyV/5LdnzA6GCaam2d7IwEg8RwoO1qjNPRGn4
         RXs8Mi8YZK+Rt1wstdFLmXdlVMSAXKOT0VtaMCvzxHHr08vEjMPxPL3IyADF2kkBKHom
         jzIiwV+3qBzHxlvi3i+mvJHxhUAYTpI3RLqrO9IOZLE3MFEhgLqxhBt4D3uNdJQIDmXt
         qI3IV94mgex1OvOX2QILfjlnohldpSXfqaYDDspZS+7Mpq4o/1hpjljs8KTE94q1a4eT
         Y0+1Q2L2KV47ejKwGD8RrRNzKEPEsyNmH3Aq2kV5/nDzBVJPXYQtMTpbbxu2KnpWDP7b
         0ncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768918621; x=1769523421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ivYj0JM7gFDh5SiBScTEsztjhvkAlR13S/xH0TUM0c=;
        b=aGY/80P0JqJ5ZbaRNMhDzo2YgdSvjUIM7X/jW0bVNPvc5YSbmVekJOeTmtBX1MI9v5
         BTsVjrQoanipC1nKsROLPj868ZgDeQTanRtxH5zo61aGUtPf/KGgN+5oHNZtLo/yOi6N
         7u/AdmfxGVQ+yZMCgbtk4w8EOqmV7USt/pU7ssS3DMW+fV6VwOLWUKktL+ioh7ns0+uv
         ZPwr4tcNtYhtxmk3OSDEJo32Yy7V2ZO5lq8QY2ANN8QZX3SadUtqTSwAKHFwwshR2eCM
         BTSOD4rlKlj6egbiYMP8q3gYAaTcmMMiUjpLfdXuXq7jyWZzenXTYh8yUlQ+xe1Qn+0p
         4uNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjYdoilDuz5xgRHa9/3FhMsCwM/KMqML/Xgvuc+oBxXAzkHiHhE6/In5ez4eOJjH8IF3q48sIIPJQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw88chAAQrGOBhyrkJpCHniOYsLgszoPbS0l7OPZtvSjiAuvldv
	WXLc7v0svvYTnw/Thumb9acYXWKuCYiJEj0rHKR+O26xQMTwFQBSfaJ0SSuGd/LZmw==
X-Gm-Gg: AY/fxX5CEpV6u2BiTNPekImzzQMmylGyT8EhBa1EodzwaA1Ly8ZbSq6afjZaHWAcmyd
	UBQ9cVlsgvlaVzyl79rDMZ/vGItt9gvE2JnSX8kAHRSBlxhiYmVcwSI3do3xomjk+PAAzql4SXV
	/6DT1oUJ1ZguoyOMESETbxhPm97qhyS8pSMkyuJWLZYFqaceCLPWkl1ut4W0euLDGAMHVcLf9Gr
	MlDs4YbSELyrusmUMfRAofzSSCkBgVCemrakZ7Pa4IqmvawUOsEYqaVLc+4xZtfvsSrPB8X5vTD
	4+fjD6k4MmhgTjP481WAf4rtQRSy7Hqw2/MpGv3bDIwdv3ROh2w3N8MMXSQiXRGoWUJ99aArfPU
	dKeVX97Ql0tlp/OPBVyhyKkJVpCkYQLPJB0KhGUChOD9TnmkpwdZB1d0CoU6FOhndGW4CCVyms+
	db35R103v2HTUY1s/ngrNsOjWZ1mOL5OIT83Dm3foRUAV4Q5BwcUHAPZki8xOO7Zh53tlcrnGpK
	XM=
X-Received: by 2002:a05:600c:8b8c:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4801e2efd61mr188693765e9.4.1768918620665;
        Tue, 20 Jan 2026 06:17:00 -0800 (PST)
Message-ID: <da99461f-aa69-4a15-b8ec-e49728fc3db5@suse.com>
Date: Tue, 20 Jan 2026 15:16:59 +0100
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
 <b92c9a26-dd84-4298-adcb-5b1066e2174f@suse.com>
 <ced1c404-6170-4275-b0e3-be851bf03c3d@citrix.com>
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
In-Reply-To: <ced1c404-6170-4275-b0e3-be851bf03c3d@citrix.com>
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
X-Rspamd-Queue-Id: 78B96481F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 15:11, Andrew Cooper wrote:
> On 20/01/2026 1:34 pm, Jan Beulich wrote:
>> On 20.01.2026 14:29, Andrew Cooper wrote:
>>> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>>>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>>>  
>>>>>> +    if ( cpu_has_bus_lock_thresh )
>>>>>> +    {
>>>>>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>>>>> |=
>>>>>
>>>>>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>>>>> Really?  The APM states:
>>>>>
>>>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>>>> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
>>>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
>>>>> VMRUN, this value is loaded into an internal count register. Before the
>>>>> processor executes a bus lock in the guest, it checks the value of this
>>>>> register. If the value is greater than 0, the processor executes the bus
>>>>> lock successfully and decrements the count. If the value is 0, the bus
>>>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>>>
>>>>> So according to the APM, setting the count to 1 will permit one bus lock
>>>>> then exit (fault style) immediately before the next.  This also says
>>>>> that a count of 0 is a legal state.
>>>> But then you'd livelock the guest as soon as it uses a bus lock. Are you
>>>> suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
>>>> all other times?
>>> I should have been clearer.  I'm complaining at the "trigger
>>> immediately" comment, because I don't think that's a correct statement
>>> of how hardware behaves.
>> In turn I should have looked at the patch itself before commenting. The
>> other setting to 1 is what makes sense, and what ought to prevent a
>> livelock. The one here indeed raises questions.
> 
> Setting it to 1 here is fine.  This is the constructor for VMCBs, and
> *something* needs to make the state consistent with the setting we chose
> at runtime.

But the setting at runtime is generally going to be 0: When the guest exits
for an intercepted bus lock, we'll set the threshold to 1, re-enter the
guest, it'll retry the bus-locking insn, the counter will be decremented to
0, and the guest will continue to run with that value being zero. Until the
next insn taking a bus lock. So starting with 0 would overall be more
consistent.

Jan


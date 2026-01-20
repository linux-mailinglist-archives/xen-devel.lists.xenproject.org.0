Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN2VC/Kzb2nHMAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CE248124
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 17:57:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209081.1521198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCmy-0006sA-26; Tue, 20 Jan 2026 14:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209081.1521198; Tue, 20 Jan 2026 14:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viCmx-0006pV-VU; Tue, 20 Jan 2026 14:32:59 +0000
Received: by outflank-mailman (input) for mailman id 1209081;
 Tue, 20 Jan 2026 14:32:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viCmw-0006pP-QB
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 14:32:58 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9633b56-f60c-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 15:32:56 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso8290545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 06:32:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e80c477sm293813625e9.0.2026.01.20.06.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 06:32:55 -0800 (PST)
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
X-Inumbo-ID: e9633b56-f60c-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768919576; x=1769524376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yCHzPdOlsZNzg+yXYhpb/iP44Gag993dv0Kake6nFsk=;
        b=FMsZeZamwq01BerTePNoi56dEJpKLRUthIkSnTYhSoWHn5hzMaVU8kfsg4saxDX9nl
         URtQe/NP1SteGl6MNpWbCmRGUBeaZXG+Nu/JfJbz/Knt4zJbIEL7QLd0HoI3QHcbqIUJ
         WOKs+c/9TkoNi1aSngt5oCNrYxbZxVkbhsLLDExyHsderlWWRO9FTzUxlMvsVB3AqQlF
         BR+OW9D8ZTz7sGVI9OkviN2w2lJKqvkSOwJwi6bB4uQi05xAq9t+iDJhUPi5ktZqF3cX
         j9uPdsU31Sa2OAKqxeYtsUn/F6DMWe8DJzRCP3XGJeLodUXfg0pmyWwi10oYMRYGTpz+
         niQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919576; x=1769524376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCHzPdOlsZNzg+yXYhpb/iP44Gag993dv0Kake6nFsk=;
        b=KkRV2ii5Sr+H4RgFVcatOJ3V7qfBzZHcCU8X1ojSR1UE0U1N9XQ5BJ4jnbTn7tmbAF
         kySS05gtzI2ovPauCWYzo8UgjZLIzWbpsLufA29DnNYU3RhlLDbXEE8iYeWvfMkpP8/9
         p2hhvdeAXLvn2DVuGvJ40R4rqEO3LRCnvGXuhsYZmlfN5Bo5KUYl10MxHfzhoS1Wq/ol
         mJZNpHtFYmFc2DO7UhpcG9mC7b7rQdobxAkr8K/mnxO4uYfDBo4XKw3FaU/PwSgeTooO
         0i4ZxA5H4FMdAg5YALSN/yTjkcQ8W4SGURjbiTL/DizTJU1Lh1Fi95m5HyJhnOeLyLyu
         vFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7leiWdp37SPdzY6vs4MEjgSlN43mvJTAiWsxprJxPOeV8c36uwEEgqdQCSbzuv6yI1XRB2ZtxqVQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzyLF0JxFgmwF4X/EVJcpJZkxdmZWuS4FbeGB7wGg/ZhuLImst
	wkr00yen4K0R8YwPHrMCqjLVAUkqZ29bromoustg7Ugq3vbCYcHWVf4TMTzcmfmJAg==
X-Gm-Gg: AY/fxX7ziMz8c0hct/RB4OUwj5esxFjwKD7/TB/CoLnU3PZMCF6SPALHXkC4ISt0WGo
	PrkcXaSGc6YnwGR5i+dYCGayPXaIII9C/azHxkra5ZoDB/VdyetsVTJ+8XqQPaz+kfiavJjQaL/
	iejEmKVhbCO3ZDMEv+N66Wg/W6293Cbt1kWtddOexLNyau4qgspq1xAejittWEhzmNHexiroPBD
	HmpSKAgSMCM0GF1/1/8nwNMlU09sWnOWbaLfL8YLYjE3SclDVwnQZqqnMqG/NVjw0+mny5off/t
	mdA1PJWQCyuQImKwnlGMsjNuIc8qOuU4znKQxTSfT7fiNqzdEQPjX4OB36gllz8w1dJ9O4fUkrU
	59etKVBGjV5Z7Ooj6YzgdtVwdtyKYL+C7vBib1mcPo6ncT6diVtxnCEEh6DmlD0gnxFYPp/iohw
	/0SFVZKUMXww2hvyZtaDDYwSu+K/yLqNdAix8eUBOat8PHDyic4gJG/lKxl9HV/9nQCXGKGGneg
	J0=
X-Received: by 2002:a05:600c:6085:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4803e79b854mr30543375e9.1.1768919575935;
        Tue, 20 Jan 2026 06:32:55 -0800 (PST)
Message-ID: <48ccad85-8b6b-40ae-938e-b6ef9dae0ccf@suse.com>
Date: Tue, 20 Jan 2026 15:32:54 +0100
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
 <da99461f-aa69-4a15-b8ec-e49728fc3db5@suse.com>
 <4ec779cb-3cbf-42cf-b744-80145d3cd54c@citrix.com>
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
In-Reply-To: <4ec779cb-3cbf-42cf-b744-80145d3cd54c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 81CE248124
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.01.2026 15:26, Andrew Cooper wrote:
> On 20/01/2026 2:16 pm, Jan Beulich wrote:
>> On 20.01.2026 15:11, Andrew Cooper wrote:
>>> On 20/01/2026 1:34 pm, Jan Beulich wrote:
>>>> On 20.01.2026 14:29, Andrew Cooper wrote:
>>>>> On 20/01/2026 1:27 pm, Jan Beulich wrote:
>>>>>> On 20.01.2026 14:18, Andrew Cooper wrote:
>>>>>>> On 20/01/2026 9:53 am, Alejandro Vallejo wrote:
>>>>>>>> --- a/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>>> +++ b/xen/arch/x86/hvm/svm/vmcb.c
>>>>>>>> @@ -66,6 +66,12 @@ static int construct_vmcb(struct vcpu *v)
>>>>>>>>          GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       |
>>>>>>>>          GENERAL2_INTERCEPT_RDPRU;
>>>>>>>>  
>>>>>>>> +    if ( cpu_has_bus_lock_thresh )
>>>>>>>> +    {
>>>>>>>> +        vmcb->_general3_intercepts = GENERAL3_INTERCEPT_BUS_LOCK_THRESH;
>>>>>>> |=
>>>>>>>
>>>>>>>> +        vmcb->bus_lock_thresh = 1; /* trigger immediately */
>>>>>>> Really?  The APM states:
>>>>>>>
>>>>>>> On processors that support Bus Lock Threshold (indicated by CPUID
>>>>>>> Fn8000_000A_EDX[29] BusLockThreshold=1), the VMCB provides a Bus Lock
>>>>>>> Threshold enable bit and an unsigned 16-bit Bus Lock Threshold count. On
>>>>>>> VMRUN, this value is loaded into an internal count register. Before the
>>>>>>> processor executes a bus lock in the guest, it checks the value of this
>>>>>>> register. If the value is greater than 0, the processor executes the bus
>>>>>>> lock successfully and decrements the count. If the value is 0, the bus
>>>>>>> lock is not executed and a #VMEXIT to the VMM is taken.
>>>>>>>
>>>>>>> So according to the APM, setting the count to 1 will permit one bus lock
>>>>>>> then exit (fault style) immediately before the next.  This also says
>>>>>>> that a count of 0 is a legal state.
>>>>>> But then you'd livelock the guest as soon as it uses a bus lock. Are you
>>>>>> suggesting to set to 1 in response to a bus lock exit, and keep at 0 at
>>>>>> all other times?
>>>>> I should have been clearer.  I'm complaining at the "trigger
>>>>> immediately" comment, because I don't think that's a correct statement
>>>>> of how hardware behaves.
>>>> In turn I should have looked at the patch itself before commenting. The
>>>> other setting to 1 is what makes sense, and what ought to prevent a
>>>> livelock. The one here indeed raises questions.
>>> Setting it to 1 here is fine.  This is the constructor for VMCBs, and
>>> *something* needs to make the state consistent with the setting we chose
>>> at runtime.
>> But the setting at runtime is generally going to be 0
> 
> First, we need clarity on what "Initialising as zero is invalid and
> causes an immediate exit." means.

+1

>> : When the guest exits
>> for an intercepted bus lock, we'll set the threshold to 1, re-enter the
>> guest, it'll retry the bus-locking insn, the counter will be decremented to
>> 0, and the guest will continue to run with that value being zero. Until the
>> next insn taking a bus lock. So starting with 0 would overall be more
>> consistent.
> 
> Assuming we can set 0, then yes we could drive SVM like this.  However,
> we cannot do the same for PV or VT-x guests, both of which are strictly
> trap behaviour.
> 
> So for that reason alone, we probably wouldn't want to drive SVM
> differently to other guest types.

Yet we can't abstract away the fault vs trap behavioral difference. I'd
take a different position: To have behavior as similar as possible, we'd
want it to be uniform how many bus locks we allow to be used without us
noticing. If we trap after the first one for VMX, we ought to fault on
the first one for SVM (provided that's possible in practice).

Jan


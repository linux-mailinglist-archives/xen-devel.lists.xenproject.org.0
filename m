Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD03Mt9Dk2kP3AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:20:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0FC146097
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 17:20:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234380.1537660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1Kk-0003Vd-QM; Mon, 16 Feb 2026 16:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234380.1537660; Mon, 16 Feb 2026 16:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vs1Kk-0003Sd-Mj; Mon, 16 Feb 2026 16:20:26 +0000
Received: by outflank-mailman (input) for mailman id 1234380;
 Mon, 16 Feb 2026 16:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vs1Ki-0003SX-IG
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 16:20:24 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fbe1ec5-0b53-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 17:20:14 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4362507f0bcso2865287f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 08:20:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc85csm27891977f8f.22.2026.02.16.08.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 08:20:13 -0800 (PST)
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
X-Inumbo-ID: 5fbe1ec5-0b53-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771258814; x=1771863614; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lQjBr09QfvCbkNyDVmbr+LoM2CiKUSLQhkc06K/ULEw=;
        b=Iv8SHGyv+/w/6gWmrmFeZcoVR4x+d642Y6+BO9v8ep2ubZq/KbJ/nnTS6G1ggEZ3Qt
         gANVBXvOChkuCJsqBQVc3vC1NoLdfkwka/BuW/FDZs2AeOiWqzeMKfxnCeX/WJVC9o9M
         VflGrUlxY9LpjR9nvDFZFumNgH6GAVgLbRmEytlamKw78TC92ZhyofeLrociWCjO7LB1
         O2b2IqN6iO2u7wwMsLC2JGrugdr8XxmQoToEYD6c/mybJfUqmazfWCnIFPtf4E40+UdK
         O8TSQ+6Vv/pVQ7+WsZrObdTQm9bvRrAQ+RARaHpQ+aBxrNeVVM3VGX0gTNeAjofdlT5P
         sEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771258814; x=1771863614;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQjBr09QfvCbkNyDVmbr+LoM2CiKUSLQhkc06K/ULEw=;
        b=DOWbOHbI8e9Z7Nh1oq4jds222w2GyPJzT7nR5bI3XK2+p2I23AFG2yZ4kYHY/x5JCr
         z0tT4ASMx2Cf5eSU2wGy9INmkUKfjmOU+17X663t7D8jgPZACleagZM/DFITUzTJLPhw
         AkTGlngOeFsaJMDqkT0YeHxRoAtayEUq0LoQRhwx0gfXVBqf6JPKGBdNpTwoxzK2TWYw
         1rFMHazsXTq2dOyapc+DE5q0ymR7vDnGYtcHy0NK3gMFEAeJOKtBbShJTxUBurEM4oZu
         IuVdADFBcwZ97SUZHVkmvcssDpBXsky13fGgEtl5Qq3nOB1VM5vc6P00jG2WtEyg6rRt
         a1yg==
X-Forwarded-Encrypted: i=1; AJvYcCVGO218aPS8Hx2IX/nzBlOZ2uS5NoT/ykhmWTSpgG2dF9V0RI8a2Z2L6/CZ3VOslOItDPE7wT1D+lU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/CvUWhRggkgpnvjxr5/56AqozRKbO+kbtWFNKdDSQrqT225Lf
	5I5BDSc/GMacvygqWtDuPU4pX2k8NPkEEDrQqHJVGZdMVyEdJMkXBodhAmWDYig3qw==
X-Gm-Gg: AZuq6aJf+0Rf+aAmPIHMwWWxRaKJKppwo6HIt60pPvrKkjeZMClW2ddcBXZvGLevSLV
	pbIttvybRGdsmPJGdfJcAz6PBCAybvLz/mnincuc2B+TgUG2guGVWLuSpCopikBiwqgnde6WHns
	A5oCGUjVmTEVPR/gJECRzUria5GWA10sZoccluQLrWU93WWW0RxAEy5fCpAZdoF3E26bu/OTFaP
	5mWQdvTvsKg5L46s50EtGV/a3QeNc2FaIzgmB2N2JSNgqE9/ScysswgY1bVIwGbljljBI1YsbPl
	bHYA6y1cdaFV+rE9+JAe1Fl4Z/e7t/0wDgnhrq83pD/L3KMkodQoYPyxO4P7QKHbV562rtWBJNB
	zEBgG4MZ28B7oyZnYr4wM0lqANgjbH9pnGJYa6lwEhYnr/m0x0J6hCYWnuhqbRhfg7FyYzuq2z7
	GfI+Du3UJ5Nz8LgdvmuGyF+sRmOAyORgHX+Bgll+AFrT6KUxA1lTfF+LyKva6iNPy1O+ONAib9F
	WVEIDEi35SFbPA=
X-Received: by 2002:a5d:5888:0:b0:435:db9b:5881 with SMTP id ffacd0b85a97d-4379d619f9bmr13848251f8f.25.1771258813557;
        Mon, 16 Feb 2026 08:20:13 -0800 (PST)
Message-ID: <a55d1c35-90fe-4b25-b10d-1ab33d6b8efe@suse.com>
Date: Mon, 16 Feb 2026 17:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: add p2m context switch handling for VSATP
 and HGATP
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <be3d3793e78b8cfebfdd02361064bf7321b5f2ef.1770999879.git.oleksii.kurochko@gmail.com>
 <0f7e5a73-a574-4aa2-80c7-b45d08b9d6b0@suse.com>
 <f4400580-65b8-4dc2-a11a-443840bcb162@gmail.com>
 <cf7c146f-ab1c-4574-ab2b-e0d96ea80db4@suse.com>
 <f43f99f6-a9cf-4217-953a-f1f449194e6a@gmail.com>
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
In-Reply-To: <f43f99f6-a9cf-4217-953a-f1f449194e6a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3A0FC146097
X-Rspamd-Action: no action

On 16.02.2026 16:57, Oleksii Kurochko wrote:
> On 2/16/26 4:45 PM, Jan Beulich wrote:
>> On 16.02.2026 16:34, Oleksii Kurochko wrote:
>>> On 2/16/26 12:50 PM, Jan Beulich wrote:
>>>> On 13.02.2026 17:29, Oleksii Kurochko wrote:
>>>>> Introduce helpers to manage VS-stage and G-stage translation state during
>>>>> vCPU context switches.
>>>>>
>>>>> As VSATP and HGATP cannot be updated atomically, clear VSATP on context
>>>>> switch-out to prevent speculative VS-stage translations from being associated
>>>>> with an incorrect VMID. On context switch-in, restore HGATP and VSATP in the
>>>>> required order.
>>>>>
>>>>> Add p2m_handle_vmenter() to perform VMID management and issue TLB flushes
>>>>> only when required (e.g. on VMID reuse or generation change).
>>>>>
>>>>> This provides the necessary infrastructure for correct p2m context switching
>>>>> on RISC-V.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> ---
>>>>> Changes in v3:
>>>>>    - Add comment above p2m_ctxt_switch_{to, from}().
>>>> I find these and other speculation related comments problematic: You can't
>>>> prevent every kind of speculation that way, yet all these comments are
>>>> written as if that was the case. What I think you mean in all cases is
>>>> speculation using the wrong set of page tables?
>>> According to the RISC-V spec:
>>>     No mechanism is provided to atomically change vsatp and hgatp together. Hence, to
>>>     prevent speculative execution causing one guest’s VS-stage translations to be cached
>>>     under another guest’s VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>     finally write the new vsatp value
>>>
>>> Based on that my understand is that the following code could provide an issue:
>>> (1) csr_write(CSR_SEPC, guest_b->sepc);   ...   (2) csr_write(CSR_VSATP,
>>> 0);   csr_write(CSR_HATP, guest_b->hgatp);   csr_write(CSR_VSATP,
>>> guest_b->vsatp); As IIUC speculation could happen between (1) and (2)
>>> and we could have some VS-stage translations connected to SEPC'c of
>>> guest B but with address from guest A page tables. So just to be sure
>>> that such isuse won't happen I wrote a comment that first VSATP, then
>>> others CSRs then setting hgatp and vsatp for new guest.
>> This reply doesn't address the point raised above, it also ...
> 
> Okay, then just answering on a question above directly - yes, it is about the using of
> the wrong set of page tables.

Which is what I'm asking to clarify in those comments.

>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -1434,3 +1434,82 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>>    
>>>>>        return get_page(page, p2m->domain) ? page : NULL;
>>>>>    }
>>>>> +
>>>>> +/* Should be called before other CSRs are stored to avoid speculation */
>>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>>> What interaction with the storing of other CSRs would be problematic?
>>> Please, look at the reply above.
>> ... doesn't apply here, but ...
> 
> Probably then I misunderstood your question.
> 
> Technically, it wouldn't problematic to write CSRs in any order (even we can ignore
> setting of VSTAP to 0), but it will (at least, based on example above) lead to that
> we will want to have TLBs flush.

Why? Storing the CSRs doesn't alter the values held in those registers.
Taking your earlier example with EPC, storing it ahead of clearing VSATP
will leave as wide a window for speculation as will storing it afterwards.
In both cases the window will close when VSATP is cleared. As per my
current understanding, that is.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II3mDBb1jWlw8wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:43:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD1712F12F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 16:43:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229360.1535323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYqE-0003fU-RD; Thu, 12 Feb 2026 15:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229360.1535323; Thu, 12 Feb 2026 15:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqYqE-0003dW-NM; Thu, 12 Feb 2026 15:42:54 +0000
Received: by outflank-mailman (input) for mailman id 1229360;
 Thu, 12 Feb 2026 15:42:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqYqD-0003dQ-Jv
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 15:42:53 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b4bdcb3-0829-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 16:42:48 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso13311f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 07:42:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e3b829sm12841976f8f.27.2026.02.12.07.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Feb 2026 07:42:47 -0800 (PST)
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
X-Inumbo-ID: 7b4bdcb3-0829-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770910967; x=1771515767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=atGR2jKSqkvBxetSUxHWF94yjyiTNXxj/CcgYuQJmL0=;
        b=M0NQORXLxAF7xKulbJp6NO1SB2cw6ijetxjD83P94HwOk0qpZqlPaE2fM2IVRuQ9Af
         9yM0UN4BDkIPDOReTkMeYsSfrREfFXXXaipINgOyvH5l2q9MXlIQdo8j9kQK/reNaT0a
         s/qVbGLdSaEA6HIROrLV1KusDR0iylVWYAPYTH6DDCf4ZpnQuSiSS+L6KiwHU+78SYTL
         FMMM2D5oJdslXQBj7m+p7pKnP7MoeiH41DYvjgoJKSo6I4x92SwiGMSgygUjfnPl+0QB
         7dcZtnlEB0YSWHxUyajU0aAhbtb6zVreaiiwg2tfRyMHyrOO3qtWuI5oE2o/PkmedWQj
         f28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910967; x=1771515767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atGR2jKSqkvBxetSUxHWF94yjyiTNXxj/CcgYuQJmL0=;
        b=vxxDRZYCuw/NrZhAofEBFXlqZWlf72tK5VMnLjJqeIFSgZBCV1U+yD3mDpZ4lyUpSX
         ladabuiIRX0woGYFs97KzxoK8R4kFYefkJfGqwyy/V/vYd/18HcW08cM/HyMh8rNxi2S
         bKh+SnSnehakHOZ74Ckvqvx7AL5x7xYqD4rkdyruEa+p2bDcQSJMBmEhPyyOqv3gCZ8q
         1CKYvJt2NirJbfYxB3/pNfB5rjDJZjECRdWSxR1/0eZJZNYVgWbQq+ijG9OkgczpCEyz
         Gt/q47seKswdyeC7s6XS49KCvx/Y3nI+FOTYYEru94HegiKekOgpHsIWk8zkcgGE9bX7
         nOpg==
X-Forwarded-Encrypted: i=1; AJvYcCVrg8z0bHgmoQVja8gm0f/qaOctIUmp13NDsQlOZnJY6kTAerluAuPBzhe3Tt0n8PkAEt2dF8rc4UQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvF0t959UHxirJAWONknNUNxNMFQw+s+SI7Xdjtr8hOe3Agwd3
	cG9qPMPl+Z9yFenADXtvGFuTEyE7Ni6v3ozaV57wMMhni0NMtTCYAoCMmqLhjx3JsA==
X-Gm-Gg: AZuq6aJPZ2/+QgKf5aa6VaUncivqSmOBotJeSdofruefMYZNNsziYD5jfHrhtz4Wv3+
	/KMm0S1OnoJ7dHL9LR3FD0IwOdeYva4r3kpCNC24ZDhZchqRkU1vl5akRODvrDwo/SuyKWY8KH7
	GwC3+Eh3xOiFI7bodoMHIFLaOS51aW5NQcd/ZC/sEUVZnE/SO08imGs9Nq2f3S4jt64zsc44unr
	XS+8RbALqm68/uWfkaySxmefoCUTNCPXG33NCns70P40Viz2+X6nhASHVJQT6YE081NSYMagvF8
	0Y2hPDkYRHgrueVSUB/rBsyG6zqovMH336XZypedClRnd9rSZQlGN0ziS21ONmQ3mNjyj26kHUi
	cEiDIAOagrwoSaWSLoxRhUmuNnpEALXRCAIpkBIxUhdhiAA3DCmh34PFcsWFlJudy2xYw1niepD
	7++RkTBa41Fi3sRUK8zhFHvXa3Rg7SAzz2761v6ir0rVc0qm2ysfdvr5dvn1a7XV7/iDG11iSb+
	K5+3dMZ8uVleSU=
X-Received: by 2002:a5d:5f93:0:b0:435:729a:eb6f with SMTP id ffacd0b85a97d-4378aa0973bmr5644591f8f.19.1770910967443;
        Thu, 12 Feb 2026 07:42:47 -0800 (PST)
Message-ID: <45e8aa5a-842b-49d0-8744-71295cf0a0b6@suse.com>
Date: Thu, 12 Feb 2026 16:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/riscv: add p2m context switch handling for
 VSATP and HGATP
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770739000.git.oleksii.kurochko@gmail.com>
 <0e6f450d64ce17f504d73c3429c8e8a9ced0cf06.1770739000.git.oleksii.kurochko@gmail.com>
 <7cec918c-bd58-4013-9ec2-d43ff7afcd7c@suse.com>
 <099768df-ec44-454f-8a9e-4897d81309f9@gmail.com>
 <ba48bef0-551e-4ea7-8d9a-fb54b9b85da6@suse.com>
 <4f9953ae-8722-4971-a214-6c40f7f5859a@gmail.com>
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
In-Reply-To: <4f9953ae-8722-4971-a214-6c40f7f5859a@gmail.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9AD1712F12F
X-Rspamd-Action: no action

On 12.02.2026 15:47, Oleksii Kurochko wrote:
> 
> On 2/12/26 1:56 PM, Jan Beulich wrote:
>> On 12.02.2026 12:57, Oleksii Kurochko wrote:
>>> On 2/12/26 11:16 AM, Jan Beulich wrote:
>>>> On 10.02.2026 17:36, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/p2m.c
>>>>> +++ b/xen/arch/riscv/p2m.c
>>>>> @@ -1434,3 +1434,126 @@ struct page_info *p2m_get_page_from_gfn(struct p2m_domain *p2m, gfn_t gfn,
>>>>>    
>>>>>        return get_page(page, p2m->domain) ? page : NULL;
>>>>>    }
>>>>> +
>>>>> +void p2m_ctxt_switch_from(struct vcpu *p)
>>>>> +{
>>>>> +    if ( is_idle_vcpu(p) )
>>>>> +        return;
>>>>> +
>>>>> +    /*
>>>>> +     * No mechanism is provided to atomically change vsatp and hgatp
>>>>> +     * together. Hence, to prevent speculative execution causing one
>>>>> +     * guest’s VS-stage translations to be cached under another guest’s
>>>>> +     * VMID, world-switch code should zero vsatp, then swap hgatp, then
>>>>> +     * finally write the new vsatp value what will be done in
>>>>> +     * p2m_handle_vmenter().
>>>>> +     */
>>>>> +    p->arch.vsatp = csr_swap(CSR_VSATP, 0);
>>>>> +
>>>>> +    /*
>>>>> +     * Nothing to do with HGATP as it is constructed each time when
>>>>> +     * p2m_handle_vmenter() is called.
>>>>> +     */
>>>>> +}
>>>>> +
>>>>> +void p2m_ctxt_switch_to(struct vcpu *n)
>>>>> +{
>>>>> +    if ( is_idle_vcpu(n) )
>>>>> +        return;
>>>>> +
>>>>> +    n->domain->arch.p2m.is_ctxt_switch_finished = false;
>>>> How can the context switch of a vCPU affect domain-wide state?
>>> It is wrong to have is_ctxt_switch_finished per domain, it should be
>>> vCPU field.
>>>
>>>>> +    /*
>>>>> +     * Nothing to do with HGATP or VSATP, they will be set in
>>>>> +     * p2_handle_vmenter()
>>>>> +     */
>>>> Why can this not be done here?
>>> As VMID should be calculated on VM enter.
>> And I didn't suggest to calculate a new one here.
>>
>>> We can update HGATP and VSATP here with VMID stored before in p2m_ctxt_switch_from(),
>>> but then it is possible when vmid_handle_vmenter() will be called before VM entry
>>> VMID could be changed and it will be needed again to update HGATP and VSATP what
>>> will lead to flushing of VS TLB twice (one in p2m_ctxt_switch_to() and another one
>>> in p2m_handle_vmenter()).
>> Is this a concern resulting from particular logic you expect to appear
>> in the window between context switch and entering the guest, or is this
>> merely an abstract concern?
> 
> If we will have VS TLB flush unconditionally in VM entry then it is merely an
> abstract concern.

Why would we want to flush unconditionally?

> Otherwise, considering that speculation could happen between
> context switch and VM entry what could lead to that some entries were added to
> VS TLB flush with old VMID in the case if then in VM entry vCPU might receive new
> VMID.

I don't understand: Context switch leaves vsatp.MODE at zero. Nothing can end
up in the VS TLB in that case, aiui.

Jan


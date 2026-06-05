Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7/XUCl55Imo1YAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:23:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885CE645EBE
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 09:23:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=F8gAlmH5;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1329036.1593247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOtO-00011s-DL; Fri, 05 Jun 2026 07:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329036.1593247; Fri, 05 Jun 2026 07:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVOtO-00010C-A5; Fri, 05 Jun 2026 07:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1329036;
 Fri, 05 Jun 2026 07:22:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wVOtN-000106-4J
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 07:22:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVOtM-0003Z9-H5
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 09:22:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227950-e002-0a2a0a5209dd-0a2a4504b6e0-0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:22:56 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a227950-1dec-0a2a45040019-d155dd31a48d-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 09:22:56 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ef1198766so857167f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 00:22:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm38602363f8f.27.2026.06.05.00.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 00:22:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780644176; x=1781248976; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uF2cVAyCKdz2kwoIp774Vd7DRPiZizpaYby1xrmUAd8=;
        b=F8gAlmH5HVhC2aIMHgj3gxJhaFNVmTnrXIcD5L6icTzFSuyYF2q1Tq5M9ZHqsaqyoV
         vLAzVwq6V7fuj42xa9lQONJM3WNedvpUbBpeDEY7fKL1o+91zpm6Vr/cR5m1QCiK9iyi
         N9MUNb9Zj9MZmbVNkt8nyYHPr4Yp+dQSY1nDtS+FXpuQN5fsRMizUYkKotEuwUEBKRjD
         v8BtxCwZh379vx6btIKkvUkpMLRR4t+hht+smK1pIOGzF+AeDxx/KDaY3y2h5f6Qt7La
         u885BQgADdqk3rInp/m4cwUhfkf6SWKdVchz2GwnyUKcHOTtYQvylBHttyDKq1+RM8Jk
         iRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644176; x=1781248976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF2cVAyCKdz2kwoIp774Vd7DRPiZizpaYby1xrmUAd8=;
        b=fgK2C3zYapJVkQsPpHZuEN7CGHw9j+2YR3sIccvilQ8WAjaHtIbnBnqCqCVUDbtDQp
         /pqnPoXV9IiDHmKiTBXN8nVtb2acNN01lh3Pp6AN945cT+GWnZeniOjiop87Rtf4BXb/
         OfVTG9c75denZoTnRJ9Wzn9XkYm0s71+TIT+eEoJsN08d+KL1QZMJ9tUjobZDRuLDPhk
         BBE2VCHD7Bufupa/xx66I2/eW01LTfp1YE8efj6+D2w0/2LfuhYycjC9QIVSla4+Hvaq
         7WKPGTj+kWaS3mTTHu7nQhBdHjbT4+sx9uU1Ql0k3IkfloVyeb//PraPxqQ0obcbfgPs
         GWeg==
X-Forwarded-Encrypted: i=1; AFNElJ+Yx9sidehOJ8UZ0RTV85K7MSA8KnEsaRy+M/2ztwWrKIuqYRps7ZXaIsF6XjApooPIPUkZlM4JsYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYB3Erb38wGk0rWDOGc7Cir/rR+ejQuBzMOjUqCAhgYcTyOrYb
	AV8kne5rZnheDQgoMLg2QBELFPc+dNcYN/xUjux89xmsgQ7i1VRN/oBhG+qzPOfc3Q==
X-Gm-Gg: Acq92OF2DzWrG4n0GzbemVfIaTJ128/1WMeUEtNOVSd1ApXyn+zwz262kvc5D1Wt2NP
	eEyL7FxtT05fI9H7ujS7P4i9EJ+onD9K/ZEm2RPVP7GIrSpouRCwMdOXlWpgeZVZVEuATEY33yo
	aicyVXy8qn28FtW7VSHOwaa+vM7SiQ0w3RqFJorrFAVXAhjdVP6SHMqhyrlIM40t6MyXOAoSqNl
	Orferaz1u2itCTUdkZTnIgm5X8mkb50rEhONZMzjbAknZWBHxClQlTFVxwdqlX4sKr0YpsSkSZz
	my+i+vN9DV/dreZCarfdwwMNul1Y33VyLUt/j2xsyQvntG3q7tctgzlPUopyBkr4+QQj7ugZAeK
	MuLkibAf/X0fJ4rHga8fKtKMre1yQfT2XanwjiWqryiLhTaWpEYYY4hWAk1HFRD3wrI1n7crn50
	2gTfq1aHMt6Th4f0gonp2LmLlz7WL6g1omlMn9pAxQtbQgdayJNeOqt36k9StjOJFX3neHp8ZYT
	ioyCSvEu2wZUzXOzU9cFJfhYg==
X-Received: by 2002:a05:6000:4b07:b0:460:21e7:330e with SMTP id ffacd0b85a97d-46032b8164fmr1883942f8f.10.1780644175697;
        Fri, 05 Jun 2026 00:22:55 -0700 (PDT)
Message-ID: <d84d1022-55a5-4848-a92e-30c78af62443@suse.com>
Date: Fri, 5 Jun 2026 09:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/26] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
 <6ec9620d-7224-49d4-860c-6e447e0534e3@suse.com>
 <702af594-17ce-4e64-8f02-37ad5785c6a4@gmail.com>
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
In-Reply-To: <702af594-17ce-4e64-8f02-37ad5785c6a4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780644176-2BD6C3FF-8EF6B33E/0/0
X-purgate-type: clean
X-purgate-size: 3342
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 885CE645EBE

On 04.06.2026 13:29, Oleksii Kurochko wrote:
> On 6/3/26 4:54 PM, Jan Beulich wrote:
>> On 08.05.2026 16:43, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/aplic.c
>>> +++ b/xen/arch/riscv/aplic.c
>>> @@ -295,6 +295,11 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
>>>       spin_unlock(&aplic.lock);
>>>   }
>>>   
>>> +static unsigned int cf_check aplic_irq_num(void)
>>> +{
>>> +    return aplic_info.num_irqs;
>>> +}
>>> +
>>>   static const hw_irq_controller aplic_xen_irq_type = {
>>>       .typename     = "aplic",
>>>       .startup      = aplic_irq_startup,
>>> @@ -309,6 +314,7 @@ static const struct intc_hw_operations aplic_ops = {
>>>       .host_irq_type       = &aplic_xen_irq_type,
>>>       .handle_interrupt    = aplic_handle_interrupt,
>>>       .set_irq_type        = aplic_set_irq_type,
>>> +    .irq_nums            = aplic_irq_num,
>>
>> Hook handler names and respective field names would preferably match up. It's
>> unclear why the field uses some kind of plural(?), while the function uses
>> singular.
> 
> I will do s/aplic_irq_num/aplic_irq_nums.

Well. What "nums"? Isn't it "number of IRQs" that the hook returns? That would
call for .nr_irqs and aplic_nr_irqs(), for example.

>>> +unsigned int intc_irq_nums(void)
>>> +{
>>> +    ASSERT(intc_hw_ops && intc_hw_ops->irq_nums);
>>> +
>>> +    return intc_hw_ops->irq_nums();
>>> +}
>>
>> You use this to set domains' properties. As indicated before, I view it as
>> wrong to do so for any domain, besides perhaps Dom0 / hwdom. If you want to
>> do so nevertheless, at the very least I'd expect something to be said about
>> such a decision in the description.
> 
> If you could explain how this is expected to work for non-Dom0/hwdom 
> domains, I would consider reworking it.
> 
> Basically, I don't understand how the following scenario is supposed to 
> work. Let's say the host interrupt controller can manage 15 interrupts, 
> while the guest interrupt controller supports only 7. If we want to pass 
> through 8 devices to the guest, what should happen in that case? Should 
> Xen simply report that the 8th device cannot be passed through because 
> the guest supports only 7 IRQs?

If IRQs cannot be shared - yes.

> Another concern is related to 1:1 IRQ mapping. Suppose I want to pass 
> through a UART device whose IRQ number is typically greater than 10. In 
> that case, it seems Xen would again have to report that the device 
> cannot be passed through because its interrupt number exceeds the number 
> of IRQs supported by the guest interrupt controller. This could be 
> addressed by introducing a non-1:1 IRQ mapping between the host and 
> guest, but the current dom0less codebase appears to assume a 1:1 IRQ 
> mapping (unless I am mistaken).

Sounds like a (perhaps significant) shortcoming to me.

> Considering that virtual interrupt controllers use the maximum possible 
> number of interrupts supported by the interrupt controller, the concerns 
> mentioned above are unlikely to arise for a long time, if ever, unless 
> support for features such as migration is introduced. Therefore, I think 
> it would be reasonable to remove intc_irq_nums() and avoid using it to 
> initialize virtual interrupts or domain properties.

Yes.

Jan


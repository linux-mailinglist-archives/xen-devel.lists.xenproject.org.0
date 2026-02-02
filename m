Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFukA2mzgGl3AgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:23:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706A2CD497
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 15:23:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218633.1527467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmupO-00037X-Ca; Mon, 02 Feb 2026 14:22:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218633.1527467; Mon, 02 Feb 2026 14:22:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmupO-00035i-9S; Mon, 02 Feb 2026 14:22:58 +0000
Received: by outflank-mailman (input) for mailman id 1218633;
 Mon, 02 Feb 2026 14:22:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmupM-00035c-Q2
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 14:22:56 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8d2f27f-0042-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 15:22:52 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so3853986f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 06:22:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e474csm43294582f8f.2.2026.02.02.06.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 06:22:51 -0800 (PST)
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
X-Inumbo-ID: a8d2f27f-0042-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770042172; x=1770646972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2guHdJFxNY0c1h5JXqoBhWLu2lbOHjLFLXYa/YJFo5o=;
        b=MDEKDsoMNwz/tRBE/xZfO1IPGJBoRZBh3L7QERK8KwXDIIufSlm12Q2u9mLYvkfA/W
         Eh0M8Zs+Et7wtIYEVxibEejSlnEZqBXmBE4CdMoW6atKbjGJfOKKs5MtAqROvrKVuSsN
         TwWd5n75Z6F7/3KuhBJHaacurB+9QiFatrU8cXuklopjBzjRU/DCO/+6tt4irQyx9sOT
         hZC4IgISmpI6g29yK8fYlrKrHwivVIS/3ds1HV81dngrX2cf91oCVoAtZQovziKNQgab
         xUQ4eV/+UF2a4TXoYc6W3KVmP9E2rdI2BHCKXaFJJF1JHkVSrVpvKv53QMDsN3kX2vkF
         c4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770042172; x=1770646972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2guHdJFxNY0c1h5JXqoBhWLu2lbOHjLFLXYa/YJFo5o=;
        b=bsKLeR/gn+jvV2NnmCkb9kJjkmqBVWLleQGiUW7hfxJXqibz3gICRLOzD3Yd4Bm8wj
         +yxHa+D1u1bkFBuF4G91PpTqLcrFDguS5TFh0gSpxaTktVz1uq82i3RxyT0wzm40w4XP
         97BPZrUmPSvAo0XObvITFWmCVy8SGUnP9nMo4lrkw2/CjEJE8xbsq2eYj9oJaJoAlZGp
         e1MwV2UPb8j1Omj2z6idonXUbJ5M5PFf5GKzRBeRJK81DinDQaZTo9dQnBwI2cD8bhbp
         I7kT5zGGrjz/71vejCIllXQgTpWLjAe0lDK4mh777fl/v9MIcNrno07cZE9HAvXg5QuG
         OHiw==
X-Forwarded-Encrypted: i=1; AJvYcCW7hjaUN5V1EhdIrjxg/AVDsgSVKpclzDKuexU2dkTqvxWNaneHPlqjSFSYd3rhx7+Hb7pqUXJxu/c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDH8yiVgHNbBbXhOUhMfFK2G9FO0ze9o+eB7VRjykwb32T6OMH
	IUZ+xhEB8vlJYHh059Mg/+yP9u66Vdzi7x8bmJIC1CMu/1l+eYoBM0+c5CN58nwk8g==
X-Gm-Gg: AZuq6aJ1mdf7NuVovzfu9B05qqp7hVRQFi6GiPRxOrSYa2Xb1RcbMveQkCoeR7dR+mV
	+Hl7J81E+bsChuyObslCa/ijtxO7mBIMOmCwlnj8BjfJWGDBUuBJgi+Emnm5KUmpPVD2MUNxQsl
	hY8btEO5G93iHwrH3wcRSOoapIVH2zPxFEfYsokvQ5RxDpsuhXl7PiV64XS8oYyh6A9daticzg3
	nUieSspG4EZgSaOtSIulHvz9GAK1B4nXrXixgd87HYbBUgtPf7uFHcLQgiNxUCGUdWicHqhxp/8
	zdagS+jPaOFF5K7LRsoh56gdrVAjJGlsJmywwEI4Lg84cLymaKTwcgV08//cvvvhIRZbIUyYvci
	pNC4wZIHPEBNONkJeCQl+SlLa+JfTXxIgg2hdtRj0YGf1tSN7Hk6MB50kLViBLrvz9dmmVMkmSQ
	yvuJbjRKw+T3dYK44um7aqgilMprGxrd2tA9EcHRm5P6lLnA32XJn2mO1EG2r131Rde4nsLAbv4
	WQ=
X-Received: by 2002:a05:6000:40c9:b0:430:fd84:315a with SMTP id ffacd0b85a97d-435f3ab26ecmr16829766f8f.39.1770042171963;
        Mon, 02 Feb 2026 06:22:51 -0800 (PST)
Message-ID: <6d58fd59-000f-48b8-85de-07065c82c275@suse.com>
Date: Mon, 2 Feb 2026 15:22:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] xen/riscv: introduce tracking of pending vCPU
 interrupts, part 2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <58a7723ec48d84b91fd4730fe3ae653f55a0fd99.1769099885.git.oleksii.kurochko@gmail.com>
 <1bd0726d-20d8-4506-bb8e-849fd8b091a7@suse.com>
 <5fd2bbce-7d27-4f54-8eed-5bee0d2a6dd2@gmail.com>
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
In-Reply-To: <5fd2bbce-7d27-4f54-8eed-5bee0d2a6dd2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 706A2CD497
X-Rspamd-Action: no action

On 02.02.2026 11:50, Oleksii Kurochko wrote:
> On 1/29/26 6:01 PM, Jan Beulich wrote:
>> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>>> This patch is based on Linux kernel 6.16.0.
>>> +void vcpu_sync_interrupts(struct vcpu *v)
>>> +{
>>> +    unsigned long hvip;
>>> +
>>> +    /* Read current HVIP and VSIE CSRs */
>>> +    v->arch.vsie = csr_read(CSR_VSIE);
>>> +
>>> +    /* Sync-up HVIP.VSSIP bit changes does by Guest */
>> Nit: s/does/done/ ?
>>
>>> +    hvip = csr_read(CSR_HVIP);
>>> +    if ( (v->arch.hvip ^ hvip) & BIT(IRQ_VS_SOFT, UL) )
>>> +    {
>>> +        if ( !test_and_set_bit(IRQ_VS_SOFT,
>>> +                               &v->arch.irqs_pending_mask) )
>> Why two separate, nested if()s?
> 
> Do you mean that it could be:
>    if ( !test_and_set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending_mask) && (hvip & BIT(IRQ_VS_SOFT, UL))
> ?

That's combining with the if() ...

>>> +        {
>>> +            if ( hvip & BIT(IRQ_VS_SOFT, UL) )

... down here, which - ...

>>> +                set_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>> +            else

... having an "else" - can't be folded like this, I think. I meant the two
if()s immediately ahead of my remark.

>>> +                clear_bit(IRQ_VS_SOFT, &v->arch.irqs_pending);
>>> +        }
>> In the previous patch you set forth strict ordering rules, with a barrier in
>> the middle. All of this is violated here.
> 
> It still respects the rule that the producer (|vcpu_sync_interrupts()| which
> should be in the producer path) never clears the mask and only writes to
> |irqs_pending| if it is the one that flipped the corresponding mask bit from 0
> to 1.
> 
> Considering that the consumer cannot be called concurrently in this case
> (since|vcpu_flush_interrupts()| and|vcpu_sync_interrupts()| are only invoked
> sequentially in|check_for_pcpu_work()|, as mentioned above), nothing can
> clear a bit in the mask in between. Therefore, I think it is acceptable to
> slightly bend (and it should be explained in the comment above the
> function or in the commit message) the rule that the|irqs_pending| bit must
> be written first, followed by updating the corresponding bit in
> |irqs_pending_mask() specifically for |vcpu_sync_interrupts().

With suitable commenting - yes.

Jan


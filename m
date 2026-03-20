Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDTOHa9JvWlr8gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 14:20:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F992DADD1
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2026 14:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1258034.1552224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3ZlC-0002lC-0G; Fri, 20 Mar 2026 13:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1258034.1552224; Fri, 20 Mar 2026 13:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3ZlB-0002ih-T3; Fri, 20 Mar 2026 13:19:29 +0000
Received: by outflank-mailman (input) for mailman id 1258034;
 Fri, 20 Mar 2026 13:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VTAn=BU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3ZlA-0002ib-KD
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2026 13:19:28 +0000
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b778f2e-245f-11f1-b164-2bf370ae4941;
 Fri, 20 Mar 2026 14:19:27 +0100 (CET)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so14435265e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2026 06:19:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486fe6d91fbsm60387855e9.3.2026.03.20.06.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 06:19:25 -0700 (PDT)
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
X-Inumbo-ID: 6b778f2e-245f-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774012766; x=1774617566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NX2pgHc3DISbbTq4UXXnkCDUxohh1a0ZbTLVxm5DzuY=;
        b=WDVdR0tTtvlNePkVVlyz+9G/PUC4grIrXaPpkp9qXqu3CqGqMawl4qFqp5a06UP2oh
         u2cF4OD72mP+sV6kT3LDMMmClLggLQN9ldHKEysDaf2UX47QytyeLwMAfxxj4+lATqcx
         9Am40ezBm6CyZsKZCvE6SEepSUjy3y1OJSnOMH26/llXRGifxb/SEWbWJbTN+VIgHxCj
         CcdkfPKC135lxsa4RXO+rvoZN51Cmum3yyPZan5ppUx6w39kP2B1NGyHF21anhbnGtX0
         fYxgE3yVHEdhDS817wjUpavIWEGCi7LjtEuLWlwpMftoFPVgQJFd36X+Fa+N351qIqWv
         4qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012766; x=1774617566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX2pgHc3DISbbTq4UXXnkCDUxohh1a0ZbTLVxm5DzuY=;
        b=FHUp3DeLIqRg6C94q3VT2E0WyP/UAC1PBLuJAzLPuec6bPInzs7P+NviTockN8lOkj
         JnLtznIxmwly1hRTsxhaiZBMyL8Z4GDvKDdNr9PKWmji9FPZDV8dzvA4PgUojOvO+fGt
         UE6uxzALTLo2Fv37ddrQOe92OCYmC1+dkmFfO86wh6fVSknySFifY+ihlu/e5SsVkeIo
         flRC30Tg8BQpY+EI59NPJ6i+nnyYokkXE63fiohszkx7Kcb34PmAWvnbcNUcJ33y/vCT
         Nmt9u6D4WdR6ERXeW2yjl24/7FIoYu2XGU9I980wtL8921e/PEOIP7kcRiCNvHWBAQQi
         lSZA==
X-Forwarded-Encrypted: i=1; AJvYcCXmYezch/wpSEYXw5GAWoAYQaXs+NDxHqupP8p+IfkBTRYF4ODUFUKVt21o1Rz1ZAPpO8nmkdAcUjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPPzO+cJMpN2V6mRek0IuHrNqfmrFEs5JaX008HyGymudK+hXq
	MQuTTxmo/5Og6gETfPvSDLPtSRMDQTyVVmafqJs8vv1t7sPuulcvTLR8lbsT3Xyy9w==
X-Gm-Gg: ATEYQzyyI0ogOtbrOBlyMeIsCJWma1w0JQcKGoLO2s1sbY6fXErJSY2hXFpTnoW62mi
	B2PQtWFXGSXK2z1eO06WqssBzP+3QdmNazXQy0E1fU+ml8PcdViWU1TGVp6FKNhOI0JyODTG4U0
	yTF+LCVQYvWub6+0mg5X5ZWv52h+eNs6G0bLfFjsEUubhVfoaqnQNY1LRgNiHples4XpmTtiVWK
	NuFYrphEWRatx5AD2b4q+YgRNY5NNnMKDAVjy7VomfcxnmNNYuCNBrX7kROareAtixOEutW5ccl
	FxKzqqDfxTDqz5A8YFuG4fWhyPeo7AsY4vxZc7S3QMgaXRQANwpcTGJh4hPWLcbN4D5ZUxFpsuS
	d+7kWdw5HAcDWCjvwvR7PrvAo/URK8BCkCTK2/KYMdsz/YRwXxUMr+Mu4pqBex2ENnyMlG2g02g
	v+a8g3B2FxkaLJkm4xOyNMTRxogyhOBvEdXwiVDV16JgLuY3Y4Wu1KaJJ/bejUFBYftI2SVp251
	3g2oscYr8yXWpY=
X-Received: by 2002:a05:600c:a55:b0:485:ae14:8192 with SMTP id 5b1f17b1804b1-486febb5da9mr47197995e9.7.1774012766320;
        Fri, 20 Mar 2026 06:19:26 -0700 (PDT)
Message-ID: <92becfa8-1f61-4137-b0ec-ee7160913c5c@suse.com>
Date: Fri, 20 Mar 2026 14:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 6/6] xen/riscv: enable DOMAIN_BUILD_HELPERS
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <6ab04f3584e45795dc82c25f62a6c950913f5c7d.1770821989.git.oleksii.kurochko@gmail.com>
 <aac9b5ac-6660-4ec0-b88e-605903217588@suse.com>
 <b4ac883d-ce90-40b0-93fc-95c925c7ac61@gmail.com>
 <a35d5566-7da1-406d-abf7-13b423d013f8@suse.com>
 <ad59c5ea-ae8c-4e6e-8b49-dcd0eefc3197@gmail.com>
 <1efcb5eb-1b59-4def-a527-254a31efe2b7@suse.com>
 <a8e3b6fe-d1cc-44d5-b286-b59b65e25320@gmail.com>
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
In-Reply-To: <a8e3b6fe-d1cc-44d5-b286-b59b65e25320@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
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
X-Rspamd-Queue-Id: A2F992DADD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.03.2026 10:58, Oleksii Kurochko wrote:
> On 3/19/26 8:58 AM, Jan Beulich wrote:
>> On 17.03.2026 13:49, Oleksii Kurochko wrote:
>>> On 2/13/26 2:11 PM, Jan Beulich wrote:
>>>>>>> +#define GUEST_RAM0_BASE   xen_mk_ullong(0x80000000) /* 2GB of low RAM @ 2GB */
>>>>>>> +#define GUEST_RAM0_SIZE   xen_mk_ullong(0x80000000)
>>>>>>> +
>>>>>>> +#define GUEST_RAM_BANK_BASES   { GUEST_RAM0_BASE }
>>>>>>> +#define GUEST_RAM_BANK_SIZES   { GUEST_RAM0_SIZE }
>>> (cut)
>>>
>>>> If all you want are 2Gb guests, why would such guests be 64-bit? And with
>>>> (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide), perhaps
>>>> even a 32-bit hypervisor would suffice?
>>> Btw, shouldn't we look at VPN width?
>>>
>>> My understanding is that we should take GUEST_RAM0_BASE as sgfn address
>>> and then map it to mfn's page (allocated by alloc_domheap_pages())? And then
>>> repeat this process until we won't map GUEST_RAM0_SIZE.
>>>
>>> In this case for RV32 VPN (which is GFN in the current context) is 32-bit
>>> wide as RV32 supports only Sv32, what is 2^32 - 1, what is almost 4gb.
>> ??? (IOW - I fear I'm confused enough by the question that I don't know how
>> to respond.)
> 
> You mentioned above that:
>    "... And with (iirc) RV32 permitting more than 4Gb (via PPN being 22 bits wide) ..."
> 
> I wanted to clarify why you use PPN here in the context of GUEST_RAM0_BASE definition.
> (and maybe I just misinterpreted incorrectly your original message)
> GUEST_RAM0_BASE is the address at which the guest believes RAM starts in its physical
> address space, i.e. it is a GPA, which is then translated to an MPA.
> 
>  From the MMU's perspective, the GPA looks like:
>    VPN[1] | VPN[0] | page_offset   (in Sv32x4 mode)
> 
> In Sv32x4, the GPA is 34 bits wide (or 22 bits wide in terms of GFNs), and the MPA is
> also 32 bits wide (or 22 bits wide in terms of PPN).

You mentioning Sv32x4 may point at part of the problem: For the guest physical
memory layout (and hence size), paging and hence virtual addresses don't matter
at all. What matters is what the guest can put in the page table entries it
writes. Addresses there are represented as PPNs, aren't they? Hence my use of
that acronym.

> The distinction is not significant in Sv32x4, since PPN width equals VPN width, but
> in other modes VPN < PPN (in terms of bit width).
> So when we want to run a guest in Sv39x4 mode and want to give the guest the full
> Sv39x4 address space, setting GUEST_RAM0_SIZE to the maximum possible value for
> Sv39x4, shouldn't we look at the VPN width rather than the PPN width?

No, why? The guest can arrange to map more than 2^39 bytes. Not all at the same
time, sure, but by suitable switching page tables (or merely entries) around.

Jan

> In other words, GUEST_RAM0_SIZE should be (2^41 - 1) rather than (2^56 - 1)
> for Sv39x4.
> 
> ~ Oleksii
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27B87926B
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691755.1078049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzhM-0002NX-5F; Tue, 12 Mar 2024 10:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691755.1078049; Tue, 12 Mar 2024 10:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzhM-0002Kj-1s; Tue, 12 Mar 2024 10:49:32 +0000
Received: by outflank-mailman (input) for mailman id 691755;
 Tue, 12 Mar 2024 10:49:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjzhL-0002Kd-4Y
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:49:31 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340ce8a2-e05e-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 11:49:30 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso5059161a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:49:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x11-20020a1709064bcb00b00a449b175d2fsm3729713ejv.222.2024.03.12.03.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:49:29 -0700 (PDT)
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
X-Inumbo-ID: 340ce8a2-e05e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710240569; x=1710845369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eddT43b0cixj39NRdFSIlHNPQrC0qMJIpWdS9ba1Tg=;
        b=BW1aGRDrZUfWHSJABoxXD/j8HHf6WTySfXcojKGgKiBzSPrbCDLIRm62MoJTagT1v4
         fF66v+sQ8iKloBPNlZhTFX1j98VsH+ZxL4hfvlledKu5FpnSZMp59VtzsGzlZTRiLfFC
         G8I0dK7lKuka101n8gEO3eGuCe6T8CVElyHjd0xEE6Z8VT9PFi6bVkTNjnsqNpX4kFz1
         /3yi4waDgEGbHEwJWd+X4Id3er9uzMZMWrBvFhS4jidU3CyD1Hgj32CUceVQbxnMosjU
         fxa+7HfeHdPUkxMieH1Dz+z2gr2QW/v0NKNh+t2L0CIC/wpfCuNec8hAsjDJnf1MJ7FG
         v8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710240569; x=1710845369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eddT43b0cixj39NRdFSIlHNPQrC0qMJIpWdS9ba1Tg=;
        b=GUfF1piokYYRLNN78oH2Mg+CiZ0Oo3ImycI4bB5U26sYdqtUfKGWcgszu59cUENsor
         L5sO29WBToJvZXwiTGGVEAKrzk0tkYdaZql6cv7P9mJ5Pd1VRm01esjkEWRp/mgMVGuK
         zMQSRnACpzhF4Ad4VPOa5E58VYl/PVXV1AeO1bQdNP2InrcjJysKO7uJX9MQdzDrJrsY
         P1rFNEKxVs3IN6y7ennWzA5u6T3kb+FwoQReB7MRpkns5X7Ky92DRMkzycvwTO+4MIf6
         KvgeHL5CCwc4jv3LfG8hIA1N0xv8ALRJvZHdQDqXu7Qr+lbsBHTItibH9eBaquNFz54y
         hUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj/7OFJAi7+wPeaq00royoRtG8D42HXxyf2YkQsakTCP0R4J4Uzp8SXXC7lIlcapf0SaC3S6yzgpgVp2wGK6QAOw9yGlsdfYed5Csq1GI=
X-Gm-Message-State: AOJu0Yyo1yhuyi1/HOfcksba/gph6SvgYi9bijPorqgEkkMYjBp+HEwB
	lLMy/lE553u7UPPtuzPsENJ9pwtU73fglKLmLOrtzO9IWvBM5n9/vyjusjXF1A==
X-Google-Smtp-Source: AGHT+IFejxn1LQ7bTWRoWLUZxlzog1QK35KV8Z/M1F89xflZk5gZ1kDTfJmrSexzb8XnrXTFMGZcIA==
X-Received: by 2002:a17:906:35ca:b0:a45:15d5:9267 with SMTP id p10-20020a17090635ca00b00a4515d59267mr5687281ejb.63.1710240569611;
        Tue, 12 Mar 2024 03:49:29 -0700 (PDT)
Message-ID: <117de48d-0193-4b59-961b-33c80354726c@suse.com>
Date: Tue, 12 Mar 2024 11:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/svm: Drop the _enabled suffix from vmcb bits
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
 <8e6d8cac54ca05f1202580b574c548e08988d8f6.1710149462.git.vaishali.thakkar@vates.tech>
 <1c67a337-e9d5-4e4a-91d5-3c935c410cda@suse.com>
 <5dd4007d-f273-4e43-add6-a77f0459fc33@vates.tech>
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
In-Reply-To: <5dd4007d-f273-4e43-add6-a77f0459fc33@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.03.2024 11:00, Vaishali Thakkar wrote:
> On 3/12/24 08:54, Jan Beulich wrote:
>> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>>> @@ -571,7 +571,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>       if ( nestedhvm_paging_mode_hap(v) )
>>>       {
>>>           /* host nested paging + guest nested paging. */
>>> -        n2vmcb->_np_enable = 1;
>>> +        n2vmcb->_np = true;
>>>   
>>>           nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
>>>   
>>> @@ -585,7 +585,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>       else if ( paging_mode_hap(v->domain) )
>>>       {
>>>           /* host nested paging + guest shadow paging. */
>>> -        n2vmcb->_np_enable = 1;
>>> +        n2vmcb->_np = true;
>>>           /* Keep h_cr3 as it is. */
>>>           n2vmcb->_h_cr3 = n1vmcb->_h_cr3;
>>>           /* When l1 guest does shadow paging
>>> @@ -601,7 +601,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
>>>       else
>>>       {
>>>           /* host shadow paging + guest shadow paging. */
>>> -        n2vmcb->_np_enable = 0;
>>> +        n2vmcb->_np = false;
>>>           n2vmcb->_h_cr3 = 0x0;
>>>   
>>>           /* TODO: Once shadow-shadow paging is in place come back to here
>>> @@ -706,7 +706,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
>>>       }
>>>   
>>>       /* nested paging for the guest */
>>> -    svm->ns_hap_enabled = !!ns_vmcb->_np_enable;
>>> +    svm->ns_hap_enabled = ns_vmcb->_np;
>>>   
>>>       /* Remember the V_INTR_MASK in hostflags */
>>>       svm->ns_hostflags.fields.vintrmask = !!ns_vmcb->_vintr.fields.intr_masking;
>>> @@ -1084,7 +1084,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>       if ( nestedhvm_paging_mode_hap(v) )
>>>       {
>>>           /* host nested paging + guest nested paging. */
>>> -        ns_vmcb->_np_enable = n2vmcb->_np_enable;
>>> +        ns_vmcb->_np = n2vmcb->_np;
>>>           ns_vmcb->_cr3 = n2vmcb->_cr3;
>>>           /* The vmcb->h_cr3 is the shadowed h_cr3. The original
>>>            * unshadowed guest h_cr3 is kept in ns_vmcb->h_cr3,
>>> @@ -1093,7 +1093,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>       else if ( paging_mode_hap(v->domain) )
>>>       {
>>>           /* host nested paging + guest shadow paging. */
>>> -        ns_vmcb->_np_enable = 0;
>>> +        ns_vmcb->_np = false;
>>>           /* Throw h_cr3 away. Guest is not allowed to set it or
>>>            * it can break out, otherwise (security hole!) */
>>>           ns_vmcb->_h_cr3 = 0x0;
>>> @@ -1104,7 +1104,7 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
>>>       else
>>>       {
>>>           /* host shadow paging + guest shadow paging. */
>>> -        ns_vmcb->_np_enable = 0;
>>> +        ns_vmcb->_np = false;
>>>           ns_vmcb->_h_cr3 = 0x0;
>>>           /* The vmcb->_cr3 is the shadowed cr3. The original
>>>            * unshadowed guest cr3 is kept in ns_vmcb->_cr3,
>>
>> While spotting the small issue below it occurred to me: Why is it that
>> vmcb_set_...() is open-coded everywhere here? I think this would be
>> pretty nice to avoid at the same time (for lines touched anyway, or in
>> a separate prereq patch, or alternatively [and only ideally] for all
>> other instances in a follow-on patch). Thoughts?
> 
> Yes, I noticed this too. My plan was to send a followup patch for
> fixing all the instances where vmcb_set/get_...() can be used.
> There are bunch of other vmcb bits (apart from the ones being
> handled in this patchset) in this file and in svm.c which can
> benefit from using VMCB accessors.

To keep churn as well as effort to find commits touching individual lines
low, doing the conversion when touching lines anyway is imo preferable. A
follow-on patch can then convert what's left.

Jan


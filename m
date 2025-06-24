Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AAFAE62DA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 12:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023569.1399566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU1CO-0001ro-2u; Tue, 24 Jun 2025 10:48:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023569.1399566; Tue, 24 Jun 2025 10:48:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU1CO-0001pf-0O; Tue, 24 Jun 2025 10:48:20 +0000
Received: by outflank-mailman (input) for mailman id 1023569;
 Tue, 24 Jun 2025 10:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU1CM-0001pW-US
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 10:48:18 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc749080-50e8-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 12:48:17 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so4054625f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 03:48:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a334211sm12772091a91.48.2025.06.24.03.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 03:48:16 -0700 (PDT)
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
X-Inumbo-ID: bc749080-50e8-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750762097; x=1751366897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9jWzjxr0cOhT/YcZtHzGMhL/Sb22rIktfPaUhxasPII=;
        b=Ov4oADaelMihxAckWwlyCJ/TCngsANp1+gMic57feu2syf2fGWjaxmVAOYmGOdRBCp
         fmeQYgUqEEilhlG7IxQiYPPA1twOgLGTF2oJQSaePumoRSLWNs2WPFzWy9FULsUC8i2o
         kzQbAAyrxkyO4i+LpbasSsaWk1FIRkXsUuCR1WU4FzCfcV8V5KGHt7YkCnaTZlhe1EaG
         maZJ4L/kXcmuMxyiJRsRELvcPkqD2BiBXlf3nl9my+OGsAuCNPon+h9E5mV25if0xcjW
         +VI7uLZwL9cbbMh1ie6ktrV4rmdk25vS6YEVFpiiomHbYzGoCtNNyzTjKNCMy0oR5eh6
         E4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750762097; x=1751366897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jWzjxr0cOhT/YcZtHzGMhL/Sb22rIktfPaUhxasPII=;
        b=nGjGytL3YViaSms6sekHN4S3DAM+C8NdFNe6KzrtHECWc0pJA1j/I2SLhYMUTYRgfx
         8GmGOsUYHe+95yv0Hp2+PNdkksNd54b8y9CocT/gFjvMMLnxE9Scs4na+bV98Nty5SuK
         kcLKA1tBQDHZ/tHxDJxfaPs3xQaTVq8rX/gusPTG/DhAfGJy5T8uOHRDel+xjGhCv68C
         UTty/vwbHWjE3o+QDK32OPZkIzYz993XiFUo9ZMTvw9JiUG0vIHA+4USIh7+uy0GK/ro
         bXCmn+Y/W4xbNKflmMSzVZ/hW+85EBJSaNQp5VkfrHfhmGGm6hZQxHO6fIa9AKqeISOt
         +utw==
X-Forwarded-Encrypted: i=1; AJvYcCVOhgemMxlF9psLdJAcwygpTKoJbODu8ulKfFEslJhSsnPQv3t926K7cfrRYVTvgaXXl7Gc4AM9iaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxI+ufr6O0eNRjl3x+qwC5qD0SBEcLZXern4iSQdCeZcXmVF1pI
	1K8zdzvPcZ5oxDHdqM/6roLj9e5zgpblBtL6AMZARBfvEMppDZ11cKicSo59MlQ9Jw==
X-Gm-Gg: ASbGnctdC7gBzDmyDYdWSCteIvOWe5AFBJBCsbcmATni7cUpidMsd1FYbXkaFlwnMCR
	JtuzwcIEfx3D3Y+VkDmhsh7H+vSQgmwrM/rtY5gJGu6Bc3GbTSMj/vnZptsBrcwqg/6mm3TRMvi
	ORWrHyXNPMoegLs99Iw0eZK5eeLGTGAL0obJHGJcQIc0PTHxHnUGHQ0xgOXXC0ZFPNLmWwn7z+T
	xUPWIHK85r+xzMk4JFVFA/ViUDUOpMYtiSmP5pKeQ2MkVm4sh04eUrYboss6/3wgSHVnGDZY8ct
	4aEjKziqfFWRBBB1FFDif3LR5gZOSpWAMuJResRXp6pL19/66yUQDzNTSlWxQqxZWnQogu/Hh/+
	6pEZslefkJ87oZXpva2RWS7V66WRrG+L/wx+ZyQXCh2++dxem4cjiaVuUGg==
X-Google-Smtp-Source: AGHT+IEVT+sCPchI0oycodkT/Oe9BDp+XLqlUzaXN78CmqG4Tdw45POyjzlSKHnRPSqQbBxRUA9Ybw==
X-Received: by 2002:a05:6000:2209:b0:3a5:270e:7d3 with SMTP id ffacd0b85a97d-3a6e71ff79amr2609444f8f.13.1750762096862;
        Tue, 24 Jun 2025 03:48:16 -0700 (PDT)
Message-ID: <9649aaa4-ae9e-40a1-88c2-119a4f995250@suse.com>
Date: Tue, 24 Jun 2025 12:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/17] xen/riscv: implement sbi_remote_hfence_gvma()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <ea7a15c0ecfd2bae95c11a92e4c0cb71b155140f.1749555949.git.oleksii.kurochko@gmail.com>
 <728ee92b-0e4f-4ccb-8c6e-54687bd75c62@suse.com>
 <7b8d5688-bfc3-4341-8fd5-8e9feefdfa82@gmail.com>
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
In-Reply-To: <7b8d5688-bfc3-4341-8fd5-8e9feefdfa82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2025 12:33, Oleksii Kurochko wrote:
> On 6/18/25 5:15 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> Instruct the remote harts to execute one or more HFENCE.GVMA instructions,
>>> covering the range of guest physical addresses between start_addr and
>>> start_addr + size for all the guests.
>> Here and in the code comment: Why "for all the guests"? Under what conditions
>> would you require such a broad (guest) TLB flush?
> 
> Hmm, it seems like KVM always do such a broad (guest) TLB flush during detection
> of VMIDLEN:
> 	void __init kvm_riscv_gstage_vmid_detect(void)
> 	{
> 		unsigned long old;
> 	
> 		/* Figure-out number of VMID bits in HW */
> 		old = csr_read(CSR_HGATP);
> 		csr_write(CSR_HGATP, old | HGATP_VMID);
> 		vmid_bits = csr_read(CSR_HGATP);
> 		vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
> 		vmid_bits = fls_long(vmid_bits);
> 		csr_write(CSR_HGATP, old);
> 	
> 		/* We polluted local TLB so flush all guest TLB */
> 		kvm_riscv_local_hfence_gvma_all();
> 	
> 		/* We don't use VMID bits if they are not sufficient */
> 		if ((1UL << vmid_bits) < num_possible_cpus())
> 			vmid_bits = 0;
> 	}
> 
> It is not clear actually why so broad and why not hfence_gvma_vmid(vmid_bits).
> 
> And I am not really 100% sure that any hfence_gvma() is needed here as I don't see
> what could pollutes local guest TLB between csr_write() calls.
> 
> RISC-V spec. says that:
> 	Note that writing hgatp does not imply any ordering constraints between page-table updates and
> 	subsequent G-stage address translations. If the new virtual machine’s guest physical page tables have
> 	been modified, or if a VMID is reused, it may be necessary to execute an HFENCE.GVMA instruction
> 	(see Section 18.3.2) before or after writing hgatp.
> 
> But we don't modify VM's guest physical page table. We could potentially reuse VMID between csr_write()
> calls, but it is returning back and we don't switch to a guest with this "new" VMID, so it isn't really used.

That would be my expectation, too. Yet I don't know if RISC-V has any
peculiarities there.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52184881056
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 11:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695860.1086088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtep-0007Mj-2p; Wed, 20 Mar 2024 10:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695860.1086088; Wed, 20 Mar 2024 10:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtep-0007Kb-01; Wed, 20 Mar 2024 10:58:55 +0000
Received: by outflank-mailman (input) for mailman id 695860;
 Wed, 20 Mar 2024 10:58:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmten-0007KV-CN
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 10:58:53 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d63167e1-e6a8-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 11:58:51 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-568d323e7fbso4513601a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 03:58:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cr8-20020a056402222800b005695f3e396csm3387135edb.15.2024.03.20.03.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 03:58:51 -0700 (PDT)
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
X-Inumbo-ID: d63167e1-e6a8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710932331; x=1711537131; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmKgPtcC2iyLajPa9nCvIekWN+qzRfCSlozxXb75ryI=;
        b=DsAyYzkrMm6RMWzurS9oQ6lKShr7G0WKcLPYCE3Hh/8GB1emuezxkdNvVnlqmoBDiR
         Ra8Gu879mB8qcAmrkj91/CIYdDQvoDwYMJxChOSjJrLJEMUgbkHljSYSXQndKGqYtd1R
         vDC43iGAOT+zNaW6YkKeK3TjYPC2UQ1dbQVys3/8Z091IWFbTYwaetgbfsMXKNXtsMkd
         QGkaYpk+RNUqNNjIy3caJJd3/mxOcMWjaWELu9GeEgU3DeusfDdPj1XkDueMYdWfqSu1
         YESIflMU4ZpyEEdNsvxKQuAZF2ixan2K9CDASFCiaj07bAd390Wnwx3H1xOWSUkTWsUV
         dHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710932331; x=1711537131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmKgPtcC2iyLajPa9nCvIekWN+qzRfCSlozxXb75ryI=;
        b=vEw4/03IVbOQnZqAdigyhXW4CSSF/JY4azVP78dE2LH0rkeCZ1xWGDdzDyIKGsLPcE
         YHoDvd/RkHR70ZGDe+9ECmNnLFq0NEEynRqV9x6U9jYDctFjYxUIAPkshCJv+5lbwAoA
         NJDrpCJJyURxV5CcnriLUwKMy3GMVmhtLtyoaWIYb4vuQrd/yJcW4Xioo3AS+7ZUXLdo
         pk5r1L55rhAhR7SReOOGQ3uVc67YrIoteOl+q743LFBPEo0ghQMBmZ160KuM5+tW+S+w
         oUJ+ZtAail6hLhYic5OY4Nb2OaxmncghorPp9Pe5OmgdRy8xjNq4nd/2uOZkZDRcgzMx
         OFUA==
X-Gm-Message-State: AOJu0YwmSFqJJyO7axvZM+ErVVDlJRHp2uSGAWxvPyMgEtNPF5FT1WrJ
	0oo+KFOTYa1JzW/lrLIbIZ8JZa/03+Uwx12Vn5M9gAM2Gms75DlY6XO1a2lcBQ==
X-Google-Smtp-Source: AGHT+IGBLTWWdMXlX5bzZsnuwXD1dW2QVkKqoXTdzPVo5+wyJRkrcJgKM8DG2iQSFBOFgCNK3AV2mw==
X-Received: by 2002:a05:6402:3607:b0:56b:a7e3:7426 with SMTP id el7-20020a056402360700b0056ba7e37426mr1708961edb.34.1710932331314;
        Wed, 20 Mar 2024 03:58:51 -0700 (PDT)
Message-ID: <c9f31608-3ff9-45d1-83e9-60541a8ec0f9@suse.com>
Date: Wed, 20 Mar 2024 11:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] AMD/IOMMU: drop remaining guest-IOMMU bits too
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <5eb98372-2992-4a93-846c-4e325c41af98@suse.com>
 <Zfq-mNNfG6I7diJw@macbook>
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
In-Reply-To: <Zfq-mNNfG6I7diJw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 11:46, Roger Pau Monné wrote:
> On Tue, Mar 19, 2024 at 02:28:12PM +0100, Jan Beulich wrote:
>> With a02174c6c885 ("amd/iommu: clean up unused guest iommu related
>> functions") having removed the sole place where d->g_iommu would be set
>> to non-NULL, guest_iommu_add_ppr_log() will unconditionally bail the
>> latest from its 2nd if(). With it dropped, all other stuff in the file
>> is unused, too. Delete iommu_guest.c altogether.
>>
>> Further delete struct guest{_buffer,_dev_table,_iommu{,_msi}} as well as
>> struct mmio_reg for being unused with the unused g_iommu also dropped
>> from struct arch_iommu.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wasn't sure how far to further go with removing the body of
>> parse_ppr_log_entry(), or perhaps even the entire function, and then
>> further up to all PPR logging code. Hence why for now I've merely
>> commented out the function call into the file being deleted (which of
>> course Misra isn't going to like). Thoughts / suggestions?
>>
>> I further wonder whether set_iommu_guest_translation_control() should
>> have been invoked independent of guest-IOMMU actually being enabled. IOW
>> that may want purging, too. Along these lines iommuv2_enabled may also
>> want dropping, for not having any consumer left. Much like has_viommu()
>> and then also {XEN_,}X86_EMU_IOMMU, i.e. going as far as affecting the
>> public interface.
>>
>> --- a/xen/arch/x86/include/asm/iommu.h
>> +++ b/xen/arch/x86/include/asm/iommu.h
>> @@ -52,7 +52,6 @@ struct arch_iommu
>>          struct {
>>              unsigned int paging_mode;
>>              struct page_info *root_table;
>> -            struct guest_iommu *g_iommu;
>>          } amd;
>>      };
>>  };
>> --- a/xen/drivers/passthrough/amd/Makefile
>> +++ b/xen/drivers/passthrough/amd/Makefile
>> @@ -5,4 +5,3 @@ obj-y += pci_amd_iommu.o
>>  obj-bin-y += iommu_acpi.init.o
>>  obj-y += iommu_intr.o
>>  obj-y += iommu_cmd.o
>> -obj-$(CONFIG_HVM) += iommu_guest.o
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -145,57 +145,6 @@ int iterate_ivrs_entries(int (*handler)(
>>                                          struct ivrs_mappings *map,
>>                                          uint16_t bdf));
>>  
>> -/* iommu tables in guest space */
>> -struct mmio_reg {
>> -    uint32_t    lo;
>> -    uint32_t    hi;
>> -};
>> -
>> -struct guest_dev_table {
>> -    struct mmio_reg         reg_base;
>> -    uint32_t                size;
>> -};
>> -
>> -struct guest_buffer {
>> -    struct mmio_reg         reg_base;
>> -    struct mmio_reg         reg_tail;
>> -    struct mmio_reg         reg_head;
>> -    uint32_t                size;
>> -};
>> -
>> -struct guest_iommu_msi {
>> -    uint8_t                 vector;
>> -    uint8_t                 dest;
>> -    uint8_t                 dest_mode;
>> -    uint8_t                 delivery_mode;
>> -    uint8_t                 trig_mode;
>> -};
>> -
>> -/* virtual IOMMU structure */
>> -struct guest_iommu {
>> -
>> -    struct domain          *domain;
>> -    spinlock_t              lock;
>> -    bool                    enabled;
>> -
>> -    struct guest_dev_table  dev_table;
>> -    struct guest_buffer     cmd_buffer;
>> -    struct guest_buffer     event_log;
>> -    struct guest_buffer     ppr_log;
>> -
>> -    struct tasklet          cmd_buffer_tasklet;
>> -
>> -    uint64_t                mmio_base;             /* MMIO base address */
>> -
>> -    /* MMIO regs */
>> -    union amd_iommu_control reg_ctrl;              /* MMIO offset 0018h */
>> -    struct mmio_reg         reg_status;            /* MMIO offset 2020h */
>> -    union amd_iommu_ext_features reg_ext_feature;  /* MMIO offset 0030h */
>> -
>> -    /* guest interrupt settings */
>> -    struct guest_iommu_msi  msi;
>> -};
>> -
>>  extern bool iommuv2_enabled;
> 
> I think iommuv2_enabled can also go away, since it's only used by
> guest_iommu_init()?
> 
> It's set in amd_iommu_prepare() and amd_iommu_init_cleanup() but only
> consumed by guest_iommu_init().

See the post-commit-message remarks: The main question is where to stop.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDvwD67+gmmagQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:09:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B393E2EC6
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 09:09:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220179.1528888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXwa-0003ar-4q; Wed, 04 Feb 2026 08:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220179.1528888; Wed, 04 Feb 2026 08:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnXwa-0003Y3-2A; Wed, 04 Feb 2026 08:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1220179;
 Wed, 04 Feb 2026 08:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnXwY-0003Xx-LL
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 08:08:58 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id befd4316-01a0-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 09:08:53 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so3092235e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 00:08:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4831084dd88sm27082455e9.6.2026.02.04.00.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 00:08:52 -0800 (PST)
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
X-Inumbo-ID: befd4316-01a0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770192533; x=1770797333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+aJmMLwLhiWWtX5iycDbbfBBWzQlJBoKNaw/NPQdrS0=;
        b=BJflsnzFPb4jKr+ebl4R5HpK7DGUqhBsHYdA7lYXf518u455QhJI/GTfvllThT8FFC
         7Epm1fwBeNphhfSRGtFWaaF7peIkCEtB9B8BTtOK0bjIqi4TPf7+n4Gimw/tWidg0AeK
         BNk5HC44ZXLT3LbOJrOP6JN8HOv38aXnUalYaqqxbR8ndf7HTg4bxzlJ0Elhjv6ICnY3
         O/o+zKdVM1Sbi1AHRmMyUTN/86XuMS8DI5+QWahzgak+EJp/16MsD295AkhLhRARVCHd
         cvhu18Fpq+PPwZvMHN9jc2w+oqo/wYKhOQfyZhoFR98yLkHamXn5DHKhmEbEmwcB7NWA
         JGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770192533; x=1770797333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aJmMLwLhiWWtX5iycDbbfBBWzQlJBoKNaw/NPQdrS0=;
        b=LiU4lRWRRoVpIhvqkWAD8SYsvI//RA7OYE3zerx0BCftRXnqR8aTlLRDQi9LttG5Xw
         DOsnl49HN9haRXUQQRqErSG8IsbBXi3ItQWAGQzWtt0hXLNuU0KRDgVj4WBdig0mjkP9
         vQmptT9nS1qf4tJbJQ5Vdadz1xvS1hbQRi4YZFShshvhVRW+842rrUxMXbzJMkroTbu6
         QzOC/dXQXf5cNkykpvW2utyUQtVqnQEEQY4L2ATDHk4t+PwbeAjZHOmiAY7QHe/+EvKe
         DYbLncVPiQstD1xqQkXxFQNTXAyhIg7bQD+6FrStRBXBATSWicBod9+aOJhIjRBTAGEZ
         iG6A==
X-Forwarded-Encrypted: i=1; AJvYcCV+HLcJeTTxin7rjEoJ2lnQs3Mok0DR+UsjE4I6X0iPUJoadTlWe0C3CnvBOfKSqACHdFeVoAi11KE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzvWpmh+uGRAu+bS7aaxOCS3zYC2rdDfwF2JJfuFkZ5ZFolq4CH
	bcOlOtOjbCuLETuB+EYkeb2DwPBB3h4D6oSddbnryao9Vg+dgE4nZ1rqmnc5vwFzsw==
X-Gm-Gg: AZuq6aL9CpDy6/r+0+bCD+TYx5jEINXeF9hZDLr+DYW3fRaC9Q3hhVbnwGlcFX7qx51
	jE8XnkAt0wqWT4vhpiGzkLK0xiGO/I554j6yCCT9yKp6GvT+C7BWHJpDAocTzFwF4fwepmT3K6o
	WWoPBIqsFsUeA24FmEkFuWpyNCR8MB6ikN6d8M/sB//N+BzlYezVxNy7+b7ysjvzI3C6Kdi6Sfr
	DBHLzgVVKyF2H81+1xik3QrLUjzJouofHjjmYF8bB+aNDuSNdZT4UT11vIs/ktzOmjfaJ5KhH0r
	j7H4E10lkAOZS7t8ru8hLgYcPq+mckZ191w6q/s4G4EXnjVt8ue8sg9X39hFWd6r9tKULHKrBSh
	1SFZul8CjHdRoyNaqxAEtc4Jiwk0USnwvbXHFFuApMBnTQxWp1SrMK5/23KcZobJSe6acdzWqJx
	/TQx0YgS0GwwoI4iwRVvN0ZT29n7iFKKdYbv7EL89EyW+c0ipLJswlrzPOhd+hEBa/ipKp55Xyd
	Ao=
X-Received: by 2002:a05:600c:8b83:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-4830eb61890mr22771225e9.14.1770192533229;
        Wed, 04 Feb 2026 00:08:53 -0800 (PST)
Message-ID: <bdda8006-6361-4e79-b3ef-19409bf98587@suse.com>
Date: Wed, 4 Feb 2026 09:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/24] xen/domctl: wrap pci-subset iommu-related domctl
 op with CONFIG_MGMT_HYPERCALLS
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 "grygorii_strashko@epam.com" <grygorii_strashko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Andryuk, Jason" <Jason.Andryuk@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Garcia Vallejo, Alejandro" <Alejandro.GarciaVallejo@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-15-Penny.Zheng@amd.com>
 <DM4PR12MB84517CB58BD82B676DD25AE9E198A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84517CB58BD82B676DD25AE9E198A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:penny.zheng@amd.com,m:Ray.Huang@amd.com,m:grygorii_strashko@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Jason.Andryuk@amd.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:Alejandro.GarciaVallejo@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5B393E2EC6
X-Rspamd-Action: no action

On 04.02.2026 08:50, Penny, Zheng wrote:
>> -----Original Message-----
>> From: Penny, Zheng <penny.zheng@amd.com>
>> Sent: Friday, November 21, 2025 6:58 PM
>>[...]
>> 772,14 +774,16 @@ static const struct iommu_ops __initconst_cf_clobber
>> _iommu_ops = {
>>      .quarantine_init = amd_iommu_quarantine_init,
>>      .add_device = amd_iommu_add_device,
>>      .remove_device = amd_iommu_remove_device,
>> -    .assign_device  = amd_iommu_assign_device,
>>      .teardown = amd_iommu_domain_destroy,
>>      .clear_root_pgtable = amd_iommu_clear_root_pgtable,
>>      .map_page = amd_iommu_map_page,
>>      .unmap_page = amd_iommu_unmap_page,
>>      .iotlb_flush = amd_iommu_flush_iotlb_pages,
>> +#ifdef CONFIG_MGMT_HYPERCALLS
>> +    .assign_device  = amd_iommu_assign_device,
>>      .reassign_device = reassign_device,
>>      .get_device_group_id = amd_iommu_group_id,
>> +#endif
> 
> FWIS, Alejandro has come up a more clever way to DCE these kinds of op, staying conditionally as callback. Here, I just took this commit as example to show the methodology:
> ```
>          .assign_device  = IS_ENABLED(CONFIG_MGMT_HYPERCALLS)
>                                         ? amd_iommu_assign_device
>                                         : NULL,
> ```
> The compiler has enough visibility to know that static(amd_iommu_assign_device()) is used, and is droppable when MGMT_HYPERCALLS=n. So there is no need to do ifdef-wrapping around these statics now. Later when jason's "--gc-section" patch serie in,  --gc-section will help linker identify them unused when MGMT_HYPERCALLS=n, then remove them automatically.

I fear I don't see why --gc-sections would make a difference when, for static
functions, the compiler already is in the position of removing the functions.

> If we all agreed to use above methodology to do DCE.
> Alejandro also recommended that since we will do this assignments in enough places in this patch serie, we probably want something like MAYBE_OP() somewhere in xen/macros.h:
> 
> #define MAYBE_OP(c, fn) (IS_ENABLED(c) ? fn : NULL)
> 
> I'd like to listen from your opinions on whether I shall do such update for v5, since it is quite a big update

Well, already there I did raise my concern of leaving around function pointer
fields in structures which will only ever be NULL. If respective fields are
removed altogether, there's no risk whatsoever that an accidental use may be
overlooked - the build would simply fail when making such an attempt. Calls
through NULL are privilege escalation XSAs when PV guests can somehow
leverage them, and use of altcall patching would still only downgrade them
to DoS XSAs.

Jan


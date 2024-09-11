Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F3975026
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 12:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796422.1205980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKwj-0004Yx-Df; Wed, 11 Sep 2024 10:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796422.1205980; Wed, 11 Sep 2024 10:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soKwj-0004WU-As; Wed, 11 Sep 2024 10:51:37 +0000
Received: by outflank-mailman (input) for mailman id 796422;
 Wed, 11 Sep 2024 10:51:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soKwi-0004Vc-Cn
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 10:51:36 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cffcc167-702b-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 12:51:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso147650966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 03:51:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fc4sm5331296a12.78.2024.09.11.03.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 03:51:33 -0700 (PDT)
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
X-Inumbo-ID: cffcc167-702b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726051894; x=1726656694; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c0suOF3XNLe+yNF2mLlbW7iITXEmfs0Ps8VV0Ht79YU=;
        b=EoFFxrQZcLnX+QqqHpmfKo041Q+X8a1S+kLJ5j8Rz/G0nE1VLAJ6GDGkshafz1/cKX
         Ur/DeJuEovE4a2Nv1vBtf7F3VyEZ9kRQygPbPR43tKVuFsVYUd07Q6BETVi+hKpxPYjE
         1SN4OjVsXHQwSpB+oMLSboWYy5p6WHBdBTuTQPHaiOBKv8as9sdPDjqtyNTr/ccsgfLa
         nvxz109/KnKWgVBDnyUSViMA7jLia8pi118TciGE6ol9hQC+rYcJesRFULtdEDrURQAy
         AX/Uf8bwL89fRDtT4VydkA8cMJ8BKojXUak4ul5X0xBZ4tR3f/2ceThfmpelLisoB768
         +b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051894; x=1726656694;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0suOF3XNLe+yNF2mLlbW7iITXEmfs0Ps8VV0Ht79YU=;
        b=o5PHz4CRVc8IedwUoEAEwY2vzWMMVAJcySeleZ36horF7cVdV85m2vSqLRlFZ0+cNu
         9w5J/BgVy+gjnNcH1Ro6Xs+6lILq5Ng1o1fTTlmBcVwnOk2mp+MZvIA5eBWB+ZQOoZgu
         XAovwQUOsWiOR0aphvRsYV+PAXUBwh7C1Wf6dA3hf/EoCtn1g4y6dMbSUT7QBCaB1EgH
         5E8oB2RX5h99h5XOe/RvIbE+8nLDxcvkGt5v0aFXT+aPQ/QRncma6SVLmj1mrBz5pmwI
         7Ez30UTHApcH40WYFX3ZcQlmrkgyI4XIYfWkCnZ4nl8WM7GSj3hbrc1w1tZl89HG8Lnd
         b8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyuybfwh7FrOmr0HuJKca1EAPHfze/BQoRybe0CFSRJ/qBcyYqerdt9xyUHbF6/NEsbNMP/fGnBhc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0Yb4Js0CRgXAIi5T2pWnS1Ad4I278ZXdwgQV4NiUmzfe5L+n1
	cM/GshD1EvvfuWGSa8XaGyaF6zNWZ03moT0PuyZ2ULV4P3oWw6vuNx/eHY+9XQ==
X-Google-Smtp-Source: AGHT+IGHL5IJh6u8x6pVwVULqbdTk9lKW1AZDWyg8MrIDIfc8NyzG23mBfCIQXP5YmNulJfO6yJhHw==
X-Received: by 2002:a17:906:6a19:b0:a8d:ee9:3888 with SMTP id a640c23a62f3a-a8ffae3b788mr373373466b.32.1726051894126;
        Wed, 11 Sep 2024 03:51:34 -0700 (PDT)
Message-ID: <901ff507-1f96-43aa-a3f6-6e283719e003@suse.com>
Date: Wed, 11 Sep 2024 12:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v15 3/4] tools: Add new function to get gsi from
 dev
From: Jan Beulich <jbeulich@suse.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Huang Rui <ray.huang@amd.com>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20240911065832.1591273-1-Jiqian.Chen@amd.com>
 <20240911065832.1591273-4-Jiqian.Chen@amd.com>
 <9537bdef-26f7-4a86-8bb8-52c7e409f742@suse.com>
Content-Language: en-US
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
In-Reply-To: <9537bdef-26f7-4a86-8bb8-52c7e409f742@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2024 12:49, Jan Beulich wrote:
> On 11.09.2024 08:58, Jiqian Chen wrote:
>> On PVH dom0, when passthrough a device to domU, QEMU and xl tools
>> want to use gsi number to do pirq mapping, see QEMU code
>> xen_pt_realize->xc_physdev_map_pirq, and xl code
>> pci_add_dm_done->xc_physdev_map_pirq, but in current codes, the gsi
>> number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
>> wrong, because irq is not equal with gsi, they are in different
>> spaces, so pirq mapping fails.
>>
>> And in current codes, there is no method to get gsi for userspace.
>> For above purpose, add new function to get gsi, and the
>> corresponding ioctl is implemented on linux kernel side.
>>
>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
>> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
>> ---
>> RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
>> https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
> 
> I'm afraid I don't understand this remark: The change here (and similarly
> patch 4) ought to be independent of when the kernel change goes in. After
> all the libraries need to work on older Linux as well. Please clarify.

Hmm, maybe for this patch the dependency is for the new IOCTL as an
interface to be accepted. That's fine a dependency of course. Yet then
why the same remark in patch 4?

Jan


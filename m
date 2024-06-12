Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95DE904E84
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:54:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738989.1145878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJjh-0004YD-Tl; Wed, 12 Jun 2024 08:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738989.1145878; Wed, 12 Jun 2024 08:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJjh-0004WT-R8; Wed, 12 Jun 2024 08:53:41 +0000
Received: by outflank-mailman (input) for mailman id 738989;
 Wed, 12 Jun 2024 08:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHJjg-0004WN-S9
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:53:40 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d412a4-2899-11ef-b4bb-af5377834399;
 Wed, 12 Jun 2024 10:53:38 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so249070366b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:53:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f107adb1esm500989966b.50.2024.06.12.01.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 01:53:38 -0700 (PDT)
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
X-Inumbo-ID: 42d412a4-2899-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718182418; x=1718787218; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hasYh0cGP8cu6FU9agK0WjRPVAcQ9kpJmW7Mb/1Ogvk=;
        b=cJXz3GflU9uMHUSavwKyVM3WIiBuTePk0t/4t+++beoeeaYYjRIrlIytLOWX4ide3Q
         cImNldTEoGWLj/tWseJgqXoZYMI8dBLERPU1YX9IDVhkOtg6uV/7cimtwF93SzckxnwW
         mG33lRJZqxwPYYc89FDDKpGLUYUb+V4kh/8PoQVvFYH/UZjSsACKaC300mVErXbOhtcE
         SRsYAH7ODfXdP4AnDdgauDIPllB+GjsrnjF8bPa6IGO856y18LhbJ9/Af7rlgK88CB6V
         oN7+xjhurGGfYXP69Bb4xXUz4mzAzyr4VhlzJVpbNtwGRYDiYIknG02aVulbc7tgkrNS
         rDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182418; x=1718787218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hasYh0cGP8cu6FU9agK0WjRPVAcQ9kpJmW7Mb/1Ogvk=;
        b=urNAHhUpe2erIv4bcrSYuIt7MUvTtg4puxmwxjuvbgviyvUpE4DdLlLjHCNn78TIKB
         awSbMG4TS4Mhmn3XljgpOh2fogakh5pM5gos4TC3hNObW136Slw5eXdSyl+2PXhwBasH
         U03QK2wV+XSeEa6dzFinfDFc101gWQ8801pi7hz95HwxNb8RwH9t8Izfoi1btNiI4V1g
         sMU3PN3sw2hMgZFtH0gPeQnxJ5OarvwY3a1Zr6hxQsHI27RLWHEOpx0cUUgPjjQt85I+
         W6rrEaZ4XkdxbCh8bzpWWclx1lH0Dn56+LFjc7jEbBm4N07pa/FyyV7s0soulcud6ulj
         oYMw==
X-Forwarded-Encrypted: i=1; AJvYcCWuuOzCrISwF4qoXw1xzDrnSbJarJRByHPSPvEGx8JU7IFqit4TBoaXijP2OMEmUnHUje2Fli/qxJ9joSl7RlIuugY7fTa4G/lsNCrJj8k=
X-Gm-Message-State: AOJu0YziuZlqVpSoSg/ShdGc/iUS7Mc44R4u9z7z9og1BODeEeJvEAm4
	n/dwNXzgjmSrG0l7KO2xcku//OfaM7qGqx44w0LbRWhGnCP5mzjVJiATusBNHw==
X-Google-Smtp-Source: AGHT+IGGBEbfPA3rSVKmZgbYbuUjwb07t5oH5IsxX9ptuFcOfSVBJUoFli+rxKMXCfYZX223gNLy5g==
X-Received: by 2002:a17:906:cec3:b0:a6f:d7a:d650 with SMTP id a640c23a62f3a-a6f47d3b998mr62605266b.50.1718182418285;
        Wed, 12 Jun 2024 01:53:38 -0700 (PDT)
Message-ID: <41905257-e2e6-4bce-b723-516916448dfd@suse.com>
Date: Wed, 12 Jun 2024 10:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v9 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-3-Jiqian.Chen@amd.com>
 <efc35614-561c-4baa-9d94-d17ecb528a4b@suse.com>
 <BL1PR12MB5849B1B536BAD641C37A4308E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849B1B536BAD641C37A4308E7C02@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 04:43, Chen, Jiqian wrote:
> On 2024/6/10 23:58, Jan Beulich wrote:
>> On 07.06.2024 10:11, Jiqian Chen wrote:
>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>> a passthrough device by using gsi, see qemu code
>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>> is not allowed because currd is PVH dom0 and PVH has no
>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>
>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>> PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
>>> add a new check to prevent self map when subject domain has no
>>> PIRQ flag.
>>>
>>> Signed-off-by: Huang Rui <ray.huang@amd.com>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> What's imo missing in the description is a clarification / justification of
>> why it is going to be a good idea (or at least an acceptable one) to expose
>> the concept of PIRQs to PVH. If I'm not mistaken that concept so far has
>> been entirely a PV one.
> I didn't want to expose the concept of PIRQs to PVH.
> I did this patch is for HVM that use PIRQs, what I said in commit message is HVM will map a pirq for gsi, not PVH.
> For the original code, it checks " !has_pirq(currd)", but currd is PVH dom0, so it failed. So I need to allow PHYSDEVOP_map_pirq
> even currd has no PIRQs, but the subject domain has.

But that's not what you're enforcing in do_physdev_op(). There you only
prevent self-mapping. If I'm not mistaken all you need to do is drop the
"d == current->domain" checks from those conditionals.

Further see also
https://lists.xen.org/archives/html/xen-devel/2024-06/msg00540.html.

Jan


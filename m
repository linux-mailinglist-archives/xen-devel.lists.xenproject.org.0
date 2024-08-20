Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22625957F05
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 09:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780071.1189656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgIxa-0000v9-Aa; Tue, 20 Aug 2024 07:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780071.1189656; Tue, 20 Aug 2024 07:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgIxa-0000tE-7r; Tue, 20 Aug 2024 07:07:18 +0000
Received: by outflank-mailman (input) for mailman id 780071;
 Tue, 20 Aug 2024 07:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgIxY-0000t8-G9
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 07:07:16 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d488e68f-5ec2-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 09:07:15 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7d26c2297eso591046166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 00:07:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c6a0csm725241866b.22.2024.08.20.00.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 00:07:14 -0700 (PDT)
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
X-Inumbo-ID: d488e68f-5ec2-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724137635; x=1724742435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F7hlZyphibUfZkTxugUKietLuX0v/KDHkvU0iG/eoGY=;
        b=UsY8X8CSHP7zkL+Q3iXB91r9BaljbJ+zqd6wBgyXn+539Nflwnatut89zESa3vAUAq
         g4jvzL3Zf69pB1k7kR8vL4diccgBlSrCIgGBYnxFjqPTs0hEcdL1HY38Px7Od4kNdFkq
         O3LJn4GdbzlVDQsLIwoizaqmgC0WmcVEsttqqaivp+djVxsKMC/qcXrthoDSUjUkXZlz
         ZnOW3G4bP8LT6qcsvhnvsn/WZJbCJsXhLucPskhTnmuSW9V3YzFQ6VLx3i2M/edLSEQF
         a2/lAJWxTQg2BuJCXALKlFwJjxTxdpwTj3bI0Rg8MNDK+TZtKb9DjFnhcR4YL8QPQU5G
         WjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724137635; x=1724742435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7hlZyphibUfZkTxugUKietLuX0v/KDHkvU0iG/eoGY=;
        b=H/c3CXkamEaleIeodH/2ORBcvGPP6yTTOlXLqyTu/XTuOicPcHkFk+e82si5j61hdj
         I0fiq/BXagWjXb0MWpzXnZV632VUF6mhQRF2rQhTqjZRUlAFgsKdf5csbWwACd+h/oO+
         77B57NCPJoWlk2+cdOmsZWc6asHMYiOGRDK4UATeo5fPbYBUxqe30/PuFToX0FKkY4TG
         Bk4SFLCvM81obvvW+ZGcYjwXxDjb3qdAYVwwMAm9RPvS6pvr+aOBlCOha6cX/P6H7XK8
         BBkWYjxQ2wweTZrD3CPYtUmyot0NUkokQfVMpH347Jzb83vfMUmFjN9RFbfLVCyTSrlw
         DZhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4D0JlqJQj7USmNX250ah3006O9jFaFg6IT6pTmkIPEUq1m5vWn/olcLsPcHkH/SCZHVoSRX09nDA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBBR9YgBY7rQXrvMVszBkBHOvuwApetPO4wP79RsZW8U6qyXUv
	m1/VYzGppRCZ6spGYUd1rJtOAxrJ0Y/vx1zv19Ksfp+GVDMQeiFznuVIxH2qtw==
X-Google-Smtp-Source: AGHT+IEZgXdQ1URHJuTEBmJhl86j6ASawkiNvIxJSldknnzcOZJCZ7a10AURUXWXOsyKclyxhNrACg==
X-Received: by 2002:a17:907:e601:b0:a7a:9447:3e8b with SMTP id a640c23a62f3a-a839292de83mr1082436666b.25.1724137634788;
        Tue, 20 Aug 2024 00:07:14 -0700 (PDT)
Message-ID: <216ebf5e-75d2-40f2-bc79-65fe67e54bed@suse.com>
Date: Tue, 20 Aug 2024 09:07:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v13 2/6] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <gwd@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240816110820.75672-1-Jiqian.Chen@amd.com>
 <20240816110820.75672-3-Jiqian.Chen@amd.com>
 <4a421c07-d8a0-4af9-816f-5d76d39fe31f@suse.com>
 <BL1PR12MB58492B55B496755585774CB0E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB58492B55B496755585774CB0E78D2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.08.2024 08:12, Chen, Jiqian wrote:
> On 2024/8/19 17:08, Jan Beulich wrote:
>> On 16.08.2024 13:08, Jiqian Chen wrote:
>>> If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
>>> a passthrough device by using gsi, see qemu code
>>> xen_pt_realize->xc_physdev_map_pirq and libxl code
>>> pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
>>> will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
>>> is not allowed because currd is PVH dom0 and PVH has no
>>> X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.
>>>
>>> So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
>>> iPHYSDEVOP_unmap_pirq for the removal device path to unmap pirq.
>>> So that the interrupt of a passthrough device can be successfully
>>> mapped to pirq for domU with a notion of PIRQ when dom0 is PVH.
>>>
>>> To exposing the functionality to wider than (presently) necessary
>>> audience(like PVH domU), so it doesn't add any futher restrictions.
>>
>> The code change is fine, but I'm struggling with this sentence. I can't
>> really derive what you're trying to say.
> Ah, I wanted to explain why this path not add any further restrictions, then used your comments of last version.
> How do I need to change this explanation?

I think you want to take Roger's earlier comments (when he requested
the relaxation) as basis to re-write (combine) both of the latter two
paragraphs above (or maybe even all three of them). It's odd to first
talk about Dom0, as if the operations were to be exposed just there,
and only then add DomU-s.

>>> And there already are some senarios for domains without
>>> X86_EMU_USE_PIRQ to use these functions.
>>
>> Are there? If so, pointing out an example may help.
> If I understand correctly, Roger mentioned that PIRQs is disable by default for HVM guest("hvm_pirq=0") and passthrough device to guest.
> In this scene, guest doesn't have PIRQs, but it still needs this hypercall.

In which case please say so in order to be concrete, not vague.

Jan


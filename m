Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7F901C35
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:58:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737012.1143121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZuz-0005sy-1F; Mon, 10 Jun 2024 07:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737012.1143121; Mon, 10 Jun 2024 07:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZuy-0005rK-Ul; Mon, 10 Jun 2024 07:58:16 +0000
Received: by outflank-mailman (input) for mailman id 737012;
 Mon, 10 Jun 2024 07:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZux-0005rE-Ky
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:58:15 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fe8ff29-26ff-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 09:58:13 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6269885572so900858566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:58:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57c6d34f607sm3793582a12.30.2024.06.10.00.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:58:12 -0700 (PDT)
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
X-Inumbo-ID: 2fe8ff29-26ff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718006293; x=1718611093; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tjZzn6huI32bLIfB+xQcOGq8u/3dyaxQvwAifJWwFaw=;
        b=K0yHl5SRD+n1j5XWf9F9+41UZeqdcvD4eBiX3lIBGWqNuPvJ0DXuu53C6a96Xm5sef
         E30qkBeKsxipn+Wdntz5cKClSs/aPK+lbhQMpQHzEhASXp3paA+A+CeBVnkveYUVb+Hb
         zlnq0PpdBYzD8QRbSV/MmlILWjwVkOFwykNsBUIisIutN7OzWuiNCZXoh+64NhyTSwRt
         NZzzolZsAMKvX7vsuBK3a60J4IZptxgQt0zOY3BZRR6eN5juYLCfj42ki5ZU4R6Dvoht
         88+YMNIifJIOnCVm6K4G4kW4t5t7M3Ug/VUVREI36WhitFyybW2Sm/GbzlchOV9aRySr
         WC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718006293; x=1718611093;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjZzn6huI32bLIfB+xQcOGq8u/3dyaxQvwAifJWwFaw=;
        b=wTft+Fvcjo+39933XEq6fk7z7ZGLGJbOngpiKz2l6VRh+MMkiRsM2t4NLM042vPMc+
         dPTIg96z/uptov5RBnBQ+UA73kHE4IZ/+bqOnt37jvmp10pYUF9pHDVm3yaiIqEjSS81
         Elia/t4qUadcsLl688KpDMxXtoveyzH6sJhJCpZPgKSBbaUDnibA4AU0BpXITFkrBsm1
         IbCI2TOIlf32cMB56tvgTQyLOwiQuMxEVIaelMTOjV+1FKfVVVHaRYNK4+QaXHuLZvQn
         zYR4SYw3KDh23KLNvTtwp6uxQpia2KqUKn9QDqKX8nR3pCao6eQ6+cnkc/cAfbBAtdvB
         X2KQ==
X-Gm-Message-State: AOJu0YxsqdL72gV+TRwcxwnn/xgxNIxrenucBFXGiMg6UXdC+qJ31KhC
	DtJcGDsd3UyxsBrwxmh99cDEJuX/ZVB47KJT+cjqCwb7Zu4o3QIaUJDw7xxIsETuJ1EMY0v5V3c
	=
X-Google-Smtp-Source: AGHT+IEaVLAs9FvqUYV7YrgTyMEalk2IGuQCeGAr6nbl25cdJPM0gEGAV1Hn3SJnnlUpt+YQ41jLAg==
X-Received: by 2002:a17:906:adb:b0:a6e:f655:ef29 with SMTP id a640c23a62f3a-a6ef655f132mr491449066b.17.1718006292898;
        Mon, 10 Jun 2024 00:58:12 -0700 (PDT)
Message-ID: <b609eaab-0a0a-433b-81d3-84a0cd90ebc1@suse.com>
Date: Mon, 10 Jun 2024 09:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Segment truncation in multi-segment PCI handling?
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <ZmNjoeFAwWz8xhfM@mail-itl>
 <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <9cbb6dce-b669-4237-8932-b5cd64eb7288@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.06.2024 21:52, Andrew Cooper wrote:
> On 07/06/2024 8:46 pm, Marek Marczykowski-Górecki wrote:
>> Hi,
>>
>> I've got a new system, and it has two PCI segments:
>>
>>     0000:00:00.0 Host bridge: Intel Corporation Device 7d14 (rev 04)
>>     0000:00:02.0 VGA compatible controller: Intel Corporation Meteor Lake-P [Intel Graphics] (rev 08)
>>     ...
>>     10000:e0:06.0 System peripheral: Intel Corporation RST VMD Managed Controller
>>     10000:e0:06.2 PCI bridge: Intel Corporation Device 7ecb (rev 10)
>>     10000:e1:00.0 Non-Volatile memory controller: Phison Electronics Corporation PS5021-E21 PCIe4 NVMe Controller (DRAM-less) (rev 01)
>>
>> But looks like Xen doesn't handle it correctly:
>>
>>     (XEN) 0000:e0:06.0: unknown type 0
>>     (XEN) 0000:e0:06.2: unknown type 0
>>     (XEN) 0000:e1:00.0: unknown type 0
>>     ...
>>     (XEN) ==== PCI devices ====
>>     (XEN) ==== segment 0000 ====
>>     (XEN) 0000:e1:00.0 - NULL - node -1 
>>     (XEN) 0000:e0:06.2 - NULL - node -1 
>>     (XEN) 0000:e0:06.0 - NULL - node -1 
>>     (XEN) 0000:2b:00.0 - d0 - node -1  - MSIs < 161 >
>>     (XEN) 0000:00:1f.6 - d0 - node -1  - MSIs < 148 >
>>     ...
>>
>> This isn't exactly surprising, since pci_sbdf_t.seg is uint16_t, so
>> 0x10000 doesn't fit. OSDev wiki says PCI Express can have 65536 PCI
>> Segment Groups, each with 256 bus segments.
>>
>> Fortunately, I don't need this to work, if I disable VMD in the
>> firmware, I get a single segment and everything works fine.
>>
> 
> This is a known issue.  Works is being done, albeit slowly.

Is work being done? After the design session in Prague I put it on my
todo list, but at low priority. I'd be happy to take it off there if I
knew someone else is looking into this.

> 0x10000 is indeed not a spec-compliant PCI segment.  It's something
> model specific the Linux VMD driver is doing.

I wouldn't call this "model specific" - this numbering is purely a
software one (and would need coordinating between Dom0 and Xen).

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C254FAF7268
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:34:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032075.1405830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXICS-0006R6-Dt; Thu, 03 Jul 2025 11:33:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032075.1405830; Thu, 03 Jul 2025 11:33:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXICS-0006OZ-9o; Thu, 03 Jul 2025 11:33:56 +0000
Received: by outflank-mailman (input) for mailman id 1032075;
 Thu, 03 Jul 2025 11:33:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXICQ-0006BP-Qo
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:33:54 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 970558ca-5801-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:33:50 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-453643020bdso68740765e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:33:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1bfasm160223495ad.20.2025.07.03.04.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:33:48 -0700 (PDT)
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
X-Inumbo-ID: 970558ca-5801-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751542429; x=1752147229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qrLdFDQuLoUIe/uEekZNEbX75EWId+qZvas9OC1Cbf8=;
        b=JoiR/Px+NGQ4kvZNQ/LmXd6hmdW5liBg2BvVytILW0naJrPmp2+X24oEavWkzdSSba
         ER2/6QdoVsdMKDBusLzWclgGtxqflu7Xx4HPBx1+MjHe16O1Dr9cnkETGsi8fTkARuI9
         rVYx1yp8+oQPqNbgOH2QGuNNB6Gkx81xafsYRW1tX2E7NK1ayla3jjpC91iWDPiILKx5
         fxkTPbkaCpaXrIRwL0lzIG3bGydp3kC6VziXVwPCa70Y4e3keFK96NAj86N6VZw5LNqS
         3vFtN7EJ/sEyf6ekLyenJbNV+Antggbn/NPWw5C8VwxqViNzOt7BGZFvPDjML9iXDjKg
         jk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542429; x=1752147229;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrLdFDQuLoUIe/uEekZNEbX75EWId+qZvas9OC1Cbf8=;
        b=h6jXwe5HgkIsy8Gc70hxfOzkBo3LNYGMLd89Pc8CaqMynF2aJRf7MLY6UmCG0w6kU7
         o8Q5872YQ02dTkTbASUQ2kHAkslr1WaxmNITQxY2+5tdpD82LT+ncDfDfsQ9Jd4B8Rlw
         UK3er4jyBfHCzd43ymbZPx2n7MJgFzW1cYat8X3uIrYbpQeMYMDISE514awtX8G+iCX/
         6wUoEv2EC6LNLE4vP/u5WWN6Axu+ub3MMcjHIgKWFzgj1sVV8uXt/S1RrMXAGG9dAHYj
         la6leLswojqbjpbFjazxD3KbuXsQkzbU7pYwy0D5s36FsjtwnYATm6EWn4YdlixevzXd
         XMPw==
X-Forwarded-Encrypted: i=1; AJvYcCUaIauXFCMYGF9SOjlPX3RykzA4wxoyrttFtZELHbfKGZCOXlmJACAsxXLGQby7pGjdiAeeC7RoaPA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyAf66gTQVUdr8V+MiV+cZF5KdLVhCClYwesyc5azqZWHX9X/zG
	bEtf7oTTZCgGKe1gF+7vg3MOaN5IU/mdjkcew9QbbzaDHfAdmeOj+A8hxM+Ai59tmQ==
X-Gm-Gg: ASbGncv0sAnSJ/EUQLsySqpqemGoHIFfuLY+yUJZ0eS2CCCSfytEynHJvE95L0vLJTV
	f9sCbrQe7fIzJ+VVhZUVbkCztiJ7LUwc+L4oUOME64Knlck84VTs6q8OTJpaB5vbu1a46tS1viK
	+1OACCpxLaKmyrbnFXrJVUUMXEOG5zQ2iXDQi6RbC+vE1+bvDl3v5nFaZjVKvySR25mw90ztZRU
	SxfwLzTvyZirhEIQaX5vrdcMzvJwbRlr1o+KDq63UAuRiUqMSSwInH+FkHK6d/IrqMQdml3II6A
	/0QcyaUDPeC3ZbHj/0PTeR7fbR/Sg7fJ2AR58ijRQOmbVvKFTyBLZFsdJHgu0nDiV2+LxUazLmJ
	pd/2dgRfxNQagvrxMAAirJA77brbnJd14fW9W0BM+8tLO2Mk=
X-Google-Smtp-Source: AGHT+IE7GACWzVafEWoRRVyK7ixhFyFyQlmtH/QbiRqd4mrVxUC6s1iwbtgooOgk6r3BYufPIUV+hA==
X-Received: by 2002:a5d:5f94:0:b0:3a4:f50b:ca2 with SMTP id ffacd0b85a97d-3b1fd74c27dmr5018049f8f.8.1751542429375;
        Thu, 03 Jul 2025 04:33:49 -0700 (PDT)
Message-ID: <03f0a7eb-f541-4f2b-8b88-500fd483dd48@suse.com>
Date: Thu, 3 Jul 2025 13:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/17] xen/riscv: implement guest_physmap_add_entry()
 for mapping GFNs to MFNs
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <0b1f7ead7eb1b7c8687d388cca50b46eefb8e408.1749555949.git.oleksii.kurochko@gmail.com>
 <f1e26c40-c70d-4d86-96ec-7643a9d08e76@suse.com>
 <5fbe849c-3b8a-45dd-a217-c1dbf831da47@gmail.com>
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
In-Reply-To: <5fbe849c-3b8a-45dd-a217-c1dbf831da47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2025 13:02, Oleksii Kurochko wrote:
> On 6/30/25 5:59 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> +                              unsigned long nr, mfn_t mfn, p2m_type_t t)
>>> +{
>>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    int rc;
>>> +
>>> +    p2m_write_lock(p2m);
>>> +    rc = p2m_set_entry(p2m, start_gfn, nr, mfn, t, p2m->default_access);
>>> +    p2m_write_unlock(p2m);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +int map_regions_p2mt(struct domain *d,
>>> +                     gfn_t gfn,
>>> +                     unsigned long nr,
>>> +                     mfn_t mfn,
>>> +                     p2m_type_t p2mt)
>>> +{
>>> +    return p2m_insert_mapping(d, gfn, nr, mfn, p2mt);
>>> +}
>> What is this function doing here? The description says "for generic mapping
>> purposes", which really may mean anything. Plus, if and when you need it, it
>> wants to come with a name that fits with e.g. ...
> 
> These names are used across the common code and various architectures. Not all
> architectures need to implement all of these functions.
> I believe|guest_physmap_add_page()| (which internally calls|guest_physmap_add_entry()|)
> is needed to be implemented for all architectures, while|map_regions_p2mt()| is used
> by Arm and the common Dom0less-related code, and because of RISC-V is going to re-use
> common Dom0less code it is implementing this function too.

First, my comment was solely about this one function above. And then I didn't
even know Arm had such a function. It's not used from common code (except again
from dom0less code where it should have been better abstracted, imo). I'm also
not surprised I wasn't aware of it since, as can be implied from the above,
otherwise I would likely have complained about its name not fitting the general
scheme (which isn't all that good either).

>>> +int guest_physmap_add_entry(struct domain *d,
>>> +                            gfn_t gfn,
>>> +                            mfn_t mfn,
>>> +                            unsigned long page_order,
>>> +                            p2m_type_t t)
>> ... this one, to understand their relationship / difference.
> 
> Basically, the difference is only in API and where they are expected to be used:
> - guest_physmap_add_entry() to map and set a specific p2m type for a page.
> - map_regions_p2mt() to map a region (mostly MMIO) in the guest p2m with
>    a specific p2m type.

Sorry, from this description they still look basically identical to me. The
visible difference being that one takes a "nr" argument and the other a
"page_order" one. Which still makes them largely redundant, and which still
suggests that the earlier one's name doesn't really fit.

> I added both of them here as they are implemented in a similar way.
> I will re-word commit subject and message:
>    xen/riscv: implement functions to map memory in guest p2m
> 
>    Introduce guest_physmap_add_entry() to map a page and assign a specific
>    p2m type, and map_regions_p2mt() to map a region (typically MMIO) in
>    the guest p2m with a designated p2m type.

I.e., as per above, two functions for basically the same purpose.

Jan


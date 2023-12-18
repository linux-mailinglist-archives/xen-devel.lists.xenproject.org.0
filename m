Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9794816C1A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 12:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655873.1023731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBhy-0002vM-SI; Mon, 18 Dec 2023 11:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655873.1023731; Mon, 18 Dec 2023 11:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFBhy-0002sP-P8; Mon, 18 Dec 2023 11:22:50 +0000
Received: by outflank-mailman (input) for mailman id 655873;
 Mon, 18 Dec 2023 11:22:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFBhx-0002sJ-Ga
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 11:22:49 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5453ef8-9d97-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 12:22:47 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336668a5a8dso969400f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 03:22:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05600c154900b0040c4be1af17sm30131904wmg.21.2023.12.18.03.22.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 03:22:46 -0800 (PST)
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
X-Inumbo-ID: c5453ef8-9d97-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702898566; x=1703503366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nvMRlcz7eJggJ1c/5Xm+zAPmyx9D+E8+RX58+Cir7tc=;
        b=b7PQkhW8cGlxJIYlTIIrNQjjTbcKZ8b3KPaopc7vmhBwAi3KB2Y6W/XrQNGNeekzqp
         XYfHmP7iA8tYYAmhJdGt2dsFr7W5WuQgvq2Rd/f+UpoXwRN+QKWMz4/660t2roSRGheC
         HTFgkMNjV0MgsaioL650cHRlqLP7yLPQmt4y5wCgKJ/2nPltHFwdLKHAoF4ozgSlUCPk
         GKTdM4KSx3x3SkQvKJSMEXE7IdM2t4ee19ufoNJGtk65ams3CClYXR2bplFx2bRxh2fO
         cP1e2WHX2EkiLfJQ79pBDwPKnNYFKs3q0bXDHvajiCapf9vWFJdTRG17PZABOr4VF/Z5
         iffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702898566; x=1703503366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvMRlcz7eJggJ1c/5Xm+zAPmyx9D+E8+RX58+Cir7tc=;
        b=bEQG/xeyAMlcvdKRz/OVu4ptFCsKbw6TLu3vfWy1audMWga+R9+e0zerK3u10fy00M
         AMKnNHTGiSAmkoupCa84Tqb4wLbdc9yFIHgn/ebkrh5bb2NTdpCX6hqTL0ZtzVEG7Y/i
         YTRHHRF9ZljrtE9XyCb7dqutmklC81ezZbGksaYKeFbf9BxEgaKOOv1mab7+TA4pI8sN
         K4UADHe65eej8DfRC6hdnLypuSVvTBcfNKClLCk7udQVsa0x20k3QW4hgIBFmHmSq3YH
         7uEg/nmAyz1s0aNFQsytjv+zDy4BlXD3P/UNLhiraSVgEQS/LWOALQS5NSzn/CvZAqXU
         Ct6A==
X-Gm-Message-State: AOJu0YxDO7Z7nYe8rL/1EpujAO1OFmMwFV+1G93SgKF/1auLqvy85Mej
	eQsdTTokPDj5ORXNTL+2soJ5
X-Google-Smtp-Source: AGHT+IFAT5AyQY7EZPwPCfgaOFk9pJ/q8s55zYRJ2yoJ3b/0ze5uBqQySf4/Rg8GyksKYGLFS6gHmA==
X-Received: by 2002:a05:600c:22c2:b0:40c:2a2b:4ef with SMTP id 2-20020a05600c22c200b0040c2a2b04efmr9044275wmg.43.1702898566612;
        Mon, 18 Dec 2023 03:22:46 -0800 (PST)
Message-ID: <abacb997-99f4-49c3-b146-320cc9ff1a90@suse.com>
Date: Mon, 18 Dec 2023 12:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/39] xen/riscv: define an address of frame table
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <13ad41657814e4fc235772fa0928de1723ae7c3d.1700761381.git.oleksii.kurochko@gmail.com>
 <b2c42d56-6bc8-4ea8-9e6f-cae259c274c5@suse.com>
 <5d3e7f9ad7ff0eb779e269eee1c42300d987b5a1.camel@gmail.com>
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
In-Reply-To: <5d3e7f9ad7ff0eb779e269eee1c42300d987b5a1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2023 11:36, Oleksii wrote:
> On Thu, 2023-12-14 at 16:48 +0100, Jan Beulich wrote:
>> On 24.11.2023 11:30, Oleksii Kurochko wrote:
>>> +#define SLOTN_ENTRY_SIZE        SLOTN(1)
>>> +
>>>  #define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 -
>>> GB(1)) */
>>> +
>>> +#define FRAMETABLE_VIRT_START   SLOTN(196)
>>> +#define FRAMETABLE_SIZE         GB(3)
>>> +#define FRAMETABLE_NR           (FRAMETABLE_SIZE /
>>> sizeof(*frame_table))
>>> +#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START +
>>> FRAMETABLE_SIZE - 1)
>>> +
>>> +#define VMAP_VIRT_START         SLOTN(194)
>>> +#define VMAP_VIRT_SIZE          GB(1)
>>
>> May I suggest that you keep these blocks sorted by slot number? Or
>> wait,
>> the layout comment further up is also in decreasing order, so that's
>> fine here, but then can all of this please be moved next to the
>> comment
>> actually providing the necessary context (thus eliminating the need
>> for
>> new comments)?
> Sure, I'll put this part close to layout comment.
> 
>>  You'll then also notice that the generalization here
>> (keeping basically the same layout for e.g. SATP_MODE_SV48, just
>> shifted
>> by 9 bits) isn't in line with the comment there.
> Does it make sense to add another one table with updated addresses for
> SATP_MODE_SV48?

Well, especially if you mean to support that mode, its layout surely
wants writing down. I was hoping though that maybe you/we could get away
without multiple tables, but e.g. use one having multiple columns.

Jan

> Microchip has h/w which requires SATP_MODE_SV48 ( at least ), so I have
> a patch which introduces SATP_MODE_SV48 and I planned to update the
> layout table in this patch.





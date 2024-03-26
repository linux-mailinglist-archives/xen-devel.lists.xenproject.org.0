Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ACE88C8CA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 17:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698153.1089556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9Sq-0000lV-1C; Tue, 26 Mar 2024 16:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698153.1089556; Tue, 26 Mar 2024 16:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9Sp-0000ie-UY; Tue, 26 Mar 2024 16:15:51 +0000
Received: by outflank-mailman (input) for mailman id 698153;
 Tue, 26 Mar 2024 16:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp9So-0000iY-OQ
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 16:15:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1b8954c5-eb8c-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 17:15:48 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a470d7f77eeso727477166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 09:15:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jz7-20020a17090775e700b00a4576dd5a8csm4337546ejc.201.2024.03.26.09.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 09:15:47 -0700 (PDT)
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
X-Inumbo-ID: 1b8954c5-eb8c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711469748; x=1712074548; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+ZyQGRkIt39N2dsC/B303eMYpZ1hVmIdk9h9dCVJ6Y=;
        b=NQv9EjJb9rkGUHWKcpPiwTsm00oUqC1/LMa8BTxZ35XbTqFIKjYmu2rVp3VnbiobGT
         rnllEI9uqC4Xg+hQsr4disTIMItMyhr39RKK4hAyVAY9jtP+WtysiH+KBFzuZ1etIgzE
         YmjaF7yofdpae/5cfIQvf+RNei2K901Rh2Wxf1cd6k7jeB7MCHhp0CEiH6o4NNEVb3aD
         MmCZJtKyaTvofWEfcxDkRAL0VjvSWgmzn3CrPKFB+1IuGGQqK0OdS6IkN0GLEwW7bhLW
         611jokYdS1guhpbtz9xZ+xJ1wD/JEWw1Y5XKj0lbJiIY5BOa9fqfngZSphHjC+oXDRVy
         f6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711469748; x=1712074548;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+ZyQGRkIt39N2dsC/B303eMYpZ1hVmIdk9h9dCVJ6Y=;
        b=koxDoYztFESR7xWasUP56U7TpO9SDHr71QBP4Qpqr3G0YvcqSVzd2/ermE75P73Uqz
         JV6sPz61TeIxgdwK4CwIIKMX+LcngAgxkScCTnuLvg3cFOfTnt315F4EkYBCYDAJbwYY
         kNJGYYCK5DvwPDehp4DGRF0Csx9tDCh96+cNfZIjcZc1l7Pdz7MY0SmyMBXNxC8Ndvka
         SsqalycdThmdgtGffdBR8H6vakwSptqdXRlFYerY0lN8XB0lSIaBCJfWagUtSf2mC8aO
         VA1nRWqwKhm3hh+8gt1G9rJUqxur8V29TXtHl4Hoj4Z+vETh6dGNd7zcQMth2rcHyoxS
         p+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhOCOIwayj7rvcfmr7VTyXDucAoYQ8W/zl51FAnqscC3lJzIlNhkj6sy4ZuQIlIPynfg+W5lsltIW8A+fhhG7FXgh3aPJyCAHjX6Sl8oI=
X-Gm-Message-State: AOJu0Yw6CRLcxwJ7FdA8MKYPCHGBhP1FSatRjJQNDBSoWVh8U5x5Uh0E
	SseipMlnJ1J7fKZ5NVibImdWJPA62hWyW9OZG3KRs3I9AvaFQzZUSYG53Zl4/A==
X-Google-Smtp-Source: AGHT+IEaml6U7roUYh/oEp7Irl+QQ4sKfzv34MuilTLID+uZ0ypTt6JsLqxl13pa3KYGOsrohsZOmA==
X-Received: by 2002:a17:906:4541:b0:a46:cf63:d96b with SMTP id s1-20020a170906454100b00a46cf63d96bmr7855037ejq.51.1711469748144;
        Tue, 26 Mar 2024 09:15:48 -0700 (PDT)
Message-ID: <b178ffdf-cbd1-45fe-a271-1fa09f40606e@suse.com>
Date: Tue, 26 Mar 2024 17:15:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] tools: add x2APIC entries in MADT based on APIC ID
Content-Language: en-US
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cd1a3ce14790af8c1bb4372ef0be5a6cbbb50b1c.1710338145.git.matthew.barnes@cloud.com>
 <32a4de1e-94fe-4b44-b95c-55cd1ec7e7e4@suse.com>
 <sjkt43mvc7mpqqbqi3yky5eouf6lk3cuiksskvrnoo7hyq7gfp@7lfnxlbpvuef>
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
In-Reply-To: <sjkt43mvc7mpqqbqi3yky5eouf6lk3cuiksskvrnoo7hyq7gfp@7lfnxlbpvuef>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.03.2024 16:57, Matthew Barnes wrote:
>>> This patch scans each APIC ID before constructing the MADT, and uses the
>>> x2APIC entry for each vCPU whose APIC ID exceeds the size limit imposed
>>> by regular APIC entries.
>>
>> It is my understanding that if you use any x2APIC entry, every CPU needs
>> to have one.
> 
> In the ACPI 6.4 specification, section 5.2.12.12, the note says the following:
> 
> [Compatibility note] On some legacy OSes, Logical processors with APIC ID
> values less than 255 (whether in XAPIC or X2APIC mode) must use the Processor
> Local APIC structure to convey their APIC information to OSPM, and those
> processors must be declared in the DSDT using the Processor() keyword.
> 
> Therefore, even in X2APIC mode, it's better to represent processors with APIC
> ID values less than 255 with APIC entries for legacy reasons.

Well, my reading of that is different: All CPUs need to have x2APIC entries
if one has, and CPUs with small enough APIC IDs _additionally_ need xAPIC
entries. That's what I've been observing on real hardware, too.

Jan


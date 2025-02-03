Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A6A254AD
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 09:43:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880482.1290558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tes2k-0000qN-Gd; Mon, 03 Feb 2025 08:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880482.1290558; Mon, 03 Feb 2025 08:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tes2k-0000nn-D1; Mon, 03 Feb 2025 08:42:58 +0000
Received: by outflank-mailman (input) for mailman id 880482;
 Mon, 03 Feb 2025 08:42:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tes2j-0000nf-Lv
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 08:42:57 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcf0e1d9-e20a-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 09:42:55 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab737e5674bso42817666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 00:42:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47cfba6sm728180066b.57.2025.02.03.00.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 00:42:54 -0800 (PST)
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
X-Inumbo-ID: dcf0e1d9-e20a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738572175; x=1739176975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q60j7fz0xvipliptJDdzr4NVAzmiN9CQ5GCdAx1XQSk=;
        b=J3WoLg3LY7Koi5Jdij2PLyx79HDYRPzYUEAnwNDt5FkZrk0Q2d09/qHazVzZXJ8uAD
         V9gFY3zBfiFL3I+H/Y0TS8JRsfiXpMFfRXaErl/Z/zZLkcCNRlRDgmjozZYmXmIDdvF5
         i3mzuUCJvAlsrnQQskHG2HOKNTBz/CfxFU6CkpI8mnuPvn04qM47ok157dke/7dxwgT4
         kzuBnlf7l4+ae7TFeREuKxluZpo3eoAmNfadJHKtHrRMYUHJPSbY1rsDxTqranLYcC06
         3PCAhZuZMmO0H85nSQ2558gi5qbt8iecoEc5LikljhNjAPf6SDcB50O9Ts/ngm/FVotc
         ErZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738572175; x=1739176975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q60j7fz0xvipliptJDdzr4NVAzmiN9CQ5GCdAx1XQSk=;
        b=OG1rghbMBxRLHSImaoWLr/pJjx+2V5v96VTX5U1Foyb1ILZn3tLDT1S1hf6DKXC0TN
         4nnf9Hp8iNHIu2ayu0sfmof2guSWFu5ixH+watt1PapwU+R+fV6RgFDSySwjcP+PyBR5
         d6vl1zoDRJ5W9BwyKgA5cEtLbIWVpMZDdt3xFN656TrFmwcbdytgB30jENSQRHOJDD5G
         RfT2jm7vaSEJuqRhHCS/iA6eHobzbFOI7LwrkehsE9uHjsmVOzG0Uo8d+g3+cnobmxAp
         bNEZZXvRWQp9RtabTFaTHwqKD9PhBo9sIIFpq7GBjgYHBQS+PUbKmucqemxE8ATx2Lih
         lEqg==
X-Forwarded-Encrypted: i=1; AJvYcCWh6JP9wpvnsdU0fBZaQiniLNzpkhXhize1GuqcxiiBk1xln3ymsE0vgtneXw6YW8zQBR0IQ+xWg0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZqBUXqPMRt6kdEEd5+kY9+CLX8vZzDCDt0qRzrU72h7RbA3bu
	TCgDQR1iZLNkNBPJNJIG/+ANcEwp0Z86cApoYp5eC6zLLdaWkHfHnhbuyVC7jQ==
X-Gm-Gg: ASbGncuaHgLQ6dwzNYGYbGG6TEEY6rlv/OKCO1ktuT7FqaY7jLvnA5Di7natH9aXhxj
	33pH4PXQg6Lm7Kqn3eN3syC3Ue6v4ZsrOpfcvPB0fNBje8vl9h4KETsFpqDQPPy61CQXLrTUr22
	Y1GlT4TwdYwtJmeAcmul42eQrVtB4sDwveDLbQ9tDctdqnY/ld9AUj1WHvXmmUmIMK8efqX7djE
	aFuX3IC8v/+NadU83AauNOnqNOZBKbL7Zp4r0Q2tuv2JSRl5SmjgPDOE2oUuE+4Wm+V2O/i04o2
	DMc6Vy6ZydwW9fjoEjyRHpIyPlHRanre5IJrL+wbJbueHTqoXXsburwQwVv2pQ7u32KATzsoUvf
	O
X-Google-Smtp-Source: AGHT+IH6oZ4KbRC4p38bN41WA8o8Ho+O6+q4B5nkS6k4rCAI8LtmNhTMYfIboWcRCp+5FYuZbF82Hw==
X-Received: by 2002:a17:907:60d6:b0:ab6:d819:feb9 with SMTP id a640c23a62f3a-ab6d81a03c6mr2155365366b.26.1738572175245;
        Mon, 03 Feb 2025 00:42:55 -0800 (PST)
Message-ID: <1b23820f-2778-4219-b8f3-278da7a42b41@suse.com>
Date: Mon, 3 Feb 2025 09:42:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] x86/msi: Change __msi_set_enable() to take
 pci_sbdf_t
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250202134840.40102-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250202134840.40102-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2025 14:48, Andrew Cooper wrote:
> This removes the unnecessary work of splitting a 32-bit number across
> 4 registers, and recombining later.  Bloat-o-meter reports:
> 
>   add/remove: 0/0 grow/shrink: 0/9 up/down: 0/-295 (-295)
>   Function                                     old     new   delta
>   enable_iommu                                1748    1732     -16
>   iommu_msi_unmask                              98      81     -17
>   iommu_msi_mask                               100      83     -17
>   disable_iommu                                286     269     -17
>   __msi_set_enable                              81      50     -31
>   __pci_disable_msi                            178     146     -32
>   pci_cleanup_msi                              268     229     -39
>   pci_enable_msi                              1063    1019     -44
>   pci_restore_msi_state                       1116    1034     -82
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I was actually thinking to do the same. And we have more of such conversions
to be done.

Jan


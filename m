Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEACA0223A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865615.1276861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjmW-0004Kq-VT; Mon, 06 Jan 2025 09:52:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865615.1276861; Mon, 06 Jan 2025 09:52:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjmW-0004IW-Sn; Mon, 06 Jan 2025 09:52:20 +0000
Received: by outflank-mailman (input) for mailman id 865615;
 Mon, 06 Jan 2025 09:52:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUjmV-0004IO-Px
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:52:19 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea2ee72b-cc13-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 10:52:17 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43634b570c1so101289935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:52:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea3d5sm568174355e9.5.2025.01.06.01.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:52:16 -0800 (PST)
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
X-Inumbo-ID: ea2ee72b-cc13-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736157137; x=1736761937; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CqQDs2dvlWLyQTrS9K1D1IjW7NfezeJIlWnG4VSQiQI=;
        b=RoRpM63ArSubnEWidRk9RtcbRgPStJUN4KIHOyIt1b68hEDDoS5k96U88iE8DSibC6
         ZvX2vTpGc4VRCJztV3Dbb/0kOjaofDyeJKQcgbrpUwv37j6Bo4jwnYPHc/QOZ/magXDg
         gjUA5e7LfKY286kPAlBb1LJCOcILfegFwWQg9oxvrdafyz+gb3BMQAG/ikjKi8YxHMid
         Ul+4syqRDuAvteK9cR3XDL6WW1S5iowfA1+pdjpTutr4+unKEszfOykIKL7RCl4pi+uS
         jNWV/FumNTL1sdgd4qBCTByXX6tnapClOP+DgOdMExB6qu5/LTIgqUnYH2thCyezVbIw
         RtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157137; x=1736761937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqQDs2dvlWLyQTrS9K1D1IjW7NfezeJIlWnG4VSQiQI=;
        b=SvA+BxOu550xJltzmASAXzzmywroQP51cUPpojWJ4oqBSt/q8qerIQ0veyab5JqaQS
         z8ZwlqhBQf/T+T1KXzL9Twt2QXJIC+kcBxmGxO5ZwxM7v1xbDPFPePe1oOBWEQHuVL5/
         RQCzAjdi/L+4I15g1MSym7Th267eAYIuU4a6gKMm4cDtdkhIf39f6WJiTpeM+TTaMFcF
         615v492quj+ZQT8uhLoGs9u/aceHfl+o7IO6gWad8HTeApDorfg8rV525FxQLhBLbghf
         579UQLlW+upmEEKrY2PYUT/JADLacynIrloHVOSSgQ5FwBJGRS0U18TIvFsWepRzMHfJ
         Ei7w==
X-Gm-Message-State: AOJu0YwrbpfQ/5Bm8Jde4OaH05jkzeNZnfP/RFBz3NkcPj0GQ9vOWf8i
	7UR7PJBkVM79QJC3kMWCuhXmTg4KM46BM5cBKG8zFEbFFJhvD6FQE2uEj53anw==
X-Gm-Gg: ASbGncvgF3XgGsQwJOaV9UVzVkiPgES4HvSfDvvt/OpSuy5yt8YCm+Usl3ccaeSjxDA
	rtJZIrdNlBDwEcXsv7TY8urEiXBgiJfHBcbUg9ckUSVjbCn8NkPMQX1R41AzoXxmKCL0zxMrcj+
	w+Y9AWECsUQVsl1RsklIuJIEhn5BTDc2soZg2btnCDzgIHNAwBOSAIfZV2Y8FKsJxSoEZpBR/oI
	Jdi8H2ZM2z/LCg8Jv/Hq5OqX4BG8Iv/yzDcB8WCOL8Salc0mR37PSDl851aHZ393YH3D84PahFz
	6ZUK+9X8fKYgNXQ0coPIP9ELXSi1Z/p4aexoSMIvfQ==
X-Google-Smtp-Source: AGHT+IGn42AMHI+smmC9KNk473yZgcZmbQlZKy2/GG1YCkYA6Hcwyxru8AU++K3zMLKcFuNa/RA0oQ==
X-Received: by 2002:a05:600c:6b09:b0:434:eb86:aeca with SMTP id 5b1f17b1804b1-43675cb208bmr553078535e9.10.1736157137316;
        Mon, 06 Jan 2025 01:52:17 -0800 (PST)
Message-ID: <ed73733f-d667-45e3-84cb-dd3527156923@suse.com>
Date: Mon, 6 Jan 2025 10:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] ioreq: allow arch_vcpu_ioreq_completion() to
 signal an error
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241220093514.3094521-1-Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2501021136490.16425@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2501021136490.16425@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 20:36, Stefano Stabellini wrote:
> On Fri, 20 Dec 2024, Sergiy Kibrik wrote:
>> Return false from arch_vcpu_ioreq_completion() when completion is not handled.
>> According to coding-best-practices.pandoc an error should be propagated to
>> caller, if caller is expecting to handle it, which seems to the case for
>> callers of arch_vcpu_ioreq_completion().
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>




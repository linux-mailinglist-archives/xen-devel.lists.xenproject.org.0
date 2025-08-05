Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0581B1AFE7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 09:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070077.1433729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCYA-0004RG-2A; Tue, 05 Aug 2025 07:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070077.1433729; Tue, 05 Aug 2025 07:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujCY9-0004Po-VQ; Tue, 05 Aug 2025 07:57:33 +0000
Received: by outflank-mailman (input) for mailman id 1070077;
 Tue, 05 Aug 2025 07:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCY8-0004Pi-Ci
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 07:57:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5fd0685-71d1-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 09:57:30 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6156a162537so8444369a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 00:57:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a9113e40sm7965723a12.57.2025.08.05.00.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 00:57:29 -0700 (PDT)
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
X-Inumbo-ID: d5fd0685-71d1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754380650; x=1754985450; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K4ava1rDLI3wPKtFeUdT8w1Gn3fes96YdVTkhImFi2s=;
        b=XzXNp/bCJpNU1vyBOjtK2mV7VrjYMgi8HihN4aHTrI1CtaSsEMxv0Ml6GRijcz9akP
         WquW7JE2jpmF/g5YxadwhMtPtNCP/HiN45zRgXiAJkbYTLrnNs0A2C2IUb5d3vMscOGt
         2ZPvzgLcRgx4+30ppLlcJK7b/TQKGzsXzT0QqqxRSndr6nQfOiZHiJyCHPpYDEjPrZwl
         l7eRfE3rfpY27MHox3bfQtVOUgtmCA80fzGPak1ZzCva+IhRN84i7ovHHmxd0wfpTObd
         Klu4sKoIBENMemBdTmEzhm0j4VF4cPY4pmc/VvHDMus3LylJuSOnNXqf51qM17TRQdNj
         UEgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754380650; x=1754985450;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4ava1rDLI3wPKtFeUdT8w1Gn3fes96YdVTkhImFi2s=;
        b=dmEIuKLbC9csemRhB3shVfbCGyFq9jcWp8F4mYj3X6ldktykqqmk96hmJ21HGo7xsh
         +yF9iRadlaZlzshRsMmHe/r1oZKv6iwe9oFoIofsU21+LywsFVeQgv54hQO7lbKEUnK4
         Dv5JyVzJfOnq1MYZxxHX7Lc+7N7KZ+SJXImD989DEhwIPlxHXUzaDt3Bnf0DzmeXy5OB
         JAJ58OeRw5bCvippuCGWVPZMtDKmp6FfPRReCVh4VJgTEi6EeAym+Ig1GLAQx/g6rSeJ
         iuNHshfD2o3XjBejEeV9X8r6uUUV5JDLyd9gblC9Ps2m1PzasGPyCrLN3A85HcJk7IWO
         OURg==
X-Gm-Message-State: AOJu0Yyg1QU+vqJfYlMOyO56Zn3QaZuS4q8PynshMcHJQwUr2ijXh9nA
	qZcDEJd2INYCY/DUla93GEFbuB/s52Uz7IyNCCr0xPKju9epcsoETZ021Z0UqAtvUTiRJymHH2O
	4D+Y=
X-Gm-Gg: ASbGncsowLKtVkBYyV4AVCx6DsuEgPT38IWEn2A+Dq0t+7wXLBCmJytLBloR5CsGznu
	noJLmJvn0OV+R01V2yldgwdNbKtgH/VQ0d4SpHC281+xLbRepE6NfL2MP0FU9qUM3+1YS9ZC9TK
	3fh/5e2yQ65PriyiCEhUxY1ixU5xOs6JgGeyCWaW8aqWgz2kupcQ1vqSCAC9+F+uYIUSYySpjM3
	fYKIIHOtAF52Fztnc+Wihb3q7YrmYON05xb5/7kZYx33Fl/QZeJRtPbJUJltL2OWuGm1cCeRdVf
	V2dlRfl0cWYQW7nYELoIQTD/xyRmmZ6ym4iI2Ijq4dvxyWH6gT/AhTwq3tr9f/4mvkpJSP6zGgm
	pPxdTSncP5iLre1FVoKzKe+syOxTxvKilKLsBG3w4ZMAfEGB19SBby5FqXr2PxLuZl42/POtgbM
	bm2hPt7Iw=
X-Google-Smtp-Source: AGHT+IETUpDWfhzD6Q1fEYPQ9DOC9HoQk0MxtMzMFCXB/JtsqlW7oUgtpDllk1q2rtuTuUUSgsKIcA==
X-Received: by 2002:a05:6402:90c:b0:615:6fae:d766 with SMTP id 4fb4d7f45d1cf-615e73889a3mr10787302a12.26.1754380649593;
        Tue, 05 Aug 2025 00:57:29 -0700 (PDT)
Message-ID: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
Date: Tue, 5 Aug 2025 09:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86/mm: paging build adjustments
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is in the hope that it'll lead to a better overall result than plainly
taking [1] and [2] (or whichever re-work thereof).

1: drop paging_get_mode()
2: correct PG_log_dirty definition

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2025-08/msg00050.html
[2] https://lists.xen.org/archives/html/xen-devel/2025-08/msg00051.html


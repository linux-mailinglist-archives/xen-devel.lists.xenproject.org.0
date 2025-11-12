Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A90BC5119D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 09:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159571.1487887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ6Cb-0000Bm-T6; Wed, 12 Nov 2025 08:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159571.1487887; Wed, 12 Nov 2025 08:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ6Cb-0000AI-QO; Wed, 12 Nov 2025 08:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1159571;
 Wed, 12 Nov 2025 08:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ6Ca-0000A5-9p
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 08:27:40 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dab258e-bfa1-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 09:27:30 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b72dc0c15abso102965666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 00:27:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf312e51sm1527746566b.17.2025.11.12.00.27.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 00:27:28 -0800 (PST)
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
X-Inumbo-ID: 6dab258e-bfa1-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762936049; x=1763540849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ErIjk5sD3Fk+4HUkoRVoPmVJ/0fKHfi245lzKleiq6s=;
        b=H214hB3Or2YS9uU+kyIDh8DLl1Pkh0sh9VplLYdDL29/2D5aOYOH4fXVK4ttFKEIhi
         r0vuHg44pBSUn15pPeVkocyW0RhPujHJqCa29VBFIy63u/u9mfmcj6tLkUgP54eF4T5R
         efQlcte8kkqio/RLG7lCIaKm14ohtwVsODJ7sKvrf2bkgZPH3YMgoxwoVYRq9Xs7jBxN
         og0BJxdiW3ZQqcKb9u/xBsvWw3mCE75fy/razngB+fXdkGQq71xddIIyt01lq1RJdPR0
         kEKWQ6G557qK8jsddDnz5hh1n81ZHH+qt/iTQKTMN8QOx6oetQF16eq9EqDIgWXR631e
         bgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762936049; x=1763540849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErIjk5sD3Fk+4HUkoRVoPmVJ/0fKHfi245lzKleiq6s=;
        b=wnKUsFCqWLTo/bsynKjXlHxpjo7y5VkjwN+QfgpbXQuPd1aj/pFu65uRRxFjJR7wCB
         xDeKN9pTh8s8uWct54Tidn4jLUIw37qZBzYDvNyj8r7dn09ksS+1zvffRUTyzlTech8n
         kLNFFc8x3Vjx3fChO5n/emLQ4Wvx0lRPA5l8+i1uWEUYOESkmqZhpg+4+0bykgkVDytj
         Bt0NJNKWwgsUZzzdyXXPqNRd4MddIhM6Eqn0DHWYeZRqZE1KkhWNuEg+7acJbZR/dT9b
         OU6a94V4AaLqTAXiJq9cSkoNrH1RCGZrcGOpZSvZRVAIMxdzDxAVkZVjH7TltGVppuUQ
         qmzQ==
X-Gm-Message-State: AOJu0Ywab+7LFIVxBKb/Bou0OJoekrpacj4GHZkyiZFy72T6VdnJbov7
	R4xyYaRmHGO5VWjGt7G/1OQXK0YoqfU6XCYFpeVAOtjsebujVdEbYrK5A7YfJTLlRw==
X-Gm-Gg: ASbGncuc+6gVHZY6pwrvSNN6nlKULI7mVwr/kTaU0OEVd/E1NT2KZUyR5+OSPPadPjY
	qg+c3m4Jt01exl3eGjIY5yDsn2i/DTponwOE8E+PUoI8wjRXe3mN/LBfZc7ypU0hfgnI7VCjPoC
	qJ7V9FH4XItqrjLPGr9XQOB2i/AYosdi0ZRQ7oc+zrXnUT0SOQglTumV2NmyBsWHo54wsY5168Q
	np8gOV5tcGy9u9h5nFI2LLZcyzjoqU3BpUUPIeP+Fr1Gkqitc6SLmgGgiKlvD5QJbca1Ob0dzG1
	ezdzsPq1jAd/WxIl9mXdh9ldH2n2Aw5tDXDNngo3CcgBBN9eS13K2aX4vV3/xUixMrZHNiu2b8U
	K6g4naVRSZFuVaaAxnpFAuPW3ltoNQEfSuZyYduu7/S1bAZvxPd3tEtuS/C6LK7ZMJ3kflzhaeT
	ag2iXwnMZ+gUGqPKZ4eUim2mFVZu3zQut69PpcLxQ4zQSNP5XlQOto4HGTFv82hFh8
X-Google-Smtp-Source: AGHT+IE+DHPujMiPERj3Dercvc335FYDylK9IBqSoL7oX245m+YdZxxDWH8T4NzSoHEL/kDXLCAn1Q==
X-Received: by 2002:a17:907:3f0b:b0:b73:2df0:9fa9 with SMTP id a640c23a62f3a-b7331aec6fcmr185215866b.59.1762936049392;
        Wed, 12 Nov 2025 00:27:29 -0800 (PST)
Message-ID: <105ce473-93e9-4ccb-9cb9-938cd5fd3f29@suse.com>
Date: Wed, 12 Nov 2025 09:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Use FDT_MAGIC from libfdt instead of local macro
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <464fb509cc7f66934689d9e2d3a77bf5fcd45c24.1762931200.git.dmytro_prokopchuk1@epam.com>
 <80431F4E-4512-478F-94B0-1CDDC5E8B6E7@arm.com>
 <e91c18fe-37f0-4890-a8c0-96ec73470b88@amd.com>
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
In-Reply-To: <e91c18fe-37f0-4890-a8c0-96ec73470b88@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.11.2025 09:15, Orzel, Michal wrote:
> On 12/11/2025 08:47, Luca Fancellu wrote:
>>> On 12 Nov 2025, at 07:08, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com> wrote:
>>>
>>> Remove the redundant local 'DTB_MAGIC' definition and replace its usage
>>> with the canonical 'FDT_MAGIC' from 'libfdt'.
>>>
>>> Fixes: 66edeb2e3972 (arm: copy DTB appended to zImage)
> NIT: Fixes is for bugs. Redundant macro is not a bug I believe.

Maybe use the relatively new Amends: here instead?

Jan


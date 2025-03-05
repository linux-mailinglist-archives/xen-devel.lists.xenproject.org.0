Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A3A4F909
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 09:42:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901827.1309750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkK6-0006Rg-MJ; Wed, 05 Mar 2025 08:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901827.1309750; Wed, 05 Mar 2025 08:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkK6-0006PQ-IR; Wed, 05 Mar 2025 08:41:50 +0000
Received: by outflank-mailman (input) for mailman id 901827;
 Wed, 05 Mar 2025 08:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpkK4-0006PI-F3
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 08:41:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab0ce087-f99d-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 09:41:44 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a823036so60078015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 00:41:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4847fe5sm20375514f8f.73.2025.03.05.00.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 00:41:44 -0800 (PST)
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
X-Inumbo-ID: ab0ce087-f99d-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741164104; x=1741768904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yDWs1UTFyC+Wf0en78h2H/qdHkMXDAfjuJI/8LgEmJg=;
        b=AdS+vzzfiKCJe46b7+J00hYfPzgfCWIf8yt+e6wvz0aGDnRaVhA73oaiSqyqc1PtSt
         xhotdNQLdsVXsymOQRbrD4mAoDhUCEzyPO8pgTYIA73mYkqAEK4sJcm/kG6DRu2Zfc4V
         NrmCtPeW3dTRK1ZgYJnqYxA6irKVbM+WyPQTsZb23jzF2D5eqsl3QgJaYwc5GkihEPvd
         BmRE02lbUU8gNkPGgen2D66qEdnhsUh7evsv2oWBqiZW9j9GFyycdl1Wk4Hb1ugsKbcw
         PC5X9n1539jil7xvFjbxy0z+IsjmMPZn/u/qG6fkjEfu7zvE5N3p+EWwPfIzYxMyb/Ht
         d/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164104; x=1741768904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDWs1UTFyC+Wf0en78h2H/qdHkMXDAfjuJI/8LgEmJg=;
        b=c22DxNl3pXsmzXTkgCaKQnM0tCy9mswwgGTgUzA4DI7/hNyQNr2oInIc4DTK/yC1Jd
         6RD/9q6MLigayRPKaZ05bJLb/kcjOTKEsEMkLPEzd47pBtCmNrzE8ZpJucLNtBg+q4Kq
         k095xQEkkirNBeRiEtufPwtK+jimWjGPOx5I0CTzYcrN9evnh3kjyJ7Xz7VMk5VDQdJx
         FNO/lWDbSlSz8dmj9fH+EZnkRLcfj3xjxDfr8daxoSCruhzedscXUAHNZjHs8nhUxEnm
         aUPKQNjSGjZwFeA6FmX5/MTDs2K3dbcZyIHEFWBDDEIksmMjVYrzR9XfdkScGogiM4yc
         eEnA==
X-Gm-Message-State: AOJu0YxD2ais7KHSwSCfYpyHNnFhiKWCMPR/OmIvof6qDif2r5Z5rEcZ
	V5IP53X1if76kEecJobAlqTTtEwXNZfBHxuZnM+6OqhAxN18lmOXSMkibAnN/A==
X-Gm-Gg: ASbGnctFz7X8psgzKIQmjLmFQHRi2ZhcyP9rKNC4W3OcvPd6/JV5F9ymcwXbBDazXgk
	m52AfCGwAKCm6r2rejkOKvu/bSs7Vi3Z7OJZOjagBtQ8BfRFHAdgj1HMO0zNdMf0ejRDtMb8OSW
	Dd2ZToF8UnnIbz0AvXDP2pxD6IG019F/VSnbX4pZoIG8oh96O3jzPh30pJVzXAO3jbv36/CQ+O/
	5KaYDI+5Ju/58GvG32NV9uS3gYVtEBWIQHVXV8Pg+1w0cAH/aBjb7ZmP2efSmGk1N59GCTwT2m6
	exox12Kryasw/mmocpcfT5pMgGu8ewzekD7ywNT5OPGDoajudfjNMNlFMj+h6/iCrW0dtlICLMn
	RUuJ0sD27/G51+PSxfO72KXNoqay3nw==
X-Google-Smtp-Source: AGHT+IHvyjxfVptiOhGT22iafsUH2yzXXsThbaCIjRWgQsz7Eu0gw1Z9gpyI+O+eF4ye81/qkVDIEQ==
X-Received: by 2002:a05:6000:401f:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-3911f73598bmr1403261f8f.19.1741164104279;
        Wed, 05 Mar 2025 00:41:44 -0800 (PST)
Message-ID: <79a408b0-c5f4-41cb-b206-f1e16e4237ef@suse.com>
Date: Wed, 5 Mar 2025 09:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
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
In-Reply-To: <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.02.2025 19:28, Jason Andryuk wrote:
> On 2025-02-27 05:23, Roger Pau Monné wrote:
>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>> All this work on AMD because when interrupt remapping is enabled all
>> MSIs are handled by the remapping table, while on Intel there's still
>> a bit in the MSI address field to signal whether the MSI is using a
>> remapping entry, or is using the "compatibility" format (iow: no
>> remapping).
> 
> So, on Intel, if the guest hands the device the MSI address, it can 
> decided to bypass remapping?

While the answer is "yes" here, the result - aiui - would be an insecure
configuration. So you can only do this for fully trusted domains.

Jan


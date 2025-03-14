Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37459A60FA9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914372.1320141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2w3-00010U-2K; Fri, 14 Mar 2025 11:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914372.1320141; Fri, 14 Mar 2025 11:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2w2-0000yj-Vb; Fri, 14 Mar 2025 11:10:38 +0000
Received: by outflank-mailman (input) for mailman id 914372;
 Fri, 14 Mar 2025 11:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt2w2-0000yd-0s
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:10:38 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3b870eb-00c4-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 12:10:35 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1261336f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:10:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d2010e2d6sm13690915e9.38.2025.03.14.04.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:10:34 -0700 (PDT)
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
X-Inumbo-ID: f3b870eb-00c4-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741950634; x=1742555434; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0rU5KTOqljvILgRsdxHapLxuCD5rRAyKlwdjCWfZJps=;
        b=QCtjBLrYyn5m3VLGTVySGpLPO3j5p+Wqv7BdzLcYxi0j+qWi1xEFYRvDCY9qa9myqe
         ZcLoNI+erHOprCGUSessIAd7utMg3tnOCq7tVXoIILgPL5sZSVDlJ0KNqItcp5aRL/ZB
         +QRZvj9azGRHQAqKyK3YhWeb07UXm3J1cjg9gHzgqeAYD5v6PJ9zpH0oOtT+CUzyAxo5
         kzf2X0fRJ9pP8x9JLXbzcTEpAR/Ur63X8hocH7fMkARJuiU1WG5KxJQ1KPK5RD8XuTfI
         DFHOZEGYdsZWpje2NTWYhcgB7NhJB+aWRZLkTH2ZvTlb+E0kA2UXiQ4FHEgqXIzokgR9
         /I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950634; x=1742555434;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rU5KTOqljvILgRsdxHapLxuCD5rRAyKlwdjCWfZJps=;
        b=bYNcb8uKZBT57HgJVptUJ8ADIecAcMNMUq4lkCa/xR1e7TMLfjxnBuWAy2DitbtAHq
         Tk6hQ1OU+5028O7RLDxAByKmiZtK5ZFpCwUjuDyqK+nbKGLDQ9Hi0knG4YnJE8nrvnL7
         DtbT8Gf+CnL1Dv2nJp2sxMG1a+M0JyYhmMCK37IeUY8eNMwqgR0AaWP497cbFb87oaNp
         MgTLxxUpDeG9SHOGEgGM86q79i89stnhgje5Wt6z24e7SoSw2u7jGLflpxqhTGuAIGwd
         TUtoxUgxr8YNxAcK7So1ZWg7dn6L6uvirUdw7N+tSZju5doog4Iw5hvjbhMajf0Zo5A/
         ticg==
X-Forwarded-Encrypted: i=1; AJvYcCUCtKLZfVeFoI51FrlCrdKHUJzIjZkJ75GbvcbbxBo8idwcWLFT/CEzN1P1kFetZ4jDgwYvV+1tq+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywpwl7n3KuAQzdcUsE5j4e9Ol5ttwkpZlf4B1R+eDgziBQD83YL
	uEJBjz+AYoGbsXSK+tvatuiU6vHXXut0ot9R+RIfptKTIXtKmLO1VHcAnSN03w==
X-Gm-Gg: ASbGncvOoeIf7FQc3UVI3cJBSsjrHCtBpA8+t+SeWDi6F6aUuCjUVp/2pQAB5vi6L/A
	8CxNhOuo9KEjyou0lhUTzPo5Cmvs3c27Dlo1w44Jt22MMbfblw3BRtD5+H57KAapoauSXrCi+WM
	xMOZ43xm3lmL6/jfaObz2Wzo8z60eve1EyD1wPcW4n6VR0ZXDnvqE7/v8Yq9gi0oJ8pasKFA8KU
	952vaWcANGzZMwzpmP02+CHwfmhHZZFJ4jv6Ak7NTFh2NhJPnVivDAJ0jclIl6f6tpK9XxnSkYr
	mvdSjhXwCtliE8qe3mvdtSoA0r3yFNRJToAqDmH4BBy4CMvHcIJdnftffycv/W5nKuYO8onGLpJ
	rilugHWFCYoI59YkxROeTJqqUWTyIrX52qXzIC+cW
X-Google-Smtp-Source: AGHT+IF7mvThjd1vDNmAwXnnDsIt6qr/FQo/5NwIxOxNp6xBEyzCdC0I/OdQwLRxSo1aa/Gj/lGQOg==
X-Received: by 2002:a05:6000:144f:b0:391:2391:2f79 with SMTP id ffacd0b85a97d-3971f607c7bmr2187993f8f.43.1741950634606;
        Fri, 14 Mar 2025 04:10:34 -0700 (PDT)
Message-ID: <ff416199-c88c-465f-ad6b-64273e86c2fe@suse.com>
Date: Fri, 14 Mar 2025 12:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
 <61028e3f2ae363b8224ed7c7c48e86dddfe27fa1.1741772330.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <61028e3f2ae363b8224ed7c7c48e86dddfe27fa1.1741772330.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 06:25, Sergiy Kibrik wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Extend coverage of CONFIG_VM_EVENT option and make the build of VM events
> and monitoring support optional. Also make MEM_PAGING option depend on VM_EVENT
> to document that mem_paging is relying on vm_event.
> This is to reduce code size on Arm when this option isn't enabled.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB25880118
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695461.1085241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbig-0005nL-Ca; Tue, 19 Mar 2024 15:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695461.1085241; Tue, 19 Mar 2024 15:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbig-0005kD-9S; Tue, 19 Mar 2024 15:49:42 +0000
Received: by outflank-mailman (input) for mailman id 695461;
 Tue, 19 Mar 2024 15:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbif-0005k7-6K
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:49:41 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4be009b2-e608-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:49:40 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d41d1bedc9so100718831fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:49:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i22-20020a17090671d600b00a46d58fbc11sm1311805ejk.118.2024.03.19.08.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:49:39 -0700 (PDT)
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
X-Inumbo-ID: 4be009b2-e608-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710863380; x=1711468180; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Hjek9M5u6PXnQB/xTWo90Ep+NkhvngSyuPpPAmfQA=;
        b=P7fM/Yk2dnHj6h5dIZUCLRpQAdCTH4/EcVSrVrP4bVdGkFSWiB0QmpAUS/kp9QT28S
         BlxtdNXyITKBbp3iC6JyDuEq1UDDsEKopD8sIXFSbKOWDP9mZPbSwFN1zdjTtYKYWBic
         YuaRLEpeNaALRHx9wzqY0pqmdMvzYHyAa1fcxVKE/nw8ZxYaB3/EH31udqndHt1iTItM
         KSOsOMWQ4q2TKKGyv5LnLQfNVHeELZCJhbX3VqwGerm8q0cmVYybIgA1RDrPfFnFQgnP
         VOwBQXn9CguAW7cG0376e9sNjsunwSPCyeE5n7GllRGRPHcCmTwKjFJ05ZJnVZRTAspn
         XdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863380; x=1711468180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Hjek9M5u6PXnQB/xTWo90Ep+NkhvngSyuPpPAmfQA=;
        b=L9aznHtjiRjVl2+HcwsEhgH7UJjjX/eWhrNHV2DTrIbJxv7kvYfuBf6add7K2DiOUj
         XvxuE5TqAxFevyNk3VgKiHrPNuRzAd9TQb+RtGVGdT++WMlu18Qpew5STPHLyvb5d1/o
         WHPRbHYWVYIFtnczGritfuRKfcmVXIuwKCc6ye0bvBLSHU9yg/dwn4G/+/3qPowPrAPR
         2zciIRbSxqPQuC7aPlO9pRwiC2leBXF5HAnLffGKx24z4yiwK+TOJ9oPRJNUjy9wgkRm
         fMUKv/cGwjkWgy5kzyMmtqmlPrMR1pRtmyOCmfZlEtMaoNibm7lCN4P5cwHb57YN0j+5
         S9pg==
X-Forwarded-Encrypted: i=1; AJvYcCX92gjTSL6li32zNQY5RoIqd0QDWW7Wf4V0SU0itvjG5IcVOh7q2shr5+1fxuHMRjIA1b5n7pBKMTWuXiinoWTkU7XOXjD+4ZJtFcyUjKM=
X-Gm-Message-State: AOJu0YypdEAu1mA8KpWsLYulMtzHOveuBpWOydqZlWm//yQlMW0lcxQ/
	FuCBWF3Unic3/XpbumKmarSuePgJ2WHxaDbiLDygo16WnFyxwgMlVEyDYTwwMA==
X-Google-Smtp-Source: AGHT+IFkojn1gjw5YMM8QGlesMsoCbmwsfbV0CzjmxKGfGPmx+QM3QGeFtnoIJcwdhXsS/Nmp5FfFw==
X-Received: by 2002:a2e:8556:0:b0:2d4:49d1:38e with SMTP id u22-20020a2e8556000000b002d449d1038emr8212380ljj.28.1710863379785;
        Tue, 19 Mar 2024 08:49:39 -0700 (PDT)
Message-ID: <ffb131f0-4583-4209-8e21-b50ce4553e71@suse.com>
Date: Tue, 19 Mar 2024 16:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/14] xen/page_alloc: introduce page flag to stop
 buddy merging
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-10-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
> Add a new PGC_no_buddy_merge flag that prevents the buddy algorithm in
> free_heap_pages() from merging pages that have it set. As of now, only
> PGC_static has this feature, but future work can extend it easier than
> before.
> 

Suggested-by: Jan Beulich <jbeulich@suse.com>

> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>




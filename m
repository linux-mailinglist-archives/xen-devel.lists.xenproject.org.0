Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88462B0DA09
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052614.1421353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCOC-0007aD-KG; Tue, 22 Jul 2025 12:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052614.1421353; Tue, 22 Jul 2025 12:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCOC-0007YE-Hc; Tue, 22 Jul 2025 12:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1052614;
 Tue, 22 Jul 2025 12:46:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueCOB-0007Y8-2d
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:46:35 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a8bb41-66f9-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:46:30 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso3496015f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 05:46:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6d22e4sm76868685ad.153.2025.07.22.05.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 05:46:29 -0700 (PDT)
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
X-Inumbo-ID: e3a8bb41-66f9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753188390; x=1753793190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g5gTublXcSFwxU3FYmzqOrfUE7GyjZKzfPQRljSNdkg=;
        b=bOKbRZkqp2g6m/HwWCn/ETpobJFIwxoxGnOiSVS0Tjn1aAtadN6H0iNsGRq+n0aeae
         w692D3A5VW6Ut3XkIFOpIaZcFdT1wxbgA3hHNIDaXLH7izp5oZEg5nJtcpGvkb0VYXji
         b/MC3lbYcwbMv80Umk2ash+kvYEEz7gG7z/f/m95nfFH+ufAAfXnZqcGclN2gkIx/f8Z
         5wRRm6EGG1ygV3mvZy+2Oa0W+yKi1u1cV8RpuQc6y8QxbkcBvj3mV974C54hMkjdpU6i
         ChxhDFyBbT0N633CvYZpYr9/4nHWZmUJqgwBNJezugFL6PjJ/QH0+BXnJRtzEKM2YG/5
         nK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753188390; x=1753793190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5gTublXcSFwxU3FYmzqOrfUE7GyjZKzfPQRljSNdkg=;
        b=Eywip8X4MoAeScUFW2Pl/0foJpB/nnTsiCjlDA+aeXZQrtYUG7RtjcAw8Ms61ZBLtZ
         MTmtohmprndQ63Ye1kTYyL02SG/o7zoWMxkBEIcNTYedvzZb8myirzzc0Y7MQ6ZefcxA
         zTl3KpbtnB0u+qLLlHmXTjj5PGzzGCpSNr9YVKGreye+GYV0NVzsi+zFDJvQXgeLP2/e
         Eh+YyCsgsPGSjQUMC0TGnKBNi3IhAofZ7oUXlQA7SuYaTK/LKeR9NuD3CwvFogNImkNx
         dyWfTD0t4lC4dbKL37iJf7PM7w/1oabDa0FOTWtYwVAVyQkRwRV38x8KAu438M1K2bJ4
         3QGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYLCo8rCQMxpRwqT09riKb6fE5JHV3TCtxXm9Half2go9fRKzJn6H1ceousguAxhWN0JGWsjqJPzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyi8laQM37X0Ke8IvKsu8i8GxQQPz7kFakBXP9pDGCp0qw7XIR0
	RwcXyt70Gn68dMhu3xV6NoAJlyhYsbul2VJMZZwXBAPVAUDQ01OpyWpLDJ1ughROTQ==
X-Gm-Gg: ASbGncvbA1W6DU/cKV/f7VGBicI1m94GL/NoTaf27iTIywf+N2WXwpeoIiNUqRb5ec3
	H8Nh6ZY2J8KUn88WA8AOsuVLbD4k9mPtA3rpykQSczZea7fxtfER3Ak7IloqEKQJZ6j0xaUgPAH
	MtDkXrJexIgACzGDsI/PZFneAIWFFh1EQ52EJrYpfK+kuVXhng/lnGNOXY6v4yDfy1rKO3DlaqX
	3osObNyzA5RQcnIispIh6MaxPvG/QoYGX4sHIownelvLe89uz7CAbNuQeSAB+2yVqDND+VAeuvW
	POksnwr6iw+N9PTXe5GlPPJnpMhVt6Mtw+xu/0Jtt+57yux9TFk+ZQlAGDvJtmsYkzziytA4bI0
	gjRQJobAubcN2eimqJ6pLmy+UgVJlvupdAQYfDWR4JHBEccQpqiWAn5Gz5F4cHHkcrGcBs8bn1B
	e91Q10Juk=
X-Google-Smtp-Source: AGHT+IEVQbXUrDVHcx9QnjR/yxkpsPzp8M2RA5AtbYqbCG4mePxRNBt28CNKD0SRUYPt2TG07MoC3w==
X-Received: by 2002:a05:6000:2213:b0:3a5:2cf3:d6af with SMTP id ffacd0b85a97d-3b613ea2bb0mr15947605f8f.45.1753188389600;
        Tue, 22 Jul 2025 05:46:29 -0700 (PDT)
Message-ID: <1eed9d08-780b-4468-afd6-b9f573fb02f6@suse.com>
Date: Tue, 22 Jul 2025 14:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 09/10] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <9f4a137980a0ee72f0f03d55176ca178c4b90126.1753184487.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2025 13:41, Oleksii Moisieiev wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1105,6 +1105,15 @@ which serves as Driver domain. The SCMI will be disabled for Dom0/hwdom and
>  SCMI nodes removed from Dom0/hwdom device tree.
>  (for example, thin Dom0 with Driver domain use-case).
>  
> +### dom0_scmi_agent_id (ARM)

New Dom0-specific options would imo better all be sub-options to "dom0=".

Also, just to reiterate: Please prefer dashes over underscores.

Jan


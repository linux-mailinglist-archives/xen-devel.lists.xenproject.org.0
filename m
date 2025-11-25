Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAF0C860B1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 17:55:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172130.1497234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwJG-0006wk-21; Tue, 25 Nov 2025 16:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172130.1497234; Tue, 25 Nov 2025 16:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwJF-0006ui-Ui; Tue, 25 Nov 2025 16:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1172130;
 Tue, 25 Nov 2025 16:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNwJE-0006ua-Jf
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 16:54:32 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68f98c04-ca1f-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 17:54:30 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b7355f6ef12so1206003866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 08:54:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cefe53sm1622309666b.13.2025.11.25.08.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 08:54:29 -0800 (PST)
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
X-Inumbo-ID: 68f98c04-ca1f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764089670; x=1764694470; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jbdFem+pPYwuwSvJR/GyY2ScXR86Fheg70gamiE/K+E=;
        b=fCtBA36H8kVaEO9LvFQcm5Ku5mZvJEncKFC9Z/aGFLvtTZbDVSncziWjJuOKovcDU1
         pYF8W6EmsvaTI86x9JR8PoqC5aof8e8+oAe6AvwzQGyH13vb+E6ypF++m4jSgvfPiZ0Q
         kqWLNxL764Z1FxljOB5q4T+8i5BQ++xkEy1y1vaLUfXmsBOb6j02Z+wlLPXbssV/4JZV
         uc+Gpif+WD07YDW3tjd7bXrb7sChqksciG4tflUq9tDeCiHwVZislHcnB6P5Hrnf4rJb
         aXzBwfAbuYbRVM6PYTIx6A+rEexkF/gK2VkRxpXETi6owm9AkwgM9mAC0d0LKofKd98L
         4LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089670; x=1764694470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbdFem+pPYwuwSvJR/GyY2ScXR86Fheg70gamiE/K+E=;
        b=QpErsOSD/CcShkSJ0HcB1Ost+WQKgzfRQmJsfA05/gpMunBrvv3MWL05BzGyEB2IsB
         8j4gZIhKUKiMGZaZwOWNfs0xG70oj5VBZXKzhxqcF21AGBdo/lW4yGBrcR8z/RPMGeEQ
         meG9XhU2ZLQOZF44Jj0GEd3h2AEqVY71KA9z1JmEvRMGnN12/okrxOjs4PAvX121w16o
         L15AhuKH/EU9DAYfd4MjXizIkRHyYK3ow42FeKej64Y7pNoB1ePt/OwtCpjKX317V8G4
         znj0m65pS1FUJOnuc9+9QS5qxSFH+tu468c1pvj1ccYqQcpUueesDOzkmpoSqk1U1iQQ
         in8A==
X-Forwarded-Encrypted: i=1; AJvYcCWh2YSFf5Nm8mS8Tt56rs6gddHKA3Pg410st/oOKt2fDfO0kK1+WIYVJQBsGkDt2+8L1yPbHv4dn2M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5lSYUylKtYcPOk/KYXCTRM4/KUsrIHUJ8Ec1M57S0uEpyDxtB
	KNwn+3S+8UhFkyU4LNboyVIY0GN6iUcfeW4Rv8OWNPeosZ7JqPDXnnU1WOW+sAOCLw==
X-Gm-Gg: ASbGncuM2yMCE41eCjlqAKE2rxuh9Q18ExPh0772Pu/t/x6Ue89tvh0YMq3iukZjyhr
	QyQ0h5jKglc/cfnYV3A0sHYMMC8RyhgInT/WGWiIaLnU+v7sjcxNRppK4qMlACXUdkdVPR7KZVZ
	G6VXI/CMU3cl5lsAi/v8AVdxuP7ctkm29QY8JESRTYsGBDwmexWXfg0ULAriP+lL+9UfzjT2PeM
	kNNjU0RO79lvNS9xIAkZoxIYprnVZFx+7rg9kPXSkiQPUy4a5+dMwl9MCCXcx6G2rE8Umy3wwgI
	uqD5Shdu4gLriSFCE2VSR7EaJu560RXMabWNq6NSRGFJllqvgMNyWGEOHLraDkgW3ytABmvyN+P
	YWWH+57yxI4iVpV0UhHWTyrwmlE4NQHfY4qGw6vKIgFC9Ayh8AbZafD1u2xRy1RLpYo1BUVaVcg
	D1zFU2R8RdSgfZp8s4tx3cdP4tyXDLXT/lNqa0MnuW9Onl6X9C2Pom6VZPn6lvnZoJBebAlNpmW
	3Q=
X-Google-Smtp-Source: AGHT+IGxnajJ5jXqIjA8pU4O85AAlJ4qk7j5hoyagRgYgi2EgqYmaEe6tHbmJYlaSTq2ZdapCxnhzw==
X-Received: by 2002:a17:907:d26:b0:b76:beae:f847 with SMTP id a640c23a62f3a-b76beaefaeamr447653066b.20.1764089669755;
        Tue, 25 Nov 2025 08:54:29 -0800 (PST)
Message-ID: <de73aa3d-a97b-4780-aa6d-7cf47159913c@suse.com>
Date: Tue, 25 Nov 2025 17:54:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] Disable domctl-op via CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Juergen Gross <jgross@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jason Andryuk <jason.andryuk@amd.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
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
In-Reply-To: <20251121105801.1251262-1-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 11:57, Penny Zheng wrote:
> It can be beneficial for some dom0less systems to further reduce Xen footprint
> via disabling some hypercalls handling code, which may not to be used &
> required in such systems.
> We are introducing a new single Kconfig CONFIG_MGMT_HYPERCALLS to manage
> such hypercalls.
> 
> We are trying to disable hypercalls in the following aspects:
> - sysctl
> - domctl
> - hvm
> - physdev
> - platform
> This patch serie is only focusing on domctl-op. Different aspects will be
> covered in different patch serie.
> 
> Features, like VM event, or paging log-dirty support, which fully rely on
> domctl-op, will be wrapped with CONFIG_MGMT_HYPERCALLS, to reduce Xen
> footprint as much as possible.
> 
> It is derived from Stefano Stabellini's commit "xen: introduce kconfig options
> to disable hypercalls"(
> https://lore.kernel.org/xen-devel/20241219092917.3006174-1-Sergiy_Kibrik@epam.com)
> ---
> This patch serie is based on two patch serie, one is
> "[XEN][PATCH v4] xen: make VMTRACE support optional" and "
> [PATCH v3 0/7] consolidate vm event subsystem"

While looking at patch 20, I came to wonder what exactly the above means: By the
words, nothing in this series can go in ahead of those other patches. Which doesn't
seem quite right. Please can you state dependencies in a helpful (for reviewers as
well as committers) way?

Jan


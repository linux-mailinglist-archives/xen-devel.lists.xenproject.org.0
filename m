Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00098B0F6B8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:14:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054380.1423139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebB3-0007ya-4t; Wed, 23 Jul 2025 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054380.1423139; Wed, 23 Jul 2025 15:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebB3-0007wq-2I; Wed, 23 Jul 2025 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 1054380;
 Wed, 23 Jul 2025 15:14:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uebB0-0007wj-VV
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:14:38 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf134e99-67d7-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:14:37 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-454f428038eso59175725e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 08:14:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b60eb0csm99085845ad.58.2025.07.23.08.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 08:14:35 -0700 (PDT)
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
X-Inumbo-ID: bf134e99-67d7-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753283676; x=1753888476; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NxG2Suu2yXDDOSyfEQ+pH8HKZQzVaZGVsSiLmL7df4=;
        b=LH4pUYWMEKD43FiBzJb1BMTkPMVBdOSQSgXa9e58K/wtd1PJFR21ntY3HZH0n6jzz3
         kbq8F16qSPgBtqIZG8jl3apddp0N7JQ81pLOdDM0Z1q94isqqdd4sawl+KUQRVf4ms5T
         6JR/R2S9831+brH5HFJvxpb6vC8Jo2N+bvvv/Dq82c/Dnw9ZGfefVQ1ScvN+Wi9LJ+tY
         upSwa0zzi+yohi2bKaPrvP4qtxrwWDhpRqEd4IDbnrgxG5BT12a0TmQnUzj0QoygvEvW
         Zw4332eA+jXg8br1ll/Z7yB4VKvY5HEbqAmT9Fi/WFbRIkTk9GhWooGcigVKHFIDZzEr
         tJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753283676; x=1753888476;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NxG2Suu2yXDDOSyfEQ+pH8HKZQzVaZGVsSiLmL7df4=;
        b=PDxMhCl5AIg6OXh0uIYLkzl8eGtLBgHTkN3Ms7ZFLTV4DXlMV4SDJl3z6JEZND6vmV
         35tr/FCpuDWLmaVnm56gBKWYDMAomzqmASRyt057NdGresIbCvlyQX3B5dds+gYyQ6dA
         HupD5v9GT0GVLaNdA4A4yXnmEZA9t658Rq8jhKqnJmMrDpmYfS9ByWtlFoCJjJVYeEtN
         7g90doC/Ha/YrfSbOx4VrAIpbkW/ExgaSZSVXoF6dC67q/RhCZ+uTS4hRhRbvDZVq42k
         MMuW5FtvL25jMul3ODYEJYLls5LiC+NlvbKmJ/aEHbdfJKhLoGGUyulwoiUB5MlFRklp
         4bng==
X-Forwarded-Encrypted: i=1; AJvYcCUppD0Uei71SByKzxzYjiRilbht8dV+Zo5winutObWCG48KN1oYpsCfjQ5xHRGdFCUSPbpJG106VUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwMKGETRshLIv78dHF7pRZMzRVTTx1JFmHMkAV3K4mFm/Tt/aR
	abg3TbQHIeMMnhnAmzWVurYDL6GiUZEqVbcNZPGCXRtWhF5vjJMYtQceqc5zkqZ6KQ==
X-Gm-Gg: ASbGnctoNOEifNWoTyHkkbH+ZIrd0wNX8LgqePB4kd9GyCCMjdmNpbsFpQM4bORXI3J
	um8WvfQNaX/kmHXzDtAHAxNZMHUpVJ9X9QmRZi/YP5a6DdxgL+bI6+p6wvOEaGe6v4Wt5xtMHTO
	jgSmRKu5DAJvPBIG7mqsv4E+P756pZC5RWngBoysI6P2yb7n8cw2pQxFuKxHxuE7VWpudbNpfak
	PX22PpG2fJQ7AHJmnYPyC7h4xwtRXnekK5aojyB1jxVR4YhTRM3CObbV9QkvpBprYxiMXGEEl14
	qFXN8DZ7TZQ21AAmitrrpMYR5pUecaVJGzPyjRBRf6YkvqQOynPdY37ZaFawcPBS1aZkJuNASVg
	3bRzmZ1BOsRlU143sowMwSXir3FefvipElGFxiDOXkcOxpXt2yZ2xisncg1C0EFpJ1UhOcvcouO
	M7iOC9/J+40s6/e4ZJ/g==
X-Google-Smtp-Source: AGHT+IHkvwXIMm8Gui7cyxtzo3pRRdC1l9wTExUrrQ9C0jVmLFlWV8XXLzrlQrO/bNGLL/tEyY3wyA==
X-Received: by 2002:a05:6000:4212:b0:3b5:e6bf:8379 with SMTP id ffacd0b85a97d-3b768ef95a4mr2978884f8f.28.1753283676317;
        Wed, 23 Jul 2025 08:14:36 -0700 (PDT)
Message-ID: <82ccbea6-1c40-4e8c-8209-7ee758429324@suse.com>
Date: Wed, 23 Jul 2025 17:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <35b3116fd3d4681ef3cf80a87b12c66055ce4342.1753283164.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <35b3116fd3d4681ef3cf80a87b12c66055ce4342.1753283164.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 17:07, Dmytro Prokopchuk1 wrote:
> Add MISRA C rules to the monitored set.
> All these rules are 'accepted' for XEN, have zero or few violations,
> and should be enabled for the ECLAIR scan.
> 
> Rule 17.2 is enabled to prevent accidental direct recursion.

How does this "prevent" work? I see no deviations so far, despite there being
a few cases of recursion. Hence if one had a need to introduce another variant,
how would one go about doing so with no code usable as reference?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370DCB08518
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046192.1416447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIH1-0006Re-M9; Thu, 17 Jul 2025 06:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046192.1416447; Thu, 17 Jul 2025 06:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucIH1-0006QD-JW; Thu, 17 Jul 2025 06:39:19 +0000
Received: by outflank-mailman (input) for mailman id 1046192;
 Thu, 17 Jul 2025 06:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucIGz-0006Q7-Ty
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:39:17 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2825895-62d8-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 08:39:16 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so229123f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435bc15sm135181975ad.219.2025.07.16.23.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:39:15 -0700 (PDT)
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
X-Inumbo-ID: c2825895-62d8-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752734356; x=1753339156; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jJN1pquswrMh83lvttX+Uq5Cymk1wQESpVRr7L1l168=;
        b=O0NAl7LZ7wmRqtU5phhSdVfP+UiJqaoXhLX6LDsiXrmw+/k026E3qSgxTFye8lBsvI
         iq/Ik98nUR2ItEVcD4Nef89NvN3260up9pwPs7RSbzcz7io2gWIeH5pwAXLWUpnk4WFC
         4J/kldP5J3mlnseCc+TZcBUDAA35/7I6ZKgOds5VzKcgwbcCmQQzK/0eniVgix1rIdda
         1vPeyZPpjWAq5i/Tajvg7ASdNm2qis/3a1w1YRvBVfPDBZlO8IQCXqKUR1mNhYhyMDXM
         cYX4rLSdMo/LlgvA0oICmI/U3Ex8iD5I7W2DNCAQTzli2l4JrHHwI0uSKEV3O6EeqCZY
         yoLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734356; x=1753339156;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJN1pquswrMh83lvttX+Uq5Cymk1wQESpVRr7L1l168=;
        b=G9m9Y7bELw6rHjJNWTuYG0/IR7+esLo2t+9Z9vr37XerYfj3VXRy2EucXD5E5XbXR0
         nZBiId60vHRyZx/10Sq9sPGDQ0Dvoimc0WDFda4JGCzapqw7+mHmZPRlmJXXeDXpuyUG
         06mnLuIt0PGpkSigBJzZr45Eqs0O3swt6+FXsPt+jeRZyOP6Z1LuItYwMkUy5kpqLSPL
         m2ztNCgQJb3jpjFcrFKYu8VP+YUq8UuIP+Mtgr6guc4+z0KJVcjmBkxO1c09CludBLfL
         GmpIQ2FwmStWft1p142+nequyR1YSM11q5ighLq0+bfu7jqBRkgs6odIQJQpiVb+CfxO
         5TFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB8LIsVlTidmlw9VXj95vxRKQIo221lGRhHC5ZJ5wJz7YgCYVQK7iltcQwpGwMfdwzgIeN8AX3HbI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjRl/3XdIRYebyjpHPqFtWEwPo8IlZCj/5f5xsiu+aXVGNBXOU
	GCoMSH2vtRbnvNf3CUcrKv+bC+D0210GlqdwzpHlFmaiV8JYlvNSkeCbFbHtXEs43g==
X-Gm-Gg: ASbGncsBCc02eLbz5EAqEjmhblL92EIZxklWK2FEaRu4hUlWZ9kWfOKg+PloSbFNZUz
	3RLPHda0b9xRrM9ZDh+gcezqkvsx2GLarLhF6okdBfe5DG0JDidiurykO+Nca8u52kfMutxPqrA
	3rUB5gA4zPBZ0jV9i1nPKoscD83XBioaa0i/KYQFjHBijc1zJ1qUH5w2SMCRNEQcXZnn0lulRsW
	JbjweakGa7xzQIYUrWfmrg+OQoVb9mO84UZ9ZA/+oDtuDH5egsRQpwbwo2XaAkpZ6uwUIlQ/LNA
	YAU21JENnTb7mRnaldQPTuy6IEVCMr1Iiv1Ldx4ldbf3ZauEw6lD1rcQbYAYrzGIyVEEvZykF43
	rh/jRB7sYc4kwbFPEn2UPtMkeO4JBFV2q3Hxa4Ur4j+DcYzx2rfmrsTC22hIhj+8cr+c+YkPyfO
	zBLbQVcqmWrdwUM6w/lA==
X-Google-Smtp-Source: AGHT+IEp4uBKqrImiXb96jQHFb9G8/FmZ/oRhcO9eIVu95oGEGCntu2RA7i9G10dGKxB2e1a3MfsKA==
X-Received: by 2002:a05:6000:4382:b0:3b3:9c56:b834 with SMTP id ffacd0b85a97d-3b60e4c513emr4693353f8f.1.1752734355959;
        Wed, 16 Jul 2025 23:39:15 -0700 (PDT)
Message-ID: <ec59afd8-93e6-418a-b6ab-0db87ac986cb@suse.com>
Date: Thu, 17 Jul 2025 08:39:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Enable Xenstore-stubdom Live Update
To: Juergen Gross <jgross@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250702081305.14440-1-jgross@suse.com>
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
In-Reply-To: <20250702081305.14440-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 10:12, Juergen Gross wrote:
> With this series applied I was able to perform Live Update of Xenstore
> running in a PVH stubdom.
> 
> This series is based on a related Mini-OS patch series AND it needs
> the Mini-OS commit id updated accordingly in Config.mk.

I was about to commit the first two patches here, but then went back to
check here. Aiui such a patch wasn't sent yet, so I need to hold off ...

Jan


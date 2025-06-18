Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBA7ADEDFB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 15:38:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019146.1395962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRsyW-0006GE-7q; Wed, 18 Jun 2025 13:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019146.1395962; Wed, 18 Jun 2025 13:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRsyW-0006E8-4R; Wed, 18 Jun 2025 13:37:12 +0000
Received: by outflank-mailman (input) for mailman id 1019146;
 Wed, 18 Jun 2025 13:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRsyU-0006E2-DW
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 13:37:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 548789f3-4c49-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 15:37:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so6652951f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 06:37:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365dea8ccbsm99555215ad.167.2025.06.18.06.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 06:37:07 -0700 (PDT)
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
X-Inumbo-ID: 548789f3-4c49-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750253828; x=1750858628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yJL88hOBVpsqrYLl/1QUiovMp1GO6402vxPEz45dK1g=;
        b=RPOfr7g+qRQs39NRxdZaHcxjHIgDktAwplWOPtZpkNqWs6sV4W+kHe+5mIZb7Pp9+9
         sD7GkUYmgYVxHlc7qbvMyKlhD8FkAbflFheUHsdXRt1kCuukd/UJbNiQ9Dbi0JDJ53R+
         lBBGoKQJEOnRb4NbC/g1c+n05BhtTJhhS/6TdJhcIBFrE+3cYYxeP1Yj0t7Uz9Ux8ZBc
         IfrglqQIufY+KK0pTx5luysaqcsMr2tdMmsZnkPnw/4jbgAtmqoiN3yQUa/fLpnaBHyA
         Mx9gWHT0JVqcYGAyEaI8wNxC9OXAwRlu5E4CIueCjvFbib/z3WSZOb0KceD7G/X2ZY/p
         rGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253828; x=1750858628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJL88hOBVpsqrYLl/1QUiovMp1GO6402vxPEz45dK1g=;
        b=bH85xweZ0U74lHaPvuRZEmxWbCMBtaSpBR8QFBUIf6tBkpg6OnD94hfakwNe1SpzNe
         hDbJpR42msZgX20rX+G924KHZedMroEM6/SB44lsdfEQcdc6MKsMntvoCM+ym+CJhbED
         ynUKpnmhEKAAy+fbSxsQeEAHIFLExwghpBuOztYid1Z1y6CnfAHOA6eii7kPNhLm9c6l
         CmuYpmy+puzNClI/MW8tPTMMFUkPEOLl75MQ2oj7isDuNb+CnePcEG/orz8El9xt6vqD
         LwL1bA6e5yySvryfnaQm4dk9awe4cDKrNm8yeEnV1scOte7cpFl7FATeZKr1etBJdxcE
         5rlg==
X-Forwarded-Encrypted: i=1; AJvYcCXsUqx7rAuWJ9thnOZN+TtYkgYFruL9XxjBD5ZPhpUZPvTMODb3pvhslgOypzxQt4AodrhsH4MtQsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+HtFAL7VQ84Mis9k2H77QoPtawcEEa31ulfk3ch00gXkmsGpp
	W4B6Lb/1CRU5UfqytmNB5jR3pVe+DBVspLcvF8jc/3mjMfulwp9Vik78AI+1u9pDVw==
X-Gm-Gg: ASbGncvTDOB4QGCwEOdluzQfuO1ONowv3ITl+VTdQDJSBum4TRbMkOG5KtFlpTlHhEe
	jY90OjOBFDDApIcIBClxg5Dl2qW7isYVH6/ZJP8lv44DQXbPwfOCf1w3hEIKfOmz4ZoVV3qKO5d
	kZb1tKKZ7gpyVLaO9FmA5AAH2YAxwFJU2tF/ynp4Devksv3ckXFKGg2wnLrt3/cRfLJLkM8lWW1
	IBloiOIj5pmGjoDNE5+Rh7InGHy85/ztVIQmD4Cnb+hrDOCxuEULgiDbzQ19ix4iPXPKwBeYIn3
	7CP/iJ6VjI4RBhtP+67bDgQ0A+Vvt01o4AKGirRFwezamenPTt+kiDjeuSs/LtfjtxZ4xjJIpwl
	cEItLHZl991AalvHKzkLdLW1KNPx6rnwXUz6JXDbEKyu0GfM=
X-Google-Smtp-Source: AGHT+IGtnXsHNrQLVBD0bzaC27DHO/yUYI+KAwunWfaAD8JTmdRkAy1X1GOjG5L5jm3KfBhRdamuxg==
X-Received: by 2002:a5d:6f01:0:b0:3a4:d8f8:fba7 with SMTP id ffacd0b85a97d-3a572367c78mr16514388f8f.2.1750253827823;
        Wed, 18 Jun 2025 06:37:07 -0700 (PDT)
Message-ID: <2d8f85aa-af34-4f4c-b3ce-52640cb207f5@suse.com>
Date: Wed, 18 Jun 2025 15:36:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] pdx: introduce a command line option for offset
 compression
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250611171636.5674-1-roger.pau@citrix.com>
 <20250611171636.5674-9-roger.pau@citrix.com>
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
In-Reply-To: <20250611171636.5674-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.06.2025 19:16, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2072,6 +2072,28 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>  those not subject to XPTI (`no-xpti`). The feature is used only in case
>  INVPCID is supported and not disabled via `invpcid=false`.
>  
> +### pdx-compress
> +> `= <boolean> | auto | fast | slow`
> +
> +> Default: `auto`
> +
> +Only relevant when hypervisor is build with PFN PDX offset compression
> +`CONFIG_PDX_OFFSET_COMPRESSION`.

Which, however, the name of the command line option doesn't reflect at all.
Question is what your thoughts were towards what if another compression
method also wanted a command line control.

Jan


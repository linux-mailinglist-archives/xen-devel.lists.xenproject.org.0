Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E5484B3EE
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 12:49:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676835.1053141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJwv-0002Dg-PU; Tue, 06 Feb 2024 11:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676835.1053141; Tue, 06 Feb 2024 11:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXJwv-0002B1-Mp; Tue, 06 Feb 2024 11:49:13 +0000
Received: by outflank-mailman (input) for mailman id 676835;
 Tue, 06 Feb 2024 11:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXJwu-0002Av-7h
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 11:49:12 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd133a91-c4e5-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 12:49:09 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33b466bc363so360090f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 03:49:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w17-20020a5d6811000000b0033afcc899c1sm1915771wru.13.2024.02.06.03.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 03:49:09 -0800 (PST)
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
X-Inumbo-ID: bd133a91-c4e5-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707220149; x=1707824949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/eIw2pgQ2mmhwfkUOy8UoWwbTRbjlat4j7eQPYE7Jeo=;
        b=gNRPyy+IzwNTcnuZqwPtiYbpg+KdK1ezKhqjkafUGrzsU0TpB0KfGICdMbLsqdHaiC
         /pC10TguFwHRTYidglf8eKWKH6VvbEV41qBvy+lNMMWeo4n0WgpnoOEXVghduYFuclGl
         BINfsaNzUrHcpItrwRNDbpnhYwCphtAatWCGvs9Ydj97jANAabf/0FoWTbzJ/FByYQiL
         vnu3Ef3IVi38Vh5VQepadScBzVTKhTyH5pwXPUOHnBBuht4DxYcg1tzKUaXvnjnSFBvR
         OO/Vk/5/xyYzdtqwWfGgb8XmiPtScWrDb1Erqtbv71YsZFPZWIN56jHku1WPzjX8Me9O
         oaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220149; x=1707824949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/eIw2pgQ2mmhwfkUOy8UoWwbTRbjlat4j7eQPYE7Jeo=;
        b=NB1rTtK+DulPArLjRDXgBJ2UiShfldtfe1C5Qw1CBvumCkKaKdWTGJZ2EXU2D3a5xZ
         3VnSaVkNphHWO//1QPc76g3VsHGuiBaK+/snj/LrLM6yEPm7IVWpZUC2JsZUBV0jHh7a
         Z0YbtllT5q/JFzqf0TfLOvhmDXJL8JdnDcm2o78lIkqNWRFE54W17G0ESvmkcnMQUeir
         cYqmRDOQBShkU2jv1qy85gihkrBoOGzL4VBd753az9TBnEt+zm8fxmaJcRnU5+OS2+br
         014/vfZPOpS82MhM/fJ8FQwkVU1c3eqKvSeheBGH/dt8utRp/xheM0dVrSHhpi2ymDpZ
         VfXA==
X-Gm-Message-State: AOJu0Yzx7/zf9o2KXGBqlMVSaSCVD4S+9pAHE6SQPqAHNNiIyqEF69ud
	MXRi5jB3bcU+h0YqetDOWTd0svsz5JRKHdeG3Ei5ykdXTtWs5jNXCiwJk6FIeA==
X-Google-Smtp-Source: AGHT+IFRD2gWEvd0gMa6ZYAJ6KqPQy/HtW5u9R+oB+TjXj+dWBgctvilTvaHWmeSv7OjXhhFjhKbUQ==
X-Received: by 2002:a5d:4f0e:0:b0:33b:2633:b527 with SMTP id c14-20020a5d4f0e000000b0033b2633b527mr1046884wru.20.1707220149418;
        Tue, 06 Feb 2024 03:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNik0RgHRVebarSf9EAdgtO4ko4pv9kSpgVkEYJlJhn8FjzBq4bvDXC3Zf7rhtShNk+jttx316BhLWon+k5qKjOsnitg0tAHTM4fe5wXU=
Message-ID: <5db22ee1-40b3-4df8-88b8-446a2e224d22@suse.com>
Date: Tue, 6 Feb 2024 12:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] iommu/x86: make unity range checking more strict
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20240201170159.66330-1-roger.pau@citrix.com>
 <20240201170159.66330-5-roger.pau@citrix.com>
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
In-Reply-To: <20240201170159.66330-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.2024 18:01, Roger Pau Monne wrote:
> Currently when a unity range overlaps with memory being used as RAM by the
> hypervisor the result would be that the IOMMU gets disabled.  However that's
> not enough, as even with the IOMMU disabled the device will still access the
> affected RAM areas.

Hmm, no, I think this is going too far. Not the least because it is
s/will/may/. But also because if we really wanted such behavior, we
ought to also parse the respective ACPI tables when the "iommu=off".

> Note that IVMD or RMRR ranges being placed over RAM is a firmware bug.

As written this is wrong: They're typically in RAM, just that the E820
type for that range should not be RAM_TYPE_CONVENTIONAL.

> Doing so also allows to simplify the code and use a switch over the reported
> memory type(s).

I'm afraid this isn't right either: page_get_ram_type() can set
multiple bits in its output.

Jan


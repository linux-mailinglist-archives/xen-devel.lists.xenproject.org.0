Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A90B52F16
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 13:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119965.1465090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwf5S-0000iE-7A; Thu, 11 Sep 2025 11:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119965.1465090; Thu, 11 Sep 2025 11:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwf5S-0000fo-3d; Thu, 11 Sep 2025 11:03:34 +0000
Received: by outflank-mailman (input) for mailman id 1119965;
 Thu, 11 Sep 2025 11:03:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwf5Q-00005g-MW
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 11:03:32 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3c35c0c-8efe-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 13:03:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b078aabeb9fso93476866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 04:03:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b32f2098sm111624966b.74.2025.09.11.04.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 04:03:30 -0700 (PDT)
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
X-Inumbo-ID: f3c35c0c-8efe-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757588611; x=1758193411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFlQ66xf9E1AIHJgBQrFRpqSzElE9aMBia7jW0BfmUk=;
        b=eHbHBrwJGeq+lTAbcQe5TCsu/yjhzlK/sKtXLUKBUDPv0l92xz27yKE5WK41M8kdEM
         UR0hoM4LN7WaN3d5VPO4L023R6XEL0dGASDPR5N3uRj0+rquQweMyKh1Us9nnI5Ie9Hp
         Fqd2BEND/5vkFd8YNwqMaSdqJdyhHCmAyr+Q9Pobf13HLTgF81iNAiFxhmVNK9MyD6TQ
         b39A9Tya68w+UkTKf6lrcA+0C5QPqe+Vkf72PpvCi43RXrDoexqA+qHPls6O5nJHnAOE
         8X0sB1MP0Us5Pf3Tz+hGE7TMAx9ZLFhKcBLQ+s5S1N5huKoiEN0gBKsF6SoKgIsR6fle
         PXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757588611; x=1758193411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFlQ66xf9E1AIHJgBQrFRpqSzElE9aMBia7jW0BfmUk=;
        b=sfcx3aXLnB+OSJ2KZUkvtdXSBVIwkd1Kc6h1zvXnVRFGqog1Ntn70eRtCupTZh1B/x
         TuEeIYz0lvWklFYWAuFCxYhnMBUHY3GAOga1MB7yK+4OjdD2zM4/UC6L2rvKJFiP/mLY
         Y26jdyr5sGvo79tq8CgNo1ywWTkvTmYntc4tlBZSCREwrC7w3gOzDLO5/IK/dpixlLa5
         1gxk0jcUyZ07yaN1m2pt3L5Omj3684ITs+z6p1DolGKDGNfZ9fbj52AFVCH5qxq62Vj+
         6yTxqKF4++dn34rXEiIL+tVSALLIzcea+adPxInqPk8nLxexKUi7TKo8WD5kMBJhKbpF
         N59w==
X-Forwarded-Encrypted: i=1; AJvYcCXC4KQZmbbl2M4lJG5/zSvM4nmaKcs4pAbqq90lcs0Hcx+LrBB2gS/Z+wIhukUv12QzysxCwqcTdK8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDGQLuejgt+EnZI45BHlOK/TWdQ7CoBNvrApi17+vIGinhGXJu
	WSHtB1/hG2cZ48zDc/AQXXNXU/bfNpFtCSQry2BuxUzzxWT3fWByyS2Yb7OCyyMcSQ==
X-Gm-Gg: ASbGncsxqy1vYpD9cJ33e2fLmdQjg5VLmxYTFbBAsXGlie5FwA0mIuHAgvxIK15KfCd
	VyGxjLEyBLpWSFkd+wyIPy//SFnaJvs4ziXniTgJtNjYDJfLaRN4apbsQptBdwcAP8nYo/GEZ+E
	s3PMumpD4qelNJkbuuPsfjRpZqD1oo68r2Dy8hDwpV1ytOWl/4jxdTFXq6Q+S31kiiss40k3zU3
	N9FWprJ0dsbjOufFPdNwmxcuMU8NqOqUZ28QbIrwSDqjKXchD7vrR8hKc0pzGRPxzvQliIqIcM7
	qmmll487u+RNW6tTB8gdil/8yaETBIjIxmZd6/yL/TkFV9S2JuGWHd9+SdBjOJye1cbnj1p6H4z
	DAnVRQNWzhmIMfA9DLV4s/9CgGzJCQIMooeQd2cNMLUZuxlpj11hqomUUxQQGLzWogWEU/Y1I3G
	4eEzCMbSja2WsqHQqVXPAG2vTopHKh
X-Google-Smtp-Source: AGHT+IH5rhe7FE1lnrEB7PmVeSRPzqejrDlN2ih1k0s9OItCIgzLY5QgIibll4UgzFSmVKac0vlFRA==
X-Received: by 2002:a17:907:7243:b0:b04:9460:c4fd with SMTP id a640c23a62f3a-b04b1663c48mr2061566466b.33.1757588610622;
        Thu, 11 Sep 2025 04:03:30 -0700 (PDT)
Message-ID: <ed59f809-4b6d-4792-a778-1d71efdf313e@suse.com>
Date: Thu, 11 Sep 2025 13:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/26] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
> it shall be wrapped with it
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v1 -> v2:
> - new commit
> ---
>  xen/include/xsm/xsm.h | 4 ++--
>  xen/xsm/dummy.c       | 2 +-
>  xen/xsm/flask/hooks.c | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

What about xen/include/xsm/dummy.h?

Jan


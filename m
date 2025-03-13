Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68417A5ED34
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 08:43:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911291.1317735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdD3-0000GL-S3; Thu, 13 Mar 2025 07:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911291.1317735; Thu, 13 Mar 2025 07:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdD3-0000EP-PT; Thu, 13 Mar 2025 07:42:29 +0000
Received: by outflank-mailman (input) for mailman id 911291;
 Thu, 13 Mar 2025 07:42:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdD2-0000EI-0c
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 07:42:28 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b59d6d-ffde-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 08:42:26 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso3247335e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 00:42:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a5esm1161599f8f.27.2025.03.13.00.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 00:42:26 -0700 (PDT)
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
X-Inumbo-ID: b5b59d6d-ffde-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741851746; x=1742456546; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sp115kcCjP3SycZJyUlo/1IujeQwzQ/7854cSJgGcyI=;
        b=CxawcrGPMfmoz1Fh8RMVFYE9ZiCG8Y2pTX5d1d6i2Wd+icvGcY8O2oyxlXB/aKAz+5
         kX/y4bJmXuMC0dllt5mTJG1OKsis9KkD25RoBLoA8HarFo9nu4fOGpDuQUvmlE1Y6k09
         qSKT1/GPusAowUoeGPfBPd9Fh0jOEVBGompNO5eSPpQmpCq/aP48zjdXIGGoZS2+leHQ
         mR5EiHu7LAz01eO7tFp51b3j2X375L6kzbGHCodRpelTd97JL8dMB9LPoc82FN49k2Qg
         CVByLywFjIVEZt8X0UQgpX87sdYBmSPhx2HXxBdaGxjuS6sxoelhtmjDTGSJKvJoWxMZ
         yErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741851746; x=1742456546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sp115kcCjP3SycZJyUlo/1IujeQwzQ/7854cSJgGcyI=;
        b=AHn0fMp07C87Aan84NSXGodx5c20KCYFceFf9s5FD4rF1GHWdswyhGiW0UzRcYdCm6
         sh5RyeKaDAoKHAzTVE7FLOARsWQHCQ4V1a7WJEBVMuLnZOEWX5C3BeqjqKCNNlUBbVXq
         oVfEz6KvjVuR68KBqp9iOHzhPMfUQ46Tw0Wz1hvTPTyeI4pzMbAsyjU9nVpu/v8fCfrQ
         BHUltomkteWGA/KDg5+6OE7dyYTewXX/51lY+sOQpmbOX42vpNk7GtrsGzntdDGEvpNT
         KVR8/0CNynV0aNBKON0EGU5UqD6l8QdjSPBwREzOANxSuHFe/qoPDlz7kPO9D9T5BKKm
         SdXA==
X-Forwarded-Encrypted: i=1; AJvYcCWIQm7FlxYsND5vC5wKpSp16emBnbajv4m4zc5VIUTs8kuKMXAkQmOo+BlZ3WuahbRWQXckMIvu8JA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLRqnwnXX3w1ubIVFTUUjCwC7wQ5k+V2SCbTxPzwkH/m7qrsnm
	fPEBfyDTI4B5lQkTKL3GBCPCyZXII3R1JYM+ADiKyzg1Rgw0CDvQYvni3F4Z4w==
X-Gm-Gg: ASbGnctRv6+bFlQ5eIW+MIGBCQsZ/COK9FpaxpPOL7tVwuVrDq578WL3GjtRC3vG+Eh
	1CJXzKLU+YzZMFIEx7tiY38RAev1N6IxshJKiFVLmF6yHy0OWCVxmKUQsiaFqSuPGtbjs9Quxu7
	JjGteWHZszfzLBnx39l6NKTZGJdjqxZ0bZPx8bbkiabc+59DaxGNw8Boc2sZsQXP0boqoZM0Xxp
	BEH1IBayI4nIadtwurkhY27+mfVBYykR1azF541vEv190/C2gx6TDxRFtfl926Q0/BxOju2n27a
	IAYFXCQq1QoDBtEx2lDf1Q4zPjmBrZcSLfJbLksSU9xpcu+K/EE3b7/HjRAK6EDHUJ2B/JsIAKz
	PUfQZ5lWZ51Wpp/icT8ziFzoYa7Ge5A==
X-Google-Smtp-Source: AGHT+IFKjXTe63yOsaGQSvz7SFEPIUwEjXIgpi8F3oyP3zMF7iKLMNrQkVpPiiQ4c8McRAneve5jSg==
X-Received: by 2002:a5d:6dad:0:b0:390:de66:cc0c with SMTP id ffacd0b85a97d-3926c69b260mr10806525f8f.46.1741851746274;
        Thu, 13 Mar 2025 00:42:26 -0700 (PDT)
Message-ID: <7977cc2d-d654-49be-8bf9-9d3fe9286857@suse.com>
Date: Thu, 13 Mar 2025 08:42:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] CHANGELOG.md: Mention PCI passthrough for HVM domUs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
 Community Manager <community.manager@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Huang Rui
 <ray.huang@amd.com>, xen-devel@lists.xenproject.org
References: <20250312040220.2624329-1-Jiqian.Chen@amd.com>
 <a8919be5-020c-47f3-8bfa-02dab2f1e2ca@suse.com>
 <Z9G39ULeHr7fp9ur@macbook.local>
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
In-Reply-To: <Z9G39ULeHr7fp9ur@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.03.2025 17:36, Roger Pau Monné wrote:
> On Wed, Mar 12, 2025 at 09:51:09AM +0100, Jan Beulich wrote:
>> On 12.03.2025 05:02, Jiqian Chen wrote:
>>> PCI passthrough is already supported for HVM domUs when dom0 is PVH
>>> on x86. The last related patch on Qemu side was merged after Xen4.20
>>> release. So mention this feature in Xen4.21 entry.
>>>
>>> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
>>> ---
>>>  CHANGELOG.md | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 7201c484f899..b6de9b72ea7a 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   - On x86:
>>>     - Option to attempt to fixup p2m page-faults on PVH dom0.
>>>     - Resizable BARs is supported for PVH dom0.
>>> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
>>
>> Aren't we still in need of SR-IOV support in order to make such an
>> unconditional statement?
> 
> I view SR-IOV as kind of orthogonal to this: SR-IOV is not
> supported at all on PVH dom0, so it's not just pass through, but the
> capability itself that won't work as expected when using such devices.

Hmm, yes and no. No in so far as I as someone who simply wants to use Xen
would read the above statement as indicating full pass-through support.
Which first and foremost includes the passing through of VFs.

Jan


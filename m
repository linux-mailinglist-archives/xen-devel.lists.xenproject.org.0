Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B614AB53812
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120492.1465413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjSM-00015z-Po; Thu, 11 Sep 2025 15:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120492.1465413; Thu, 11 Sep 2025 15:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwjSM-00014W-N7; Thu, 11 Sep 2025 15:43:30 +0000
Received: by outflank-mailman (input) for mailman id 1120492;
 Thu, 11 Sep 2025 15:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwjSL-00014O-NP
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:43:29 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fb17bc5-8f26-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 17:43:28 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b0411b83aafso130796466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 08:43:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31283e3sm159623666b.24.2025.09.11.08.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 08:43:27 -0700 (PDT)
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
X-Inumbo-ID: 0fb17bc5-8f26-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757605408; x=1758210208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZalBOOkrRJa5IA8T/hiJ81YAsRHcOaaxM0Uyj8g4wlI=;
        b=BkstLBpKIGJ+pNRz565iMhQI0aNW2ZwRTIyCtXRnN2QE3Im3rvBWRxFOrg3hyDVVHq
         Mv9+XIOzpNC3f6atCwapqMUmML2mbxs79RnfJv9P8ni8pqm705lp2/yA/s3JZKZx1rcg
         nRsc0qtB64VPGrGwLtf7lAbAHFzCqWKw14iKOfCAYhpfN4Qqvh13YJXx9AXTf7mGM4RS
         ijNUZUEXWSg7KmIS7eouBF8dZCzZll3ceUgl0p4W3eNaylpAillNAqbwPBmNwp2/TE0h
         jMuX3+8aeFZrogxnhMyTj4LkowxPvZAp8G0mt9BPw9p+pURyNQg+/ugvSpk2pUc5WBrs
         ElkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757605408; x=1758210208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZalBOOkrRJa5IA8T/hiJ81YAsRHcOaaxM0Uyj8g4wlI=;
        b=thlTXP6KLbK0Joh7UD1FLUkls55zJExrPZp6k+V/Jr3DWcPvedNRxroiqEtdKCFTPW
         Pl31zXIq/SF2wTwHNrosTGQ4KQNTliPdh4l9k8SAzGTHY9rdfBgDrbDRg9oMSYEMelIy
         p2B0POGAjeyIR7l3e2YdiMhbtfJQGjwK55dxO2jJC3VbFv644WUAImVo+CNc1siofPKp
         cNNCEridltQ6qRSUNrZv1uSLnAHp6QStfD3wTp+vt7uchmM95pWah4GhbXrLjnHbymkO
         PoMU+ZevYC1TUs5V71BhLWMNiNoiwlAmkbr50gfkdJE0WHDGkQEwm7EsCHmmA2g2+2C1
         pF4g==
X-Forwarded-Encrypted: i=1; AJvYcCWsPDVNEwb1p/H5udziI8s2aNAGmnWFxA0XbHj2g7C6cxo5Avy01i8BqDhO6MTvh35NdmOxcpJG19Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyo+w2NUVf+wUl/YyYJ1p4EreRq0o/4A3NhG9RQ+YHeX+dAs0vP
	K+ptP5zTwPMuD7aGndqLx6Ag5tUizkezE6mir6yRszYNXzImmBEoLcr+VdCCqpZnhg==
X-Gm-Gg: ASbGnctyDHMvWSzkz5iBv7rbmmHvn9qc9MmdaXoaukzLTkJEp7UFLQmzI/45Ksv83ih
	iJTQdGM6bGIdkFG90LydsRtxBwBVRbbEmwEX58d7ESkhN16XwloJB3VBbBPIlph38gaH9B+r0zK
	IrySyepo3f+MsdejRQXs2jrptoyDJ1R5c+Gm4/AEaxk423ck9Fnh/K+MSAAeMUm/CRJ9SCOzTcD
	3JPYtuI0x9ao9kpvHTywUpoJR5KjnkAeC4QwSEZr9g7rlQvtOpUZrQAEmWISRTaX00CDAgHf4KG
	orHar+n2hCwxlHgPq3C8x3xPPIL7HLX7o/DuyW2NlkZmMSbe9MG8U7pebdtP4jXSNrfJwnAqNUQ
	mN4/KwBcVoi9jbaOxjwKfxw7ZVjlqey8GVJpDp6YNWv4dn6oHsPc4FniArPC29rnp7bSNEaxWnJ
	2sO6/y90xCg+Jnkj4fiw==
X-Google-Smtp-Source: AGHT+IHCpHmEpSIB1MGnmSybZH/FMjJf0nTIZkntNo/f9fUR5EkVbkVoubCmRO356LveC2TrdXnOTw==
X-Received: by 2002:a17:907:3f2a:b0:b04:9d90:a7e6 with SMTP id a640c23a62f3a-b04b1741ac2mr1987530466b.55.1757605407865;
        Thu, 11 Sep 2025 08:43:27 -0700 (PDT)
Message-ID: <6b616feb-8984-40c9-b7c0-8c75dca65596@suse.com>
Date: Thu, 11 Sep 2025 17:43:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] libacpi: Remove CPU hotplug and GPE handling from
 PVH DSDTs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20250911115308.16580-1-alejandro.garciavallejo@amd.com>
 <20250911115308.16580-3-alejandro.garciavallejo@amd.com>
 <daf8c564-80ff-4480-97b4-7c86206ba36e@suse.com>
 <DCQ2YNMO668H.CG938HPXECLC@amd.com>
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
In-Reply-To: <DCQ2YNMO668H.CG938HPXECLC@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.09.2025 17:36, Alejandro Vallejo wrote:
> On Thu Sep 11, 2025 at 5:07 PM CEST, Jan Beulich wrote:
>> On 11.09.2025 13:53, Alejandro Vallejo wrote:
>>> ---
>>> v2:
>>>   * Adjusted commit message
>>>   * All other tags except S-by moved to patch 1.
>>
>> This will want backporting; I expect finding a suitable commit for a Fixes:
>> tag is somewhat difficult.
> 
> I'd say it's the patch that needlessly enabled GPE handling on PVH.
> 
> Fixes: 062975dc9441("acpi: PVH guests need _E02 method")

Oh, right.

Jan


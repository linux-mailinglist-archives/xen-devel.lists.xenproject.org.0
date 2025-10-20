Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546F9BEFBD2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 09:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146012.1478506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAkez-0007z5-Pi; Mon, 20 Oct 2025 07:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146012.1478506; Mon, 20 Oct 2025 07:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAkez-0007xf-Mf; Mon, 20 Oct 2025 07:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1146012;
 Mon, 20 Oct 2025 07:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAkey-0007xX-CZ
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 07:50:28 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707ea979-ad89-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 09:50:26 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3f0ae439b56so2970467f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 00:50:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5bab52sm13811498f8f.22.2025.10.20.00.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 00:50:25 -0700 (PDT)
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
X-Inumbo-ID: 707ea979-ad89-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760946625; x=1761551425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2AVMTbuE9hXKs1hVmKfa47hih711OJ9ionbspIQ+ilc=;
        b=gKZmnUW7lDzazBrJ/MX9/GSmatwtVZIOcJSEuSo9Y3fcxoHGkCMzez6KbkPbz+D5hs
         VKBWCeMAULzHu7ojR8Z1i1Gb3NQG6hMskOg28zuTmzoRh9QR3bFQXqKRE+iiBOUwxb+i
         93NnZMV7O4gGIEXj3PzQ8n3ZWssOpiuCbAVBBtBHCrTX7u95rHdBui0TwXUfm4K2wuDq
         7AhCE3JaNibQObB8/KeCcTr6zQmMxArlh2AwRUUu+h0abFtuKMaeNJvSF8IinH++0OGe
         CfW+XBM7Hj7YTn/b99jRp4XuJF7mS3lR66GzfWTBqp3yUpdK401nnWeSpgyNXE4110Us
         lTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946625; x=1761551425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AVMTbuE9hXKs1hVmKfa47hih711OJ9ionbspIQ+ilc=;
        b=nFfPIIZ9WkuK58UqEYGYz4zvg936ifI/Qs/yUqtCWXXaAeuqXKE3ZgnCcYzm/9MOKx
         WxJAR0LBnEBwGgyRx2K1axTzTdxP+iSONe204EKKt4v713Lqs8eQ3zxjuBVJFR4VFQ4W
         pikG1HFjiWK2w29gZEmnT+ZMWAcdplOIdg5LM7ysdNKUjuM+y1b4qIpr1yJUDbwfepfp
         su8Nus5QsC25Sibm2ipC/MOx3cDW+lCPDW1S1lg8hDObofdENfxuDmn7xl92rTnwZFYh
         PNro12MWWj1zVmQpYcToUkIC0WfJPR6ChsPHspLZzCjLgX2U13Qefhj/W76Lb38be1Ph
         pI5A==
X-Gm-Message-State: AOJu0YwGAwQYsWoWl1Va3xvv4bjcBWN4NxXr5MnlxwgM3Am/NFDBIyV3
	bc+DKtwx23OFhVQnWhb1XE61oExX7Z06jAGBT2t6YSkD6RLhc+D9/E3z3H9GMOWpFQ==
X-Gm-Gg: ASbGnctBIslVyyPc94z2Asbr+etqEQxw5Ca5YwceFDRDevM3aly6rQvKLEEkuLfDQZW
	mOksJLDP4XV9ZaulPzQ0IccGUjioi1fTxa21F59u3VhIPXPZQW3urpkqJ1bL9fKOJmA1Q+CPeUv
	aoyizpvEfZgymnSHYkgASuEBykp+1V5d/d8jUsX8m4hKLji9PvXViiy3lRBuPlbEMfxcvOtgAmX
	SO4tN0KkhbWsIwQPz8vgoOjPIAZeLzWVOTI20fTwa8iMJoRCCuaRRK7Lzv09HqtxkAwyQpTgpmD
	vUauaIHD/eLXCYG048RM55K4Rhp+EwzmOlkPcCQEQaP/6rYWAyLD+jYztXzhVnseL8UI7EGlCeI
	CLFmiWOnu70eNsgn8uQNV64rjDCQDtAOqZPIhx58aAhiKCj/d4uWIaSgthK+HlqCsqGO+HOYQ74
	0Vss6IDakNLyAVLhY0qE1rXnAdlNuZOydSv/elGZR8339bs9rXluhl82xHrP4M
X-Google-Smtp-Source: AGHT+IF3kNNuFWb7kNd9lmeCnDuXmdnmUTMdsxQpAXAE3F0UP3oM5LRLMFnLfhFDZf1pQCztzTZDaw==
X-Received: by 2002:a05:6000:2dc3:b0:426:d54d:224d with SMTP id ffacd0b85a97d-42704d7ebbamr9134942f8f.27.1760946625330;
        Mon, 20 Oct 2025 00:50:25 -0700 (PDT)
Message-ID: <d41d4d43-de76-4454-a198-6463feb9df8b@suse.com>
Date: Mon, 20 Oct 2025 09:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/libxc: fix xc_physdev_map_pirq_msi() with
 PCI segments != 0
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org, oleksii.kurochko@gmail.com,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20251017141434.15205-1-roger.pau@citrix.com>
 <CAHt6W4dAEBH_9EF4nXB6_W0ehpawKpz+bMpZ__vN29OdVZxGQw@mail.gmail.com>
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
In-Reply-To: <CAHt6W4dAEBH_9EF4nXB6_W0ehpawKpz+bMpZ__vN29OdVZxGQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.10.2025 06:46, Frediano Ziglio wrote:
> On Fri, Oct 17, 2025 at 3:26 PM Roger Pau Monne <roger.pau@citrix.com> wrote:
>>
>> Otherwise it's not possible for device models to map IRQs of devices on
>> segments different than 0.  Keep the same function prototype and pass the
>> segment in the high 16bits of the bus parameter, like it's done for the
>> hypercall itself.
>>
>> Fixes: 7620c0cf9a4d ("PCI multi-seg: add new physdevop-s")
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> I think it's 4.21 material, as otherwise it's not possible to passthrough
>> PCI devices on segments != 0.
>> ---
>>  tools/libs/ctrl/xc_physdev.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
>> index 25e686d7b389..1307d6836d72 100644
>> --- a/tools/libs/ctrl/xc_physdev.c
>> +++ b/tools/libs/ctrl/xc_physdev.c
>> @@ -79,7 +79,7 @@ int xc_physdev_map_pirq_msi(xc_interface *xch,
>>      }
>>      memset(&map, 0, sizeof(struct physdev_map_pirq));
>>      map.domid = domid;
>> -    map.type = MAP_PIRQ_TYPE_MSI;
>> +    map.type = MAP_PIRQ_TYPE_MSI_SEG;
>>      map.index = index;
>>      map.pirq = *pirq;
>>      map.bus = bus;
> 
> Reviewed-by: Frediano Ziglio <frediano.ziglio@citrx.com>
> 
> This was tested on a real machine.
> 
> About MAP_PIRQ_TYPE_MSI and MAP_PIRQ_TYPE_MSI_SEG, do we need to keep
> ABI compatibility or we should just remove MAP_PIRQ_TYPE_MSI_SEG and
> make MAP_PIRQ_TYPE_MSI consider the segment ?

Assuming you talk about the hypervisor interface, could you explain how
you see breaking ABI compatibility to not break anything? These aren't
tools-only interfaces, after all.

Jan


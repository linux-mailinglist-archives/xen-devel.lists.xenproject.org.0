Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 139DAB51802
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 15:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118269.1464121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKzg-0006Q0-Tj; Wed, 10 Sep 2025 13:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118269.1464121; Wed, 10 Sep 2025 13:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwKzg-0006Mq-QV; Wed, 10 Sep 2025 13:36:16 +0000
Received: by outflank-mailman (input) for mailman id 1118269;
 Wed, 10 Sep 2025 13:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8l2o=3V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwKzf-0006Is-GS
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 13:36:15 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ea233bd-8e4b-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 15:36:13 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-621b8b0893bso8815340a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 06:36:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62c0123f23dsm3378742a12.25.2025.09.10.06.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 06:36:12 -0700 (PDT)
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
X-Inumbo-ID: 1ea233bd-8e4b-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757511373; x=1758116173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JmV45LpAXTHcg/3ZeB8mIxSHX3C+aS/dsTEggteiobI=;
        b=TzLwKkpcPFh385jKXiLn775vsKtE3v38eY5Y4HCp9AWeQi5eDw9MrZZGSM//vpnv+U
         78tTJr7K0ir0rG0ofiN8HoOmR4duJW9co1jMTE0J+NVwxQvPdOJqoiNGhJZH4zj1y8qb
         /q3bUXUcWQt0g0wtzjxNrZ7Y9aa8s44wFzk7Zr2PBXln8rjfO48dCEqzK5uICTP33OcU
         o2zKb5CcqXIFcwDK1rhaqMOWEmpJeksCBeQ50w/GxQtP9HNRxqBf8hHBA4hOTMegN5iB
         WC5c/j4iPsiMeU9ArzWj8POcRbGD4lrnuGJbznPa8EDWm59C13V2ibz1Dn+KZgb15MoI
         DN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511373; x=1758116173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmV45LpAXTHcg/3ZeB8mIxSHX3C+aS/dsTEggteiobI=;
        b=OD32+iGwqgDL3IxQAjMxa2BJ5IQ3qSdpagroMtdmTtn5Wi37+OvYdMeROzjR+J8r2C
         m4ctXIrmXL3kYocPaRkB3xjuYVgiin94q5TdWiq6v1udlAea4SH35SnXN2A3NnEPTSCk
         VxWopZ/5E0kTOsoxwZQBFhZyAQBodSTqZUXs4Dh3N8Pq2hrgqsp3SYM/QIJNa7UH8GmL
         dvfjZ0sG5udXpgIL0qL4Se3GT209KfwjpL7yinlBM3SwSp9A6p36dnL+w+LOk8DzgxKO
         iviD+GhdrALTpHfCN3S7uCyy7RXy7VEcxwrUT/qgJoS58yFW5awfUxItM2WmMmPgkros
         yqUg==
X-Forwarded-Encrypted: i=1; AJvYcCViXW+iDHag+1jVYbk4Kme3Nwl/zJrpzjFbj4bS6n1WUsTTQYlzyM4BW6HTdU3P24hGGezUzFRsuWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywlu0lndCC4nUL/WiPk7DaSc2euujOnwVdu/pYaPkVidRkqyW4x
	AXr3yoKbc8Z08uOPXpGw1GBdIYbVRaPsJAFa0V/q+MCrtZfytpD62fNloD53B/oK7G/roEJW0KG
	CCrk=
X-Gm-Gg: ASbGncu/xbSriZbRBjVvW3pAwNA/CV3+BMIdOwoyRDtRWw1PQO+uyaM9dbKcpx78PbQ
	G0QoesLpnO+lbbwJadknm5GuBlOeQc4kVWJjq9hsNFL0v48ZrwZCvUeXAqT//3Hrfh8CwaE17bB
	tHsbvMrAaImW8KQ7lxCK3ZDTJcKGhcSYw8ssGhRtndl3pLDK6Ga1bYXu7wVYfBCxdxwec2PXk8j
	V+195UarVQNtaQcTa6AAobKm4mS7e6TDvm1rLAOlUkhU9/TpK/AhMP309JHs1UAYqVPd4xe0GM6
	XQVgL2gn0AzWSIggtvPuRiNVx0Dv9sL6Sxk+34ZKOhzylXFjleUnCuFrFFEPh0b0K3O+Jss6kdV
	6EWDmxSzPW5zrXRdKpOqrblCYrhLs0StUNQ1JTqUTB3M/PNP2nEtgGCbImXCNx0RSBqPuY1fXS2
	Ias9ZC6eMX1CVOIcNupw==
X-Google-Smtp-Source: AGHT+IHmJrFbeQw21awAqUVBng12qFt5BFFbAZ79vsHf38XFsWr01xkzHbLIXZ0Olfs6K8yMLdOJWQ==
X-Received: by 2002:a05:6402:505c:b0:621:ceb4:12fb with SMTP id 4fb4d7f45d1cf-6237ebc6feemr14048594a12.20.1757511373125;
        Wed, 10 Sep 2025 06:36:13 -0700 (PDT)
Message-ID: <3c678b60-4e1d-4c51-bfe4-efe3acee4e8f@suse.com>
Date: Wed, 10 Sep 2025 15:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/IO-APIC: drop setup_ioapic_ids_from_mpc()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e2e54b68-1521-4bf6-9cb9-5703ed2a69fc@suse.com>
 <034dd6dd-4e3f-4353-9a11-7a0ebda9a664@suse.com>
 <bbe33d31-949c-4bf1-96f5-598b21faf149@citrix.com>
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
In-Reply-To: <bbe33d31-949c-4bf1-96f5-598b21faf149@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.09.2025 15:26, Andrew Cooper wrote:
> On 03/09/2025 8:55 am, Jan Beulich wrote:
>> Along the lines of what b89f8f054f96 ("x86/apic: Drop sync_Arb_IDs()")
>> said, the function is dead logic as well: All 64-bit capable Intel systems
>> have (at least) xAPIC (if not x2APIC).
>>
>> Even if Eclair can't know it, such code is violating Misra rule 2.2 (dead
>> code; we didn't accept that yet, but - where possible - we probably would
>> better follow it). Depending on one's reading, this code may actually be a
>> violation of rule 2.1 (unreachable), which we did accept:
>>
>> "Code is unreachable if, ..., there is no combination of program inputs
>>  that can cause it to be executed."
>>
>> Otoh it's "only" __init code.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The code change is fine, but the commit message should be first
> paragraph only.
> 
> The first paragraph is plenty of justification to make the change,
> irrespective of anything else.

Well. I wouldn't have added the other parts if we weren't where we are in
the release cycle. Strictly speaking, with them dropped I can't put these
two patches in right now. Oleksii, may I ask for your view please (on
both of the patches, as they're both similar in this regard)?

> The other 3 paragraphs are musings on an area of MISRA where which is
> unclear, or even disputed.  The code here is statically reachable,
> dynamically unreachable, and trying to argue this in terms of dead or
> unreachability detracts from an otherwise clear patch.
> 
> With a very strong preference to have the commit message be only the
> first paragraph, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks (also for the one for patch 2).

Jan


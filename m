Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CBA54480
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:18:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903072.1310990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Qs-0002dT-I0; Thu, 06 Mar 2025 08:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903072.1310990; Thu, 06 Mar 2025 08:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6Qs-0002aL-F1; Thu, 06 Mar 2025 08:18:18 +0000
Received: by outflank-mailman (input) for mailman id 903072;
 Thu, 06 Mar 2025 08:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tq6Qr-0002aF-4V
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:18:17 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 868e9e88-fa63-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:18:04 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so185819f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 00:18:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb799fsm1217485f8f.2.2025.03.06.00.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 00:18:03 -0800 (PST)
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
X-Inumbo-ID: 868e9e88-fa63-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741249083; x=1741853883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8du1sOQIR0d+jnPSMbQeIU2R0uYfx6ZrggAMNsn9jLo=;
        b=RRnqLP8iTclwtu4G/kcRkE10ZNMFiTIxDAs8AxryquoDeVMqfhbUhvibeAAE6HBJxy
         5FiBNKwgfFL1DGKwsoduo0ce98W4k3Q9ef66vYczoSsJmrr4U+xgGNYAL0PDlpbvV1mj
         DkZ9OtcuND2H2A2NOd4BBQTDf97659Q85eVvBu7EYWtXXKNy8+skgRPolQ26IofJCmAa
         bHW137FbfymVaLEjwtcPnuQ18OT4yu/06K3LSlsu/vOO0tGr31ro9h8US1sPEnvPbFOd
         c/GzPBWFhvPJldMp6TOEm5e8JwbRB7uTv9/2vOsqRC9fyO/0ldMqGxfdRjUCu2vr2V08
         1ogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249083; x=1741853883;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8du1sOQIR0d+jnPSMbQeIU2R0uYfx6ZrggAMNsn9jLo=;
        b=hyt657eIci6uONL6kDDT2gexKWSmRYZgQa3ZnHCIDYVWPSoIkAFgs5YeEfEzIHCWXr
         AMivtQXg52MQ76bcDGKzQl4UkQTfRRtq0uuL7TyUGElqklxLEfUloLdcfhkjBu85KfuO
         8MT2dXLdg6650BHGfe7g8rJLdpxIlgubWC5K7i9hY67LAagzula0GGu/Fgt5SVzXatKw
         7UHcR1h+4g4PwvlYs7cHYtJ266Waar4TrN0qHg5kAffk/OHXJJiv289ZjSrC52I6O1VY
         iiWlR75N9Ztn70mhjehHsHpuDnHVDnCVRBCh7o7NlMRmJcCygluyaMc9T4iMgYTJU4pr
         1JsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY/Lzi4RQ5YEbR3mB38FRWW8q8kv4OHGxoLtlCrWhQaQ+h8WP8FITW7WkUuRvp8ZJhY3QhbYlTpM0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKOnY/mBeXk55CXJg08HarUQ5AKYbwv3MnY5D3r6L8i+9pZbkU
	civ5p7/Z2ZRtUcKO6U0xhQM48Eyljz+NIfoGRaxR6wgjdiHoAAMWT31WHOs6qA==
X-Gm-Gg: ASbGncuhisTt/BR4kSqSP9fsB31+4Gilzf4Sy/y60HXSc/4PgieVT7aRXDzeSLlah3Z
	8juPvqZ1VIPVZ02gAipH6H8BphP3RgkZrjlKjE7FfC6hViCfD+SOs0eM+/K3GPuu4iIc43Ar2WQ
	MP31Hx3vXs9jnJuLamSkLXrDOnczvyqp4o34T1ZFrbf725KrpZxa9T8ZItFqUSYD0mmoy2Af+kV
	ktnhxlEKvIaUqd28enMFO5iF09Ea+LggLVKIyaAUbpmN2n881QAIrFomCOcK1YpoHg93UOik7jx
	ZDoYUbUZrWqKM37+U0pJGu2RbuyU5olPOYrZAFLpimyHuZ4wZyjr20/hiym34/mOyLV9T2H9Z2v
	Zu01RM/QSQ86D59jNlP105mvmNuwkgw==
X-Google-Smtp-Source: AGHT+IGO+w/eZuFhKGp2pBpv8lBqBeOVsZhwWhMQB93+3bDlRbdoMCukw6yhbPpWqEAgNqf14YSRvg==
X-Received: by 2002:a05:6000:18a7:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-3911f7c17f2mr6456133f8f.51.1741249083420;
        Thu, 06 Mar 2025 00:18:03 -0800 (PST)
Message-ID: <ac947068-02ee-45f0-a627-e0f025a81cc2@suse.com>
Date: Thu, 6 Mar 2025 09:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/3] xen/rt: address violation of MISRA C Rule 8.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com>
 <e3c6457e50d61daa05fd9c3a7c71b06d912216a0.1740476096.git.nicola.vetrini@bugseng.com>
 <fc6c0113-484d-4eb5-8b66-0ef547d8dbf1@suse.com>
 <alpine.DEB.2.22.394.2503051524030.1303386@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503051524030.1303386@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.03.2025 00:24, Stefano Stabellini wrote:
> On Wed, 5 Mar 2025, Jan Beulich wrote:
>> On 25.02.2025 10:38, Nicola Vetrini wrote:
>>> Rule 8.2 states: "Function types shall be in prototype form with
>>> named parameters".
>>>
>>> The parameter name is missing from the function pointer type
>>> that constitutes the first parameter.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> Changes in v2:
>>> - renamed function parameter name to "elem"
>>> - changed prefix to xen/rt since only that scheduler is touched
>>
>> Looks like you committed v1 of this, and without a maintainer ack?
> 
> Hi Jan, I took Juergen's comment and his maintainer ack, making the
> change on commit: https://marc.info/?l=xen-devel&m=173978187314898

Except that aiui Jürgen isn't formally a maintainer of the RT scheduler.
Nor did you change the patch subject (as requested by me, and as reflected
in v2) to properly express that it's an RT scheduler change (only). (Less
formally, with the lack of response by the actual maintainers, taking
Jürgen's R-b to fill in for the missing maintainer ack is likely okay, but
probably should have been mentioned explicitly. Recurring lack of response
by maintainers ought to perhaps result in reconsideration of their
maintainership.)

Jan


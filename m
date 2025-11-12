Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A03C50BD6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 07:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159473.1487792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4XB-0000Hy-MW; Wed, 12 Nov 2025 06:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159473.1487792; Wed, 12 Nov 2025 06:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ4XB-0000Fr-Js; Wed, 12 Nov 2025 06:40:49 +0000
Received: by outflank-mailman (input) for mailman id 1159473;
 Wed, 12 Nov 2025 06:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ4XA-0000Fl-RO
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 06:40:48 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8524168c-bf92-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 07:40:47 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b31c610fcso343080f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Nov 2025 22:40:47 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a60:8d0a:6473:d951:bd22?
 (p200300cab70c6a608d0a6473d951bd22.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a60:8d0a:6473:d951:bd22])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42abe63e13csm31985301f8f.19.2025.11.11.22.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Nov 2025 22:40:46 -0800 (PST)
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
X-Inumbo-ID: 8524168c-bf92-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762929646; x=1763534446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s/MV7yDOzfqCSM/45fhpa5D1WC2nfoCMfFecxUzX42g=;
        b=dk7F86b9pGgb8CkGiC7ukN7rQbBYn1JRGKHrZtm/L2zUifaBM10bSy/blBRdRSNHCR
         d6YnYHXdn8dM9v6AK7sEhxA+dRyd6sOpYF8fYfsNCa2T6rJUZXy5DWrIdBQViHDxyGQN
         ncZGbB7N+7SXAcsEv9fjRPpvA2kqGb6+pv0TKR4GSXLyAtXBfWqOvNJbEYQx4KX/YKbl
         MrpbuDQJUeD9P8Iyf3488cuopzhtj2fyf7bRYD2UkDX/UP6txiaAndHRm7K8wANtd7x3
         eGzt6QtNyIVKhMq9sjghQgeko0O3bV/kDw4TP0Fk0R79POr7wwaXRdvbRTVT0/ymnyBe
         OWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762929646; x=1763534446;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/MV7yDOzfqCSM/45fhpa5D1WC2nfoCMfFecxUzX42g=;
        b=j1I0u8BTVHNaxWYj5hOowlxHIOWBJE+5cqQlP0vPjt0nHLlf00RpBgEGVHO+98CSA7
         571tHeohnk7CKkO4YXqap1gxJbDDHqr1ddRuka9sKuictOYFoxezWojre3SZYO3WVAgZ
         w3HdJUmzyyikNJkSmJxWilLDBoYVr45fl7TOxhR6gpry/2+VbnUhuFKSLifBFYCYZztb
         JwUT0Y0TyPsRM+mdtaxzEe8NOOl1uUrGjO/ByybYtgBPoQHCGVfTNi6FZU5a/t2Ajygg
         aRSPbRDjgthxqgNKYj0QEAKEi2CbGD6xmE6DY9BpomkAVatIp0uvbKm52oQHvsd20ot3
         DQDA==
X-Forwarded-Encrypted: i=1; AJvYcCWG6ksc9ERnfA/e2Y7cKgrpE4kNkyGkXxmq7zMW2tWv3Z+aGDheclNoLTujbaEZ6JkeqNU2IPghEOc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPmGAue+6OHfnThFf/bT+IBPuWswCyCmxF4bw0WjHoR8He8kzk
	u3joFoiqntVlsWrR5f9dvLxHdS55wG7VDbuSy0vaolgaEdZHDuuNSLsjCJCiUQnDyQ==
X-Gm-Gg: ASbGnctkAbOuIIKDxlSmJCqLNb1/2DfgbGUo0QTuU8Jfh/NKAar30aznP0QBZ6UUzFL
	9vlw+WooRpyRa93+dSFIdRCCAb+75Ld9pdSPxXk4yKvx2YYLIInqYy8HG71vg06/O6L76QBdY+h
	/fkx6wGbqbotl49Npdw80k+msBCwfbamwfIKEFx5Xyky3VNYYDs77s7SYSKdvFLKnCdptJcrUGw
	U/fwcsTqpwqgSTjTd3JqIMLcBK3ngBN7+dN3othdFNxuM0HSe/i4UcqyOmXEnYhrKy3GtFR2vzK
	b7Wd2h30Adm3bRNtGO+IdY5ncBItUpW+jUtpB8178xhcUVwP542XbLw0LDy6B4oEm1VDd00dZz8
	iy090SncizuCnnVqOVUnFYwj8L08gKDmkG6vo3xj4R3ujjFHADlvOSAOOXAszEG5lNyGJS8G0Ok
	vciFR0z9eSdKJ5eYglDzUPxB27AstXpzYoLJwGtkOo1CbGNa3ECe+QyfGWscgeDwOsPjOWR2/MI
	KaNnro9cHDI7g0vK6Vi2Z6xlJ8Zq70m2IuLnw==
X-Google-Smtp-Source: AGHT+IHVef6uX0+z56B9hXwP4OntPwVIgvlxMFNOYQE6KPCWLeplfvW0rMA71+q/9Dokesjg7P0CBA==
X-Received: by 2002:a05:6000:250c:b0:42b:300f:7d8d with SMTP id ffacd0b85a97d-42b4bdaeb5bmr1255497f8f.34.1762929646416;
        Tue, 11 Nov 2025 22:40:46 -0800 (PST)
Message-ID: <b829a9dc-ed1d-45f9-a56f-ec288e0d5523@suse.com>
Date: Wed, 12 Nov 2025 07:40:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7] x86: make Viridian support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
References: <20251031161716.1222956-1-grygorii_strashko@epam.com>
 <a4d3eb8d-17ea-4d3c-87ef-ba5c3477b8c3@suse.com>
 <edb590e4-340d-4a0f-9543-0dfdcc7b54b1@epam.com>
 <210edee7-8525-47a9-8191-ea7d94db5fce@suse.com>
 <0a5af540-214d-46cc-93e5-f0266bb79064@epam.com>
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
In-Reply-To: <0a5af540-214d-46cc-93e5-f0266bb79064@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.11.2025 19:25, Grygorii Strashko wrote:
> On 06.11.25 15:47, Jan Beulich wrote:
>> On 06.11.2025 14:42, Grygorii Strashko wrote:
>>> On 06.11.25 13:35, Jan Beulich wrote:
>>>> On 31.10.2025 17:17, Grygorii Strashko wrote:
>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>> @@ -4231,8 +4231,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>>>>>                rc = -EINVAL;
>>>>>            break;
>>>>>        case HVM_PARAM_VIRIDIAN:
>>>>> -        if ( (value & ~HVMPV_feature_mask) ||
>>>>> -             !(value & HVMPV_base_freq) )
>>>>> +        if ( !IS_ENABLED(CONFIG_VIRIDIAN) && value )
>>>>> +            rc = -ENODEV;
>>>>> +        else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>>>>>                rc = -EINVAL;
>>>>
>>>> I find the check for value to be (non-)zero a little dubious here: If any caller
>>>> passed in 0, it would get back -EINVAL anyway. Imo -ENODEV would be more suitable
>>>> in that case as well. Things would be different if 0 was a valid value to pass in.
>>>
>>> The idea was to distinguish between "Feature enabled, Invalid parameter" and "Feature disabled".
>> "
>> But you don't, or else the addition would need to live after the -EINVAL checks.
>> I also question the utility of knowing "parameter was invalid" when the feature
>> isn't available anyway.
> 
> My understanding here - I need to drop non-zero "value" check.
> will be:
> 
>     case HVM_PARAM_VIRIDIAN:
>         if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
>             rc = -ENODEV;
>         else if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
>             rc = -EINVAL;
>         break;

Yes, or alternatively

    case HVM_PARAM_VIRIDIAN:
        if ( (value & ~HVMPV_feature_mask) || !(value & HVMPV_base_freq) )
            rc = -EINVAL;
        else if ( !IS_ENABLED(CONFIG_VIRIDIAN) )
            rc = -ENODEV;
        break;

Both have their up- and down-sides.

Jan


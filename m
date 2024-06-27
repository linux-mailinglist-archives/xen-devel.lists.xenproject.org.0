Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B5E91A9E3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 16:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750163.1158408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqVU-00011D-Aj; Thu, 27 Jun 2024 14:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750163.1158408; Thu, 27 Jun 2024 14:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqVU-0000yi-7t; Thu, 27 Jun 2024 14:53:52 +0000
Received: by outflank-mailman (input) for mailman id 750163;
 Thu, 27 Jun 2024 14:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sMqVS-0000yF-OH
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 14:53:50 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ff8c5eb-3495-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 16:53:49 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e72224c395so92622291fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jun 2024 07:53:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8d81d2ab3sm3717860a91.49.2024.06.27.07.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 07:53:48 -0700 (PDT)
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
X-Inumbo-ID: 0ff8c5eb-3495-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719500029; x=1720104829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VPRSFFzVa74HeoYnZqoRBtBGb55QUBzKi/PYfDDlIOA=;
        b=JPcRn5Q8h3WBdFDheXrk+G+Ii7zQv4PRFLW+qvKGr3w+7l05+aCrekaWkMj6cSeB5k
         x9zKnFOXXhakTNlNmw8bOqGKAReXa6I+x4M1DXcDTM8HCBJQohwB3o3x1rHmA/JieZ2o
         /4XxeHDxWH9FIgpo1GHFQJtR5qeLpapUQTiC4OZL8kSVR0Lt4UghxsqQYnUgmFCFDPKX
         KwF+AMikplj1nOmBgVWNI2i17KY/Fo9bXsvQ8W81OvnbpTaQ46lRU8gIOK67KoDj8q5S
         PXCpc5uj9NXfa+cvLTl+20hgj+Eh4+OKZ2EiadtQfQ1YJq3ctZac45npp2SQToiCzBAY
         BXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500029; x=1720104829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPRSFFzVa74HeoYnZqoRBtBGb55QUBzKi/PYfDDlIOA=;
        b=e8rO6C//7NKNDRETzlccmSKGAOk/dE3dlShM4sgfYrFeW368TiWc7lXzyX/GDOg8d6
         CKRV4Ac4CzWGXbB2ys/WDsJvnQDRHAaz/zwEKFMUnsAfVnp3mztH7a3eiauEixjaruYO
         tk1hNhYwkBUqshFY2L69M81JG6eHOKVV2sAk7pig55aj3xXVUbFVfdQaM87gnxTzAkvp
         lXcOuJOLyCCPJFBveWE6Md5oGyjAStQ+h1FDFzxeJk9XKYmN8WEgchuYhK4WBG8PmVng
         //9UllJ8DMi+7AtWPkP+86N5uk6OME/9aWh2+LTx4PIE1VwSliPM9cxtqnnpnSIDOrQr
         m8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrb0WUgItftheyF/SgYlt0l8sBHHxVYAaKj9wA7UY1pxbO6ilmxsicog3NuRjm5cvrTm4hIRtne4ppuIF3gObXkRQtmZPUPKbPPjdmZWY=
X-Gm-Message-State: AOJu0YzB9hOaxRfbGJLkV3ppmPR051EwY7x/6eSZDnVTTeRIMTWO/iRD
	0WbvOHrwG+EETXum36mhpyHskwaj6hFDfhyYEnjOeCKieA+d15qUiDDfZ8/NGw==
X-Google-Smtp-Source: AGHT+IFgJ+/sbw/6CAZjbA+Sy4kMzf2umTJFbSSRv2cHulIpckICKgwGFCqhOdIukgBFMu/Gxe0p4A==
X-Received: by 2002:a05:651c:2cc:b0:2ec:5b8f:c792 with SMTP id 38308e7fff4ca-2ec5b8fcc29mr80143561fa.43.1719500028884;
        Thu, 27 Jun 2024 07:53:48 -0700 (PDT)
Message-ID: <ab4384f7-572e-4c67-9bbc-a9238d0e0456@suse.com>
Date: Thu, 27 Jun 2024 16:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] tools/libguest: Make setting MTRR registers
 unconditional
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1719416329.git.alejandro.vallejo@cloud.com>
 <2c55d486bb0c54a3e813abc66d32f321edd28b81.1719416329.git.alejandro.vallejo@cloud.com>
 <fe255839-f8ab-4dd1-abe8-8ec834099a8d@suse.com>
 <D2AS8XQPR3TS.TDT0A6SPW47G@cloud.com>
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
In-Reply-To: <D2AS8XQPR3TS.TDT0A6SPW47G@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 14:02, Alejandro Vallejo wrote:
> On Thu Jun 27, 2024 at 10:42 AM BST, Jan Beulich wrote:
>> Plus what about a guest which was configured to have the CPUID bit for MTRRs
>> clear?
>> I think we ought to document this as not supported for PVH (we may
> 
> By "this" do you mean PVH _must_ have MTRR support? I would agree.

That was my first thought, yes. But then further down I adjusted my
considerations.

>> actually choose to refuse building such a guest), but in principle the MTRR
>> save/load operations should simply fail for a HVM guest in said configuration.
> 
> What use cases does that cover? With the adjustment I mention at the top that
> should be sorted. I'm wondering why we allow !mtrr at all.

Not allowing it would open up for a mess in what CPUID bits we allow to
override and for which ones we'd deny overrides.

>> Making such a change in Xen now would, afaict, be benign to the tool stack.
>> After this adjustment it would result in a perceived regression, when there
>> shouldn't be any.
> 
> Fair point.
> 
>>
>> Thinking about it, even for PVH it may make sense to allow CPUID.MTRR=0, as
>> long as CPUID.PAT=1, thus forcing it into PAT-only mode. I think we did even
>> discuss this possible configuration before.
> 
> Is PAT-only an existing real HW configuration? Can't say I've seen any.

I don't think there are any, but the architecture doesn't preclude it, and
that's a simpler model overall for an OS to work with. Hence why it was
discussed (to some degree) before (if my memory doesn't fail me there).

Jan


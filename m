Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E52B0895C
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 11:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046475.1416821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKzs-000215-C7; Thu, 17 Jul 2025 09:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046475.1416821; Thu, 17 Jul 2025 09:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucKzs-0001xy-90; Thu, 17 Jul 2025 09:33:48 +0000
Received: by outflank-mailman (input) for mailman id 1046475;
 Thu, 17 Jul 2025 09:33:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucKzr-0001xs-4P
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 09:33:47 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 222e8961-62f1-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 11:33:45 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so562085f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 02:33:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd73d1sm15671354b3a.10.2025.07.17.02.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 02:33:43 -0700 (PDT)
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
X-Inumbo-ID: 222e8961-62f1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752744824; x=1753349624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SZupwS01ctslfke6Ewc5MlhcNbPeaCqm/Cl4A8LstNg=;
        b=JVpFAZ9XP6e8XungBNGOkcrGaTv6r0WjRNj1jlSv21JiOcdS2jOAafJUV5I+JJcFkP
         z14m1Gwlv5KVjIfGuwkfjB7IRFwo2615dkQqZuUXhT2YMYRQcejb5lsyM3GDaUE7AvOf
         lvSZNj8/Jw9gOF1hT2Q1QN6zdiWpYK/yIkjItE08Lvg+XOcO2EHQThemaZgPE1VTRWJ0
         Yfc+YGFga0ql8msv2ptK1UsMJ0g2j/v0231bAe+t8LC3O8tnzGc632H/IvUvZ8phCliL
         aJFaC1tMMQN8DCgBesa9QOzCgV85QHQyNqN7nN6Rq9CfGS5LxnPVmAqyFMc/jW2jbuJF
         NO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752744824; x=1753349624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZupwS01ctslfke6Ewc5MlhcNbPeaCqm/Cl4A8LstNg=;
        b=dQUZRZgAoPZ0WgSFIrbPBizkm+rW6AjpwiCT3GF620sTgkj+081TZBtP62Dl6tMUVi
         PjrunwKR76+r7E5ICLTWyEK08m3X3fO1kvT9jJSEBYHfCsQB5oSe/Z/ntmBhxHt+uMh8
         FVDZyj4vWzx68hzDOyohLS8bZtfwNNzHwvk/sMyxFfxwPHKYxILBx03Y+W2n74DCCMGu
         JUzHIcgYN6GVuqCkzCcfbRH9kYRt4KaoQijuznB1sE3Y4NT1c4nREzeaTCMA+EnUm1dC
         6/WC84RS1Mf4Kbn9wS6WzMToX2EZR77FvcDccJ52l+PnxfGxc4wzaR8sw1oeY/poDO5+
         u/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/OP/eKATye0hPKFxhb2WVhsf3raWogsU5OSoSqBS63tmavmt3FJq0lL5euli6cl8Gw9mq/hVYlRQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTpmaHoEDaW6gptwmXBptlceaV0fUx1vly8ZujHSoaLzGHtV/h
	7dpoBQekcE2PtKw5UMeEue5IpASSrSy+poGHsrNGRlZSOapAzX3dsmd7DGEYlRlnQg==
X-Gm-Gg: ASbGncusY7C646OKb37n0uyFhrhYWa69Uj22aZ3y/98bSsX7X0yaLBymxzobvbWykHZ
	/j+fjM3jPz66r3gyd5yoYSL55tmdU6iNgnuYt6Er2mx0yJ401l4HDJUDckoBALhfobAw/DZRVOi
	pG1aqeObTGZCW5qlW9UGvUlyAufk0cf5CCUmV2EUJmjFdhBx8MRxh0mIjggkWjP+Tk9e4gcl3EU
	y7IycqYNtQ/iEIxu6Nv3yBkshTcKtHQ+ZXn3/93YWHvsiZ2OpXveR8eOR/o52sD7CLTEFMZeSQs
	NjNHRwIDohaJXihG9q6CvOOOXUc1prrFx37UuZQDkyZxwp+k4JSQMzkP5RZJvubF3ij8KjdoOUv
	CoKVUHHXTSvETmqaTUiyrOHYKcGO+2XuM0ffKEBno9t1RmwVoB/vrr5NW1F/mxYBnYe00AKx8Cy
	92SGfv0o4=
X-Google-Smtp-Source: AGHT+IFFEMjMZzb7n26w+0uU9ct2bXmh4mV314uNR8Daa6KEmTNKWMBOX2Z20KNS6y6vM3Zwa+pgrQ==
X-Received: by 2002:a05:6000:2482:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3b60dd4a88emr5362842f8f.2.1752744824304;
        Thu, 17 Jul 2025 02:33:44 -0700 (PDT)
Message-ID: <238fb250-b0bc-4572-85e9-71bbd2a940d8@suse.com>
Date: Thu, 17 Jul 2025 11:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] x86/apic: Convert the TSC deadline errata table to
 X86_MATCH_*()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-7-andrew.cooper3@citrix.com>
 <c057b1a5-ebcc-4691-affa-3a32ebf637ec@suse.com>
 <f708a816-dfa7-4ce9-b590-9802ea5f8b20@citrix.com>
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
In-Reply-To: <f708a816-dfa7-4ce9-b590-9802ea5f8b20@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 11:02, Andrew Cooper wrote:
> On 17/07/2025 9:26 am, Jan Beulich wrote:
>> On 16.07.2025 19:31, Andrew Cooper wrote:
>>> With the ability to match on steppings, introduce a new X86_MATCH_VFMS()
>>> helper to match a specific stepping, and use it to rework deadline_match[].
>> I'm fine with the patch in principle, but I wonder how you envision to support
>> a match for multiple steppings in one go then. In particular macro-naming-wise.
> 
> The Linux version uses
> 
> X86_MATCH_VFM_STEPS(vfm, min_step, max_step, data)

Hmm, yes, something like that (naming-wise at least) may be possible to use.
It'll be potentially a little confusing, but I guess we'll manage. Or maybe ...

> and calls GENMASK(min_step, max_step) but for a single stepping that
> causes rows which look like:
> 
> X86_MATCH_VFM_STEPS(INTEL_HASWELL_X,   0x2, 0x2, 0x3a), /* EP */
> 
> 
> Even in Linux, there are very few examples which take a genuine range,
> and nothing so far that we need in Xen, so I implemented a slightly
> different helper.

... we get away without ever needing such.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D946B09AFC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 07:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047954.1418273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdpU-0006zz-8u; Fri, 18 Jul 2025 05:40:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047954.1418273; Fri, 18 Jul 2025 05:40:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucdpU-0006yY-66; Fri, 18 Jul 2025 05:40:20 +0000
Received: by outflank-mailman (input) for mailman id 1047954;
 Fri, 18 Jul 2025 05:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucdpS-0006yQ-0D
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 05:40:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af032ffc-6399-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 07:40:16 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so936317f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 22:40:17 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e88476csm69740795e9.21.2025.07.17.22.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 22:40:15 -0700 (PDT)
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
X-Inumbo-ID: af032ffc-6399-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752817216; x=1753422016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1BfPIvayInZVyki3FWU0uALWUnH8l19E3d/fCFGhjIE=;
        b=KognoWQ8As81N5DPtBiFJPSgGux3OAX6dEBX7pJUl+JJA96BpQ4R0oHQg1XbzH6xof
         TpZOnuf8/gmKwAEuAhAR7vY2yViJEsTwKg75WNW2wQ/8LDAwWourUFUeZaZbXDReRO8X
         SQQmYQHcFnPqsFXs2B85XHb4+fFH3P2sYTAywYaatFR3f7l7mn0z7jAd0u2il1+TwY+F
         bpXbKpWupe6vy6BtJXX8cEWHK35QdW/lSPKtLei2eLYM3QRFZ8SDEc/DRMTGK+49dbtG
         nezuS+/VrOYQJF1Y5a/lfYCXXv32wctSQNZYyIYtmM2IB6EjAuU2gGhxZ3pwW2/dXP8o
         oxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817216; x=1753422016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BfPIvayInZVyki3FWU0uALWUnH8l19E3d/fCFGhjIE=;
        b=nQIdMk2WMDRHrpnrfl9+c4e94a/upj7Gglca8VCX+L0zH8BAzQbmLSGDcRaWWkXppl
         qy0p6bSIgPmzWB90X86zjVRi51VukBvMtS7y2sHTD+67V0LK3kt8CWVKnZaSXLppwdU8
         uTbugDXS0szbCt1qxlPziAZ/JQiAKsJfABbgNlxRy1ljgYFNGjfcdk+thZ8lavkPuh12
         g/dgdkcigcPWXRgw34dK3GlC/TVnxkWuuZwG9YFru4mPtoYD9Tc5hu45l6tL4/f7FR7u
         gkumla6B0NmcLwy1hIGaBCaaZT4vS8+8bvOrG86k8UISis2r0PB9fh1x2D9wfU+gzF2+
         wxRw==
X-Forwarded-Encrypted: i=1; AJvYcCXDL+gHA+nYovP0G79WBk8h88m2rNUWfStveCeHIQ0Q4szFOSgQ0ddS4agJKDnCbF+gQuPn+X7VtRY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGOaqgXWFXRYEVCr7oHs6cQTxMIN9lotVwJse2RsLxeA0D8F5h
	momXkIUEau6QPXImAGaWCdAdNWPt88NKpaGgCQmFH477QAE3bIi/UhhkyMhMjROR/Q==
X-Gm-Gg: ASbGncs7B2Nl81sE5wdXO6m6P4aqVBqVoYgYG+wXuE97Ui1ROz+ruXn+WSP5wOr9PJx
	NVSRTv9gdLS43H0V/FkKIAgfDA2CXd0/vtgYRhEmSJhT7hxvH4SlPnucK/tVvBYKpuZGVyABZW0
	Ek478NB2wWUQNahhfjpYPNksG5EdeTKkWRYXqlRsv0TXgAJToQL/FzK5b1/JxKQO7VHCD+jt2DF
	yX8/wgSTTV478Evg0ypW299kRl0QXKKptBFga5C2cAVDFKWGLB2VdzlvaIsO9TVrdQJHudIZJ66
	TBhJa6dskJcvCP9UxKO4ADfeCir9dtauobf9sq0lLhVGU9KlzA9vGMcLpYHC4HnfZzWbS5IcMHb
	zTQkEyStW8Sgh8dJdH2yyfWTMxezCb9CWDPr18h8SJXgwAUaDbwzuS1VCqYGiQVPQLrcfUzKWcf
	dw7pQhjcqEPOBEFwP1OjGbwYFZQauOyR87gAR6STeRoAMXfpy0YfcYK0+yjh0sAcY/GU8=
X-Google-Smtp-Source: AGHT+IFiNHsIdZxnimvsYFkzMezHK5A+vkCg/9AWKDIb/djSZHu1wFpIPAroAxsGlChKsWH5DzXU6w==
X-Received: by 2002:adf:a286:0:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b619cd1403mr1083898f8f.26.1752817216185;
        Thu, 17 Jul 2025 22:40:16 -0700 (PDT)
Message-ID: <fc89c993-1e3a-4d5b-8ac7-cfbf6fab4905@suse.com>
Date: Fri, 18 Jul 2025 07:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] x86: Convert users of INTEL_FAM6_MODEL() to
 X86_MATCH_VFM()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-5-andrew.cooper3@citrix.com>
 <28c6ab0f-3699-4fbf-9a2e-205c6452ddb2@suse.com>
 <3b95d347-3dee-4424-a502-50a019cd19eb@citrix.com>
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
In-Reply-To: <3b95d347-3dee-4424-a502-50a019cd19eb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.07.2025 19:57, Andrew Cooper wrote:
> On 17/07/2025 8:44 am, Jan Beulich wrote:
>> On 16.07.2025 19:31, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>> @@ -583,7 +583,6 @@ bool errata_c6_workaround(void)
>>>  
>>>      if ( unlikely(fix_needed == -1) )
>>>      {
>>> -#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>>>          /*
>>>           * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
>>>           * Core C6 During an Interrupt Service Routine"
>>> @@ -594,12 +593,12 @@ bool errata_c6_workaround(void)
>>>           * there is an EOI pending.
>>>           */
>>>          static const struct x86_cpu_id eoi_errata[] = {
>>> -            INTEL_FAM6_MODEL(0x1a),
>>> -            INTEL_FAM6_MODEL(0x1e),
>>> -            INTEL_FAM6_MODEL(0x1f),
>>> -            INTEL_FAM6_MODEL(0x25),
>>> -            INTEL_FAM6_MODEL(0x2c),
>>> -            INTEL_FAM6_MODEL(0x2f),
>>> +            X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
>>> +            X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
>>> +            X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
>>> +            X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
>>> +            X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
>>> +            X86_MATCH_VFM(INTEL_WESTMERE_EX,  NULL),
>>>              { }
>>>          };
>> Along the lines of a comment further down, maybe make explicit that Nehalem-EX
>> is intentionally omitted here (assuming that's not in fact an oversight)?
> 
> It looks to be an oversight.  I've submitted a separate patch, so it can
> be backported more easily.
> 
> In practice, it's covered by probe_c3_errata() which blanket disables C3
> and C6 on Nehalem.
> 
>>
>>> --- a/xen/arch/x86/cpu/intel.c
>>> +++ b/xen/arch/x86/cpu/intel.c
>>> @@ -382,16 +382,12 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
>>>   */
>>>  static void probe_c3_errata(const struct cpuinfo_x86 *c)
>>>  {
>>> -#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
>>>      static const struct x86_cpu_id models[] = {
>>> -        /* Nehalem */
>>> -        INTEL_FAM6_MODEL(0x1a),
>>> -        INTEL_FAM6_MODEL(0x1e),
>>> -        INTEL_FAM6_MODEL(0x1f),
>>> -        INTEL_FAM6_MODEL(0x2e),
>>> -        /* Westmere (note Westmere-EX is not affected) */
>>> -        INTEL_FAM6_MODEL(0x2c),
>>> -        INTEL_FAM6_MODEL(0x25),
>>> +        X86_MATCH_VFM(INTEL_NEHALEM_EP,   NULL),
>>> +        X86_MATCH_VFM(INTEL_NEHALEM,      NULL),
>>> +        X86_MATCH_VFM(INTEL_NEHALEM_G,    NULL),
>>> +        X86_MATCH_VFM(INTEL_WESTMERE,     NULL),
>>> +        X86_MATCH_VFM(INTEL_WESTMERE_EP,  NULL),
>>>          { }
>>>      };
>> You lost NEHALEM_EX here.
> 
> Oops, too much copy/paste.
> 
>>  For Westmere-EX I think the comment (part) would
>> better be retained, to clarify that this isn't an oversight.
> 
> I can't find anything which looks related for Westmere EX.  I'll retain
> the comment.

With the adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


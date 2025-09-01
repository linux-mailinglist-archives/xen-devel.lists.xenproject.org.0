Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2A1B3DC80
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 10:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104170.1455292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszzY-0007RL-9w; Mon, 01 Sep 2025 08:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104170.1455292; Mon, 01 Sep 2025 08:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uszzY-0007OB-6L; Mon, 01 Sep 2025 08:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1104170;
 Mon, 01 Sep 2025 08:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uszzW-0006r1-64
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 08:34:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72cb20ca-870e-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 10:34:17 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b0225483ca0so273338266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 01:34:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b04252103f2sm237629466b.50.2025.09.01.01.34.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 01:34:16 -0700 (PDT)
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
X-Inumbo-ID: 72cb20ca-870e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756715657; x=1757320457; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzs3DliRmIjLErCH2j6BVqbwr8WkQ89CfiGMPQYpA5Q=;
        b=cXn+m5DUGYTN7NY6BWIMkOXmCHgD+bVNn1NUQRgwtE52Qxu+IuHF7PEVE+fn4aRbXs
         r/Ab/QcZpJGwH/wWS0LVuagOdibxHi6qQl/bw+vpxztZYOjVIufXkViowwowMuGsDXzb
         jdMu2yy94d6Hej29ioHeK7eFyEzUT8svVsnPcqR97tj0wkP/FuCAQU3o52y3O7bjmAWu
         pnp2oFlKa+NzCjpmXJEmVEszW6EEC+J5Oik2UuWZkPNYtThFljEtit5wBFducy/zB/4N
         gHOde9k8Gy7mzyvGoXVtKJRgqsE8UaWyT2hW+aDzDCDCXIVOB6CML/rKrbVES996tBAk
         4nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715657; x=1757320457;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzs3DliRmIjLErCH2j6BVqbwr8WkQ89CfiGMPQYpA5Q=;
        b=LqYzeoLX9uuGntyQTWlVIgWngkmZLHCOccgyCWQmWY/BkX7wm/o3dKfB3NxvzMLCBx
         4t5etvBMT2XJL/tOcT5akG1N02qDR/i/jPBkYICyJF0x+vibrsmuoZbNJtrVEBq54oy4
         zviodWe+hy5IdPdkQJxG06mPpewu7byJC1VRsT+tr+POIaDQHp2yehUnieV1zQKJINcS
         nfPWIVJrIfQnE8kClUXwGCCGJmN2UG4yrN3ZJV/0bo+Y9pC9jRV6m1Bcj5NwE/LE1u+K
         xL3mKzkVZFAMZ4za0HAru+DoW10kIYYsjF2DdnB5RmZJnZ7OdIlrd4jkq4swqJvT+LSc
         m6xg==
X-Forwarded-Encrypted: i=1; AJvYcCWz7HfRsUIFDCBiv1aaLlW+cgDkSN/F3pa76QvP+98CqPd+dcMkgwnXlLZA7+6oSaDCdrkh86CMbpg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yycy9kcM5DqtI9FQXDpTQwp+Jkm316fYiILRNgJrdheHOUAD7q+
	KkS0kmI5fPXnrAko7Y0m99vcl7Grdzt1HOa6ybHrQsy6Wz0Ar5lXwtdIY5TEmi/0qkJQoUikbSv
	4G0A=
X-Gm-Gg: ASbGncshjCGrGwkl6eD+xwM+yV665/EsmEEsSypKzDtxm/ubgA/iJ5j0yWBnjWoYbjx
	CFnrUNssPRVIGgBHi5KsobaEEoX5U4RHMLBh9VKuCoOrWxcVsi2HU3QFIjWY75Umq8gT0T2QGL5
	7vuikDRLOWbPE8RlZWxvBXtqAnuvIEe7D18Gr+EyL45qZOQeFoeImg/cJ3QEujQeboObDeJIA4x
	ohXymwWQ9nfku3GRUBe7sDK2JMjBH2mkKF9wsGtDck8/lMaN5qMAs7NaHIi+yZVUJ5PqHSavaw7
	m3R2Ue35KkUVvPbvjJdfNAO3KjH/OrgqhPNw7wa3D63DDwnUIsl15nlkJ++toRGZ4uDAyCOO6iA
	f4jCESu/aqWYR9dwotEHGaGTzm9sIKAlHZIk56MAfK4nWtDo5FyPjBWgX4IC/pmYM+lbhG0iO0y
	vwhNOv+pk=
X-Google-Smtp-Source: AGHT+IFiCDQ8wy24nd+Fc3RoVP5bZKib55cVbT9gGqmzQHeF/yT9Stk8YoT81s9/oGDNxtXXmpkl2A==
X-Received: by 2002:a17:906:2819:b0:b04:27de:12ec with SMTP id a640c23a62f3a-b0427de140emr288313266b.4.1756715656853;
        Mon, 01 Sep 2025 01:34:16 -0700 (PDT)
Message-ID: <8dcb1c27-d638-4334-a4d1-943d1a5d0d64@suse.com>
Date: Mon, 1 Sep 2025 10:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/apic: Drop sync_Arb_IDs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250829161710.1056772-1-andrew.cooper3@citrix.com>
 <20250829161710.1056772-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250829161710.1056772-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 18:17, Andrew Cooper wrote:
> It is not obvious at first glance, but this is dead logic.
> 
> On Intel, xAPIC (which is what modern_apic() is really checking for) predates
> 64bit support, while the Family 0xf check on AMD is the K8 processor.
> 
> Simply drop the logic, rather than trying to adjust vendor/family logic.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB946B3B594
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 10:11:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100847.1454130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruCP-0005x7-Tq; Fri, 29 Aug 2025 08:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100847.1454130; Fri, 29 Aug 2025 08:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruCP-0005vD-R0; Fri, 29 Aug 2025 08:11:05 +0000
Received: by outflank-mailman (input) for mailman id 1100847;
 Fri, 29 Aug 2025 08:11:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uruCO-0005v7-AZ
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 08:11:04 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b337963f-84af-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 10:11:01 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb7a3b3a9so263841266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 01:11:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefc7eec3bsm149929266b.5.2025.08.29.01.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 01:11:00 -0700 (PDT)
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
X-Inumbo-ID: b337963f-84af-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756455060; x=1757059860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NahLq4IGlBeVOTlkJ2bCOMiaMxsizV54WpCS2Zb5/dg=;
        b=NyL+F/2E1o+49xHCnrR53LmCAtPyHaL663/XFStRstvyn8fAYO2jspX3gfgpYnYfZK
         iB3xnmJiSEJ24qM0bdINy3ug39dWPRY5KLdbxQaJ0s3Zq9pQcDi7dq4+h9irbP/PCa4i
         V1llfw3dEQnGxv76Jqmx0rsoSDKiqcC1aPB+kA6WwWiR0WAtNkhDebyh/ttDBBCODwmn
         2lXsm2OnqSev6+/ign5GKbgxkHNoCx85Jt/TKL8gJ8DuC1ra4CZZQCkBIBOPiC0rxKLI
         VPPKqAF+lLSWRGjaCjZnVDj2Ux7/4I0tETlB0MhItOUtrt6Cstx3ezOzvlmq9cgPiJXF
         sV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455060; x=1757059860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NahLq4IGlBeVOTlkJ2bCOMiaMxsizV54WpCS2Zb5/dg=;
        b=uokyuTjekSBAOafxHTQsmGnCsP7TK2egIg3Jy+d3EOZ6bEqJqwPM+Hrx8Kk5UmRM6/
         5y6fZdV0qBaoHpGAO7dRmQY45dbclIITzPbwv3DLUFfks2KEsmHrMKqpUwQRpqIgIxj9
         E9hxHJoD24BF+QVyN4dDjDEd4OrxP2hlv/gKngtnVZ2bGK8Lu75wOBlG9oCin9Mo1WLX
         WZ4gHUfL3mz0WmLYLboutxOtsqKxCB4qQ1O2aa8AuRD6J9aLlGl68GSn9bOgPtgymUfE
         jkJFt6q3Z3pnqlfHYrQrn549Zr9Z0y3jqlWt2ZeJC3JFFyC5FmBezhjc5oZknfzku0ra
         gU1g==
X-Forwarded-Encrypted: i=1; AJvYcCXuq8uFUKhjExUSZld5db0qAikYFG0blkJ+G4RJxQK6YF9VK9UXBCNh0eR402u6f2FeTVztMT8QQ/M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9BSSCn4xnamSMczvewWH4dp3wW60Ms3ocgQV4vPUKlDqNGw2u
	Xxt72t3T8WRxGGblQLbW19iHuL0zJnb2pxGI+mVDh+0kqCP5ntuAhJOC9yjKnVZndQ==
X-Gm-Gg: ASbGncsupdwsZ6XQvtP7TcACLAtf/HroOQ/jYqeVg/KMO63xkrfoK47eMm0LEY0mGV8
	MvoeDp3w0ObzjTCFgr7Kixn70cTaddEjkrE0RIb2l3w4PaTP2eq4RouFUzAd9nEhIwPcqs0k1IY
	bAvZIyxhVQHw4FmsuwIdkQC3t6Ogq7C7Mv/cMVL+YQaXGrkC/w/0eEMZN+Wj4QATP1/T/goIZu7
	48jxaJNR8M7+d+j5rvOEco50Sjw9U5s0820WBxhrNCUl792w06Ot3DuAKrBJEU8Rw+JxXejWE1q
	oXp5h9Fc6IaZ201QhrLkIbd8oSrl+FvoP/RH5QPcg7pmSQGZw8HKCCrAfKCjkYy/rGZAPTfCJzk
	vS3U4a7RiX9G+DHmsLLyY26xn0pOCO9Ke+FDE+PRZsjJH6lGpFEFRGJDIKhz47JteonWAPAzINl
	DtpbjR3QU=
X-Google-Smtp-Source: AGHT+IGDnoOkjq+h3cCXfR73XiAbeIj9lkbdLO4jH/q2G4bPBXN9ExhDzKNl7D9E1uzN+EpPf7G+Yg==
X-Received: by 2002:a17:907:720d:b0:ae6:d47a:105d with SMTP id a640c23a62f3a-afe294b236fmr2617296066b.55.1756455060330;
        Fri, 29 Aug 2025 01:11:00 -0700 (PDT)
Message-ID: <e11d81c9-cb3b-4838-b25d-50545deba64b@suse.com>
Date: Fri, 29 Aug 2025 10:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pvshim: disable PDX compression in PV shim defconfig
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250829075154.48787-1-roger.pau@citrix.com>
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
In-Reply-To: <20250829075154.48787-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.08.2025 09:51, Roger Pau Monne wrote:
> There's no need for PDX compression given the memory map provided by Xen
> to guests is contiguous, turn off the feature by default in the PV shim
> defconfig.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Fixes: c5c45bcbd6a1 ('pdx: introduce a new compression algorithm based on region offsets')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Not sure if a Fixes: tag is really appropriate here. The shim is working as
is, just carrying code which won't ever be used.

Jan


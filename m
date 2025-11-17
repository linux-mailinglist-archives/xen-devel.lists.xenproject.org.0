Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93310C632F2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 10:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163545.1490635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvcr-00018p-L7; Mon, 17 Nov 2025 09:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163545.1490635; Mon, 17 Nov 2025 09:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKvcr-00016D-He; Mon, 17 Nov 2025 09:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1163545;
 Mon, 17 Nov 2025 09:34:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKvcq-000165-Ob
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 09:34:20 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 971bef05-c398-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 10:34:18 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b737c6c13e1so300550766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 01:34:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8bc8sm1041576366b.49.2025.11.17.01.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 01:34:17 -0800 (PST)
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
X-Inumbo-ID: 971bef05-c398-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763372058; x=1763976858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EA40i+e9TagtePB0HRsi1abTpKrLFNjOZR0t41vR2b8=;
        b=Uv+9U+uN8+ei+4seiiNYOH2bGHhFOQJlyUHbj9q7Fpdoov5efB36Mml3v30ZU7XTd5
         2zxN3EqFYv7YyvJ2TH/Q1MgzagEjwKae/xOwyqTlr7xYjXOlGCItSW8cIDbRGYhh3qLD
         VKId1qdA7vEWTf/qZ3eLYhypbYfPRNHoL8bqdfoKvS2jEuXF7odxk84DHLEd62UkZ9QO
         R8eSYq0F/oBcRdrohaIyKhymyvUp0BADbR/LScrxdW9/1s6M1Y22xyBfls/ohiYgUlck
         rxYNOBMv5LHGm1z4n8kKlJuYZVqWNiqS9HAq/PS5zi5LGGmvtYiimxonwisvydXY/y48
         1EJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372058; x=1763976858;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EA40i+e9TagtePB0HRsi1abTpKrLFNjOZR0t41vR2b8=;
        b=NWeADsgSMSaz/2J1api4D4fiEVRgnHJDDThG4tQFTL80kKSYTNRfBKWHKXUf3a5ebc
         nDzfqAAx70TdQ4szMtvP4daKX4AMOX50Ta8igJENMelMOCwbH4I52n1og3BSCSfW97eJ
         D0BhzsklcrrajsyFmHGDn3Ft74ksE1RBlX5wN7l2uNQuhDz7t/8XG03ngesx7HGRDhgW
         1WbB76cbLiIj/3tOS3KoSJlrinzRjrdxm/DNp5uw0LEuQKCHaOLcqbN9e5Zd7vV97HPv
         TY8TVf2Nboa8F2wEYaxACHK9zKjxuHKUNeIl1/5Lfa43zgjjPZg+vrkhPnOJ0sJ5t2GO
         /U5w==
X-Forwarded-Encrypted: i=1; AJvYcCXCon3HvQbTxlRnPoLsaj9WEPuhbCfOtmb5gj92/kSgakVyj1f1zwY1rpE5Javugqz3YpxkOd0xrGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6doKEpoF8YypIfNZa/3DJOvqhCU3tUBUdmwCt4dfxOVMF1D8M
	8+uo+KcMpwEC4oUS3GXwbMyB0L1F8U0rF0lmJRalh8blnmOMtjXsZNrgTcD0+2N6IQ==
X-Gm-Gg: ASbGncsgElxJ01IrHZA2wG+5NhTN8hktm9kIak3KIENV0MNKwp1gzibjQKLggzkzyPm
	qEOf/xFp3dIR93yr6hOi1jE9z9pFrSAddv/voFm80wm2WcqCwWcNbEl7TefbDWNXZF2o+KHDxPZ
	Anq0pbjAfRBwduhg2SDwEdch2klPeM0tIoZjHgRWaOqiZEsUs4uLPKt4OS2OFcx5BTj5dzXmodi
	qxokGO5P00F3IaH/wn1cbEB0OKbOYmg9xifEOT8Hp4MMjnOnn1YsKn11GuHjfGlk/JhkYw1qguT
	Tbdjk7MRo/GyvWBTcA3bSgraQgX+qbGxll8+i3h6j9OXom+iG1Q6spnO0pBJj47BnGd4gJ5Ngtj
	nb1tlTzIAdiVPmK+nvVoz8K7DI/kTZm6JEqKeJmzJPRoyVgdVEdxtv4btcLb4Cz7o4BgNvhyvL9
	WxUh7hhnJ4T81n9Aaehmxqv/tYfFZsLmlzt0T0CNJXwPBCGEwQbLU1H3lmbe6NaZWL
X-Google-Smtp-Source: AGHT+IHu+kIECWmrE0Vpr4tvn8DNNSNYWPegJUiJH9tGqInyvujf7Hbo/oy/4W3xIQeoX2j1LtLiBQ==
X-Received: by 2002:a17:907:a08a:b0:b73:870f:fa32 with SMTP id a640c23a62f3a-b73870ffe43mr665375166b.43.1763372058127;
        Mon, 17 Nov 2025 01:34:18 -0800 (PST)
Message-ID: <991e0324-98af-4264-a527-703c72439780@suse.com>
Date: Mon, 17 Nov 2025 10:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
From: Jan Beulich <jbeulich@suse.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
 <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
Content-Language: en-US
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
In-Reply-To: <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.11.2025 10:31, Jan Beulich wrote:
> On 14.11.2025 19:01, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Now all libfdt features are built-it unconditionally, but...
>>
>> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
>> nodes, so full libfdt is not needed in this case and minimal, RO
>> configuration can be used.
>>
>> ARM - situation is more complicated:
>> 1) ARM reads Host DT (fdt.c RO)
>> 2) ARM reads passthrough DT (RO)
>> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
>> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
>> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
>> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
> 
> This goes too far, imo.

The more that, unless OVERLAY_DTB=y, all code and data moves to .init.*. Is
coverage in in .init.* really of as much concern as runtime code/data?

Jan


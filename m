Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE2AB6EA5
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 16:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984437.1370581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDYE-0001Hm-1K; Wed, 14 May 2025 14:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984437.1370581; Wed, 14 May 2025 14:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFDYD-0001Fn-V4; Wed, 14 May 2025 14:57:41 +0000
Received: by outflank-mailman (input) for mailman id 984437;
 Wed, 14 May 2025 14:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFDYC-0001Fh-IL
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 14:57:40 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c545a1bd-30d3-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 16:57:35 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad24677aaf6so526104066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 May 2025 07:57:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23fc53229sm696421766b.48.2025.05.14.07.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 07:57:34 -0700 (PDT)
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
X-Inumbo-ID: c545a1bd-30d3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747234655; x=1747839455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QBd4G/MOG0bU8pvYoIqINAcQ6RQ0A9v9Lj3F43GU4EM=;
        b=TfzKWDGjZczl58BAXVfdSDBzNTfVMe1NBZ6tLUfm/+SzrdMwyJWbOv/VKCCxgm6VwE
         zHaxOILOYA2WZBkf/iwAIg6KKNo4MjDeVJ5VtyeJ/nNsIoyGvXjl5parj0o9hL5aEh7p
         LETzboMGehZUY4NyvQoS0hd8kID8gD3xByQDPybdkmCV2iLxzLklDlq99Z42zXwsU31S
         BjEH0Bklk2aMEGvTiu02ICXmj7uaw5+NsYARc3F4vVznil3fmqptykow6fG0W5kP8yrJ
         B/ZQchaQ5m7Sex034TK156kRI8eXaWhvn33lQSNe3rS4P2dwRQuI/JgSnJEbg9sRZFpB
         ObWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747234655; x=1747839455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBd4G/MOG0bU8pvYoIqINAcQ6RQ0A9v9Lj3F43GU4EM=;
        b=gNw/eRZqDBn1OOaIPPp/m5Z6zv3WqAl6xUMTU3u71TEylBfjzbybLKpPPw/0qTq+Q1
         KoOcgaonEAn6fS57o/2LoxVJ4qEWi89GoM610g/HqWwTB+f4F+Dgaayej0gkQg4RGZ+O
         G+lxxK+5/bcnrn6dPts87y8PCm/y2z7CnGl7f6bbpyz7shyqrgkkYCod/O/etKQBvsyD
         YnBBAu6KhsHG5pIaYYTNAlDN0E+bMTViqKglVpyGAl+j39mL5luJr5cxVVdfJ4zbnBEW
         CKMhOjDjavESaerXzbz7v6aVTGIGY3HDlIEZ9Rkgp85p2xTnWkcDpI/63PIUVPiACwIJ
         MepA==
X-Gm-Message-State: AOJu0YwATVvBnE+Buq5jhTiNaVAuXxS83xCWw7ZHt0z8+W1B6BGsOqH3
	yWXXOH0OzROvuwEt7aOXk/oqO2QO24y/mM9ISzIf2AQTyxyhwhJ/BKRsX2n5ew==
X-Gm-Gg: ASbGncty0rLYszkXP0x5JWa8KBM1LfOdRChFVi/pn/hTLCiK5mKr4EGGcVExcVDNNoR
	pT1UUMAT9Z/tUXqC5CG+FrHbBV1vPZR/Vcrc8Tx60NoHz+96rPbNsV95t8r1NpAJC+hhUxYxby2
	groGipRgE3b+6yFkOw74ybXvwod3ubym8l2dGWYFJ4IAcRdbr+IKsMqWr7D+FlW/bkwmrlJXQtS
	QN0OxqQn8B7Tu8/20nAPFs6gTfP3vBRhXOo5P4pVXMMt17oKSx4LKmGNH3WjfXVsgMWDM2NjPOh
	wBX7DVuzxjwNRB7vFgkDndjOgSVyTbeEF5RM8C5UVvG690URNZyRHL9k8fl5fTzPepBInFR+3WM
	67aiGIA6Z+uLS7dCn1hRCbt3AwApd8p0wrHz0
X-Google-Smtp-Source: AGHT+IFhVZrHsYVM5adqPKOmMBNyNMaHZThcTwIeNBq+XmltwHYsmN/d8j+nXrIU1QNfgikP/DkJYg==
X-Received: by 2002:a17:907:970f:b0:ad2:23a8:c71e with SMTP id a640c23a62f3a-ad4f71e1f7fmr359601966b.27.1747234654908;
        Wed, 14 May 2025 07:57:34 -0700 (PDT)
Message-ID: <222117f6-d430-4915-9693-50215760d986@suse.com>
Date: Wed, 14 May 2025 16:57:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] VT-d: restrict iommu_flush_all() to cache
 writeback
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
 <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>
 <aCSsUKy7xe7uaQHW@macbook.lan>
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
In-Reply-To: <aCSsUKy7xe7uaQHW@macbook.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2025 16:44, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 11:46:11AM +0200, Jan Beulich wrote:
>> We don't need to invalidate caches here; all we're after is that earlier
>> writes have made it to main memory (and aiui even that just in case).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I wouldn't mind if you gated the flush to iommu_non_coherent, but
> that's not very relevant if we plan to remove the call anyway.

Actually I think I'll do that. Then for a fair number of systems it
won't matter anymore whether we remove this call sooner vs later.

Jan


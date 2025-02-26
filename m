Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A71A45DB7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896433.1305134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFwv-0006As-0Z; Wed, 26 Feb 2025 11:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896433.1305134; Wed, 26 Feb 2025 11:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFwu-00069Q-Tt; Wed, 26 Feb 2025 11:51:36 +0000
Received: by outflank-mailman (input) for mailman id 896433;
 Wed, 26 Feb 2025 11:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnFwt-00069K-Jp
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 11:51:35 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 064c6705-f438-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 12:51:33 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so45718315e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 03:51:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5396desm18629655e9.20.2025.02.26.03.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 03:51:32 -0800 (PST)
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
X-Inumbo-ID: 064c6705-f438-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740570693; x=1741175493; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ynj8wH9DwxGfM5NWBjbKHAouiA+Jshik+1q1pzrjiJA=;
        b=fNi4KPV5GgANWR/HG0b3w8P6YeYJmjMJDxbHFt06JkBCjLeA2AmRiHl4j5Sf/SNEPW
         iojA4tEjL1+WKaTkaNlZi1ccrSdfFPZqJFjcwx8UxAcQGMIHBLLgUYTHiK+0tERwNeUJ
         NGrMT1ZcUpt6qBN8De7Dy5+rW26vSL/WAp9srU2OhMdcHTlCJAyF7aj7ktouLxIu9XQt
         j2TLUiOyBSzlc6gOM44lH52lhYrMeepIVGjJrkq+r2WPg23B0xlassh8uFpEZlU64eNP
         IUCvIHzd1McXpNu/Mw82KH4S0eP6A1+2wwbxkcme3UiEG2CHqDz/SNRURsyja8DdWxF0
         teQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740570693; x=1741175493;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ynj8wH9DwxGfM5NWBjbKHAouiA+Jshik+1q1pzrjiJA=;
        b=pvQRCqxfqg5p8/ZwWPVn7nlJu8Ueb1W7coIQzTr+gbWiMJ3nsOY0MxhSbx3Z9Z5j8f
         QT/BX44KwEEkydLWuazd5LrrB7K459+F6ya4ipRnQ4XTHCtoyR6u8pVE8GcY26s4lDdf
         yRUroDsL4SCk4algTU/vLsbaCpcAC/AlKGJHkfaU8NRbiiQCDPMPmBIPi2OWVZ1iH/Z9
         Urm3H/uiNT75mT9uH62Y9tDU8mRbiVW7pT4vcUT/rkhooV/cOtmYUaM+SjJxLXaD1+Fp
         0ezhaI6P0wd58ZuOkoKYbZcG+VYuInAyzNun3ALpBp7pO3cyRtDXnbbtf1N3mKcYkXjk
         h29A==
X-Gm-Message-State: AOJu0YxaVXZnblsxrr8aLnYrrv3Z3Z5O9TNDcNNYer5O+U/RYDtRKJzD
	Eu0NXpCpltA5dQT+Q7uwQLcS/FyM330gKounKr869L7kA7yWrUCN+XcDChl9GWu7R6eM6iMGH7g
	=
X-Gm-Gg: ASbGncsoH2OWAtoOFGydO+CYdlMvY8stA1KyRQVeywKz75VftgmV2cfUOz61l8y0s45
	vnlKju6uzHQ+9T2P2uI/kxd6iymJ6mKOJbwrtV5AIq4+J6T7XyJ7DjgMIslRXU/P2UjScEIpcdc
	KwgxSUEPy59cHQALwD7eG0fuh1BJdandefpYY/U0FOQilvQo4aMxj+iVUw97cbt+a54k/iU0gAP
	nM21zIMPexT0vUj6eNSM1uhkoHVrScIXuybjMEPxP5X7IRMKybgASJEYHW0fNKkPmS8H2vNliEB
	KG3F2jspbPhpZxjwnzsB4WGvrApPgE4spZFlSWWl9pwRjNXU5pymadcCXcw9mnjBlRsyUvUbElE
	KwM12UD67j80=
X-Google-Smtp-Source: AGHT+IF2UoRdzsoQdAygFgSjEimfdPrv74ToGVtCsLP2nzFCt5g57q9oBBGn2fruM4xHSyceIwh8mw==
X-Received: by 2002:a05:600c:5253:b0:439:a093:fffe with SMTP id 5b1f17b1804b1-439ae1e9601mr186530805e9.7.1740570692859;
        Wed, 26 Feb 2025 03:51:32 -0800 (PST)
Message-ID: <7363b2ee-f297-4b0b-9c4d-bdebe08d514b@suse.com>
Date: Wed, 26 Feb 2025 12:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86/P2M: assorted corrections
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1: synchronize fast and slow paths of p2m_get_page_from_gfn()
2: correct old entry checking in p2m_remove_entry()
3: don't include MMIO_DM in p2m_is_valid()

Jan


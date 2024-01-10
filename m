Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1964F829CF4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665539.1035746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZzx-0006AF-F7; Wed, 10 Jan 2024 14:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665539.1035746; Wed, 10 Jan 2024 14:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZzx-00068e-BS; Wed, 10 Jan 2024 14:56:05 +0000
Received: by outflank-mailman (input) for mailman id 665539;
 Wed, 10 Jan 2024 14:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNZzv-00068X-Cf
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:56:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d439d78-afc8-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 15:56:00 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e5a5b0fb5so1471375e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:55:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b0040d91fa270fsm2449640wmb.36.2024.01.10.06.55.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:55:58 -0800 (PST)
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
X-Inumbo-ID: 5d439d78-afc8-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704898558; x=1705503358; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=88zDeGIBaJoIV+hLc3oT2iJFbA8oW/DsFEN9f4HVlHc=;
        b=Fzlo4i2Wv8n/w8hOu0oH7CxeYl+9mr+jQJ9yRpt0RNLugsq5nyGkqSLWsB7BuDdIbg
         IcH3tlHUPImYcuSys11gUUWHrryORX+aYk0+QfoPbE2aMwLLASskoDyRk7Br0eCQXrPS
         3Na/lMfiZ688NIhI0Jcxg9DhzGnUxtekobGhYnOq/H5SL2/qk7ZjFx9htiO6PGvQSQWW
         UMMVLVky0l4WA4KbqPEkjnciNk1f34lIRfMwKYUqZoTjwUdLDZuDMtqNWLN1FNI/6X5c
         RXDCBSurz0FK9hqBEX1UM9pJXvkvxSINyo+y5MI254ZeWLWsSani5eVkc/Olh55WszDS
         bRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898558; x=1705503358;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88zDeGIBaJoIV+hLc3oT2iJFbA8oW/DsFEN9f4HVlHc=;
        b=nXRvpYu5mZnE0rlFHmwqPJLBarPj1+Oq9u4vbvm1ChwJ+voRbTKoMQkYke+TWXtUY5
         YStXWKQA1SH9OZVYg1mvSpbUOfqOlCxIEG7xVErhCTPkqNLDSMBBaTMdHomuVR+VHyLY
         vyiKLEkESjkOSNUgpBfEUAkmVMGlUvk66TO3cbw76CUkYi9C4aOz9uiZ8TqXrZz7Ntu/
         Od6fY0sqa2iBPvbM7er714AGxqO1Zd9ImyuMVbt1DjRW9sa9O/8lohmuvAE2VjsNYnE4
         erkwnJkpRzU8VDcUTmMpQqLLBef7u2tmbnDVI9mpGjjFkjWJbc7lQQbZOwb4hgw4J8WE
         4cuw==
X-Gm-Message-State: AOJu0Yx96GN9t6te7h0dbl6Ktss8LjPHHMSC+lSaD6ZVSkVDjZmIYqke
	VwE6uZ18tuxZRGL3CPkBio808a3VcEKlQOEqrfqcvB0mJA==
X-Google-Smtp-Source: AGHT+IHCkQbXNxY5LM1hWMDq2548pIWBh3oKH9tL8SztD2ykm81zpIWtngbveTrwUNazp5wRw+vzkg==
X-Received: by 2002:a05:600c:3b91:b0:40d:609d:d65e with SMTP id n17-20020a05600c3b9100b0040d609dd65emr572928wms.177.1704898558424;
        Wed, 10 Jan 2024 06:55:58 -0800 (PST)
Message-ID: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
Date: Wed, 10 Jan 2024 15:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 0/5] x86/HVM: load state checking
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With the request to convert bounding to actual refusal, and then
doing so in new hooks, the two previously separate patches now need
to be in a series, with infrastructure work done first. Clearly the
checking in other load handlers could (and likely wants to be) moved
to separate check handlers as well - one example of doing so is
added anew in v4, the rest will want doing down the road.

Only patch 1 changed in v5; see there for details.

1: HVM: split restore state checking from state loading
2: HVM: adjust save/restore hook registration for optional check handler
3: vPIT: check values loaded from state save record
4: vPIC: check values loaded from state save record
5: vIRQ: split PCI link load state checking from actual loading

Jan


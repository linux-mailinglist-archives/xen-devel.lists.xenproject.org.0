Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B846C8556C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 15:13:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171917.1496989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtmh-0000AL-T3; Tue, 25 Nov 2025 14:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171917.1496989; Tue, 25 Nov 2025 14:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNtmh-00008S-QN; Tue, 25 Nov 2025 14:12:47 +0000
Received: by outflank-mailman (input) for mailman id 1171917;
 Tue, 25 Nov 2025 14:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNtmg-00008K-Dq
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 14:12:46 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cff7db36-ca08-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 15:12:44 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so39731025e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 06:12:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1f365fsm255424545e9.8.2025.11.25.06.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 06:12:43 -0800 (PST)
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
X-Inumbo-ID: cff7db36-ca08-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764079964; x=1764684764; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xh/niM3OpC+qIVn54tgVX8y4LU57fhsh8qsHr2vpjQ0=;
        b=ak18m7UFiMRecEdycgRV6JNSguX33eBEpKaNhCg1ClehD93BskEQUqIBScxQZm3JgB
         /vFibXjselvrfwt5H5+Kg9TvxlsG5tXaBObxiYzIxSx9wmO30aySh3btHy4Ao8TlIE5t
         F61xApfplK0QO56TXOZX37OJElInSSFieZgTw2dMpls+qyG+eKy3Hir7E+HMHud7PHXm
         aMLXo0xMAMgq6EtAW+igcLRWvYUSB91XwUEPR6jB2nMHTjXxYSa40j/f4eDWMFujxd+Q
         mYTOTjkrjO7JO1ztdxJymsXwuGuxvqKpWEYLEkFjN9tSm42/kL2ULkWxWTejaS0KFIob
         V0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079964; x=1764684764;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xh/niM3OpC+qIVn54tgVX8y4LU57fhsh8qsHr2vpjQ0=;
        b=LnI169e2jUSFpa2pLvqbWBgVPzgX3YUA+W/lB+LuSLxcBKO/2Za1ypsyeGwYxsCF9G
         MCSje66jJywy2DZteQyXernCT22gAmlqN73BmLILMXoDsCMf7V9mrjoVdqkt4QHRS5qT
         ICkSoP1tYk4kImkV2FUk5d+64+LN5r4sEPAg3kbznjR2wcGmsAeSuejaJxRVw2BpzaCS
         SCEOIP/3AqadQDmw/9nwwGlG9hfv84NmBQ3z5fDscKaJnsZiq7Skue/LVUcl0+D0nBEI
         bxTABo+keyYtWDhWowaaLxMz3cRpwp2IMdDbpAuWJsy+fBQSttnFR3NOaTc+vuqIHuMq
         CzSA==
X-Gm-Message-State: AOJu0Yyh/loM34ecI4LVRatAHvzTeBdAfGji4cvZ2yFxH7KdVDT0npLq
	oTvrvmbJv+O/lo7V8KrV1/FyjEmxsQFKr/3itszfhHhSizuZ55JqnVyDFToJzv9mpSeq7CBkWUN
	pLPs=
X-Gm-Gg: ASbGncv6U04HAtje7Cu8x1g4sD9xf6zqzs3/uI1nhDpd7a1KVTR9yc8JXMyRn5q45jU
	AapSXyuPDsgKvj8zCPVgL7zDNCfLG7xVkFTAJelfa8UhOBV76TAcyWdYAk4sGpIsfLRV22LcqVw
	1Syzudx5+0S6rEvjG9/w2fH2xTv8fR/eo/pnACt1SyZCVAbeGhv0EU8GaI8usApg5CQmMX1F78C
	tWiML/BbGSXMT6hwcHEdpyqTbmoabm2CwHq39aaFbwP4zKRzQxM8hUbbpe9PWGHhj6gMBidHoIx
	XxxDwCDCgjidKSYCmP3yQTDXGOBYq+uK47hdhlNP6SReIfiBqPC3ip2IeddyGoT09lkPinkSJFD
	QtvBZJaIxZvoekYBPdiOW3kjbmfQkuSWhlU6JpC/Dig+tVtU4mZTiMFjxJVDG883uogO30MrAl8
	ze3zdPrX6r2TcMz5EMrfbTsVorx9/oBMvPLscCtovjVK4xRpnYKV8p2NwHOeJM
X-Google-Smtp-Source: AGHT+IG++oexZTM5NJrxQ9lfhZQU3z6UxM8yTxWdLlGKb9M3jGdsv8/JcZ6rDbhcBOrf804vE3oxtw==
X-Received: by 2002:a05:600c:4443:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47904b103e2mr29718195e9.18.1764079964199;
        Tue, 25 Nov 2025 06:12:44 -0800 (PST)
Message-ID: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
Date: Tue, 25 Nov 2025 15:12:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] symbols/x86: avoid symbols-dummy
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

For the time being these two patches go on top of the previously submitted
"symbols: check table sizes don't change between linking passes 2 and 3".
Presumably what is done here addresses on of the RFC remarks there, so the
order may need switching around anyway.

1: re-number intermediate files
2: don't use symbols-dummy

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231CCF89FA
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:56:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196118.1513997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Xr-0007ea-Ts; Tue, 06 Jan 2026 13:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196118.1513997; Tue, 06 Jan 2026 13:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Xr-0007cD-RG; Tue, 06 Jan 2026 13:56:23 +0000
Received: by outflank-mailman (input) for mailman id 1196118;
 Tue, 06 Jan 2026 13:56:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7Xq-0007c1-VP
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:56:22 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b6d9c2b-eb07-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 14:56:21 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso9398355e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:56:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653c78sm46337045e9.11.2026.01.06.05.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:56:20 -0800 (PST)
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
X-Inumbo-ID: 7b6d9c2b-eb07-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707781; x=1768312581; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZO8rgZJr4KzU2Xy8wgmhHWqpTW2gXbvRQCQ99uEvvTE=;
        b=Se9JHngtMTCw0qGJ3ssBY5xa2deus4dSPEy8JGyGIgxlpIbuWD65Dn2C9oSpkzLyw1
         mP+5GyRE26q8h/lZc5yfh87oelNGM72qgVHMDCi0SgE3CkaRx7EbuML7ydJZ8xY3W1Gm
         bDXAvz/pwZaVePg2csxS3tAPewpuUOGQCFc66LIxnfeD0WBnSDZSJFlbe0cZKHNQE/LE
         l4MY6aQATvzeiowlSKJkIDbGTLMMqaNPdVJhdyIJWJ3ez7Np0S36cc5u0z+vrJGAnPlx
         52hdnRgRrngxX27GyY3Ni7s6gR6yPZW45uCZF99X7YDucFqt0lvyJlQ5CUZUOtTEWdEw
         ZC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707781; x=1768312581;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZO8rgZJr4KzU2Xy8wgmhHWqpTW2gXbvRQCQ99uEvvTE=;
        b=uLto6qlaprti5wQkTS8QgvGWoRob85trLr3BTFcySdvqy89UgWjXFqrQelC6qKTgwF
         xmvEcfx642erSfWtBr+pNIGBlX66HDDqvq6HKtclTsDOI6d+usJzZdTY3/ej8E6sXExS
         dyt4ghMGGDVPpVJuoBHPzpuwgrq7pJcUMVNT/yqkh5/CM23uhv8JjIAfW8UtRnPxjs/+
         SVr28zR7fooeLq1lOJxWR6e5nozPKX4J27Jv+OcV9jGeP/39/pfPZrsc45oaomX6Ntmn
         PJ8LK4zqdYWY05rCZtAraVKQFyLpyV7m6kouXcwa5HLIs6dcHxO+dekJQkGpfhvV1Udb
         qqfA==
X-Gm-Message-State: AOJu0YwRbIIBykUD3jaWxdD3/1Xt90gJUUOWK7LEhT/6+yEeICl5CQ1T
	7rFv4jNRL3T6weFCRU8M6iGGL3TtkSETZ1TJuEo7OfsSjZHCiAK8HS4uAU+K97pddjGPIWsOrgf
	oG9Wp4Q==
X-Gm-Gg: AY/fxX4gbukjJRt8aBiRf5VDIwbRukXc2pyeDGebE5ypPwUqDpZG84xMyygVTMLjdJb
	H3NMq8UGgp/K5TcFB2t8EE4J2TGhOBYoHlQuVeLZMYmQH375jihot39AgCv7Oi/6LZl6+y8gQ9c
	zUKANJpJw8m2wTsJzPNqOI7E+0yDukINGWOiq72ZFp3ZvIEWY/RVmCWGFBzuv/0SL9OI+0u/SNb
	scZFoEg0pEuJ3OJKcxArg7cMZlXTMZS3gcmthAA5xIYQfgqsDVKpJ9/8msOJJ4/1DDZRy4owhFd
	6TXwi6i7A60q9LnwRZUggb+Si5S3B5WRVT6mR1+YYHRRlDe0jZaF+Bac+SOSol/WhafkwXbg5L9
	4KIx82SALMpHQTEskswUoVuWg6tBZX3lDviMlyv5tq1A2xKIp+tSG3S9wzpHog9PBWyXt2gLcW1
	CQdRg2aF9/hfi9Fro9rxzegutp3F721KCxTSyY7IDrR8BBZupXUXCupSkL8+fDJUM3E5CkTQ2zy
	Rw=
X-Google-Smtp-Source: AGHT+IFd0IBXWuEdGOhm7twVEuVVeXrCJeSSfyPPVVRSnIfvsIYsCagShfS8Dim8onIIcZk3OA5wVQ==
X-Received: by 2002:a05:600c:8b4b:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47d7f0a198cmr35749595e9.26.1767707781226;
        Tue, 06 Jan 2026 05:56:21 -0800 (PST)
Message-ID: <def115ab-2900-4f67-a2db-3d10375a5644@suse.com>
Date: Tue, 6 Jan 2026 14:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: assorted time handling adjustments
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

The first patch aims at addressing a recent bug report, but may also point
out further more or less related issues. The other patches do some tidying
found desirable while doing the investigation.

1: time: deal with negative deltas in get_s_time_fixed()
2: 
3: 
4: 
5: 

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CA6D3C50B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 11:23:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208624.1520769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8tY-0004Lv-Be; Tue, 20 Jan 2026 10:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208624.1520769; Tue, 20 Jan 2026 10:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi8tY-0004JH-8I; Tue, 20 Jan 2026 10:23:32 +0000
Received: by outflank-mailman (input) for mailman id 1208624;
 Tue, 20 Jan 2026 10:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi8tX-0004JB-CW
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 10:23:31 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b2b6df-f5ea-11f0-b15e-2bf370ae4941;
 Tue, 20 Jan 2026 11:23:30 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4359249bbacso164742f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Jan 2026 02:23:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm29265883f8f.22.2026.01.20.02.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jan 2026 02:23:29 -0800 (PST)
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
X-Inumbo-ID: 10b2b6df-f5ea-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768904609; x=1769509409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XWwNE4XQpYgK53ZJ0W2IGDAxdWbROmXWumqVJ7C/+34=;
        b=VpbpTd1xBs4hU8muvei3k+cSLv543n2jyWKJwcRlrRnbL1vHNkP7s2cj9fa/CoxVdi
         hm3VOyxNry5kA/KzA/WupHDQVJyE1h2QWYXFpaN8EnmJBPsY8lrvwBBZUdU7pwEZyC8+
         qnANNjZE9f9o1thyNbWzoEcSCq7CFmCGHLxuFFDO7ZKr+OJwwTzKEayUFeW/RAzy7hTG
         Iryg3x06QYUEGOmcDSwXmBWbX2pWCXpx54jivMwcT1arVLnIAPE2EOcipgNKjrVS0Atb
         cf916ZUdFvnhkA9RKfbRqLVN+Lsig4oFREk89/e39lHkzvtTiTyfiMavqiHv4brn3SXg
         cceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904609; x=1769509409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWwNE4XQpYgK53ZJ0W2IGDAxdWbROmXWumqVJ7C/+34=;
        b=DKgHouXrO/AChSXpxriuaZ0nl3cpYSwfNw8OBTLfVGNfWBeFKHys3EF5OMk/H2ByRy
         jEaKOmGJNn4lm36kWG8wY9J1SaggkfXnStrbQx33pHQvKLvkQIbyfHfY+sDIuK60kQRr
         w8XUpwaOeW3G/teoz5mQMwHiWdFXMzTEAY4WZzFCM0mi47ZdXnyh72oC8C+qhPVSGMFI
         t1mKAWWaBQvKpCHpYTcSb5SyFLwz5rkWraShDeTzRtrbNv7XtWVGcC0HIKlpSGzY5jUB
         iqx1s85eDbDIHZDtsdQQwIz3b+Vb9wtSs6hTeZ4xDRWb8wH37JvLcC8kJXiEo8hvZVev
         ZmZA==
X-Forwarded-Encrypted: i=1; AJvYcCWWSCczoda/wyIsoV1NR24R3UfXZbexPUbOWlZJevqQGvMhbWVpqAS3gP6efDCvH6CLDop15tVr/pc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzf3JdcRXcYXKpRGvPdIv5N177bglnuNtwjn3ZpNgPWhuz6nx7E
	tnMLn7LC3MG0EoPjFxySXQ0oJ2NuiptVpUMif/wjGUb2pMj5/0kbZBXs1zoaSoW42g==
X-Gm-Gg: AZuq6aJal7A2WHgms9d+ASLBFzs1J/7oiMITYVvZGTllmVUXXSB80Ykc3Ff0NSXgM/D
	DmZnFiVNNObeNSM+6U4TR6CDpG4toOyoaON8hqDtnZNWwiZyvXUwPSLM4DJy3daHmjq2fLUMOjp
	9ZSOogAnzuYVqnW/ZAaLCOxb4/PzVcra1y8dpBIYKoPpc0CMDZ8LNzP2o5YbHyuMHgdVJxzvKBB
	qTDzwTFmk1x1DckmmnODAsqe2PrVg4SJniF8ZH7oha6jfFgMtSBnFjcYDxyqMz0hFJlUvPmrwVA
	GiA7UiOvUoDh+pzv0q4avbkQFiAQNCvhrUgKUqbgtCQxJvpFPnc5HrJslhlLOPtQuaCISMLpBkV
	K+OThdMQClys92SSocvIPH0shbGzhsFxJliXb4WFoObTDpu3SzsKG1oGUhbPk+g1iO29oBf8JND
	b8hrGTQ+WfXyIxI05Z7orf3d/9hGBo5DWHy4LsdxUkovyEir6u4r02mxdokmxRL408zMLHEsCJE
	GA=
X-Received: by 2002:a05:6000:2210:b0:435:9606:e78c with SMTP id ffacd0b85a97d-4359606f13emr193961f8f.14.1768904609462;
        Tue, 20 Jan 2026 02:23:29 -0800 (PST)
Message-ID: <b2a3f79e-8e8a-4dea-aaf0-4f506c3b880b@suse.com>
Date: Tue, 20 Jan 2026 11:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] xen: Allow lib-y targets to also be .init.o
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260120093852.2380-1-alejandro.garciavallejo@amd.com>
 <20260120093852.2380-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20260120093852.2380-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.01.2026 10:38, Alejandro Vallejo wrote:
> There's some assumptions as to which targets may be init-only. But
> there's little reason to preclude libraries from being init-only.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



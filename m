Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE22580CABE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651799.1017648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgDJ-0000tT-8Q; Mon, 11 Dec 2023 13:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651799.1017648; Mon, 11 Dec 2023 13:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgDJ-0000p0-59; Mon, 11 Dec 2023 13:20:49 +0000
Received: by outflank-mailman (input) for mailman id 651799;
 Mon, 11 Dec 2023 13:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCgDI-0000ou-4a
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:20:48 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18622eda-9828-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 14:20:47 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1f47f91fc0so512194566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 05:20:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sf22-20020a1709078a9600b00982a92a849asm4859104ejc.91.2023.12.11.05.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 05:20:46 -0800 (PST)
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
X-Inumbo-ID: 18622eda-9828-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702300847; x=1702905647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsL8j5ETEISIA2kyiKQ2hfctKZjMOHpwxzGX2dOt8OA=;
        b=EyLsgdj28qorI1muMXfz08lRRdWAcTvPUX6z0KajaJoGnuI74bmGU7hqu/giEMVkw1
         FLQrjQU3GV/C/ndeVLZW6pNhLQSIcM4GhD9s6WAathDZehvwqmAw7C+ZAgiz8Ba20F+6
         czAJNLG/fWdJ3YJ1AVvaCga+ypeBYbAoaQsucmppMLQ36X8JmbfW6MuiKaheakqDBhGL
         7DH2dKhvhD0rIpUUV5sARDfX1SauX0S5chzjOgxzW8tNVnuneymJMjG81oguzLBzDriO
         n2sLFHT9HlwDRCgQTVekdB3n/gIkLZZI5xYVJ2wclJQSl+sNQIKbDxddqmJaugB8TPhl
         6Clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702300847; x=1702905647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsL8j5ETEISIA2kyiKQ2hfctKZjMOHpwxzGX2dOt8OA=;
        b=PngeV4cgpoCAsW7XPOsSdKV6hMXG9kMyMM0N17bDyvEUN3TfEiDvy6DDOqibb6ptui
         P7xD8gk/D7SQ1gpsOUfaNTifFo17eeKTEo1+ioZ+K8X8w5e3O8iYT4Qno7+B98/rEMA5
         uSn1Zvul62CFglPrsUcjRBuA2+uZpOQimdH80HoKs5PZ/0vweBy9JwjXCcA9RdZxs7dr
         TVF2QUHx3CjqYedBx8fbg74t0dkH2ixE6c8EXPVv8jTSsQFcJeWCO1m+cJyDrMIIdk+j
         VbCB9kCjENaI2QbTk2Brjk4yQ7jhK9O7WQmFlaPYvjj9oY60bBJc9+FKFMtTd6Al4Sjz
         ZKCQ==
X-Gm-Message-State: AOJu0YwCauPwN7KDPkt7fCAf8p8XeVWPlLW3aWhZXAJLdT6SOc6HRHBb
	KDFfvNRVW+/51hP/l+9BJ0lj
X-Google-Smtp-Source: AGHT+IE5f1thURttX24PJxmrsvIqkyDizVedbWV9xkOf6gJHaEOTpdJKDB5/Tpi60BZo6EK3oqt+1g==
X-Received: by 2002:a17:906:74cf:b0:a19:532c:7678 with SMTP id z15-20020a17090674cf00b00a19532c7678mr2278374ejl.30.1702300846771;
        Mon, 11 Dec 2023 05:20:46 -0800 (PST)
Message-ID: <44bc9cb8-5465-417d-93a3-bb2b2cda9b8d@suse.com>
Date: Mon, 11 Dec 2023 14:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/5] xen/acpi: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <47c08c496a403d60bbf5b18c7a079ac7a575efbc.1701936906.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312071643240.1265976@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312071643240.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 01:43, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4FD80CAD4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:22:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651806.1017668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgEI-0002IR-Sz; Mon, 11 Dec 2023 13:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651806.1017668; Mon, 11 Dec 2023 13:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgEI-0002FT-Pu; Mon, 11 Dec 2023 13:21:50 +0000
Received: by outflank-mailman (input) for mailman id 651806;
 Mon, 11 Dec 2023 13:21:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCgEH-0001Dk-Js
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:21:49 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cb6c0b8-9828-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:21:48 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a1e35c2807fso592599866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 05:21:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 sf22-20020a1709078a9600b00982a92a849asm4859104ejc.91.2023.12.11.05.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 05:21:47 -0800 (PST)
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
X-Inumbo-ID: 3cb6c0b8-9828-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702300907; x=1702905707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dVSrukEZfExlaUpZQoYOUi/ZxibAVaRdnsBeai8h7e8=;
        b=XqqGN38noY5w1E1iPHwEhEKdt+QCl1Dp4Di/XK19VV/7aaAyLO1XvC/ezKY9kf/mhp
         Ii90Ucl+27pAs5fQG9zTAazfq4M43V4I6V2UfIgkUyCUB7JETjkhjwjoPH7yrwRpFnOJ
         4E8l1o9Evp8C9dJKHMwlTwAKCjmeoP4mnNj6AGDHscckwAyxzNQAMldFUWoAM1uXh8M0
         Ts2ADu7QQG1LIOvF/Aoncx5iBNpsphnpdwOOb1mxXAjpv4BVC78FXLcSN+Gl1oR1e/xZ
         NZ34PqjEVKrK0uPow685+pRpD86+1BpP5JSUfW/h1CYagpl9ZxTJOFKUcKELneRO0KE4
         wRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702300907; x=1702905707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dVSrukEZfExlaUpZQoYOUi/ZxibAVaRdnsBeai8h7e8=;
        b=XMrd8UygqCNSBWvWTNTmpETuqET9fVki3WKLgVVbr+NzL2RJgeSRGARw0fZOyj2qpy
         RJ4tKgPqQP++JJHFul6ayPPz8xRoSkhVIp0OzMHMua1/WvAeSlT9EpeNoBwlqtuD+tw6
         BXBBp65mUx4sDBTUpNv2WxkyxqmHZ9dIJbVz3vYMALJItHck6F2RpclyYuEkkqgbGNSm
         H1OkCVUfz+Y6sMtBZNAll5iAfEpadquA52OVKQG6ZPUlS2NKk67JTrYafISGJTpK3m76
         jden4laO6OLbPQr5UtbvUffT9NrOOb8y76YRH1PW1OxaCJDLuWJnxtbFEGroy5pq6nww
         USVA==
X-Gm-Message-State: AOJu0Yy8S5tj73XhuWv1qbRzou6Etb1J5dkXmWRZpPeD9VdgpkjBMzqY
	Vub1hlQEvIaJZRpTID2HYYBJ
X-Google-Smtp-Source: AGHT+IENWfI9o0r1b5MWqndW4pNwT/AVIE11txsOrYpODwyBf5qEodtgX+oUH+gAV0BN4q/H3Zl5hA==
X-Received: by 2002:a17:907:7f29:b0:a1e:cb47:3785 with SMTP id qf41-20020a1709077f2900b00a1ecb473785mr2595285ejc.68.1702300907534;
        Mon, 11 Dec 2023 05:21:47 -0800 (PST)
Message-ID: <d10ae5d0-314f-4795-9f90-f7028e599093@suse.com>
Date: Mon, 11 Dec 2023 14:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 4/5] x86/mm: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
 <428b868a2b1aec2b50ccbe510bc3089203ac9c7b.1701936906.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312071640330.1265976@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312071640330.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2023 01:40, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



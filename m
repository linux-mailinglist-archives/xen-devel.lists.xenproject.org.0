Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC5BAFC3E2
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 09:21:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036231.1408496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2dW-0005LA-0q; Tue, 08 Jul 2025 07:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036231.1408496; Tue, 08 Jul 2025 07:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ2dV-0005JL-TU; Tue, 08 Jul 2025 07:21:05 +0000
Received: by outflank-mailman (input) for mailman id 1036231;
 Tue, 08 Jul 2025 07:21:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ2dU-0005JF-7A
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 07:21:04 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a562777-5bcc-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 09:21:02 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so3179106f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 00:21:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce4180970sm10964265b3a.93.2025.07.08.00.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 00:21:01 -0700 (PDT)
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
X-Inumbo-ID: 1a562777-5bcc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751959262; x=1752564062; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bnF+07teFVagunkQVu4hLbeXi/rV/7ZEhQ5IrHYMAyQ=;
        b=S050RN5CbNETCH4wFA3DbTjFJ90xH+2+87ZtIPYrfnctQP3xDkwolKvPghmqxyMWXC
         bIIWpTz9q1j/2HTk88ZlJua9nxHGrNIAk3l3ds9GGPoRozMrnwpdGXU62gkTu1ZmCQeT
         XuPXAEdyvn3pkho5Ridv8hUOE7LE/Bqecj8SFpxT00sDke/8Rkn3Q0fKQrqC2FG87SmS
         fQjcEI6bhS9kqsafd+c/VRWuu8F9d4Rv9p/+pHS9bmkA3hCDClSvwosJuHDWGQR96jf+
         JjoEKSDhea76bw6G0nZoUvs26OgfiBcj9r2w4vPH+FyfujG6bGKNZ18NmegV2R8VzmMG
         lPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751959262; x=1752564062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnF+07teFVagunkQVu4hLbeXi/rV/7ZEhQ5IrHYMAyQ=;
        b=rk+QYmLK0fTZ1ybr1Yn+pFNimWMUEaSPd46VVaL/OyEptE9Bv5o3BSuKo7DSlZPh4Q
         LAqoB/wybFbBiGH66I4TcQnccK0ZwYgnq9ynEK9iO/uokngSDgaQhwnN2cYNnPfyhIRy
         ATMHWp4xtWg0qAX6Klu80WX5UWIikFEz71ldOqIpeNWeRnyzRlG2bBaF7HyfJFh6S5L4
         PXMXCilHnnkU+90rGzaWz1LLc7E7qePgBQsweRU0ouRv3E30bjusTJQ0h7XV7kzpiqsu
         LlDVEgX7raAXd4oo2PdDjuZXYq0T6Y8VFvbhuOda9nUsxcWmjMSrZB3jkrIuJk1SN9bm
         0q5g==
X-Forwarded-Encrypted: i=1; AJvYcCWL4pf0VlGPcz6y5JHK1TzZeuPAg1QwN4tdsosbiEz/piYj7FlgVlZjiAeriKULyUnUL74MGC+o3zM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8tGuGYa+zqEB6DRi/fFKXNWUTnwQtC+w2ZXibVN0Ox7m4ZCGN
	Po/5EXLh0ukqa5I8jMOk6TMv1cRRM7mpNWcWGeusVd19CkFH2Yk7V7NvPPgHG37mFg==
X-Gm-Gg: ASbGncsU5NcNyRqqDB9hse2/4L2pdCS1eToN4/SKJiiylyjAEOcQdWJ7/ayLZUmony2
	7h9PfQONraSUDNw2wGQLlel1lckH9MhaRyPnTM+0nZkygY6hbKr+zr4xJu88EMITU9VIleDuaFb
	xQyUVBWh33op4srNe/yPifJurjvWFLct0gQlCABvoVe/jnYDk3/bFzHKQ4/D3Y0tXDd3Wjxy/Xq
	ScUQyixROxymrHO2d1RZfI3wEGFnD8AEVs5dSz9S5cO4T5y4NOM/Nhhwr2MqGbkZnWR35wsrIw3
	618hxjJ8eFCfMnXHbzOTCV2Zu9WO+duVueBS53KCHSA52cp8T7/2mIQH6BKS9XVFIjRIzefoAzr
	5I5mE2mEbpD0IiYfxvPjIjA7dQW9pLZ+Qmm3dA0oVH4GxRSPrDBfKT8GFJQ==
X-Google-Smtp-Source: AGHT+IHYsndsq5O8Ly1Am/08Tx8f5XrX/AM8OYQbX97x7GnjJRPHo5yWO/m46ccSp5LqIWLlMAZF/g==
X-Received: by 2002:a05:6000:18aa:b0:3a5:8991:64b7 with SMTP id ffacd0b85a97d-3b5de034c84mr1422112f8f.26.1751959261655;
        Tue, 08 Jul 2025 00:21:01 -0700 (PDT)
Message-ID: <6b23c2a3-9e2c-492b-843f-c3f830394f3e@suse.com>
Date: Tue, 8 Jul 2025 09:20:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/x86: address violations of Rule 11.3
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: victorm.lira@amd.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250624002018.4121819-1-victorm.lira@amd.com>
 <20250624002018.4121819-2-victorm.lira@amd.com>
 <b31da849-283e-4f84-854a-50da2d0878d7@suse.com>
 <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507071453370.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.07.2025 00:00, Stefano Stabellini wrote:
> On Tue, 24 Jun 2025, Jan Beulich wrote:
>> On 24.06.2025 02:20, victorm.lira@amd.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> Use {get,put}_unaligned_t to ensure that reads and writes are
>>> safe to perform even on potentially misaligned pointers.
>>
>> Also applicable to the Arm patch: Please can such patches mention the
>> main subject of the rule, not just the number?
> 
> +1
> 
> 
>> Overall I'm unconvinced we really want or need this on x86; I'm curious
>> what Andrew and Roger think.
> 
> To be honest, I had a similar reaction to you, which is why I suggested
> on Matrix to:
> 
> - deviate the rule in its entirety on x86
> - deviate the rule for all mappings except for devmem mappings on ARM
> 
> Leaving aside ARM for a second (this is exactly the kind of very
> arch-specific behavior that is OK to device differently per
> architecture), would you be OK with deviating the rule in its entirety on
> x86?
> 
> Or do you prefer to continue with this patch?

Neither. Imo globally deviating rules needs to be done with care. There
are, in principle, misaligned accesses in x86 which can be made fault
(and I think this was mentioned before). We want to know of such risks.
Hence for a rule like this one more fine grained deviation is on order,
imo.

Jan


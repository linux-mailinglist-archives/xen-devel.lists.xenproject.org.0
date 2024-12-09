Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F19E9B6B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851644.1265686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgSn-0002Qd-8V; Mon, 09 Dec 2024 16:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851644.1265686; Mon, 09 Dec 2024 16:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKgSn-0002OK-5E; Mon, 09 Dec 2024 16:18:25 +0000
Received: by outflank-mailman (input) for mailman id 851644;
 Mon, 09 Dec 2024 16:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgSl-0001HC-A2
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:18:23 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 360b4c47-b649-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 17:18:22 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385df53e559so3264109f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:18:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8e3ec6esm74417055ad.52.2024.12.09.08.18.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:18:21 -0800 (PST)
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
X-Inumbo-ID: 360b4c47-b649-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733761102; x=1734365902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iQfmwdVgORMql7gpEwdLm0EaXOmhgf8vsnXgXGLuUjk=;
        b=KNAGFRADOrUD83ssOCvAUeMJ2X/J87kBMapqmk3d1RBLOLMxRavEkjIgA9uJhZ9MlM
         LqWstiNOBc5Ru2ObEtDRqX2k88ROpWx+cEN+IL4xwTMLVesiu/m2XKWaybVTP7to2cDU
         a5/PN0ljdWev6/CF2QEQG0scbs7XhQF4rulcJKtoF9MABJDjOINfh+aBuKpny8RAM2DL
         wQEhEJlO7rovNlE7sNp0Qzt53QkrXsSLp5PM6pw9UsvpH+guLqUJlLiif0ypzDbJhcoT
         xtrB7joOMS5gf1Q5f4SWtSY9i2N4Zn29c7jY6VGDdxuiyC+szwa35CX4obEZM5hxCF6M
         N2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761102; x=1734365902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQfmwdVgORMql7gpEwdLm0EaXOmhgf8vsnXgXGLuUjk=;
        b=taWaeHUjMxuguqY+J1l0ZAN88Op2b2FmsgCTKx61B9fcU7nYR8y32wXUM9sRUEeEsr
         Lr0dOO4PLz+4blZibZgIRqWHR6kgw5xzMZ9dQxk+suVrCgUgTSZU0E94sX79mELf+7PJ
         4oT4HXx5XI+jj+arEGYmdPO+QSGmEDqxIIpjtGOdEMEIO9U6T/63Crwr8+8XZZRjxN7a
         RqrQeCaJF/15s6KdSU5svejlxexExyhVfjMPWmH0bQei+S9+pHiB2Ycp07dHFLU3N8eM
         GW13Dyv3Jx7XwR0gBJo8LmDyE7BMlX5FWtPQVH0caL81JHV3GFvweB6XzdQORebdv4x8
         rRAg==
X-Forwarded-Encrypted: i=1; AJvYcCXuu4LVCUCtltvBi4YjsAzRQdIvgI/B/gl2rImaXGHYpv6mPwRGdzT5239BUQuAmY7K3/EEkcmBGnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWkLNO0hXnUqMxWc28u1wwZ7bzC3UdmNOcRjT3SchMGfLFsfxq
	Wi7hg617PkK9y/ZfdGUn+75HPLfWMFarfc3aDxQEvGs3ncISMYsPWSZXi4X4i47XConnkvhgAXE
	=
X-Gm-Gg: ASbGncsjE/Ia+jv6K/nxOmzrw+tdKu8bVq9uPYmiWDcQsGHz3AxS2kCZuh8fyoJ8rcS
	7GijVVOHaH6XRpSGZrStGWNslyW4XHGnlKT5aqE+8rE4ZZsfLMQ8L00NVprBnkRsLfVJxYI47mS
	b88NeX9eg4grZxXHEQxmMwQZfvV9TqXHf+v8tK9QUrIFL3YMtzMNIZpzKbESR2bXYoGjH0bxQKH
	7Od352xuAN69swGOHE0LNYKU9Phv6xfI7+iWraJ3Mb1uQKzbudYLu65jSpQmTJcJVGvePI0vyB2
	mEXm4qSZ7FhbVoHXFJIxDAd/1+Mctp1MzXo=
X-Google-Smtp-Source: AGHT+IGZlFvYdJ887lT8i65rNOzK9G9KUWUwQwRsQPQdB7BhQmB4iP5I9XiUiJ/xIDuT/8ajMmRCdQ==
X-Received: by 2002:a05:6000:79e:b0:385:e9c0:c069 with SMTP id ffacd0b85a97d-3862b3d0941mr10259087f8f.57.1733761102342;
        Mon, 09 Dec 2024 08:18:22 -0800 (PST)
Message-ID: <55c537f5-0fca-4524-b786-b3c5eac6ce92@suse.com>
Date: Mon, 9 Dec 2024 17:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] x86/hvm: Map/unmap xsave area in
 hvmemul_{get,put}_fpu()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-7-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Again with comment style adjusted:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 293978A95C2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 11:13:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708139.1106768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNpr-0005Dx-Pq; Thu, 18 Apr 2024 09:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708139.1106768; Thu, 18 Apr 2024 09:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxNpr-0005BQ-Mp; Thu, 18 Apr 2024 09:13:39 +0000
Received: by outflank-mailman (input) for mailman id 708139;
 Thu, 18 Apr 2024 09:13:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxNpq-00051f-Lj
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 09:13:38 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0af71fb-fd63-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 11:13:37 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516d487659bso636023e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 02:13:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f8-20020adff8c8000000b0033e7b05edf3sm1323957wrq.44.2024.04.18.02.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 02:13:37 -0700 (PDT)
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
X-Inumbo-ID: f0af71fb-fd63-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713431617; x=1714036417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1cdEnsvzNbAl7qYThKaxpDhPXD4+FrGRjvFF/je6dM=;
        b=CYuwH3pnTc0FRhxoaesNsldZ0XzGT8v7Ike/yZPt/3+sCAVnBEKrXYecGk+kkA+yyy
         JlrcutYQCIG4r1PMy9Ozs27jNmc3Fx16pvddw8pJcGjKlsOHuirdycjZTXPjW1o2yHO1
         BaHVzjRchyxKBPQoYfu4/jhYUiKcFnjGpGqiJcucPv64UI4FJAvV53bR8EBc5xopFso3
         JK/Zwcb5EqR17Lytv+VFU43GlDB8Hk3M+EQSdMHGc3i20RTFvUcoCmIVT9TwBGNs/QKM
         n92hHIiIe6AhXK2P5Ew00X/Xi0aym+/dZwTyfMwMRCDMdn/tr438PVpKS9eRnGoUYsus
         6iOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713431617; x=1714036417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1cdEnsvzNbAl7qYThKaxpDhPXD4+FrGRjvFF/je6dM=;
        b=RNp4kDJb7h5ivI2wKTl/ZkagOf/Ciw3WnOJ+om0B48n30FApgXbuOtcCKnEEGi9vq/
         Qko9bBID+WyFqSG+uLFiQVOiok3AIVJ+JIAbnfOdpz/xqDaqBrGuG8MLc3Fzo7L75HcY
         7J5D0IYiiutDIVREKBVP3tOv+/rEsvrUIZ1AAGgsFLPJf63kQKV7yo00PfvioxoB6diQ
         JKJH1DaJUs2rgP+i6aTulzzgjAutNXCt9lI3ldUTAAPWacVYBKWzfIAg3qkm0CwUijei
         zv1mPFMZCNbJI5aKXAwenJmg21dl3wgL933qSfkUZbWWgHcwT/7YZ/7QcGFIAgux64Ll
         jHXw==
X-Forwarded-Encrypted: i=1; AJvYcCWaYt0vFTs1bUxKqT4E1nLdCyCzYK9notNCc1x9Abju8Q2YM+32tFAXwA/b5eRUVmlmgCo/qVH2toYVoQMWDG5TMec2jdpQaziCb0KesM4=
X-Gm-Message-State: AOJu0YznVnavWpFzgYL87yoWXcXCTsknrawe1lfvV17yfAQbOuG3yR2G
	PVEdhnYAaU8K9iGfzGfUbVn/5mt2sEw4dKNYSPxPO887fTfT6eiAzdnS7WdxlA==
X-Google-Smtp-Source: AGHT+IGMBm0FQRKOskA8Ufq4GMXgRWEPLzx9XpwL5hb9b9dPPRZAiJfEXm6KEjbdfkTQ4PZMBDca+w==
X-Received: by 2002:a19:381a:0:b0:517:64ec:1251 with SMTP id f26-20020a19381a000000b0051764ec1251mr1048587lfa.15.1713431617233;
        Thu, 18 Apr 2024 02:13:37 -0700 (PDT)
Message-ID: <114562b9-1ab1-40be-bf23-0321a1c6cfe2@suse.com>
Date: Thu, 18 Apr 2024 11:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/gnttab: Perform compat/native gnttab_query_size
 check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
References: <20240415154155.2718064-1-andrew.cooper3@citrix.com>
 <20240415154155.2718064-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240415154155.2718064-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2024 17:41, Andrew Cooper wrote:
> This subop appears to have been missed from the compat checks.

Fixes: 5ce8fafa947c ("Dynamic grant-table sizing")

> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With the addition that I'm now sure Stefano meant (see the reply to him):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


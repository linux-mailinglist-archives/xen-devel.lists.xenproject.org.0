Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77469B7754
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:22:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828521.1243422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RNJ-0002XQ-Ve; Thu, 31 Oct 2024 09:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828521.1243422; Thu, 31 Oct 2024 09:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RNJ-0002Uj-SV; Thu, 31 Oct 2024 09:21:53 +0000
Received: by outflank-mailman (input) for mailman id 828521;
 Thu, 31 Oct 2024 09:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6RNI-0001uN-Bn
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:21:52 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e3ca0f6-9769-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 10:21:48 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-539f72c913aso1113447e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:21:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116b11esm1507049f8f.104.2024.10.31.02.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:21:47 -0700 (PDT)
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
X-Inumbo-ID: 8e3ca0f6-9769-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzYiLCJoZWxvIjoibWFpbC1sZjEteDEzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlM2NhMGY2LTk3NjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzY2NTA4LjY4NjMwNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730366508; x=1730971308; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zwnf0906TY1Sfo/7v7GteN1T7sobQlT1JZYgzFblhI=;
        b=bK6Q7tIhLgCQe8lyUk8eeRNQeWGiOoD/Z3uxEubec3wbvfsLWuMXjxEen1fxN7P1HC
         WMXjSugJFFYWiWQW/Pj+U5HnSz+XMvMHwMhGt259g3tfl2ZDuAxui8gUw4T6+G3r3b4t
         zHvLh8xMGUhvOswzMDm3BH8/Ym03Y81Z5JsEdgBrBnP+n8nGp2DiIb/bJ7pQAfvdX/9s
         ClgREuF9bK7XR1P78Lo/UO69WeNxylJ4Y0+2W9/zgbOII2ZtAhlzeDga/ycSvS3kRvvx
         z9IBCMEHYh9awXFbD3mkAaiwhjrrjprx2sfS2uhoSqoZA1lWjMgOExB1yClqKwIhZvpo
         LkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366508; x=1730971308;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zwnf0906TY1Sfo/7v7GteN1T7sobQlT1JZYgzFblhI=;
        b=l6/2a6ga5pYjzrz+IXcwDjum8tCJM/dneQnqORN4f1Gbr7vpLdtu6Wx2Yrna67MDAM
         0VUVLePEKfGBrX3Nj/ZS3gq2fyCm1nrC1mMjOAph+quitL5RyVH9v8NHXr0I0c6DoWB+
         K/XkuvUSZfdXkoxdGm/mxO5wXtwYN8BOxSUVfSJ9taPp6oJ190f5hyXXLX/h3CUA1HZZ
         gWZExv56kPajP9KcM3mrLDZYcihDOC6pl6RxF6Kpu0dQ7h9ncRQxhoQig9V/REg9sX45
         qrtF4DjYRUbrUSnTRDIdGRJnFRGpeIHrd9AQFj7KMZmdr6I6/DMrILrJPv8mWrg5meEW
         aD5A==
X-Forwarded-Encrypted: i=1; AJvYcCVkyqjflqICdK33eYD9tShQU8WN68r7Gi8vIy4UEmqgiWkQwTrQN0u92C4W7RObkeULHW03b5sPBDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgfGqw2FR1rTjIORyI+iZivgQoOxnr0G9LDFyEktyVAcAwNE3s
	w/IeZIAD4/nHLPuX/IdfDuyy1ESy/qtp8VtDbBpdUcHlpg+zi9xsF6UdonvVZw==
X-Google-Smtp-Source: AGHT+IHqwl6C2/XUC1zrYhtVzXMSOmqxjtdQrIJ8R0jDKAluz4pbnt3vF6yxLjJRwjzsTB4k3pMLCg==
X-Received: by 2002:a05:6512:3b0f:b0:539:fc42:e5ee with SMTP id 2adb3069b0e04-53b348e3390mr8514976e87.29.1730366507994;
        Thu, 31 Oct 2024 02:21:47 -0700 (PDT)
Message-ID: <9efa4bea-adbf-4ef9-b8c4-68f28652eb22@suse.com>
Date: Thu, 31 Oct 2024 10:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Config: Update MiniOS revision
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241030175944.2726594-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241030175944.2726594-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.10.2024 18:59, Andrew Cooper wrote:
> Commit 6d5159e8410b ("Add missing symbol exports for grub-pv")
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE634A64ACA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 11:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916517.1321591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu82l-0000jp-0a; Mon, 17 Mar 2025 10:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916517.1321591; Mon, 17 Mar 2025 10:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu82k-0000gk-Tp; Mon, 17 Mar 2025 10:50:02 +0000
Received: by outflank-mailman (input) for mailman id 916517;
 Mon, 17 Mar 2025 10:50:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu82j-0000Xm-Cs
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 10:50:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91ae64fd-031d-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 11:49:58 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so13851135e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 03:49:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe2927fsm100965945e9.18.2025.03.17.03.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 03:49:57 -0700 (PDT)
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
X-Inumbo-ID: 91ae64fd-031d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742208598; x=1742813398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lq7NTYjdbZkoO7Bs4tkM1hUU4z8gLRb5oXwZhPHYdVc=;
        b=UI1GyUU3vfAWCCChZVr5ed6pPCuTItVsOAEKuIJlvZh5qTCZAuyFw441Q3LPUJt6bE
         uADEm4izQ1i7uIAo5m5lj/HN47eBSHR9fYF5f66t4xTdetjCM1veJnzkUK28pm7R8uaR
         wDnkzj9Q7Ies8SFCXiAfyJ0aSHcS7cPDULkycNgWwvyntZnlDYOou9p0yzdoQZxER2qo
         WYmxQuBdxWlVGdFuH97A+bGLhKYLA5u1OFVRfOl6vOffeYNnt0u1OuSH2lNLq0k1G4dB
         OBhZiMFz4XbBfHwgEROl99pTWcq153vytRzGzcN04LWZypjJKtc+tOgkbkbU1cq7U50H
         zlLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208598; x=1742813398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lq7NTYjdbZkoO7Bs4tkM1hUU4z8gLRb5oXwZhPHYdVc=;
        b=I4gqtHk9UxDEl5QuXq5DXANcdzkS0HCrH6gddDSyzEkQ3amKovlqBR6JP81Vfk0xuV
         Gs8sQlQlbJ78o+CEUSoR2W1JbTr9JTNiWAEIoIMfKdNCSfoyNsPg0AueMsvUhcdVUlDC
         h4minezzdl8PhFc5P2hoxJ2uUY08wMTIrCwVCpZ6TP9ormUCD3mgc1vnmIQrIhkDu+Qh
         zEdrNBKWOdMbKrOnvacKN1RJBnUEEscjfipV1IZPA8r09+amqTW4+NajH01+079GkNCY
         7C03Ja/OizF59rarBK6uEZeAYr3KJxic703rot95f3Zz4+DmCWuxSDOsOE8gDwvpF9T8
         iwzw==
X-Forwarded-Encrypted: i=1; AJvYcCW7vfHtu5eLpHIy5qdWYT9d2SS+OXOw4cPLVBOanDne1JbpZrJyWs5+DOJbtpKVuzxT8KpF8Gb9Qxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFTAkhXQilPtXcAescRwj0GaKYDfKsMKvePqWQkZsWsTzNRZxx
	1KZPO/v8hvDSjCx+GYrL7tVdpSAByJBAq1XX4lM7YlOrliaRgsaZJEJVY+pNPA==
X-Gm-Gg: ASbGncsEQqdbCH1jNOwpjphMnSMTFmxWvUUnIK3ik72teDDkcW7CZVfEuoyJkOz2JpT
	q/vfVcK0hUIMcPKUrQWmKDKxAl6IiW/vohaeIQCWyrNofvJwAviU/i+EgouMLlh8onj5YCuxOC8
	5vehC5ErJxlSKPGxZYteYBNw6SyuHZck86vZkSBYhtUWnrMrEjOJbyc8XJAsRli6tqrq4/cN9MH
	GtTgAMhB0yWb/XtaKi6ELxtqZmSkGsQYKmwWa7aQaw6lO3C3V6b3Reg2QtAcNOg/4C6Fz1S8bcD
	cQFEmKSM/afiuhoj89boy41BFwTRJhVXUW35OYiOplh2rKE4N2mwnQJlwSdPK45UOlezyZHr32B
	MqLgZpXtyc/NnVT76ew8SZvdq5j9KjnI2sF3WsBCX
X-Google-Smtp-Source: AGHT+IFBhPZILshg5aQ//1f55YVxNPOgw4hcLLmnOfPGYfkhVhrNdC66SSI3z94wUtsyiZBkvO+UPQ==
X-Received: by 2002:a05:600c:511c:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-43d1ec729a9mr139350585e9.11.1742208597765;
        Mon, 17 Mar 2025 03:49:57 -0700 (PDT)
Message-ID: <73cc236c-6209-48ad-a002-2d7bf3341999@suse.com>
Date: Mon, 17 Mar 2025 11:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] x86/regs: Fold x86_64/regs.h into it's single
 includer
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250311211043.3629696-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 22:10, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>




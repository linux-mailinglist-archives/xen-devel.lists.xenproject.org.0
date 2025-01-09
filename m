Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D6A07C6A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 16:51:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868881.1280394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuoA-0003JP-LU; Thu, 09 Jan 2025 15:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868881.1280394; Thu, 09 Jan 2025 15:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVuoA-0003HU-IJ; Thu, 09 Jan 2025 15:50:54 +0000
Received: by outflank-mailman (input) for mailman id 868881;
 Thu, 09 Jan 2025 15:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVuo9-0003BM-JB
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 15:50:53 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e0e818-cea1-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 16:50:52 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4368a293339so13308045e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 07:50:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e6249csm24586165e9.38.2025.01.09.07.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 07:50:51 -0800 (PST)
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
X-Inumbo-ID: 80e0e818-cea1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437851; x=1737042651; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/6AbTStBIBSM87HCQWxECtRStNhq5jWk924Q6zyzDWE=;
        b=ZmIxXy39YTLRnpJlkhAqAYUR/w1Zq99aea6Q4rW9qR3l+b4CFqO4x47f+FtYO1cfIM
         Du2aOiP7w2bIA9deVlsvb/VqFCf6uDJ6W9XHIWOUE3ZrgL5jcnYEYfArEmzvVpP7Jixz
         A/BbV4NYT0EU+z6Tpxzm9rJugl/V3K2h6n5OLL1Nwjf2TogMceN9zGgHJPwX6loRA8ik
         ZZtmGrVD8xLJVma1Qob4gfld5a+bVJUHgYQyenvzZGXxWq3wU+hE/ZtvCoVJU1qdYeFB
         f6+Vq6y8GOEOYNuvPZgpMWG87rGULYjhygeEP7WZqYaPV4aR2bTFjQ3Z1Mykl8c53RKw
         b25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437851; x=1737042651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6AbTStBIBSM87HCQWxECtRStNhq5jWk924Q6zyzDWE=;
        b=oZWYpGkPWjufv3tu8lFhOjuc+fkcyjAtzDFWg6zK6uhnl8DvrOOYqjsxqGmxkmTgI8
         jltIaoUIV92xRWiVm8cMoucP8JQerUOJoAthCWfPXcNFa5TbI19ztNS1RPqQ+K/J+S0n
         Dck3SwkOwywfIEHYGudRpt9Z9IFyyuemnrhCKh+gM4lP4oKosJChs5CJeyKWmQ+UftVD
         kcoCcDS6RYXBR16ou7zpJhaScwo9pvVv+jHAhHIujWC6YPF/UYYgmNBUcQUrSfWhb+7p
         M1fTsV1x2OdDoliApJBW+YecCwAaMxWIdKq9SI7de/DzT5/a17spcCx2CR4RX+Gl6Ybf
         Ovdg==
X-Forwarded-Encrypted: i=1; AJvYcCUhBZWJFlRr5M/H9WFRt6qndKR7yaQwjVfV5pxgV1DmmnHSOJ4lnANRvw+Xd3RBFgkHDT1rcuAzUqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPKoyh7HTSobgxiUsAQ9nL8FYiGKvp4nGbFIk6DWzXqqyPtvD3
	InH4YcYxuy1A3mUi5CpEAS50i6VmF8kO5A/v+kql44wUQMTyCtoz93iur+eh+A==
X-Gm-Gg: ASbGncs0kK4aAhbOgw5PpRI1vDRKhdzyhP5zeOKbVhHDzCRXlAF165aVktDSP7cbwdZ
	gq2kaO/T0rqMqb+jeeNAlRLYbxiUeRR3BunObhXKLnfP3odoZyRc5in/pm9ErtIst/c78POdKGc
	09vH5tsNh53W/THOu2IsmP5ofRs51jZeF4IYxwGkqzZjG17e0VlOrvZKqTATgexETu5V8UMVQq9
	mhMkql039kHxcu90FalAHZ/4RTkHl3CDc0/CJm2UjJBAScriykvLWVFmMJmOTXkTxPcjMrRxDOp
	my38Y/uj+8AKD7J5g2a2yANwO41yTLhdRVRPek9qVg==
X-Google-Smtp-Source: AGHT+IEd2Qcp9nXKYZdraQrUkbzDZJhRjXmjipVtM7bKWkCp5E33NBhLqqnhFzt7UOu5e8mBLEwCCg==
X-Received: by 2002:a05:600c:4ed4:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-436e26c0a33mr73657725e9.15.1736437851542;
        Thu, 09 Jan 2025 07:50:51 -0800 (PST)
Message-ID: <1d244fe8-96a6-4597-a741-2b4ec15a71fa@suse.com>
Date: Thu, 9 Jan 2025 16:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] xen: add new domctl get_changed_domain
To: Juergen Gross <jgross@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250109105935.23585-1-jgross@suse.com>
 <20250109105935.23585-6-jgross@suse.com>
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
In-Reply-To: <20250109105935.23585-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 11:59, Juergen Gross wrote:
> Add a new domctl sub-function to get data of a domain having changed
> state (this is needed by Xenstore).
> 
> The returned state just contains the domid, the domain unique id,
> and some flags (existing, shutdown, dying).
> 
> In order to enable Xenstore stubdom being built for multiple Xen
> versions, make this domctl stable.  For stable domctls the
> interface_version is always 0.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # non-XSM/Flask




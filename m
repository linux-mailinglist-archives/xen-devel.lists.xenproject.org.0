Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1908C75D1
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:17:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723268.1127956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7a3E-0005bN-H5; Thu, 16 May 2024 12:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723268.1127956; Thu, 16 May 2024 12:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7a3E-0005ZP-E7; Thu, 16 May 2024 12:17:36 +0000
Received: by outflank-mailman (input) for mailman id 723268;
 Thu, 16 May 2024 12:17:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7a3D-0005ZH-26
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:17:35 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45ce19e4-137e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 14:17:33 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a5a5cb0e6b7so319152266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:17:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7f32sm981391066b.106.2024.05.16.05.17.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:17:32 -0700 (PDT)
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
X-Inumbo-ID: 45ce19e4-137e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715861853; x=1716466653; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdmzI0pblVMHjBethUop9xBQnLciYn98soZ8P6ketGo=;
        b=b8GLsb3JnRpSHf7KuP89TDXX0Jk4FJ8eOChJ4oUdXTLBSLedXyzIQfVx06BuGOTosq
         VhKG67g/nVR51KJ8JdKWUcKqO00l992zvvBT0LQEaslSKNMWhxFW3eS/WxUVCjsFGJam
         gxzGQMQt+5YWQ34F5xBtS0JppC6o4cCVgq3t1jcuYxL28/vPj94mvZd4a63ZFVsM6VBJ
         PMgZ0mtE0iRqqjVrxUDqabrdy4zu8OuXWQ3QKQ5Vgy6vCWOr/yG+UENm69RbkS30Xs+r
         BQdehxpBNIjQ2Lm7fKMlWDpeO3NMgtyTNQp4T8Mr3ZgkXafQ8WqpCgx8Ya+qdq2I2vCv
         3CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715861853; x=1716466653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdmzI0pblVMHjBethUop9xBQnLciYn98soZ8P6ketGo=;
        b=FGdUm2tom0Q239NtHJend4O16t4QO5+1uOd9HbtLTT02FMOckO3EhBZ99xImuUP2fa
         /OGCC1nylaoFuKeFUMjze1z0dVZKv3bsUAFYkuCHMbB+X5jHK4SFvFRzeOw18WStuV+W
         ZcHRR92ikVH0yFmav71iZ7gqO5lvzdI20hZSxk8plLBODlcEXQhq28S5JdK7xqdHG64n
         ZKx5QJmVdLtZyRC/OPlhdQ89zfBKQVmm9DH6BAc97h5wjRMIoGVfadfIvI4Sgnsf+8jK
         fK6gJXNnsyVWrLlaGkF4O1koMHXcVatTf47tntR8bSgUQpv+v2ONNhPgzUssoFm1O5m5
         n+9A==
X-Gm-Message-State: AOJu0YybcMXv1h39kLxkVtV7oMbW+tJXurxZbfphlDnIIhHsbpPazDMC
	KXtpx3/+qFYvvWg79FrupaRBu6MKvxlemFvYx+wyHgHSa4rFFoBwzO3kMQqrEw==
X-Google-Smtp-Source: AGHT+IFqJ0x2u1Q10KzSjaxa4Awg/iKZLxNthUfs22g+aaesWeFD2P5/DXKD4NBE+4zcUw5KOqz8wg==
X-Received: by 2002:a17:906:b081:b0:a5a:5c98:c594 with SMTP id a640c23a62f3a-a5a5c98c636mr846301766b.65.1715861853075;
        Thu, 16 May 2024 05:17:33 -0700 (PDT)
Message-ID: <13bbced0-a704-48c5-83e0-dbf46e2783ee@suse.com>
Date: Thu, 16 May 2024 14:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 15/15] x86/hvm: make AMD-V and Intel VT-x support
 configurable
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <3ad7c0279da67e564713140fb5b247349cf4dccc.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151754420.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151754420.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 02:54, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>> From: Xenia Ragiadakou <burzalodowa@gmail.com>
>>
>> Provide the user with configuration control over the cpu virtualization support
>> in Xen by making SVM and VMX options user selectable.
>>
>> To preserve the current default behavior, both options depend on HVM and
>> default to value of HVM.
>>
>> To prevent users from unknowingly disabling virtualization support, make the
>> controls user selectable only if EXPERT is enabled.
>>
>> No functional change intended.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>




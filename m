Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E628C7204
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 09:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722836.1127175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VUu-0005kU-Al; Thu, 16 May 2024 07:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722836.1127175; Thu, 16 May 2024 07:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7VUu-0005hl-76; Thu, 16 May 2024 07:25:52 +0000
Received: by outflank-mailman (input) for mailman id 722836;
 Thu, 16 May 2024 07:25:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7VUt-0005hf-Eq
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 07:25:51 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84c43919-1355-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 09:25:49 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59a9d66a51so252292866b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 00:25:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a60eabd3csm555382066b.108.2024.05.16.00.25.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 00:25:48 -0700 (PDT)
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
X-Inumbo-ID: 84c43919-1355-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715844349; x=1716449149; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g8CsRgJbNnPgWfuPER+ZlNlEhiVyDxqLDBIYMv25Pyk=;
        b=KEbGIDwcHdIZhTCU+YCSOZvxmrcWwz2qsPRyUqHyHnxT5uR7fuohGySPd2z+MPI0J5
         h3MEXznW0yDIGz8zImr48W/HopqF67w2GVa+vO8844HLzH8u454Y+2V1oBvOWgyOY0QR
         CWBRoYCvjlHudq9JO7B8iavMUGi/uGL4O7VikKIGx8e34LTXlOCZn+ORQcgl8CacW/e4
         AehQw3PeUNnu4UAwOXF5efFcrhxjlkj/AIsXWEBwkY0Ehr4g2tM3nS7NhTb/7kBNBovl
         cPuVRzOHAb4z6sBwCzMUaYp2l1UJpYCeW4wDVv+ZZN8xIxVdqHdxd2sMXcsBlnR0HRGt
         dpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715844349; x=1716449149;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g8CsRgJbNnPgWfuPER+ZlNlEhiVyDxqLDBIYMv25Pyk=;
        b=vfystCRaCdqkKsWowEC8GgK9kFi7074WBtPXOLr5qwMQr+hcOU1q7GZ14f4jASsquq
         mRo96dXluqarsYVWcRsXQat+MPm1SCGi2e8QgfSW9ttumxFxlMJuIdcXP2bmg7/ycHjN
         mD/MYsv1P1lYHt482f5MaoEu9KvCVDpqZRVagGeNERal1vL+4bSSDOzOhhqrKmZPZZxk
         q+uPjojstOqxuvS1MZjDXaAMp3q2MZFk64eaUXfYcf7V4ZyhQB07jL4xzfUFi9MoaMIn
         Skqdx7LT0J8OQ/Fa3iqcxhTz0kTl6BasZp/q5kPgmC4bpIzKJqShztrvV0W8XBP5G2uF
         x7+w==
X-Gm-Message-State: AOJu0YxsMCkvPBWvIkORFOYkLs54FHgbdE2ELuUyiVuqSHDooyAeTQWV
	kmZXbtDUWbKIN2675ItGLd9ZXNBpIFmH1wNLpSE48kYTbO/tnt90JFo1mx7fZw==
X-Google-Smtp-Source: AGHT+IFxMeQfNqT7Ee98nTqgWi+Po6xmaZntUn8ovYs+6HgoJELrGV+J2wAvO5PawlNgP+rC71iCew==
X-Received: by 2002:a17:906:d552:b0:a59:9c4d:da3c with SMTP id a640c23a62f3a-a5a2d5cca61mr1385266766b.40.1715844348605;
        Thu, 16 May 2024 00:25:48 -0700 (PDT)
Message-ID: <02449ca7-27c6-4fcf-ad74-0e570307f17b@suse.com>
Date: Thu, 16 May 2024 09:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 08/15] x86/vpmu: guard vmx/svm calls with
 cpu_has_{vmx,svm}
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Sergiy Kibrik <Sergiy_Kibrik@epam.com>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151740180.2544314@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405151740180.2544314@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2024 02:44, Stefano Stabellini wrote:
> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>> If VMX/SVM disabled in the build, we may still want to have vPMU drivers for
>> PV guests. Yet some calls to vmx/svm-related routines needs to be guarded then.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> 
> Question to the x86 maintainers: are we sure we want to support the case
> where VMX/SVM is disabled in the build but still we want to run PV
> guests with vPMU?
> 
> If the question is not, could we simplify this simply by making vpmu_amd
> dependent on CONFIG_SVM and vpmu_intel dependent on CONFIG_VMX?
> 
> I realize that it is possible and technically correct to disable
> CONFIG_SVM (or VMX) to run on AMD hardware (or Intel) with plain PV
> guests only. But do we want to support it? I wonder if we could make
> things easier by avoiding to support this configuration until somebody
> asks for it.

I think we want to allow for such a configuration; whether that's deemed
a supported one is an orthogonal question. Much like you can set PV=n and
HVM=n at the same time, yielding a largely useless hypervisor (where
perhaps even the question of whether it's support may raise eyebrows).

Jan


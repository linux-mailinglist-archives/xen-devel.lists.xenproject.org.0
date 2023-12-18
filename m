Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3A817814
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:03:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656283.1024363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH1k-0008NI-Tr; Mon, 18 Dec 2023 17:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656283.1024363; Mon, 18 Dec 2023 17:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH1k-0008Ki-Q6; Mon, 18 Dec 2023 17:03:36 +0000
Received: by outflank-mailman (input) for mailman id 656283;
 Mon, 18 Dec 2023 17:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFH1j-0008KY-PP
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:03:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ffc6a37-9dc7-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 18:03:33 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c55872d80so24327315e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:03:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gw18-20020a05600c851200b004063c9f68f2sm41986948wmb.26.2023.12.18.09.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:03:32 -0800 (PST)
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
X-Inumbo-ID: 5ffc6a37-9dc7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702919012; x=1703523812; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwKFU4KjJzrnIZNg60vo8jRViBjBFoxUDzfmb9afjEQ=;
        b=ZUnKh+Z3E33N52lI14lEWTefifVA7kkEZZxkOUcOjauKjAGO75TGHDBwhktGkZWn5S
         5qD+UWU64bbEfWTPKZBk/AzR53Q5YKq51kmbTm2OWlVAHY4M+csAi/e7atkGAHp4URBi
         NBC8l0PPa2Q0mA2g+Aix4Y3tsi8e42SFXwkzffSqTmgIRpfqVZeYXwgzBXrkwTYeZBmH
         YjE4T7X+lLM/mH13sGTPiR2yEct6sAZASI/+lB0YaZSDt0q3ZNc3PXUqmunBX6LexLPg
         S8s07FX9CeSPlCn43k89Ju8X3/kR4o6heSChY1kd4iEUIQHx/9UORPKeCZ8DKs9+TnPM
         Hgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919012; x=1703523812;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwKFU4KjJzrnIZNg60vo8jRViBjBFoxUDzfmb9afjEQ=;
        b=nsSTPSKi+nBsrL6zupXB6NYPA2T1RKAcdVM9LBkXC4bgZo69ZzxKra6pZBxOIzEic+
         +qWBAJYqBTDq8UI/wHtfCJSX9+iJB4e5CK+HFil3/t1CJ+NgXJFsnYb/NKYmzqy4qb2j
         cLu/WRoMm5ou9EirRoSTSpqK6XXgVRXb0g53HGDApy60Vu9xL4cMlSFiDJ/Onx6hvozv
         iRYHonCEisGwRqn829omAGOCvuIqbwtsVrA1AJxmq1eyH9mvSBQ9FfMU7nkcp01W0LHx
         ykdft1HhakmPJrpJZ7cwYeKgbBozYwHbyJD/2cgyilhvRYzi3Toh3EPUIz8qKy+fuhg2
         /UBg==
X-Gm-Message-State: AOJu0YzkhxtdqUw9ySu0K4dyBc/adCbEwxhZeP1WI2Ah0/XUh8LXtM7I
	3VebFYYqEudoJN8MUprAkITv
X-Google-Smtp-Source: AGHT+IFflC4ROvSSyCSp77buc/eWj37Vh2bJjg3yLaIOMBySn5rdEmQbKO1vJO6GMpWXaET2Bqq8Xw==
X-Received: by 2002:a05:600c:81b:b0:40b:5e4a:235d with SMTP id k27-20020a05600c081b00b0040b5e4a235dmr8144322wmp.95.1702919012551;
        Mon, 18 Dec 2023 09:03:32 -0800 (PST)
Message-ID: <9920f138-d77b-4bb4-8ceb-b48b040937c4@suse.com>
Date: Mon, 18 Dec 2023 18:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/5] xen/hvm: use NULL as a null pointer constant
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
 <7c52d4b78785a56aee1ffc3661503bdd145595d9.1702553835.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2312141329320.3175268@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312141329320.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 22:29, Stefano Stabellini wrote:
> On Thu, 14 Dec 2023, Nicola Vetrini wrote:
>> No functional change.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Yet it would have been really nice if style had been tidied of the lines
which are touched anyway.

Jan


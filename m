Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54058C4E71
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721288.1124595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oCJ-0008Td-DO; Tue, 14 May 2024 09:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721288.1124595; Tue, 14 May 2024 09:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oCJ-0008Qn-AU; Tue, 14 May 2024 09:11:47 +0000
Received: by outflank-mailman (input) for mailman id 721288;
 Tue, 14 May 2024 09:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6oCH-0008Qh-Lg
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:11:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb377b21-11d1-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 11:11:43 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5a88339780so80252666b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:11:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a3c65d06fsm533626966b.52.2024.05.14.02.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:11:42 -0700 (PDT)
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
X-Inumbo-ID: fb377b21-11d1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715677903; x=1716282703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r+ElSVHZIfIVtmDPII7svjzGxPG6aSl1kCr1cOt4mfA=;
        b=Ka8JEI/wJpbxumujOsJEfXOmWbYEFtAqmDGe42gMhYebG74pmlJbR0yL091sRazuPa
         malXeS4eq/vXUEpvqYaW5m9gXHIggAF8iyIEllDy7FeQVozgTLbvCy0mMMD5dVOvyPNZ
         8KECm49DsgH40B+U2fIeFVpR2gcWMQS75QoFXXOA4eMlaVlRukNZGyhGmp/Hn9/oTcxq
         pro9Oee9Ry5cxWVk9IzX0zLqkUHzq6u9ozO2d49rChurrLDCESdjjhD+llthyeVIGzbb
         fZycaSXnjlE3aoIBWkYECKMW8MOg1YPQJjRVCRCQMIpiTV6gq0pjx0IVeYMnQSTa8+Q4
         3d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677903; x=1716282703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+ElSVHZIfIVtmDPII7svjzGxPG6aSl1kCr1cOt4mfA=;
        b=i5j9xl2frAyqZIjM82lqxsKoiXm6veAPN65GfFitfIlM13WLZdddwAEtpT0TkpADBf
         CAWMx7fi0gJc0/k1W7PFdW2lOpJ3m0Z2ij4y1n9SWoOI01vnhY5GZYlcqldcCbRS/1HT
         K3M8S68OgmdAOKfX/LdeQuWC6xohfhWVKQhmyJquRbm9heZbD/xKJ5C3crNvwkU8yshf
         6MIx4g26hBKoCibojXBTb+C8/ujaUPSI73KSkhjrOzBTySx5Xfx4mMv3CYSmVjrWYmZo
         R4j3zvZy0RxnsyU7PxsXnMybRr/koOMQadmE0Xwwa7RxVQiRHo6fK3lIf+NbdBmCtmhA
         mt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX35ov3kYSaiAbluEMENdJdPpQiv7Xz4+FKNlq7lxxZdmcmbNONR3TBEAhfXWcZ5C41LW0KC+cel5Y2uP1VlmK31cH5rCfxOQTA+HFtMR8=
X-Gm-Message-State: AOJu0YyTVwy45N5TLgBG8xeh7QrATAKyVIVqn13DcMErWwf3tZl/kuFt
	SlRVIyUOr+U9erHA1OFPmdqa0BCt0b1EnoG7X4knX3vaP79eYUheJlrejvk74w==
X-Google-Smtp-Source: AGHT+IG0YZeFYzvWvWTlxsCW4oPs/lXcvs9ze2sLiQDo6e7UyvsEoR2u7Vf942DADP5l2optU5Y/TA==
X-Received: by 2002:a17:907:9710:b0:a5a:2d30:b8c1 with SMTP id a640c23a62f3a-a5a2d54c038mr1011278266b.14.1715677902809;
        Tue, 14 May 2024 02:11:42 -0700 (PDT)
Message-ID: <39badfc4-df85-46d4-8cfa-740592c60174@suse.com>
Date: Tue, 14 May 2024 11:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] xen/pci: address violations of MISRA C Rule
 20.7
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
 <df48ce446cf6409eda04460109f3082b39c4f618.1714487169.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <df48ce446cf6409eda04460109f3082b39c4f618.1714487169.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 16:28, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/include/xen/pci_regs.h | 6 +++---
>  xen/include/xen/vpci.h     | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

I notice you committed this with just my ack. I'm pretty sure Roger doesn't
mind, but formally his ack would have been required (hence why I didn't
commit it already before my vacation).

Jan


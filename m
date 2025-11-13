Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073CC56C09
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:08:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160877.1488929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUEl-00029E-EQ; Thu, 13 Nov 2025 10:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160877.1488929; Thu, 13 Nov 2025 10:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJUEl-000276-BS; Thu, 13 Nov 2025 10:07:31 +0000
Received: by outflank-mailman (input) for mailman id 1160877;
 Thu, 13 Nov 2025 10:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJUEj-00026s-Vy
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:07:29 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f2a2f01-c078-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:07:28 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so1086815a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 02:07:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd809absm129504266b.44.2025.11.13.02.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:07:26 -0800 (PST)
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
X-Inumbo-ID: 8f2a2f01-c078-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763028447; x=1763633247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zw+YHlQ/peQO5V4lUzzZ3ZPKQmLeOrJGX3UasDPLo08=;
        b=VDO/+XWvi+cT4OBlalDSLzXiKBHkz7J6bKrj3dcE0kjsePE8XOKZZy0GhEuANapleD
         xQENwpqbyNx7JvVg16VBH24k2ru14urCFCfLD1X4mS7X5/0+Nr0RJZsJ+G2s7E+/L8VG
         r1pV5MUxTcH4WLfxf+c6MFIOslXv88zWVZ5VKb3gWvhXMdzZMGIt0G73tUAWSTvS6iFh
         nlKt6nmmZxFiJnlcvh2arSaNITrzIzalfdab2iav1RjfWFCJ7XDim/4Zo+D5ufl9PNfu
         cHRRyKtZCCAHhgvmthrS7LR/FGb0OpjKkldIxlatKOwuMoOT9POScASeqd9n1hybCzuC
         rB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763028447; x=1763633247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zw+YHlQ/peQO5V4lUzzZ3ZPKQmLeOrJGX3UasDPLo08=;
        b=ejzXw8rrym8nyjrcJGP3bK5ViSWn8qgtr0MuCenjhasz4g8Z7W8JuWiZsAYrmSPIAt
         o3GhzgKEbrpYJcTJf2BOfsWSfR4NKPFOnnWNnUfDk4u3erhjnrL8w2ujfNUL+elWaxMK
         mw1oklN3DCWj1uv3Or474zV54PCdutxUx//9sbz/YyDOI1P2NOnFPsDhdcMUTF+6ExJf
         Uxr35fD/4q14NOi22mv+GwrdsGgEwq46nArvBAc2NScxHQAGyStqvg/tAQOH3fL+c7PR
         EJhxuZSTTA8Kibk3P6+VsGxOoeJ6I3sXBqg38VvsxTZiSEpCcCwUaJ1rDZBKtg9E+lH8
         gkNg==
X-Forwarded-Encrypted: i=1; AJvYcCXDj7CRxwiHudncfjCYqyZOyEhheQD1DSYgnSbSjv6AqbGEitWqds/6x92Hy8MH+4Mz31HftZgLYe8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7FYaGv/KAtgUBXmAD1U6NCJAmsWdIX3pF/MJe2ZuLRYB6TfIm
	nMfeB/D2FKPmsAxdTgb+BqQsVHdU3YMlGWOGPXRIogneuLp6HkqA8VXDoBbR77FeUTiPra6ZisE
	Hp6Q=
X-Gm-Gg: ASbGnctG5qk78OwPvdozKh07Yr/F1dIXXwLHbUMqw+ntWBqz3dGHrDUShtLXbQ7AqAH
	pu9cFzMWNx9k+yhpmS4XQxIMS8A9sWHPvBtLjs++3SDg0T2o1GGlFVfNwQSVtUC8ssZUb5YsPdR
	wye7J1vl4hgVdzZ2Go/pL2wrgJWTSNO0zfxhbujZXN8xupywEXhbQy4MO8jqxZKIUnELHoQXcGR
	jDkZduF40v1gkhYUOM/adxtJsTU0y6gPnyMyZUbkGe/GMumm1wf0PU3m3r4R3dDAw9X0G2UyS/y
	yfi9nLFarTIgJ+RkJsDAr9pRSORxEBJIESZQ6HpGWtSFfiajEKbFVqg3Lh2eUcoFYvNbMGxx8OV
	u5glaO1re6A4kYB5QCcgZWLdaDgGKWdaQsTnMtME6+Qw+wxOmDJnYufq9LCkSr46JWJRE4lgc94
	Q7gCqqd/7wJsUqiHQwwMtkVSOmv2EYf+GxElgW7+lJPQiyt76ywP1OwCmTkWVrGF9z
X-Google-Smtp-Source: AGHT+IHKbgtl1lKhL7B/M844zEyn1UVxl3KMhxX97Zz4TlDFoJyALyD0jLuLPjzuKRWvCvti+QiuTw==
X-Received: by 2002:a17:907:9713:b0:b72:5a54:1720 with SMTP id a640c23a62f3a-b7331ae8bbbmr574138866b.57.1763028447355;
        Thu, 13 Nov 2025 02:07:27 -0800 (PST)
Message-ID: <1d0f9933-c12a-410e-84ee-e58fa78d0f8a@suse.com>
Date: Thu, 13 Nov 2025 11:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] xen/pci: introduce has_vpci_bridge
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1758618839.git.mykyta_poturai@epam.com>
 <acb8da959fac97fbec7bc086b921e31dd52d44f6.1758618839.git.mykyta_poturai@epam.com>
 <39458e03-31c1-4aa6-8b66-f6d72ec8bdd9@suse.com>
 <b287a8ec-0f85-409c-b133-b709026028d2@epam.com>
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
In-Reply-To: <b287a8ec-0f85-409c-b133-b709026028d2@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 10:49, Mykyta Poturai wrote:
> On 06.11.25 14:15, Jan Beulich wrote:> On 24.09.2025 09:59, Mykyta 
> Poturai wrote:
>  >> From: Stefano Stabellini <stefano.stabellini@amd.com>
>  >>
>  >> has_vpci_bridge is a macro to check if the domain is a domU or is dom0
>  >> with vPCI (pci-scan=yes) enabled.
>  >
>  > Hmm. Why would DomU-s, now and forever, not have (virtual) bridges? 
> Wasn't them
>  > gaining (virtual) bridges actually the longer-term plan?
>  >
> 
> Seems like there is a misunderstanding here. Indeed it is the plan for 
> DomUs to have virtual bridges and this check is designed to 
> differentiate two categories of domains.
> 1. All DomUs + Dom0 with the virtual bridge.
> 2. Dom0 with HW bridge.
> 
> I will try to rephrase the commit message to be more clear.
> 
>  >> @@ -866,7 +866,7 @@ int vpci_init_header(struct pci_dev *pdev)
>  >>       struct vpci_header *header = &pdev->vpci->header;
>  >>       struct vpci_bar *bars = header->bars;
>  >>       int rc;
>  >> -    bool is_hwdom = is_hardware_domain(pdev->domain);
>  >> +    bool is_hwdom = !has_vpci_bridge(pdev->domain);
>  >>
>  >>       ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  >
>  > For none of the changes (also further ones) it is clear (to me) why the
>  > substitution is (logically) correct. For this last instance the variable
>  > name also ends up wrong after the replacement.
>  >> Jan
> 
> The general logic for this change is that before it we assumed that 
> hwdom always uses HW bridge. Now it is not always true and hwdom can 
> also use a virtual bridge, so it needs to be treated the same way as 
> DomUs are.
> 
> You also mentioned on a previous series
> 
>  > Here and perhaps everywhere else I wonder: Is this really an 
> appropriately
>  > named predicate for the purpose / context?
> 
> Maybe you have some ideas of a better name? From what I came up with 
> this seems like the best one.

How to name it depends on the (ultimate) purpose. If, as you say, it's intended
to cover Dom0 and DomU uniformly when they have a virtual bridge, the name might
be quite okay. Then, as you said you would do, better wording may be needed,
variable names like the one mentioned above may need adjustment, and any code
paths suddenly becoming usable for DomU-s need to be audited for this being a
safe/secure thing to do (quite a few of the Dom0-only paths have been taking
some liberties so far).

Jan


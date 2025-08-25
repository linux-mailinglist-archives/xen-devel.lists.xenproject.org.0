Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB9B346AF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 18:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093592.1449055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZgu-00030L-EH; Mon, 25 Aug 2025 16:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093592.1449055; Mon, 25 Aug 2025 16:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqZgu-0002xu-A7; Mon, 25 Aug 2025 16:05:04 +0000
Received: by outflank-mailman (input) for mailman id 1093592;
 Mon, 25 Aug 2025 16:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqZgt-0002xm-M1
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 16:05:03 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4202c6a9-81cd-11f0-a32c-13f23c93f187;
 Mon, 25 Aug 2025 18:05:02 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-61c68525abbso2320403a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 09:05:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c805d1132sm705959a12.57.2025.08.25.09.05.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 09:05:01 -0700 (PDT)
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
X-Inumbo-ID: 4202c6a9-81cd-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756137902; x=1756742702; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sYLf0jpyXE9cd012+rLxNdrvgH164Y/E+5agRZgN5gQ=;
        b=PLX6kEFuLGav2enLNK1okpxVIQwFJTfuSdDWIg/NfdLOKJHmEDxoVNojnD3aCWb2ii
         fxgRmdc1rXrYGV87R4tKsk50+Us44QG8b5bhBW/AOKjo4xMfAATwm65q7RSSzwf531Uy
         0/RFv6LuDgUTH3zepk0hjX/T6sP5VOurFsXvCJxoXXRuPlvQ++VqNseSzvbxGpIDybPg
         fKObJx+Ani0Bvi9R/a9xH12A3jY/YxObjphQL0dvMtXW6ImuqM3GxhXCMUhT67f97dNp
         ci2zAMvNVbL0t7HUeiNjBX31YQbicLX0Uu9BajXS4XzUctH02im8rGg1O8XKno+EXGbe
         ZeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756137902; x=1756742702;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sYLf0jpyXE9cd012+rLxNdrvgH164Y/E+5agRZgN5gQ=;
        b=WuzvBVemlnRAXLwV2+WWGdfhIqWz0/3oucjr725iCYT355fSL0me52IBLekSu861ij
         efVutbRJvDgaWcmXtr8Qxpz21cpaJaWGdqyRveJgnzbFQSwuxkjI2RknlmC+3dkK72wt
         3JCk4HtLNQ97aKoNH5cy3AIiUZXu9cYsjCqwseR8elsAfuWPPWx1N/QqK+QSO+OpNf4H
         C7PCZUEV7A2BJLJGW7k4kJ+NwkYA/sxau7tzQ+O/LcPStVSE/XwUlpwoV4JD+ggeuJHZ
         cTEWiqG9dSz4vSVENb2goZD9wq2Cx6EGMrBcuiFvBPAQ/mwSBP6U3q5A5JJP255UZIJk
         2mgA==
X-Gm-Message-State: AOJu0YygexpUsPnk5HTlFL6cWqOhrjfD/SYLRKTblG+rA+ZbMwF7KF7b
	IMKsDLuvZ/PT6CMuG0cwo6ZuLRM5xmqEQGZJ6QKIbf+Ufmwq0+Gn4LeZBX4GIMuHPA==
X-Gm-Gg: ASbGncvk16whFFDOkcVsM7wbL6hOGCJyYMJwhBC2H6VvDyccXiidRRgECKIfO1uClKA
	m9wdCtgMT/71Jfu+nkG3RW7pHK/M70bj7fJt5cZONM8kscHGsIOtXkONzJ7W0meaI10vgYKMrWW
	OQiC87aYFap95DpaXEhIwZ+GimvvvX0tu4Hl6gsOnm9I/JJvCMdy6LwqmSG2/JoX3vJbb6Fobq7
	8V1sVcmkRMHPOKrbZlRDH/XZh14G1/XIRLipLJbmFN8B9wfwA/nmtpqN7HHpyDSCOsmsaAwGn+z
	KdXLyS2b+4OZQV0JwJISMyEUFK4VSMVPYwj/kXoGm+mH6qhDl7Q1RhEX3i6S+fmFB2xAxvGBAE5
	szjttTw6EkLq+3zeIn4jM8PPrziZxzpLzLTppvwF/a6WGn5Dx2jgAR5AQ/1bUq/vjmpe6O066mR
	C8M1f3zLE=
X-Google-Smtp-Source: AGHT+IFIKA5oS26ruzTfe/1ecskTwWMbHRc4jhs1wGbns6fsU2VTRJ4uXLV1gXJQsJTN4UNQ3doKZA==
X-Received: by 2002:a05:6402:50d1:b0:618:682f:14d0 with SMTP id 4fb4d7f45d1cf-61c1b70566amr10373174a12.21.1756137901864;
        Mon, 25 Aug 2025 09:05:01 -0700 (PDT)
Message-ID: <fb68f7e5-7215-4a16-bb9d-6d3d071f9f23@suse.com>
Date: Mon, 25 Aug 2025 18:05:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Reminder] Feature Freeze is Fri Aug 29, 2025
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
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
In-Reply-To: <07fc7122-d0ac-4dbe-800d-89086a07005b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.08.2025 17:50, Oleksii Kurochko wrote:
> Hello community,
> 
> I’d like to remind everyone that the Feature Freeze deadline is approaching,
> and we still have some outstanding requests from the community for patch series
> to be merged into 4.21:
> 
> 1. Enable guest suspend/resume support on ARM via vPSCI [1]
> 2. Introduce SCI SCMI SMC multi-agent support [2]
> 3. Introduce eSPI support [3]
> 4. FRED work: [4], [5], possibly others (?)
> 5. Introduce CONFIG_DOMCTL [6]
> 6. xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE [7]

As per a mail sent earlier today, for these two we will need to settle on
which route to take, including the consideration of whether the work can
realistically be completed in time (or whether an upfront exception could
be granted).

Jan

> 7. Some other patch series I missed.
> 
> It looks like some of these patch series still require additional work,
> and I’m not sure there is enough time left before the end of this week.
> 
> Could I kindly ask for an estimation of whether these tasks can be completed in time?
> 
> [1]https://lore.kernel.org/xen-devel/87jz2vaq9h.fsf@epam.com/
> [2]https://lore.kernel.org/xen-devel/cover.1753184487.git.oleksii_moisieiev@epam.com/
> [3]https://lore.kernel.org/xen-devel/7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com/
> 
> [4]https://lore.kernel.org/xen-devel/20250808202314.1045968-1-andrew.cooper3@citrix.com/
> [5]https://lore.kernel.org/xen-devel/20250815204117.3312742-1-andrew.cooper3@citrix.com/
> 
> [6]https://lore.kernel.org/xen-devel/20250803094738.3625269-6-Penny.Zheng@amd.com/
> [7]https://lore.kernel.org/xen-devel/20250815102728.1340505-1-Penny.Zheng@amd.com/
> 
> Thanks in advance.
> 
> Best regards,
>    Oleksii
> 



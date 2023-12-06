Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55949806A37
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648994.1013196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnil-00071F-0g; Wed, 06 Dec 2023 08:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648994.1013196; Wed, 06 Dec 2023 08:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnik-0006zE-TH; Wed, 06 Dec 2023 08:57:30 +0000
Received: by outflank-mailman (input) for mailman id 648994;
 Wed, 06 Dec 2023 08:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnik-0006xc-49
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:57:30 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b64e3b4-9415-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 09:57:28 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so493251f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:57:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e8-20020adfe388000000b00333381c6e12sm11594901wrm.40.2023.12.06.00.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:57:27 -0800 (PST)
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
X-Inumbo-ID: 7b64e3b4-9415-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701853047; x=1702457847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFX2iNwBtWieD8x9szCST48QFuwSwZ0ip6NDb4kLo7w=;
        b=Eq9lwMhUOmapwQCK5FJu2JqRIqCHCnjsOl9eLQHwXZX9XhyRCPNPqgvWCRF/8S9Oun
         N15pSa1EZCSF0A+2srXMbJusw8+ffR3HNtdR/oUsBdgGedeopRu2X/W23W1dL700nO68
         whGj+C1rmEKaJvL1tr3IUEcO+VOf7/CwKGqkVpTql+9pFLPtRzT6xbuRXix5MUUvyXIJ
         xMSrbbSBf880Nckshcv56GoaqK148MgqsCvKOBEtTPot8mpeTwvvYZYUYENa4PKCWx9Y
         SYpLBTK0XS6MLlkQZClB4YURtp8RsrWTR+TdjLK8ImdppsPp9OVhT6jv6KcTSKZvyyZ9
         abPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853047; x=1702457847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFX2iNwBtWieD8x9szCST48QFuwSwZ0ip6NDb4kLo7w=;
        b=HldNeUWYPq3GyXk1HS7KIB8ix9NuoO8hTYGigx1gDV6c1JWlJr7ooA220jwpXE/rvh
         Byv5gYmM0Dp4wmoVcl6vQ3/jhauGVHb/2CvrFg12ZuSMAG/ydREbD4NOP6hpj8Oli5PI
         uZrYrtL6G3NmOgC3U50X7gEsg4zmdDzTmZetis83joyDxh116SRiMXbO+0J2qnOQj6gL
         2Kyxd378Vzc4LeOLDb5CMx8BRUfyfyHGUgpas5L43QzxMo+eTSQL83ZUdHU+DItsh1l3
         WwRPNpqtaPT2t54gvrRUJuEiE33tiyNmFZ95rOjvV/K0/VjtxBZZGwlEnmmVUPFAiog+
         ILuw==
X-Gm-Message-State: AOJu0YxMetTxZg44sqX2YR5oRgWpb94jYpi70VjbjsMJYkwYzhlk9PpC
	2KEnEFgf/JHEnjHMBEvSLkCw
X-Google-Smtp-Source: AGHT+IFOGhrqugcclMMHA9YATkijBmfp0PkhWvaHRP91Z8k5p5uy1YPpsraF6AwDawWCFZzkWBW4Fg==
X-Received: by 2002:adf:ff8a:0:b0:333:3df5:ea9b with SMTP id j10-20020adfff8a000000b003333df5ea9bmr309563wrr.82.1701853047713;
        Wed, 06 Dec 2023 00:57:27 -0800 (PST)
Message-ID: <51db298e-800a-4eaa-8399-e0398ebf8cc3@suse.com>
Date: Wed, 6 Dec 2023 09:57:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/6] xen/pci: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
 <f84479a28a7f9d6e44829259229460dcf7c497c4.1701764980.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312051919560.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051919560.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:20, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Federico Serafini wrote:
>> Add missing parameter names to address violations of MISRA C:2012
>> Rule 8.2. Furthermore, use C standard types to comply with XEN coding style.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E658CAF4EE
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 09:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181234.1504313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vStBF-0005n4-FQ; Tue, 09 Dec 2025 08:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181234.1504313; Tue, 09 Dec 2025 08:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vStBF-0005lc-C5; Tue, 09 Dec 2025 08:34:45 +0000
Received: by outflank-mailman (input) for mailman id 1181234;
 Tue, 09 Dec 2025 08:34:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vStBE-0005lW-GF
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 08:34:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8393e11-d4d9-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 09:34:41 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42e2e239ec0so3058657f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 00:34:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm30597913f8f.43.2025.12.09.00.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 00:34:40 -0800 (PST)
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
X-Inumbo-ID: e8393e11-d4d9-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765269281; x=1765874081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rxWBBGLtxOMLap3xEoElLubkQf7Vx8yrVuJ/uuTZMa0=;
        b=S4WPlyNDk4EMLlDynTneQ/rp0rJPe2RQFo/cNVoa51pNqLIA21GOrvbfyvrMUPphtY
         WJyRUaxAR61cUULFQo2DIl7LT/XWF9drNVg6pzqoXmkqTkTayYkn4b529UXRfuDarGpD
         4hVh61NcDob0pqs+TWDnHTmHU/OKvOGhOg0Yp4HFDKxByfoFfY5TVow66+3VZsatbZT0
         vwB4VF/r00X8ycxk3BqzbHk1pTByax/vQ2uPApqDJjGLR7o/QvZ+jAUQoo5coGaElbsF
         ckXJ5CqIxB1j/SDNk8tG2rwZkgqhZ8sR6TEFN1ZQ8LMwkkfojJJy72OaNr6Xgp5SV56g
         +mHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765269281; x=1765874081;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxWBBGLtxOMLap3xEoElLubkQf7Vx8yrVuJ/uuTZMa0=;
        b=P70r700Pp5Zr56mDIHY+IpsqHnG46W++c43jfGh9HVuO5Zx0JKCc1lvLu1AznYzGHB
         uu84d4Bg2gSbu1cWMVG83Ap4Q/KTF8X+mcq7vpR/aBvkcWNWAPF5l3/TwK1uqMJHLMXX
         H5OlTjEx3zdsLT3OjNsdyikdjyov6RD/3Vx/c4PenZG/3PdEo8J0iiuQbPHYSNq7qVfm
         qXKg3hGI54pmyWKiKz0W/DqROYR5oxWtg2I8cqPTxDQKwe66nlokldeTL2IZFMyQkCxy
         ZMQhnH9rmccLuZjontcjDuyCrP292CHka2qAfD6iVOjezSw32eTcMh7qPi2XsdvHt8+6
         DiUg==
X-Forwarded-Encrypted: i=1; AJvYcCVpeZHShEqhxfY3sF4pK2vOdZ5P1wFP4PUwOxqG922z2MsYaibDfTCzN5vwxGq18ire5tWwgtBWNU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxms/EQOybBEehQRUPtLMnVfola3dxNIM9Mb3AeLz5cFKo9S/qp
	+Z687BjMhxu3uNcuf6N0mrHnILK+IfZxm/Dt8wHosz1r7pNfuMnbzjv7XPaxtQ7D4Q==
X-Gm-Gg: ASbGncsmnfRBy+TW644CMLVcg/0Ow7lOA/9gZ1ZyfjeOTDjebQ0Kq0++33/XgBYb6K7
	D66Qvz01+YPcNhtOtNAobPuSfvzQZXty7HJfLZmKNtLuPXfB01NHQC2d0hWbijO2kKsFu7n3rsK
	lJLvGStHbl/dKsev+evouRJP/8plTo65oPfgIMKHqm1C2ZfJw/jW49OTglKONn6hMGaTm1oYIbv
	KUakr1w1uNiC863nZe/9ptmbMDbUCX2E7rz8IL15GMdefQcCvRPYVCABvT5WsyM18r0DKFHva2m
	AE0RR8H7VgF3Li9aNDbdQrgTFE3ot41rYZB53r+tcKJY068JFmnnOlcFho1m+mu4QTBNY3MzT6k
	pyCkrOT1kduAUcbN5yQlbKwX2buc1b3HJfqKqgL33pub3woPdk/UZjBBc3f7Vt0/BANApKHMOGi
	eC0xCVm3sKE/1/Mvnu9oNOSCHbTAQrlJ32p+xmzRziNCmXfkGz25mlUom1DEzj8gLegNTHEG2eJ
	fZaZ2KjEO9F8Q==
X-Google-Smtp-Source: AGHT+IEBoHhBdF9iXMY+VpFXGiAoEf7fjTdvGYgcEp/PmZfg9OcXjQGfyeT/AKFIFLzryFKM/YY+2g==
X-Received: by 2002:a05:6000:1ac6:b0:42b:3e60:18a3 with SMTP id ffacd0b85a97d-42f89f2a31amr11476692f8f.24.1765269281295;
        Tue, 09 Dec 2025 00:34:41 -0800 (PST)
Message-ID: <ba440c84-9254-4992-85d5-97f8269d15f2@suse.com>
Date: Tue, 9 Dec 2025 09:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <bd53bc18-f2b5-4857-b06c-2674c799ff0f@suse.com>
 <7020e1fe-5f11-480b-bd72-311a93903030@epam.com>
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
In-Reply-To: <7020e1fe-5f11-480b-bd72-311a93903030@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.12.2025 19:54, Grygorii Strashko wrote:
> On 08.12.25 10:35, Jan Beulich wrote:
>> On 05.12.2025 20:34, Grygorii Strashko wrote:
>>> @@ -259,6 +259,7 @@ $(obj)/%.o: $(src)/%.S FORCE
>>>   
>>>   
>>>   quiet_cmd_obj_init_o = INIT_O  $@
>>> +ifneq ($(CONFIG_RELAX_INIT_CHECK),y)
>>>   define cmd_obj_init_o
>>>       $(OBJDUMP) -h $< | while read idx name sz rest; do \
>>>           case "$$name" in \
>>> @@ -271,6 +272,11 @@ define cmd_obj_init_o
>>>       done || exit $$?; \
>>>       $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>>>   endef
>>> +else
>>> +define cmd_obj_init_o
>>> +    $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
>>> +endef
>>> +endif
>>
>> If the objcopy indeed needs suppressing altogether (as Andrew suggests), the
>> unwanted redundancy here would go away anyway. Otherwise my (recurring)
>> request to avoid such duplication.
> 
> Could you suggest the best way to avoid duplication, please?
> if/else/endif is not working inside "Custom commands" make file commands.
> May be split it on two - cmd_obj_init_check and obj_init_objcopy?

That's one option. Another is to use something like
$(if $(filter y,$(CONFIG_RELAX_INIT_CHECK)), ...).

Jan


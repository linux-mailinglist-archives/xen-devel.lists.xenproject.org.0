Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143DBA6A974
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922448.1326370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHYA-0003hM-BZ; Thu, 20 Mar 2025 15:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922448.1326370; Thu, 20 Mar 2025 15:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHYA-0003fB-8E; Thu, 20 Mar 2025 15:11:14 +0000
Received: by outflank-mailman (input) for mailman id 922448;
 Thu, 20 Mar 2025 15:11:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvHY9-0003f5-Aa
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:11:13 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a7f15f1-059d-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:11:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so5896955e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:11:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f556basm50926115e9.17.2025.03.20.08.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:11:03 -0700 (PDT)
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
X-Inumbo-ID: 8a7f15f1-059d-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742483463; x=1743088263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kuzxNU32TEFuMIeLRcdl2e+s9FdDx5RRlFj6pXnCJBA=;
        b=QsBEjVSIYktEI/+wcMxPanXci0DDBi/bo2vqMbLI6Iud1IiWrhFwzoKb0yOACsqiCd
         AkhYJOBL2ktE77Ph1pK4vyo40XO3UDyrNir/sZ1r2ymUp7J7zj8YC2Q5ynEqZ4U/vTF6
         n875SwS0lSI6S+KITHxVb/rCoKFCM5+M7gxVZEik1fl4FpyEyjHUQ0+SK9FpguU5RB4p
         m0bTeX4UFOL7dx3LkvnNHtSDYU0lxaj0fhtovchVVNNGVqdqspHJlIc4glaJLCTVHsTC
         stjEwzAl82sTZlgre2e7GqFbLcQk+yQRrftfnQhc249J248Su9YMiGSyUMXL0qHF+AS4
         Gd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742483463; x=1743088263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuzxNU32TEFuMIeLRcdl2e+s9FdDx5RRlFj6pXnCJBA=;
        b=heYLFMpQfvzu9eGNzEbdeQwPqfIdyfEAc9rnwmTmI9jSE+54Vphc7/xLN/Qq3a4GqR
         g4TP9OYEynu/CG4M5qhEMCR31zqkbcZZIBr8J8oSquXW3qk2HdZeyz15IAUWsy69hf4G
         SHrRvJBKa9X4cLl1ciXGxmIJapdJDqvWbO1isRZHJfJDAJviWyv6u6vgT47SH9Vu1L2g
         CzByaRrfcvx3WZhMdfCvvh82FeSK4lHz6VdITbr7LldUKhxtwSexGMwnvRdsF4c8RRq/
         1CUMBljGjIb/Dwb7bI+scmIkbR/aknAUNdXCO87x2g+hZJOipQFo1TwTQkyYSK6xGXNF
         5oVA==
X-Forwarded-Encrypted: i=1; AJvYcCXy5usPWUKtipq67DPcJuc5zwGZVTJrob7eugfsXuhGgIsuaVF6MsALYbKeB9Cq7YvgxJV//Xmi9vQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7m6oszcuAch4s3kYTeiGq2gPXHXm3BHK9Df4dcdHgl6dzwi8S
	KU9TGPo0Vk1RI70SjTYwIbTMJtuQfvj0iywwT0glOhb6Vg1g45pctYAWC386Wg==
X-Gm-Gg: ASbGncuefvuKbG6+GGgnHleDcSQ8gC1Rk+7bU+eL8puHwEcl5cizpVRAmqV2TbB/nND
	LxLr9e7yZuAHgM+fa4r3qRArJP+4cB5E9Ui4t+8AL0csARrT/wK9cpEcAMeqSW4wo+r/5OKhFG7
	R0a5fQXR4C6Pi3AMSzfBTVhrsnl6Kmw0NbHMGgKV9NG/hhVcvOGCSgvF/Lhd3WwWjXQIjqlK6Np
	E4TWdf4RjtSV9oKtoQT49RxrZ7YfuD3jxpsWjTC5Mpfe7wPEe9+7KBz6lvks1wZ86/p3Qy7duUY
	vznJZUQvSKcptkWO8oeC0VKB4BTtapFdtxx8gvjDYLgn2AnJNBpd6HtPd3c843S/idslVtRfz6H
	3n5q12x5Mfm0rfaCB02TQm7Lm1I45yw==
X-Google-Smtp-Source: AGHT+IHv0x+mtQR6/yFLh9aM2oeG93ZCPMMapIKiisiZL4H8e++gRG4aN4ePGeNj7dR3G7NN+gf3zQ==
X-Received: by 2002:a7b:ce87:0:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-43d490ab2b8mr30114665e9.0.1742483463433;
        Thu, 20 Mar 2025 08:11:03 -0700 (PDT)
Message-ID: <bc7047e1-61ea-4630-99f1-1cbc67352c41@suse.com>
Date: Thu, 20 Mar 2025 16:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] Strip build path directories in tools, xen and
 xen/arch/x86
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com>
 <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com>
 <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com> <Z9qxcRtap-k-wW8B@mail-itl>
 <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com> <Z9rJUWCARMQYqNXr@mail-itl>
 <Z9vrc1Xvm5OEy8rM@l14> <Z9wPVGd0fEsbaO_s@mail-itl>
 <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com> <Z9wfKB0vdngn3xXX@mail-itl>
 <Z9wnzRbwb3HQaSMu@l14>
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
In-Reply-To: <Z9wnzRbwb3HQaSMu@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 15:36, Anthony PERARD wrote:
> On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-Górecki wrote:
>> On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
>>> On 20.03.2025 13:51, Marek Marczykowski-Górecki wrote:
>>>> On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
>>>>> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>> There are clearly some build path embedding left. And
>>>>>> -ffile-prefix-map=/-fdebug-prefix-map= doesn't work correctly with
>>>>>> XEN_ROOT having xen/.. at the end.
>>>>>> BTW, would it be acceptable to have this?
>>>>>>
>>>>>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=$(realpath $(XEN_ROOT))=.)
>>>>>
>>>>> Hi,
>>>>>
>>>>> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's fine
>>>>> in "tools/"). In "xen/", there's a few variables you can use if they are
>>>>> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srctree)
>>>>> $(objtree) for relative path. That also should avoid the need to use
>>>>> $(realpath ).
>>>>
>>>> XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it to
>>>> not have /.. for prefix-map to work correctly. Would it be better to use
>>>> literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) and
>>>> have paths in debug symbols relative to hypervisor source dir, instead
>>>> of xen repo root? I'm not sure if that wouldn't confuse some tools...
>>>
>>> abs_srctree being computed using realpath, can't we replace
>>>
>>> export XEN_ROOT := $(abs_srctree)/..
>>>
>>> by something as simpl{e,istic} as
>>>
>>> export XEN_ROOT := $(patsubst %/xen,%,$(abs_srctree))
>>>
>>> ?
>>
>> That works too. It's slightly less robust, but I don't expect "xen"
>> directory to be renamed, so shouldn't be an issue. I'll leave also a
>> comment there why not /.. .
> 
> I don't think $(XEN_ROOT) is present in the binaries produce by the
> hypervisor's build system.

It is, in the symbol table that tools/symbols produces. In a random
out-of-tree build I can see various static symbols being prefixed by
the full paths to the source files. I can't quite spot a pattern
between when this is the case and when it's not. In in-tree builds I
can't spot any such occurrences.

I also think Marek said debug info may contain full paths.

Jan

> There's only a few use if that variable: to
> load some makefile, to execute makefile that build xsm policy and to
> generate cpuid-autogen.h. Otherwise I don't think the compile have this
> path in the command line. What is going to be in the binary is
> $(abs_srctree), which you can replace by "./xen" if you want; which mean
> it doesn't matter if the directory is renamed or not. You might want to
> also take care of $(abs_objtree) which seems to also be in `xen-syms`
> when doing out-of-tree build.
> 
> Cheers,
> 



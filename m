Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A60828AC4D6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709698.1108680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rynqW-00037v-LZ; Mon, 22 Apr 2024 07:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709698.1108680; Mon, 22 Apr 2024 07:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rynqW-00034j-II; Mon, 22 Apr 2024 07:12:12 +0000
Received: by outflank-mailman (input) for mailman id 709698;
 Mon, 22 Apr 2024 07:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rynqU-00034b-Se
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:12:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a254577d-0077-11ef-9e3a-7da7ca7a9ce9;
 Mon, 22 Apr 2024 09:12:09 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed5cso5111515e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:12:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b0041896d2a05fsm15401291wmq.5.2024.04.22.00.12.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 00:12:08 -0700 (PDT)
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
X-Inumbo-ID: a254577d-0077-11ef-9e3a-7da7ca7a9ce9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713769929; x=1714374729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lq9IkNvZQOWg2aEMDlSE16qERMXSJgUhYcW7/o2Z2s=;
        b=JOoShE7zoje8dIxpDm110k+WWkaA3wkH7aIG0oPxCyBakvvG4lHF7Du+aWOR13rn/+
         1hV5jZnoMFRug65pNwYPoanzMx8IZivWEZlii4Y+8jeUxhBOFPwx+Mvd8J0kfCgGCVHZ
         guXkIUNkg1hpP9NPPvRdRFtu4q91AJ8mpJ4ET/C+H0Do5dQPACx38BgKwTYHsXwewg1K
         mjnhiR99Z+vhnZZgmXQ1PdBMtDx4/Oybb1VOqhyDPWDjeCM5Ms9JrJtWEmrGkslUvr9z
         61qwUNPEVDpMdsWZ/AKMEkhPfhOPJ0nxJkEfPnelTgat4DADOsA1Id6e9qULK7eiWv/B
         dbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713769929; x=1714374729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lq9IkNvZQOWg2aEMDlSE16qERMXSJgUhYcW7/o2Z2s=;
        b=aDlKJEjazq3G497SOrwZXG1uifUNDT5X2nJ/w+W3B8a9J+XQQNnU0TTrUmZdCm4yvq
         QhzGuCpyVlDNpfj+0tWhtw5Fg2k7LlXD9kPgtOBm54Xhp9OVKoxNPhK1Gw9SY1lEvPlK
         ktFB2JUefEj7l/gMf97zX/GsEAUQkik0uJQO41h0I9MSySeUd+lswVHI3UqPy1jSZ4R8
         +pwdQQAXrlSdFaRnK4r+uvrSrU1KMEcFxueEhN+LGfwWDs5ItG1DdLY8J8JvjvmhLZMd
         1PCcfwC3RTCKzP3w3RaXPM8zKMX05vP7qmiUynz0+mZ1HhAyuMwAbcOedstR80v61w4f
         poUw==
X-Forwarded-Encrypted: i=1; AJvYcCVpCAeI9/hFgNHE0IlLcDjbJPtIeihRaVCoJ8c+6jlVqeH4Zolo4UPnfOQbvtzac2LUzGR9uvXFTS4s/eK4XA4EgXPYfOrr9cP+Mc4z74w=
X-Gm-Message-State: AOJu0YxinRL+qqo2JiZl7uDel5TKRHUm1rO8KHhREp4Dc/D2GwNfIdxa
	BzbQbToGa4ydf34XD1AwRy+TlJX2qWL7eD8uAjwF5fC2K3ngP7eE1FF2cqM1hA==
X-Google-Smtp-Source: AGHT+IH38xVL2SefyUB7Z7M2QTD3COLdgu+H9it9qmfPLTj5DYaGKI6V8dTDvUsxSfwZ0sgoo6bRlQ==
X-Received: by 2002:a05:600c:1c21:b0:418:ee1e:3445 with SMTP id j33-20020a05600c1c2100b00418ee1e3445mr8339204wms.26.1713769929177;
        Mon, 22 Apr 2024 00:12:09 -0700 (PDT)
Message-ID: <5154b22a-747a-435c-9bd2-1716b7d3303d@suse.com>
Date: Mon, 22 Apr 2024 09:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: zithro <slack@rabbit.lu>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@cloud.com>
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
 <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
 <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
 <27a3e6a2-b150-1d75-c86f-dfa2b906b298@suse.com>
 <CA+zSX=ZCmmKQX7acx-oK4nSki9ONscxLP7E8t8USjdjXJ9UDpA@mail.gmail.com>
 <495946e9-191f-22fe-9ecf-08eb5af833ba@suse.com>
 <28e2fc47-aada-e394-35b3-252bd1c6d720@suse.com>
 <CA+zSX=bCC8A06t_gSpYCjxG1BZoC2EWnHhYAQtTM6b0WyzyZNA@mail.gmail.com>
 <CA+zSX=Zfnp7g1dSLb4WATShC2o4u-sULniccmW9-2AjBLH9zTg@mail.gmail.com>
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
In-Reply-To: <CA+zSX=Zfnp7g1dSLb4WATShC2o4u-sULniccmW9-2AjBLH9zTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.04.2024 17:29, George Dunlap wrote:
> On Fri, Jul 7, 2023 at 3:56 PM George Dunlap <george.dunlap@cloud.com> wrote:
>>>>>> Xen's public interface offers access to the featuresets known / found /
>>>>>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
>>>>>> via xc_get_cpu_featureset().
>>>>>>
>>>>>
>>>>> Are any of these exposed in dom0 via sysctl, or hypfs?
>>>>
>>>> sysctl - yes (as the quoted name also says). hypfs no, afaict.
>>>>
>>>>>  SYSCTLs are
>>>>> unfortunately not stable interfaces, correct?  So it wouldn't be practical
>>>>> for systemd to use them.
>>>>
>>>> Indeed, neither sysctl-s nor the libxc interfaces are stable.
>>>
>>> Thinking of it, xen-cpuid is a wrapper tool around those. They may want
>>> to look at its output (and, if they want to use it, advise distros to
>>> also package it), which I think we try to keep reasonably stable,
>>> albeit without providing any guarantees.
>>
>>
>> We haven't had any clear guidance yet on what the systemd team want in the <xen in a VM, systemd in a dom0> question; I just sort of assumed they wanted the L-1 virtualization *if possible*.  It sounds like `vm-other` would be acceptable, particularly as a fall-back output if there's no way to get Xen's picture of the cpuid.
>>
>> It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and the old Virt SIG CentOS packages; so I'd expect most packages to follow suit.  That's a place to start.
>>
>> Just to take the discussion all the way to its conclusion:
>>
>> - Supposing xen-cpuid isn't available, is there any other way to tell if Xen is running in a VM from dom0?
>>
>> - Would it make sense to expose that information somewhere, either in sysfs or in hypfs (or both?), so that eventually even systems which may not get the memo about packaging xen-cpuid will get support (or if the systemd guys would rather avoid executing another process if possible)?
> 
> Resurrecting this thread.
> 
> To recap:
> 
> Currently, `systemd-detect-virt` has the following  input / output table:
> 
> 1. Xen on real hardware, domU: xen
> 2. Xen on real hardware, dom0: vm-other
> 3. Xen in a VM, domU: xen
> 4. Xen in aVM, dom0: vm-other
> 
> It's the dom0 lines (2 and 4) which are problematic; we'd ideally like
> those to be `none` and `vm-other` (or the actual value, like `xen` or
> `kvm`).
> 
> It looks like ATM, /proc/xen/capabilities will contain `control_d` if
> it's a dom0.  Simply unilaterally returning `none` if
> /proc/xen/capabilities contains `control_d` would correct the vast
> majority of instances (since the number of instances of Xen on real
> hardware is presumably higher than the number running virtualized).
> 
> Is /proc/xen/capabilities expected to stay around?  I don't see
> anything equivalent in /dev/xen.

I believe it's intended to stay around, but a definitive answer can only
come from Linux folks. Jürgen, Stefano?

Jan

> Other than adding a new interface to Xen, is there any way to tell if
> Xen is running in a VM?  If we do need to expose an interface, what
> would be the best way to do that?
> 
>  -George



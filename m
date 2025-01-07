Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C11A03A15
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 09:47:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866134.1277417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5Ed-00062I-Mq; Tue, 07 Jan 2025 08:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866134.1277417; Tue, 07 Jan 2025 08:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tV5Ed-0005z9-JL; Tue, 07 Jan 2025 08:46:47 +0000
Received: by outflank-mailman (input) for mailman id 866134;
 Tue, 07 Jan 2025 08:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tV5Ec-0005z3-L2
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 08:46:46 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec450c6a-ccd3-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 09:46:44 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso151460075e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 00:46:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea40csm590064215e9.1.2025.01.07.00.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:46:43 -0800 (PST)
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
X-Inumbo-ID: ec450c6a-ccd3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736239604; x=1736844404; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iEkNbXDRnccs9v89Lnqv5STEKhDOtjUGGnkH6ubruXI=;
        b=FVHG88visvGd9u898ENDCLU2aIEBur40y8VOIxka9j30I7JPJLCE5S22JP0aDFixzb
         O4BJQon6lCqfZ2ZvoX+PcIlC1xx3Czqais+DciiqzzsbDa8+uekjjwGnPBrlM3uLi1YU
         b/avStHYJOWGz4P4Hibb7HUwa84g7tc7XvIXEut5dPcS/sG7ePAK46JF5WL5+tzazEe6
         79Ewo/NAsc/Gja3JNCXsPebgrcoqTG/7C3FK1R1WnD3F9xqt773Lfoh58wEYgXcHEF+o
         3qWNyPXHHjdwmQtN9og4QKnkebzBB5ZEOYd3Ta9Q2By/rP8RijbAOfKCl/+BLepVImtL
         xIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736239604; x=1736844404;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEkNbXDRnccs9v89Lnqv5STEKhDOtjUGGnkH6ubruXI=;
        b=osh2mBoCSBPNxD20nRkxCOkhd7glz6AyhX2WKJO3E0uqkJWPUMSuxhKnDd4cHK8QvN
         hgZk1olfbmncAAWtuL0D7KH58pva5w1xe8M/NxhC8MhSQwR8UcOjRjH5kf26iT6OWSxz
         XcIJEJakfLpnC3iUXCAoUJq7B7WaZGXoQknpUM9nCXvRfYLdTmCWEpmNPKC+T6LyExfj
         UsyxBtAK+EjqJLoKLEwFdvrmgunhlperdjPgcz+H+MHt7s9tF40+3Oz7qVl6Qoe5t9xe
         F3ewxRBxcCilD/mLwVbIBlTmuCv4hT9xIDAtgoQbeRM/5CJ9zo1P8FdLOFxOcZQX2bz6
         ru/w==
X-Forwarded-Encrypted: i=1; AJvYcCVPXDbE3DJLh7W0wdagLwhpd3Zuwepw6QHpBlCbSUxtPAQ+P5mIJHnv0Wgq0wXi8KmpVbcJfm4nips=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxA6/sGsF6W06XW5p783qRzaPN4Ac+BAtxrrWu9Y3iQ5u49lHUa
	IXOcnVmDOOrK24VhiGC0OJo71ZJXlhk2fpsNv3NhTiDyer8SdIXshoHvhSlbNQ==
X-Gm-Gg: ASbGncu+Mc0nc2a8T1ZEo9CNxF3D5hpbVxsfptLEJbPwPb3mzcKXkf4z/dMJRuVOuLG
	pO4gGdo8sXqjZt+nqzRtDuHfxYhH7sDEXBzw6Qk1vvhFKb3TiVUSTlBzVK1xAomViGpT71OJ4iu
	MOuVS5DbTC84cx913unjCNflZumNEQyyeeGjrS4qZOluLF+OaFSaRT3D3D6pLBPPj6cvKhR7R+1
	XXynuop814oALxC//b2PkIHtYtvamg47dI4u+B4D7842GWxrxXkU7TyWWcNGZP5+1sJvfK9ci+r
	Y5RlRk/pkX5sdAY3aXEWQog1/92L189luXrTueNG9w==
X-Google-Smtp-Source: AGHT+IFDkDr7U8T0vOfIUADs/pGN+Fmd//XAcxKeB4bbAM7KQVdEv4Jn51gfJ1mrT7Q7Lg2Q4QP6Cg==
X-Received: by 2002:a05:600c:3b9a:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-436685470f8mr408390445e9.1.1736239604092;
        Tue, 07 Jan 2025 00:46:44 -0800 (PST)
Message-ID: <a0c50fb6-516a-4e0e-8c3b-49c4dbc7b863@suse.com>
Date: Tue, 7 Jan 2025 09:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
 <c8684340-33f9-41d3-94e4-77ee3bc18306@suse.com>
 <CABfawhk4pzA9bSMzJDX7ZwaYC50dfn_ntCnk=bePmiKCpDnN3w@mail.gmail.com>
 <8fc662a1-4c74-4f97-a116-3bc5a0b71cf1@suse.com>
 <CABfawhkyg+TVB-uc04OefDhOXEfeQyQypW6gL4qsYO3ZrDxYfQ@mail.gmail.com>
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
In-Reply-To: <CABfawhkyg+TVB-uc04OefDhOXEfeQyQypW6gL4qsYO3ZrDxYfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2025 19:09, Tamas K Lengyel wrote:
> On Mon, Jan 6, 2025 at 10:10 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.01.2025 15:05, Tamas K Lengyel wrote:
>>> On Mon, Jan 6, 2025 at 5:16 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 30.12.2024 07:30, Sergiy Kibrik wrote:
>>>>> From: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>
>>>>> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
>>>>> and monitoring support optional.
>>>>
>>>> Yet doesn't this end up in things becoming misleading? Don't we rather need a
>>>> 2nd Kconfig option, with a dependency between the two? Or alternatively a
>>>> rename of the existing option (to describe the higher-level feature rather
>>>> than the lower level one)? Tamas, I'm particularly interested in knowing your
>>>> view here as well.
>>>
>>> Thanks Jan, I was thinking the same thing. The dependency of these
>>> subsystems is mem_access -> monitor -> vm_event. If the goal here is
>>> to disable all three levels the ideal way would be to have separate
>>> kconfig options for each level. It may be a bit too fine-grained
>>> though on ARM since there are only two types of events for monitor
>>> (SMC & mem_access) and only the monitor uses the vm_event channel (no
>>> mem-sharing/paging on ARM). So if doing separate kconfig for each
>>> individual feature is an overkill I would suggest using
>>> CONFIG_VM_EVENT that disables all three levels, including both
>>> mem_access & smc monitor hooks.
>>
>> Except that "disables all three levels" doesn't work, unless the other
>> option(s) are promptless (and selected). I'd have expected VM_EVENT to
>> maybe have a "depends on MEM_ACCESS", whereas a "select MEM_ACCESS"
>> wouldn't make much sense as long as MEM_ACCESS can be enabled
>> individually (with it being unclear to me whether such a configuration
>> is actually useful in any way).
> 
> Not sure I follow. None of these systems make sense to enable
> individually. Without vm_event monitor/mem_access are useless, that's
> why I would pick CONFIG_VM_EVENT as the option on ARM to disable all
> three levels if we don't want to start splitting it into multiple
> kconfig options (which I think may be an overkill here).

Oh, okay, you suggest to replace MEM_ACCESS by VM_EVENT at the Kconfig
level. That would be fine with me, so long as it's also appropriate on
(in particular) x86. Then, if there was ever a 2nd use of mem-access,
MEM_ACCESS could be re-introduced as a standalone option.

Jan


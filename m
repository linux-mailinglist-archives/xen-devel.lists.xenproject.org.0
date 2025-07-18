Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0230AB09B9B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 08:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048024.1418334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucenG-0002YA-O0; Fri, 18 Jul 2025 06:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048024.1418334; Fri, 18 Jul 2025 06:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucenG-0002WJ-Kg; Fri, 18 Jul 2025 06:42:06 +0000
Received: by outflank-mailman (input) for mailman id 1048024;
 Fri, 18 Jul 2025 06:42:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucenF-0002W6-Py
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 06:42:05 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50b1308f-63a2-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 08:42:04 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a575a988f9so992620f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 23:42:04 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f268:e016:4ee6:ecac:2480?
 (p200300cab711f268e0164ee6ecac2480.dip0.t-ipconnect.de.
 [2003:ca:b711:f268:e016:4ee6:ecac:2480])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456278a4460sm69035255e9.1.2025.07.17.23.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 23:42:02 -0700 (PDT)
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
X-Inumbo-ID: 50b1308f-63a2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752820923; x=1753425723; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DMsJmvhlkoUexuQ2O826z5fT4Q8TcuqKsfYNO+iscE4=;
        b=F2+YVvfcarSBhjnTrKQ6CS4B5dQak6KfGHYWaBCtTSUxOg0dCGOlkhn8CoFfMCc0Zv
         yoVdHP7gXrKKlUQYeXAlk6lLjNtJRSz4G6kqaBVSqSyRmMOlXikuY8PYBLyuJd1mndG/
         WfOfLPlFK2oAzrbobZLFYBfJUrtk2tJ+URJvunJ+ZRrk7KUDZSF7RKTd+VZpoObWCU3E
         gQOgqjqpFqToI9P3BB2nWOWsp/pLyHegP2FwSg7M+MOrzi8jKJNcUoNa0BLtkZckb+zN
         QfBN67lSznzPVXrCzUFXtdZ6gAs02olDrV8C52UYxgK9mT2PbQoZjex1Cr4cN5S8PJhi
         6mSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752820923; x=1753425723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMsJmvhlkoUexuQ2O826z5fT4Q8TcuqKsfYNO+iscE4=;
        b=BQwkFRU88liIBUsUywhK3IUfvh7tDMUeBdb4PE1Y0+u/0SBhY3CHViR/sUuhDmwpG/
         Y2K/Jcs0Cxs4xlaPkIWsZI+FjQA0MICYXpJq4Oxi3XhfqIMJUogZAqc83my2gUAuISMT
         eQpthvlfJMFCKhy9GxyeRWKmqVAh7HcITOvOHnIbg62SPU37ZV54N58p4O8cloPz6Gk3
         ZsZEebt12wLmwSckJP+vCDGQSND+u/ZdmzYjCin2NIZ04M04gFRERumFdieJZyhvZcJM
         8tPQF+K4aeI/qYHoLX8Vsr3L8dL1NIGS5OUdwAomENN8B6MP8LTGbCkYvyNbIRjLG8Iw
         OFEw==
X-Forwarded-Encrypted: i=1; AJvYcCV6fr+RB5jv7mzGbRzBS+siorJDYoUEuwqtrmOG+m7SoiFFAxtMVbQRm3MFs46zCud0byDdzBnbvmc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKyiMES4CZk2s+pfqs/7HNI3Q6THvquOguCb2hw/bREacoQSaH
	V8ZmHWADqYkhcn8tlCJUEOY1KLNpLsFowIjzpYamY76R8QsVvmX8XIrjOJE8I51ubA==
X-Gm-Gg: ASbGnctHbGelGWoT7EU5q7A5BtulQv/JSYknF6Ehl15lgSrdfP5N4TO3+BsY847Ol8d
	slovEMni4EUuP43qAOvSOmf5RO4q8XkYGKnnczLy63QCUeIn0jpxm9eEXPk/nwyhOnj+7vo6B7S
	f4yqMs6NZaGv8aIxhIXEdgsM8fx4hfP6zZ1rqeEi8SnuQMveFTVEQ0ci+wP7lRw7neEGGs/qF3w
	71QOA1dbatOIXUIQTEwM2mUiYKIbzmYAFroCZ74PaGlH1sus/wjwYGLhOng8/WKxheuYK43dfJO
	jHUUpvtEhKe309T8iMgKeCeqoNvx8NU0ItBKx/cgVbbHV/zUAsPZt8etfcGUx66f6NwYKF6DiwQ
	P4YGgpB8AmHQ3qOPkg9/X2YLlrjKlOg1yEtQAUIAzdw7YVQhcLB6dtp7khKdlfde1HyDv8J/PMO
	R/whFBf9xoJLywwwnkC4Wgks5SJcH5diAKtyWX6BKVlQNlVhk/b7GcTjA7
X-Google-Smtp-Source: AGHT+IFHYxJQxSpi1NeJyoxnBTsOvIDLnxHqIS7p8TQdQee7JfSj0a9bsLjmNkZH6SN7CgfQ0XgjJw==
X-Received: by 2002:a5d:5888:0:b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3b61b218075mr1215454f8f.32.1752820923257;
        Thu, 17 Jul 2025 23:42:03 -0700 (PDT)
Message-ID: <426330c3-ab77-46ae-89eb-1b67224afd3f@suse.com>
Date: Fri, 18 Jul 2025 08:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
 <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
 <62d11511-b856-41c6-a2f5-5625a5e3edbc@amd.com>
 <alpine.DEB.2.22.394.2507171657180.15546@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507171657180.15546@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 02:04, Stefano Stabellini wrote:
> On Thu, 17 Jul 2025, Jason Andryuk wrote:
>> On 2025-07-17 13:51, Alejandro Vallejo wrote:
>>> Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
>>> behaviour on any hwdom/ctldom identical to that dom0 used to have, and
>>> make non-dom0 have auto node affinity.
>>>
>>> Rename the function to alloc_dom_vcpu0() to reflect this change in
>>> scope, and move the prototype to asm/domain.h from xen/domain.h as it's
>>> only used in x86.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>>   xen/arch/x86/dom0_build.c             | 12 ++++++++----
>>>   xen/arch/x86/include/asm/dom0_build.h |  5 +++++
>>>   xen/arch/x86/setup.c                  |  6 ++++--
>>>   xen/include/xen/domain.h              |  1 -
>>>   4 files changed, 17 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>>> index 0b467fd4a4..dfae7f888f 100644
>>> --- a/xen/arch/x86/dom0_build.c
>>> +++ b/xen/arch/x86/dom0_build.c
>>> @@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
>>>       return max_vcpus;
>>>   }
>>>   -struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
>>> +struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
>>>   {
>>> -    dom0->node_affinity = dom0_nodes;
>>> -    dom0->auto_node_affinity = !dom0_nr_pxms;
>>> +    d->auto_node_affinity = true;
>>> +    if ( is_hardware_domain(d) || is_control_domain(d) )
>>
>> Do we want dom0 options to apply to:
>> hardware or control
>> just hardware
>> just dom0 (hardware && control && xenstore)
>>
>> ?
>>
>> I think "just dom0" may make the most sense.  My next preference is just
>> hardware.  Control I think should be mostly a domU except for having
>> is_privileged = true;
> 
> Great question. Certainly dom0 options, such as dom0_mem, should not
> apply to Control, and certainly they should apply to regular Dom0.
> 
> The interesting question is whether they should apply to the Hardware
> Domain. Some of the Dom0 options make sense for the Hardware Domain and
> there isn't an equivalent config option available via Dom0less bindings.
> I am not thinking about the dom0_* options but things like nmi=dom0. For
> simplicity and ease of use I would say they should apply to the Hardware
> Domain.

Interesting indeed. So far we more or less aliased hwdom == dom0.

Jan


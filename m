Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C189D90EA04
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743683.1150624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtmi-0002sg-KK; Wed, 19 Jun 2024 11:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743683.1150624; Wed, 19 Jun 2024 11:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtmi-0002qq-HZ; Wed, 19 Jun 2024 11:47:28 +0000
Received: by outflank-mailman (input) for mailman id 743683;
 Wed, 19 Jun 2024 11:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YhGR=NV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJtmh-0002qi-4u
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:47:27 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1340f5d-2e31-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 13:47:23 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-42179dafd6bso5525375e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 04:47:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb6af5csm10510053b3a.162.2024.06.19.04.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 04:47:22 -0700 (PDT)
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
X-Inumbo-ID: b1340f5d-2e31-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718797643; x=1719402443; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eR1Qy5b+hMB6zfS57BU7m95BnwCTtWaUOxZagZ5scDw=;
        b=JPCOomNWx0NjOVAaYJoxge2db6408oD6xtHPTlrGZrDZmZtvCjCgfS8O8ytGg2HhCI
         meTLU5HXG7luvamxKtlU/4QHTbJAY0zdTwynGRVjjtwbjszoZIq3+6cAifqLo6MU70ga
         u+0JuYFpxjE/hz5uTj9Jb0J/QYGjtMNoEQwGjH6gcwyCFd5Z/FCh9fCCzFOTilX653MO
         1ih0kg6yt9ACTSw5Un1hSGExTf1Y0yTufB382MeHRlOmxPs7u/0Booxk+pNUccFOuald
         bFTUTWOaZ/Ki7A37SbzjnQTiEoIG5gSItFRIeuGysaPvSiziMrLfN0GUCegBnXRR8u6V
         uQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718797643; x=1719402443;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eR1Qy5b+hMB6zfS57BU7m95BnwCTtWaUOxZagZ5scDw=;
        b=LPkJYar+gQH/345YltaibGrWZ2W2INQSvKAd1XQiO+7buvsziinFr0BiehgtT8QvXg
         zC0Wz6ry/l9WetCllUH5MT8Bn7kZRXWTR4Fke4xcYfzBDTngADoHwmIMw9PMtKobM8r0
         7az3iAOUiAdoaTLMi/WyVWpMZ17O+lYTrsbui3ROI8neEo/t6ohTUdxvGaSzD06qw0h/
         /ooEEt2rHsPYMK7VVewVwE0aix4AeRJ3cfTd6G912zIaYSG6OtnAPCUs0PwkJhXlEHxZ
         Hu2ju9sywTxeRJdqQvPUh5CwQglCatjJtw9JxwigcCW8xy1CHKRTC11URuQgs6XRcLte
         gbRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/+dzGE7dsVOPfwe2yBMgkHoRpIYgi0OAm5dDpUXVEpfYQGqfJgskFZ7JQZrs9Mi3gBgJpdr5oCe5YL/oQNdD6aF28sPvna0CrYK13bb8=
X-Gm-Message-State: AOJu0YzZPkxrjI9itEHu+GL3giomAlUOQ+R682LgV48Xs8VVepkaF2uX
	IuRB4rwthSJJBLPyIrHRchfyOVvvhXUOnIlZD+1Lz8JBk0rhdAKfLofjiCz+Qw==
X-Google-Smtp-Source: AGHT+IEIq0KAw0PsQ8n8c3lbusWJDF4vFIMDkFYOTWbJTmy55aMHXI+opVdGDM2ap2tmRgUQm26Dgg==
X-Received: by 2002:adf:f4d1:0:b0:362:1d6c:b867 with SMTP id ffacd0b85a97d-3621d6cb9c6mr5186489f8f.3.1718797642732;
        Wed, 19 Jun 2024 04:47:22 -0700 (PDT)
Message-ID: <cae88fd0-95d6-4b8d-a6d4-b297082f44fd@suse.com>
Date: Wed, 19 Jun 2024 13:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: add explicit comment to identify notifier
 patterns
To: Julien Grall <julien@xen.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com>
 <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org>
 <1fc8524f-8766-4eee-9b27-0eacd04097d4@xen.org>
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
In-Reply-To: <1fc8524f-8766-4eee-9b27-0eacd04097d4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.06.2024 13:21, Julien Grall wrote:
> 
> 
> On 19/06/2024 12:17, Julien Grall wrote:
>> Hi Federico,
>>
>> On 19/06/2024 10:29, Federico Serafini wrote:
>>> MISRA C Rule 16.4 states that every `switch' statement shall have a
>>> `default' label" and a statement or a comment prior to the
>>> terminating break statement.
>>>
>>> This patch addresses some violations of the rule related to the
>>> "notifier pattern": a frequently-used pattern whereby only a few values
>>> are handled by the switch statement and nothing should be done for
>>> others (nothing to do in the default case).
>>>
>>> Note that for function mwait_idle_cpu_init() in
>>> xen/arch/x86/cpu/mwait-idle.c the /* Notifier pattern. */ comment is
>>> not added: differently from the other functions covered in this patch,
>>> the default label has a return statement that does not violates Rule 
>>> 16.4.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>> Changes in v2:
>>> as Jan pointed out, in the v1 some patterns were not explicitly 
>>> identified
>>> (https://lore.kernel.org/xen-devel/cad05a5c-e2d8-4e5d-af05-30ae6f959184@bugseng.com/).
>>>
>>> This version adds the /* Notifier pattern. */ to all the pattern 
>>> present in
>>> the Xen codebase except for mwait_idle_cpu_init().
>>> ---
>>>   xen/arch/arm/cpuerrata.c                     | 1 +
>>>   xen/arch/arm/gic-v3-lpi.c                    | 4 ++++
>>>   xen/arch/arm/gic.c                           | 1 +
>>>   xen/arch/arm/irq.c                           | 4 ++++
>>>   xen/arch/arm/mmu/p2m.c                       | 1 +
>>>   xen/arch/arm/percpu.c                        | 1 +
>>>   xen/arch/arm/smpboot.c                       | 1 +
>>>   xen/arch/arm/time.c                          | 1 +
>>>   xen/arch/arm/vgic-v3-its.c                   | 2 ++
>>>   xen/arch/x86/acpi/cpu_idle.c                 | 4 ++++
>>>   xen/arch/x86/cpu/mcheck/mce.c                | 4 ++++
>>>   xen/arch/x86/cpu/mcheck/mce_intel.c          | 4 ++++
>>>   xen/arch/x86/genapic/x2apic.c                | 3 +++
>>>   xen/arch/x86/hvm/hvm.c                       | 1 +
>>>   xen/arch/x86/nmi.c                           | 1 +
>>>   xen/arch/x86/percpu.c                        | 3 +++
>>>   xen/arch/x86/psr.c                           | 3 +++
>>>   xen/arch/x86/smpboot.c                       | 3 +++
>>>   xen/common/kexec.c                           | 1 +
>>>   xen/common/rcupdate.c                        | 1 +
>>>   xen/common/sched/core.c                      | 1 +
>>>   xen/common/sched/cpupool.c                   | 1 +
>>>   xen/common/spinlock.c                        | 1 +
>>>   xen/common/tasklet.c                         | 1 +
>>>   xen/common/timer.c                           | 1 +
>>>   xen/drivers/cpufreq/cpufreq.c                | 1 +
>>>   xen/drivers/cpufreq/cpufreq_misc_governors.c | 3 +++
>>>   xen/drivers/passthrough/x86/hvm.c            | 3 +++
>>>   xen/drivers/passthrough/x86/iommu.c          | 3 +++
>>>   29 files changed, 59 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
>>> index 2b7101ea25..69c30aecd8 100644
>>> --- a/xen/arch/arm/cpuerrata.c
>>> +++ b/xen/arch/arm/cpuerrata.c
>>> @@ -730,6 +730,7 @@ static int cpu_errata_callback(struct 
>>> notifier_block *nfb,
>>>           rc = enable_nonboot_cpu_caps(arm_errata);
>>>           break;
>>>       default:
>>> +        /* Notifier pattern. */
>> Without looking at the commit message (which may not be trivial when 
>> committed), it is not clear to me what this is supposed to mean. Will 
>> there be a longer explanation in the MISRA doc? Should this be a SAF-* 
>> comment?
> 
> Please ignore this comment. Just found it in the rules.rst.

Except that there it is only an example (and such an example could even
be replaced at any time). Already on the previous version I had asked
that some explanation be added as to what this means and under what
circumstances it is legitimate to add (kind of related to a later part
of the earlier reply of yours).

Jan


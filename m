Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1AA7DADC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 12:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939602.1339641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jWW-000861-8O; Mon, 07 Apr 2025 10:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939602.1339641; Mon, 07 Apr 2025 10:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1jWW-00084G-4h; Mon, 07 Apr 2025 10:16:12 +0000
Received: by outflank-mailman (input) for mailman id 939602;
 Mon, 07 Apr 2025 10:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u1jWV-000849-2h
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 10:16:11 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 532124a4-1399-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 12:16:10 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso21027005e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Apr 2025 03:16:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a7586sm11753830f8f.38.2025.04.07.03.16.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 03:16:08 -0700 (PDT)
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
X-Inumbo-ID: 532124a4-1399-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744020969; x=1744625769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bHToPq3hU6vHCAdEc+LzmHWzJ4zloRX0sKIBDn3PMg8=;
        b=PgGxH1HYUdBx4cczu8CPQEIrhBzz5eaXgClbW64LU01a9CBisyQcl7DxzLHlBqgHih
         fsPQ+ZrK0Di2jvQDf14Hzp6wtgs9FHdaC+KCBy4f1I5SK/4yOsHbZEzOOaN/TDgKhXu0
         LgyC8VI0r3EgmD4Lce6UX8rQAfxImtdQuybdYj8ItMQq8EHD+f3KIjiByIvkDekLAkaH
         ZyhfOVyLBpc8y/dNtN7lUGBrXPXeVvwkweyqd4u0gcnTFPM5G5APOuXPto1VEUiki4H9
         6MlOC48tQ1iT/+dd9QFufO8hyLL8MiVI1AJDZK/B9dSh3daxLGhtWX1BadA+9Si6u+SJ
         CxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744020969; x=1744625769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHToPq3hU6vHCAdEc+LzmHWzJ4zloRX0sKIBDn3PMg8=;
        b=WahdncvQ5HU1zd+1v5W+wfCmDrSyQo9hqgk4ucSqc2DADoGSkzdqQlNE6vAjuByvUN
         jlF7Ou/VbWS/w1bJCjptdjN6IJEA/oPhQ2hRSPSSmSpiDxrf8suBAZa+715Rfdly2MXP
         9OSgdJWA9+27f8QM5MseqEX4pg6GG9NUE706ebrkvQUFQE/t5XlsGb2mVh6+JNi52wcN
         bnoP/nmqZtKJAWBxNL6lSgoFXULM+GxxFyPUb7m3qIikMadT0+tgXOPhLGHqNICMkXWe
         mx68ItJOr7cQwK+dhtW8j7C03JizCwadBm3Q26CLlkWjjFxeH+Tqlo90wpSnzjD+FiLj
         Q5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKA6BFlw2eZP/BTB6jfAUbeaRmbw+QDdaX5QMRgN+plc6M0lZpi8W4lSaiCoOUrOwzYNJrBt7AGLk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjnMyp/zEeZhusm53nTA8N5krH9CoQUN55m6MsqmR0mZxlB21U
	cURj6f2tOXCOCi6rGuMZlfxKUo6H07PMROXV6grHvMY/qa6jW0vx6zeIVOwmew==
X-Gm-Gg: ASbGncsnz9PVE2MxYNqAKDWZ3cwScvJeHx2FW4gh8Le/K5E0XaRYNlk/UpXZlrtjAc0
	4HaCztXFcrLWCmMJp3GY8i9zk/jgY7MKPg4wPXrW6yypRSbbE9+9xcPYRy3MVRCsOMDqIDQxo87
	qLOj+ntFbOM1sBuSTPm2asSfkl0g39zVIWbB4tePW/xr/efg1v5CpeI0PaaOSIbfhq8ZJQZ39y4
	uyj4loXzgn7wcLzUWwOuGj5uTGwa5q1pkNDfKowQSOXaIafQiMClG3jTivrrwaKanA8kECs97K7
	z9VYGo7nWVMYaBsej/q5V/O/9vyyBovPdwc4d2GLDO7mB8teQ5j2FkyUNWU2mYtgekHI/BgIkJx
	WEOp3vRXVF+Vsmqk1+rQTcoHo+YMChQ==
X-Google-Smtp-Source: AGHT+IFBH7sJckI7VvP/f+bEBgTMxQnkFKI0QZ2VJRr6xnEaJUQCc8IAMdu+1Fum05W1ULLp91igqA==
X-Received: by 2002:a05:600c:a51:b0:43c:fc04:6d48 with SMTP id 5b1f17b1804b1-43ee3e9c7d5mr78187975e9.0.1744020968919;
        Mon, 07 Apr 2025 03:16:08 -0700 (PDT)
Message-ID: <77a538db-5a63-4abb-ad6b-1ac1fc174029@suse.com>
Date: Mon, 7 Apr 2025 12:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/null: avoid another crash after failed domU
 creation
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20250403214829.128294-1-stewart.hildebrand@amd.com>
 <2b8e33f7-7e51-4ab5-ba1e-9d30d14be3bb@suse.com>
 <a03cd26b-c1b0-44d3-8bd8-f9c24d7ada5a@suse.com>
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
In-Reply-To: <a03cd26b-c1b0-44d3-8bd8-f9c24d7ada5a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.04.2025 09:38, Jürgen Groß wrote:
> On 04.04.25 09:24, Jan Beulich wrote:
>> On 03.04.2025 23:48, Stewart Hildebrand wrote:
>>> The following sequence of events may lead a debug build of Xen to crash
>>> when using the null scheduler:
>>>
>>> 1. domain creation (e.g. d1) failed due to bad configuration
>>> 2. complete_domain_destroy() was deferred
>>> 3. domain creation (e.g. d2) succeeds
>>>
>>> At this point, d2 is running, while the zombie d1 is not fully cleaned
>>> up:
>>>
>>> (XEN) Online Cpus: 0-3
>>> (XEN) Cpupool 0:
>>> (XEN) Cpus: 0-3
>>> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>>> (XEN) Scheduler: null Scheduler (null)
>>> (XEN)   cpus_free = 3
>>> (XEN) Domain info:
>>> (XEN)   Domain: 0
>>> (XEN)     1: [0.0] pcpu=0
>>> (XEN)     2: [0.1] pcpu=1
>>> (XEN)   Domain: 1
>>> (XEN)     3: [1.0] pcpu=2
>>> (XEN)   Domain: 2
>>> (XEN)     4: [2.0] pcpu=2
>>>
>>> 4. complete_domain_destroy() gets called for d1 and triggers the
>>> following:
>>>
>>> (XEN) Xen call trace:
>>> (XEN)    [<00000a0000322ed4>] null.c#unit_deassign+0x2d8/0xb70 (PC)
>>> (XEN)    [<00000a000032457c>] null.c#null_unit_remove+0x670/0xba8 (LR)
>>> (XEN)    [<00000a000032457c>] null.c#null_unit_remove+0x670/0xba8
>>> (XEN)    [<00000a0000336404>] sched_destroy_vcpu+0x354/0x8fc
>>> (XEN)    [<00000a0000227324>] domain.c#complete_domain_destroy+0x11c/0x49c
>>> (XEN)    [<00000a000029fbd0>] rcupdate.c#rcu_do_batch+0x94/0x3d0
>>> (XEN)    [<00000a00002a10c0>] rcupdate.c#__rcu_process_callbacks+0x160/0x5f4
>>> (XEN)    [<00000a00002a1e60>] rcupdate.c#rcu_process_callbacks+0xcc/0x1b0
>>> (XEN)    [<00000a00002a3460>] softirq.c#__do_softirq+0x1f4/0x3d8
>>> (XEN)    [<00000a00002a37c4>] do_softirq+0x14/0x1c
>>> (XEN)    [<00000a0000465260>] traps.c#check_for_pcpu_work+0x30/0xb8
>>> (XEN)    [<00000a000046bb08>] leave_hypervisor_to_guest+0x28/0x198
>>> (XEN)    [<00000a0000409c84>] entry.o#guest_sync_slowpath+0xac/0xd8
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:383
>>> (XEN) ****************************************
>>>
>>> Fix by skipping unit_deassign() when the unit to be removed does not
>>> match the pcpu's currently assigned unit.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Just one remark here: This almost certainly wants a Fixes: tag.
> 
> This will probably be d671da3be3ca (the initial NULL scheduler commit).

The code in question was added by c2eae2614c8f ("sched/null: avoid crash
after failed domU creation").

Jan


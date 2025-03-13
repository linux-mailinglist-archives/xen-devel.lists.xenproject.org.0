Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF38A5FA51
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:43:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912638.1318866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tski8-0000Ur-L7; Thu, 13 Mar 2025 15:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912638.1318866; Thu, 13 Mar 2025 15:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tski8-0000S9-I8; Thu, 13 Mar 2025 15:43:04 +0000
Received: by outflank-mailman (input) for mailman id 912638;
 Thu, 13 Mar 2025 15:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tski7-0000S3-5Q
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:43:03 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7a096c6-0021-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 16:43:00 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso730392f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:43:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d15bb5e97sm27049595e9.0.2025.03.13.08.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 08:42:59 -0700 (PDT)
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
X-Inumbo-ID: d7a096c6-0021-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741880579; x=1742485379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c3bU3RqEh1/BD9HWkZJ5udwHWieocoAwCpaeV2sCPKo=;
        b=K0tsy0JwFttjmCl8rYpQN45b+SJtfoLCpNlP59PGeytheVIpC+V6WInH4cmikl/Q/y
         lOv0ddBbHDI29pNLAn1TnkmLGN7RPKEuacGUeL1PUUFhpUIyFGD6aKM+0Pn8JIXEQaK+
         obnNYFEvtBbPI84lUrpAbCKsJjabEVWrRbjgA6OjyWyYxP76jnUK5jviKbGoBquAbdp7
         0BD0INJQK9IW6WlXsCRKBAzscjUuXebFc6EtK2vTgH8klXIk+q8OtdDD+NlEk0rWnMOI
         3c2BtTsW8kvk6E35ZjkChgRo5Bx6JhfSlD0EHNsWV+PcFnCWVa7SjrZXEpHHlefkQRWk
         Z4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880579; x=1742485379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3bU3RqEh1/BD9HWkZJ5udwHWieocoAwCpaeV2sCPKo=;
        b=P/tcFVi4KUfQp+JmYnML3f39+itKpTwTtNUal7YRdQnRiRFCA5+o6isnTjnIXEMs6P
         76HPLmrE8rC4FjmA6BZFbCb/XjiLftktyXOet9Z9iQzEWgkpks1OaMvh6dKJwDlFmNu+
         CQxxIrzL+HCP3u+pbvtEc+v6cxK40mDie/IRPMS1xDMpriHLND8Vn1iaE8I6366xo/Qn
         zO3y/QATw0yAfak1evp4wH1/APqyI1NdiIfSPj6VfPkuwdsyLRsX5sgt76nrcBGBdzT+
         xl4CArF/4dfEfk3C9XKzibVJ5a1uuOUq69WjKov52kYgxBUd8xg6LMNrYJpZFhU7AmQ6
         duJA==
X-Forwarded-Encrypted: i=1; AJvYcCX5+oG/o3LdwI8NURBahvoNWudRnzf/2386nRy50963agg2STnQ6AydLNDjS4s6xpl2Zj+TH9P/IQc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/logVaZxfVtXLttjptLx3KgnWWWcB0Q1Sjj2CaV3kAdWyKEyx
	UKWQSMgCutoErUWY9sm459gWV84xQB+nS3L1NDI8pyztp03PR86T1xDk12Je7A==
X-Gm-Gg: ASbGncs4w52/zAq7C4qk4N+dYFeW+toT/F6CKknqnvCRmvAUcNgTYeczMjiCldXWnHe
	0EcbweJH6bPB+eaAKFATr+8mYtUtZtyk8LxvBxIHBOPwkQjsypV5o0Avgoi8zaesskNp9Nnejav
	MYv3n5miTvzbFkdxVZ1lro5irfBJi1yo0AxPY274At5+dTqLt3sxyg4uy0GQPm1gtCfeSK1gCD3
	6klfofOX9oOSOWFLNQbtkpIXBqhamlmU8jA3OID6w0Y6BvCDDHfmVdeQEQgrHrKkhV8fqPFD1ak
	Tker7Ly27FzOeSvrT1Csdr4W69yfqvmeL+GNsMmy5Wg0h8Yh4OdRmuwWxutQqN2vDiT1/GE6soc
	pRl8eF4j/9TLsQH7GdhAUl6V/sET93w==
X-Google-Smtp-Source: AGHT+IFann2paDx7QqwlNx5DGe619BhCLqkz8wTjOhIv4Hw27Z35gMeg4K3dlKHrbiqBDNCZzlRqTQ==
X-Received: by 2002:a5d:6c66:0:b0:391:3bdb:af5d with SMTP id ffacd0b85a97d-396c1c27345mr25872f8f.28.1741880579574;
        Thu, 13 Mar 2025 08:42:59 -0700 (PDT)
Message-ID: <0976c68e-f847-43ba-bb0c-53e2627e1d05@suse.com>
Date: Thu, 13 Mar 2025 16:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/16] xen/cpu: prevent disable_nonboot_cpus crash on
 ARM64
To: Julien Grall <julien@xen.org>, Mykola Kvach <xakep.amatop@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <e6cc20510acf49d90c08007a2308ef3dcaccc368.1741164138.git.xakep.amatop@gmail.com>
 <30681b52-0d81-47d9-959f-90238863b88e@xen.org>
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
In-Reply-To: <30681b52-0d81-47d9-959f-90238863b88e@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2025 21:47, Julien Grall wrote:
> Hi Mykola,
> 
> On 05/03/2025 09:11, Mykola Kvach wrote:
>> If we call disable_nonboot_cpus on ARM64 with system_state set
>> to SYS_STATE_suspend, the following assertion will be triggered:
>>
>> ```
>> (XEN) [   25.582712] Disabling non-boot CPUs ...
>> (XEN) [   25.587032] Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:714
>> [...]
>> (XEN) [   25.975069] Xen call trace:
>> (XEN) [   25.978353]    [<00000a000022e098>] xfree+0x130/0x1a4 (PC)
>> (XEN) [   25.984314]    [<00000a000022e08c>] xfree+0x124/0x1a4 (LR)
>> (XEN) [   25.990276]    [<00000a00002747d4>] release_irq+0xe4/0xe8
>> (XEN) [   25.996152]    [<00000a0000278588>] time.c#cpu_time_callback+0x44/0x60
>> (XEN) [   26.003150]    [<00000a000021d678>] notifier_call_chain+0x7c/0xa0
>> (XEN) [   26.009717]    [<00000a00002018e0>] cpu.c#cpu_notifier_call_chain+0x24/0x48
>> (XEN) [   26.017148]    [<00000a000020192c>] cpu.c#_take_cpu_down+0x28/0x34
>> (XEN) [   26.023801]    [<00000a0000201944>] cpu.c#take_cpu_down+0xc/0x18
>> (XEN) [   26.030281]    [<00000a0000225c5c>] stop_machine.c#stopmachine_action+0xbc/0xe4
>> (XEN) [   26.038057]    [<00000a00002264bc>] tasklet.c#do_tasklet_work+0xb8/0x100
>> (XEN) [   26.045229]    [<00000a00002268a4>] do_tasklet+0x68/0xb0
>> (XEN) [   26.051018]    [<00000a000026e120>] domain.c#idle_loop+0x7c/0x194
>> (XEN) [   26.057585]    [<00000a0000277e30>] start_secondary+0x21c/0x220
>> (XEN) [   26.063978]    [<00000a0000361258>] 00000a0000361258
>> ```
>>
>> This happens because before invoking take_cpu_down via the stop_machine_run
>> function on the target CPU, stop_machine_run requests
>> the STOPMACHINE_DISABLE_IRQ state on that CPU. Releasing memory in
>> the release_irq function then triggers the assertion:
>>
>> /*
>>   * Heap allocations may need TLB flushes which may require IRQs to be
>>   * enabled (except when only 1 PCPU is online).
>>   */
>> #define ASSERT_ALLOC_CONTEXT()
>>
>> This patch introduces a new tasklet to perform the CPU_DYING call chain for
>> a particular CPU. However, we cannot call take_cpu_down from the tasklet
>> because the __cpu_disable function disables local IRQs, causing the system
>> to crash inside spin_lock_irq, which is called after the tasklet function
>> invocation inside do_tasklet_work:
>>
>> void _spin_lock_irq(spinlock_t *lock)
>> {
>>      ASSERT(local_irq_is_enabled());
>>
>> To resolve this, take_cpu_down is split into two parts. The first part triggers
>> the CPU_DYING call chain, while the second part, __cpu_disable, is invoked from
>> stop_machine_run.
> 
> Rather than modifying common code, have you considered allocating from 
> the IRQ action from the percpu area? This would also reduce the number 
> of possible failure when bringup up a pCPU.

I'd go further and question whether release_irq() really wants calling when
suspending. At least on x86, a requirement is that upon resume the same
number and kinds of CPUs will come back up. Hence the system will look the
same, including all the interrupts that are in use. Plus resume will be
faster if things are left set up during suspend.

Jan


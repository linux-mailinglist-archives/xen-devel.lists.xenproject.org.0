Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNMBC6Fg+GlJtgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:02:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D5E4BAB58
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 11:02:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299602.1574145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpBg-00082V-Mu; Mon, 04 May 2026 09:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299602.1574145; Mon, 04 May 2026 09:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJpBg-000811-K0; Mon, 04 May 2026 09:02:00 +0000
Received: by outflank-mailman (input) for mailman id 1299602;
 Mon, 04 May 2026 09:01:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJpBf-00080t-4f
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 09:01:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJpBd-001aH3-9a
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:01:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f86079-5cb7-0a2a0a5109dd-0a2a450ad4a6-38
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:01:57 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f86085-56b3-0a2a450a0019-d155802ff067-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 11:01:57 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488d2079582so41666985e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 02:01:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fee325asm91162065e9.7.2026.05.04.02.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 02:01:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777885316; x=1778490116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SyQvWaYl+H5COMVL8nm+snI1bQDSN5m1ZItnEsFHn6M=;
        b=B3Xv6gUmE55LdGmnjn7Mo/T9lxtRwI3qAHz71YumOF+UnkPDrlwT6RQuCr5FWlKuWR
         0ozNLomY/ySfDuELydbldvwNcqZuHBWAokSWWKy6QpIYjtmRrEMZWlEYT9S4hbsqbvRp
         XQnNEElmw25BUSTctQFzhQr/8R8axFwSKnQHIAuxvjUIYcpBvumLCRMH8/lfyGiTe3LM
         Jv023QWn5ktR3B0Uer3UPHVBMgB791AK0UCv5yaGbjbn0/tQCYRk4dYkeZP7lLwh2Z/a
         BVDdNKeewHPLGFWGolh0uVv+h5z/wARxJGzKSEzVeVrAR1N27Pq3hniYZMqkj/mCKlpP
         A3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885316; x=1778490116;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyQvWaYl+H5COMVL8nm+snI1bQDSN5m1ZItnEsFHn6M=;
        b=m5kQzItMGgmAAQ0V9pzXoY3ecNm+NT1p1FV2msjJxyqMSV7idYMV5UR0x9eaVhyT4M
         /i4XjclFe3guB+hZWynoTrASmj9m+Usa2zkJy8adKgKCt/6Un/mUN6Z+3d8RW5x1O/TS
         fTZuy/3620PSvVKrvNRR79kVgAjavmD/+hp8JDTY8HVdFEJcvlTxqtQrhRnio3sGxZhS
         sGRQLgcjzq+Rad5XI5ca8XdLGrLerqkg6e3sdwe4Y4j1Q5AQnnWikoz4Y+UQNWhRskhS
         bZn+zzDtFQBANLL/dZuqlsSFsx8bZNlq7WlnYi8NfhVmizUak/HsovMtz9k7H6vkoAma
         qhfA==
X-Gm-Message-State: AOJu0YxBwh8iG5fH8VFuKIiz08mFjE1zP1Wc46NorHDbDAyTgUWIjv+j
	Q2muCGxJM1vzrKb/AAHlELy5BkeDJ0tfDdrXuTYpIhqlrHPpjOPoKqk0pRD7cgU0Ig==
X-Gm-Gg: AeBDietrwVK8InEBy87i6FUbJ2ZSssRWDEfLa223UpYy7i2bU8FkZfCsnoL3/grwESL
	5lomAKWKMOSO33QfIMTSCfhtiXxme2qcqYuzH3JJvcxMWUw8e42aeBBkXQ7q8dcHGHy0YokWUI4
	+zIWm7g22k2po+mSxVwmehYvCzRrQapcP8YPX3g4l7IncrdjrLAWrLBjDjLVFFsGkb/9nneFBMZ
	u31f9gfadYaCZ5RwC43CTM48G3/myQvBnTPoTg1iu8lFzm5o7PFrvGL/qpJ+9FyZkNQJGgLpows
	+2kHSkM21ygemj/+Hq7lY4nBk7CdhR0EvIOmH9951THQmttdXEfvC0EKaGQ/lu9MaU1gzCT0IDd
	ShgL3FVbTpxkSjQQBm0zFBBLNUCjQ+UsPakoy3R0fWx8+a+fmIafDepUh7XoIfXxM/5RvAL8YH/
	vkfx4/Mroe8wukmsgDq/cL74J2xgIvKNzizoI1pGnWm4tFtI7NZnWA7Iol4gLuXsqMwJorrfZuT
	w7CB7yHw9ok9kI7kHho27wqSzojAio3qK7L
X-Received: by 2002:a05:600c:45d5:b0:488:a2ac:a334 with SMTP id 5b1f17b1804b1-48a9853c933mr138258015e9.3.1777885316429;
        Mon, 04 May 2026 02:01:56 -0700 (PDT)
Message-ID: <f215fb5a-84f3-4c90-8827-285d024a0ef1@suse.com>
Date: Mon, 4 May 2026 11:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] x86/mwait-idle: arrange for BSP MSR adjustments
 during S3 resume
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
 <e5e03239-1d4e-4ab2-8f16-83d280f23b24@suse.com>
 <aet_X0c504QvcqGT@macbook.local>
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
In-Reply-To: <aet_X0c504QvcqGT@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777885317-CDD688B7-9C43BF84/0/0
X-purgate-type: clean
X-purgate-size: 3198
X-Rspamd-Queue-Id: 59D5E4BAB58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 24.04.2026 16:34, Roger Pau Monné wrote:
> On Thu, Mar 12, 2026 at 05:54:30PM +0100, Jan Beulich wrote:
>> mwait_idle_cpu_init() is only called for APs, yet MSR writes will
>> typically need re-doing post-S3 even for the BSP. When multiple cores /
>> threads are present (and to come back online) in a package, for package
>> scope MSRs this may be covered by APs doing the writes, but we can't rely
>> on that.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/acpi/power.c
>> +++ b/xen/arch/x86/acpi/power.c
>> @@ -28,6 +28,7 @@
>>  #include <asm/io_apic.h>
>>  #include <asm/irq.h>
>>  #include <asm/microcode.h>
>> +#include <asm/mwait.h>
>>  #include <asm/prot-key.h>
>>  #include <asm/spec_ctrl.h>
>>  #include <asm/tboot.h>
>> @@ -299,6 +300,7 @@ static int enter_state(u32 state)
>>      acpi_sleep_post(state);
>>      if ( hvm_cpu_up() )
>>          BUG();
>> +    mwait_idle_resume();
>>      cpufreq_add_cpu(0);
>>  
>>   enable_cpu:
>> --- a/xen/arch/x86/cpu/mwait-idle.c
>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>> @@ -1680,6 +1680,28 @@ static int __init mwait_idle_probe(void)
>>  	return 0;
>>  }
>>  
>> +static void mwait_idle_cpu_tweak(unsigned int cpu)
>> +{
>> +	if (icpu->auto_demotion_disable_flags)
>> +		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
>> +
>> +	if (icpu->byt_auto_demotion_disable_flag)
>> +		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
>> +
>> +	switch (icpu->c1e_promotion) {
>> +	case C1E_PROMOTION_DISABLE:
>> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
>> +		break;
>> +
>> +	case C1E_PROMOTION_ENABLE:
>> +		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
>> +		break;
>> +
>> +	case C1E_PROMOTION_PRESERVE:
>> +		break;
>> +	}
>> +}
>> +
>>  static int cf_check mwait_idle_cpu_init(
>>      struct notifier_block *nfb, unsigned long action, void *hcpu)
>>  {
>> @@ -1762,24 +1784,7 @@ static int cf_check mwait_idle_cpu_init(
>>  		dev->count++;
>>  	}
>>  
>> -	if (icpu->auto_demotion_disable_flags)
>> -		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
>> -
>> -	if (icpu->byt_auto_demotion_disable_flag)
>> -		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
>> -
>> -	switch (icpu->c1e_promotion) {
>> -	case C1E_PROMOTION_DISABLE:
>> -		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
>> -		break;
>> -
>> -	case C1E_PROMOTION_ENABLE:
>> -		on_selected_cpus(cpumask_of(cpu), c1e_promotion_enable, NULL, 1);
>> -		break;
> 
> I'm possibly missing some context here, but why do we use
> on_selected_cpus and the CPU_ONLINE hook?  Won't it be easier to use
> CPU_STARTING and avoid the use of on_selected_cpus(), as CPU_STARTING
> runs in the context of the CPU being onlined.

CPU_STARTING happens pretty early, e.g. before IRQs are first enabled. I
consider use of that notifier to generally be restricted to pretty
special purposes. But yes, technically switching over may be possible.
However, in any event what you're suggesting is imo an entirely separate
change.

Jan


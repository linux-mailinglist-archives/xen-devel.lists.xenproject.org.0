Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53223689AC8
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 14:59:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489198.757536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNwZt-0003Lm-Ug; Fri, 03 Feb 2023 13:58:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489198.757536; Fri, 03 Feb 2023 13:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNwZt-0003Ja-Rt; Fri, 03 Feb 2023 13:58:09 +0000
Received: by outflank-mailman (input) for mailman id 489198;
 Fri, 03 Feb 2023 13:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3lM=57=oderland.se=josef@srs-se1.protection.inumbo.net>)
 id 1pNwZs-0003JU-Pl
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 13:58:09 +0000
Received: from vsp01-out.oderland.com (vsp01-out.oderland.com
 [2a02:28f0::25:1]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6145c9d-a3ca-11ed-93b5-47a8fe42b414;
 Fri, 03 Feb 2023 14:58:04 +0100 (CET)
Received: from office.oderland.com (office.oderland.com [91.201.60.5])
 by vsp-out.oderland.com (Halon) with ESMTPSA
 id c5c667fc-a3ca-11ed-988b-13c61387685f;
 Fri, 03 Feb 2023 14:58:01 +0100 (CET)
Received: from 160.193-180-18.r.oderland.com ([193.180.18.160]:42860
 helo=[10.137.0.14])
 by office.oderland.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
 (Exim 4.95) (envelope-from <josef@oderland.se>) id 1pNwZq-0040K8-9P;
 Fri, 03 Feb 2023 14:58:01 +0100
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
X-Inumbo-ID: c6145c9d-a3ca-11ed-93b5-47a8fe42b414
X-Scanned-Cookie: 0162612eaad5b0a05cb4a8d9b4dce14a4c5e9ffb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=oderland.se
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0vnqyLQjLM8vIxF5gJPRlxfMok/MJsZ2QdrgPNLap6A=; b=aAPvWYDchoFfYjna1mfsZ6jyzK
	cI6Dyni4w4oCB0PaIj9A2cpbKDveCoTAg5bDP0iU3yusuhhT2Oi0luM1iVAb30AeJmPC+v4ja5uJ3
	1OBQg6L4q9G6cMsBVX17Ng1wAOvLVRJRz2Ffb9DA5Ez/Jt8uL6+SvmbJ6HXVlm5vFNYcdeNa4kqZu
	X7CuhssKOrDKqUH0v4NVGr42ENlJ7wwgZ1upz3ydYa3/8wld/2Z9a03IX6CTPmsgjuiWE8A8DCq8h
	hWPD5uEUWEeolZ5xzaaR+/eQanWZ+jlMV9quhwKtAK6SROlPEnye7Try6AyyqOboYARa9UJFkUX4g
	l34Ro1XA==;
Message-ID: <06e6cefb-c773-d959-d569-84dd63e240e1@oderland.se>
Date: Fri, 3 Feb 2023 14:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:108.0) Gecko/20100101
 Thunderbird/108.0
Subject: Re: [PATCH 1/3] acpi/processor: fix evaluating _PDC method when
 running as Xen dom0
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-acpi@vger.kernel.org, Roger Pau Monne <roger.pau@citrix.com>,
 linux-kernel@vger.kernel.org
References: <20221121102113.41893-1-roger.pau@citrix.com>
 <20221121102113.41893-2-roger.pau@citrix.com>
 <952fdc14-a8e5-a59a-9c7d-af1adf361d77@oderland.se>
 <513e2851-9098-b510-588e-1e68d44d23fc@suse.com>
Content-Language: en-US
From: Josef Johansson <josef@oderland.se>
In-Reply-To: <513e2851-9098-b510-588e-1e68d44d23fc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
x-oderland-domain-valid: yes


On 2/3/23 08:05, Jan Beulich wrote:
> On 30.01.2023 10:21, Josef Johansson wrote:
>> On 11/21/22 11:21, Roger Pau Monne wrote:
>>> --- a/arch/x86/xen/enlighten.c
>>> +++ b/arch/x86/xen/enlighten.c
>>> @@ -346,3 +346,30 @@ void xen_arch_unregister_cpu(int num)
>>>    }
>>>    EXPORT_SYMBOL(xen_arch_unregister_cpu);
>>>    #endif
>>> +
>>> +#ifdef CONFIG_XEN_DOM0
>>> +bool __init xen_processor_present(uint32_t acpi_id)
>>> +{
>>> +	unsigned int i, maxid;
>>> +	struct xen_platform_op op = {
>>> +		.cmd = XENPF_get_cpuinfo,
>>> +		.interface_version = XENPF_INTERFACE_VERSION,
>>> +	};
>>> +	int ret = HYPERVISOR_platform_op(&op);
>>> +
>>> +	if (ret)
>>> +		return false;
>>> +
>>> +	maxid = op.u.pcpu_info.max_present;
>>> +	for (i = 0; i <= maxid; i++) {
>>> +		op.u.pcpu_info.xen_cpuid = i;
>>> +		ret = HYPERVISOR_platform_op(&op);
>>> +		if (ret)
>>> +			continue;
>>> +		if (op.u.pcpu_info.acpi_id == acpi_id)
>>> +			return op.u.pcpu_info.flags & XEN_PCPU_FLAGS_ONLINE;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>> My compiler (Default GCC on Fedora 32, compiling for Qubes) complain
>> loudly that the below was missing.
>>
>> +}
>> +EXPORT_SYMBOL(xen_processor_present);
>>
>> `ERROR: MODPOST xen_processor_present
>> [drivers/xen/xen-acpi-processor.ko] undefined!`
>>
>> Same thing with xen_sanitize_pdc in the next patch.
>>
>> +}
>> +EXPORT_SYMBOL(xen_sanitize_pdc);
>>
>> Everything compiled fine after those changes.
> Except that you may not export __init symbols. The section mismatch checker
> should actually complain about that.
>
> Jan

That makes sense. Patch 3 does change it from an __init though.

diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 394dd6675113..a7b41103d3e5 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -348,7 +348,7 @@ EXPORT_SYMBOL(xen_arch_unregister_cpu);
  #endif

  #ifdef CONFIG_XEN_DOM0
-bool __init xen_processor_present(uint32_t acpi_id)
+bool xen_processor_present(uint32_t acpi_id)
  {


So the change should be in Patch 3 I guess.

Regards
- Josef


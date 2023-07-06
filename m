Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180D74A11C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 17:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559908.875338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHR0o-0002TY-U3; Thu, 06 Jul 2023 15:35:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559908.875338; Thu, 06 Jul 2023 15:35:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHR0o-0002RW-QA; Thu, 06 Jul 2023 15:35:18 +0000
Received: by outflank-mailman (input) for mailman id 559908;
 Thu, 06 Jul 2023 15:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3sh=CY=rabbit.lu=slack@srs-se1.protection.inumbo.net>)
 id 1qHR0n-0002RN-IX
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 15:35:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4202267-1c12-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 17:35:15 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso9317175e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 08:35:15 -0700 (PDT)
Received: from [192.168.2.1] (82-64-138-184.subs.proxad.net. [82.64.138.184])
 by smtp.googlemail.com with ESMTPSA id
 v20-20020a05600c215400b003fb41491670sm5491806wml.24.2023.07.06.08.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:35:14 -0700 (PDT)
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
X-Inumbo-ID: b4202267-1c12-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rabbit-lu.20221208.gappssmtp.com; s=20221208; t=1688657715; x=1691249715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmURNMQ4g+uKDqBOxCU5QGpeFr3wMwvEX8bNZ1mDVJY=;
        b=VaDdq43FhQMU6byXsfkWDp33XNSPIty3PBCtU1FvG0OzKguSFEQ0i18xlRfvUcdP4M
         LTUlqwfnIeInhazupwXFMGYGqVYL8JQFCSraXPE2eI5z/DMz110zYDu5gDzihoeyyzZd
         o6vOvSipIV/hx6/ByUiLoK5mxvUrUqGi+/9GPUBq/l3ZmziBIvpEUCoc3x4ve9bbAf+o
         4sJsDiDGi6cDvwrgk8JTvaE3sK6ynZR7en7kBhc/3b8JP41rtQgodnxOOPIuSA+vz6FB
         b+6WDG9mImk11YYJgq/zRrz7pvctS+xUtMy1nQaS4yCrXqsGC1cmYRgUpYNWpSSaTzNB
         32pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657715; x=1691249715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmURNMQ4g+uKDqBOxCU5QGpeFr3wMwvEX8bNZ1mDVJY=;
        b=RT0dQQGd+DT7eTBtXMlTyJJTMIlfcAQd+CS9KaC3XDC9Gb2vL7NSOfhH5M8mkdfJ7j
         EOaOIaUMuca4UAvnTEYO++8ydF2JV+P6ZXhIsKAu9wxHsz1n3QpZLTVsTilGc1+HhiNF
         Kj/lLq3TtNR0/Jqo8uSN6+ThIM1ocj3t6ugheXc+3Ro7w2L+KQy8iWIYtNJcWmEi5EkE
         KA8qS4EVYi5fSFN3U8yKZPk0u9rdXoTzi2YXFoEPCrZP3rnsICZspK5A3GY6v48mujSF
         KgA6rZ0Qsv1NqZrvl5COHGhXvrIM4KNnknFz6l+OPzu0Mvg2WPhRacACyeIrdGfWJ3q2
         842w==
X-Gm-Message-State: ABy/qLaoNDnNIDYRFOMBEwvCnLkRO5nRXAPxk1Zq8zgAcJIhBu516Uy5
	Gi8TXHUMkQdkYUgzlfYMn0OXv59gfMDfKHP62Rw=
X-Google-Smtp-Source: APBJJlFkYwWhK36VkNZrbFUHE0TKrqUY9g3uWosgBNGZ1lbMr9olYEPwE1akgM+Vn5fAtg9w+Xi95A==
X-Received: by 2002:a05:600c:c8:b0:3fb:b05d:f27c with SMTP id u8-20020a05600c00c800b003fbb05df27cmr1634748wmm.34.1688657714685;
        Thu, 06 Jul 2023 08:35:14 -0700 (PDT)
Message-ID: <20b1a79c-23c1-93bc-2090-8052f143422c@rabbit.lu>
Date: Thu, 6 Jul 2023 17:35:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Detecting whether dom0 is in a VM
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@cloud.com>, Jan Beulich <jbeulich@suse.com>
References: <CA+zSX=Y4MwsDSd9oSG1NQyt==YAw9SeRdh=eJxTUhhOx57ihWg@mail.gmail.com>
 <4ee01a0f-063e-ef93-ac24-da387d5b3438@rabbit.lu>
 <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
From: zithro <slack@rabbit.lu>
In-Reply-To: <a680ae62-7765-aa51-1edd-9a1a7e39e449@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06 Jul 2023 09:02, Jan Beulich wrote:
> On 05.07.2023 18:20, zithro wrote:
>> So I'm wondering, isn't that path enough for correct detection ?
>> I mean, if "/sys/class/dmi/id/sys_vendor" reports Xen (or KVM, or any
>> other known hypervisor), it's nested, otherwise it's on hardware ?
>>
>> Is that really mandatory to use CPUID leaves ?
> 
> Let me ask the other way around: In user mode code under a non-nested
> vs nested Xen, what would you be able to derive from CPUID? The
> "hypervisor" bit is going to be set in both cases. (All assuming you
> run on new enough hardware+Xen such that CPUID would be intercepted
> even for PV.)

I'm a bit clueless about CPUID stuff, but if I understand correctly, 
you're essentially saying that using CPUID may not be the perfect way ?
Also, I don't get why the cpuid command returns two different values, 
depending on the -k switch :
# cpuid -l 0x40000000
hypervisor_id (0x40000000) = "\0\0\0\0\0\0\0\0\0\0\0\0"
# cpuid -k -l 0x40000000
hypervisor_id (0x40000000) = "XenVMMXenVMM"

> Yet relying on DMI is fragile, too: Along the lines of
> https://lists.xen.org/archives/html/xen-devel/2022-01/msg00604.html
> basically any value in there could be "inherited" from the host (i.e.
> from the layer below, to be precise).

So using "/sys/class/dmi/id/sys_vendor", or simply doing "dmesg | grep 
DMI:" is also not perfect, as values can be inherited/spoofed by 
underneath hypervisor ?

> The only way to be reasonably
> certain is to ask Xen about its view. The raw or host featuresets
> should give you this information, in the "mirror" of said respective
> CPUID leave's "hypervisor" bit. 

As said above, I'm clueless, can you expand please ?

> But of course that still won't tell
> you which _kind_ of hypervisor is the immediate next one underneath
> Xen.
> 
> This then further raises the question of what use it is to know the
> kind of the next level hypervisor, when multiple may be stacked on
> top of one another ...

We need an answer from systemd guys, but the commiter expanded on the 
reasons why the change was made [1] : "the detect_vm_cpuid check was 
returning a VIRTUALIZATION_NONE result on non-nested dom0 (checking the 
log from back then I was getting No virtualization found in CPUID), but 
would report other CPUID-detectable hypervisors when dom0 was nested, so 
we still wanted to check it for this case".

Systemd is using this information to not start some services when 
nested, like SMART/smartmontools (which have 
"ConditionVirtualization=no" in their systemd unit files).
As the check now fails on baremetal dom0s, the service is not starting.

[1] https://github.com/systemd/systemd/issues/28113#issuecomment-1621559642


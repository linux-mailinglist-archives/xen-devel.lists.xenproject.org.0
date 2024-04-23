Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C982D8ADD13
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 07:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710317.1109487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz8YI-0001EP-6p; Tue, 23 Apr 2024 05:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710317.1109487; Tue, 23 Apr 2024 05:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz8YI-0001Bl-3q; Tue, 23 Apr 2024 05:18:46 +0000
Received: by outflank-mailman (input) for mailman id 710317;
 Tue, 23 Apr 2024 05:18:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZwb=L4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rz8YG-0001Bf-PA
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 05:18:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3b1fd6f-0130-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 07:18:43 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so3806227f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 22:18:43 -0700 (PDT)
Received: from [172.16.1.227] ([80.95.105.245])
 by smtp.gmail.com with ESMTPSA id
 u17-20020adfeb51000000b00347321735a6sm13562143wrn.66.2024.04.22.22.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 22:18:42 -0700 (PDT)
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
X-Inumbo-ID: f3b1fd6f-0130-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713849522; x=1714454322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yQDPjBYgaEPej+sPKkqwDvOIU4v/GB+na7kEiN+q7+w=;
        b=gpl5/RYN3NIq18caoxnkFb0b+nPNQbYb/45GOwj+OPZqG2+KSK8QFSgFHXwZ1CEKGI
         hRD+pupfgsMMEvG4KwZqmIYiOHbvD3aQwocblV7HAX2PFiAiZ2+RcOyaQS8woEsnad0W
         bDMhYRcJLdQ8UntDk56u+PkISuq0bRJmz0d/fD3DYG6CWgCUTM8vSN+mIDaT/x6J3+Dm
         aI4wF3wYqewABzRbEviAfaSotnR+RHJpKL0iQYSs24/wsjIMHHjrxD5V4thKoQuIGxTu
         8+GHCFf9BUEaVJ8kBxmXpY71BZT/c8BYzSoGEhVmMPExLt98ZClES56BPSqxIcw1HYdb
         FQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713849522; x=1714454322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQDPjBYgaEPej+sPKkqwDvOIU4v/GB+na7kEiN+q7+w=;
        b=mahjcr3PRBRrmJJmVAZ0V3dOePKlLf/+WgYLi+UoXtPASF4QL7KuWdSHb1vJmYzt9a
         SWMm9/eWdG19ShRoSpDRSJGlgGIdSqUPtk154XxUF7OIxAHFJ/ibPHfJPi4kIyUgeyGT
         t38/Y83+sLGGgL7ccL8NOmLYGIyLbiXGOtbBmMC8mmXJ6Mn0N9615MTLdZXhbffj8QpC
         ljkyrmT7nH8uELUjuw46Rb4SoYqv2z7hBEn876x/TtQu8g9i5PyTAujEBYJe2TCEztX9
         6b/pX52aliujAs/0dmz8NssiI9FD92bcNB56FmbzmvdW4phHvP9uxKeaV7umv8vnlBs/
         TDAw==
X-Forwarded-Encrypted: i=1; AJvYcCX2IkG+Kl8rNtgOkCZtakTA137q6AH95JzFJLddcBOWie2/kbPyAJWg/UreOokBPtNNhLw6P1lhLQWm8XQ+e7LY1hTAMQToVXBOukIpLp0=
X-Gm-Message-State: AOJu0YzovD9q6lvFVcORihCvDdOJT6voteypjf3FHelzL4qXBi0N6P4H
	By2CY1OpTTR70YF1L05V+BoJdA5WJfWrS9nkrkmAphVGR5sf747NdY3PkRVIDIc=
X-Google-Smtp-Source: AGHT+IFnDvdhhnhPGB1oquQ2iYKMqEQy7CnkH/fuwMtag5DI3ttqdIFm04lVtD8/aniVydLHlzO1NQ==
X-Received: by 2002:a5d:56ce:0:b0:34a:2bc0:c9c4 with SMTP id m14-20020a5d56ce000000b0034a2bc0c9c4mr7950484wrw.5.1713849522577;
        Mon, 22 Apr 2024 22:18:42 -0700 (PDT)
Message-ID: <c366292d-87fb-4f19-8f97-8766269ee438@suse.com>
Date: Tue, 23 Apr 2024 07:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Detecting whether dom0 is in a VM
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>,
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
 <5154b22a-747a-435c-9bd2-1716b7d3303d@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <5154b22a-747a-435c-9bd2-1716b7d3303d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22.04.24 09:12, Jan Beulich wrote:
> On 19.04.2024 17:29, George Dunlap wrote:
>> On Fri, Jul 7, 2023 at 3:56 PM George Dunlap <george.dunlap@cloud.com> wrote:
>>>>>>> Xen's public interface offers access to the featuresets known / found /
>>>>>>> used by the hypervisor. See XEN_SYSCTL_get_cpu_featureset, accessible
>>>>>>> via xc_get_cpu_featureset().
>>>>>>>
>>>>>>
>>>>>> Are any of these exposed in dom0 via sysctl, or hypfs?
>>>>>
>>>>> sysctl - yes (as the quoted name also says). hypfs no, afaict.
>>>>>
>>>>>>   SYSCTLs are
>>>>>> unfortunately not stable interfaces, correct?  So it wouldn't be practical
>>>>>> for systemd to use them.
>>>>>
>>>>> Indeed, neither sysctl-s nor the libxc interfaces are stable.
>>>>
>>>> Thinking of it, xen-cpuid is a wrapper tool around those. They may want
>>>> to look at its output (and, if they want to use it, advise distros to
>>>> also package it), which I think we try to keep reasonably stable,
>>>> albeit without providing any guarantees.
>>>
>>>
>>> We haven't had any clear guidance yet on what the systemd team want in the <xen in a VM, systemd in a dom0> question; I just sort of assumed they wanted the L-1 virtualization *if possible*.  It sounds like `vm-other` would be acceptable, particularly as a fall-back output if there's no way to get Xen's picture of the cpuid.
>>>
>>> It looks like xen-cpuid is available on Fedora, Debian, Ubuntu, and the old Virt SIG CentOS packages; so I'd expect most packages to follow suit.  That's a place to start.
>>>
>>> Just to take the discussion all the way to its conclusion:
>>>
>>> - Supposing xen-cpuid isn't available, is there any other way to tell if Xen is running in a VM from dom0?
>>>
>>> - Would it make sense to expose that information somewhere, either in sysfs or in hypfs (or both?), so that eventually even systems which may not get the memo about packaging xen-cpuid will get support (or if the systemd guys would rather avoid executing another process if possible)?
>>
>> Resurrecting this thread.
>>
>> To recap:
>>
>> Currently, `systemd-detect-virt` has the following  input / output table:
>>
>> 1. Xen on real hardware, domU: xen
>> 2. Xen on real hardware, dom0: vm-other
>> 3. Xen in a VM, domU: xen
>> 4. Xen in aVM, dom0: vm-other
>>
>> It's the dom0 lines (2 and 4) which are problematic; we'd ideally like
>> those to be `none` and `vm-other` (or the actual value, like `xen` or
>> `kvm`).
>>
>> It looks like ATM, /proc/xen/capabilities will contain `control_d` if
>> it's a dom0.  Simply unilaterally returning `none` if
>> /proc/xen/capabilities contains `control_d` would correct the vast
>> majority of instances (since the number of instances of Xen on real
>> hardware is presumably higher than the number running virtualized).
>>
>> Is /proc/xen/capabilities expected to stay around?  I don't see
>> anything equivalent in /dev/xen.
> 
> I believe it's intended to stay around, but a definitive answer can only
> come from Linux folks. Jürgen, Stefano?

I have no plans to remove it.


Juergen

> 
> Jan
> 
>> Other than adding a new interface to Xen, is there any way to tell if
>> Xen is running in a VM?  If we do need to expose an interface, what
>> would be the best way to do that?
>>
>>   -George
> 



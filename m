Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A178F40304C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 23:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181356.328432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNidZ-0003F1-T5; Tue, 07 Sep 2021 21:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181356.328432; Tue, 07 Sep 2021 21:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNidZ-0003Ba-Pf; Tue, 07 Sep 2021 21:28:13 +0000
Received: by outflank-mailman (input) for mailman id 181356;
 Tue, 07 Sep 2021 21:28:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NjNB=N5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mNidY-0003BU-H9
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 21:28:12 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a400bb9-9177-4b0f-82b0-8f51a1c42618;
 Tue, 07 Sep 2021 21:28:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id t19so19813lfe.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Sep 2021 14:28:11 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id k10sm10473lfo.57.2021.09.07.14.28.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 14:28:09 -0700 (PDT)
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
X-Inumbo-ID: 0a400bb9-9177-4b0f-82b0-8f51a1c42618
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rCoPbmqBwB8B6I+y0U69hfFC7ri8VBmXepajnA2jkcI=;
        b=GawO2P5zMyZpdXRAbTM0ddAxKXijkkN9Jx5LugaBUviT+HxZvxx6ZKDVOj9LlxziWh
         QHPns/U+Rk4YQ6hfCqfnVUzye95HEiIfOcKF7xHKsj6EjHkRmfeU8vUxgN3O3wylY4Am
         xi4kJJk+p6t7hPoHz1cKytAR9AyLckoLKsVeWORVzhkhNKXhcl58HLw58QnfX5iYdLtu
         HnbLqBPURowicpYM4/CWrBdQNAggrlzSWfIbWpsPJX/YgSIxs8xVUMFIs6Unr6MlhJU1
         dk+ecjgpgFSE387Vkq7E0He7fb62laxZsKvA0oAdqII2JoosEpc+ZyQt003AV7SH6QY4
         Dngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rCoPbmqBwB8B6I+y0U69hfFC7ri8VBmXepajnA2jkcI=;
        b=ruE+f628Bab5cADQ/+NBEq3h6UhEVHGsLVEYGW8SMZpcUTmyTqr3H3femHh4eqBt5/
         LK09FKqs5eKR6UBhL/R8P4CkIh3oWBSyyU1qfX60Nrt//TGXlpx50u+JEGuThE0aw/qh
         dNL6/TQASDWPczsC7bHyMiELWswU164HdSlr44mRFsQ7mV2TfMBL7v3fztctWbxVz597
         JSIFfZIOCCwoohBkBAY+yXBaFzLSXDN6hzqS8AlCIFfxukDfsdZD0UHzYeMxPNpOG2N9
         0UiNNkkDWnivMrwroLu3bOiaYE23mHthOPAD4Jaa2ratWsvStjHKrPwGXEDJqpvIWW0Y
         NPoQ==
X-Gm-Message-State: AOAM533NLo+40lQF6MIikmx3TDvy6jGI+ksF1F3PHYuOdu/k61G2BQcU
	lahQxxhhiMZ+Mg1HUD6lpMg=
X-Google-Smtp-Source: ABdhPJxXV9/nB6x2dRD0ZzUdN29UvvrG5mslv6tFU2OOS4Dhy/0KZj3CI6rKj1YVVrNXmsBp9TTj2A==
X-Received: by 2002:a05:6512:21a8:: with SMTP id c8mr321662lft.514.1631050090020;
        Tue, 07 Sep 2021 14:28:10 -0700 (PDT)
Subject: Re: [RFC PATCH 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
 <1631034578-12598-2-git-send-email-olekstysh@gmail.com>
 <973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0994251e-5e02-009a-851d-4e4ee760fc66@gmail.com>
Date: Wed, 8 Sep 2021 00:28:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 07.09.21 20:35, Andrew Cooper wrote:

Hi Andrew

> On 07/09/2021 18:09, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> We need to pass info about maximum supported guest address
>> space size to the toolstack on Arm in order to properly
>> calculate the base and size of the extended region (safe range)
>> for the guest. The extended region is unused address space which
>> could be safely used by domain for foreign/grant mappings on Arm.
>> The extended region itself will be handled by the subsequents
>> patch.
>>
>> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>> hap_paddr_bits.
>>
>> As we change the size of structure bump the interface version.
>>
>> Suggested-by: Julien Grall <jgrall@amazon.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> So while I think this is a suitable way forward, you're painting
> yourself into a corner WRT migration.
>
> On x86, the correct value is d->arch.cpuid->extd.maxphysaddr and this
> value is under toolstack control, not Xen control.  In particular, it
> needs to be min(hostA, hostB) to make migration safe, and yes - this is
> currently a hole in x86's migration logic that will cause large VMs to
> explode.
>
> The same will be true on ARM as/when you gain migration support.

Oh, I admit, I didn't keep in mind migration support while creating this 
patch.


>
> I think this would be better as a domctl.  On ARM, it can reference
> p2m_ipa_bits for now along with a /* TODO - make per-domain for
> migration support */, while on x86 it can take the appropriate value
> (which will soon actually be safe in migration scenarios).

OK, could you please clarify, did you mean to introduce new domctl 
(something like get_maxphysaddr) or reuse some existing?

And ...

>
> However, that does change the ordering requirements in the toolstack -
> this hypercall would need to be made after the domain is created, and
> has been levelled, and before its main memory layout is decided.

... I am not sure I totally understand the ordering requirements in the 
toolstack.

On Arm this information (gpaddr_bits) should be obtained by the time we 
call libxl__arch_domain_finalise_hw_description()
where we actually calculate extended region and insert it in domain's 
device-tree. At that time, the domain memory is already populated, so 
it's layout is known.
Please see the last patch of this series, which demonstrates the usage:

https://lore.kernel.org/xen-devel/1631034578-12598-4-git-send-email-olekstysh@gmail.com/


> Alternatively, the abstraction could be hidden in libxl itself in arch
> specific code, with x86 referring to the local cpu policy (as libxl has
> the copy it is/has worked on), and ARM making a hypercall.  This does
> make the ordering more obvious.

May I please ask what would be the preferred option to move forward? I 
am fine with both proposed options, with a little preference for the 
former (common domctl, abstraction is hidden in Xen itself in arch 
specific code). It is highly appreciated if we could choose the option 
which would satisfy all parties, this would save me some time.

> (As a note on the x86 specifics of this patch, hap_paddr_bits is
> actually unused in practice.  It was a proposal from AMD for the
> hypervisor to fill in those details, which wasn't implemented by anyone,
> not even Xen, because the important field to modify is maxphysaddr if
> you don't want to rewrite every kernel to behave differently when
> virtualised.)

Thank you for the clarification.


>
> ~Andrew
>
-- 
Regards,

Oleksandr Tyshchenko



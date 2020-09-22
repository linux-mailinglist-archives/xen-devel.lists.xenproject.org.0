Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AE7274748
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 19:12:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKlq3-0000Ws-SY; Tue, 22 Sep 2020 17:12:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cWTz=C7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kKlq2-0000Wn-Ko
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 17:12:22 +0000
X-Inumbo-ID: f22deb25-5bbf-4bec-9321-ab7c611abd09
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f22deb25-5bbf-4bec-9321-ab7c611abd09;
 Tue, 22 Sep 2020 17:12:21 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id m5so18884154lfp.7
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2020 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZWSja0ufIWVtNDFv51hQR+bPsuI2qEYYyeD6ST1ZcYE=;
 b=EGKXAiaTIl1AW/tA75POf5RkU3lC7tbt62IpT30lbGEVdwwNOsm2ih+doxMw34twSB
 E7emflNZ90EvnZi5yMxRcbJogCby/fNObvzD8IWe8raVjJVO8OoymEWiseTFcFq1OoVp
 P7u6Zdl2RCMaYe4LLXbUer5GO3vgL6qHGVQbn2uMbJPuiKSItscZRZ+DGllPjS12C5QN
 CgqvfbI32YPLm8rqqISqVYN7iknGis9MqOUDelLS1gavctHpTX+pXVSXdQecpod3B/2+
 fSrp9vdIC4DZ8JAg+P98iLdYpLojh+o73VV/8cEfFdwfXI01YBNY1eZ0M+Uq5vO33KNO
 Y/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZWSja0ufIWVtNDFv51hQR+bPsuI2qEYYyeD6ST1ZcYE=;
 b=HBmEgLvPtF6P30v2QYlcSKI8ayIEgBE8YlSGav9/Gk0L7WYFxX0L3rkAlDeJSWRlpm
 ZVG+J/Uu7MG5ScaaRyWp1tg2keOv2957WwkWYPGfAtcM5CYCfVmbFAjjXMXzXFmEnUpj
 bdsibG7pddal2h4IYPWKhSICi3TGjD6Oa+AOxyIzuYcV14/mhfUO7wnhtYIyoMPzFKea
 VjmGUfvHPW7HNUt72o6VLuuvBdQcI9GMQjY3REYVQUzm2H2bSf1bLA6+jtPQtbp8/2JR
 f0YhlOKSmF1pj7eP9kjWveBTvU23+FL1cHeGYhW2DisbSBodRHRP1dPMO/MfwO74h0NX
 /yRA==
X-Gm-Message-State: AOAM530g2l7S/gtYQ85qbGhqUmDGl+V+H61PFWGpeGoKpAqLANNxgXiv
 88dtoWrWnq2gZzW5CMGhiTo=
X-Google-Smtp-Source: ABdhPJzdp5/c0pdZ2tlHP4ebjsNf3AaL4H78C+YttebTrHi+X3UyNyMGogcRoW6fdde8W5TOPLZv6g==
X-Received: by 2002:a19:e4c:: with SMTP id 73mr2232501lfo.286.1600794740673;
 Tue, 22 Sep 2020 10:12:20 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n3sm3658096lfq.274.2020.09.22.10.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 10:12:20 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <dd36ad99-2d18-e384-84aa-565fa8e0c5db@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e31493ad-9879-80f9-c33e-125f6f791227@gmail.com>
Date: Tue, 22 Sep 2020 20:12:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dd36ad99-2d18-e384-84aa-565fa8e0c5db@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 16.09.20 10:51, Jan Beulich wrote:

Hi Jan

> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> @@ -2277,8 +2299,10 @@ void leave_hypervisor_to_guest(void)
>>   {
>>       local_irq_disable();
>>   
>> -    check_for_vcpu_work();
>> -    check_for_pcpu_work();
>> +    do
>> +    {
>> +        check_for_pcpu_work();
>> +    } while ( check_for_vcpu_work() );
> Looking at patch 11 I've stumbled across changes done to code
> related to this, and now I wonder: There's no mention in the
> description of why this safe (i.e. not a potentially unbounded
> loop).
Indeed there was a discussion regarding that. Probably I should have 
added an explanation.
Please see the thoughts about that and a reason why it was decided to 
let the vCPU to spin forever if I/O never completes
(check_for_vcpu_work() never returns false) and why it was considered as 
safe action:
https://patchwork.kernel.org/patch/11698549/#23540209


>
> As a nit - the opening brace does not belong on its own line in
> this specific case.
ok

-- 
Regards,

Oleksandr Tyshchenko



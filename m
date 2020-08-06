Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB6A23DB27
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 16:29:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3gsk-0005YC-2X; Thu, 06 Aug 2020 14:28:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTjn=BQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3gsi-0005Y7-LU
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 14:28:32 +0000
X-Inumbo-ID: abc04708-6493-475b-9b33-dee18dee49f2
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abc04708-6493-475b-9b33-dee18dee49f2;
 Thu, 06 Aug 2020 14:28:31 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id x24so8892436lfe.11
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2020 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=k70CcyaQid7eNox+lj8GvXJZM2fQRHdHzudRaxdVrwE=;
 b=XfJMPyotCYZOjizw3Y+NOcbVreTn1E/ROpVTR261WPmzHFXB9kKy4HJPW8Uw91yHwl
 tmoPlK4iqCW4Uw6VZ+XvlRqLaZqk/42D/YppFSpUs4N4ucu14013z1BUZ9197TfJDMvJ
 61W+yTgBySHRqrcmpeLI4L4FwNNJAknfVw+F9+91R9bR0d7Fv+yINYaXMLTvz0c7Y2yz
 CSgDdRM+X7hbxXIF2hJ0NTNmyJouxe1zy84DZpPeM4EoAfaZ+YqhssIjhLe3n3zwZJrt
 pdHoE3RcQ/tHOQtF4d4MtNPY44AM4pH3Vh2iB31KY7iAdz3k9ffOoCvJVh5P0TOo+k/U
 hIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=k70CcyaQid7eNox+lj8GvXJZM2fQRHdHzudRaxdVrwE=;
 b=nDPBUtEeX4egC7dqVfCOBjzP/tNSFLZ57E4IQYeMgKrkbfOIHG0nBFQROilBQtWU4/
 /izsS2I/ctoS6MQFqQbxKju8BRVslyAXRLCJDF6JKm25UtkyaM+wKTlASb1EWvtkOM49
 JcqTrLTLWwJuamwbslnaIk7eAMl9c9BqpLDN2z6AYIsUDibNMCGahyVs4Ujnv/RdcXev
 0A7y5DGj1kUuP8nhdKIRz/xIG+NU/c/mhB6EJg835HRgo23K9VyTSY8y4H6pS/FPCdj6
 uMaVuTt7MT0OsLZr9USXbkye4Gi5g0xzQCD9pjnU8Qtn0t3chFEzG4Ccvg5GJXvIDYTy
 SeCQ==
X-Gm-Message-State: AOAM532cvixwq+k73/tlZUN5jBkm4TpIgKW5WxvSQn9H9i9UTJApUnQn
 xOtw4Irx/LLEDQpBdYxsnlc=
X-Google-Smtp-Source: ABdhPJyHa05Cen5obpKOoZ8kv0NEhLNO7eSQk92T0cD1qqqRnSoky+AQ9fWe8qvDHZI9TBlEy+ylGw==
X-Received: by 2002:a19:e45:: with SMTP id 66mr4035487lfo.82.1596724110519;
 Thu, 06 Aug 2020 07:28:30 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t10sm2490758ljg.60.2020.08.06.07.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 07:28:30 -0700 (PDT)
Subject: Re: [RFC PATCH V1 08/12] xen/arm: Invalidate qemu mapcache on
 XENMEM_decrease_reservation
To: Jan Beulich <jbeulich@suse.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-9-git-send-email-olekstysh@gmail.com>
 <21b7d8ed-f305-8abe-0e4e-174d72d087c8@suse.com>
 <ce4076ae-705d-e24d-831a-6898d93a4040@xen.org>
 <04cfd6e4-1ed0-52c3-a3b0-d555d9dc632b@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0ff0807f-c5d3-f63c-d54c-860648ef3a13@gmail.com>
Date: Thu, 6 Aug 2020 17:28:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04cfd6e4-1ed0-52c3-a3b0-d555d9dc632b@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 06.08.20 14:50, Jan Beulich wrote:

Hi Jan

>>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/common/memory.c
>>>> +++ b/xen/common/memory.c
>>>> @@ -1652,6 +1652,12 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>            break;
>>>>        }
>>>>    
>>>> +    /* x86 already sets the flag in hvm_memory_op() */
>>>> +#if defined(CONFIG_ARM64) && defined(CONFIG_IOREQ_SERVER)
>>>> +    if ( op == XENMEM_decrease_reservation )
>>>> +        curr_d->arch.hvm.qemu_mapcache_invalidate = true;
>>>> +#endif
>>> Doesn't the comment already indicate a route towards an approach
>>> not requiring to alter common code?
>> Given that IOREQ is now moved under common/, I think it would make sense
>> to have this set in common code as well for all the architecture.
>>
>> IOW, I would suggest to drop the #ifdef CONFIG_ARM64. In addition, we
>> may want to introduce an helper to check if a domain is using ioreq.
> Of course, with the (part of the) conditional dropped and the struct
> field moved out of the arch sub-struct, this is fine to live here.

ok.


I suspect this should *also* live in compat_memory_op(). Please confirm 
whether my understanding correct.


-- 
Regards,

Oleksandr Tyshchenko



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6023D322
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 22:36:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Q8V-0004Ga-RJ; Wed, 05 Aug 2020 20:35:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w8Yv=BP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k3Q8U-0004GV-GG
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 20:35:42 +0000
X-Inumbo-ID: e03fe94c-19ab-41fd-b05c-461ace6b62c7
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e03fe94c-19ab-41fd-b05c-461ace6b62c7;
 Wed, 05 Aug 2020 20:35:41 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s16so33982682ljc.8
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2020 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=1YXgAcf/MkURvy5fQI+D8jfLLLAeCGsmKnn68DUsZ1c=;
 b=E6PIY3OCuHOcBzxx7Kg6w0BCxIbeSkFhMiVY4qwom/Budu6VBpBCBmrw2p7zD1l9Dg
 lmnqyiRsz4FvQus93cZ0/S6YTjA/B0Cn+derj+bhH/xutLJbzGU+D71Lynee60ZNFb/Q
 uX+/P1BXBpYvkCwXCNOKvbmGqTU3sNzmS1bHGHEIuiZ9xEdmMbmf5lH88LbSg8QyMbPB
 ySlfXwI54JZ78GqyY+yb8YVdvPt4ui+yQeKPsq1El9mgnIJhhQ8F6jAALQghPna8hnUX
 XORpMsi/LC8ILrK04AsSSJO0EpByOTi/qYksB8BWowXRISYrnUMpc7tlkHnGlT3qH9+o
 /mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1YXgAcf/MkURvy5fQI+D8jfLLLAeCGsmKnn68DUsZ1c=;
 b=Pr0Tdtm3w9F1LyJ9+Ubn0sGQZJte8NAO9wkFfBZQXUwwavLzG7OtVWmyIoev/uUNM0
 jvj8Mysl0fpIRdZJS/3SfFd+Uk4xajrqR4YnLsthdHXvKEof1eCtUCHfjPBXfBFNau6k
 Ghi4wgwUwmwyLL/np5BUnB41G/qEyXlGh5me2BRARPE5W1hU1bG3wlJAMOEc2tnfeguO
 lX9h1PmxWniWfjq4qzYMeE+MOBrrkcTBsPPqTE+YFNW8tgmpysTZUUaKyxCWEKxzifSX
 5/caupJ69b2qCqGoLUyA3Kb8sxMkIyDtlTduttskwRgfhlCaXx5wKeIbem6+6LfN2zNs
 fubA==
X-Gm-Message-State: AOAM531mvmbqNivSjcovQJnp477tWFbNXOEduL4bagUe0JXcDOi5a4ta
 7gOLinsP7WpWkwUjhahcdRE=
X-Google-Smtp-Source: ABdhPJwjcNp5wjrYke3++cmCZ8Ebmm7LuoH5Cm7DU8h25kreAbFXeyvXJkM1+1yG0PFE4dufJ2Stdw==
X-Received: by 2002:a2e:a49a:: with SMTP id h26mr2093549lji.168.1596659740380; 
 Wed, 05 Aug 2020 13:35:40 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y21sm1329036ljk.129.2020.08.05.13.35.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 13:35:39 -0700 (PDT)
Subject: Re: [RFC PATCH V1 11/12] libxl: Insert "dma-coherent" property into
 virtio-mmio device node
To: Stefano Stabellini <sstabellini@kernel.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-12-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2008041559330.5748@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5ed8d80a-da71-3f54-7e80-9f93bd285e4d@gmail.com>
Date: Wed, 5 Aug 2020 23:35:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008041559330.5748@sstabellini-ThinkPad-T480s>
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
Cc: Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 05.08.20 02:23, Stefano Stabellini wrote:

Hi Stefano

> On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Without "dma-coherent" property present in virtio-mmio device node,
>> guest assumes it is non-coherent and making non-cacheable accesses
>> to the vring when the DMA API is used for vring operations.
>> But virtio-mmio device which runs at the host size is making cacheable
>> accesses to vring. This all may result in a loss of coherency between
>> the guest and host.
>>
>> With this patch we can avoid modifying guest at all, otherwise we
>> need to force VirtIO framework to not use DMA API for vring operations.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> This should also be folded in the first patch for libxl

Agree, will do



-- 
Regards,

Oleksandr Tyshchenko



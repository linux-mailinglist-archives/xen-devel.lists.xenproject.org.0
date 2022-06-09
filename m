Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF8544B73
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 14:13:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345248.570909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH2i-0002WR-F9; Thu, 09 Jun 2022 12:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345248.570909; Thu, 09 Jun 2022 12:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzH2i-0002Rd-Aa; Thu, 09 Jun 2022 12:13:40 +0000
Received: by outflank-mailman (input) for mailman id 345248;
 Thu, 09 Jun 2022 12:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdCg=WQ=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1nzH29-0006fn-Sv
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 12:13:06 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e6fb2e4-e7ed-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 14:12:56 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so20863806pjb.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jun 2022 05:13:05 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a170902d5d700b00166423df3cdsm14594081plh.209.2022.06.09.05.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 05:13:02 -0700 (PDT)
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
X-Inumbo-ID: 7e6fb2e4-e7ed-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4OEpwKfRhk+/Bw+ajXIlaom3ggZwPPaPsXOJxTS2d7g=;
        b=YePZDPXQlHwHra1M8oaueRHnzF0+1wwx47W6shZG9D5RX6o4W641iQqi41eqckK2Ze
         2OeonslVAfH8l7bYS+Wa7mQM/QQ1KzGzpWeI3GQGAEPOJG+1soa40qQ2qwEI/yPRb6bM
         sPm13NdTMu9IZh4xRkejAKcDCC1HaxLedergL0HkYC5T9hk1PVpp7/vmVAr23rU+jwm7
         00CK+LDaqrS9BqV6miBVfQvc19UagmlQq0M7qoeSSgBw3vIPUJJ8fq4RabRYGX44Rq5L
         dAPEA20CTXkeEghzUucB5RvM0j0BBWOSE8nqxDhxEe6ops21mZcWBT5AFYcyORzghpWY
         3EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4OEpwKfRhk+/Bw+ajXIlaom3ggZwPPaPsXOJxTS2d7g=;
        b=v0zukAiQ24QjLsJ5/PFCEvHEF3olVXuXJYcuCTQUg7UYgj7EoKfR7RQuaOcaLo5ExN
         Xl75l33XCafqEz1F1WB7kEhhcF8s6XTGkMzvg9U0W6QQiC/lpeL26Lhn1AYKu0WTkY4G
         GrxAaHzhDmkISOL6O0wGcld02PeLLHS89zaeo9X2QXfvTyaq+3nHcPsQC4PJSD4k43rq
         MqiW/7xfx61cpjGPVDIBVmoL8L1+YtbxMbMTTqeAv5PdDSbz6mXx7gYP/d4mT4BZicl8
         +Nm/LGMTN6XTTON364LS+p3Fesmo/9hVcLnEDV3wYzNMZPCoahPcEdo3qsmqnYwbm4U8
         HFgg==
X-Gm-Message-State: AOAM5316/VKWmxrWY+bayxB/4dWGZvSjMHHtGfANqTYYip2fGwcAOhWG
	cKC8XXnG4dpmbesEl/Bj3bc=
X-Google-Smtp-Source: ABdhPJxolsVGMF3LD135fEKYtts558HztJx0DtQ/nXL2nAEKTVv629O5Bqlcj2rcS1Ve97CgGhad9A==
X-Received: by 2002:a17:903:246:b0:153:857c:a1f6 with SMTP id j6-20020a170903024600b00153857ca1f6mr39078667plh.153.1654776783535;
        Thu, 09 Jun 2022 05:13:03 -0700 (PDT)
Message-ID: <c0c610b8-df0c-7e2a-385f-bcf70c987182@gmail.com>
Date: Thu, 9 Jun 2022 21:12:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
 <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
 <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/06/09 21:02, Gerd Hoffmann wrote:
> On Thu, Jun 09, 2022 at 08:45:41PM +0900, Akihiko Odaki wrote:
>> On 2022/06/09 19:28, Gerd Hoffmann wrote:
>>>> --- a/include/ui/console.h
>>>> +++ b/include/ui/console.h
>>>> @@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
>>>>        int       yoff;
>>>>        uint32_t  width;
>>>>        uint32_t  height;
>>>> +    uint32_t  refresh_rate;
>>>>    } QemuUIInfo;
>>>>    /* cursor data format is 32bit RGBA */
>>>> @@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
>>>>        void (*gfx_update)(void *opaque);
>>>>        bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
>>>>        void (*text_update)(void *opaque, console_ch_t *text);
>>>> -    void (*update_interval)(void *opaque, uint64_t interval);
>>>>        void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
>>>>        void (*gl_block)(void *opaque, bool block);
>>>>    } GraphicHwOps;
>>>
>>> So you are dropping update_interval, which isn't mentioned in the commit
>>> message at all.  Also this patch is rather big.  I'd suggest:
>>>
>>> (1) add refresh_rate
>>> (2) update users one by one
>>> (3) finally drop update_interval when no user is left.
>>>
>>> thanks,
>>>     Gerd
>>>
>>
>> I think 1 and 3 should have to be done once since refresh_rate and
>> update_interval would interfere with each other otherwise.
> 
> Well, between 1 and 3 both old and new API are active.  Shouldn't be
> much of a problem because the GraphicHwOps implementations are using
> only the one or the other.
> 
> take care,
>    Gerd
> 

The only GraphicHwOps implementation updated with this change is xenfb. 
xenfb can be switched to use refresh_rate in step 1 or 3.

Switching to use refresh_rate in step 1 would break the refresh rate 
propagation until all host displays are updated to set refresh_rate 
instead of calling update_interval.

Switching to use refresh_rate in step 3 would break the refresh rate 
propagation when a host display is updated to set refresh_rate instead 
of calling update_interval but xenfb does not use refresh_rate.

Regards,
Akihiko Odaki


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478875910AA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 14:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385647.621314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMTZq-0008C4-Q3; Fri, 12 Aug 2022 12:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385647.621314; Fri, 12 Aug 2022 12:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMTZq-00088c-N2; Fri, 12 Aug 2022 12:15:46 +0000
Received: by outflank-mailman (input) for mailman id 385647;
 Fri, 12 Aug 2022 12:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Yc4=YQ=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oMTZp-00088W-Un
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 12:15:46 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d999b0c-1a38-11ed-bd2e-47488cf2e6aa;
 Fri, 12 Aug 2022 14:15:44 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id a89so1108619edf.5;
 Fri, 12 Aug 2022 05:15:44 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b0072af92fa086sm747790ejt.32.2022.08.12.05.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 05:15:43 -0700 (PDT)
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
X-Inumbo-ID: 7d999b0c-1a38-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=e7r9wr/3pU9Tvocybig/58P53291tIgzjS8e6KCKWrM=;
        b=JKn4WYD4qh380HK1sylQcu8MbzHRwx+WOHOwpL9hqCGZnkzuvN/dTReBOeP4T6uQKW
         gXlW8FlDnpyWir7SWQ5Zj/rE0TF0CmrV9dvADOMo09JPaF0AJ97VCXOAl2Mz8SdjDvCR
         dGYtTR8QZnhezc1X1pAvk/oWEOoClRwghije6inWcqmKX+uWPbBx34OZi21A6OiDhzkd
         Yo397+Onc/UXSQYeLWEhtvHE3bjXb5VVdwhonXehs/uEdEblb/yRXlJqJUdj1g7vlAOd
         2wl06LkPuSvxCdk/VmUgKLFLgMsYSIFD+rsGBZCfRGFDLSJ642yP0CC9Gjvaja6XzcXR
         /Ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=e7r9wr/3pU9Tvocybig/58P53291tIgzjS8e6KCKWrM=;
        b=cj/RfKoFsVJxDfTiG1EXcTyGTQwUp105EYMS5INp90v2B9Z2rDPsGQOMmgun+eMfDV
         5C/EpdWbwoViDUplvefGckuj7lW8JySfSfXmTYbFOBHn3FTZb9UoqRBF1DX+Hc3ljgPd
         IxnKND5UVKP2g2u9iBBHIzpcAc8lxDzA5RULCVbVXmA5lptnSVrZzcy9VGnW/XQ34E+S
         OFlLyONTMsWu6I16NzNpNM5p76dR7FdNyCrjDMHcryrvh55ptpKXmcsfPSge4isuwBGl
         60qycNMMwm6iVEcXhkdAqSiws0rtTzVIaHyVhueSdISdimVqsNZKUSY2oX+SFqVLJmSF
         R2Hg==
X-Gm-Message-State: ACgBeo0PRzc/x7vL4abkiSc65i8e2GMtp8RH5CjUO1IdCSnWoL0iNsXQ
	9zZ/Gvc8GhGWiP36MTQceAQ=
X-Google-Smtp-Source: AA6agR4B6sGfQKZz14hVONV4QyWwDgrceOWe1ds1YuzPAEMj7of3D12+SRMKw6ejeoYSxA4iJLQJjA==
X-Received: by 2002:aa7:d653:0:b0:43d:151b:5939 with SMTP id v19-20020aa7d653000000b0043d151b5939mr3341999edr.278.1660306544172;
        Fri, 12 Aug 2022 05:15:44 -0700 (PDT)
Message-ID: <df068c2b-2b09-fb0f-aa85-77bb1191b25a@gmail.com>
Date: Fri, 12 Aug 2022 15:15:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Enable audio virtualization in Xen
Content-Language: en-US
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>
Cc: "dpsmith@apertussolutions.com" <dpsmith@apertussolutions.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
References: <DM6PR12MB429763D0795CAB57F9F7206A9F679@DM6PR12MB4297.namprd12.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
In-Reply-To: <DM6PR12MB429763D0795CAB57F9F7206A9F679@DM6PR12MB4297.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12.08.22 12:27, SHARMA, JYOTIRMOY wrote:
>
> [AMD Official Use Only - General]
>
>
> Hello Christopher,
>
Hello Jyotirmoy, Christopher


Just spotted that libxenbe and snd_be were mentioned ...


> Thank you so much for your reply. I will execute your steps and first 
> try to enable pulse audio as you have mentioned.
>
> Later I will try to enable ALSA which is my final requirement.
>
> Meanwhile, I was reading up on virtio-snd and found some patches in 
> the internet. However, those patches are not
>
> present in the qemu source code 
> (https://gitlab.com/qemu-project/qemu.git). Do you know
>
>  1. If virtio-snd front end driver is another option to enable audio
>     in HVM guest with Qemu/ALSA as backend in dom0?
>  2. If yes, how is it different from xen front end drivers?
>
> Also, regarding enabling Xen PV audio front end device drivers, you 
> have mentioned that I need to enable backend using libxenbe and 
> snd_be. Does it mean, in this case, Qemu is not involved in the audio 
> backend? Any pointers to understand this overall architecture (Xen PV 
> audio front end driver/snd_be/qemu/ALSA) will be extremely helpful.
>

    ... I am not familiar with sound internals, but have an overall 
understanding about Xen PV audio.


1. The backend (snd_be) is Xen PV backend, not a virtio. It is a 
standalone user-space application, so Qemu is not involved here if we 
are speaking about snd_be+libxenbe. The backend can work on top of Pulse 
or Alsa and supports playback and record.
    https://github.com/xen-troops/snd_be/commits/master
    Some details you can find at:
    https://github.com/xen-troops/snd_be/blob/master/README.md

2. The library (libxenbe) contains various Xen specific stuff, such as 
event channel, xenstore, grant table, etc needed for Xen PV backend to 
work, so it should be linked by snd_be.
    https://github.com/xen-troops/libxenbe/commits/master
    Both snd_be and libxenbe are written on C++, both are part of Yocto 
build, but I guess they can be built standalone.


3. The frontend is in upstream Linux and supported, the protocol is also 
there, toolstack also supports PV audio configuration (no extra patches 
are needed):
    https://elixir.bootlin.com/linux/v5.19.1/source/sound/xen
https://elixir.bootlin.com/linux/v5.19.1/source/include/xen/interface/io/sndif.h

    Also the guest should be built with CONFIG_SND_XEN_FRONTEND=y


> Regards,
>
> Jyotirmoy
>
-- 
Regards,

Oleksandr Tyshchenko



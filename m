Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78574507654
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 19:16:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308414.524157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrS7-00074d-WB; Tue, 19 Apr 2022 17:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308414.524157; Tue, 19 Apr 2022 17:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngrS7-00071O-Rs; Tue, 19 Apr 2022 17:15:47 +0000
Received: by outflank-mailman (input) for mailman id 308414;
 Tue, 19 Apr 2022 17:15:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tr1R=U5=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1ngrS6-00071I-LD
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 17:15:46 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59795740-c004-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 19:15:45 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id o2so30515562lfu.13
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 10:15:45 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a2e8e29000000b0024da2131ed9sm1464256ljk.100.2022.04.19.10.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 10:15:44 -0700 (PDT)
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
X-Inumbo-ID: 59795740-c004-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=IEIkHtF9OK4EglJtk5NkkYIfQgmSypjXF46RNxhi5RE=;
        b=k6aGnfX2Pqy0GUbLeB/Z/EafhQc/cEI4DgdMg01n/f7SaY6qbAsd2tgpfYAMNiB8S+
         zvTo4soPr5cUn8WL8RhmsdtZBPrQZsoaRkGtTUyT6u5lGSaeXPknFgiX4HSzMoLu3ET3
         1P7P/vQNCwoRub09Nf7gm7d0YDtlbHhWHToLVP614inbkxO/FOdwX9kdBd4oTJh2qIMQ
         5TxxGXvIFyE/yOuYUJucw5lqRbSNGsmLds3qQa4oqizaf39wYcWS52TTp6jwY676aQBl
         jWdldFHHjki/k98G13iz32BG03vGQ4uAS83NceJrRwhBSxJX4+jIsQZIv58A8qeyO2qt
         c3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=IEIkHtF9OK4EglJtk5NkkYIfQgmSypjXF46RNxhi5RE=;
        b=fiLcSh6a1I+9EH+5Y6vNX8xSAxWGy3rIqEOPBjNf9a55+PKFHa6MBOrRtJ2E4HAwsC
         uKBdwFfq7pdYI0XY/AiNx24A1om0iJ/BRgW3q5SCxzjonP0B6A1UwBj2KfhUBmlJgADJ
         gIzFov2Rh7UP911N42BAooG0YxOf1dwzPKlPEMnxN8156eCyJRNIbACi9nBp/SeqzYyg
         aOcXQO/orewoMjKqfu4Y4iIui67YTr3MFgGwvHkUnLsIBgWReYAycQUFeYVaP13vjvLe
         69pO3nhtCaFuCqGbX9ZeWyzgLsdJEOCOaK81QIiE0Lxsi4RmuqZwYyQ+Q/EBWQXS6ttN
         DdRg==
X-Gm-Message-State: AOAM532lT6+s/oEx1WokQskRevuThiRLAcnybcrozhsRfxIxIhmqWNyK
	8A1wZoEdG7biZblmTh7ucjM=
X-Google-Smtp-Source: ABdhPJzZgOwigV5NF34b7KXW7x0t8jZuVfrPF/GeZNJB5lrf/ygeJhC+iwcTT4H03Ja87fEIFVsO+A==
X-Received: by 2002:a05:6512:2208:b0:46b:82c7:677b with SMTP id h8-20020a056512220800b0046b82c7677bmr12233880lfu.24.1650388545250;
        Tue, 19 Apr 2022 10:15:45 -0700 (PDT)
Subject: Re: [PATCH V7 1/2] libxl: Add support for Virtio disk configuration
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
 <rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-2-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.22.394.2204181405160.915916@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <4f94e255-ff38-9648-4330-2b7d5e459aae@gmail.com>
Date: Tue, 19 Apr 2022 20:15:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2204181405160.915916@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 19.04.22 00:38, Stefano Stabellini wrote:

Hello Stefano

>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> This patch adds basic support for configuring and assisting virtio-mmio
>> based virtio-disk backend (emualator) which is intended to run out of
>                               ^ emulator

ok)


-- 
Regards,

Oleksandr Tyshchenko



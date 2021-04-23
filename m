Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32505369478
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 16:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116412.222198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwZd-0002qD-Q5; Fri, 23 Apr 2021 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116412.222198; Fri, 23 Apr 2021 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwZd-0002po-Ms; Fri, 23 Apr 2021 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 116412;
 Fri, 23 Apr 2021 14:14:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YtAR=JU=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1lZwZc-0002pj-1t
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:14:24 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32cf899f-9ef6-4e36-a08b-a3df296ee9d6;
 Fri, 23 Apr 2021 14:14:20 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o5so22768918ljc.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Apr 2021 07:14:20 -0700 (PDT)
Received: from [192.168.1.76] (91-153-193-15.elisa-laajakaista.fi.
 [91.153.193.15])
 by smtp.gmail.com with ESMTPSA id t18sm583489lfe.20.2021.04.23.07.14.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 07:14:18 -0700 (PDT)
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
X-Inumbo-ID: 32cf899f-9ef6-4e36-a08b-a3df296ee9d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Rokc5goIx5MEohH/KTq/EAesJqBbmeNhipOj+YlK0B0=;
        b=PWmpVNZYVxSqKyeb6il1NDgak2knUiNUEwjFacbBS4wq37/T/yWs8nnGzt5PZ7kI2a
         3tO51V1xJHmmjo0ZwPtp++gCtrgK9Nz84l3KyVv05YYUk7pvLRf3dOXijnd/hQbzDe29
         0BHoEubXv4anYQItZBq10rx51LkWPQjRpqG4mibM8bvFq38AsgiLTnuGFibN13Wsf/62
         bQos9i5xp0aFzrdtAusaHEaIecoSFQs8jGcAgaF//wnkP8PiSYBAneZXIBW1kbl934eV
         KMnco1U4480y9GOffX/g84QGuU68SPOQ6Ybup+UkxWh3ZmrZwXhxFkspFaZktx1km+/Z
         GXWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Rokc5goIx5MEohH/KTq/EAesJqBbmeNhipOj+YlK0B0=;
        b=qJxli23P2ZM2Z9SsPM4pkhHN8E0PVLUgiWgNU1F/XOH7yD5kmqfpYGzc+KmRaxMykA
         ZTMpkiAI83Osiyt3yiLapHNmcQDi9wG9cA4x4wONeq8u+CfNBmutF632QtxDxVYpE7g7
         FjZ2qansiW03EmA3xp395sGVZH3s0hLg9AeAf1ID0LXJhoer/95ReEexlOcg9sWYghAF
         /7IYgRnZYstJnetD5o4mFSKNa7krHVJseCCtOrkfLaLL8eV6//07I7zG3qyJ/j7f0D3O
         NZ+C8+sH58njw9wa40+BGIC3CBiVWTh8564x+agQytEA+kQeoSeTtF7PJ71C+IGK8a9p
         Hcgg==
X-Gm-Message-State: AOAM532/UnG+m0KWGi0klF6CC4SrRci+QeObCzsiE6gM5PrCE6PTcI96
	H6e9HufXb8qIrqHyg8p6+z+j2gv6biYJWA==
X-Google-Smtp-Source: ABdhPJzT7iY1Z296X8gDn1mQ5DLFl37LZsLNiELxed+UVpMHXPg+UwIqAWUe+ObF8ca2QNXwvzFgjA==
X-Received: by 2002:a2e:b801:: with SMTP id u1mr2928214ljo.224.1619187259333;
        Fri, 23 Apr 2021 07:14:19 -0700 (PDT)
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Subject: Looking for arm based mobile platform that can run Xen
Message-ID: <0d5e878a-31d8-a491-edab-6d48f447fd7c@unikie.com>
Date: Fri, 23 Apr 2021 17:14:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

We are trying to find Raspberry like mobile HW that can run Xen with 
full features enabled like pass through devices and iommu support.

So far we have tried these:

These don't have iommu:
   * Raspberry Pi 4b

iommu doesn't cover whole io address space only some devices are behind 
iommu:
   *OrangePi 4b

Bad upstream kernel support:
   *Nvidia Xavier NX 
https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-xavier-nx/

Closed source bootloader that won't boot kernel into EL2:
   * DragonBoard 845c https://www.96boards.org/product/rb3-platform/
   * Snapdragon 845 mobile hdk 
https://www.lantronix.com/products/snapdragon-845-mobile-hdk/


Any ideas? :)

We could consider using some low end laptop.


-Jukka


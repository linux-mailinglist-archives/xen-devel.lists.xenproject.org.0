Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE2332B9F0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92973.175432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWN4-0007Kp-Ec; Wed, 03 Mar 2021 18:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92973.175432; Wed, 03 Mar 2021 18:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHWN4-0007KT-Al; Wed, 03 Mar 2021 18:37:18 +0000
Received: by outflank-mailman (input) for mailman id 92973;
 Wed, 03 Mar 2021 18:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlpN=IB=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lHWN2-0007KO-JD
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 18:37:16 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6d11f08a-3d45-4c1a-b83c-6ad184e78014;
 Wed, 03 Mar 2021 18:37:15 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-GSnoplegN86kfwvadSeyXQ-1; Wed, 03 Mar 2021 13:37:13 -0500
Received: by mail-wr1-f71.google.com with SMTP id z17so4967458wrv.23
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 10:37:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a21sm8546595wmb.5.2021.03.03.10.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:37:12 -0800 (PST)
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
X-Inumbo-ID: 6d11f08a-3d45-4c1a-b83c-6ad184e78014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614796635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RTSPxmhFtQEoaalhYZBAGdSBxMSx5X/iJhZ5W1nMsvk=;
	b=DlOYXuTAMxHN9LbZsKAgmcH7h17Po3Y8zqocMFiGShPTZNHGp5Yjd+n+8qIoXQDh35kw/W
	Q6GY5QhCiUEYbqcs49xHOB6r/EXyO3qDqqcN6jwgpsejlZTmgEqUjL/vx8ndv+qbCDo1Hu
	xccvPqy2Qrx1vgIG+w/7ZTJEW73fOs0=
X-MC-Unique: GSnoplegN86kfwvadSeyXQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RTSPxmhFtQEoaalhYZBAGdSBxMSx5X/iJhZ5W1nMsvk=;
        b=NQv1Rn+3o6LwEDsXa3XNu65Iy1ZIhVYa1iBEHxGBhbZkrPXAPtL/5Yc+47RjesOigU
         IW5koz16qqNPKVlvbA2EpIO2fhs1pdPcJSygPbBUKhfOcWUGrqr64JlTRSB7c2jhCdIA
         nbUvXxZRyz4Q6LaPMOUuCJl7NOjRaKaquYzTmmNKUYD/QUovvVnLnTJ+owE7ziYP4Zba
         Wiy48oKZ8T/E1I7b5yYnoQKF7dRIYwOAAwaaiA38HjTDT4BxwImQIUoq5nxpWp4+7jLP
         DeKCB1Py8xiCvi2JDt5OopFGnOC0j5EUUBIxRNr13XNnvtz+ajfKXvS+0lbJPQ8N2Vvx
         KIIQ==
X-Gm-Message-State: AOAM533uwiimCa8NEoqC6TIMXoajyce2YSvuNpFn0uVmUA87AUaokgQw
	L4Z/ycEQ+LbnPreOnoaoRiUUjMmly3qGzghba3DUPKHHZF0Tl3Eq4w71cuwRVml7DRXh9UAWS7d
	ELVDOcXbEn3UgtyzKV2+OKGhiTQ8=
X-Received: by 2002:a1c:804e:: with SMTP id b75mr289085wmd.113.1614796632705;
        Wed, 03 Mar 2021 10:37:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuj8vt04Hsk5gOEGXUt4RmQwBOp07gxAmhTiUTv03/ZKOEd8ZI2pDCU4/BxBnozQiG+4ON0Q==
X-Received: by 2002:a1c:804e:: with SMTP id b75mr289072wmd.113.1614796632571;
        Wed, 03 Mar 2021 10:37:12 -0800 (PST)
Subject: Re: [PATCH v3 4/7] hw/core: implement a guest-loader to support
 static hypervisor guests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
References: <20210303173642.3805-1-alex.bennee@linaro.org>
 <20210303173642.3805-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <224e4bad-6185-a457-ddb5-f04d5c16e2dc@redhat.com>
Date: Wed, 3 Mar 2021 19:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303173642.3805-5-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/3/21 6:36 PM, Alex Bennée wrote:
> Hypervisors, especially type-1 ones, need the firmware/bootcode to put
> their initial guest somewhere in memory and pass the information to it
> via platform data. The guest-loader is modelled after the generic
> loader for exactly this sort of purpose:
> 
>   $QEMU $ARGS  -kernel ~/xen.git/xen/xen \
>     -append "dom0_mem=1G,max:1G loglvl=all guest_loglvl=all" \
>     -device guest-loader,addr=0x42000000,kernel=Image,bootargs="root=/dev/sda2 ro console=hvc0 earlyprintk=xen" \
>     -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20201105175153.30489-5-alex.bennee@linaro.org>
> Message-Id: <20210211171945.18313-5-alex.bennee@linaro.org>
> ---
>  hw/core/guest-loader.h |  34 ++++++++++
>  hw/core/guest-loader.c | 145 +++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS            |   5 ++
>  hw/core/meson.build    |   2 +
>  4 files changed, 186 insertions(+)
>  create mode 100644 hw/core/guest-loader.h
>  create mode 100644 hw/core/guest-loader.c

Missing documentation, otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



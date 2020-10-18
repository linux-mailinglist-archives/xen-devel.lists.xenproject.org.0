Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C1E2917CF
	for <lists+xen-devel@lfdr.de>; Sun, 18 Oct 2020 16:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8527.22752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU9J0-0006aM-0W; Sun, 18 Oct 2020 14:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8527.22752; Sun, 18 Oct 2020 14:05:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kU9Iz-0006Zx-Tp; Sun, 18 Oct 2020 14:05:01 +0000
Received: by outflank-mailman (input) for mailman id 8527;
 Sun, 18 Oct 2020 14:05:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lyNC=DZ=redhat.com=trix@srs-us1.protection.inumbo.net>)
 id 1kU9Iy-0006ZE-3f
 for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 14:05:00 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5ec35790-cc60-4e6a-ac46-d97376614ff4;
 Sun, 18 Oct 2020 14:04:59 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-QBBG1ZpeOSuxXa8F5RZ81A-1; Sun, 18 Oct 2020 10:04:56 -0400
Received: by mail-qk1-f197.google.com with SMTP id q15so5461309qkq.23
 for <xen-devel@lists.xenproject.org>; Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id u16sm3288927qth.42.2020.10.18.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2020 07:04:55 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=lyNC=DZ=redhat.com=trix@srs-us1.protection.inumbo.net>)
	id 1kU9Iy-0006ZE-3f
	for xen-devel@lists.xenproject.org; Sun, 18 Oct 2020 14:05:00 +0000
X-Inumbo-ID: 5ec35790-cc60-4e6a-ac46-d97376614ff4
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 5ec35790-cc60-4e6a-ac46-d97376614ff4;
	Sun, 18 Oct 2020 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603029898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kBVMPnQfqrYuRmZ0mFLSkNqYWCaxPfshC6ZYuKW12NQ=;
	b=CE3TTm0ZWS3xUbYzjwLA7+TYTk7Dg+VxIL4Zp73oDsqTuzAXXNjBX0Doq5M5Cu6ffXkYev
	bZ3C9BpL47kMqRFuXYSmeuVfmCYD0R8cyybmNyMbwair6n3qDaCsRQ2KiiaxG8Fe9Zs8sm
	6xUrramWNvo4ZIP3aUKUh3vEKSsfIgI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-QBBG1ZpeOSuxXa8F5RZ81A-1; Sun, 18 Oct 2020 10:04:56 -0400
X-MC-Unique: QBBG1ZpeOSuxXa8F5RZ81A-1
Received: by mail-qk1-f197.google.com with SMTP id q15so5461309qkq.23
        for <xen-devel@lists.xenproject.org>; Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kBVMPnQfqrYuRmZ0mFLSkNqYWCaxPfshC6ZYuKW12NQ=;
        b=qI9fMTbIoZJtZhqkAiOhCiT9P2l7dw+TqXX0QyAQ+Bg80qofXCXyML8bEW95eQUQfz
         ck6Y7AMqw3AcEh8rkKQ79YorXwV7utsiYLELD+JcQkmGI78Kt8JvqMBSKLn6CHd4KWLJ
         P+o7v3MSrzFcElJcU9UpXio4VtC/KBibIvDyMdOiH1h7vBfmz2Mq82e0GMZrJa9QbG51
         Q7wuI22vuOSXvTkeJvlkgTohBWpVPLP8RzerhuRB79Qv/3H3ELFT/l7c00V5lVMOumC9
         ChXEifYMdcjxVPdP6gWsmcH3uDeOT7hcmtb/kLjL9mWTZh5WPsz4YEARI0y7A4Puw/Xj
         9wbA==
X-Gm-Message-State: AOAM532P0GeWshsd8nDhnjwCqCLwGMI89vJwBCoPqEc7xIZ8pfjyXXwU
	MttYx6ALa5aYDXtjFc4EpJlmNeF2OKfelb+NEnu2SYI9WdHu8w3bLRve6Wf0cplDiUpx6MEWGeE
	zPq59ZLMYn/54FoWjGOc1wc1FhnU=
X-Received: by 2002:a05:620a:1287:: with SMTP id w7mr12724307qki.436.1603029896365;
        Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6z5rS79nBj0nCbIqVRZ9qmkAzjArqewdITB0rtwnhi1UUe/kvxLZTENMJDRITA4iBlrUAlw==
X-Received: by 2002:a05:620a:1287:: with SMTP id w7mr12724258qki.436.1603029896034;
        Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id u16sm3288927qth.42.2020.10.18.07.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2020 07:04:55 -0700 (PDT)
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-power@fi.rohmeurope.com,
 linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-iio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, industrypack-devel@lists.sourceforge.net,
 linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-scsi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-nfc@lists.01.org, linux-nvdimm@lists.01.org,
 linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, patches@opensource.cirrus.com,
 storagedev@microchip.com, devel@driverdev.osuosl.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net, linux-watchdog@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, bpf@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, alsa-devel@alsa-project.org,
 clang-built-linux@googlegroups.com
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <eecb7c3e-88b2-ec2f-0235-280da51ae69c@redhat.com>
Date: Sun, 18 Oct 2020 07:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201018054332.GB593954@kroah.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10/17/20 10:43 PM, Greg KH wrote:
> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> This is a upcoming change to clean up a new warning treewide.
>> I am wondering if the change could be one mega patch (see below) or
>> normal patch per file about 100 patches or somewhere half way by collecting
>> early acks.
> Please break it up into one-patch-per-subsystem, like normal, and get it
> merged that way.

OK.

Thanks,

Tom

>
> Sending us a patch, without even a diffstat to review, isn't going to
> get you very far...
>
> thanks,
>
> greg k-h
>



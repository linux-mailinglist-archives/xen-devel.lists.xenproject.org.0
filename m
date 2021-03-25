Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B734974F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 17:50:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101467.194137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTBG-0007Ia-FJ; Thu, 25 Mar 2021 16:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101467.194137; Thu, 25 Mar 2021 16:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTBG-0007IA-Bc; Thu, 25 Mar 2021 16:49:58 +0000
Received: by outflank-mailman (input) for mailman id 101467;
 Thu, 25 Mar 2021 16:49:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q68K=IX=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1lPTBE-0007I3-Uw
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 16:49:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ea3f6308-ddc0-4085-8610-082c57bf18dd;
 Thu, 25 Mar 2021 16:49:55 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-fyl0xQUPOR66TmfKEtMqiw-1; Thu, 25 Mar 2021 12:49:53 -0400
Received: by mail-wr1-f69.google.com with SMTP id h30so2911178wrh.10
 for <xen-devel@lists.xenproject.org>; Thu, 25 Mar 2021 09:49:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r206sm1022782wma.46.2021.03.25.09.49.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 09:49:50 -0700 (PDT)
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
X-Inumbo-ID: ea3f6308-ddc0-4085-8610-082c57bf18dd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616690995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=121DS0LIlLDGdmTKGTNnln43LPt7mALX/sqO8XpkWkI=;
	b=FrEGrn4HtlZ6fqGRcCX25oARoJ1mcm81lw1+eXbZrn8fIuSr2lP9NTfGj0gqN21SGfMhw5
	PaAIuWTvIA7pJxUcjraz/qLuas4FhKFcJmGvjqo2PS0mXAg1KCrS5yklEJ/Kls5iM8KjYO
	ATAKX0Nco0JMSwZwgFweueBsJAwtS74=
X-MC-Unique: fyl0xQUPOR66TmfKEtMqiw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=121DS0LIlLDGdmTKGTNnln43LPt7mALX/sqO8XpkWkI=;
        b=rn2P99zbh+eFMmKBPgT2qhE3MMH/pKD7ag9alNnxzaBkw4sH20/Nd1js8OIlq4yWak
         XVSwGCaXTrtJKtJaAEotqxlfS0fLOyTCIHLeVFG4GMRHp+4SR+R8eAIpDiKJfxM+8U2b
         lH8HpdhW09yIDEkj/TzlvjtxOFJirUGmPMc2XD9yXdZtQ5q/88prP6tK7aKfQrwGYsVN
         kC12KGfrWzJhMEmfu9IuF9SitqH2qvUsCN3D8Y8C5AlilSbL8krdc/ltIZ9TDnBBMs+g
         QZED7Roubl/fVTbqajuzYKqo54eSbRXGNG2Zh903D/+cJ55zKreBo9Go/yveQCsFskjw
         iVJA==
X-Gm-Message-State: AOAM53142AkDpymHSC5BFVQ0WlcDDBMY1oysoe9A3m0e1PP2f3V054Ey
	gjFDwwrExJNHz7G3CE7NbIr9iOZKWNeSxlzvhYpUVIpvtgA9Md7O/w/J9ak0KYm5d2pjx00a5PO
	pPaVI9S8+HrYOMwba224SnUOviow=
X-Received: by 2002:a1c:c1:: with SMTP id 184mr1069004wma.143.1616690991824;
        Thu, 25 Mar 2021 09:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPWFxtRUx2xUzR+f2PBAv/JqVK7YygaZ0ZccnI4WrsK0a6PduqDEoDgfxInGEPSSeviU9e3Q==
X-Received: by 2002:a1c:c1:: with SMTP id 184mr1068978wma.143.1616690991577;
        Thu, 25 Mar 2021 09:49:51 -0700 (PDT)
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
To: Olaf Hering <olaf@aepfle.de>, John Snow <jsnow@redhat.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20210317070046.17860-1-olaf@aepfle.de>
 <4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
 <20210325121219.7b5daf76.olaf@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
Date: Thu, 25 Mar 2021 17:49:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210325121219.7b5daf76.olaf@aepfle.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/03/21 12:12, Olaf Hering wrote:
> Am Mon, 22 Mar 2021 18:09:17 -0400
> schrieb John Snow <jsnow@redhat.com>:
> 
>> My understanding is that XEN has some extra disks that it unplugs when
>> it later figures out it doesn't need them. How exactly this works is
>> something I've not looked into too closely.
> 
> It has no extra disks, why would it?
> 
> I assume each virtualization variant has some sort of unplug if it has to support guests that lack PV/virtio/enlightened/whatever drivers.

No, it's Xen only and really should be legacy.  Ideally one would just 
have devices supported at all levels from firmware to kernel.

>> So if these IDE devices have been "unplugged" already, we avoid
>> resetting them here. What about this reset causes the bug you describe
>> in the commit message?
>>
>> Does this reset now happen earlier/later as compared to what it did
>> prior to ee358e91 ?
> 
> Prior this commit, piix_ide_reset was only called when the entire
> emulated machine was reset. Like: never. With this commit,
> piix_ide_reset will be called from pci_piix3_xen_ide_unplug. For some
> reason it confuses the emulated USB hardware. Why it does confused
> it, no idea.

> I wonder what the purpose of the qdev_reset_all() call really is. It
> is 10 years old. It might be stale.

piix_ide_reset is only calling ide_bus_reset, and from there ide_reset 
and bmdma_reset.  All of these functions do just two things: reset 
internal registers and ensure pending I/O is completed or canceled.  The 
latter is indeed unnecessary; drain/flush/detach is already done before 
the call to qdev_reset_all.

But the fact that it breaks USB is weird.  That's the part that needs to 
be debugged, because changing IDE to unbreak USB needs an explanation 
even if it's the right thing to do.

If you don't want to debug it, removing the qdev_reset_all call might do 
the job; you'll have to see what the Xen maintainers think of it.  But 
if you don't debug the USB issue now, it will come back later almost surely.

Paolo



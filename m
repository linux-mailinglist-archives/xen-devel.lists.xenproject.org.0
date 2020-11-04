Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF22A634A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 12:28:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19033.44224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaGxP-0003OP-U7; Wed, 04 Nov 2020 11:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19033.44224; Wed, 04 Nov 2020 11:28:03 +0000
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
	id 1kaGxP-0003O0-Qb; Wed, 04 Nov 2020 11:28:03 +0000
Received: by outflank-mailman (input) for mailman id 19033;
 Wed, 04 Nov 2020 11:28:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpwB=EK=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kaGxN-0003Nv-Vb
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 11:28:02 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3bb1a8dd-decd-472a-bab8-d4a31cbf1952;
 Wed, 04 Nov 2020 11:28:01 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-OwZvbp3OPe-dJRQyj0cq6w-1; Wed, 04 Nov 2020 06:27:57 -0500
Received: by mail-wm1-f72.google.com with SMTP id o19so1099410wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 03:27:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l16sm2008678wrr.83.2020.11.04.03.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2020 03:27:54 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qpwB=EK=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kaGxN-0003Nv-Vb
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 11:28:02 +0000
X-Inumbo-ID: 3bb1a8dd-decd-472a-bab8-d4a31cbf1952
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 3bb1a8dd-decd-472a-bab8-d4a31cbf1952;
	Wed, 04 Nov 2020 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604489280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lalScLFIO8oj7wPwMGuu3i31sDP/fLpN35bkKRc5rK0=;
	b=iMDNXRIhKnES/Cfd9d0m4Gf5Yh/IYNW57Dxx3LV7thnHZC7todvRKL3G/L0ADngpIDVmhj
	jUugzBaRVYMRLtmqeyWAoCNJYcbSB4Kg6rRJ16bapAw5L1cTbdZhpnnWzovXc3XyM6AvK/
	VonYCzlMaNQe+nIBCzib+fRc9hf6jpc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-OwZvbp3OPe-dJRQyj0cq6w-1; Wed, 04 Nov 2020 06:27:57 -0500
X-MC-Unique: OwZvbp3OPe-dJRQyj0cq6w-1
Received: by mail-wm1-f72.google.com with SMTP id o19so1099410wme.2
        for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2020 03:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lalScLFIO8oj7wPwMGuu3i31sDP/fLpN35bkKRc5rK0=;
        b=YIlAPj6Q6z3GlLv2scIn0OO5lb/2CGAqc3qfDLItPBLk+FxRWnqeW8Wq+QghkQxrQ0
         iK1T44UNfpQuPOKTeoKd4b2O2VmtpcnPTfeqt2t7rlIxJA8IYVuTqggYf0nTn0aPV0s2
         nbXdJTf1X1X38RY2JirQ0nU9cYzK93i4+TgZ3GecPCWNPiaUQzhY7rLDNeagfYyyh6RZ
         Zw/33BXs2gRhg56N1ITD2zB/vXmHpJB6TDfzPN4fPP9MuQ1ukCXDd2xIDsY7Rrmsad1X
         dcuF0eDWITCJIceTllASXXVHwYn6O4M8ZVc4S5j+cbFLW7y5DcWLO7qzaroO3kAdweqd
         PVHQ==
X-Gm-Message-State: AOAM530ojDzPrFXgac21oGugCW0gVTHjgTAnAy+mCI8mQO8TCsoytIO2
	JIQwl4R9qiDmmCXYoD5rzjaCbm/dnnInDBl8RGRmyexMKdL42/IF7un+U3MnMGAVdyhPH+xjCnT
	NM0myPuNBxcb38fU/LM5t6TMenFY=
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr4058906wme.0.1604489275762;
        Wed, 04 Nov 2020 03:27:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwg15wfrgT+BshmOIwYfW74zEUfdWPrZdp2kXjj06rz+9QjqdURBX/mJbdLlVqTsjM/n0UQOg==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr4058876wme.0.1604489275593;
        Wed, 04 Nov 2020 03:27:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id l16sm2008678wrr.83.2020.11.04.03.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 03:27:54 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v2 2/4] hw/9pfs: Fix Kconfig dependency problem
 between 9pfs and Xen
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz
 <groug@kaod.org>, Fam Zheng <fam@euphon.net>,
 Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201104084327.3010593-1-philmd@redhat.com>
 <20201104084327.3010593-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7049dab1-5b94-6011-6501-609f32414edf@redhat.com>
Date: Wed, 4 Nov 2020 12:27:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201104084327.3010593-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04/11/20 09:43, Philippe Mathieu-Daudé wrote:
> Fixes './configure --without-default-devices --enable-xen' build:
> 
>    /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>    hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
>    /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference to `local_ops'
>    /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference to `synth_ops'
>    /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference to `proxy_ops'
>    collect2: error: ld returned 1 exit status
> 
> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> Suggested-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
> I'm not sure b2c00bce54c is the real culprit

I think it is, probably a wrong conflict resolution.

Paolo



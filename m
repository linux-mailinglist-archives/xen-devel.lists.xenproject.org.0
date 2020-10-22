Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A252961B0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 17:30:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10539.28016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVcXO-0007Kr-Ml; Thu, 22 Oct 2020 15:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10539.28016; Thu, 22 Oct 2020 15:29:58 +0000
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
	id 1kVcXO-0007KS-JE; Thu, 22 Oct 2020 15:29:58 +0000
Received: by outflank-mailman (input) for mailman id 10539;
 Thu, 22 Oct 2020 15:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IPEr=D5=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kVcXN-0007KM-Nj
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 15:29:57 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8f014c1e-fbef-437e-907e-68fe43588320;
 Thu, 22 Oct 2020 15:29:56 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-edzr7LrEMiKA4AuumLr6vQ-1; Thu, 22 Oct 2020 11:29:53 -0400
Received: by mail-wr1-f72.google.com with SMTP id f11so759361wro.15
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2020 08:29:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h7sm4766264wrt.45.2020.10.22.08.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Oct 2020 08:29:50 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IPEr=D5=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kVcXN-0007KM-Nj
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 15:29:57 +0000
X-Inumbo-ID: 8f014c1e-fbef-437e-907e-68fe43588320
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 8f014c1e-fbef-437e-907e-68fe43588320;
	Thu, 22 Oct 2020 15:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603380596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkiSTsiwDrNQ72v/SazVSSbk21cua5TJ5JZP+u5sNmw=;
	b=a/GsyZaZiSCMqT8jswn81KuhUYvtVyfDsEaerdErUo0jsdFHJUOZgei8468Hkni8SOjb5c
	hehLdXwkMxUzH8FWolEr+m+B/CqdAOIBnz7AwNGC1Cc6RzterqMYCE0vRvdQOnfSC9iZqw
	Ule4N0f+8r0Nn56Y0V/S8AmIplGSauM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-edzr7LrEMiKA4AuumLr6vQ-1; Thu, 22 Oct 2020 11:29:53 -0400
X-MC-Unique: edzr7LrEMiKA4AuumLr6vQ-1
Received: by mail-wr1-f72.google.com with SMTP id f11so759361wro.15
        for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2020 08:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jkiSTsiwDrNQ72v/SazVSSbk21cua5TJ5JZP+u5sNmw=;
        b=jnC8KbUxSAlkI4fdY16hrFmw9F4IGUL8S+KJcy+L+4Q00Q3LvDbZqxDsq7CNvV2/yJ
         mBqSQdgRGQ7qiv8rAo47eoaTVjEopkcv/Yfw/rZ7/Tyn4v6l5OuRJkDZUhXTtxFFxvtB
         zQ2oapbZ0QjnUPFXuCS4xrx418Clb2TcDQ+cC+dNQz3HuiLGHfuZaPsHIexSaPAPRgFI
         CvGNThrb7JflmSXQEmW+BitT2T0X9yhpeTkWvRNT7/hs+hmrHHmR+Sswtg6ODFkaR2Um
         tQyAZbBkt0mkMoq7zU66bYUlNg0/v816aNM9zQ6WIxhrB+Vgo2yF8+5/Oqr/oRtocGTz
         KI2Q==
X-Gm-Message-State: AOAM53286CQylzc50V33HmHyinTVPyFLQ6Q6Nb1cBN8z89bND8F5Bkdi
	DivhGnP30qjXcv91PBzl9Eg25uSAnVMcb/dTrQx3MjDH+xvPZYBsu/12SN6/gmjrO/UbeqQDD0V
	PDQCOdb1+DUEy/5y5VMKg7RdSRLE=
X-Received: by 2002:a1c:7ec7:: with SMTP id z190mr3064252wmc.8.1603380591398;
        Thu, 22 Oct 2020 08:29:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGX5JjI76ENng2y9LttGQf7DnpCKaOVKsBzUv2Ybaho8Ek92Wpmo5+190HqXDZuCF8ZiFmCQ==
X-Received: by 2002:a1c:7ec7:: with SMTP id z190mr3064228wmc.8.1603380591192;
        Thu, 22 Oct 2020 08:29:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id h7sm4766264wrt.45.2020.10.22.08.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2020 08:29:50 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Add Xen CpusAccel
To: Jason Andryuk <jandryuk@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20201013140511.5681-1-jandryuk@gmail.com>
 <ddb5c9c2-c206-28d6-2d9d-7954e7022c23@redhat.com>
 <CAKf6xpvpuG1jVdf3+heXzHFd_kc5kVHYdJgC+8iazFLciqOMZw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d9f23eee-c0af-d2dd-9b9d-f0255fc8e3d1@redhat.com>
Date: Thu, 22 Oct 2020 17:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvpuG1jVdf3+heXzHFd_kc5kVHYdJgC+8iazFLciqOMZw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/10/20 17:17, Jason Andryuk wrote:
> On Tue, Oct 13, 2020 at 1:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> On 13/10/20 16:05, Jason Andryuk wrote:
>>> Xen was left behind when CpusAccel became mandatory and fails the assert
>>> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
>>> Move the qtest cpu functions to a common location and reuse them for
>>> Xen.
>>>
>>> v2:
>>>   New patch "accel: Remove _WIN32 ifdef from qtest-cpus.c"
>>>   Use accel/dummy-cpus.c for filename
>>>   Put prototype in include/sysemu/cpus.h
>>>
>>> Jason Andryuk (3):
>>>   accel: Remove _WIN32 ifdef from qtest-cpus.c
>>>   accel: move qtest CpusAccel functions to a common location
>>>   accel: Add xen CpusAccel using dummy-cpus
>>>
>>>  accel/{qtest/qtest-cpus.c => dummy-cpus.c} | 27 ++++------------------
>>>  accel/meson.build                          |  8 +++++++
>>>  accel/qtest/meson.build                    |  1 -
>>>  accel/qtest/qtest-cpus.h                   | 17 --------------
>>>  accel/qtest/qtest.c                        |  5 +++-
>>>  accel/xen/xen-all.c                        |  8 +++++++
>>>  include/sysemu/cpus.h                      |  3 +++
>>>  7 files changed, 27 insertions(+), 42 deletions(-)
>>>  rename accel/{qtest/qtest-cpus.c => dummy-cpus.c} (71%)
>>>  delete mode 100644 accel/qtest/qtest-cpus.h
>>>
>>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Thank you, Paolo.  Also Anthony Acked and Claudio Reviewed patch 3.
> How can we get this into the tree?

I think Anthony should send a pull request?

Paolo



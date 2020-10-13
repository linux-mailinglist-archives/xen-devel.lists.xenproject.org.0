Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F91128CA6A
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 10:44:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6124.16107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSFtY-0001IE-Kb; Tue, 13 Oct 2020 08:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6124.16107; Tue, 13 Oct 2020 08:42:56 +0000
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
	id 1kSFtY-0001Hs-HD; Tue, 13 Oct 2020 08:42:56 +0000
Received: by outflank-mailman (input) for mailman id 6124;
 Tue, 13 Oct 2020 08:42:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tg1d=DU=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kSFtW-0001Hn-RZ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 08:42:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cf8e8f24-b858-40c9-abbd-75f59b91bbf2;
 Tue, 13 Oct 2020 08:42:52 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-MHf93RUlP2CyGjzfHWgdpg-1; Tue, 13 Oct 2020 04:42:50 -0400
Received: by mail-wr1-f69.google.com with SMTP id 33so10470196wrf.22
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 01:42:49 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id z5sm27778002wrw.37.2020.10.13.01.42.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 01:42:47 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=tg1d=DU=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kSFtW-0001Hn-RZ
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 08:42:54 +0000
X-Inumbo-ID: cf8e8f24-b858-40c9-abbd-75f59b91bbf2
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id cf8e8f24-b858-40c9-abbd-75f59b91bbf2;
	Tue, 13 Oct 2020 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602578571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cy5Umm45LAZG5+p/FZuyIVT+mHFYq4zbXyNxj1/WCmk=;
	b=fp4g32Ixj2O4GT/qQpNEXCwagHrT+cUG+1XoU9x1HbuIrOnDZOpBB/HDK99G5d10fsGFli
	gTJzleIheaQPk0MfRHglVuoivnfDmHrFDOv6Bh9Jsy3dyyQzqsrDKvrGXDW1rhQd2w9wAX
	IG4q0Hb73JTtnZwtddJnla9fFBpNPg0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-MHf93RUlP2CyGjzfHWgdpg-1; Tue, 13 Oct 2020 04:42:50 -0400
X-MC-Unique: MHf93RUlP2CyGjzfHWgdpg-1
Received: by mail-wr1-f69.google.com with SMTP id 33so10470196wrf.22
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 01:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Cy5Umm45LAZG5+p/FZuyIVT+mHFYq4zbXyNxj1/WCmk=;
        b=mqyCVIRDbgn79hI12QobYH6QFszCIX93RXkpE4PnVXybVk4moKFp6M872LiLp1GgYh
         2Gl8NkVgGZzLJjNU+VtN9xBvehlDY/cesEVaO0gOZsERmwoFjmpSOCrfTjQVorI2ia0F
         wQ5t6ZHhC+nFI2GOWpU81RqsIOcq06t43mIiIh1wO9Oik+Ssa6XZDyjN3g3xK2/Xgtbl
         tfb57CyqAW2uOb0Bf1pkI6J3LaN5HxrEqNZQXyLqd8xKwfQzbyFY3lg5XOpGr0vEVjZ5
         tKLP2mNq1RK+2Nk/gr+AvWAqfvdVYCgjMwINS2XXM9qpcOPJxrdftYIwYMBcx6iP0UTO
         JiOQ==
X-Gm-Message-State: AOAM532ZNcF5H7O0aBhhm5qPxsF5E2MWhOvr0tYKkgC+eWYwoTR5kpd5
	cGqaePd1ErFM+W+g6MUVYJrMP1bRh+7PZIwRnC3br3ZtIss/BgJOHBGIqpiAdpWHoosdAUNPEnt
	dlGlohLu+RNZc5fw6pZLpi8a7EMo=
X-Received: by 2002:a1c:2e53:: with SMTP id u80mr14675087wmu.58.1602578568526;
        Tue, 13 Oct 2020 01:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQnxR/4TvkPrJhZ7T2WGOGG1UFL0hib7NXqP0OoMMU4JVYdxRNJTLW0wHk657n/DIXrbAuCQ==
X-Received: by 2002:a1c:2e53:: with SMTP id u80mr14675071wmu.58.1602578568373;
        Tue, 13 Oct 2020 01:42:48 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
        by smtp.gmail.com with ESMTPSA id z5sm27778002wrw.37.2020.10.13.01.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 01:42:47 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add Xen CpusAccel
To: Claudio Fontana <cfontana@suse.de>, Jason Andryuk <jandryuk@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20201012200725.64137-1-jandryuk@gmail.com>
 <c2b2ed9a-879c-f676-86f0-22b3a77b770f@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a88a1570-ccbd-987c-17db-53e8643c1ea8@redhat.com>
Date: Tue, 13 Oct 2020 10:42:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <c2b2ed9a-879c-f676-86f0-22b3a77b770f@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/20 10:16 PM, Claudio Fontana wrote:
> On 10/12/20 10:07 PM, Jason Andryuk wrote:
>> Xen was left behind when CpusAccel became mandatory and fails the assert
>> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
>> Move the qtest cpu functions to a common location and reuse them for
>> Xen.
>>
>> Jason Andryuk (2):
>>    accel: move qtest CpusAccel functions to a common location
>>    accel: Add xen CpusAccel using dummy-cpu
>>
>>   .../qtest-cpus.c => dummy/dummy-cpus.c}       | 22 +++++--------------
>>   .../qtest-cpus.h => dummy/dummy-cpus.h}       | 10 ++++-----
>>   accel/dummy/meson.build                       |  7 ++++++
>>   accel/meson.build                             |  1 +
>>   accel/qtest/meson.build                       |  1 -
>>   accel/qtest/qtest.c                           |  7 +++++-
>>   accel/xen/xen-all.c                           | 10 +++++++++
>>   7 files changed, 34 insertions(+), 24 deletions(-)
>>   rename accel/{qtest/qtest-cpus.c => dummy/dummy-cpus.c} (76%)
>>   rename accel/{qtest/qtest-cpus.h => dummy/dummy-cpus.h} (59%)
>>   create mode 100644 accel/dummy/meson.build
>>
> 
> Yep, forgot completely, sorry.

Good opportunity to ask the Xen folks to add testing
to our Gitlab CI, so this doesn't happen again :)

> 
> Acked-by: Claudio Fontana <cfontana@suse.de>
> 
> 
> 



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624552A4C3F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 18:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18518.43533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZzjO-0006VT-MY; Tue, 03 Nov 2020 17:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18518.43533; Tue, 03 Nov 2020 17:04:26 +0000
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
	id 1kZzjO-0006V7-JG; Tue, 03 Nov 2020 17:04:26 +0000
Received: by outflank-mailman (input) for mailman id 18518;
 Tue, 03 Nov 2020 17:04:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNo=EJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kZzjM-0006V2-1x
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 17:04:24 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 62d2760d-b54b-470f-9e5d-eab919dffeb5;
 Tue, 03 Nov 2020 17:04:20 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-JVSjkzvKPBKUBYVXFfw1gA-1; Tue, 03 Nov 2020 12:04:16 -0500
Received: by mail-wm1-f71.google.com with SMTP id o81so14840wma.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 09:04:16 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g138sm3525743wme.39.2020.11.03.09.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 09:04:14 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3DNo=EJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1kZzjM-0006V2-1x
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 17:04:24 +0000
X-Inumbo-ID: 62d2760d-b54b-470f-9e5d-eab919dffeb5
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 62d2760d-b54b-470f-9e5d-eab919dffeb5;
	Tue, 03 Nov 2020 17:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604423060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=poiJCMzoY3IBe38HXDFYbr82EESqtWVxhmZ6b0tqQv8=;
	b=Tae/yZW+70bCwbh6QK4AMqyfLhtH4atWGEiRKtq0iztWiZLEqQ0gOL0UXfKyWMpINXKzkf
	OLZUYyp7/rEaQvq8eR7bw5TRb9dVLQaxbn4V6R9F9Q6FO0M7o6P0wQTKFszFw87IbLtreb
	uZub9iEudGBvIsrWOiJAP+R9yv3kZWQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-JVSjkzvKPBKUBYVXFfw1gA-1; Tue, 03 Nov 2020 12:04:16 -0500
X-MC-Unique: JVSjkzvKPBKUBYVXFfw1gA-1
Received: by mail-wm1-f71.google.com with SMTP id o81so14840wma.0
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 09:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=poiJCMzoY3IBe38HXDFYbr82EESqtWVxhmZ6b0tqQv8=;
        b=kRSairPOlXUFxBcA+Y/M6bRxpf3XUsVhW2hvs+LbXwHeGC/7e6eCqEhiDDNsjmPsM6
         YPEpYYbSOxE9VNotndpwXr2lsKnVTyxpJ6OmpGSFqdLsfOu4DbzywDaDk03PF1aVVSIP
         BHHLns37mNETPdQsu8dASlDIbzr6xQJkQBO4kGk2lzbKKgoVxM1veGgfVzPkMEY7io4N
         3dWJ0qzE6GSNx3GfPEWibkZrFX8RkWos0wfMmVvUNmwS1lCJ9QtJaIV9cRWSxLs0Doea
         Y1CZq8r533SLlTMkZI5k4AIYVL5qoOpwtHu2fcNYfN3eM2/rZ1Dov3MXtN5TItDXNwpG
         2yGQ==
X-Gm-Message-State: AOAM532FJDh4ElKLl3dQfjYqXwr9IJW3cBuFSTeQTWFOh9BfkXxqnFT0
	cMMrAv1Mf9nt+63kvWQjgU9ceQCec7eZt9tDINioSVDoGEF2y9xCdx0B4aHAhIBj4NPvAv3ErDW
	e3ZRmbIxhvQG29DVxXlUthvJG2hI=
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr120529wmg.90.1604423055393;
        Tue, 03 Nov 2020 09:04:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhPavdeXAqmN31QepPdH3WgYyEYFt3nbQh+rILVUD6T4tn1A3Anyoz0UcURl1J401WTJCQrA==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr120500wmg.90.1604423055231;
        Tue, 03 Nov 2020 09:04:15 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id g138sm3525743wme.39.2020.11.03.09.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 09:04:14 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/3] gitlab-ci: Add a job to cover the
 --without-default-devices config
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Greg Kurz <groug@kaod.org>, Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Richard Henderson <rth@twiddle.net>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20201103164604.2692357-1-philmd@redhat.com>
 <20201103164604.2692357-3-philmd@redhat.com>
 <20201103165247.GT205187@redhat.com>
 <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com>
Message-ID: <21e90ddb-fe8a-c780-2741-9b7a2f7f1c9a@redhat.com>
Date: Tue, 3 Nov 2020 18:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <7654e063-98d3-84e0-8116-5a1b41d14636@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I forgot to Cc the 9pfs & Xen maintainers, doing it now ;)

On 11/3/20 6:01 PM, Philippe Mathieu-Daudé wrote:
> On 11/3/20 5:52 PM, Daniel P. Berrangé wrote:
>> On Tue, Nov 03, 2020 at 05:46:03PM +0100, Philippe Mathieu-Daudé wrote:
>>> We test './configure --without-default-devices' since commit
>>> 20885b5b169 (".travis.yml: test that no-default-device builds
>>> do not regress") in Travis-CI.
>>>
>>> As we prefer to use GitLab-CI, add the equivalent job there.
>>>
>>> One minor difference: the GitLab Ubuntu docker image has the
>>> Xen devel packages installed. As it is automatically selected,
>>> we need to disable it with the --disable-xen option, else the
>>> build fails:
>>>
>>>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function `xen_be_register_common':
>>>   hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
>>>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined reference to `local_ops'
>>>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined reference to `synth_ops'
>>>   /usr/bin/ld: libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined reference to `proxy_ops'
>>>   collect2: error: ld returned 1 exit status
>>
>> Surely this is a build bug we need to fix rather than ignore in CI ?
> 
> Well it predates this series, so nobody really cared
> (thus I wonder if it makes sense to invest resources
> there).
> 
> Anyway I can have a look after 5.2-rc1.
> 



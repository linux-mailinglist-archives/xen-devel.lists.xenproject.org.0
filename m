Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B22D1111
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 13:54:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46491.82501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmG1b-0001af-NP; Mon, 07 Dec 2020 12:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46491.82501; Mon, 07 Dec 2020 12:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmG1b-0001aG-Jb; Mon, 07 Dec 2020 12:53:55 +0000
Received: by outflank-mailman (input) for mailman id 46491;
 Mon, 07 Dec 2020 12:53:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmG1a-0001aB-Fa
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 12:53:54 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b42b3295-87c7-498b-9236-07f88b8b9867;
 Mon, 07 Dec 2020 12:53:53 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-8Ov9-2QBPW6suenxyv9owQ-1; Mon, 07 Dec 2020 07:53:52 -0500
Received: by mail-wr1-f70.google.com with SMTP id r11so2891016wrs.23
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 04:53:51 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id h15sm15059392wrw.15.2020.12.07.04.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 04:53:50 -0800 (PST)
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
X-Inumbo-ID: b42b3295-87c7-498b-9236-07f88b8b9867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607345633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jQXhZcYJDxQ+pyrZJ9955D0Y/b7j+Ci1hyg9wiMJqU=;
	b=B5mNN6ssD+k8xdQceVG3A/oXt1xDCPvwExE0Jo6i1pil8ftFR8M/oq/lmJWRyRInCsV7L7
	ICPVXXqSqRbPvi8nbyB5seKrq0wXUGWiU+8xSsm+DMHdHK/IQcv9zI7wHqivS1wnK00oKX
	lyacLPihPVns0fG0bueqa6bE5hqWXow=
X-MC-Unique: 8Ov9-2QBPW6suenxyv9owQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8jQXhZcYJDxQ+pyrZJ9955D0Y/b7j+Ci1hyg9wiMJqU=;
        b=NU9MxdvQB3wZXGCFUxRb818d2kKO3/oAKvMXLYBCq3YWWn2HGpEo62yghSxnVhOUkt
         M9Tg9ngTlMOHBwoclVnTsTOjLAwaiqiYXDhefnw50GcGp/zUukxd72rLyO4ZTNVCqSHG
         FYDkTOUnegjsp/rkcVcdo36y/ZDJCODsdyW99aQ7Ivl3iku5IsjnR/tr4YpYg3gWQVvm
         0B52tAum8xPWge2b9E1ziBx7EGgOSD5Lx9Z+5d74q9rJTmYWHJyI2Zy8eBk3inOqlsSf
         amrcyqSVbLRlHyklBzOzS/Iij+AyYTL50e/ECiOw6+lgYBU5dH17lV9zBtnKY4BT3+zw
         ndQQ==
X-Gm-Message-State: AOAM533vt8AqhjGuC9ubw5egJ9WaRnhlfaPSrQ3b11ZX6S1i4y8PZSca
	6gwOIfL+rbJ6QIXZay+5mUDwozFsZCd5y5/rHZTiP8zJINRGQBGH0gva5frgk9fp9XXutCjbYr9
	602ogVmibi4oFTk2ATMXMVwPKx/Q=
X-Received: by 2002:adf:e547:: with SMTP id z7mr16664444wrm.283.1607345630922;
        Mon, 07 Dec 2020 04:53:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwL3U84FFw+0qFmC+nPsQaUjHyjhjpgeVy6OSntbXqxnSM9myKiFBtd0teG8BcdiMc8S14tKw==
X-Received: by 2002:adf:e547:: with SMTP id z7mr16664424wrm.283.1607345630765;
        Mon, 07 Dec 2020 04:53:50 -0800 (PST)
Subject: Re: [PATCH v2 3/5] gitlab-ci: Introduce 'cross_accel_build_job'
 template
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Willian Rampazzo <wrampazz@redhat.com>, qemu-s390x@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-4-philmd@redhat.com>
 <93d186c0-feea-8e47-2a03-5276fb898bff@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39d13e9c-1fb4-2fa9-6cf4-01086ad920aa@redhat.com>
Date: Mon, 7 Dec 2020 13:53:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <93d186c0-feea-8e47-2a03-5276fb898bff@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 12:37 PM, Thomas Huth wrote:
> On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
>> Introduce a job template to cross-build accelerator specific
>> jobs (enable a specific accelerator, disabling the others).
>>
>> The specific accelerator is selected by the $ACCEL environment
>> variable (default to KVM).
>>
>> Extra options such disabling other accelerators are passed
>> via the $ACCEL_CONFIGURE_OPTS environment variable.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 099949aaef3..d8685ade376 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -13,6 +13,23 @@
>>            xtensa-softmmu"
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
>> +# Job to cross-build specific accelerators.
>> +#
>> +# Set the $ACCEL variable to select the specific accelerator (default to
>> +# KVM), and set extra options (such disabling other accelerators) via the
>> +# $ACCEL_CONFIGURE_OPTS variable.
>> +.cross_accel_build_job:
>> +  stage: build
>> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>> +  timeout: 30m
>> +  script:
>> +    - mkdir build
>> +    - cd build
>> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
>> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
>> +    - make -j$(expr $(nproc) + 1) all check-build
>> +
>>  .cross_user_build_job:
>>    stage: build
>>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> 
> I wonder whether we could also simply use the .cross_user_build_job - e.g.
> by adding a $EXTRA_CONFIGURE_OPTS variable in the "../configure ..." line so
> that the accel-jobs could use that for their --enable... and --disable...
> settings?

Well cross_user_build_job build tools (I'm not sure that desired).

> Anyway, I've got no strong opinion on that one, and I'm also fine if we add
> this new template, so:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks, we can improve on top.



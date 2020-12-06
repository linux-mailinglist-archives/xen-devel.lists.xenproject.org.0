Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D72D0829
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 00:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45837.81323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km3i0-0007yX-U9; Sun, 06 Dec 2020 23:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45837.81323; Sun, 06 Dec 2020 23:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1km3i0-0007yA-Qx; Sun, 06 Dec 2020 23:44:52 +0000
Received: by outflank-mailman (input) for mailman id 45837;
 Sun, 06 Dec 2020 23:44:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PoKi=FK=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1km3hz-0007y5-2f
 for xen-devel@lists.xenproject.org; Sun, 06 Dec 2020 23:44:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 86efd9e6-d144-4e40-bad3-9d421923a4f6;
 Sun, 06 Dec 2020 23:44:50 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-Y6oypYtdN92pw7l9SYZWag-1; Sun, 06 Dec 2020 18:44:43 -0500
Received: by mail-wm1-f72.google.com with SMTP id a205so3439281wme.9
 for <xen-devel@lists.xenproject.org>; Sun, 06 Dec 2020 15:44:43 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c9sm12697020wrp.73.2020.12.06.15.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Dec 2020 15:44:41 -0800 (PST)
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
X-Inumbo-ID: 86efd9e6-d144-4e40-bad3-9d421923a4f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607298289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
	b=Z5MFfdttJmL+jS/jrQNGh3AIV+Nz4WGQqI5HZXxkK1h8Rw5wzhW2ehZFbGOoOKghuIE3Vp
	Pf3x1QUwP/ZKUR0LtttTIB9ESxVHTTyiSgBzu484xjQca2RK0bONnukhxroL9W+1Rl20s0
	wun9XtedSnPh8pyMCAXQOk6jhOgiBkg=
X-MC-Unique: Y6oypYtdN92pw7l9SYZWag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EVBInixgmn136ovV1rZRYaD9AJ24IiI0pMFI4QniZVU=;
        b=LnIfSl4+wqQdE35KKogUEgXmxflOdP5PFggE7wo9Tb04HtRpLq5dbmryl8oMtZcqmx
         ZxVyZprWKABI77smFfKDfKGEPTNWaYZvpMCJexRp+DgLN3an5l+fFlEnE9MMStdyfuAf
         TFRxmmyWhdJF/qUctBuZbiMJhPu+sqx0Ez1Gf4FFXdqX22vOCUg2nQHP1WT8PcqfTyai
         NoALKGSgEUnoZgSQAsb4WWHzm6M8+MUlQQsKVmHxSztSzQ8oiT3Rf7ukmnW+V/w3YnxC
         Xdgc0FE0osm95v/cvnJbPu3pgTXeusEZQVh0K2mBpv2LtYujAp06ZwfGKxoP0e8ozjUk
         gdMw==
X-Gm-Message-State: AOAM5312AlcZO77VNxpJjvwHG/8tB00eXoJQ5KnXqIyWW/ioBLLe2XvA
	zkNl8f9ZX59XFniOvbXb2PwJp5ej3mAuFqYxr+BLbPFD2J5z/S3oXcAN95zPPunZOnUPm2lgqQY
	AWDyw6rOwmIXHE8D101e3stW1yLU=
X-Received: by 2002:a7b:c303:: with SMTP id k3mr15698491wmj.21.1607298282180;
        Sun, 06 Dec 2020 15:44:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9Ly/Z3VYUD9ldB9eMDBoFXsydwmOnqU35i1cTdXNWpuYJCJR1JajcbqGx6vrhzpycS4B9gw==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr15698481wmj.21.1607298282031;
        Sun, 06 Dec 2020 15:44:42 -0800 (PST)
Subject: Re: [PATCH 2/8] gitlab-ci: Introduce 'cross_accel_build_job' template
To: Claudio Fontana <cfontana@suse.de>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-3-philmd@redhat.com>
 <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c3b42add-6586-8723-ab81-4fdd660277fc@redhat.com>
Date: Mon, 7 Dec 2020 00:44:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1691b11e-dd40-8a15-6a34-d5e817f95027@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/6/20 8:23 PM, Claudio Fontana wrote:
> On 12/6/20 7:55 PM, Philippe Mathieu-Daudé wrote:
>> Introduce a job template to cross-build accelerator specific
>> jobs (enable a specific accelerator, disabling the others).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 099949aaef3..be63b209c5b 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -13,6 +13,18 @@
>>            xtensa-softmmu"
>>      - make -j$(expr $(nproc) + 1) all check-build
>>  
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
>>
> 
> Hi Philippe,
> 
> probably I just don't understand how this works, but
> where is the "disabling the others" part?

Sorry I forgot to document $ACCEL_CONFIGURE_OPTS, which
can be used to amend options. See x86 and s390x jobs
(the only one buildable without TCG afaik) use:

    ACCEL_CONFIGURE_OPTS: --disable-tcg

> 
> I see the --enable-${ACCEL:-kvm}, but I would expect some --disable-XXX ?
> 
> I am probably just missing something..

The goal of this series is not to test --disable-tcg, but
to test --enable-kvm when you don't have access to a host
arch. I see testing --disable-tcg as a bonus :)

> 
> Thanks,
> 
> Ciao,
> 
> Claudio
> 



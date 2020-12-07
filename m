Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8207B2D0DA3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46060.81705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDJX-0002k3-4u; Mon, 07 Dec 2020 10:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46060.81705; Mon, 07 Dec 2020 10:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDJX-0002jd-1D; Mon, 07 Dec 2020 10:00:15 +0000
Received: by outflank-mailman (input) for mailman id 46060;
 Mon, 07 Dec 2020 10:00:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmDJV-0002jW-Jg
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:00:13 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1b609c12-ef8c-417f-beaa-db91f0bbba59;
 Mon, 07 Dec 2020 10:00:12 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-v7qOpCU5MDqtg0zvfGEfJg-1; Mon, 07 Dec 2020 05:00:09 -0500
Received: by mail-wm1-f70.google.com with SMTP id k126so2196839wmb.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 02:00:09 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c1sm13112995wml.8.2020.12.07.02.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:00:06 -0800 (PST)
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
X-Inumbo-ID: 1b609c12-ef8c-417f-beaa-db91f0bbba59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607335212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkvd7LrgfbA/3UaWz+BLuo3xobAs3RImgpzqIL+38Gs=;
	b=QfJL7SrLO/7J5nZCqRP99ADVzZgu9TrDtsm2xGg0/N/fDS4ZCMTZO3bcceBzx9R9tY32lE
	uMRSeGXM4ToCfnx8EMiLG0iMBqE94IRNy2X+oLzvhAPGfrjfcjreZY7+PuUr16R6yI3EB/
	7wonqoTO6kYgQdCW5DvBE7BeULRYVn8=
X-MC-Unique: v7qOpCU5MDqtg0zvfGEfJg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jkvd7LrgfbA/3UaWz+BLuo3xobAs3RImgpzqIL+38Gs=;
        b=K7NscqqPplt+vPr1JHRdKWcgobFr0V+oA0mYYXUe/aWrRNNBdNtXJlIO6wFyMmMKQr
         /F21lwq+I55hFuLk2fvYZNrFCCAcKURtZ42nQNK9E5Nv6ZVIED5YI6nl8gp3k3yfrEmU
         Qpkp90gRLHnToqzDuDAkvAaCMZ3Bh3Ea6Y7mREL4xkXu/AuGEHtasO3cpV/0oSU1m7fb
         eAzX3u8Mgd5Qew/pxlJD/bFi3XPF4WJZzwsNLx/v/vbClMQm8F3jHmbMwaGuILarJcsT
         RFt//9PqMvn1rVbwiEr6QlYKQ+FIbUkYJgzj4LPBqHGEIKW1WKXqEiJ20v5LX5Cse+MV
         ejTA==
X-Gm-Message-State: AOAM532GvGdt2BklQEu3kuRzAWxOTY2bbUAFtXW+HApDyvLh7eEMoRoU
	aN4FNJpLT3D5TLAuOkgDvaKJtj9TbxmapxQjiwGXFrur2j5N0peI4PWtEutvhEElQhFEFFjqnbT
	HXwgu3PA4L8zDf1scUW/xbqtYg+4=
X-Received: by 2002:a1c:6208:: with SMTP id w8mr17496910wmb.96.1607335207833;
        Mon, 07 Dec 2020 02:00:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3EYRHSI+t9NVpsM0Mrbn468kurkRbJwfsRKh9URZe4lUy/zhC9c0UawCuc4XOtBW1JeEjjA==
X-Received: by 2002:a1c:6208:: with SMTP id w8mr17496881wmb.96.1607335207639;
        Mon, 07 Dec 2020 02:00:07 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Willian Rampazzo
 <wrampazz@redhat.com>, Paul Durrant <paul@xen.org>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
Date: Mon, 7 Dec 2020 11:00:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 6:46 AM, Thomas Huth wrote:
> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>> Cross-build s390x target with only KVM accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>  .gitlab-ci.yml                         | 1 +
>>  MAINTAINERS                            | 1 +
>>  3 files changed, 8 insertions(+)
>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>
>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>> new file mode 100644
>> index 00000000000..1731af62056
>> --- /dev/null
>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>> @@ -0,0 +1,6 @@
>> +cross-s390x-kvm:
>> +  extends: .cross_accel_build_job
>> +  variables:
>> +    IMAGE: debian-s390x-cross
>> +    TARGETS: s390x-softmmu
>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 573afceb3c7..a69619d7319 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -14,6 +14,7 @@ include:
>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
> 
> KVM code is already covered by the "cross-s390x-system" job, but an
> additional compilation test with --disable-tcg makes sense here. I'd then
> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".

As you wish. What I want is to let Gitlab users be able to build the
equivalent "[s390x] Clang (disable-tcg)" from Travis.

I keep using GCC toolchain because managing job coverage duplication
is an unresolved problem.

> 
> And while you're at it, I'd maybe rather name the new file just
> crossbuilds-s390x.yml and also move the other s390x related jobs into it?

OK will do.

Thanks,

Phil.



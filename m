Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E692D0E1F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46171.81928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDtK-0007m2-2n; Mon, 07 Dec 2020 10:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46171.81928; Mon, 07 Dec 2020 10:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDtJ-0007lU-Ux; Mon, 07 Dec 2020 10:37:13 +0000
Received: by outflank-mailman (input) for mailman id 46171;
 Mon, 07 Dec 2020 10:37:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmDtH-0007iK-NC
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:37:11 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bda01068-3406-4d79-b940-019ae6d30fe1;
 Mon, 07 Dec 2020 10:37:10 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-khtG2to-OEi-9ORw3u8h7w-1; Mon, 07 Dec 2020 05:37:08 -0500
Received: by mail-wm1-f72.google.com with SMTP id k126so2231392wmb.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 02:37:08 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id z140sm14292218wmc.30.2020.12.07.02.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:37:05 -0800 (PST)
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
X-Inumbo-ID: bda01068-3406-4d79-b940-019ae6d30fe1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607337430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MUpNM1ZaTlO4T3gwbQyUi+bhaJnWEMg2E4uaX6U69A=;
	b=MCLjHeHGavNg07I8a8SyRx0C8gPQX8fZmiDsXuF3OYMUILrOiG2kH4m5tkJX5OfhCsuEJE
	oo9ZcvDwz+0jYqQocdCUbIlDBJWVpha3IQgRfluVM/gWXIxqoH24meDqzSBSaQbwbjyAym
	1TvAZfKdSVIJvIVf/mYiOml8o9tKpBk=
X-MC-Unique: khtG2to-OEi-9ORw3u8h7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+MUpNM1ZaTlO4T3gwbQyUi+bhaJnWEMg2E4uaX6U69A=;
        b=bkYJ3vSt/KVmXD4Mi9KhcfoMCwJsaMsg8GzzC+T1Q7di97KCXUzatpER60JLJQqvC8
         4Rz+sqKyepDn3n4SptkLg6oYk9camsoSoDNa15cgxb0CyTGmXrNaGlrLA6YMW/IlpTwv
         h5f2ZgSqhp4RdmSRTVv0R01Ho78eoYKe+C6hbxO+TwaZSuSS7xpmqOWQW0GHGJ6PRF74
         W7DCRmfqxontmYhIvErLZSnKdHoBJxB6jAUi3PX7sFw7tgGNmCMPz989PKofHyoUSLGj
         As/B23X9y3yPIO824z9e6icoWfAwB1bmJW1FVd8J3MwRNaZxOu8KisVs9tJ/g/biandF
         QTww==
X-Gm-Message-State: AOAM5322J+NhiMu6IqijXB4TQdx0D7TkvkFEqqDL7zCaz3wH4hvkR9gC
	3gy9SYU2s+v2yb93NPGtK6poJqjDhRUhz3AKbgtRwnMMl6ZzmGjO4tRZBY6wY1ivUOLTFNSumd0
	IZG5adRahpKOLgWwJVZcPXvOplJI=
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr17382126wmc.156.1607337426666;
        Mon, 07 Dec 2020 02:37:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwRtV73QFCV2ROpZ9fzFZtsHpDjPVdEFc+3zGnA5/nvOZAdgvHLzYUDyvlwzcMdbtuT+HBXg==
X-Received: by 2002:a05:600c:2:: with SMTP id g2mr17382089wmc.156.1607337426480;
        Mon, 07 Dec 2020 02:37:06 -0800 (PST)
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
 <2352c04c-829e-ea1d-0894-15fc1d06697a@redhat.com>
 <cd5d00b1-999a-fbb3-204e-a759a9e2c3ec@redhat.com>
 <0447129c-e6c9-71f6-1786-b4e8689b8214@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b0ea4a2f-c79e-9d8f-86a5-eb6f53bf5067@redhat.com>
Date: Mon, 7 Dec 2020 11:37:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0447129c-e6c9-71f6-1786-b4e8689b8214@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 11:33 AM, Thomas Huth wrote:
> On 07/12/2020 11.26, Philippe Mathieu-Daudé wrote:
>> On 12/7/20 11:00 AM, Philippe Mathieu-Daudé wrote:
>>> On 12/7/20 6:46 AM, Thomas Huth wrote:
>>>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>>>> Cross-build s390x target with only KVM accelerator enabled.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>>>  .gitlab-ci.yml                         | 1 +
>>>>>  MAINTAINERS                            | 1 +
>>>>>  3 files changed, 8 insertions(+)
>>>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>>
>>>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>> new file mode 100644
>>>>> index 00000000000..1731af62056
>>>>> --- /dev/null
>>>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>>> @@ -0,0 +1,6 @@
>>>>> +cross-s390x-kvm:
>>>>> +  extends: .cross_accel_build_job
>>>>> +  variables:
>>>>> +    IMAGE: debian-s390x-cross
>>>>> +    TARGETS: s390x-softmmu
>>>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>>> index 573afceb3c7..a69619d7319 100644
>>>>> --- a/.gitlab-ci.yml
>>>>> +++ b/.gitlab-ci.yml
>>>>> @@ -14,6 +14,7 @@ include:
>>>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>>>
>>>> KVM code is already covered by the "cross-s390x-system" job, but an
>>>> additional compilation test with --disable-tcg makes sense here. I'd then
>>>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
>>
>> What other accelerators are available on 390?
> 
> It's only TCG and KVM.

Easy, so no-tcg = kvm :)



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1885A2D0DFA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:27:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46140.81856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDjW-0006E0-KM; Mon, 07 Dec 2020 10:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46140.81856; Mon, 07 Dec 2020 10:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDjW-0006Da-H1; Mon, 07 Dec 2020 10:27:06 +0000
Received: by outflank-mailman (input) for mailman id 46140;
 Mon, 07 Dec 2020 10:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmDjV-0006DU-6c
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:27:05 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2b590d77-d9e3-43e8-bc56-775eefe3a34a;
 Mon, 07 Dec 2020 10:27:04 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-WbqAKidON5SD0AIiRoHe1Q-1; Mon, 07 Dec 2020 05:27:02 -0500
Received: by mail-wm1-f69.google.com with SMTP id b184so3980816wmh.6
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 02:27:02 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o203sm14297391wmb.0.2020.12.07.02.26.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:27:00 -0800 (PST)
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
X-Inumbo-ID: 2b590d77-d9e3-43e8-bc56-775eefe3a34a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607336824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MYK9SCRGoM7soozgWZPnpW4pQBMVhd9wGe6LkNWKsP0=;
	b=W4qQL0pWHNkRDJrBvw2tHO0v3F8KmAeSNN8x1T7xcYd0ypEmBX0EFc4QMcLUu+n15XHRlp
	xK+VInoiB3qnCQOmfYmIfnBtjfRb7f0iO1MEZc09fy1H1MI+utq8ZHaeT20hQNVtX+hr1B
	9HtN2Ysq85kXjIEf6DJdMmc4zfBOjwg=
X-MC-Unique: WbqAKidON5SD0AIiRoHe1Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MYK9SCRGoM7soozgWZPnpW4pQBMVhd9wGe6LkNWKsP0=;
        b=M+mSOT3JwPd9W2QUD+zhYdV5zcopREGxhtB4RsQpw7JyABDRW4vyox/6iNsNpI+n3c
         jq01T5NpVqeHbqg2DOu/J/MKcU/uT0tEN8RBqC2Bj42h9Bu2Jepgakh9b1wVuxBCr8AL
         dQIgbdsKi+4MqzP24H3P5iU4kH3Pn8Kldpl4kvbPvTQWpibeUUCmtP7GLSDneIz9fAzL
         /YJN40X6LgbDGFSkiFOuVtv/Yu/1kz6K/6L7LsGeZP+bjLfTk2iYsg8qc+3hFo9F76Q6
         gHVFxlzcz0RVoWN2a7qsRoIGcPRsLwBbEup86e9AKy+vRfpMWEKKES7ESOGXRUYWeGhC
         Fo+w==
X-Gm-Message-State: AOAM530w8xWcFRx9F8kj2rl1excBhAh2hUySg9KG0Cu8kH8xvgYqBdQh
	FdrpSxT4hFeCgB3++qJh44Cc1F5M0UODw6kr7v6t+IgUnbHcWfz6Y/J28AL2P6PhqQ3rVhR3JfJ
	gbPdQFQo3xFdNjOD/HSD/Ki3GV3g=
X-Received: by 2002:a5d:5505:: with SMTP id b5mr18809762wrv.410.1607336821236;
        Mon, 07 Dec 2020 02:27:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpxS69KnKku3sO4CNJaJdpGJkosGMLT7HJYybqboCJTmJrWpUYm5nXWA06aq36q3aIAua9Hw==
X-Received: by 2002:a5d:5505:: with SMTP id b5mr18809725wrv.410.1607336821045;
        Mon, 07 Dec 2020 02:27:01 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Claudio Fontana <cfontana@suse.de>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <20201207102450.GG3102898@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9233fe7f-8d56-e1ad-b67e-40b3ce5fcabb@redhat.com>
Date: Mon, 7 Dec 2020 11:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207102450.GG3102898@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 11:25 AM, Daniel P. Berrangé wrote:
> On Mon, Dec 07, 2020 at 06:46:01AM +0100, Thomas Huth wrote:
>> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>>> Cross-build s390x target with only KVM accelerator enabled.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
>>>  .gitlab-ci.yml                         | 1 +
>>>  MAINTAINERS                            | 1 +
>>>  3 files changed, 8 insertions(+)
>>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>>
>>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>> new file mode 100644
>>> index 00000000000..1731af62056
>>> --- /dev/null
>>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
>>> @@ -0,0 +1,6 @@
>>> +cross-s390x-kvm:
>>> +  extends: .cross_accel_build_job
>>> +  variables:
>>> +    IMAGE: debian-s390x-cross
>>> +    TARGETS: s390x-softmmu
>>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 573afceb3c7..a69619d7319 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -14,6 +14,7 @@ include:
>>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
>>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
>>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
>>
>> KVM code is already covered by the "cross-s390x-system" job, but an
>> additional compilation test with --disable-tcg makes sense here. I'd then
>> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
>>
>> And while you're at it, I'd maybe rather name the new file just
>> crossbuilds-s390x.yml and also move the other s390x related jobs into it?
> 
> I don't think we really should split it up so much - just put these
> jobs in the existing crosbuilds.yml file.

Don't we want to leverage MAINTAINERS file?



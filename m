Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99B2D0EC0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 12:14:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46251.82071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmETZ-0004bp-At; Mon, 07 Dec 2020 11:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46251.82071; Mon, 07 Dec 2020 11:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmETZ-0004bP-7g; Mon, 07 Dec 2020 11:14:41 +0000
Received: by outflank-mailman (input) for mailman id 46251;
 Mon, 07 Dec 2020 11:14:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmETY-0004bJ-89
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 11:14:40 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 9a6cecec-bb71-47cf-ab2a-b65edb8019ec;
 Mon, 07 Dec 2020 11:14:39 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-ym1lwJR0PhSqqzGLSDmXGg-1; Mon, 07 Dec 2020 06:14:37 -0500
Received: by mail-wm1-f71.google.com with SMTP id y187so5205188wmy.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 03:14:37 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 101sm8204198wrc.11.2020.12.07.03.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 03:14:35 -0800 (PST)
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
X-Inumbo-ID: 9a6cecec-bb71-47cf-ab2a-b65edb8019ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607339679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d3due4jAC9MTV0mBnYKTJ7whzzjRsNAmshkXoWCe6CY=;
	b=hEzfI8QhHpBU3XWwe/cBDzu488W5eUA8mkOmg3DSsG/3Ih33s+szJVvyZeScslOZowqa4q
	oVeVemqRpj/lMeGShTONxTB2gXgM525n0q8n8xVjOpCjdnRyJW2Ptz5mGc+Ah7pUIe2/SI
	jT6Ox2h352vSrfnmX0uIimHJ0pcQCyc=
X-MC-Unique: ym1lwJR0PhSqqzGLSDmXGg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d3due4jAC9MTV0mBnYKTJ7whzzjRsNAmshkXoWCe6CY=;
        b=mr2BEcFMGie1HXXbIV4MjEd88ZQUiDBQmp7oS2I6j3fkB28EG9KtP2YMjnbVDOpCzK
         kBAHj1Gg3XIhZnWuAHRQ9T4dbmsj0lrEmLuULhE9uvYcg/M/n3HXQlhcTAhe0nDYpy1o
         gHN97Uo9Iyt51e3Dwot4xG2AoOGgcp9/ZuYvjaULe3We0d0CJv+BFEhCzatDR1wEgO1Z
         dIEy1CZn7NvOMqy+5yKENaXHkC459K9hDLBLzDF+wPfTYxfuYQMjGJQrIKycnXr99UY7
         MEZRB5lOyBRqXNf7dxZFuduqH8ilx93b45rp1nGF/k5PRvw1D+oHMO8/bDneywxjK1jP
         ex3w==
X-Gm-Message-State: AOAM5312EXa/F7P98ESRufKs9Dksuj/s0bSA+ATVcQxKFck7ADhMW1hs
	BmGMKVpe+Rl45BV1NULasSZRTaaegUYwgzQ1Cvn0Hm8H55TwbakcqjkCWXfMVJu0fJJmLvZk/D0
	PMzSCRtNDKjstlbVpgiFMX+SwNr4=
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr18329765wmg.68.1607339676036;
        Mon, 07 Dec 2020 03:14:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx39v2hZ0fbf4DvQybV80l5NVeeedH84TOXnjX8rQjHffosdw7+EPGiVnjKS5k8UtdPHq9RPg==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr18329736wmg.68.1607339675852;
        Mon, 07 Dec 2020 03:14:35 -0800 (PST)
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <20201207102450.GG3102898@redhat.com>
 <9233fe7f-8d56-e1ad-b67e-40b3ce5fcabb@redhat.com>
 <20201207103430.GI3102898@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3bb741d3-aaf7-8d73-1990-efc01e3e8977@redhat.com>
Date: Mon, 7 Dec 2020 12:14:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207103430.GI3102898@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 11:34 AM, Daniel P. Berrangé wrote:
> On Mon, Dec 07, 2020 at 11:26:58AM +0100, Philippe Mathieu-Daudé wrote:
>> On 12/7/20 11:25 AM, Daniel P. Berrangé wrote:
>>> On Mon, Dec 07, 2020 at 06:46:01AM +0100, Thomas Huth wrote:
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
>>>>
>>>> And while you're at it, I'd maybe rather name the new file just
>>>> crossbuilds-s390x.yml and also move the other s390x related jobs into it?
>>>
>>> I don't think we really should split it up so much - just put these
>>> jobs in the existing crosbuilds.yml file.
>>
>> Don't we want to leverage MAINTAINERS file?
> 
> As mentioned in the cover letter, I think this is mis-using the MAINTAINERS
> file to try to represent something different.
> 
> The MAINTAINERS file says who is responsible for the contents of the .yml
> file, which is the CI maintainers, because we want a consistent gitlab
> configuration as a whole, not everyone doing their own thing.
> 
> MAINTAINERS doesn't say who is responsible for making sure the actual
> jobs that run are passing, which is potentially a completely different
> person. If we want to track that, it is not the MAINTAINERS file.

Thanks, I was expecting subsystem maintainers would worry about the
CI jobs, but you made it clear this should be different persons who
look after CI. I understand it is better to have no maintainer than
to have incorrect maintainer.



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1102D0DBB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46070.81721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDO1-00033p-RK; Mon, 07 Dec 2020 10:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46070.81721; Mon, 07 Dec 2020 10:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDO1-00033Q-Nn; Mon, 07 Dec 2020 10:04:53 +0000
Received: by outflank-mailman (input) for mailman id 46070;
 Mon, 07 Dec 2020 10:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Pxd=FL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1kmDNz-00033J-Qa
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:04:51 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 25bbe895-5439-4e3a-aff6-576325c446f5;
 Mon, 07 Dec 2020 10:04:51 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-LGK1Er0yN3u4y-rbsqZ6IQ-1; Mon, 07 Dec 2020 05:04:49 -0500
Received: by mail-wm1-f72.google.com with SMTP id l5so3984344wmi.4
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 02:04:48 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id e17sm4403139wrw.84.2020.12.07.02.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 02:04:46 -0800 (PST)
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
X-Inumbo-ID: 25bbe895-5439-4e3a-aff6-576325c446f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607335490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
	b=IUj/WNf5h8IqWTIOYg2z84Hv9lQBHEyKKAIlxidutKotmmyqXc3FpcRUuwERstCHy0B0tT
	kf9Z+L1alyvdKNdvuqCwkaIXbeuvz7wF3DLBEs2HwE8c6/p5vABFyblj54irnClcuEHY6I
	I/KvIc6erd2CSwBb2aGFbDlmayJoaX4=
X-MC-Unique: LGK1Er0yN3u4y-rbsqZ6IQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NYGMZWwBeIh3fFPx69mvYjTdx1z088fxfHeToI+lsX8=;
        b=TVCgo9EJ/PMLQwG1DmeJ+bDUSQQ4If7OsH4sUUAMdWBZbOOiHma28N1SkXA1EXJWz8
         /zg1NQt6TwDEu8LbYvPY0f3DUDQui7YAKo8vMxpb5YB5EcGLEUhLW3+b1nCRC2/NeQH5
         zaHB7sEme2AYU6IuAGbgSq4OkkoO53tWrhZXkj+wizvsWA+9QAw3PFMgGdl6SW+/itVs
         naaqUZhFDAW/m4x2XCbpywAy6xqi8iA87nHmTB78/3nT79YvBP54QHv4LCZSJU0VD+1g
         +NP1b2lMDubos5taDWas0sr9L0Ee2AgPbMtxcFGU09cf6Z/RZiz1KF8Fh5byXmIGbwZ0
         dFlw==
X-Gm-Message-State: AOAM531P7FdhAre+WHtw7XTldUiYVv16KqkhcLpFDK6hOxZCwPklFkaX
	7oYoqRFWmusXNgIqBZ+xO/KMByu++0bp1N7mIFQzJOtuEqbPp5txM60Y7D8B1OqPDKebKthFDYU
	vVNljD9tdu590DxX2T+j45VoxCDQ=
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16984339wma.17.1607335487736;
        Mon, 07 Dec 2020 02:04:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxh2IvFXXS0Sn+Z6xWooK0ZB7J3J/ucSwA/Wd5Mn37PSJsH8VDS/ZbIW+jBzvFF1CRvg0hS8w==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr16984316wma.17.1607335487585;
        Mon, 07 Dec 2020 02:04:47 -0800 (PST)
Subject: Re: [PATCH 3/8] gitlab-ci: Add KVM X86 cross-build jobs
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
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-4-philmd@redhat.com>
 <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <951882fd-fae0-2dec-5a81-d72adf139511@redhat.com>
Date: Mon, 7 Dec 2020 11:04:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1048bbc0-7124-3564-4219-aa32ed11a35b@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/7/20 6:20 AM, Thomas Huth wrote:
> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
>> Cross-build x86 target with only KVM accelerator enabled.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds-kvm-x86.yml | 6 ++++++
>>  .gitlab-ci.yml                       | 1 +
>>  MAINTAINERS                          | 1 +
>>  3 files changed, 8 insertions(+)
>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml
> 
> We already have a job that tests with KVM enabled and TCG disabled in the
> main .gitlab-ci.yml file, the "build-tcg-disabled" job. So I don't quite see
> the point in adding yet another job that does pretty much the same? Did I
> miss something?

I missed it was x86-specific myself.

> 
>  Thomas
> 



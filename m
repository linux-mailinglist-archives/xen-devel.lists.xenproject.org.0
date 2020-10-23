Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E66296C2E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 11:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10807.28839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVtT3-0004cF-DB; Fri, 23 Oct 2020 09:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10807.28839; Fri, 23 Oct 2020 09:34:37 +0000
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
	id 1kVtT3-0004bq-A9; Fri, 23 Oct 2020 09:34:37 +0000
Received: by outflank-mailman (input) for mailman id 10807;
 Fri, 23 Oct 2020 09:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dX6+=D6=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kVtT0-0004bl-Qf
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:34:35 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4d66e040-4cb4-4caa-82f4-718cc0bd2d28;
 Fri, 23 Oct 2020 09:34:33 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-80gi-UXRMw6s8QFcHyWBhg-1; Fri, 23 Oct 2020 05:34:31 -0400
Received: by mail-wm1-f71.google.com with SMTP id s12so330908wmj.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2020 02:34:31 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m8sm2152212wrw.17.2020.10.23.02.34.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Oct 2020 02:34:29 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dX6+=D6=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kVtT0-0004bl-Qf
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 09:34:35 +0000
X-Inumbo-ID: 4d66e040-4cb4-4caa-82f4-718cc0bd2d28
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 4d66e040-4cb4-4caa-82f4-718cc0bd2d28;
	Fri, 23 Oct 2020 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603445673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGMVu3aa9dhMCzxAud5NWcJoHpEpj2AUgXtxCn9BG9E=;
	b=MyuKN4Zc1RS6hm4KMpIk2K8J9IMAIW54dVpNrRFSlAQ+3qyty1urLrP+6MhnUfuLRTvrNm
	rC8fCV44NYKPE8S03++F7UuTwLkte6N95gRosj2sZ63u/HHR4cGidx+j0WrUpIfZ29IoGM
	Xv9KO1MvivaLBG4IR+YYpDDiRgFGg+I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-80gi-UXRMw6s8QFcHyWBhg-1; Fri, 23 Oct 2020 05:34:31 -0400
X-MC-Unique: 80gi-UXRMw6s8QFcHyWBhg-1
Received: by mail-wm1-f71.google.com with SMTP id s12so330908wmj.0
        for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2020 02:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FGMVu3aa9dhMCzxAud5NWcJoHpEpj2AUgXtxCn9BG9E=;
        b=ulzavgIgPkFgNCSRsSHhcE82Xmk6ITArDIVLIqwoJ9wnVmzOFv5N+w8IpZeY7Rbk8v
         TVOlm+a4Fqqz7PZ51CEMeO6RbR63Brptq6p1CMaTbG3KgPIrep/Z2ZJ7gQYKRGe5mvpf
         pa9vmAaTgAkHoSuqgtwVTFsDnPjfsJM/OBRfuJOrvwyNrnrky5ndGqI5L1HK07PMUgo0
         vO8ZX5+ZPtWbgXkgNJ+aO0rdhTLXFpDl0WMD2DF1Tp+T4wF6dksMGAPfZBqsenWjSNkd
         hNACFq7VYuIkEIYw5lA1slkNuAZ6lo8i9cVCxiiRXGKwKIhulW091E3UmEk6wWCe6jmd
         f4PQ==
X-Gm-Message-State: AOAM530/IWlJU2WJ6to0+OidPInCnFwGwDIZIDoTtJX6Fxd4RqdpU6wy
	nSN9LAykp9qUdcMp7LBbU1fOU6GzYRLggEYjlhIF7KVgjGDssej7dBmFygoFPxAVwqPlIczaFT5
	A5ObaYzlMwCDrgafV80X1t1OajI8=
X-Received: by 2002:a5d:4648:: with SMTP id j8mr1595267wrs.131.1603445670129;
        Fri, 23 Oct 2020 02:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZEPFC0cYdFNLJkhT7P2Q/rKqhDgKW2UfR2mE25lRSMsIsWGSZR75378dt7F6GcxlNTU540A==
X-Received: by 2002:a5d:4648:: with SMTP id j8mr1595234wrs.131.1603445669876;
        Fri, 23 Oct 2020 02:34:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id m8sm2152212wrw.17.2020.10.23.02.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2020 02:34:29 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Add Xen CpusAccel
To: Thomas Huth <thuth@redhat.com>, Jason Andryuk <jandryuk@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 QEMU <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20201013140511.5681-1-jandryuk@gmail.com>
 <ddb5c9c2-c206-28d6-2d9d-7954e7022c23@redhat.com>
 <CAKf6xpvpuG1jVdf3+heXzHFd_kc5kVHYdJgC+8iazFLciqOMZw@mail.gmail.com>
 <d9f23eee-c0af-d2dd-9b9d-f0255fc8e3d1@redhat.com>
 <1927b32e-7919-5061-0285-d9c7184d0bae@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c0ef825b-ac02-67ab-aef2-f7722da1272a@redhat.com>
Date: Fri, 23 Oct 2020 11:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1927b32e-7919-5061-0285-d9c7184d0bae@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23/10/20 09:09, Thomas Huth wrote:
> On 22/10/2020 17.29, Paolo Bonzini wrote:
>> On 22/10/20 17:17, Jason Andryuk wrote:
>>> On Tue, Oct 13, 2020 at 1:16 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>>>
>>>> On 13/10/20 16:05, Jason Andryuk wrote:
>>>>> Xen was left behind when CpusAccel became mandatory and fails the assert
>>>>> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
>>>>> Move the qtest cpu functions to a common location and reuse them for
>>>>> Xen.
>>>>>
>>>>> v2:
>>>>>   New patch "accel: Remove _WIN32 ifdef from qtest-cpus.c"
>>>>>   Use accel/dummy-cpus.c for filename
>>>>>   Put prototype in include/sysemu/cpus.h
>>>>>
>>>>> Jason Andryuk (3):
>>>>>   accel: Remove _WIN32 ifdef from qtest-cpus.c
>>>>>   accel: move qtest CpusAccel functions to a common location
>>>>>   accel: Add xen CpusAccel using dummy-cpus
>>>>>
>>>>>  accel/{qtest/qtest-cpus.c => dummy-cpus.c} | 27 ++++------------------
>>>>>  accel/meson.build                          |  8 +++++++
>>>>>  accel/qtest/meson.build                    |  1 -
>>>>>  accel/qtest/qtest-cpus.h                   | 17 --------------
>>>>>  accel/qtest/qtest.c                        |  5 +++-
>>>>>  accel/xen/xen-all.c                        |  8 +++++++
>>>>>  include/sysemu/cpus.h                      |  3 +++
>>>>>  7 files changed, 27 insertions(+), 42 deletions(-)
>>>>>  rename accel/{qtest/qtest-cpus.c => dummy-cpus.c} (71%)
>>>>>  delete mode 100644 accel/qtest/qtest-cpus.h
>>>>>
>>>>
>>>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>>>
>>> Thank you, Paolo.  Also Anthony Acked and Claudio Reviewed patch 3.
>>> How can we get this into the tree?
>>
>> I think Anthony should send a pull request?
> 
> Since Anthony acked patch 3, I think I can also take it through the qtest tree.

No objections, thanks!

Paolo



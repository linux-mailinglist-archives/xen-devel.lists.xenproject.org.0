Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F8B28D2F8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 19:17:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6320.16860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSNuu-0001RP-6n; Tue, 13 Oct 2020 17:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6320.16860; Tue, 13 Oct 2020 17:16:52 +0000
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
	id 1kSNuu-0001R0-3k; Tue, 13 Oct 2020 17:16:52 +0000
Received: by outflank-mailman (input) for mailman id 6320;
 Tue, 13 Oct 2020 17:16:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iuM3=DU=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kSNus-0001Qv-Fg
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 17:16:50 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6ddb5c31-c594-4271-a716-d7b933bd45b2;
 Tue, 13 Oct 2020 17:16:49 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Dy4qqe9UNdGDO3w_lNVJmA-1; Tue, 13 Oct 2020 13:16:47 -0400
Received: by mail-wm1-f71.google.com with SMTP id p17so22992wmi.7
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 10:16:47 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:61dd:85cb:23fc:fd54?
 ([2001:b07:6468:f312:61dd:85cb:23fc:fd54])
 by smtp.gmail.com with ESMTPSA id h16sm276181wre.87.2020.10.13.10.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 10:16:44 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=iuM3=DU=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
	id 1kSNus-0001Qv-Fg
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 17:16:50 +0000
X-Inumbo-ID: 6ddb5c31-c594-4271-a716-d7b933bd45b2
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 6ddb5c31-c594-4271-a716-d7b933bd45b2;
	Tue, 13 Oct 2020 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602609409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mbd51cFBxe+XUw/BaRsDfnw6Rspo0/0Cx5mNXVWCiAw=;
	b=Djfkz1bS24stcDLsrdTt4J/zyb/fZA259j+En9fHd9YjJwFhb79pUW44cDhLiPqdk8jt4O
	I6ed9McG7rwbHUd5HALTTkP0aaiewSMuNKam4rpSiZXTBkjWh/Fl1lrQJQh3rhOXBNvGhx
	2MFr9VM1wrwsJp2Waf57DNYq8F/6TYI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Dy4qqe9UNdGDO3w_lNVJmA-1; Tue, 13 Oct 2020 13:16:47 -0400
X-MC-Unique: Dy4qqe9UNdGDO3w_lNVJmA-1
Received: by mail-wm1-f71.google.com with SMTP id p17so22992wmi.7
        for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2020 10:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mbd51cFBxe+XUw/BaRsDfnw6Rspo0/0Cx5mNXVWCiAw=;
        b=PFSE988dJQG65C4vsSMBy2oIg6HJT38OKiS+DdhBkt8S3y9xQA/JVCWDN16Si8PT+A
         iynGpWfiymSKOOAcCkYjEwi3ZmPPlj+CLiee96m/+ILwQFpyczmQRG2fYHPqJJNozmdw
         4Un9pBpuAwy5v4rJDHjo8f+pH9Ghl0w3VjWIU86G9V5pGy10aKU4JnyXgpznPg5Ns2Be
         CK2cNpZhpKo1CoubRtFtTfsQx1KzRM/diacGyBjkIhItWJW5DmAYpOi80rP0H1Ks9K/3
         zZwFQPGvwTn6c+zU0HBn9v8RLDQ4Suz/QgTcdSXm+ocYjMvNtjq7kPMCYVXmx03DM7bU
         PIEw==
X-Gm-Message-State: AOAM530i7QN3bIG/ls0ONZZeFA7Ap0QiCUc5Rx8K9FaqcqmI84F1hZ6S
	geHs9HTniftMKGev3jJdzIw4L3vDVyt7XnU3s0pGoBIFo2k99P7xbU01bClw50lF9vUnFtpEC0C
	NA+1yTP6zy6mlYmLjWGN9JByn3Lc=
X-Received: by 2002:adf:ab50:: with SMTP id r16mr709722wrc.235.1602609406298;
        Tue, 13 Oct 2020 10:16:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqvJcVbb6P2cHgVEVaTt5MgwUbDl0AbzF1nLxhSnu5jh3qcI8p8DLescv9YGK+kKeOV6PDXg==
X-Received: by 2002:adf:ab50:: with SMTP id r16mr709694wrc.235.1602609406080;
        Tue, 13 Oct 2020 10:16:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:61dd:85cb:23fc:fd54? ([2001:b07:6468:f312:61dd:85cb:23fc:fd54])
        by smtp.gmail.com with ESMTPSA id h16sm276181wre.87.2020.10.13.10.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 10:16:44 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Add Xen CpusAccel
To: Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201013140511.5681-1-jandryuk@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddb5c9c2-c206-28d6-2d9d-7954e7022c23@redhat.com>
Date: Tue, 13 Oct 2020 19:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201013140511.5681-1-jandryuk@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13/10/20 16:05, Jason Andryuk wrote:
> Xen was left behind when CpusAccel became mandatory and fails the assert
> in qemu_init_vcpu().  It relied on the same dummy cpu threads as qtest.
> Move the qtest cpu functions to a common location and reuse them for
> Xen.
> 
> v2:
>   New patch "accel: Remove _WIN32 ifdef from qtest-cpus.c"
>   Use accel/dummy-cpus.c for filename
>   Put prototype in include/sysemu/cpus.h
> 
> Jason Andryuk (3):
>   accel: Remove _WIN32 ifdef from qtest-cpus.c
>   accel: move qtest CpusAccel functions to a common location
>   accel: Add xen CpusAccel using dummy-cpus
> 
>  accel/{qtest/qtest-cpus.c => dummy-cpus.c} | 27 ++++------------------
>  accel/meson.build                          |  8 +++++++
>  accel/qtest/meson.build                    |  1 -
>  accel/qtest/qtest-cpus.h                   | 17 --------------
>  accel/qtest/qtest.c                        |  5 +++-
>  accel/xen/xen-all.c                        |  8 +++++++
>  include/sysemu/cpus.h                      |  3 +++
>  7 files changed, 27 insertions(+), 42 deletions(-)
>  rename accel/{qtest/qtest-cpus.c => dummy-cpus.c} (71%)
>  delete mode 100644 accel/qtest/qtest-cpus.h
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>



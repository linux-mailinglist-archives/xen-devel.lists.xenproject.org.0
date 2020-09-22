Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589DB273ADD
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 08:27:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKblj-0001cG-7s; Tue, 22 Sep 2020 06:27:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VADB=C7=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1kKbli-0001cB-CY
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 06:27:14 +0000
X-Inumbo-ID: d65a08a4-b4d6-432c-9102-f09d7d285866
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d65a08a4-b4d6-432c-9102-f09d7d285866;
 Tue, 22 Sep 2020 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600756032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7G+bCvhy95HPHxeoyKaN/sNOB4HyNxDqXvDdb+Os9oY=;
 b=aAS3Q0pyrjCEqjf5IfCNafrX2LTnX6H0z4j1wkzr7tn9hH2NYeICC7WqAeqcMokx+c/d2X
 IacchlR2xuxttmwXTmcnc2LYLxSQiy9GVQZHuOm/zGZdNblxptnKOp9AZjPDBfMpxvpZKw
 ostOgm5AZQyQ8LRNXuTlOBd77xwevQM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-07JnWGQgOaGTnf-Ah0SJSg-1; Tue, 22 Sep 2020 02:27:10 -0400
X-MC-Unique: 07JnWGQgOaGTnf-Ah0SJSg-1
Received: by mail-wm1-f71.google.com with SMTP id u5so510524wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2020 23:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7G+bCvhy95HPHxeoyKaN/sNOB4HyNxDqXvDdb+Os9oY=;
 b=eWPt3cjgxZvJ2jVPb8NRph/SBCMbn0NjQ9P8z8azkOJKKkIzZL47mCkp6rurg0cORs
 hy9RmQ6YfU7MBb5rw4SjUQ+7K2ENKEQsIkvI1Ez0XL3M97q6jf2HVS3N6WiFkMuHvDaN
 gi0uK9qj8h95p+syognaMUwwkqtjT/QGTEftrj/zysxVNBSsy/kF2XlVHgTSnQwYNBiq
 ovC2+6QjIP+yktd7wTIg2Tmj1feDdTt782fWXiN9wn35k+qXjdy/Cdieuw/0qGNzZ1d3
 +8rLnnw0CnegUmJvoA3lUzFJadAOYakYRFAP2x6Kj+SILLfzJk41Z1WJawDdXdv0O29b
 e7VQ==
X-Gm-Message-State: AOAM530YXkRkb0mqr/1Zkak8JuzoF7O554ZEINZqGURhh22CaAB8tZxn
 pC0BqpNEItdTa2/uiDCvPdkcb+YwRqKcFRrsoAbXOIjcXg6rFC3ZTQz08incy+LNn6H6qvlsMLZ
 jQBcxkV7ZUzbkMuTWyFf+QwtLW/c=
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr3417811wrr.406.1600756029760; 
 Mon, 21 Sep 2020 23:27:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7ORFOE+M4sZ1/hLsOYfDXOsipaSc5O+Pi6m5A0EYwqbK9SJpJMOv6iyB5CnFMJ42wvwz7zg==
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr3417755wrr.406.1600756029493; 
 Mon, 21 Sep 2020 23:27:09 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d153:8d0f:94cf:5114?
 ([2001:b07:6468:f312:d153:8d0f:94cf:5114])
 by smtp.gmail.com with ESMTPSA id a83sm2892268wmh.48.2020.09.21.23.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 23:27:08 -0700 (PDT)
Subject: Re: [PATCH] qemu/atomic.h: prefix qemu_ to solve <stdatomic.h>
 collisions
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alberto Garcia <berto@igalia.com>, Jiri Slaby <jslaby@suse.cz>,
 Richard Henderson <rth@twiddle.net>, Peter Lieven <pl@kamp.de>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Markus Armbruster <armbru@redhat.com>,
 kvm@vger.kernel.org, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Liu Yuan <namei.unix@gmail.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Jason Wang
 <jasowang@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 xen-devel@lists.xenproject.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 sheepdog@lists.wpkg.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
References: <20200921162346.188997-1-stefanha@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c8892b73-6cee-9fd3-54b0-289149926041@redhat.com>
Date: Tue, 22 Sep 2020 08:27:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200921162346.188997-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/09/20 18:23, Stefan Hajnoczi wrote:
> clang's C11 atomic_fetch_*() functions only take a C11 atomic type
> pointer argument. QEMU uses direct types (int, etc) and this causes a
> compiler error when a QEMU code calls these functions in a source file
> that also included <stdatomic.h> via a system header file:
> 
>   $ CC=clang CXX=clang++ ./configure ... && make
>   ../util/async.c:79:17: error: address argument to atomic operation must be a pointer to _Atomic type ('unsigned int *' invalid)
> 
> Avoid using atomic_*() names in QEMU's atomic.h since that namespace is
> used by <stdatomic.h>. Prefix QEMU's APIs with qemu_ so that atomic.h
> and <stdatomic.h> can co-exist.
> 
> This patch was generated using:
> 
>   $ git diff | grep -o '\<atomic_[a-z0-9_]\+' | sort -u >/tmp/changed_identifiers
>   $ for identifier in $(</tmp/changed_identifiers64); do \
>        sed -i "s%\<$identifier\>%qemu_$identifier%" $(git grep -l "\<$identifier\>") \
>     done

It's certainly a good idea but it's quite verbose.

What about using atomic__* as the prefix?  It is not very common in QEMU
but there are some cases (and I cannot think of anything better).

Paolo



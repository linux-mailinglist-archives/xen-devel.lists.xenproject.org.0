Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E994A21476F
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 18:36:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrl9E-00074r-0W; Sat, 04 Jul 2020 16:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ux+X=AP=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jrl9C-00074m-0s
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 16:36:14 +0000
X-Inumbo-ID: 78b5da60-be14-11ea-bb8b-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 78b5da60-be14-11ea-bb8b-bc764e2007e4;
 Sat, 04 Jul 2020 16:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593880571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=SqXz38wdz/FD+LnrCe+KuV6IAZbK6L/A1oUQpL8mo44=;
 b=TZNRE9jQOT2CNh25NsU2LuLCcZxOxnm5zdHngPsw+8CJBb8hGO3ju4+RZRmrIdPljbVZfO
 kB4ZP5U2qrdrqrL65k1vxOty/FIrBAWNJXs4DBPyg6dEusrjJMpNihcr9EZvI0rXgrnY1j
 yeusxfEnC5m+l5ug5dA8nBmKvd0Tc6s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-M6CzRJ4yPsq_ZxfDCRq3Hg-1; Sat, 04 Jul 2020 12:36:10 -0400
X-MC-Unique: M6CzRJ4yPsq_ZxfDCRq3Hg-1
Received: by mail-wr1-f72.google.com with SMTP id y16so35988371wrr.20
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 09:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SqXz38wdz/FD+LnrCe+KuV6IAZbK6L/A1oUQpL8mo44=;
 b=REYctrPP2KVGNXeLmTEPG6tjqMTOvouGKRJVCGLPYEQUEjFE1e7VK92TK+lw9B37nC
 Tz8jHJoVb2jKs/zewszqCI/wZ6xw6sMgd+J7duziRzECq6jiCjT873gBBYQ35lJ/I5XN
 hz7f26pnzY998vvv6XrKby7m2HyOz979q38vNsppQpcgUZxf3/h6PioDB08VG04iIY6k
 8jTHY5Kcpcz3YF+Rn1dABngUOsu5DjjM2xJ3lKjuC4qDgsKFMoVtPclkO91x6wQi82T8
 vHzSo92Nw8MXA6IKv3VAE6IQTAfIV/BdC8Ju5kA9qKGJGU8YWry7j7IbNdeTIU6WsOz0
 s0mw==
X-Gm-Message-State: AOAM5326U4TqDylmTOpVM3/ljHsVkZYP+tglm5q5+qL//zX8HtC7l8ae
 IblqwEfHxRBrO6IXMdcmw1f8lE/UMzg0A/Qs7Dc1IzXSn2RzCNs487f9gh9DI1Ztq2NI7yLWX7l
 3K/zYMxOQx11sF/wZmSbe8ssZy0E=
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr8556941wrx.166.1593880569113; 
 Sat, 04 Jul 2020 09:36:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwOJi6CsXPd0bz+EEZxRlnsYFe4x67mZFFceVXWJFwu9AHH7lmdGkjXYPqrDUEAhIfJcjFGQ==
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr8556917wrx.166.1593880568935; 
 Sat, 04 Jul 2020 09:36:08 -0700 (PDT)
Received: from [192.168.1.39] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r11sm16595203wmh.1.2020.07.04.09.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 09:36:08 -0700 (PDT)
Subject: Re: [PATCH v11 8/8] xen: introduce ERRP_AUTO_PROPAGATE
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20200703090816.3295-1-vsementsov@virtuozzo.com>
 <20200703090816.3295-9-vsementsov@virtuozzo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e2b4f10a-162c-ebb8-3232-381c4d820f9f@redhat.com>
Date: Sat, 4 Jul 2020 18:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200703090816.3295-9-vsementsov@virtuozzo.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>, groug@kaod.org,
 armbru@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 7/3/20 11:08 AM, Vladimir Sementsov-Ogievskiy wrote:
> If we want to add some info to errp (by error_prepend() or
> error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
> Otherwise, this info will not be added when errp == &error_fatal
> (the program will exit prior to the error_append_hint() or
> error_prepend() call).  Fix such cases.
> 
> If we want to check error after errp-function call, we need to
> introduce local_err and then propagate it to errp. Instead, use
> ERRP_AUTO_PROPAGATE macro, benefits are:
> 1. No need of explicit error_propagate call
> 2. No need of explicit local_err variable: use errp directly
> 3. ERRP_AUTO_PROPAGATE leaves errp as is if it's not NULL or
>    &error_fatal, this means that we don't break error_abort
>    (we'll abort on error_set, not on error_propagate)
> 
> This commit is generated by command
> 
>     sed -n '/^X86 Xen CPUs$/,/^$/{s/^F: //p}' MAINTAINERS | \
>     xargs git ls-files | grep '\.[hc]$' | \
>     xargs spatch \
>         --sp-file scripts/coccinelle/auto-propagated-errp.cocci \
>         --macro-file scripts/cocci-macro-file.h \
>         --in-place --no-show-diff --max-width 80
> 
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Reported-by: Greg Kurz <groug@kaod.org>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  hw/block/dataplane/xen-block.c |  17 +++---
>  hw/block/xen-block.c           | 102 ++++++++++++++-------------------
>  hw/pci-host/xen_igd_pt.c       |   7 +--
>  hw/xen/xen-backend.c           |   7 +--
>  hw/xen/xen-bus.c               |  92 +++++++++++++----------------
>  hw/xen/xen-host-pci-device.c   |  27 +++++----
>  hw/xen/xen_pt.c                |  25 ++++----
>  hw/xen/xen_pt_config_init.c    |  17 +++---
>  8 files changed, 128 insertions(+), 166 deletions(-)

Without the description, this patch has 800 lines of diff...
It killed me, I don't have the energy to review patch #7 of this
series after that, sorry.
Consider splitting such mechanical patches next time. Here it
could have been hw/block, hw/pci-host, hw/xen.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



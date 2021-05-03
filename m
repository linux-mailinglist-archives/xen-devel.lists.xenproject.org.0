Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEF937162F
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 15:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121608.229356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldYva-0007Fj-St; Mon, 03 May 2021 13:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121608.229356; Mon, 03 May 2021 13:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldYva-0007FK-Pb; Mon, 03 May 2021 13:48:02 +0000
Received: by outflank-mailman (input) for mailman id 121608;
 Mon, 03 May 2021 13:48:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldYvY-0007FF-U5
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 13:48:00 +0000
Received: from mail-lj1-x22d.google.com (unknown [2a00:1450:4864:20::22d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65a14cdb-26c2-4965-9da6-fd9880529dab;
 Mon, 03 May 2021 13:48:00 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id d15so6807243ljo.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 06:48:00 -0700 (PDT)
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
X-Inumbo-ID: 65a14cdb-26c2-4965-9da6-fd9880529dab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t8VSLvr8273ChxxroJtJkEHq3wxjGJJ/+aPa9QEx1+s=;
        b=F9CoZZqJgnWRblqgPEkmqzuHT2glOTa2rXBm6PsjrSdk06uniSsQCDsnMLEpkS3Nzq
         U+xrUyv2RFWWNYuzcvE+82KyEmaapIE0gR+3gstID3rYjswyj0Fxk836WG7sM18HOPDF
         HlhnKNGx6azN5/fOV6Y8ksoRs6pz6AyGQc5J7NQEeSIz/0hKq50e60u34TnUod958hAR
         Ekemirkg+JLw8z5k6Mm0MBkynGDsR4re67RkUu/PC+tlw3b2IXrxxjRHMAJWWQIzH2cY
         Nr+HVHlZIxeUKJ3t28EiujZLbyGDR2z2zG27NlmtUjU/Uxzlt7V8vaFVffKRaT2J3B5j
         rrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t8VSLvr8273ChxxroJtJkEHq3wxjGJJ/+aPa9QEx1+s=;
        b=jlNYfYXUAfes67TLZWhv6eyMMq6fe0K5u6T+pMzx9IEMWW7+MHvrrtE27EwNxtdynj
         VKKOA9psljrs2TNH9fqj+d32XC9GYx2iQWUA/eQ1f1Ou2pu6jh9buOE+xEa1susouwDG
         aeEmIY/XtLc6CbAW37TUH9pB9CWvPEU1xAr5ZE7XGkSaGaO98EaF0SeQfJFwXQ2kAQun
         FI8NKhwF++XCzzYcvUY0vAc/2v1IiUjGVa44b+qC4SwF/TrxR4HfFrTN6kR5BwlChczO
         xQPXUgYT255kF4ET9tZml7JPLiLGKhdlvQJXxMB3vKUsCs2l6TzVXZbMiajn00QsT6WM
         YPuQ==
X-Gm-Message-State: AOAM530HFMpPp9BPy6AGMzEDqUuhgZTWcH5qO2+QbJaRjBIheUAHA2+P
	getfpjO1yYByO6Wu5x5q5fr5KsJ7tXOgoLQT/X4=
X-Google-Smtp-Source: ABdhPJwKnPqGNCSh0cuSBMwWuEC8Bkcg3MWlqUMNEm7lk3rTxYvTvbS0OJz3Uj0wHzmP4WLRnvlOL4kEbTR93JtBU/0=
X-Received: by 2002:a2e:a7d4:: with SMTP id x20mr13590940ljp.285.1620049679087;
 Mon, 03 May 2021 06:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210423161558.224367-1-anthony.perard@citrix.com> <20210423161558.224367-4-anthony.perard@citrix.com>
In-Reply-To: <20210423161558.224367-4-anthony.perard@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 3 May 2021 09:47:47 -0400
Message-ID: <CAKf6xpugza2tpXq52_TgUUvVfZ7_ccPcbszvu6VYO=ryGAAp5g@mail.gmail.com>
Subject: Re: [XEN PATCH 3/8] libxl: Replace deprecated "cpu-add" QMP command
 by "device_add"
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 12:16 PM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> The command "cpu-add" for CPU hotplug is deprecated and has been
> removed from QEMU 6.0 (April 2021). We need to add cpus with the
> command "device_add" now.
>
> In order to find out which parameters to pass to "device_add" we first
> make a call to "query-hotpluggable-cpus" which list the cpus drivers
> and properties.
>
> The algorithm to figure out which CPU to add, and by extension if any
> CPU needs to be hotplugged, is in the function that adds the cpus.
> Because of that, the command "query-hotpluggable-cpus" is always
> called, even when not needed.
>
> In case we are using a version of QEMU older than 2.7 (Sept 2016)
> which don't have "query-hotpluggable-cpus", we fallback to using
> "cpu-add".
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/libs/light/libxl_domain.c | 87 ++++++++++++++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 8c003aa7cb04..e130deb0757f 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c

> +
> +/* Fallback function for QEMU older than 2.7, when
> + * 'query-hotpluggable-cpus' wasn't available and vcpu object couldn't be
> + * added with 'device_add'. */
> +static void set_vcpuonline_qmp_add_cpu(libxl__egc *egc, libxl__ev_qmp *qmp,
> +                                       const libxl__json_object *response,
> +                                       int rc) { STATE_AO_GC(qmp->ao);

STATE_AO_GC should be on a new line.

With that,

Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks,
Jason


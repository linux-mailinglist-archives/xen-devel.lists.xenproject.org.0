Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E7F2A50E5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 21:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18695.43692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ka2yB-0000ia-Rf; Tue, 03 Nov 2020 20:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18695.43692; Tue, 03 Nov 2020 20:31:55 +0000
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
	id 1ka2yB-0000iB-OH; Tue, 03 Nov 2020 20:31:55 +0000
Received: by outflank-mailman (input) for mailman id 18695;
 Tue, 03 Nov 2020 20:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DNo=EJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ka2y9-0000i6-Ln
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 20:31:53 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4df526e7-acc7-48ef-abe8-4c17ac596221;
 Tue, 03 Nov 2020 20:31:52 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-elD9pKsNO8aUM0MPiXE0Dw-1; Tue, 03 Nov 2020 15:31:50 -0500
Received: by mail-wm1-f72.google.com with SMTP id t201so249853wmt.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 12:31:50 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id x10sm26462274wrp.62.2020.11.03.12.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 12:31:48 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3DNo=EJ=redhat.com=philmd@srs-us1.protection.inumbo.net>)
	id 1ka2y9-0000i6-Ln
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 20:31:53 +0000
X-Inumbo-ID: 4df526e7-acc7-48ef-abe8-4c17ac596221
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 4df526e7-acc7-48ef-abe8-4c17ac596221;
	Tue, 03 Nov 2020 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604435512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2xoQMtcZ45M2FDoabAb+oIuMsPmr+LIxDstfsaLsQQ=;
	b=PaFtiWABs/hju6rEiVxiwFwvi8p0nxvCyqd6C+UnXMW6h9Ui7sudt53kCUL5m6hNcBdJjP
	ADhzP26AYryahEj0+EJcZgag9AFIDo7LsBoTtcAJBhUb8VuWcIc0d2dAqJzJlISc7PFSsL
	/85ec3wJIOi51sZevWxlXXD9vih4GyA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-elD9pKsNO8aUM0MPiXE0Dw-1; Tue, 03 Nov 2020 15:31:50 -0500
X-MC-Unique: elD9pKsNO8aUM0MPiXE0Dw-1
Received: by mail-wm1-f72.google.com with SMTP id t201so249853wmt.1
        for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2020 12:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W2xoQMtcZ45M2FDoabAb+oIuMsPmr+LIxDstfsaLsQQ=;
        b=ZOygKLayUn8dbz27XUEIDvqC4GvmERtb25NBtb6zUyWIYHSLRFWk3UUyVrpilWk/rI
         6jIZQjG46AZAgch1NYiIBkPp1kxLrXvKvldd7JpHAjirtOWBIcWsqwFKn2UG6eAQltHm
         9HI7C9FMOwQV57LDLHddJh+yiRBIGS+wE0KSrm60GNvJED9sxjTjgCp1DC5QaLBPAb+n
         jPenYT0xdoBA+AkJ23LPZswGuTJsXD5DyBrj7KkUo8REMUNrBFPe63jlX682QEasx6/u
         5p98AdmuCsxecJZsG0usiD75oH+reA//gVeft57YeRvdN5YIo9o6jQNCKKeAViPcLo7T
         ZeCw==
X-Gm-Message-State: AOAM5308FWoML/qu9FZWhkeqDIqEe7heL48oMNHEs+5Gba1Kk7PfPDJm
	JNN1EZrY5p3qJ/6Rc3ewqsZjKsw1SuQAFH74j6ZLtl54Uju7IUiB9fTVM6IXH1tZr4YNFNUbpyF
	w2ZB3zboOhHBpfPI37DRXwyAptok=
X-Received: by 2002:adf:e892:: with SMTP id d18mr29946474wrm.103.1604435509296;
        Tue, 03 Nov 2020 12:31:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5Kal2Q2BqN2crCt7Phj5MtwdE1YSjlg+L4Ckbm8BNES6hH2qy/addHtnYSbGKkq4WxUWSBQ==
X-Received: by 2002:adf:e892:: with SMTP id d18mr29946459wrm.103.1604435509125;
        Tue, 03 Nov 2020 12:31:49 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.234])
        by smtp.gmail.com with ESMTPSA id x10sm26462274wrp.62.2020.11.03.12.31.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 12:31:48 -0800 (PST)
Subject: Re: [Qemu-devel] [PULL 09/36] 9p: simplify source file selection
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <1566284395-30287-1-git-send-email-pbonzini@redhat.com>
 <1566284395-30287-10-git-send-email-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ab9a47b9-8ac5-c8f1-b035-b8b812551b3b@redhat.com>
Date: Tue, 3 Nov 2020 21:31:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1566284395-30287-10-git-send-email-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Paolo,

On 8/20/19 8:59 AM, Paolo Bonzini wrote:
> Express the complex conditions in Kconfig rather than Makefiles, since Kconfig
> is better suited at expressing dependencies and detecting contradictions.
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Kconfig.host        | 1 +
>  fsdev/Makefile.objs | 2 +-
>  hw/9pfs/Kconfig     | 5 +++++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Kconfig.host b/Kconfig.host
> index aec9536..bb6e116 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -28,6 +28,7 @@ config VHOST_USER
>  
>  config XEN
>      bool
> +    select FSDEV_9P if VIRTFS

There is something odd with CONFIG_XEN, as it is used
to select accelerator and hardware.

>  
>  config VIRTFS
>      bool
> diff --git a/fsdev/Makefile.objs b/fsdev/Makefile.objs
> index 24bbb3e..42cd70c 100644
> --- a/fsdev/Makefile.objs
> +++ b/fsdev/Makefile.objs
> @@ -1,6 +1,6 @@
>  # Lots of the fsdev/9pcode is pulled in by vl.c via qemu_fsdev_add.
>  # only pull in the actual 9p backend if we also enabled virtio or xen.
> -ifeq ($(call land,$(CONFIG_VIRTFS),$(call lor,$(CONFIG_VIRTIO_9P),$(CONFIG_XEN))),y)
> +ifeq ($(CONFIG_FSDEV_9P),y)
>  common-obj-y = qemu-fsdev.o 9p-marshal.o 9p-iov-marshal.o
>  else
>  common-obj-y = qemu-fsdev-dummy.o
> diff --git a/hw/9pfs/Kconfig b/hw/9pfs/Kconfig
> index 8c5032c..3ae5749 100644
> --- a/hw/9pfs/Kconfig
> +++ b/hw/9pfs/Kconfig
> @@ -1,4 +1,9 @@
> +config FSDEV_9P
> +    bool
> +    depends on VIRTFS

Using "depends on VIRTFS && 9PFS" instead helps to
reduce the link failure using --without-default-devices.

> +
>  config VIRTIO_9P
>      bool
>      default y
>      depends on VIRTFS && VIRTIO
> +    select FSDEV_9P

Here I used "depends on FSDEV_9P && VIRTIO" but this
doesn't look right...

Is it possible to include "config-devices.h" in
hw/xen/xen-legacy-backend.c to use CONFIG_9PFS?

xen_be_register_common() unconditionally calls:

  xen_be_register("9pfs", &xen_9pfs_ops);

As I have no much idea about Xen & 9pfs, I'm a bit
lost here (regarding the dependencies order).

Thanks,

Phil.



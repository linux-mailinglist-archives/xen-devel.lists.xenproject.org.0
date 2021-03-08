Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7B331105
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:39:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94991.179125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJH2A-0003UT-Js; Mon, 08 Mar 2021 14:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94991.179125; Mon, 08 Mar 2021 14:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJH2A-0003U4-Gm; Mon, 08 Mar 2021 14:38:58 +0000
Received: by outflank-mailman (input) for mailman id 94991;
 Mon, 08 Mar 2021 14:38:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Upu7=IG=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1lJH28-0003Tz-NC
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:38:56 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ab57b22d-2b0c-4f72-a3a5-64c2fcd9bdc9;
 Mon, 08 Mar 2021 14:38:54 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-J8rO8reKNguY5nF04Rh5Dw-1; Mon, 08 Mar 2021 09:38:52 -0500
Received: by mail-ej1-f72.google.com with SMTP id fy8so4143520ejb.19
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 06:38:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c20sm6718960eja.22.2021.03.08.06.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 06:38:50 -0800 (PST)
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
X-Inumbo-ID: ab57b22d-2b0c-4f72-a3a5-64c2fcd9bdc9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615214334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=59gGKL4Yyd65EMEKMhGO6s3r2bHBERkQMxkdw9kaBI4=;
	b=g2pLCzVjUhO9P7Sg2UcdaOyPoqPBm1lpVctvdIEzbUOED14sePum89sVBvt6mecPrMLQPt
	fljbfKMklUB+VOU5dYYqGARPagkcFYLGJP3/oB6PeETxyK9naWV9as9Q1KuGxsscy1xTXm
	j2AB5PJAWvm/4bPHwakWWMI48ZAEdKE=
X-MC-Unique: J8rO8reKNguY5nF04Rh5Dw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=59gGKL4Yyd65EMEKMhGO6s3r2bHBERkQMxkdw9kaBI4=;
        b=tJ9toFgG+1SKt+z5JVpNaeCflDPaTZ6xsF2uVyuyu7Ujbe67XKbosbroknaOkGyG89
         hhggXYfl9schB1csTSYuA209nIgSZxjTcJKwSfpZMXFTDuUiLbEv8N6+u9SpXNfv1GBQ
         3jW+fK6cOkpDz1g5eYKz6bbf/BZ55HTuY50E2L6tivGrmOAdVYXIzFiDQKeV3F9YfzJw
         x50vlEF3bhPB2VlmmEsB+YvDr5lF//9PmnV63U3SJt1pRpHDjnGbG5z42y6dfJ2zL1IX
         We1oO6FngznegVX2kxlIsfKf0+83Ic2ShnMwWxVO4+sicrh6zc1Ig01gUbBzw4PAyDW3
         Jojg==
X-Gm-Message-State: AOAM530qCs1GIwLRAov8V2RhxC5zl2Tdfp7iWJ8I8jAZHtmr0W4Wq2cG
	9C/ugQmXRywQDJGkHKkkaH6hASJWbGbkkesLgHPOmEuMKSpsecr5zMAH7ksuMsXZNZjsdwCBQCs
	0slHvLE+pov/PV+tj1ZFIGCJh/0Q=
X-Received: by 2002:a17:906:f88a:: with SMTP id lg10mr15549887ejb.39.1615214331591;
        Mon, 08 Mar 2021 06:38:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5EuiPpvju0xe6Z4a96WhY/O8sCqQp56NmC+fXqnSgrjpddxZVtGzgCVdSw/Cz84fx8yJhYQ==
X-Received: by 2002:a17:906:f88a:: with SMTP id lg10mr15549872ejb.39.1615214331436;
        Mon, 08 Mar 2021 06:38:51 -0800 (PST)
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org
References: <20210308143232.83388-1-anthony.perard@citrix.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
Date: Mon, 8 Mar 2021 15:38:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308143232.83388-1-anthony.perard@citrix.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/03/21 15:32, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Whenever a Xen block device is detach via xenstore, the image
> associated with it remained open by the backend QEMU and an error is
> logged:
>      qemu-system-i386: failed to destroy drive: Node xvdz-qcow2 is in use
> 
> This happened since object_unparent() doesn't immediately frees the
> object and thus keep a reference to the node we are trying to free.
> The reference is hold by the "drive" property and the call
> xen_block_drive_destroy() fails.
> 
> In order to fix that, we call drain_call_rcu() to run the callback
> setup by bus_remove_child() via object_unparent().
> 
> Fixes: 2d24a6466154 ("device-core: use RCU for list of children of a bus")
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> CCing people whom introduced/reviewed the change to use RCU to give
> them a chance to say if the change is fine.

If nothing else works then I guess it's okay, but why can't you do the 
xen_block_drive_destroy from e.g. an unrealize callback?

Paolo

> ---
>   hw/block/xen-block.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
> index a3b69e27096f..fe5f828e2d25 100644
> --- a/hw/block/xen-block.c
> +++ b/hw/block/xen-block.c
> @@ -972,6 +972,15 @@ static void xen_block_device_destroy(XenBackendInstance *backend,
>   
>       object_unparent(OBJECT(xendev));
>   
> +    /*
> +     * Drall all pending RCU callbacks as object_unparent() frees `xendev'
> +     * in a RCU callback.
> +     * And due to the property "drive" still existing in `xendev', we
> +     * cann't destroy the XenBlockDrive associated with `xendev' with
> +     * xen_block_drive_destroy() below.
> +     */
> +    drain_call_rcu();
> +
>       if (iothread) {
>           xen_block_iothread_destroy(iothread, errp);
>           if (*errp) {
> 



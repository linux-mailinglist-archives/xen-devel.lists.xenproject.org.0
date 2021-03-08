Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886083314FD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 18:38:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95044.179266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJJpD-00043U-7r; Mon, 08 Mar 2021 17:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95044.179266; Mon, 08 Mar 2021 17:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJJpD-000435-4f; Mon, 08 Mar 2021 17:37:47 +0000
Received: by outflank-mailman (input) for mailman id 95044;
 Mon, 08 Mar 2021 17:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Upu7=IG=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1lJJpB-000430-CV
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 17:37:45 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 50749cd7-21c1-4a59-9839-659a1d228950;
 Mon, 08 Mar 2021 17:37:43 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-9U2BNParM3Wj-_MSG6iQUw-1; Mon, 08 Mar 2021 12:37:41 -0500
Received: by mail-wr1-f69.google.com with SMTP id m9so5137951wrx.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 09:37:41 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x11sm48333wmi.3.2021.03.08.09.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 09:37:39 -0800 (PST)
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
X-Inumbo-ID: 50749cd7-21c1-4a59-9839-659a1d228950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615225063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p41WGjEacJEZdK8ZYq3XjUoXvCwhJJPKYlyQ0ak6UEc=;
	b=KYOFLG4Oyhxt5dXBslaNpPfqfEpNSYWHNcR07HE4ktorXNzCJ8Bc4qr5aPeQrVAv5PKxZq
	PYuPScG4zj6tCKfx6BJhci40H6FvwiRfcE2fShxz/tIsHu49kZYeuYFWKH1K+MAP8EIU/t
	XY62obogsq4qkFUm4A5yAhkoF7wV0q4=
X-MC-Unique: 9U2BNParM3Wj-_MSG6iQUw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p41WGjEacJEZdK8ZYq3XjUoXvCwhJJPKYlyQ0ak6UEc=;
        b=iNeqLjN1SJvuQRmU6yqGhieaTpsJYjC78B/hrsVFQujbfvWkOiDoq5AqEfeRwJJx0M
         QPwxx4uX4wD2byh/f4PNrN9vn8kvV1BCYKeoGQDflip8fMslGc9dt0hKMnT3NetGCza+
         eU2c7zRqiUn4f5SKtaSCBz4WiygmBJyXsYQl5JnTKIx8gs40LSOVEuUxoJgY/Lv6ll40
         T3h6Ck+bKkR0z9CBmfKyCr5qR1jJYK/lSTxO7sCPpdFpU6ENBJOylPIWBblpYZULQqhZ
         DMBItqudqpoqQQe7PsQ343f8q6WyrFIUle80CxprrDO2mRwUShHSo+qVdH1claqvcYPx
         bWbg==
X-Gm-Message-State: AOAM531hwinooBet/8zPFWSDO0tiK3VpiaM6sNAXmjjHnqTCzJLmlT7P
	9W+7Zf12Z/Nw7jJkah8+5P3PIYMB0fXB6fzhthfewKQUtSdpeCSqh4Wdyza9jaXctOoGDrYhMho
	adNdTdy1s0FSsXyPePTAZHulub4Y=
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr22293797wmc.89.1615225060145;
        Mon, 08 Mar 2021 09:37:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSmeB2dN1zdzZxpYGd58BfcLPchN7Pxl2J6J/U+2DLSVH+Yxp2L3UWoLJmud3lu/op6qFQJQ==
X-Received: by 2002:a1c:7ed4:: with SMTP id z203mr22293783wmc.89.1615225059934;
        Mon, 08 Mar 2021 09:37:39 -0800 (PST)
Subject: Re: [PATCH] xen-block: Fix removal of backend instance via xenstore
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org
References: <20210308143232.83388-1-anthony.perard@citrix.com>
 <c49581e6-6132-a4e2-9beb-a9948fc7ab25@redhat.com>
 <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
Date: Mon, 8 Mar 2021 18:37:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEZfBMrkJxfzmIuk@perard.uk.xensource.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/03/21 18:29, Anthony PERARD wrote:
>> If nothing else works then I guess it's okay, but why can't you do the
>> xen_block_drive_destroy from e.g. an unrealize callback?
> 
> I'm not sure if that's possible.
> 
> xen_block_device_create/xen_block_device_destroy() is supposed to be
> equivalent to do those qmp commands:
>      blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
>      device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2
> 
> But I tried to add a call xen_block_drive_destroy from
> xen_block_unrealize, but that still is called too early, it's called
> before object_property_del_all() which would delete "drive" and call
> release_drive() which would free the node.

Can you use blockdev_mark_auto_del?  Then you don't have to call 
xen_block_drive_destroy at all.

Paolo

> So, no, I don't think we can use an unrealized callback.
> 
> I though of trying to delete the "drive" property ahead of calling
> object_unparent() but I didn't figure out how to do so and it's maybe
> not possible.
> 
> So either drain_call_rcu or adding call_rcu(xen_block_drive_destroy)
> seems to be the way, but since xen_block_drive_destroy uses
> qmp_blockdev_del, it seems better to drain_call_rcu.
> 
> Cheers,
> 



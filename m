Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8C3315DA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 19:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95052.179290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJKXX-00005u-1Z; Mon, 08 Mar 2021 18:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95052.179290; Mon, 08 Mar 2021 18:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJKXW-00005U-UX; Mon, 08 Mar 2021 18:23:34 +0000
Received: by outflank-mailman (input) for mailman id 95052;
 Mon, 08 Mar 2021 18:23:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Upu7=IG=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1lJKXV-00005P-To
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 18:23:33 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.133.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d2521df5-4b15-4a73-b80d-b0efceb8fa6a;
 Mon, 08 Mar 2021 18:23:33 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-gJGXOK8xP6m9VaDO33iy0g-1; Mon, 08 Mar 2021 13:23:31 -0500
Received: by mail-ej1-f70.google.com with SMTP id en21so4467961ejc.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 10:23:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g20sm3594900edb.7.2021.03.08.10.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 10:23:29 -0800 (PST)
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
X-Inumbo-ID: d2521df5-4b15-4a73-b80d-b0efceb8fa6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615227812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+beV17USAk5/5BAoxZtz1DOIIiUvcI4Oae8+UMea5+Y=;
	b=SXfVnyXNQurjdL9o8vrkWOh1IFZikqhyvIIjQDTbUNCPO+gB+dG0XiLDeWe+IXjuw7YU76
	08jlsb6UXJHuU+MRZW603z+CzIzMyxPzBW75a/Oyv6CCPOLbxt+gOP7ijS1mLvKg2GdrBm
	Hm5MIwDd7JZS8RFTTvSbQTbi29j238E=
X-MC-Unique: gJGXOK8xP6m9VaDO33iy0g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+beV17USAk5/5BAoxZtz1DOIIiUvcI4Oae8+UMea5+Y=;
        b=nFGXaGFBXJm/VxxLHgmEnI6xA7Z1hij015Osnidqmyb0y2Rj4ert7i4qnkBFr81HUb
         +O4I6yscZ+1X9Xmx12YQ7esbtRCk8Q+sxHJVWqZPiTw/rr6MLI0tjw6cdOdsevwCKWgW
         ikBtiBCOAS5L8E0g55+ykWBy6Q5zRoIHWV6PgIOt/nPq6FLrO5H/1eHKIGuU6sQmpW7M
         W7+WxOaTLgDig/3W7bMuCmQbHHdkv6gv47enSRiWnDu/VZ9ShDwNjPFGfYrsADN6O7ub
         KdkYIYcMrvJgXvjFBJELA8mC8l8fr1JeWAt9uc4gdriLKSGigEo37MxXGUZ2Q472Vp6I
         3Z5g==
X-Gm-Message-State: AOAM5306F9H+jxBlN4Me6JRosT+DGvNg+0Oih9XGn/IClUcxwmbsPj4V
	TgIPqo0UKcOaxVglJK07Tf9IS30gd5XdPk73cpLIHFxc4jN362fcmBHzzIXZEKkR8JVinomDaHb
	mtrLN2tepONBwxGj6acTNzaXktpA=
X-Received: by 2002:a17:906:3496:: with SMTP id g22mr16772444ejb.143.1615227809929;
        Mon, 08 Mar 2021 10:23:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAKId/zSgJcT+DGItbtsG8E/vnOhHJ2ijozl9R/7jYQhXBSZmhKlFsHCkaz/FvrTyU93dWVA==
X-Received: by 2002:a17:906:3496:: with SMTP id g22mr16772416ejb.143.1615227809730;
        Mon, 08 Mar 2021 10:23:29 -0800 (PST)
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
 <b2e4ad7c-6688-f3be-b7d3-227c7c1359cb@redhat.com>
 <YEZpoHLsnp+xsGbR@perard.uk.xensource.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <59c6ca73-2f26-e0fa-8b17-a319b2cae8f9@redhat.com>
Date: Mon, 8 Mar 2021 19:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEZpoHLsnp+xsGbR@perard.uk.xensource.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/03/21 19:14, Anthony PERARD wrote:
> On Mon, Mar 08, 2021 at 06:37:38PM +0100, Paolo Bonzini wrote:
>> On 08/03/21 18:29, Anthony PERARD wrote:
>>>> If nothing else works then I guess it's okay, but why can't you do the
>>>> xen_block_drive_destroy from e.g. an unrealize callback?
>>>
>>> I'm not sure if that's possible.
>>>
>>> xen_block_device_create/xen_block_device_destroy() is supposed to be
>>> equivalent to do those qmp commands:
>>>       blockdev-add node-name=xvdz-qcow2 driver=qcow2 file={"driver":"file","filename":"disk.qcow2","locking":"off"}
>>>       device_add id=xvdz driver=xen-disk vdev=xvdz drive=xvdz-qcow2
>>>
>>> But I tried to add a call xen_block_drive_destroy from
>>> xen_block_unrealize, but that still is called too early, it's called
>>> before object_property_del_all() which would delete "drive" and call
>>> release_drive() which would free the node.
>>
>> Can you use blockdev_mark_auto_del?  Then you don't have to call
>> xen_block_drive_destroy at all.
> 
> There is no legacy_dinfo, so blockdev_mark_auto_del doesn't work.

Then I guess it's okay.  Perhaps you can rename the function to 
xen_block_blockdev_destroy so that it's clear it's a blockdev and no 
drive.  Thanks,

Paolo



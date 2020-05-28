Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3291E6E0B
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:46:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQLJ-0003iP-RZ; Thu, 28 May 2020 21:45:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HyPx=7K=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jeQLI-0003iK-Kt
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:45:36 +0000
X-Inumbo-ID: 90269c8e-a12c-11ea-9dbe-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 90269c8e-a12c-11ea-9dbe-bc764e2007e4;
 Thu, 28 May 2020 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590702335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kww8Kn7lt15WNtiBiHu7yq5dFmH5ZOSHRj6DUAGi/8=;
 b=DxGuYlkAf7Kwf31oRSntoY9i9vQTUBKuim33NSbUjvKjBninOUujUSS2kNGYXA35H7OGfZ
 s5qz+OTdOe0yMSkQo6QB61uI0dzemdzpV2ObkcA63ldoDyW2txEWaEJ8tD4qeg7KIF3AZD
 ItZ7BfRRTP+BUJXj+a8U2t/nvSgY0Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-eawdfFkvNqet1I0c3Ybv0Q-1; Thu, 28 May 2020 17:45:31 -0400
X-MC-Unique: eawdfFkvNqet1I0c3Ybv0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC4E118FF662;
 Thu, 28 May 2020 21:45:29 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9680D60C87;
 Thu, 28 May 2020 21:45:19 +0000 (UTC)
Subject: Re: [PATCH v7 4/8] qdev-properties: add size32 property type
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
 <20200528213946.1636444-5-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <78e3587a-efea-970a-b47e-8d187464d955@redhat.com>
Date: Thu, 28 May 2020 16:45:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528213946.1636444-5-rvkagan@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 xen-devel@lists.xenproject.org, John Snow <jsnow@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/28/20 4:39 PM, Roman Kagan wrote:
> Introduce size32 property type which handles size suffixes (k, m) just
> like size property, but is uint32_t rather than uint64_t.

Does it handle 'g' as well? (even though the set of valid 32-bit sizes 
with a g suffix is rather small ;)

>  It's going to
> be useful for properties that are byte sizes but are inherently 32bit,
> like BlkConf.opt_io_size or .discard_granularity (they are switched to
> this new property type in a followup commit).
> 
> The getter for size32 is left out for a separate patch as its benefit is
> less obvious, and it affects test output; for now the regular uint32
> getter is used.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>

> +static void set_size32(Object *obj, Visitor *v, const char *name, void *opaque,
> +                       Error **errp)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    Property *prop = opaque;
> +    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
> +    uint64_t value;
> +    Error *local_err = NULL;
> +
> +    if (dev->realized) {
> +        qdev_prop_set_after_realize(dev, name, errp);
> +        return;
> +    }
> +
> +    visit_type_size(v, name, &value, &local_err);

Yes, it does.

Whether or not the commit message is tweaked,
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



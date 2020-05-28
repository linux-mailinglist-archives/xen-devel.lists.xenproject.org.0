Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162361E6E26
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:54:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQSx-0004fj-Sy; Thu, 28 May 2020 21:53:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HyPx=7K=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jeQSw-0004fe-EY
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:53:30 +0000
X-Inumbo-ID: aaaedade-a12d-11ea-a843-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aaaedade-a12d-11ea-a843-12813bfff9fa;
 Thu, 28 May 2020 21:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590702809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GiVumsXOj6XnWRoyp7j8nZNDqWEQBH1FAMwCBk4UFKE=;
 b=BMY/AZcSltVKW5G3e7xjaLxRjPeODSZMEhl+0v2CR06asAF3ckI0cOPC6eQcVt8uoB4vFd
 4VKMGFSiw+gBRx7+dN6HNnmKJmp7khST9UvJRZkWPu5k3D3XJ7dTLWgEv99x0Q6cGm09vK
 A/gUVW1RrGtzZZhFpFF3UJk4LaZqNSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-e215EmtEMfO9UYzBHDxWlg-1; Thu, 28 May 2020 17:53:25 -0400
X-MC-Unique: e215EmtEMfO9UYzBHDxWlg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E8518FF661;
 Thu, 28 May 2020 21:53:23 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1ED5D9CD;
 Thu, 28 May 2020 21:53:14 +0000 (UTC)
Subject: Re: [PATCH v7 6/8] block: make BlockConf size props 32bit and accept
 size suffixes
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
 <20200528213946.1636444-7-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0439aa5e-413c-cf7e-83b7-1e942a882f5a@redhat.com>
Date: Thu, 28 May 2020 16:53:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528213946.1636444-7-rvkagan@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
> Convert all size-related properties in BlockConf to 32bit.  This will
> allow to accomodate bigger block sizes (in a followup patch).

s/allow to accomodate/accommodate/

> This also allows to make them all accept size suffixes, either via
> DEFINE_PROP_BLOCKSIZE or via DEFINE_PROP_SIZE32.
> 
> Also, since min_io_size is exposed to the guest by scsi and virtio-blk
> devices as an uint16_t in units of logical blocks, introduce an
> additional check in blkconf_blocksizes to prevent its silent truncation.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---

> +    if (conf->min_io_size / conf->logical_block_size > UINT16_MAX) {
> +        error_setg(errp,
> +                   "min_io_size must not exceed " stringify(UINT16_MAX)
> +                   " logical blocks");

On my libc, this results in "must not exceed (65535) logical blocks".

Worse, I could envision a platform where it prints something funky like:

"exceed (2 * (32768) + 1) logical", based on however complex the 
definition of UINT16_MAX is.  You're better off printing this one with 
%d than with stringify().

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



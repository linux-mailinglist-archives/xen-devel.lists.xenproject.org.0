Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CDA1E4667
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 16:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdxOR-0004bs-G5; Wed, 27 May 2020 14:50:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TPJL=7J=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1jdxOQ-0004bn-CU
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 14:50:54 +0000
X-Inumbo-ID: 76bc841a-a029-11ea-a75a-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 76bc841a-a029-11ea-a75a-12813bfff9fa;
 Wed, 27 May 2020 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590591053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jt2O02vs+NLP0r9p0Z1zjPBIZdH//DNFNRyNX/mabPM=;
 b=Q+3s8AaEYnDOTmOkL6G7LytzGrReFtkAYOQ6WPg7L7W5c0lHbNwK0DtQw10wLo7eYzQmUx
 3/XJjnWxZgnafDvjD31LbVeuTKqRK0jvQfvrZV36Xzwedu6rnvBxYVxnqCVAfDg1gocaK0
 VzR3FV0rwSSJQ3Iu1kU7c8cEvPsyDFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-Aj8ZSKYKNliX64OSfWTUIg-1; Wed, 27 May 2020 10:50:51 -0400
X-MC-Unique: Aj8ZSKYKNliX64OSfWTUIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFF17EC1B6;
 Wed, 27 May 2020 14:50:49 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1CD662932;
 Wed, 27 May 2020 14:50:40 +0000 (UTC)
Subject: Re: [PATCH v6 4/5] block: make size-related BlockConf properties
 accept size suffixes
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
 <20200527124511.986099-5-rvkagan@yandex-team.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d2ac3549-e63d-d737-41fa-21965c551175@redhat.com>
Date: Wed, 27 May 2020 09:50:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527124511.986099-5-rvkagan@yandex-team.ru>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 5/27/20 7:45 AM, Roman Kagan wrote:
> Several BlockConf properties represent respective sizes in bytes so it
> makes sense to accept size suffixes for them.
> 
> Turn them all into uint32_t and use size-suffix-capable setters/getters
> on them; introduce DEFINE_PROP_SIZE32 and adjust DEFINE_PROP_BLOCKSIZE
> for that. (Making them uint64_t and reusing DEFINE_PROP_SIZE isn't
> justified because guests expect at most 32bit values.)
> 
> Also, since min_io_size is exposed to the guest by scsi and virtio-blk
> devices as an uint16_t in units of logical blocks, introduce an
> additional check in blkconf_blocksizes to prevent its silent truncation.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
> v5 -> v6:
> - add prop_size32 instead of going with 64bit

Would it be worth adding prop_size32 as its own patch, before using it 
here?  But I'll review this as-is.

> +++ b/hw/block/block.c
> @@ -96,6 +96,17 @@ bool blkconf_blocksizes(BlockConf *conf, Error **errp)
>           return false;
>       }
>   
> +    /*
> +     * all devices which support min_io_size (scsi and virtio-blk) expose it to
> +     * the guest as a uint16_t in units of logical blocks
> +     */
> +    if (conf->min_io_size > conf->logical_block_size * UINT16_MAX) {

This risks overflow.  Better would be:

if (conf->min_io_size / conf->logical_block-size > UINT16_MAX)

> +        error_setg(errp,
> +                   "min_io_size must not exceed " stringify(UINT16_MAX)
> +                   " logical blocks");
> +        return false;
> +    }
> +
>       if (!QEMU_IS_ALIGNED(conf->opt_io_size, conf->logical_block_size)) {
>           error_setg(errp,
>                      "opt_io_size must be a multiple of logical_block_size");

> +++ b/tests/qemu-iotests/172.out
> @@ -24,11 +24,11 @@ Testing:
>                 dev: floppy, id ""
>                   unit = 0 (0x0)
>                   drive = "floppy0"
> -                logical_block_size = 512 (0x200)
> -                physical_block_size = 512 (0x200)
> -                min_io_size = 0 (0x0)
> -                opt_io_size = 0 (0x0)
> -                discard_granularity = 4294967295 (0xffffffff)
> +                logical_block_size = 512 (512 B)
> +                physical_block_size = 512 (512 B)
> +                min_io_size = 0 (0 B)
> +                opt_io_size = 0 (0 B)
> +                discard_granularity = 4294967295 (4 GiB)

Although 4 GiB is not quite the same as 4294967295, the exact byte value 
next to the approximate size is not too bad.  The mechanical fallout 
from the change from int to size is fine to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



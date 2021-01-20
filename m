Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F52FDB2B
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 21:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71770.128803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2KQ0-00080L-SM; Wed, 20 Jan 2021 20:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71770.128803; Wed, 20 Jan 2021 20:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2KQ0-0007zw-Os; Wed, 20 Jan 2021 20:49:32 +0000
Received: by outflank-mailman (input) for mailman id 71770;
 Wed, 20 Jan 2021 20:49:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KOuy=GX=redhat.com=eblake@srs-us1.protection.inumbo.net>)
 id 1l2KPz-0007zn-4G
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 20:49:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6d4376d4-45c4-41ea-906f-72fcfcb7da38;
 Wed, 20 Jan 2021 20:49:30 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-WbpvzPbVMw-q5r_TsagfXg-1; Wed, 20 Jan 2021 15:49:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1149107ACE3;
 Wed, 20 Jan 2021 20:49:24 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DD8DF19CB1;
 Wed, 20 Jan 2021 20:49:14 +0000 (UTC)
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
X-Inumbo-ID: 6d4376d4-45c4-41ea-906f-72fcfcb7da38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611175770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23A/75KbwZnsvqTRag47B6GWCzmLaeoYFCZRLMfkt3w=;
	b=KklzvvYONfIXgX19d68AxHswAc4+OnN1cJRmmg64W0PwM0+KaZUpBzjB4u82FUfgKhcuzk
	HnmYd73PzMYbMkLRb5PdfcNDUrog4Sc0OTUXsUrdQXkge0p/JBFx2OaOuCS/X8iPRumMou
	nIwzy0j3tQIwkrQfxDBnyX3CVgn7FxI=
X-MC-Unique: WbpvzPbVMw-q5r_TsagfXg-1
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini
 <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
References: <20201214170519.223781-1-slp@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 0/4] nbd/server: Quiesce coroutines on context switch
Message-ID: <cb4c9e40-065f-228b-b805-1ed10fd605a3@redhat.com>
Date: Wed, 20 Jan 2021 14:49:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201214170519.223781-1-slp@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/14/20 11:05 AM, Sergio Lopez wrote:
> This series allows the NBD server to properly switch between AIO contexts,
> having quiesced recv_coroutine and send_coroutine before doing the transition.
> 
> We need this because we send back devices running in IO Thread owned contexts
> to the main context when stopping the data plane, something that can happen
> multiple times during the lifetime of a VM (usually during the boot sequence or
> on a reboot), and we drag the NBD server of the correspoing export with it.
> 
> While there, fix also a problem caused by a cross-dependency between
> closing the export's client connections and draining the block
> layer. The visible effect of this problem was QEMU getting hung when
> the guest request a power off while there's an active NBD client.
> 
> v2:
>  - Replace "virtio-blk: Acquire context while switching them on
>  dataplane start" with "block: Honor blk_set_aio_context() context
>  requirements" (Kevin Wolf)
>  - Add "block: Avoid processing BDS twice in
>  bdrv_set_aio_context_ignore()"
>  - Add "block: Close block exports in two steps"
>  - Rename nbd_read_eof() to nbd_server_read_eof() (Eric Blake)
>  - Fix double space and typo in comment. (Eric Blake)

ping - where do we stand on this series?  Patches 1 and 3 have positive
reviews, I'll queue them now; patches 2 and 4 had enough comments that
I'm guessing I should wait for a v3?


> 
> Sergio Lopez (4):
>   block: Honor blk_set_aio_context() context requirements
>   block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
>   nbd/server: Quiesce coroutines on context switch
>   block: Close block exports in two steps
> 
>  block.c                         |  27 ++++++-
>  block/export/export.c           |  10 +--
>  blockdev-nbd.c                  |   2 +-
>  hw/block/dataplane/virtio-blk.c |   4 ++
>  hw/block/dataplane/xen-block.c  |   7 +-
>  hw/scsi/virtio-scsi.c           |   6 +-
>  include/block/export.h          |   4 +-
>  nbd/server.c                    | 120 ++++++++++++++++++++++++++++----
>  qemu-nbd.c                      |   2 +-
>  stubs/blk-exp-close-all.c       |   2 +-
>  10 files changed, 156 insertions(+), 28 deletions(-)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



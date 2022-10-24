Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FBA609F95
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428862.679440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvC4-0007F0-Ms; Mon, 24 Oct 2022 11:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428862.679440; Mon, 24 Oct 2022 11:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvC4-0007CC-Jc; Mon, 24 Oct 2022 11:00:32 +0000
Received: by outflank-mailman (input) for mailman id 428862;
 Mon, 24 Oct 2022 11:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hdrL=2Z=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1omvC3-0007BR-0E
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:00:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 124d8f53-538b-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 13:00:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-GfbhPK-tPGSU8XwydhnJrA-1; Mon, 24 Oct 2022 07:00:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBC3B3C0F222;
 Mon, 24 Oct 2022 11:00:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE56BC15BB2;
 Mon, 24 Oct 2022 11:00:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E471221E6936; Mon, 24 Oct 2022 13:00:19 +0200 (CEST)
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
X-Inumbo-ID: 124d8f53-538b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666609228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JNAZ05a51GbUnlYYzMLPhMzSa+J+jdwJlMxR4+x/+O8=;
	b=PDHjTCCSGYvoBvrqTqfOlOR7ol696wDd5z+617aoulP8x1ODC8iX7uWezuOGy65xLT/xf/
	jT9B7qj3JCxNL3AePRYBIWzLSwzWmyV8qiKvCh7rSfe0q48M6neuWqtcX3bz0quZpg0Zj8
	P8GnCUzN1xTpISrd9P1CgpjYX1YGo7Y=
X-MC-Unique: GfbhPK-tPGSU8XwydhnJrA-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Thomas Huth <thuth@redhat.com>,
  xen-devel@lists.xenproject.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Anthony Perard <anthony.perard@citrix.com>,
  Stefan Weil <sw@weilnetz.de>,  David Gibson
 <david@gibson.dropbear.id.au>,  Stefano Stabellini
 <sstabellini@kernel.org>,  Paul Durrant <paul@xen.org>,  Eric Blake
 <eblake@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Jason Wang
 <jasowang@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Samuel
 Thibault <samuel.thibault@ens-lyon.org>,  Greg Kurz <groug@kaod.org>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v14 17/17] net: stream: add QAPI events to report
 connection state
References: <20221021090922.170074-1-lvivier@redhat.com>
	<20221021090922.170074-18-lvivier@redhat.com>
Date: Mon, 24 Oct 2022 13:00:19 +0200
In-Reply-To: <20221021090922.170074-18-lvivier@redhat.com> (Laurent Vivier's
	message of "Fri, 21 Oct 2022 11:09:22 +0200")
Message-ID: <87sfjdsczg.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

Laurent Vivier <lvivier@redhat.com> writes:

> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>
> The NETDEV_STREAM_CONNECTED event includes the destination address.
>
> This allows a system manager like libvirt to detect when the server
> fails.
>
> For instance with passt:
>
> { 'execute': 'qmp_capabilities' }
> { "return": { } }
> { "timestamp": { "seconds": 1666341395, "microseconds": 505347 },
>     "event": "NETDEV_STREAM_CONNECTED",
>     "data": { "netdev-id": "netdev0",
>         "addr": { "path": "/tmp/passt_1.socket", "type": "unix" } } }
>
> [killing passt here]
>
> { "timestamp": { "seconds": 1666341430, "microseconds": 968694 },
>     "event": "NETDEV_STREAM_DISCONNECTED",
>     "data": { "netdev-id": "netdev0" } }
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B622560100F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 15:18:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424385.671759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okPzu-0005KM-Mw; Mon, 17 Oct 2022 13:17:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424385.671759; Mon, 17 Oct 2022 13:17:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okPzu-0005H3-Jx; Mon, 17 Oct 2022 13:17:38 +0000
Received: by outflank-mailman (input) for mailman id 424385;
 Mon, 17 Oct 2022 13:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9T87=2S=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1okPzs-0005Gx-N8
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 13:17:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f80445a-4e1e-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 15:17:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-HpNHLWnmNwKShTKTz4_PFg-1; Mon, 17 Oct 2022 09:17:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E49381C0E127;
 Mon, 17 Oct 2022 13:17:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79350200B419;
 Mon, 17 Oct 2022 13:17:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7030021E691D; Mon, 17 Oct 2022 15:17:27 +0200 (CEST)
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
X-Inumbo-ID: 0f80445a-4e1e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666012653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3Z5z6UTtIEHTPJFqUwyOpIjWsyYay3MJKRhggMStCI=;
	b=OtXxely8IWj7p1HMu66Jvhpo7ShpZrIfWlHw7gxG2ZHfeiwj68T4vUWxAZSa5+pqp01yTV
	seqSxMc0N0XKD4adXSzU8NdnqZ5d9kSmNXjn3m4kWL22VpmGExhQSWQjblyUiJP3yZJQ+P
	dTiIvfG7NJ8OVaoITBG3kx2iyE/wnV8=
X-MC-Unique: HpNHLWnmNwKShTKTz4_PFg-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Stefano Stabellini <sstabellini@kernel.org>,
  Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David
 Alan Gilbert"
 <dgilbert@redhat.com>,  Jason Wang <jasowang@redhat.com>,  "Michael S.
 Tsirkin" <mst@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Anthony
 Perard <anthony.perard@citrix.com>,  Greg Kurz <groug@kaod.org>,  Eric
 Blake <eblake@redhat.com>,  Stefan Weil <sw@weilnetz.de>,  Thomas Huth
 <thuth@redhat.com>,  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Paul
 Durrant <paul@xen.org>,  David Gibson <david@gibson.dropbear.id.au>,
  xen-devel@lists.xenproject.org,  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v11 09/17] net: stream: add unix socket
References: <20221011200539.1486809-1-lvivier@redhat.com>
	<20221011200539.1486809-10-lvivier@redhat.com>
Date: Mon, 17 Oct 2022 15:17:27 +0200
In-Reply-To: <20221011200539.1486809-10-lvivier@redhat.com> (Laurent Vivier's
	message of "Tue, 11 Oct 2022 22:05:31 +0200")
Message-ID: <87v8oi4mjc.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

Laurent Vivier <lvivier@redhat.com> writes:

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>



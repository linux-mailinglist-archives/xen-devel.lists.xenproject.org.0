Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC63601018
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 15:19:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424391.671770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQ1D-0005uo-4z; Mon, 17 Oct 2022 13:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424391.671770; Mon, 17 Oct 2022 13:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okQ1D-0005t1-27; Mon, 17 Oct 2022 13:18:59 +0000
Received: by outflank-mailman (input) for mailman id 424391;
 Mon, 17 Oct 2022 13:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9T87=2S=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1okQ1B-0005st-Cx
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 13:18:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0a8bf9-4e1e-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 15:18:47 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-ssZCpTwiOh-ZqUAIGcsi1g-1; Mon, 17 Oct 2022 09:18:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D918832D9B;
 Mon, 17 Oct 2022 13:18:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04FB91468226;
 Mon, 17 Oct 2022 13:18:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1BF621E691D; Mon, 17 Oct 2022 15:18:19 +0200 (CEST)
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
X-Inumbo-ID: 3b0a8bf9-4e1e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666012735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fv+H1HfBuuaSSU9ZqnF7RzUaR12fVhwYkvfJvFZE4jo=;
	b=IVCnZ3AbJh9UP//5w/VAuclTIXvngx28mAbBPGLky89iPUGpRG2BD8YIF5/6KSVI6yl8rA
	/Fv1xMCEvqDM55u/f8M8cXPlxPusv4sPEuVJe0K5sQpkEr+jH2atsYSA+5Hc4MK2I+2/6H
	6FRCat7aORi/eDYMmmfptVBZJbNIy6o=
X-MC-Unique: ssZCpTwiOh-ZqUAIGcsi1g-1
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
Subject: Re: [PATCH v11 12/17] net: dgram: add unix socket
References: <20221011200539.1486809-1-lvivier@redhat.com>
	<20221011200539.1486809-13-lvivier@redhat.com>
Date: Mon, 17 Oct 2022 15:18:19 +0200
In-Reply-To: <20221011200539.1486809-13-lvivier@redhat.com> (Laurent Vivier's
	message of "Tue, 11 Oct 2022 22:05:34 +0200")
Message-ID: <87r0z64mhw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Laurent Vivier <lvivier@redhat.com> writes:

> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>



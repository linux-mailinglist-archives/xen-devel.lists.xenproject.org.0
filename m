Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52188607051
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 08:47:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427349.676302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollo6-0005w0-IR; Fri, 21 Oct 2022 06:47:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427349.676302; Fri, 21 Oct 2022 06:47:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollo6-0005sp-DR; Fri, 21 Oct 2022 06:47:02 +0000
Received: by outflank-mailman (input) for mailman id 427349;
 Fri, 21 Oct 2022 06:47:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i13X=2W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1ollo4-0005rC-P4
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 06:47:00 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 284c7fd4-510c-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 08:46:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-excxtAtJM-aWvuXQ-q56Cw-1; Fri, 21 Oct 2022 02:46:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC8168688D1;
 Fri, 21 Oct 2022 06:46:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 848D31759E;
 Fri, 21 Oct 2022 06:46:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73EDE21E6686; Fri, 21 Oct 2022 08:46:51 +0200 (CEST)
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
X-Inumbo-ID: 284c7fd4-510c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666334817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jpXOT60aSEVePNxPzhS7Cx5BChB4JcWs66WBHAn2u+s=;
	b=H4YF/HSnqa5ksNrXdejw5usaNF0Eu4tic502FgdpPFYZEXHnkErYebOC3woRCdcGBu1qzc
	5K/uc3upd4KKLelk+RKV5Wx7/K5z/7xRJ0eFIR2jBvdiowCBXSKaJOZzQCsTDFpSYxGHs5
	JilQ5nGen7vzVAHXTC6LKoUNsjIx7+o=
X-MC-Unique: excxtAtJM-aWvuXQ-q56Cw-1
From: Markus Armbruster <armbru@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,  qemu-devel@nongnu.org,  Paul
 Durrant <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  David Gibson <david@gibson.dropbear.id.au>,
  Eric Blake <eblake@redhat.com>,  xen-devel@lists.xenproject.org,
  "Michael S. Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
  Paolo Bonzini <pbonzini@redhat.com>,  Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>,  Ralph Schmieder <ralph.schmieder@gmail.com>,
  Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v13 00/17] qapi: net: add unix socket type support to
 netdev backend
References: <20221020162558.123284-1-lvivier@redhat.com>
	<CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
Date: Fri, 21 Oct 2022 08:46:51 +0200
In-Reply-To: <CACGkMEt9Hoo=GAuCUqMcBjqNvs94fEPA_GU9Z7TOh8c7Wam55Q@mail.gmail.com>
	(Jason Wang's message of "Fri, 21 Oct 2022 13:49:05 +0800")
Message-ID: <87h6zx4qsk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

Jason Wang <jasowang@redhat.com> writes:

> I've queued this version and will send pull requests shortly.
>
> Any future comment we can do patches on top.

Please give Laurent and me a few hours to try to improve PATCH 17's
commit message.  Which you could then integrate without a respin.



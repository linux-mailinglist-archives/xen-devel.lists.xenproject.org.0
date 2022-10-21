Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C10D6073A7
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:13:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427450.676515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olo4t-0004NZ-GJ; Fri, 21 Oct 2022 09:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427450.676515; Fri, 21 Oct 2022 09:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olo4t-0004KW-D5; Fri, 21 Oct 2022 09:12:31 +0000
Received: by outflank-mailman (input) for mailman id 427450;
 Fri, 21 Oct 2022 09:12:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=i13X=2W=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1olo4r-0004KQ-QC
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:12:29 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58245798-5120-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 11:11:28 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-qEtzvub4OaazuZhJHrPKIQ-1; Fri, 21 Oct 2022 05:12:22 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34F27101A52A;
 Fri, 21 Oct 2022 09:12:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D804A40E9783;
 Fri, 21 Oct 2022 09:12:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5CC921E675B; Fri, 21 Oct 2022 11:12:20 +0200 (CEST)
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
X-Inumbo-ID: 58245798-5120-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666343547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qreRhXMURe1cGQAjM1jaeJIUg5mfmfbyjf20udgeVoY=;
	b=UZeSQTGXSbO62oZ5aXW86ELelgqf9/aT+9vue5dvE+PYTGje18NyCrxZ6T0ITcUVugyupI
	fb3C5ib59jRzmDsdES1h9Mo8sOdhDTghBAx4VB0Z6za0fHps7jKI6AVI+x1HR++Btzg7po
	1dL8NAjunRKxqkmJKV950io5n6nu8Z4=
X-MC-Unique: qEtzvub4OaazuZhJHrPKIQ-1
From: Markus Armbruster <armbru@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org,  Paul Durrant <paul@xen.org>,  Thomas Huth
 <thuth@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano
 Stabellini <sstabellini@kernel.org>,  David Gibson
 <david@gibson.dropbear.id.au>,  Eric Blake <eblake@redhat.com>,
  xen-devel@lists.xenproject.org,  "Michael S. Tsirkin" <mst@redhat.com>,
  Stefan Weil <sw@weilnetz.de>,  Paolo Bonzini <pbonzini@redhat.com>,
  Jason Wang <jasowang@redhat.com>,  Samuel Thibault
 <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>, Stefano Brivio <sbrivio@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
	<87pmel4th4.fsf@pond.sub.org>
	<52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
Date: Fri, 21 Oct 2022 11:12:20 +0200
In-Reply-To: <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com> (Laurent
	Vivier's message of "Fri, 21 Oct 2022 10:13:59 +0200")
Message-ID: <87lep935hn.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

Cc: Stefano Brivio

Laurent Vivier <lvivier@redhat.com> writes:

> On 10/21/22 07:48, Markus Armbruster wrote:
>> Laurent Vivier <lvivier@redhat.com> writes:
>> 
>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>
>> Use cases?
>
> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.

Let's add something like this to the commit message:

    This lets libvirt notice when the connection is lost somehow, and
    restart the peer (such as passt).

Who's working on the libvirt part?

> I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.

It's okay to mention future work in commit messages, but not required.

>> Could similar event signalling be useful for other kinds of netdev
>> backends?
>
> I was wondering, but it becomes more complicated to be generic.

Making something complicated and generic where a simpler special
solution would do is the worst.

Not quite as bad (but still plenty bad) is making a few special
solutions first, then replace them all with a generic solution.

I believe we should have a good, hard think on possible applications of
a generic solution now.

There is no need to hold back this series for that.

If we conclude a generic solution is called for, we better replace this
special solution before it becomes ABI.  Either by replacing it before
we release it, or by keeping it unstable until we replace it.



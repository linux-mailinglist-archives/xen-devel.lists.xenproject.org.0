Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A10609F96
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 13:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428861.679429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvC0-0006xp-Dt; Mon, 24 Oct 2022 11:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428861.679429; Mon, 24 Oct 2022 11:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omvC0-0006vx-An; Mon, 24 Oct 2022 11:00:28 +0000
Received: by outflank-mailman (input) for mailman id 428861;
 Mon, 24 Oct 2022 11:00:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hdrL=2Z=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1omvBy-0006vr-8t
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 11:00:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f044e2c-538b-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 13:00:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-Qtw4snbNPCawDnP8qruIEA-1; Mon, 24 Oct 2022 07:00:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69972299E759;
 Mon, 24 Oct 2022 11:00:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6B2440C2064;
 Mon, 24 Oct 2022 11:00:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DEAAD21E6936; Mon, 24 Oct 2022 13:00:09 +0200 (CEST)
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
X-Inumbo-ID: 0f044e2c-538b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666609223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JPt5T8Uiv1CdWndjYYsC1Y8mTRQPX3OEHe0yHwxlQJc=;
	b=QXomIgjjRwKbLy3km5dpd9tMbrmH2ExUd65ixbtTCqHm7Yi7MFKSbC529LPFE/SnnkTH7/
	XKrcmjFWYlw7C1Wv87lcjKUpLiRYbygW6mUt4m32YnZtgh7aMtlnEE0+ECRntM0v08Ma1S
	Mp4oiKduukhbGC8HRQiMvR7hUpX3FVM=
X-MC-Unique: Qtw4snbNPCawDnP8qruIEA-1
From: Markus Armbruster <armbru@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>,  qemu-devel@nongnu.org,  Paul
 Durrant <paul@xen.org>,  Thomas Huth <thuth@redhat.com>,  Daniel P.
 =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Greg Kurz <groug@kaod.org>,  Stefano Stabellini
 <sstabellini@kernel.org>,  David Gibson <david@gibson.dropbear.id.au>,
  Eric Blake <eblake@redhat.com>,  xen-devel@lists.xenproject.org,
  "Michael S. Tsirkin" <mst@redhat.com>,  Stefan Weil <sw@weilnetz.de>,
  Paolo Bonzini <pbonzini@redhat.com>,  Jason Wang <jasowang@redhat.com>,
  Samuel Thibault <samuel.thibault@ens-lyon.org>,  Anthony Perard
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
	<87pmel4th4.fsf@pond.sub.org>
	<52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
	<87lep935hn.fsf@pond.sub.org>
Date: Mon, 24 Oct 2022 13:00:09 +0200
In-Reply-To: <87lep935hn.fsf@pond.sub.org> (Markus Armbruster's message of
	"Fri, 21 Oct 2022 11:12:20 +0200")
Message-ID: <87tu3tsczq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Markus Armbruster <armbru@redhat.com> writes:

> Cc: Stefano Brivio
>
> Laurent Vivier <lvivier@redhat.com> writes:
>
>> On 10/21/22 07:48, Markus Armbruster wrote:
>>> Laurent Vivier <lvivier@redhat.com> writes:
>>> 
>>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
>>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
>>>
>>> Use cases?
>>
>> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.

[...]

>>> Could similar event signalling be useful for other kinds of netdev
>>> backends?
>>
>> I was wondering, but it becomes more complicated to be generic.
>
> Making something complicated and generic where a simpler special
> solution would do is the worst.
>
> Not quite as bad (but still plenty bad) is making a few special
> solutions first, then replace them all with a generic solution.
>
> I believe we should have a good, hard think on possible applications of
> a generic solution now.
>
> There is no need to hold back this series for that.
>
> If we conclude a generic solution is called for, we better replace this
> special solution before it becomes ABI.  Either by replacing it before
> we release it, or by keeping it unstable until we replace it.

Stefano, any thoughts on this?



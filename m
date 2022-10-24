Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FC60A400
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 14:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429050.679825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwCV-0008Pp-FG; Mon, 24 Oct 2022 12:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429050.679825; Mon, 24 Oct 2022 12:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwCV-0008NI-BB; Mon, 24 Oct 2022 12:05:03 +0000
Received: by outflank-mailman (input) for mailman id 429050;
 Mon, 24 Oct 2022 12:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=diCp=2Z=redhat.com=sbrivio@srs-se1.protection.inumbo.net>)
 id 1omwCU-0008Ms-4w
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 12:05:02 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14f86b15-5394-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 14:05:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-5LUlF93eMRuhxrfgfGRSFA-1; Mon, 24 Oct 2022 08:04:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA3E8065E8;
 Mon, 24 Oct 2022 12:04:54 +0000 (UTC)
Received: from maya.cloud.tilaa.com (ovpn-208-31.brq.redhat.com [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E5E200C0DA;
 Mon, 24 Oct 2022 12:04:53 +0000 (UTC)
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
X-Inumbo-ID: 14f86b15-5394-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666613098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TN68KVpvR7XKYr0YdRyHBatb1VXNIh4kpbgamAYS4Zw=;
	b=hyZe1oIm3GjMDbconZbQuNvnE7S3VewWsWXE8LPa1aMmc7HhV6BY86waaT7IuTbbI7d4o0
	HiGDli3zlqjBck0QUGOCNis1vU8CQmMOabKNkdnwdwqoGiQA5CqI6OAjutvBxcAZ0JzU1/
	5Om6uNMwEIqkmLRNU06lhFvIAgInOFE=
X-MC-Unique: 5LUlF93eMRuhxrfgfGRSFA-1
Date: Mon, 24 Oct 2022 14:04:31 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, Paul Durrant
 <paul@xen.org>, Thomas Huth <thuth@redhat.com>, "Daniel P. =?UTF-8?B?QmVy?=
 =?UTF-8?B?cmFuZ8Op?=" <berrange@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, Stefano Stabellini
 <sstabellini@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, Eric
 Blake <eblake@redhat.com>, xen-devel@lists.xenproject.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Anthony Perard <anthony.perard@citrix.com>,
 Laine Stump <laine@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
Message-ID: <20221024140431.2e93dd2b@elisabeth>
In-Reply-To: <87tu3tsczq.fsf@pond.sub.org>
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
	<87pmel4th4.fsf@pond.sub.org>
	<52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
	<87lep935hn.fsf@pond.sub.org>
	<87tu3tsczq.fsf@pond.sub.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4

On Mon, 24 Oct 2022 13:00:09 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Cc: Stefano Brivio
> >
> > Laurent Vivier <lvivier@redhat.com> writes:
> >  
> >> On 10/21/22 07:48, Markus Armbruster wrote:  
> >>> Laurent Vivier <lvivier@redhat.com> writes:
> >>>   
> >>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> >>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.  
> >>>
> >>> Use cases?  
> >>
> >> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.  
> 
> [...]
> 
> >>> Could similar event signalling be useful for other kinds of netdev
> >>> backends?  
> >>
> >> I was wondering, but it becomes more complicated to be generic.  
> >
> > Making something complicated and generic where a simpler special
> > solution would do is the worst.
> >
> > Not quite as bad (but still plenty bad) is making a few special
> > solutions first, then replace them all with a generic solution.
> >
> > I believe we should have a good, hard think on possible applications of
> > a generic solution now.
> >
> > There is no need to hold back this series for that.
> >
> > If we conclude a generic solution is called for, we better replace this
> > special solution before it becomes ABI.  Either by replacing it before
> > we release it, or by keeping it unstable until we replace it.  
> 
> Stefano, any thoughts on this?

Actually, to me, it already looks as generic as it can be: stream
back-ends are the only ones connecting and disconnecting.

I quickly tried to think about possible, similar events for other
back-ends:

- user: handled by libslirp, there's no connection, and probably not
  much we can or want to export from libslirp itself

- tap, bridge: the closest equivalent would be interfaces changing
  states, but that's something that's also externally observable with a
  netlink socket, in case one needs to know. And in any case, it's
  logically very different from a connection or disconnection. If we
  want events for that, they should have different names

- vhost-user, vde: we could implement something similar if the need
  arises, but it should logically have a different name

- l2tpv3: stateless, same as datagram-oriented socket. No states, no
  events to report, I guess.

All in all, to me, NETDEV_STREAM_{,DIS}CONNECTED events here don't look
very "special" or hackish.

-- 
Stefano



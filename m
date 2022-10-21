Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9D60745B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 11:42:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427505.676635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloY7-0004DD-Bk; Fri, 21 Oct 2022 09:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427505.676635; Fri, 21 Oct 2022 09:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oloY7-0004Ah-92; Fri, 21 Oct 2022 09:42:43 +0000
Received: by outflank-mailman (input) for mailman id 427505;
 Fri, 21 Oct 2022 09:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xpxf=2W=redhat.com=sbrivio@srs-se1.protection.inumbo.net>)
 id 1oloXV-00040x-5B
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 09:42:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e48a4f8-5124-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 11:42:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-r7AfPqY6NQ-Q2yMecedJPg-1; Fri, 21 Oct 2022 05:41:58 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DF2B857F92;
 Fri, 21 Oct 2022 09:41:47 +0000 (UTC)
Received: from maya.cloud.tilaa.com (ovpn-208-31.brq.redhat.com [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A586141C6A9;
 Fri, 21 Oct 2022 09:41:38 +0000 (UTC)
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
X-Inumbo-ID: 9e48a4f8-5124-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666345323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HWFs6Ey6gOSX0j5UiIYZMTxWGzZHU1ACMbPbsoVaxIc=;
	b=OCRTGITt+SQ+zzpk8fS2zJCWgieFKncyz/gdi30WlZ+hzZE2ptMznhcQ7Q/WTVtDpIWdX2
	AGERqAFeP1cojD4AhOanljCHOl1gYJn63BNM07mallsLjN0DIjWHvD36y2wKFw1LkbEqtP
	PYK88piWCL0bRpWG9zi0kqDzoPwDfmc=
X-MC-Unique: r7AfPqY6NQ-Q2yMecedJPg-1
Date: Fri, 21 Oct 2022 11:40:52 +0200
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
Message-ID: <20221021114052.339f6aac@elisabeth>
In-Reply-To: <87lep935hn.fsf@pond.sub.org>
References: <20221020162558.123284-1-lvivier@redhat.com>
	<20221020162558.123284-18-lvivier@redhat.com>
	<87pmel4th4.fsf@pond.sub.org>
	<52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
	<87lep935hn.fsf@pond.sub.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

[Cc: Laine, full quote]

On Fri, 21 Oct 2022 11:12:20 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Cc: Stefano Brivio
> 
> Laurent Vivier <lvivier@redhat.com> writes:
> 
> > On 10/21/22 07:48, Markus Armbruster wrote:  
> >> Laurent Vivier <lvivier@redhat.com> writes:
> >>   
> >>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> >>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.  
> >>
> >> Use cases?  
> >
> > This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.  
> 
> Let's add something like this to the commit message:
> 
>     This lets libvirt notice when the connection is lost somehow, and
>     restart the peer (such as passt).
> 
> Who's working on the libvirt part?

Laine Stump and myself. Nothing to show yet, though.

> > I have also a patch to add a "reconnect=seconds" option, but I didn't want to add it to this series.  
> 
> It's okay to mention future work in commit messages, but not required.
> 
> >> Could similar event signalling be useful for other kinds of netdev
> >> backends?  
> >
> > I was wondering, but it becomes more complicated to be generic.  
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

-- 
Stefano



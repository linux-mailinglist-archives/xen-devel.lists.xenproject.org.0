Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB01F8D43
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 07:23:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkhYs-00043z-6s; Mon, 15 Jun 2020 05:21:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ng+7=74=redhat.com=armbru@srs-us1.protection.inumbo.net>)
 id 1jkhYq-00043u-NR
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 05:21:33 +0000
X-Inumbo-ID: 12cdcb96-aec8-11ea-b7b9-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 12cdcb96-aec8-11ea-b7b9-12813bfff9fa;
 Mon, 15 Jun 2020 05:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592198491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TOLcTSyAqQQu+LEbnmAy815PLwjKRhXBvQKM61rDIfM=;
 b=SxpYU3Ow8JIDCMga+cxrNlWGKBxEE3mGI9LKoJ12gpRlQM/WkK3qOuk+aSlaYEvBP5emms
 k1xf3gxn6C4TBnwvh9l+OQXysPakNc8ZQl50q5z8F24s8FdBgcsX5ox65iQbbpjAKn5x5P
 L3zrp3XlRs7ib8Cw0cnRdXvgCsLDllg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-bpTLcet6MtSykvWU2_4eNQ-1; Mon, 15 Jun 2020 01:21:19 -0400
X-MC-Unique: bpTLcet6MtSykvWU2_4eNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E57C80B73B;
 Mon, 15 Jun 2020 05:21:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 550477B91C;
 Mon, 15 Jun 2020 05:21:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C745D1138648; Mon, 15 Jun 2020 07:21:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v10 1/9] error: auto propagated local_err
References: <20200317151625.20797-1-vsementsov@virtuozzo.com>
 <20200317151625.20797-2-vsementsov@virtuozzo.com>
 <20200610163921.28d824aa@bahia.lan>
Date: Mon, 15 Jun 2020 07:21:03 +0200
In-Reply-To: <20200610163921.28d824aa@bahia.lan> (Greg Kurz's message of "Wed, 
 10 Jun 2020 16:39:21 +0200")
Message-ID: <877dw8dhvk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, armbru@redhat.com,
 qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Max Reitz <mreitz@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Greg Kurz <groug@kaod.org> writes:

> On Tue, 17 Mar 2020 18:16:17 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:
>
>> Introduce a new ERRP_AUTO_PROPAGATE macro, to be used at start of
>> functions with an errp OUT parameter.
>> 
>> It has three goals:
>> 
>> 1. Fix issue with error_fatal and error_prepend/error_append_hint: user
>> can't see this additional information, because exit() happens in
>> error_setg earlier than information is added. [Reported by Greg Kurz]
>> 
>
> I have more of these coming and I'd really like to use ERRP_AUTO_PROPAGATE.
>
> It seems we have a consensus on the macro itself but this series is gated
> by the conversion of the existing code base.
>
> What about merging this patch separately so that people can start using
> it at least ?

Please give me a few more days to finish the work I feel should go in
before the conversion.  With any luck, Vladimir can then rebase /
recreate the conversion easily, and you can finally use the macro for
your own work.



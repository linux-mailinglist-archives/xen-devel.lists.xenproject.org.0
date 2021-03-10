Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1981333DDF
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 14:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96060.181528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJyu5-0003IB-OT; Wed, 10 Mar 2021 13:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96060.181528; Wed, 10 Mar 2021 13:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJyu5-0003Hm-Kt; Wed, 10 Mar 2021 13:29:33 +0000
Received: by outflank-mailman (input) for mailman id 96060;
 Wed, 10 Mar 2021 13:29:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v3TM=II=redhat.com=kraxel@srs-us1.protection.inumbo.net>)
 id 1lJyu3-0003HV-Nb
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 13:29:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4b0afa24-8af7-415b-ab02-b21d7528ff3a;
 Wed, 10 Mar 2021 13:29:31 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Dot55fPuPren7dHkeTzhxQ-1; Wed, 10 Mar 2021 08:29:27 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA0FB57;
 Wed, 10 Mar 2021 13:29:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FE565C648;
 Wed, 10 Mar 2021 13:29:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8741F18000AC; Wed, 10 Mar 2021 14:29:20 +0100 (CET)
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
X-Inumbo-ID: 4b0afa24-8af7-415b-ab02-b21d7528ff3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615382971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ScCgNxIqd6sDHI2X3m9zVzuFaT/EbwN3SJtZcuNZOs=;
	b=NglhDWUSJrq9TsrtcgHY7P6+KI+gjn10vZK4KsLHq/XHbBpScJ/jwybjhFclXOZBnkSRdF
	6a/MvPjOOKwLDe41XeGcqjZYMLymQ9AmbFVvIsbEeHwJqTBXX3S3sqiJ88/nF3HU0MI47R
	0zzK8+RN0tJRtnw9IKrNTXu8aIk9T5A=
X-MC-Unique: Dot55fPuPren7dHkeTzhxQ-1
Date: Wed, 10 Mar 2021 14:29:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 2/2] virtio-gpu: Respect UI refresh rate for EDID
Message-ID: <20210310132920.6rv5f62ineowzscq@sirius.home.kraxel.org>
References: <20210303152948.59943-1-akihiko.odaki@gmail.com>
 <20210303152948.59943-2-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210303152948.59943-2-akihiko.odaki@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

  Hi,

> -static void xenfb_update_interval(void *opaque, uint64_t interval)
> +static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)

> -    .update_interval = xenfb_update_interval,
> +    .ui_info     = xenfb_ui_info,

Hmm, I suspect xenfb really wants the actual refresh rate, even in case
vnc/sdl change it dynamically.  Anthony?  Stefano?

I guess we should just leave the update_interval callback as-is, for
those who want know, and use ui_info->refresh_rate for the virtual edid
refresh rate (which may not match the actual update interval in case of
dynamic changes).  Adding a comment explaining the difference to
console.h is a good idea too.

Otherwise looks good to me overall.  Splitting the ui/gtk update to a
separate patch is probably a good idea.

take care,
  Gerd



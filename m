Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3D687876
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 10:11:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488619.756770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVcA-0001Wn-Jn; Thu, 02 Feb 2023 09:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488619.756770; Thu, 02 Feb 2023 09:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVcA-0001Uo-Gy; Thu, 02 Feb 2023 09:10:42 +0000
Received: by outflank-mailman (input) for mailman id 488619;
 Thu, 02 Feb 2023 09:10:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=230/=56=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1pNVc9-0001Ui-0j
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 09:10:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72f4c341-a2d9-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 10:10:35 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-3wgXyEPcNUqvvKI41lMPKQ-1; Thu, 02 Feb 2023 04:10:33 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 742D0183B3C6;
 Thu,  2 Feb 2023 09:10:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 388DB112132C;
 Thu,  2 Feb 2023 09:10:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 987DB180061B; Thu,  2 Feb 2023 10:10:31 +0100 (CET)
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
X-Inumbo-ID: 72f4c341-a2d9-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675329035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oInIPsGtgF1SdUE94O8ESsQmc4oBdOS27jmpiGR5HWs=;
	b=YSR2sjcK4ZxLucgdHowxm4cHqQOeNeI/32yI3ZuOjtWbvuvKpbzKZDW5EmNsYrW/OykgqT
	KvqUNppGq4BXuTH8TKcV6L8pP6EEQ9h8SC15lCRyxl3E9h+Pw6D/9G8B8RXClr0EImzt2X
	vHSh0P+AeusPDwD4X/IAYg99xGAWeL0=
X-MC-Unique: 3wgXyEPcNUqvvKI41lMPKQ-1
Date: Thu, 2 Feb 2023 10:10:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kevin O'Connor <kevin@koconnor.net>, seabios <seabios@seabios.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	qemu-devel <qemu-devel@nongnu.org>, paul <paul@xen.org>
Subject: Re: [SeaBIOS] Re: [SeaBIOS PATCH] xen: require Xen info structure at
 0x1000 to detect Xen
Message-ID: <20230202091031.xmnao56wziptjak2@sirius.home.kraxel.org>
References: <feef99dd2e1a5dce004d22baf07d716d6ea1344c.camel@infradead.org>
 <Y9scWQ/ASMCrY/uM@morn>
 <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd3259a2765d4b33ccf7baea320ac798bab63159.camel@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3

> Thanks, Kevin.
> 
> I'd like to get the rest of the Xen platform support in to qemu 8.0 if
> possible. Which is currently scheduled for March.
> 
> Is there likely to be a SeaBIOS release before then which Gerd would
> pull into qemu anyway, or should I submit a submodule update to a
> snapshot of today's tree? That would just pull in this commit, and the
> one other fix that's in the SeaBIOS tree since 1.16.1?

Tagging 1.16.2 in time for the qemu 8.0 should not be a problem given
that we have only bugfixes in master.  Roughly around soft freeze is
probably a good time for that.

take care,
  Gerd



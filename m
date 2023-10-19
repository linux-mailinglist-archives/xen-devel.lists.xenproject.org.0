Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D47CF693
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619219.963943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtR62-0006vw-U3; Thu, 19 Oct 2023 11:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619219.963943; Thu, 19 Oct 2023 11:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtR62-0006sd-Qy; Thu, 19 Oct 2023 11:21:46 +0000
Received: by outflank-mailman (input) for mailman id 619219;
 Thu, 19 Oct 2023 11:21:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Bpc=GB=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1qtR62-0006sX-2d
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:21:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aec5532b-6e71-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 13:21:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-SK7vo6K2NX2TQ2jYrduzJQ-1; Thu, 19 Oct 2023 07:21:40 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57E82801234;
 Thu, 19 Oct 2023 11:21:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D792A492BFB;
 Thu, 19 Oct 2023 11:21:36 +0000 (UTC)
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
X-Inumbo-ID: aec5532b-6e71-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697714503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wJbjQEX6r4FVtVGUs3f8q9Y8qBJ81kVTcIhxYAo3Mqk=;
	b=I4Fy1zkXJ+i4ar6jj/tCSAnfPsq/o7f5vphWb2XTK3zXgc9GChMpEbAmnYWsa1OqvYRasU
	hdpyxqMNqJBxQoW54IIBp2+yOdkNkoMBkJUCK0x1Tzn1Uup8W+iqM/wvDGasyBVsAAWh3Q
	+TPFC0SFg6J3CiQU5MSEHzsn32QJ5Bg=
X-MC-Unique: SK7vo6K2NX2TQ2jYrduzJQ-1
Date: Thu, 19 Oct 2023 13:21:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH 11/12] hw/xen: automatically assign device index to block
 devices
Message-ID: <ZTERPwrbUJf7kty2@redhat.com>
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-12-dwmw2@infradead.org>
 <ZS+cutIjulWBQakk@redhat.com>
 <950f3a62dfcecce902037f95575f1013697a5925.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <950f3a62dfcecce902037f95575f1013697a5925.camel@infradead.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Am 18.10.2023 um 12:52 hat David Woodhouse geschrieben:
> > Actually, how does this play together with xen_config_dev_blk()? This
> > looks like it tried to implement a very similar thing (which is IF_XEN
> > even already existed).
> 
> Ah yes, thanks for spotting that! I hadn't been looking at the xenfv
> 
> > Are we now trying to attach each if=xen disk twice in the 'xenpv'
> > machine? Or if something prevents this, is it dead code.
> 
> I suspect we end up creating them twice (and probably thus failing to
> lock the backing file).
>
> [...]
>
> ... but this just reinforces what I said there about "if
> qmp_device_add() can find the damn bus and do this right, why do we
> have to litter it through platform code?"

Indeed, if you can do -device, it's always the best option. For block
devices not the least because it gives you a way to use -blockdev with
it. I'm happy whenever I see a drive_get() call go away.

Kevin



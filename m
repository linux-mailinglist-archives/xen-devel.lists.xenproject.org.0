Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 557AA544DC9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 15:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345510.571097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzIIy-0004Mb-Nt; Thu, 09 Jun 2022 13:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345510.571097; Thu, 09 Jun 2022 13:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzIIy-0004Jt-Kc; Thu, 09 Jun 2022 13:34:32 +0000
Received: by outflank-mailman (input) for mailman id 345510;
 Thu, 09 Jun 2022 13:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nuio=WQ=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzIIx-0004Jn-7k
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 13:34:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c694a7-e7f8-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 15:34:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-0J5iAZZSO5Cz0A05vvpusQ-1; Thu, 09 Jun 2022 09:34:25 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8822E294EDE1;
 Thu,  9 Jun 2022 13:34:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37038492C3B;
 Thu,  9 Jun 2022 13:34:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A06F1800094; Thu,  9 Jun 2022 15:34:11 +0200 (CEST)
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
X-Inumbo-ID: e2c694a7-e7f8-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654781668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GlQ8FBlP/drXQ8Lb3KbrrEPrF8f85P+9QjKCvTgg4Bg=;
	b=W9NpdQzLTSS9Bd0uCAmrtGcGvSXJUMA2jvOocF/4eo4xS5dvI+z/Ta/fhUGWBqvezbevOp
	pS7QlnF2C5d8Tnok+V14lQgBPJdz+iHF4wHAMlsrhf8BSliiJnCC8KmjlQUHz1OiJEAFY+
	lUrn56nJWMJbIDYPI+DjbkgU+O1uHTg=
X-MC-Unique: 0J5iAZZSO5Cz0A05vvpusQ-1
Date: Thu, 9 Jun 2022 15:34:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, xen-devel@lists.xenproject.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Message-ID: <20220609133411.uneuazwmcczzap6i@sirius.home.kraxel.org>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
 <20220226115516.59830-3-akihiko.odaki@gmail.com>
 <20220609102805.qz2xrnd6ms6cigir@sirius.home.kraxel.org>
 <19ae71a4-c988-3c9e-20d6-614098376524@gmail.com>
 <20220609120214.bay3cl24oays6x6d@sirius.home.kraxel.org>
 <c0c610b8-df0c-7e2a-385f-bcf70c987182@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0c610b8-df0c-7e2a-385f-bcf70c987182@gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

  Hi,

> > > > (1) add refresh_rate
> > > > (2) update users one by one
> > > > (3) finally drop update_interval when no user is left.
> > > > 
> > > > thanks,
> > > >     Gerd
> > > > 
> > > 
> > > I think 1 and 3 should have to be done once since refresh_rate and
> > > update_interval would interfere with each other otherwise.
> > 
> > Well, between 1 and 3 both old and new API are active.  Shouldn't be
> > much of a problem because the GraphicHwOps implementations are using
> > only the one or the other.
> > 
> > take care,
> >    Gerd
> > 
> 
> The only GraphicHwOps implementation updated with this change is xenfb.
> xenfb can be switched to use refresh_rate in step 1 or 3.
> 
> Switching to use refresh_rate in step 1 would break the refresh rate
> propagation until all host displays are updated to set refresh_rate instead
> of calling update_interval.

Well, host display update would need splitting into two pieces too,
first add refresh_rate, then later drop update_interval, to make the
update scheme work without temporary breakage.

That sounds increasingly like over engineering it though, I guess I just
queue up the patches as-is.

thanks,
  Gerd



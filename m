Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6828FC4AC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 09:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735573.1141688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sElC4-0006tL-LK; Wed, 05 Jun 2024 07:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735573.1141688; Wed, 05 Jun 2024 07:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sElC4-0006qc-IR; Wed, 05 Jun 2024 07:36:24 +0000
Received: by outflank-mailman (input) for mailman id 735573;
 Wed, 05 Jun 2024 07:36:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oDqB=NH=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1sElC3-0006qW-Pt
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 07:36:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d7f0367-230e-11ef-90a2-e314d9c70b13;
 Wed, 05 Jun 2024 09:36:22 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-g3I8oBvNM4KXcyD4UNR39Q-1; Wed,
 05 Jun 2024 03:36:13 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D8F53C025B1;
 Wed,  5 Jun 2024 07:36:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2BB6492BF6;
 Wed,  5 Jun 2024 07:36:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 97652180098E; Wed,  5 Jun 2024 09:36:11 +0200 (CEST)
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
X-Inumbo-ID: 4d7f0367-230e-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717572980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=si07Y0bLjjYsqVO37UOQw+PHM2IEPt+3tkAbNv1A9dY=;
	b=h00a7rdkb9o3f8X7RXfkiPV0mmoBVguAncQ13JgfbhABwjPS07TKCN4C3xS2ySc2uXGcNs
	v4RTAEdnO95K5EvvJrPHoFIP62MwlIAOgPQZEQM2mxnFHt5GqEoXqbfVp5jvGo8J5jxl0J
	tV5VtUmvGzLXbhOj+nj/e2dSdSvkdHs=
X-MC-Unique: g3I8oBvNM4KXcyD4UNR39Q-1
Date: Wed, 5 Jun 2024 09:36:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Anthony PERARD <anthony@xenproject.org>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, qemu-stable@nongnu.org
Subject: Re: [PATCH v2 1/3] stdvga: fix screen blanking
Message-ID: <tmtartaqh2ac4azfq4cgwh22uuc4pnrnxjpcpky24xzjrkwb5c@ung7cyha4ppa>
References: <20240603151825.188353-1-kraxel@redhat.com>
 <20240603151825.188353-2-kraxel@redhat.com>
 <CAMxuvawqf-0dKPsZP2UTcDWPWQ+8FKbZ=S4KX02hQO1qeeGVMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvawqf-0dKPsZP2UTcDWPWQ+8FKbZ=S4KX02hQO1qeeGVMA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

On Tue, Jun 04, 2024 at 10:27:18AM GMT, Marc-André Lureau wrote:
> Hi
> 
> > +    if (is_buffer_shared(surface)) {
> 
> Perhaps the suggestion to rename the function (in the following patch)
> should instead be surface_is_allocated() ? that would match the actual
> flag check. But callers would have to ! the result. Wdyt?

surface_is_shadow() ?  Comes closer to the typical naming in computer
graphics.

take care,
  Gerd



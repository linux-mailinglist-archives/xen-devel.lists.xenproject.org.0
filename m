Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72566C7FD20
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:15:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170187.1495262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTb0-00060a-Ax; Mon, 24 Nov 2025 10:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170187.1495262; Mon, 24 Nov 2025 10:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTb0-0005yY-7g; Mon, 24 Nov 2025 10:14:58 +0000
Received: by outflank-mailman (input) for mailman id 1170187;
 Mon, 24 Nov 2025 10:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6Av=6A=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1vNTay-0005yQ-Ov
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:14:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b48c7e5-c91e-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 11:14:54 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-l1KoQPHgMP6tymnzrikDGQ-1; Mon,
 24 Nov 2025 05:14:46 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 486AD1956080; Mon, 24 Nov 2025 10:14:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92E2430044DC; Mon, 24 Nov 2025 10:14:39 +0000 (UTC)
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
X-Inumbo-ID: 6b48c7e5-c91e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763979293;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0tC79samwWePB3tLxmPqGImp7yLEUid7HuRpqd42T2o=;
	b=RUaJGaIhHaYnT9AMVG1iXdyikIl1gl67NmLRxFK/V/2w3BnnbQeJUs4LNzhlNeis3xIgEF
	Z1uzSsmjYd/tC2AcdGBKd5Hyq6mIKLa9ydkC0O40/8Xfd6yNtrqwUgHTPBXcaG9qBs0Kat
	0wM/S0P7FcmXGhKpmDOPKaxEmWEu+ks=
X-MC-Unique: l1KoQPHgMP6tymnzrikDGQ-1
X-Mimecast-MFC-AGG-ID: l1KoQPHgMP6tymnzrikDGQ_1763979285
Date: Mon, 24 Nov 2025 10:14:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/i386/isapc: Remove dead Xen code
Message-ID: <aSQwDCCkIALZdh6w@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20251123185832.53802-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251123185832.53802-1-philmd@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Sun, Nov 23, 2025 at 07:58:32PM +0100, Philippe Mathieu-Daudé wrote:
> We don't use Xen on the isapc machine: let's remove
> pointless code.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/i386/isapc.c | 27 ++++-----------------------
>  1 file changed, 4 insertions(+), 23 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



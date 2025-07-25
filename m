Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BE7B12443
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 20:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058402.1425991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufNSU-00043Z-J9; Fri, 25 Jul 2025 18:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058402.1425991; Fri, 25 Jul 2025 18:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufNSU-00041Y-GT; Fri, 25 Jul 2025 18:47:54 +0000
Received: by outflank-mailman (input) for mailman id 1058402;
 Fri, 25 Jul 2025 18:47:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dxns=2G=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1ufNST-00041N-51
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 18:47:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db4e8417-6987-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 20:47:48 +0200 (CEST)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-UdQf_EZYMcujjf9u2ocQ5A-1; Fri,
 25 Jul 2025 14:47:40 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EB9BD1955D90; Fri, 25 Jul 2025 18:47:37 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.162])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 310ED3000199; Fri, 25 Jul 2025 18:47:35 +0000 (UTC)
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
X-Inumbo-ID: db4e8417-6987-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753469266;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jbpLiEB6XhaxfPCqU3EoBFV+m18pmD4Dnio2kwobPMg=;
	b=ileST99ht7TKk7BpdTNiCwpSVazNhP/MHjnsyQXTpyPxFxx/lnJ02U6m/T3t9t3CGRi2Dm
	QitVjAr2Kd6ESwB1c+87KyDYnNGpbfuYIkTpbkXF28Ju0vGfiqfuf2eGouBwiGzdOrPRgz
	HcO+aA4E/5wAKN2d/GT1Bq93rq5DGyE=
X-MC-Unique: UdQf_EZYMcujjf9u2ocQ5A-1
X-Mimecast-MFC-AGG-ID: UdQf_EZYMcujjf9u2ocQ5A_1753469258
Date: Fri, 25 Jul 2025 19:47:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] hw/xen/xen_pt: fix missing include
Message-ID: <aIPRRJHJXfYk8zBW@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250725165749.3893240-1-pierrick.bouvier@linaro.org>
 <aIO9SHJkDPnrfAHf@redhat.com>
 <5577bfdd-2441-4b6f-a58a-29bc2a6850c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5577bfdd-2441-4b6f-a58a-29bc2a6850c7@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On Fri, Jul 25, 2025 at 10:49:58AM -0700, Pierrick Bouvier wrote:
> On 7/25/25 10:22 AM, Daniel P. Berrangé wrote:
> > On Fri, Jul 25, 2025 at 09:57:49AM -0700, Pierrick Bouvier wrote:
> > > FAILED: libqemu-i386-softmmu.a.p/hw_xen_xen_pt.c.o
> > > ...
> > > /home/user/.work/qemu/hw/xen/xen_pt.c: In function ‘xen_pt_need_gsi’:
> > > /home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Wimplicit-function-declaration]
> > >    783 |         error_report("Cannot open %s: %s", guest_type, strerror(errno));
> > >        |         ^~~~~~~~~~~~
> > >        |         error_report_err
> > > /home/user/.work/qemu/hw/xen/xen_pt.c:783:9: error: nested extern declaration of ‘error_report’ [-Werror=nested-externs]
> > > cc1: all warnings being treated as errors
> > > 
> > > Fixes: 012842c ("log: make '-msg timestamp=on' apply to all qemu_log usage")
> > 
> > The problem pre-dated this, so this should be
> > 
> >   Fixes: cfcacbab38e (xen/passthrough: use gsi to map pirq when dom0 is PVH)
> > 
> > See the prior posting of this fix last week:
> > 
> >    https://lists.nongnu.org/archive/html/qemu-devel/2025-07/msg04831.html
> > 
> 
> While true, this was not a problem as error-report.h was still implicitely
> included (as Markus pointed). We can debate where the regression comes from,
> but from git bisect point of view, this is the trace one, at least with the
> simple "./configure --enable-debug".

It was /only/ implicitly included if you had the 'log' trace backend
enabled - other configurations missed it, hence the build failures
we got in Fedora from commit cfcacbab38e.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



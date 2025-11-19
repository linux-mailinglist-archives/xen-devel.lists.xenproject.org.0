Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE3BC6EEEA
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 14:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166044.1492686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLiLm-0003L3-47; Wed, 19 Nov 2025 13:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166044.1492686; Wed, 19 Nov 2025 13:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLiLm-0003Hw-1O; Wed, 19 Nov 2025 13:35:58 +0000
Received: by outflank-mailman (input) for mailman id 1166044;
 Wed, 19 Nov 2025 13:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sErG=53=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1vLiLk-0003Hq-IF
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 13:35:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aae9193f-c54c-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 14:35:53 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-632-8SZqLeL1Mm6WPxvtRPhmAQ-1; Wed,
 19 Nov 2025 08:35:48 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B402519560A7; Wed, 19 Nov 2025 13:35:44 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.69])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 69E29180049F; Wed, 19 Nov 2025 13:35:35 +0000 (UTC)
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
X-Inumbo-ID: aae9193f-c54c-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763559352;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=3WlUOQIxwdIljy6YeUgG8qobydVquMhaPXGSQAcA6to=;
	b=Q7twRHn/fzlKzrkpxXkcmrb0lePJDff0JArLqe1V0ocSIFqMedRw6/yrSVsIHxZJkMpzdz
	gJecNyqSQqFN2ebIkzLPD7h+Qf9arC/gLRkvUZgCdfdlvclkZMtd69cFUSDCL9RPYw8GEw
	HMz8H2tBnGdIZt+Ho+vCbf80ZN1KVUM=
X-MC-Unique: 8SZqLeL1Mm6WPxvtRPhmAQ-1
X-Mimecast-MFC-AGG-ID: 8SZqLeL1Mm6WPxvtRPhmAQ_1763559345
Date: Wed, 19 Nov 2025 13:35:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	kwolf@redhat.com, hreitz@redhat.com, mst@redhat.com,
	imammedo@redhat.com, anisinha@redhat.com, gengdongjiu1@gmail.com,
	peter.maydell@linaro.org, alistair@alistair23.me,
	edgar.iglesias@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
	palmer@dabbelt.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com, sstabellini@kernel.org,
	anthony@xenproject.org, paul@xen.org, peterx@redhat.com,
	farosas@suse.de, eblake@redhat.com, vsementsov@yandex-team.ru,
	eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
	wangyanan55@huawei.com, zhao1.liu@intel.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 5/5] error: Consistently name Error * objects err, and
 not errp
Message-ID: <aR3HpH88od11v8qL@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-6-armbru@redhat.com>
 <3ffe11b9-db81-4930-aefa-e55d758645bf@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ffe11b9-db81-4930-aefa-e55d758645bf@citrix.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Wed, Nov 19, 2025 at 01:22:06PM +0000, Andrew Cooper wrote:
> On 19/11/2025 1:08 pm, Markus Armbruster wrote:
> > diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
> > index b93ff80c85..3e62ec09d0 100644
> > --- a/hw/xen/xen-pvh-common.c
> > +++ b/hw/xen/xen-pvh-common.c
> > @@ -101,7 +101,7 @@ static void xen_create_virtio_mmio_devices(XenPVHMachineState *s)
> >  #ifdef CONFIG_TPM
> >  static void xen_enable_tpm(XenPVHMachineState *s)
> >  {
> > -    Error *errp = NULL;
> > +    Error *err = NULL;
> >      DeviceState *dev;
> >      SysBusDevice *busdev;
> >  
> > @@ -111,8 +111,15 @@ static void xen_enable_tpm(XenPVHMachineState *s)
> >          return;
> >      }
> >      dev = qdev_new(TYPE_TPM_TIS_SYSBUS);
> > -    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &errp);
> > -    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &errp);
> > +    /*
> > +     * FIXME This use of &err is is wrong.  If both calls fail, the
> > +     * second will trip error_setv()'s assertion.  If just one call
> > +     * fails, we leak an Error object.  Setting the same property
> > +     * twice (first to a QOM path, then to an ID string) is almost
> > +     * certainly wrong, too.
> > +     */
> > +    object_property_set_link(OBJECT(dev), "tpmdev", OBJECT(be), &err);
> > +    object_property_set_str(OBJECT(dev), "tpmdev", be->id, &err);
> 
> To your question, I don't know the answer, but I think it's far more
> likely that the original author didn't grok the proper use of &errp,
> than for this behaviour to be intentional.
> 
> Surely we just want a failure path and abort the construction if this
> goes wrong?

In the caller of xen_enable_tpm, we just have error_report+exit calls,
so there's no error propagation ability in the call chain.

The caller will also skip  xen_enable_tpm unless a TPM was explicitly
requested in the config.

Given that, I'm inclined to say that the object_property_set_* calls
in xen_enable_tpm should be using &error_abort, as a failure to setup
the explicitly requested TPM should be fatal.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2962BB14E45
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062677.1428408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkCk-0002bm-59; Tue, 29 Jul 2025 13:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062677.1428408; Tue, 29 Jul 2025 13:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkCk-0002ZB-21; Tue, 29 Jul 2025 13:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1062677;
 Tue, 29 Jul 2025 13:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EWC1=2K=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1ugkCi-0002PC-Ab
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:17:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54f38678-6c7e-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 15:17:10 +0200 (CEST)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-314-HNYTd7FgNs2GY06vlk4H_Q-1; Tue,
 29 Jul 2025 09:17:04 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0F1631956089; Tue, 29 Jul 2025 13:17:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.12])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 43CFF19560A2; Tue, 29 Jul 2025 13:17:00 +0000 (UTC)
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
X-Inumbo-ID: 54f38678-6c7e-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753795029;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A46pdvu3P8sVMAVxEZjlM/QkpXNT6aCO2+WxlHevqcU=;
	b=Me0ck2U2k4BqUK28CXEquHpDQryFyhu2WK/fUoEL3a/x7lTsFb0YktXqVCB8bou2+tlvOB
	FNSD31DtC8ppN2h1/zneAJ9JINQCUwiSV1vQYuEA20EKDu96T9eJz+ZcZ7sUfQ5FlWfr/V
	ksKs/qUliea8oIAWBNyERR1UmzFnr94=
X-MC-Unique: HNYTd7FgNs2GY06vlk4H_Q-1
X-Mimecast-MFC-AGG-ID: HNYTd7FgNs2GY06vlk4H_Q_1753795023
Date: Tue, 29 Jul 2025 14:16:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org,
	qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/display/xenfb: Replace unreachable code by abort()
Message-ID: <aIjJyH_Vy0LzHH4z@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250729111226.3627499-1-armbru@redhat.com>
 <14fff91b-7434-4d90-adb1-ebbe3f51d605@linaro.org>
 <87v7nbdwfx.fsf@pond.sub.org>
 <15536eea-5a66-4dff-b4bd-8a43fbfa9365@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15536eea-5a66-4dff-b4bd-8a43fbfa9365@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Tue, Jul 29, 2025 at 02:59:46PM +0200, Philippe Mathieu-Daudé wrote:
> On 29/7/25 14:16, Markus Armbruster wrote:
> > Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> > 
> > > On 29/7/25 13:12, Markus Armbruster wrote:
> > > > xenfb_mouse_event() has a switch statement whose controlling
> > > > expression move->axis is an enum InputAxis.  The enum values are
> > > > INPUT_AXIS_X and INPUT_AXIS_Y, encoded as 0 and 1.  The switch has a
> > > > case for both axes.  In addition, it has an unreachable default label.
> > > > This convinces Coverity that move->axis can be greater than 1.  It
> > > > duly reports a buffer overrun when it is used to subscript an array
> > > > with two elements.
> > > > Replace the unreachable code by abort().
> > > > Resolves: Coverity CID 1613906
> > > > Signed-off-by: Markus Armbruster <armbru@redhat.com>
> > > > ---
> > > >    hw/display/xenfb.c | 3 +--
> > > >    1 file changed, 1 insertion(+), 2 deletions(-)
> > > > diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
> > > > index 22822fecea..5e6c691779 100644
> > > > --- a/hw/display/xenfb.c
> > > > +++ b/hw/display/xenfb.c
> > > > @@ -283,8 +283,7 @@ static void xenfb_mouse_event(DeviceState *dev, QemuConsole *src,
> > > >                    scale = surface_height(surface) - 1;
> > > >                    break;
> > > >                default:
> > > > -                scale = 0x8000;
> > > > -                break;
> > > > +                abort();
> > > 
> > > We prefer GLib g_assert_not_reached() over abort() because it displays
> > > the file, line number & function before aborting.
> > 
> > The purpose of this line is to tell the compiler we can't get there,
> > with the least amount of ceremony.
> > 
> > We have ~600 calls of abort().
> 
> And ~1600 of g_assert_not_reached() =)
> 
> $ git grep -w 'abort();' | wc -l
>      556
> $ git grep -w 'g_assert_not_reached();' | wc -l
>     1551

Sounds like we could create a gitlab issue for "replace abort with
g_assert_not_reached" that could be a easy on-ramp for someone to
start contributing.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|



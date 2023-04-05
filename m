Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF556D7A26
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518462.805040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0dO-0006lu-9t; Wed, 05 Apr 2023 10:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518462.805040; Wed, 05 Apr 2023 10:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0dO-0006k7-7H; Wed, 05 Apr 2023 10:44:58 +0000
Received: by outflank-mailman (input) for mailman id 518462;
 Wed, 05 Apr 2023 10:44:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E6P8=74=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pk0dM-0006jx-HL
 for xen-devel@lists.xen.org; Wed, 05 Apr 2023 10:44:56 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e55f4197-d39e-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:44:53 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510--SGXi9h-OWiGow7FELWTWw-1; Wed, 05 Apr 2023 06:44:49 -0400
Received: by mail-ed1-f70.google.com with SMTP id
 n6-20020a5099c6000000b00502c2f26133so4460794edb.12
 for <xen-devel@lists.xen.org>; Wed, 05 Apr 2023 03:44:48 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 p25-20020a170906a01900b0093a7952411asm7207199ejy.48.2023.04.05.03.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 03:44:47 -0700 (PDT)
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
X-Inumbo-ID: e55f4197-d39e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680691492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kq6oZ7N2bYTf0eEXEKbV1aFmSrlbXHt85D5v+zP8YuE=;
	b=PqPwEh74rny6Rf2DAPJlaQtViJqcvRRT5MlAv6EYUs/M+2iARPJsWMnUGEThKN3DAhKUfJ
	R23xvhARXG6i94e5BILUVlFyxwnsHYlotpQBqhjb3+fSRS3IyXC/TvpnFbJadtn49rWkWx
	9MJjd8qtxWtvLFydBiA4OLy4R4eQh7M=
X-MC-Unique: -SGXi9h-OWiGow7FELWTWw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680691488;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kq6oZ7N2bYTf0eEXEKbV1aFmSrlbXHt85D5v+zP8YuE=;
        b=EI6O2ucWs6IkbSUkEr55u19Z1IQBb7BtSwHBqwFc6FX4EsnO6FauVB52EvZ/wQiHeN
         qu9xV/+QFDvavxVMZhUNh9jQatUQZ2ks6eqMzpV1ZPjjMYmUtpXj3y4EPYvoTfUs1NFZ
         XukgO14XtWwuhWiklziGDI/XcGcG1GiW2nHIPAUTY31TWr7U6K5rPkPtRicgoat7QUmv
         ZcbJ2ZgRuTlvkGOCdacz4FQYGADpkjXJrMMfkODpWdzmwh7ypTtB4dwI8cBaXvI3Vjj/
         jIKZgBR3q9/fOVnXyt/dYGBHfNx10Iwu1NILM9C/JLENJLOYOGo4eOYIo7TuQEf192Cq
         cQSg==
X-Gm-Message-State: AAQBX9cTMNSx6HQji+T1/+ebewmL/DoBcAOAR2Wrawo9Lu1lxEXbjx4o
	umOMkrfxBJ9wh/vNbQCfT9Y1BwI50+SvrHBwNGwHooKZC3NRVmHdbJpRDs3fTOuTBBJZ/1zIiTa
	RP83Ea7Txxy/irLqK5g==
X-Received: by 2002:a17:906:d045:b0:931:624b:6804 with SMTP id bo5-20020a170906d04500b00931624b6804mr2345359ejb.33.1680691487916;
        Wed, 05 Apr 2023 03:44:47 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5k+F7FQS0kEh/ahvkTDuRpd40DUgmdol+8mUYtq06ub6whVh6ZTdy0b/m/9U1TYG1Nw5Bew==
X-Received: by 2002:a17:906:d045:b0:931:624b:6804 with SMTP id bo5-20020a170906d04500b00931624b6804mr2345345ejb.33.1680691487657;
        Wed, 05 Apr 2023 03:44:47 -0700 (PDT)
Date: Wed, 5 Apr 2023 06:44:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org,
	virtio-dev@lists.oasis-open.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Sebastien Boeuf <sebastien.boeuf@intel.com>,
	Liu Jiang <gerry@linux.alibaba.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH V3 0/2] qemu: vhost-user: Support Xen memory mapping
 quirks
Message-ID: <20230405064417-mutt-send-email-mst@kernel.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
 <20230405080512.nvxiw4lv7hyuzqej@vireshk-i7>
 <87h6tulkae.fsf@linaro.org>
 <20230405060340-mutt-send-email-mst@kernel.org>
 <87cz4ilj4j.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87cz4ilj4j.fsf@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 05, 2023 at 11:24:43AM +0100, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Wed, Apr 05, 2023 at 11:00:34AM +0100, Alex Bennée wrote:
> >> 
> >> Viresh Kumar <viresh.kumar@linaro.org> writes:
> >> 
> >> > On 09-03-23, 14:20, Viresh Kumar wrote:
> >> >> Hello,
> >> >> 
> >> >> This patchset tries to update the vhost-user protocol to make it support special
> >> >> memory mapping required in case of Xen hypervisor.
> >> >> 
> >> >> The first patch is mostly cleanup and second one introduces a new xen specific
> >> >> feature.
> >> >
> >> > Can we apply this now ? I have developed code for rust-vmm crates
> >> > based on this and we need to get this merged/finalized first before
> >> > merging those changes.
> >> 
> >> 
> >> I've queued into my virtio/vhost-user-device series so I'll get merged
> >> with that series unless mst wants to take it now.
> >
> > Well the patches are tagged and I was going to take these after the release.
> > Probably easier not to work on this in two trees.
> > Still if there's something in your tree being blocked
> > by these patches then
> > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > Let me know.
> 
> The virtio/vhost-user-device tree work is orthogonal to this vhost-user
> enhancement although all the work is related to our latest VirtIO
> project inside Linaro, Orko:
> https://linaro.atlassian.net/wiki/spaces/ORKO/overview
> 
> So if you are happy please take these patches now for when the tree
> re-opens.

Yes, I tagged them for when the tree reopens.

> >
> >
> >> >
> >> > Thanks.
> >> 
> >> 
> >> -- 
> >> Alex Bennée
> >> Virtualisation Tech Lead @ Linaro
> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro



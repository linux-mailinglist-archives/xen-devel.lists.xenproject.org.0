Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886046FECC9
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 09:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533147.829558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px0j9-000428-Td; Thu, 11 May 2023 07:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533147.829558; Thu, 11 May 2023 07:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px0j9-0003zm-Q1; Thu, 11 May 2023 07:28:39 +0000
Received: by outflank-mailman (input) for mailman id 533147;
 Thu, 11 May 2023 07:28:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sau0=BA=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1px0j8-0003zg-SJ
 for xen-devel@lists.xen.org; Thu, 11 May 2023 07:28:38 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70a511a9-efcd-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 09:28:37 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-643557840e4so8903950b3a.2
 for <xen-devel@lists.xen.org>; Thu, 11 May 2023 00:28:36 -0700 (PDT)
Received: from localhost ([122.172.82.60]) by smtp.gmail.com with ESMTPSA id
 r38-20020a635166000000b0052863112065sm4362035pgl.35.2023.05.11.00.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 00:28:33 -0700 (PDT)
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
X-Inumbo-ID: 70a511a9-efcd-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683790115; x=1686382115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YnTCNWm2LykulONaWYVJi+pnI3QLH6QWJExDXITJhIs=;
        b=z1eBVdJFSIkFe5k9PgUIOZpm2t8Zb78+GSepz+PJd1dZdEngnABnV0luMfRYmQlrIt
         +rVvSCLVChzJsu8LN/zT99FoZn2VomZV8moqzgp6VIn7Ge+x8CUmpU664jyhXkcnvTBm
         SEQHxqOvfTR5U1TOPz1rEBkQYNJhdjlThx+mYD6xjprchx4DT8u5d9XqemWFfDARw2ab
         xh0dTpUu1f7rsx390MkfZrdnNjpmGDPqYoER39WQWorAecpaWmsk02qmE+BMJ/L7TfpF
         QQCNNQJILR5snkMxu1CM2dsg1nY5+xWUTi5cInOyO6lKNozF2UuQAv24bCmICIwtNYoy
         0U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683790115; x=1686382115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnTCNWm2LykulONaWYVJi+pnI3QLH6QWJExDXITJhIs=;
        b=BHb3leCOs53SVpEvTCbfsnmvKBcWVKFIztD34hzb+cXGuoIF+2Tvc3HgZ1rR5AKwv2
         C1GPsdsD4JtcbOlXMYORRa0SGS31nMGEMgOEli79IbuobkAp9WwhqPmV9ZxxjfTP4kcD
         pi7GH6pv3kRGPKAjAVoy2qc+QGAcGz22eYV/Tn/Jy17ioxrABpxSVrrw1fkOl4gRTtSB
         mOu1Vu8hPABDvxzNe4CJV7nl0+NGJNXpbJwsKRflxcbrP98VbJXuEs0i9Lmwic4K3C2v
         vwEbaARW5DVoV7qxH4fOsgfZZ2wFliaUFDlvEs2tidTlxbz7CqUS3i3I17XmxdTK7UJN
         aqdQ==
X-Gm-Message-State: AC+VfDwwHfyi4SZ7kkjwb7QFAzbW+6XtTrTfufhf+68R90W0o5dX6wTl
	rmmLNJQZcUULJexu9ovr2Lapeg==
X-Google-Smtp-Source: ACHHUZ6YkU3BEKQudVcAARWSQK4cMjpxfeRIkO72W0dI4/2zrp2Fa9GZne9XqnkhS0dG/U2HV/DDEg==
X-Received: by 2002:a05:6a20:a10f:b0:ff:b9c4:a0aa with SMTP id q15-20020a056a20a10f00b000ffb9c4a0aamr23387687pzk.48.1683790114880;
        Thu, 11 May 2023 00:28:34 -0700 (PDT)
Date: Thu, 11 May 2023 12:58:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <20230511072831.4hubr2qxlkaov4am@vireshk-i7>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
 <92c7f972-f617-40fc-bc5d-582c8154d03c@perard>
 <20230505093835.jcbwo6zjk5hcjvsm@vireshk-i7>
 <e6b10450-50c2-468c-88ba-36e0274b5970@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b10450-50c2-468c-88ba-36e0274b5970@perard>

On 09-05-23, 16:05, Anthony PERARD wrote:
> I guess the way virtio devices are implemented in libxl suggest to me
> that the are just Xen PV devices. So I guess some documentation in the
> tree would be useful, maybe some comments in libxl_virtio.c.

Our use case is just PV devices, not sure if someone else may want to
use it differently.

I will add the comment.

> > The eventual fronend drivers (like drivers/i2c/busses/i2c-virtio.c)
> > aren't Xen aware and the respective virtio protocol doesn't talk about
> > how memory is mapped for the guest. The guest kernel allows both
> > memory mapping models and the decision is made based on the presence
> > or absence of the iommu node in the DT.
> 
> So, virtio's frontend don't know about xenstore?

Right.

> In this case, there's
> no need to have all those nodes in xenstore under the frontend path.

Yeah, I ended up copying them from disk or kbd I guess, but I am not
using them for sure.

> I guess the nodes for the backends are at least somewhat useful for
> libxl to reload the configuration of the virtio device. But even that
> isn't probably useful if we can't hot-plug or hot-unplug virtio devices.
> 
> Are the xenstore node for the backend actually been used by a virtio
> backend?

Yes, I am using them on the backend side to read device information
whenever a new guest comes in with a bunch of devices.

-- 
viresh


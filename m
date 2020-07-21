Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18909227D2B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:37:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpdy-0005FQ-89; Tue, 21 Jul 2020 10:37:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXjz=BA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jxpdw-0005Eu-BG
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:37:04 +0000
X-Inumbo-ID: 1d5778d6-cb3e-11ea-84fe-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d5778d6-cb3e-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:37:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z15so20662278wrl.8
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=65aF1t5dIfPi4ml0lc9y3/i3TqsvxnPdI2i3ZT7PdDs=;
 b=IGQEAixVVYxYA9LfxNP5++SxsVrIRI1+Yoddw/gGx8Mo2Q2F6DFNU2/iAJg4feOZMx
 m9KouV8abTUolFn3qoh21nb/Swc0uSNOKZkYs61+rmGkrtW3GgWuVLQ/jOkSU3iHTexx
 HkaiJzVKI2q8nxokoynzLc0zBr1qPqWISJp8dE4ekOuX835/7V0azgRnL9KR6qbfEFPX
 yuV/BvWTve7onN7uh+r0c7rpNHesmmoTAwM5Ho1/aBoMdGT8JcWSLhFfKnO6QEJkOh1Z
 gtAZPhjQ4fpvjVFGpIrA37UuPsh5GXHuXm6duq6hpJ9qfMzI7Y8FRHz7O4ijXznTg2kX
 pq6g==
X-Gm-Message-State: AOAM531JhCA7qfIFBY5QCQleCt+Df3mTrX6R/vXDkMULVa7ZECD1IwgK
 vuuB6fclX+CVztvo74nfMsE=
X-Google-Smtp-Source: ABdhPJzTwhn0r2E7vhybGbyFemuG8JNOsgtqqI/fvD6hfrYhzjHhLSxO7uyLOpPXqVBhMtbrKmpPcg==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr3683820wrf.309.1595327822588; 
 Tue, 21 Jul 2020 03:37:02 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id c7sm38259204wrq.58.2020.07.21.03.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:37:02 -0700 (PDT)
Date: Tue, 21 Jul 2020 10:37:00 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org
Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
Message-ID: <20200721103700.xmgtcyszlux4vahf@liuwe-devbox-debian-v2>
References: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
 <003901d65f2e$6faab0c0$4f001240$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003901d65f2e$6faab0c0$4f001240$@xen.org>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Wei Liu' <wl@xen.org>, 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 'Nick Rosbrook' <rosbrookn@gmail.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 21, 2020 at 08:13:28AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Nick Rosbrook <rosbrookn@gmail.com>
> > Sent: 21 July 2020 00:55
> > To: xen-devel@lists.xenproject.org
> > Cc: paul@xen.org; Nick Rosbrook <rosbrookn@ainfosec.com>; George Dunlap <george.dunlap@citrix.com>;
> > Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> > Subject: [PATCH for-4.14] golang/xenlight: fix code generation for python 2.6
> > 
> > Before python 2.7, str.format() calls required that the format fields
> > were explicitly enumerated, e.g.:
> > 
> >   '{0} {1}'.format(foo, bar)
> > 
> >   vs.
> > 
> >   '{} {}'.format(foo, bar)
> > 
> > Currently, gengotypes.py uses the latter pattern everywhere, which means
> > the Go bindings do not build on python 2.6. Use the 2.6 syntax for
> > format() in order to support python 2.6 for now.
> > 
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> 
> I'm afraid this is too late for 4.14 now. We are in hard freeze, so only minor docs changes or critical bug fixes are being taken at
> this point.


I will apply this to staging. This can be backported later if we care
about CentOS 6 (EOL Nov this year) or any other old distros that still
run python 2.6.

FAOD Nick is one of the maintainers of golang code so I think his SoB is
good enough for this simple patch. It looks obviously correct to me.

Wei.


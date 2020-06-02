Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA591EB7F9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:09:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2ur-0003cA-T2; Tue, 02 Jun 2020 09:09:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg2up-0003bt-Rl
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:08:59 +0000
X-Inumbo-ID: b0112f96-a4b0-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0112f96-a4b0-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 09:08:56 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d128so2326406wmc.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=imkcr8mnWFJu8IPMt5D0KkvYAOE2rToIq4VEcJIUbqU=;
 b=XTOi1rXEv7/Zd38zzg0XTLjsa6uVKwA/0R2BUReHoIc6SKyEt/pgBcEDeZjprZ/HZW
 SDWeeZQO1/KU2L5xHLNUndIN7R0vht3zUIEcdIa53GmSgfimD2YSyMClSbKnlUebo395
 kqKbYL66d7r8NjbH1Jz065mOACWegtJIOFfrf0cuNRX74gfrB6eM5L9LNkZ/0csiSWVY
 /WXgw7iK/bsG69V9go2fT2qVS3yswCtrCG2wMDJwAHZXZ+POjf1C04K/xaxLw7qipeHa
 f8y7vd0+M3RBZAMGsxXcXjkuxIxCpnh0n1OFODETQa2Damc8PQ2lZw+Nv9mfowmEPwpg
 9tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=imkcr8mnWFJu8IPMt5D0KkvYAOE2rToIq4VEcJIUbqU=;
 b=TpoDhfHpiWyK3UCPJgv3gzqtvTHDx3fMXgvUbDmcPeLOwQWXdLIBzDpWZQSe0BjuUn
 WqPF2ZnWtTQRfYjQ5lxaXhLFE+amcJ4TwfXLrwBw9/sRlTx1uehF5rOjbizEWhaw0NP2
 Hw6cyqvBb46jKFyz8ln8QiQpmQBh1ygaglt1pDw8vCUhKEVFT2CruXddSjl5eaKZpN9Y
 vbrRLkbtwgKufQn2eVT6FkgsJA5xbLDaO5iDcCZ5DW5mg79VBDMdgDOwybgrx0yMvvzJ
 DON+SPtzAixQLbQssyDmUSTuVDi3ZtNahVx6WZ1C2u7CcNSVTDAlB9i2bty8qUw9HoGU
 jJNQ==
X-Gm-Message-State: AOAM5317GK0+VQJTr6xgchBaVrGKcC3GhfWfCG/dxP9GAhnHwDRLGTja
 jPnnKtD7P65EdLfRMqp3th0=
X-Google-Smtp-Source: ABdhPJzCRrZoybgW1R15Q2EL8uQzunVRYQnJy8vzp6zkOLbHzZVKqBNHBgZ8LE2NvG+oy8zrV9+1vg==
X-Received: by 2002:a1c:e908:: with SMTP id q8mr3161115wmc.116.1591088935865; 
 Tue, 02 Jun 2020 02:08:55 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id u23sm2773416wmu.20.2020.06.02.02.08.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 02:08:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>,
	"'Olaf Hering'" <olaf@aepfle.de>
References: <20200529135303.18457-1-olaf@aepfle.de>
 <20200602084338.a55bbjbhal4gbyvh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
In-Reply-To: <20200602084338.a55bbjbhal4gbyvh@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Subject: RE: [PATCH v1] INSTALL: remove TODO section
Date: Tue, 2 Jun 2020 10:08:54 +0100
Message-ID: <003601d638bd$7133c180$539b4480$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIceqY+i+rjeo+ohPEdqGqT/4ozeAHZGh3WqCm8qVA=
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Wei Liu <wl@xen.org>
> Sent: 02 June 2020 09:44
> To: Olaf Hering <olaf@aepfle.de>
> Cc: xen-devel@lists.xenproject.org; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich <jbeulich@suse.com>;
> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Paul
> Durrant <paul@xen.org>
> Subject: Re: [PATCH v1] INSTALL: remove TODO section
> 
> On Fri, May 29, 2020 at 03:53:03PM +0200, Olaf Hering wrote:
> > The default value '/' for DESTDIR is unusual, but does probably not hurt.
> >
> > Fixes commit f2b40dababedcd8355bf3e85d00baf17f9827131
> > Fixes commit 8e986e5a61efeca92b9b268e77957d45d8316ee4
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Acked-by: Wei Liu <wl@xen.org>
> 
> Based on the fact that you're the original author of this documentation.
> :-)
> 
> Cc Paul.

Release-acked-by: Paul Durrant <paul@xen.org>

> 
> > ---
> >  INSTALL | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/INSTALL b/INSTALL
> > index 72dc4b67dd..0d3eb89f02 100644
> > --- a/INSTALL
> > +++ b/INSTALL
> > @@ -365,12 +365,5 @@ make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
> >          DESTDIR=/some/path install
> >
> >
> > -TODO
> > -====
> > -
> > - - DESTDIR should be empty, not "/"
> > - - add make uninstall targets
> > - - replace private path variables as needed (SBINDIR/sbindir)
> > - - ...
> >
> >  # vim: tw=72 et



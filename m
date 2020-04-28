Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30561BC3D5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:36:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSHQ-0005pI-Io; Tue, 28 Apr 2020 15:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTSHP-0005p9-1H
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:36:15 +0000
X-Inumbo-ID: fe512bc2-8965-11ea-ae69-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe512bc2-8965-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 15:36:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id k12so3292043wmj.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 08:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=sZw6wmR3//GO8uGKaUgt+ATL89wawQJw2yUmRNDpiTs=;
 b=pRlghg/fl+V23+w3Fq2+oKZe4Q7u7kpX0v1uekaE4woddTOLnJPcpOvmgQyln4GaFY
 DFxtptWv6O9RGVtIjYSe0j5woda65qV/NkFff+NP8Z+6XBW4M7wDwedLMNgu0i3pEWb7
 Dq1zcYr2tFgi+zeMdLe4Qo7URqD2RDhmBZH+1vAGHWAydkU9OKwtt8kV1qX1aR1/WG8y
 VjfsyLk9Yi8LRTtZrW8lH8BVsY1le4LEKXJe0yo7YqEz7CaZvBRatx86gMsCl5UZvEn8
 /J3uFkZGnV28GADzQkM6cbIazNd/jKUQRudhKCxGQrKOES18+0cqorwGIWrQLEkloHsx
 AMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=sZw6wmR3//GO8uGKaUgt+ATL89wawQJw2yUmRNDpiTs=;
 b=Bp8ji7BEu/K5EXDypoOQN6CVSata/xls+W2HHfpg7T1jburYrztS0NxzGzBMAw6P+S
 nKgTAvyLIVvJg5b3ZBIGF68XCDbHhchRTuVf1uT6OgwiRboFFIx4vzP312B27UWS+wZ9
 iWIfXNFtr1OaW6BEnsw952qY4zljQmgxUCE267oVWXxMqg6lNBRhs0OsVjOQ+fbSllhl
 0A0V23VRKZCczetpChCgoGn9aCBRDv4s0v3mq/V+d68ma+Diw6mvhIobohXumkKVbQpf
 lJ9T1YGK/NjjbURmhFsqU37GLr4oPoU54HwHX422bIBORWpJxQT57kpK2KluTJKGWIHk
 hoUQ==
X-Gm-Message-State: AGi0PuaWO1vE6GTMVAF4XuCjR6LsDTgG7WLXgZx1MFCmAqc1KhCze+aM
 D2TAXbWqLRcWcwRmJ2WXckw=
X-Google-Smtp-Source: APiQypLpRYiCbEdKpYoZfdbhZaq1W+0LL3GbXHFxAujs5ZZChPAX12UUYq6QrA1sqdgXy55ZFQE7vA==
X-Received: by 2002:a7b:cb0c:: with SMTP id u12mr5683899wmj.137.1588088173603; 
 Tue, 28 Apr 2020 08:36:13 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id k133sm4189153wma.0.2020.04.28.08.36.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 08:36:12 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-3-paul@xen.org>
 <f4aa5e9f-4a1c-c02a-1cee-a43591492556@xen.org>
In-Reply-To: <f4aa5e9f-4a1c-c02a-1cee-a43591492556@xen.org>
Subject: RE: [PATCH v2 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
Date: Tue, 28 Apr 2020 16:36:11 +0100
Message-ID: <001501d61d72$bf619910$3e24cb30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwJNGvp/Abca5S6n/qyzMA==
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 20 April 2020 18:26
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Daniel De Graaf <dgdegra@tycho.nsa.gov>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: Re: [PATCH v2 2/5] xen/common/domctl: introduce XEN_DOMCTL_get/setdomaincontext
> 
> Hi Paul,
> 
> On 07/04/2020 18:38, Paul Durrant wrote:
> > diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> > index 1ad34c35eb..8ab39acf0c 100644
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -38,7 +38,7 @@
> >   #include "hvm/save.h"
> >   #include "memory.h"
> >
> > -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000012
> > +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
> >
> >   /*
> >    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> > @@ -1129,6 +1129,44 @@ struct xen_domctl_vuart_op {
> >                                    */
> >   };
> >
> > +/*
> > + * Get/Set domain PV context. The same struct xen_domctl_domaincontext
> 
> I think you want to update the comments to match the split.

Oh yes.

> 
> > + * is used for both commands but with slightly different field semantics
> > + * as follows:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> 

Thanks,

  Paul

> 
> Cheers,
> 
> 
> --
> Julien Grall



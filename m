Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487821D1758
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 16:18:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsDK-0001C2-Lj; Wed, 13 May 2020 14:18:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xdko=63=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jYsDJ-0001Bv-FY
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:18:25 +0000
X-Inumbo-ID: 9aa7de8e-9524-11ea-a38a-12813bfff9fa
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9aa7de8e-9524-11ea-a38a-12813bfff9fa;
 Wed, 13 May 2020 14:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id CFEECF3A9;
 Wed, 13 May 2020 16:18:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oy_Jz76kSO_h; Wed, 13 May 2020 16:18:21 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id F1CEFF04D;
 Wed, 13 May 2020 16:18:20 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.93)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jYsDD-005Ohe-I2; Wed, 13 May 2020 16:18:19 +0200
Date: Wed, 13 May 2020 16:18:19 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/build: move -fno-asynchronous-unwind-tables into
 EMBEDDED_EXTRA_CFLAGS
Message-ID: <20200513141819.nekdeotfuicputvo@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
 <20200513135552.24329-2-andrew.cooper3@citrix.com>
 <88c734e9-fd99-c157-ae9c-0900157bf1b6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c734e9-fd99-c157-ae9c-0900157bf1b6@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

Jan Beulich, le mer. 13 mai 2020 16:11:00 +0200, a ecrit:
> On 13.05.2020 15:55, Andrew Cooper wrote:
> > Users of EMBEDDED_EXTRA_CFLAGS already use -fno-asynchronous-unwind-tables, or
> > ought to.
> 
> It's not really well defined what they're supposed to be used for
> (and where it's not supposed to be used). I notice in particular
> a use in stubdom/Makefile which I'm unsure whether it indeed wants
> this adjustment. Therefore ...

I don't know why this is there in mini-os. It dates back 2005
8afe079be ('Mini-OS cleanups. Bug fixes in x86_64 assembly code.')

It indeed looks to me like a general option to minimize binary size, so
I'd say it is fine to make its activation general.

> >  This shrinks the size of the rombios 32bit stubs in guest memory.
> > 
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with the request that Samuel also ack (or otherwise) the change
> from a stubdom perspective.

Samuel


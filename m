Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6081E8290
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:54:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jehKV-00021Y-ET; Fri, 29 May 2020 15:53:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF3w=7L=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jehKU-00021T-88
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:53:54 +0000
X-Inumbo-ID: 94d80343-a1c4-11ea-a8dc-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94d80343-a1c4-11ea-a8dc-12813bfff9fa;
 Fri, 29 May 2020 15:53:49 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VgNztI4E0pMS45/t1Eue0i0VhZ8BPddJ995Bb7c5IW+YwIGDfxm1S9e9Apfq0qh1H5OSLa1fIs
 OTiPImdgUeaUxIAjjlXVo3u5nXtg0ygzgy7UPns3sbo/TvnL8rZHLNqxv4rhuH24QPwkMmzuL2
 dQZxwyepc8mKlvJBJVhWAh8+5PnL41U36VEwc86lTtjUXSZxgXYply75N6mFWtuZCzHd0r1fea
 Ze+vBS6SM0WpPvsflqUdCWSGx21AIyRFclj7Nk8V6Ry/HGXlXwuujSEL2pwVdObfqEvF1Er+z3
 hTE=
X-SBRS: 2.7
X-MesageID: 18794562
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,449,1583211600"; d="scan'208";a="18794562"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24273.12296.2786.109911@mariner.uk.xensource.com>
Date: Fri, 29 May 2020 16:53:44 +0100
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: [PATCH v2 07/17] libxc/restore: STATIC_DATA_END inference for v2
 compatibility
In-Reply-To: <2076e9a4-c07e-9aab-1cc2-f38f7eacd8c0@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-8-andrew.cooper3@citrix.com>
 <24148.2202.912512.939428@mariner.uk.xensource.com>
 <cea79256-f260-1710-a783-dadec276e32a@citrix.com>
 <24161.10156.858608.199136@mariner.uk.xensource.com>
 <2076e9a4-c07e-9aab-1cc2-f38f7eacd8c0@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("Re: [PATCH v2 07/17] libxc/restore: STATIC_DATA_END inference for v2 compatibility"):
> On 05/03/2020 16:24, Ian Jackson wrote:
> > Andrew Cooper writes ("Re: [PATCH v2 07/17] libxc/restore: STATIC_DATA_END inference for v2 compatibility"):
> >> More importantly however, by design, common code can't call
> >> arch-specific code without a restore_ops hook.  Deduping these would
> >> require breaking the restriction which is currently doing a decent job
> >> of keeping x86-isms out of common code.
> > I'm afraid you're going to have to explain that to me at a bit greater
> > length.  The biggest thing that is confusing me about your statement
> > here is that your patch is indeed adding x86-specific code to a common
> > file.  But also I don't understand the comment about restore_ops
> > hooks - do you mean something in restore_callbacks ?
> 
> No.  restore_callbacks are plumbing between libxl-save-helper and libxc.
> 
> restore_ops are internal to the restore code, and come in x86_pv and
> x86_hvm flavours, with ARM existing in some theoretical future.  The
> design of the common save/restore code had deliberate measures put in
> place to make it hard to get arch-specific details slip into common
> code, so porting to different architectures didn't have to start by
> doing a bunch of cleanup.
> 
> tl;dr I could put an #ifdef x86'd static inline in the root common
> header (xc_sr_common.h), but the overall complexity is greater than what
> is presented here.

Well, I still don't quite follow but as you point out on irc I haven't
replied for too long.  I don't think I should withhold my ack at this
stage.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.


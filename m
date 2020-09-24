Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F35276EFE
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 12:48:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLOmk-00070G-QG; Thu, 24 Sep 2020 10:47:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G3L7=DB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kLOmj-00070B-1y
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 10:47:33 +0000
X-Inumbo-ID: 0379d000-2c08-4767-8e1a-f62a93fad8e8
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0379d000-2c08-4767-8e1a-f62a93fad8e8;
 Thu, 24 Sep 2020 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600944452;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=L8xE/00A85vyhQuQ/6lgUNXwsSSmV95Xl/TUzk3RuH8=;
 b=OdlH6WMMIoPYAx37jCGIdHs6xdZVCkwPoCExMbnuOT3oqEcXEApE3Z3T
 MYKL1tdo/odrBaP+xelhxo8zuJo2Ap1GxLyPr1q0KOe0JXVQt6oFF00Gk
 jhjiCDFePtmCdHgkOLk18/6be+ouQUxv2xfG52YSnYDa+KH1lcSw1Oryy U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: opxQhHwtNFjKFi2WaTku1pymlx+LjDFtbAFzcvc/PQkiHp2uYJ0KdGnHs+Nkz+k99b4l26y18v
 2ZScdqi2Bhx77+V9dTrc6KhF+rQq4xUf4vgW+o3/31mphJBRc+MW1sNtW+Cs7MSUh6ePbrfxGE
 i854802MMt9WN30p7+1I2VLdqaEbxmZH07axiKBL7m/buMcYHQ0VKyNtF7/remPTjbdFDu433s
 5aIpn5KtbkEv0erRKGCeeMh01bjqMM6bE5OlPUdJjfTMoh/mdp2CqkljKuBK/YSISXRCbo8JRS
 buY=
X-SBRS: None
X-MesageID: 27746696
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,297,1596513600"; d="scan'208";a="27746696"
Date: Thu, 24 Sep 2020 12:47:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: SeongJae Park <sjpark@amazon.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, SeongJae Park
 <sjpark@amazon.de>, <axboe@kernel.dk>, <aliguori@amazon.com>,
 <amit@kernel.org>, <mheyne@amazon.de>, <linux-block@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen-blkback: add a parameter for disabling of persistent
 grants
Message-ID: <20200924104720.GO19254@Air-de-Roger>
References: <20200924101344.GN19254@Air-de-Roger>
 <20200924102714.28141-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200924102714.28141-1-sjpark@amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 24, 2020 at 12:27:14PM +0200, SeongJae Park wrote:
> On Thu, 24 Sep 2020 12:13:44 +0200 "Roger Pau Monné" <roger.pau@citrix.com> wrote:
> 
> > On Wed, Sep 23, 2020 at 04:09:30PM -0400, Konrad Rzeszutek Wilk wrote:
> > > On Tue, Sep 22, 2020 at 09:01:25AM +0200, SeongJae Park wrote:
> > > > From: SeongJae Park <sjpark@amazon.de>
> > > > 
> > > > Persistent grants feature provides high scalability.  On some small
> > > > systems, however, it could incur data copy overhead[1] and thus it is
> > > > required to be disabled.  But, there is no option to disable it.  For
> > > > the reason, this commit adds a module parameter for disabling of the
> > > > feature.
> > > 
> > > Would it be better suited to have it per guest?
> > 
> > I think having a per-backend policy that could be specified at the
> > toolstack level would be nice, but I see that as a further
> > improvement.
> 
> Agreed.
> 
> > 
> > Having a global backend domain policy of whether persistent grants are
> > enabled or not seems desirable, and if someone wants even more fine
> > grained control this change is AFAICT not incompatible with a
> > per-backend option anyway.
> 
> I think we could extend this design by receiving list of exceptional domains.
> For example, if 'feature_persistent' is True and exceptions list has '123,
> 456', domains of domid 123 and 456 will not use persistent grants, and vice
> versa.

I think that would be quite fragile IMO, I wouldn't recommend relying
on domain IDs.

What I would do instead is add a new attribute to
xl-disk-configuration [0] that allows setting the persistent grants
usage on a per-disk basis, and that should be passed to blkback in a
xenstore node.

> I could implement this, but... to be honest, I don't really understand the
> needs of the fine-grained control.  AFAIU, the problem is 'scalability' vs
> 'data copy overhead'.  So, only small systems would want to turn persistent
> grants off.  In such a small system, why would we need fine-grained control?
> I'm worrying if I would implement and maintain a feature without real use case.
> 
> For the reason, I'd like to suggest to keep this as is for now and expand it
> with the 'exceptions list' idea or something better, if a real use case comes
> out later.

I agree. I'm happy to take patches to implement more fine grained
control, but that shouldn't prevent us from having a global policy if
that's useful to users.

Roger.

[0] https://xenbits.xen.org/docs/unstable/man/xl-disk-configuration.5.html


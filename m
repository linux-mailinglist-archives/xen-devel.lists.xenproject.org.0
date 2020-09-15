Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080426A67E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 15:48:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIBIB-0001bP-K5; Tue, 15 Sep 2020 13:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF/R=CY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIBI9-0001bK-KQ
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 13:46:41 +0000
X-Inumbo-ID: 91782900-82f7-4bcc-aa7a-c7ee44ba4a8d
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91782900-82f7-4bcc-aa7a-c7ee44ba4a8d;
 Tue, 15 Sep 2020 13:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600177600;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=t0Ow1VAa/MYg6dz3DFulhU7Y+XuRlGuUwuFuzFo98lY=;
 b=bcK4F8yD1Czj3HwjKSll9HsRoMmmPFo6ZQm+kuw/wRmEqEMiBv0C0+z7
 Ph7D/YSuIqJZi7I6syd2ucRRbCmgtcW4syGlB459/zOdFwg41/looGmnQ
 +2t1YC13+cf17kSe9Vj86BBOGSFxl1+LyOYB9V81krdKwBr/KcptqmVuT o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qg8qTfYpfFHyJg953FCwotM9cYTJpTIgIDuszSBYgCtuiy5u823ZnyiVmyrL4X+tzxVyL4Kh9t
 JcoHxZ5MGl+YWfLz8p8+mvnyqEL3Cnl3/X6OcbNjoBhyUItvDpcZTMtCpCVvMx1bENeIjDvRaR
 ZpYVjlLNBnh/B8wT94bN71RDySDnMw8zJKXinJwS0U6HuVavoeXlz/TffdiLhWuaMGNP4geyPQ
 dION3M8R8VdnUCv9Ao/ylLAims5H7qDtNkpVrbhE+AqEtkfg5pdc/PDLfpf7TDzKmxwKZ/K9VW
 xuo=
X-SBRS: 2.7
X-MesageID: 27704913
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,430,1592884800"; d="scan'208";a="27704913"
Date: Tue, 15 Sep 2020 15:46:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
Message-ID: <20200915134630.GM753@Air-de-Roger>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
 <20200915115603.GL753@Air-de-Roger>
 <ae76b7d7-ea16-f668-3408-13c01a660e06@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae76b7d7-ea16-f668-3408-13c01a660e06@suse.com>
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

On Tue, Sep 15, 2020 at 02:26:34PM +0200, Jan Beulich wrote:
> On 15.09.2020 13:56, Roger Pau Monné wrote:
> > On Mon, Sep 14, 2020 at 12:15:39PM +0200, Jan Beulich wrote:
> >> Switch to $(call if_changed,ld) where possible; presumably not doing so
> >> in e321576f4047 ("xen/build: start using if_changed") right away was an
> >> oversight, as it did for Arm in (just) one case. It failed to add
> >> prelink.o to $(targets), though, causing - judging from the observed
> >> behavior on x86 - undue rebuilds of the final binary (because of
> >> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
> >> because of .prelink.o.cmd not getting read) during "make install-xen".
> > 
> > I'm not sure I follow why prelink.o needs to be added to targets, does
> > this offer some kind of protection against rebuilds when doing make
> > install?
> 
> In a way, but (as I view it) not really. It is the use of ...
> 
> > The switch to if_changed LGTM.
> 
> ... if_changed which requires this. .*.cmd files will only be loaded
> for anything explicitly or implicitly listed as a target. While .o
> coming from $(obj-y) get added there automatically, prelink.o is not
> something that could be recognized as needing adding, hence the
> "manual" insertion.

This seems very prone to mistakes, as you have to remember that
whatever object that uses if_changed should also be part of the
targets set, or else it will get rebuild unconditionally.

I think adding some of the above reasoning to the commit message would
be helpful IMO.

> Without .prelink.o.cmd loaded, $(if_changed ) will always arrange
> for it to get re-built, because it then will consider the command
> used to build the file to have changed (as the stored one appears to
> be empty).

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEC1198165
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 18:40:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIxQ5-0000m2-OT; Mon, 30 Mar 2020 16:37:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IY4r=5P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jIxQ4-0000lv-6k
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 16:37:48 +0000
X-Inumbo-ID: c988fad2-72a4-11ea-b9e8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c988fad2-72a4-11ea-b9e8-12813bfff9fa;
 Mon, 30 Mar 2020 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585586268;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=7LYlydXafTKI3cBZf6Q0RVnycdlx7DP/x43MrxSKPh8=;
 b=bCo0RdqxJj7o/1ESirg8IjWtqcOwl1yACEuRaA3FW1oWOPzjJg5Oqjlp
 frikxw7ahFdKAsv4ncT6+KOudVA8uDk9xKwywT4O2jimCONH0bLYIuQEV
 gbyhhauQdGn5vZwJFBT8vi83yRUlK4RpAet6qAOlRV9o63rajnK2b0LO9 M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jyawjFF5SXtjw4yGHdNngYTeSt7dvjHWj2C0oDDUXgIp+JBQ6eq2vs7EPaaZdo0nxnmrtpF4iO
 G/PmwUxKVn7bO7uyThYV+c1Q8V0pEeAtHhx1XrfKv06xi+zswDwf2TyaXNjfpOPn+ZS10fTe7x
 PvcjnAlrqfGjXZh3gNhVtRBXZ174+nM1AViAKfCceiSClaL0+iH+X/unVENjzAHUwU5jyu8+uZ
 gAV21auaPxBy82/VZdtKt9pUsN2ag3q+3KgUWfr74DMDKTxROS6khlLGRzAL5iNflop+Ym5vJM
 Ws8=
X-SBRS: 2.7
X-MesageID: 15092791
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,325,1580792400"; d="scan'208";a="15092791"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24194.8279.169315.476575@mariner.uk.xensource.com>
Date: Mon, 30 Mar 2020 17:37:43 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <af5af47c-31ab-09bd-2f05-e5e2ce34780d@suse.com>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
 <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
 <24180.53085.835170.696701@mariner.uk.xensource.com>
 <8c5ccb8d5f3cb3426b5782cc80391c9f8bcb71b8.camel@infradead.org>
 <af5af47c-31ab-09bd-2f05-e5e2ce34780d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort
 xenstore-ls if a node disappears while iterating
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Woodhouse <dwmw2@infradead.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jürgen Groß writes ("Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort xenstore-ls if a node disappears while iterating"):
> On 20.03.20 15:58, David Woodhouse wrote:
> > But it does still happen. And even if I turn the errx() into a warn()
> > to stop it aborting, and add a warn() when the xs_transaction_end()
> > returns EAGAIN... that isn't happening either. I'm just getting
> > inconsistent data, within a transaction.
> 
> Hmm, yes, thinking more about it: a non-transactional write of a node
> which hasn't been written or read by an ongoing transaction is not
> handled in a special way. This could be changed, but would require some
> structural changes.

And making a node visible by XS_DIRECTORY[_PART] doesn't count as
reading it.  But it does count as reading the parent ?
In principle adding or removing a node could be made to count as a
change to the containing directory.  But I don't think doing this as a
response to David's issue is sensible.

Ian.


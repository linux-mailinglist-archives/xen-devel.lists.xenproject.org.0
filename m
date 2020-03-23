Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73218F98F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 17:21:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGPnV-0007cc-VH; Mon, 23 Mar 2020 16:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=03z6=5I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jGPnU-0007cW-CL
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 16:19:28 +0000
X-Inumbo-ID: 11304c92-6d22-11ea-bec1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11304c92-6d22-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 16:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584980368;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=e8oejpzbvNN+PFimpmrjn43THJUGDilMr4mzaLtVSls=;
 b=Gh8KBGhJYpc+pgW3d93u9x/+MEjrEEb226DhhpEiuTwsI7WNkPycOg4m
 2+7hW3eTQr/Phacg/yqDYwYKHHfpS3qVPi31xRTRKEQt2lmFJSVsK9M9S
 Y+sa2g8VKEYOi3I6DcBLXMRSaROIw/aM5veSlO0xjG2GHUyJsDv+ncEHb g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a0NhsCEAIHyc+o5JYcBIS65N5cFRmem7/5ZOb1MiNHKl3MPnIBN22dMIGRHoukQoM5CLRR0V4B
 F61jM+3XrZAGz7FaYkOBtIN4eFASw20ZvlIKEdry7GPEdzzt3y4nla68n+GAnSYIcbd5uVwd11
 ij12wgdUC1p3BCz+IA1jQXeYoSLR9qfoW3L+zhDsQIXSnxN7n10LRP/B2ehGJMGH5g/OXBiuzv
 DLrk651+m1Rp18s9IVYAp3mOgFLrGPHav33nMkFyyATXEzEIokVPwiNOv7KzYZ+nkRP/Q+OltX
 pwk=
X-SBRS: 2.7
X-MesageID: 14480856
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,297,1580792400"; d="scan'208";a="14480856"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24184.57737.901978.106612@mariner.uk.xensource.com>
Date: Mon, 23 Mar 2020 16:19:21 +0000
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
In-Reply-To: <74b58f25-feed-d664-aab5-363ea72807de@citrix.com>
References: <20200323142900.22255-1-jgross@suse.com>
 <70f2493d-69b5-2765-137a-1ad63a5c2b96@citrix.com>
 <74b58f25-feed-d664-aab5-363ea72807de@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] tools/xenstore: don't close connection in
 xs_talkv()
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Sorry to come into this late.

Andrew Cooper writes ("Re: [Xen-devel] [PATCH] tools/xenstore: don't close connection in xs_talkv()"):
> On 23/03/2020 15:44, Andrew Cooper wrote:
> > On 23/03/2020 14:29, Juergen Gross wrote:
> >> In case of some errors xs_talkv() will close the connection to
> >> Xenstore. This is annoying as it is not clear to the caller in which
> >> error case the connection is still available.
> >>
> >> Drop that implicit closing to make the interface behave in a sane and
> >> predictable way.
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >
> > This definitely does improve the cascade failure cases.
> 
> Actually, I spoke too soon.  The EBADF goes, but the next read_message()
> ends up pulling junk out of the ring.

I'm afraid this is predictable.  For most of these errors there is
nothing else sensible that the client library could do.  The
connection has been rendered unuseable.  In principle I guess it could
reconnect to the socket, but this is a "should never happend" event.

EBADF is a worrying error because in many cases it means something has
messed up the process's fd space, which can easily lead to really bad
behaviours.

But having read the code in xenstore-ls, I see that as well as closing
the fd it sets the variable containing the fd number to -1.  So all
future calls return EBADF.

I think this is correct.

Ian.


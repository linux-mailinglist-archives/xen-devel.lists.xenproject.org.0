Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52AF1F951B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 13:17:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkn7V-0008WB-5l; Mon, 15 Jun 2020 11:17:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkn7U-0008W6-MF
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 11:17:40 +0000
X-Inumbo-ID: d1d9f06b-aef9-11ea-b7f5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1d9f06b-aef9-11ea-b7f5-12813bfff9fa;
 Mon, 15 Jun 2020 11:17:39 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: phlSTwlGDc+blEyPreYvkW/PoyrAa5zL+2v7HWYdFicrFzY1n+qq3inil5CfWSbHk4pR0FTiy+
 6getnJsnbyHculruL865rR1MtwtZXcqbre1CsQtjEjQIEjnRPeg0d77Fgkj0ntm5vYRkYEKgmR
 heiZNLtoqbntmzOive8zW4PRmcmBETSq+sU4+n6y2O/r30/9c0mbdkNQSYqq4bi4p+k57eC7fq
 FXh+g/BaKzBYhHyU1Nw/b1eTHe7CGolXxbKW79wA3YxGJ4/zE4sbiqPTaf6sLF3G1wmn5aaclw
 6MA=
X-SBRS: 2.7
X-MesageID: 20281770
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20281770"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.22733.121370.189379@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 12:17:33 +0100
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation
 of microcode load operation
In-Reply-To: <2d885485-c00f-9938-33fc-1f20d084b259@citrix.com>
References: <1591980255-18811-1-git-send-email-igor.druzhinin@citrix.com>
 <24291.45845.782250.165305@mariner.uk.xensource.com>
 <2d885485-c00f-9938-33fc-1f20d084b259@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <xadimgnik@gmail.com>, "wl@xen.org" <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Igor Druzhinin writes ("Re: [XEN PATCH for-4.14] tools/xen-ucode: fix error code propagation of microcode load operation"):
> On 12/06/2020 17:53, Ian Jackson wrote:
> > Unfortunately I don't think this is right.  errno might not fit into a
> > return value.
> 
> errno codes that Xen return are all lower than 127. It fits perfectly fine.

I don't think this is a stable aspect of Xen's ABI, is it ?  And of
course what you get from libxc is not a Xen errno in Xen encoding, but
a Xen errno in host errno encoding, whioch might be >=127 even if the
Xen number for the same EFOOBAR is <=127.

But anyway, if this is controversial I will drop it.

> Probably but that is identical to what was suggested.
> Cleaning resource is just a nice thing to do although unnecessary.
> Can change to just "return errno" if that's what you'd prefer.

Yes please.

Would you care to at least arrange for bad usage to exit nonzero ?
I will leave it up to you to resolve this quandry: your view is that
this program's exit status is a Xen errno value (in host encoding,
presumably, although you don't state this) but now you need to return
an error that didn't come from Xen.

Ian.


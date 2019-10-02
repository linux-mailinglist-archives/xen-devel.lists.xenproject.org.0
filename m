Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ADBC8D57
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 17:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFgol-00078F-Fp; Wed, 02 Oct 2019 15:45:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLuE=X3=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iFgoj-000785-MC
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 15:45:29 +0000
X-Inumbo-ID: a82f24da-e52b-11e9-9719-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id a82f24da-e52b-11e9-9719-12813bfff9fa;
 Wed, 02 Oct 2019 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570031128;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=vgCYk/5hfqM9Rl2dIRoJDkKyqem+gQHCc1GcLBJOYdI=;
 b=BBEIDtq6Pj+xmYD1OJRZwwv7xeL1mx05t6nGqQDXo5CsJF+wjXAQdJP6
 h28BFA8vDzxgpRLtg0nXP7UKawBFrcdUFW6yl8rrfUyUhawxwLsKE30tG
 IeAjneaiFx/1fCyJyP6ulH1dF/aOBoDUxtmMJ4uEhE4YEq2+GFVaFb807 w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wKosujEYffY/gwjeXLMu6ZS1M/rKc8xXKb5CBo4nzT1AQRVSN1ygzZNRi1niGAeMZaPxP63wmS
 kzC64N8LeCzyDzVYJK3JKjaeGgM0vpEdVQaS0BXlA7FtG1wh5DW10hKgJqBLEEzS+HBCn2Qedw
 pcgHlRkEbj2kyEPd2A9zPpE6dpA6BNjjWjJhVky+5wighQ7T1FlbfEJbcF2AU+vhBM8sc2HN2v
 +/Fmjc9zL7a21uLqu7tjWXYGBTbfgm2XgLEG+s69cSOTn9wqXURKy7dy6g+Z6cA3TcxVPUitU7
 jyA=
X-SBRS: 2.7
X-MesageID: 6622873
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,574,1566878400"; 
   d="scan'208";a="6622873"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="mNAOaWS+FL"
Content-Transfer-Encoding: 7bit
Message-ID: <23956.50708.749190.711920@mariner.uk.xensource.com>
Date: Wed, 2 Oct 2019 16:45:24 +0100
To: Juergen Gross <jgross@suse.com>
In-Reply-To: <20190930172327.784520-1-anthony.perard@citrix.com>
References: <20190930172327.784520-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 0/2] libxl fixes with pci passthrough
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--mNAOaWS+FL
Content-Type: text/plain; charset="us-ascii"
Content-Description: message body text
Content-Transfer-Encoding: 7bit

Hi Juergen.  Here's another bugfix series
  https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg03320.html
  https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git
  #br.fixes-for-pci-pt-libxl-v1
needing your release review.

Here's the cover letter.  I can bounce you a digest if you like.

Thanks,
Ian.


--mNAOaWS+FL
Content-Type: message/rfc822
Content-Description: forwarded message
Content-Transfer-Encoding: 7bit

Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Return-Path: <anthony.perard@citrix.com>
Envelope-to: iwj@localhost
Delivery-date: Mon, 30 Sep 2019 18:23:36 +0100
Received: from localhost ([::1] helo=mariner.uk.xensource.com)
	by mariner.uk.xensource.com with esmtp (Exim 4.89)
	(envelope-from <anthony.perard@citrix.com>)
	id 1iEzOZ-0000hy-Lx
	for iwj@localhost; Mon, 30 Sep 2019 18:23:36 +0100
Received: from mail.citrix.com [10.9.164.206]
	by mariner.uk.xensource.com with IMAP (fetchmail-6.3.26)
	for <iwj@localhost> (single-drop); Mon, 30 Sep 2019 18:23:35 +0100 (BST)
Received: from FTLPEX02AMS01.citrite.net (10.13.108.166) by
 AMSPEX02CL02.citrite.net (10.69.22.126) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Mailbox Transport; Mon, 30 Sep 2019 19:23:31 +0200
Received: from FTLPEX02CAS04.citrite.net (10.13.99.237) by
 FTLPEX02AMS01.citrite.net (10.13.108.166) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 30 Sep 2019 13:23:28 -0400
Received: from ukmail1.uk.xensource.com (10.9.154.239) by smtprelay.citrix.com
 (10.13.99.237) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 30 Sep 2019 13:23:28 -0400
Received: from [10.80.2.84] (helo=perard.uk.xensource.com)
	by ukmail1.uk.xensource.com with esmtp (Exim 4.69)
	(envelope-from <anthony.perard@citrix.com>)
	id 1iEzOR-00030z-M6; Mon, 30 Sep 2019 18:23:27 +0100
Thread-Topic: [PATCH 0/2] libxl fixes with pci passthrough
Thread-Index: AQHVd7PIWECAAB8QmkSCd3shlpyBaA==
Message-ID: <20190930172327.784520-1-anthony.perard@citrix.com>
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Exchange-Organization-AuthSource: FTLPEX02CAS04.citrite.net
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.23.0
From: Anthony PERARD <anthony.perard@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Anthony Perard <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Ian
 Jackson" <Ian.Jackson@citrix.com>
Subject: [PATCH 0/2] libxl fixes with pci passthrough
Date: Mon, 30 Sep 2019 18:23:25 +0100

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.fixes-f=
or-pci-pt-libxl-v1

Hi,

Some fixes following the recent changes to use ev_qmp in libxl.

Anthony PERARD (2):
  libxl_pci: Don't ignore PCI PT error at guest creation
  libxl_pci: Fix guest shutdown with PCI PT attached

 tools/libxl/libxl_pci.c | 43 +++++++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 15 deletions(-)

--=20
Anthony PERARD


--mNAOaWS+FL
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--mNAOaWS+FL--


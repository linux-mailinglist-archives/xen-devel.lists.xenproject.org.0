Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A3D1AC562
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 16:18:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP5LH-0006SG-PH; Thu, 16 Apr 2020 14:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IxKm=6A=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jP5LG-0006SB-MF
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 14:18:10 +0000
X-Inumbo-ID: 18d10a76-7fed-11ea-b4f4-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18d10a76-7fed-11ea-b4f4-bc764e2007e4;
 Thu, 16 Apr 2020 14:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587046690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Kh3BmGMTXO9P5LsWmgax8Nkxw/HZZ74qwzH8KOZvnEM=;
 b=LbdF3kOI2VwG1mhyutV0gG4jpTAWFt80PP0W4/N8nYoK7Y6nKWNWITXX
 gg7vup+4FxGPhp8EBzMY+FlH59NO9JcSb/OVGeFP1oPX0Y1UAi5u5SA4T
 Bgkumzwu0w+38c5X8DVJaXY+KCx/cwF3XNWNA5mOQ5E52nxbncuxj4gds k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: igkCrR43vR+I/WSxy3qHtrkK8+NajL66CnFaQAXwphlv+exSsRge3ssGaJJ2CotAZ96DATBjsV
 mxDeGLo06KmCst1NyKZoeTaYlaw9eBwqZysJJ36WidO5+v1MOnDRsueiPleOIG/R6g3BmhiuDl
 7IcMccig8Mgp8gnCzjqvAW7BG0uWt9JFBg8RYQjbh+fEAKQUvFwEb0qt6pKKYOKB3eMSxtMZon
 qjb39SE77g/3nZROsAYE4JpJcrYfHwAfe/OzxZKjofmA4ayfJRl4mELTOZ+S0aQUxgJIDHNJyG
 MBE=
X-SBRS: 2.7
X-MesageID: 15767899
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,391,1580792400"; d="scan'208";a="15767899"
Date: Thu, 16 Apr 2020 15:17:52 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v4 18/18] build, include: rework compat-build-header.py
Message-ID: <20200416141752.GK4088@perard.uk.xensource.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-19-anthony.perard@citrix.com>
 <7bd39b51-5dee-40f5-1524-f36aad6b7d06@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7bd39b51-5dee-40f5-1524-f36aad6b7d06@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 08, 2020 at 03:56:02PM +0200, Jan Beulich wrote:
> On 31.03.2020 12:31, Anthony PERARD wrote:
> > Replace a mix of shell script and python script by all python script.
> > 
> > Remove the unnecessary "grep -v '^# [0-9]'". It is to hide the
> > linemarkers generated by the preprocessor. But adding -P inhibit there
> > generation, thus the grep isn't needed anymore.
> > 
> > gcc -E -P and clang -E -P have different behavior. While both don't
> > generates linemarkers, gcc also removes all empty lines while clang
> > keep them all. We don't need those empty lines, so we don't generates
> > them in the final compat/%.h headers. (This replace `uniq` which was
> > only de-duplicating empty line.)
> > 
> > The only changes in the final generated headers it that they don't
> > have empty lines anymore.
> 
> Making them harder to read? While typically no-one needs to look at
> their contents, in case of problems it helps if generated files are
> half way accessible to a human as well.

I do think they are still readable. Those empty lines don't add much.
There are so many of them that a `uniq` is needed...

For example, with dm_op.h, we have this:

<<<<<<< before
#pragma pack(4)
typedef uint16_t ioservid_compat_t;
struct compat_dm_op_create_ioreq_server {

    uint8_t handle_bufioreq;
    uint8_t pad[3];

    ioservid_compat_t id;
};
struct compat_dm_op_get_ioreq_server_info {

    ioservid_compat_t id;

    uint16_t flags;

    evtchn_port_compat_t bufioreq_port;

    uint64_t ioreq_gfn;

    uint64_t bufioreq_gfn;
};
struct compat_dm_op_ioreq_server_range {

    ioservid_compat_t id;
    uint16_t pad;

    uint32_t type;

    uint64_t start, end;
};
=======
#pragma pack(4)
typedef uint16_t ioservid_compat_t;
struct compat_dm_op_create_ioreq_server {
    uint8_t handle_bufioreq;
    uint8_t pad[3];
    ioservid_compat_t id;
};
struct compat_dm_op_get_ioreq_server_info {
    ioservid_compat_t id;
    uint16_t flags;
    evtchn_port_compat_t bufioreq_port;
    uint64_t ioreq_gfn;
    uint64_t bufioreq_gfn;
};
struct compat_dm_op_ioreq_server_range {
    ioservid_compat_t id;
    uint16_t pad;
    uint32_t type;
    uint64_t start, end;
};
>>>>>>> after

Thanks,

-- 
Anthony PERARD


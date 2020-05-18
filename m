Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F491D7B38
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:28:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagkI-0005dr-7x; Mon, 18 May 2020 14:27:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuVG=7A=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jagkH-0005df-1w
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:27:57 +0000
X-Inumbo-ID: c3d3a23c-9913-11ea-a86b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3d3a23c-9913-11ea-a86b-12813bfff9fa;
 Mon, 18 May 2020 14:27:56 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fYSolxNRxRa2055MhTyahWx4GARPya8AIgN0+NMWPwVOK1TGuSjZMmlJOKVJ6xArKDGAJTDjrs
 m/wWrlW643N5/ZRkiRIQHsWBUfbKEmZWkVoxrH98GR2GF31tdBcb859MPR8qhnmrXLge8T4cA/
 xMhMy/kA7AlVUyLpMIOmjA9P2oek9AcKmwFIMGDdNNWPPWnImC0yhsNxVTTjgvHcpzFugu3Ge+
 FUI5Ja4Lr+M/dzLShLopnK2X7BBRq9SKw5bxPqkOuTxyXl1dy1qyN0z+1PLiqNqmHVsvFTlCLg
 RVM=
X-SBRS: 2.7
X-MesageID: 17821438
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,407,1583211600"; d="scan'208";a="17821438"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24258.39782.953526.84349@mariner.uk.xensource.com>
Date: Mon, 18 May 2020 15:27:50 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v6 14/18] libxl: require qemu in dom0 for multiple
 stubdomain consoles
In-Reply-To: <20200518011353.326287-15-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
 <20200518011353.326287-15-jandryuk@gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v6 14/18] libxl: require qemu in dom0 for multiple stubdomain consoles"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Device model stubdomains (both Mini-OS + qemu-trad and linux + qemu-xen)
> are always started with at least 3 consoles: log, save, and restore.
> Until xenconsoled learns how to handle multiple consoles, this is needed
> for save/restore support.
> 
> For Mini-OS stubdoms, this is a bug.  In practice, it works in most
> cases because there is something else that triggers qemu in dom0 too:
> vfb/vkb added if vnc/sdl/spice is enabled.
> 
> Additionally, Linux-based stubdomain waits for all the backends to
> initialize during boot. Lack of some console backends results in
> stubdomain startup timeout.
> 
> This is a temporary patch until xenconsoled will be improved.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>


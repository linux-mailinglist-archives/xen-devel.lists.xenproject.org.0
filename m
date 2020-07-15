Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18609221336
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvkt7-0007j1-CX; Wed, 15 Jul 2020 17:08:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pvp=A2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jvkt6-0007ir-Ba
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:08:08 +0000
X-Inumbo-ID: c07006f8-c6bd-11ea-9426-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c07006f8-c6bd-11ea-9426-12813bfff9fa;
 Wed, 15 Jul 2020 17:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594832888;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=qTgzyhjsAt/1FKsWB9d9JIii+uf1SPMOShrWMF/KTM8=;
 b=avH/RFdQH4n/qRqAfUW1DolK3HuLN25/TuBwQKedEYLSclmpDmsB0heZ
 PTJ6ier/yxlcR8cDwJGBbtOx+Sbfm2bu9k94PfcLnJnZEEjK6RC2ALU9X
 kUpWKSKtEI4fthRv5c7TAhmCrG/OxhxB33G1j9II9pPZBXOXjfNA25mHY o=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eeRG5UZqRpKInzxF2ZlmT8QAvkN+a6snyMzpC15UyrExHNKCWULJptKXH8f4cCeGGi/Qs5m0p6
 TQYs0kSN3BpaqG6ZNM3vcWIJKO0v+/kM7Uw+deSZNOgw1mq+aldSSbsbB1CeyyXnAutJJMmtnB
 pQYeOkVcx1T6yiKZonGg9pBbnZ+i2vj5BNgRVnQ3DYqaclG+1Z+Jkkr7flnljTMTdVQ9UJ2BSr
 tScXYWnLXH+KUGCMO5rL8BVATkDltt1Te8E6+VkhFWeien7QBGv+Mwd1CI1rV+4J5SAIEEygsp
 JTU=
X-SBRS: 2.7
X-MesageID: 22461457
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22461457"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24335.14321.25667.767614@mariner.uk.xensource.com>
Date: Wed, 15 Jul 2020 18:08:01 +0100
To: "incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com"
 <incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 08/12] tools: move libxenctrl below tools/libs
In-Reply-To: <20200715162511.5941-10-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-10-ian.jackson@eu.citrix.com>
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
Cc: "xen-devel@dornerworks.com" <xen-devel@dornerworks.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Perard <anthony.perard@citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("[PATCH 08/12] tools: move libxenctrl below tools/libs"):
> From: Juergen Gross <jgross@suse.com>
> 
> Today tools/libxc needs to be built after tools/libs as libxenctrl is
> depending on some libraries in tools/libs. This in turn blocks moving
> other libraries depending on libxenctrl below tools/libs.
> 
> So carve out libxenctrl from tools/libxc and move it into
> tools/libs/ctrl.

Again, maybe this could be 1. split the library, 2. move it ?  Maybe ?

Ian.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A324248849
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 16:53:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k82yq-000756-1W; Tue, 18 Aug 2020 14:52:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eNH=B4=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k82yo-000751-SI
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 14:52:50 +0000
X-Inumbo-ID: efc961fd-7f75-4c8a-812a-08f2597567d5
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efc961fd-7f75-4c8a-812a-08f2597567d5;
 Tue, 18 Aug 2020 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597762368;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=quKKpDoKgkrILHRI8LSNM+4X8foj6y88NZy0gutsHoo=;
 b=cReDzL0br1uqSqdL2HKR9iCZBj5UVZe9cWA6gwH1OzbDSkZ+N4TvRoRr
 u+i9NP+yBSkUeto+2n5asHAlZUge8ghVNAqrVxdO6gIgHNHy2HFuHKbvW
 XYPsROFluzZEkk+708mFkxxYBkDHv27O11nz+tr6WYVKDp3inxRDpv7Rl A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 76y1kyRwqHumRo5sOzTb8iaU/ijAsKVbYXueuHQ7TfN/oxcwxmYDOhhVrJ9Rg0pV71jqs+dfJU
 QXQH+cWK4rhTy5g/dJSr6ik9I+XbWC3OT11zx8MGLi7o2dYb756i/t/RLFJ8dZZoOKlJq+oWRU
 COp2i6BF/hLGXYdlEQLhZ8ZdLA0LwKD61fUWK0oejwV3YOlRzwSOKXMX2gd8vcHz1DWxyXT2RY
 +z3t9oP0Y09iKNmwyj7jPPwgyGSeeKyYluDRIeGXeVfmnoPZg9LkwXWl34wcIXNY/NWc3ire/0
 0AE=
X-SBRS: 2.7
X-MesageID: 25092668
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25092668"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24379.60221.451195.117096@mariner.uk.xensource.com>
Date: Tue, 18 Aug 2020 15:52:45 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] qemu-trad: remove Xen path dependencies
In-Reply-To: <e8fb7525-4ff5-be8b-5eba-e632f618328a@suse.com>
References: <20200715090140.7590-1-jgross@suse.com>
 <e8fb7525-4ff5-be8b-5eba-e632f618328a@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jürgen Groß writes ("Re: [PATCH] qemu-trad: remove Xen path dependencies"):
> On 15.07.20 11:01, Juergen Gross wrote:
> > xen-hhoks.mak contains hard wired paths for the used libraries of
> > qemu-trad. Replace those by the make variables from Xen's Rules.mk,
> > which is already included.
> > 
> > This in turn removes the need to add the runtime link paths of the
> > libraries the directly used libraries depend on.
> > 
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Ping?

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>


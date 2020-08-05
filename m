Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84223C936
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 11:31:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Fl4-0002F5-FU; Wed, 05 Aug 2020 09:30:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gIoy=BP=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k3Fl2-0002Eu-G7
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 09:30:48 +0000
X-Inumbo-ID: 6e0fff47-94e1-4858-8d70-2fa76597c762
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e0fff47-94e1-4858-8d70-2fa76597c762;
 Wed, 05 Aug 2020 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596619846;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=lzfvJxrHS0Et5UN/cVHgV6f2deW+qBdLKRzU9y4olOI=;
 b=NdHsh1E13Qo8gz695SLtvVOfWOF7otjgSv4kyqO1GO/YrXKp3zBSz8Br
 xv4bdv1LdJTB1Le/in/vtTkCiOovHR+MhZjsTD7X12hIBAyWT3Txc221v
 OlgujmFJTEsxMuYfIEVh8bOO9vjY6UTsX2kLKP/mqWuig3Pw4+HxmLn/+ 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: wFrC9A4r2LswraUKLm6BfTo3aXG1nTqddDLyedpxW0n5MQua+NYGBAKQ6eJaM/4R8LDM4IcaaX
 TcHE5GC7zGfDFYPNKGxpTqfgRAEmdNSx2/RtVT97nD7aKaOFIF2Jvji/tP7MlwHaXQqmJlnAth
 B5uKikGtlbdUuam2F+I27x7tHmw6ApqDlf0ak8Yr/8L3n0MpTjLTa5iuJjsAW8EJVTY7xGmrbB
 WFVpCcp6csVHuEEhUirtmgYqLFQ76k5Wx/kzsMOsgbAks8xkY6CG7+DxFrMNrXEgNKOIs2/+oh
 CUM=
X-SBRS: 3.7
X-MesageID: 24092280
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24092280"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24362.31810.819871.943707@mariner.uk.xensource.com>
Date: Wed, 5 Aug 2020 10:30:42 +0100
To: "paul@xen.org" <paul@xen.org>
Subject: RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
In-Reply-To: <002801d66a63$85fb8c10$91f2a430$@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-5-paul@xen.org>
 <24361.17132.762055.478992@mariner.uk.xensource.com>
 <002001d66a51$3cd055f0$b67101d0$@xen.org>
 <24361.18433.500622.984594@mariner.uk.xensource.com>
 <002801d66a63$85fb8c10$91f2a430$@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 'Paul
 Durrant' <pdurrant@amazon.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("RE: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore"):
> > -----Original Message-----
> > From: Ian Jackson <ian.jackson@citrix.com>
...
> > Actually.
> > 
> > This shouldn't be in the frontend at all, should it ?  In general the
> > backend writes to the backend and the frontend to the frontend.
> > 
> > So maybe I need to take back my R-b of
> >   [PATCH v2 3/4] public/io/netif: specify MTU override node
> > 
> > Sorry for the confusion.  I seem rather undercaffienated today.
> 
> Too late. The xenstore node has been used by Windows frontends for the best part of a decade so we can't practically change the
> path. Another way would be to also modify netback to simply echo the value from backend into frontend, but that seems rather
> pointless.

Hmm.  How does this interact with driver domains ?  I think a driver
domain might not have write access to this node.

Is there a value we can store in it that won't break these Windows
frontends, that libxl in the toolstack domain could write, before the
hotplug script runs in the driver domain ?

> Interestingly libxl does define an 'mtu' field for libxl_device_nic, which it sets to 1492 in libxl__device_nic_setdefault() but
> never writes it into xenstore. There is even a comment:
> 
> /* nic->mtu = */
> 
> in libxl__nic_from_xenstore() which implies it should have been there, but isn't.
> I still think picking up the MTU from the bridge is the better way though. 

I agree that the default should come from the bridge.  Ideally there
would be a way to override it in the config.

Thanks,
Ian.


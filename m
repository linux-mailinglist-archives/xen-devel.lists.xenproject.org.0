Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290D23B939
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:11:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2uqV-0003FS-OJ; Tue, 04 Aug 2020 11:11:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MwBG=BO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k2uqU-0003FJ-AD
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:11:02 +0000
X-Inumbo-ID: 8f5d179d-7c52-4e16-b593-b66717bb9e96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f5d179d-7c52-4e16-b593-b66717bb9e96;
 Tue, 04 Aug 2020 11:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596539460;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=7YWwNl0mEVEyS39mTw7Lz8R/igO1S3WG31NYnfYu0ZA=;
 b=TSBpjusiqJad4HE1ZNYFlJE2sx450NTFAKrIr2BXzM3BKhS7lV55P8CZ
 OTvZjJI0yXe1d2ssCSNiNpxzaZy7iJKWgtwCUp0ZU16fgokkNHCzd8mPd
 Q+ByBEjhewkgzqYoSfwJ/Gz5d/90xcRgs8i8HmBqW1Sp7nzkPy+9ZMTsW Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: J9o/DeEgSlB37WfzxUgdDwYW1NtPy1vrlz+ZxAtGdUUowOgadXrDW23xO6gZgxB9Ofv2+tCobh
 6RRVHRlF09881Ufb0juAM7S8BNWFmipzxlK+6xM2ar8iKvrNsJgT47069MNkENpjo3IBPt2LOU
 TweQzvrAf4A7U4RdjYIQmGOXJJNyTRG7/4RK2Z/nNvKAYPjoKItHkKpPDknTRd7H9pDFz5W7Ke
 8wZyDlvDG9C9IIxZj7AB6w2HvX9jgUiBJQowUpv7n+z7PDkuUqArHsPR9SaatKCxOfP66i8f8R
 DXk=
X-SBRS: 3.7
X-MesageID: 24129520
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,433,1589256000"; d="scan'208";a="24129520"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24361.16958.407583.382490@mariner.uk.xensource.com>
Date: Tue, 4 Aug 2020 12:10:54 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 3/4] public/io/netif: specify MTU override node
In-Reply-To: <20200803124931.2678-4-paul@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-4-paul@xen.org>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul
 Durrant <pdurrant@amazon.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v2 3/4] public/io/netif: specify MTU override node"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> There is currently no documentation to state what MTU a frontend should
> adertise to its network stack. It has however long been assumed that the
> default value of 1500 is correct.
> 
> This patch specifies a mechanism to allow the tools to set the MTU via a
> xenstore node in the frontend area and states that the absence of that node
> means the frontend should assume an MTU of 1500 octets.
> 
> NOTE: The Windows PV frontend has used an MTU sampled from the xenstore
>       node specified in this patch.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

> +/*
> + * MTU
> + * ===
> + *
> + * The toolstack may set a value of MTU for the frontend by setting the
> + * /local/domain/<domid>/device/vif/<vif>/mtu node with the MTU value in
> + * octets. If this node is absent the frontend should assume an MTU value
> + * of 1500 octets. A frontend is also at liberty to ignore this value so
> + * it is only suitable for informing the frontend that a packet payload
> + * >1500 octets is permitted.
> + */

I find this wording a bit clumsy - a more formal treatment might be
better - but in my reading the overall semantics are correct.

Thanks,X
Ian.


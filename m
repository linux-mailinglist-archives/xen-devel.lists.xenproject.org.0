Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECD23B934
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:07:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2umQ-0002IO-LM; Tue, 04 Aug 2020 11:06:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MwBG=BO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k2umO-0002IJ-Kl
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:06:48 +0000
X-Inumbo-ID: a554e09f-f153-4f35-916c-f969ca5cc7c2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a554e09f-f153-4f35-916c-f969ca5cc7c2;
 Tue, 04 Aug 2020 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596539208;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=aRRm9AtF4JI4OwPE6/C24E09a/p3FpZlFw/JCID9GQE=;
 b=ZdQJ4bw/LNNvkQtMQFSRR/lwvKQdk0F28QiFhX+6BwDCU9l+d1QmA4pg
 It4gHbii080ElrtP9fRF79EsYScokT96cd6Ry+EZkgODPf9dNi4Qr0cob
 EBznWeYVreG3VpQPlWAJtdldFBBbsBwg0qfyqiFuo/uVzJLlSX2ML2LgQ 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: C7tKztucSK0C5k6Qce20AC1Orb5MB3kNMSAmv/Ia9Kbzm9pqawRt8lYYVS5AXUHs9SnGx4uG4T
 xXBYxbY3d7UGicccUC3TC0w6rEA1poBepkjIRUU+BH5xIxBzTsEP50lapmIZmNuiMZQ1rp2ofq
 k6H+ZyS78O6PXOctKKCJOTWX1J/qmH06DjkzQ9malDVTMO/0zZkoIHejP7eIxf+QCPPvlwbNfE
 VwOvPy0KcdUarie06K+MZnM7pQbOqyMrHbcCW7ca7uvM16QpvxWEWzhxBrQEM20039g7QKc6Vt
 g04=
X-SBRS: 3.7
X-MesageID: 23820123
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,433,1589256000"; d="scan'208";a="23820123"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24361.16705.741010.285482@mariner.uk.xensource.com>
Date: Tue, 4 Aug 2020 12:06:41 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/4] tools/hotplug: add remove_from_bridge() and improve
 debug output
In-Reply-To: <20200803124931.2678-2-paul@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-2-paul@xen.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v2 1/4] tools/hotplug: add remove_from_bridge() and improve debug output"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch adds a remove_from_bridge() function into xen-network-common.sh
> to partner with the existing add_to_bridge() function. The code in
> add_to_bridge() is also slightly re-arranged to avoid duplication calls of
> 'ip link'.
> 
> Both add_to_bridge() and remove_from_bridge() will check if their bridge
> manipulation operations are necessary and emit a log message if they are not.
> 
> NOTE: A call to remove_from_bridge() will be added by a subsequent patch.

I think there is another semantic change here which is that now it
executes the "ip link set up" even if the device is already on the
bridge.

I think this is correct, but it probably ought to be mentioned in the
commit message.

I hesitate to suggest this, but: my personal preference would have
been to split that refactoring (in particular, the inversion of the
early exit if approach) into yet another commit.  I find tiny commits
easier to review.  But this commit is already quite small so if you
prefer to keep it this way I think that is fine.

> +remove_from_bridge () {
> +    local bridge=$1
> +    local dev=$2
> +
> +    ip link set dev ${dev} down || :
> +
> +    # Don't remove $dev from $bridge if it's not on the bridge.
> +    if [ -e "/sys/class/net/${bridge}/brif/${dev}" ]; then
> +	log debug "removing $dev from bridge $bridge"
> +	if which brctl >&/dev/null; then
> +            brctl delif ${bridge} ${dev}
> +	else
> +            ip link set ${dev} nomaster
> +	fi
> +    else
> +	log debug "$dev not on bridge $bridge"
> +    fi
> +}

I think this is code motion split into two patches - here the added
code and in 2/, the other copy is removed.  Could you please shuffle
this addition into patch 2 ?

Thanks,
Ian.


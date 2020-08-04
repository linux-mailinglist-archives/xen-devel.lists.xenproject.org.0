Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D8923B93E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 13:14:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2utH-0003PK-6A; Tue, 04 Aug 2020 11:13:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MwBG=BO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k2utF-0003PF-Ko
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:13:53 +0000
X-Inumbo-ID: c322cf2b-fd05-4175-85f5-91d7e203133c
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c322cf2b-fd05-4175-85f5-91d7e203133c;
 Tue, 04 Aug 2020 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596539632;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=xPd0M6dS+gWw72ToZDPJNht/q6Pm33+jr2PKdlHuuk8=;
 b=ZgajaVtrd4grGVW4Np9st8H2vDUkZPwGwsO+pINBhGmwDjfzKqOlbiOK
 /q16HRXqxmx3STHrs9lXkqtKwbj9rvePhxQNRgHsq46QbdIpRBrZ6bRd5
 1gF4jU/SMRsBcoH0SXD9rpFF6VzrkRZW65rbDJMDVqylX+nGk3ozGglTx w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Mx05ncDJQ41Myh8L0mPSVtcZFHtur6JAz5rz5gOcM839mQEaGV9kzI/jqWkHVeBpcIxmb3nOIE
 PWzzACCoKIe73bkJUum2gpCZPstyGgX8o8/rQvfvB1nj6YRFEdqLgoP2TPYzXeSLztu3gzyIJx
 q7uAbySHiinEIpGdA9+xbXAGdPOozrlpUar5G3n77jx5QR3PsaJVAPW8AjEZ311FNaMeHYEXp0
 O6731Il2MmXKIgoQuk8IMtnBWCSRTITlLlF+c6YDlQQalsNBqvu1g2AFIa+JwvLGWsqSZNc5tK
 ex0=
X-SBRS: 3.7
X-MesageID: 23820543
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,433,1589256000"; d="scan'208";a="23820543"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24361.17132.762055.478992@mariner.uk.xensource.com>
Date: Tue, 4 Aug 2020 12:13:48 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the
 frontend via xenstore
In-Reply-To: <20200803124931.2678-5-paul@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-5-paul@xen.org>
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
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v2 4/4] tools/hotplug: modify set_mtu() to inform the frontend via xenstore"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> set_mtu() currently sets the backend vif MTU but does not inform the frontend
> what it is. This patch adds code to write the MTU into a xenstore node. See
> netif.h for a specification of the node.
> 
> NOTE: There is also a small modification replacing '$mtu' with '${mtu}'
>       for style consistency.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

> diff --git a/tools/hotplug/Linux/xen-network-common.sh b/tools/hotplug/Linux/xen-network-common.sh
> index 37e71cfa9c..24fc42d9cf 100644
> --- a/tools/hotplug/Linux/xen-network-common.sh
> +++ b/tools/hotplug/Linux/xen-network-common.sh
> @@ -164,9 +164,21 @@ remove_from_bridge () {
>  set_mtu () {
>      local bridge=$1
>      local dev=$2
> +    local type_if=$3
> +
>      mtu="`ip link show dev ${bridge}| awk '/mtu/ { print $5 }'`"
>      if [ -n "$mtu" ] && [ "$mtu" -gt 0 ]
>      then
> -            ip link set dev ${dev} mtu $mtu || :
> +            ip link set dev ${dev} mtu ${mtu} || :
> +    fi
> +
> +    if [ ${type_if} = vif ]
> +    then
> +       dev_=${dev#vif}
> +       domid=${dev_%.*}
> +       devid=${dev_#*.}
> +
> +       XENBUS_PATH="/local/domain/$domid/device/vif/$devid"
> +       xenstore_write "$XENBUS_PATH/mtu" ${mtu}

It's surprising to me that this code doesn't have the xenbus path
already in some variable.  But I guess from the fact that you've added
this code, that it doesn't.

Ian.


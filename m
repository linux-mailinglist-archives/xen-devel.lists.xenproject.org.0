Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DC9224D7B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 20:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwrQI-0002Kx-00; Sat, 18 Jul 2020 18:18:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+0x8=A5=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jwrQG-0002Ka-6j
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 18:18:56 +0000
X-Inumbo-ID: 23d12cb0-c923-11ea-bb8b-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23d12cb0-c923-11ea-bb8b-bc764e2007e4;
 Sat, 18 Jul 2020 18:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id C768B2939;
 Sat, 18 Jul 2020 20:18:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7D08i3-8rTd8; Sat, 18 Jul 2020 20:18:54 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 12AAC1A5D;
 Sat, 18 Jul 2020 20:18:54 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jwrQD-009BGv-5H; Sat, 18 Jul 2020 20:18:53 +0200
Date: Sat, 18 Jul 2020 20:18:53 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/12] stubdom: add stubdom/mini-os.mk for Xen paths used
 by Mini-OS
Message-ID: <20200718181853.t4zkpvnngrfcs2r4@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com,
 xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com,
 Juergen Gross <jgross@suse.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-3-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200715162511.5941-3-ian.jackson@eu.citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: Juergen Gross <jgross@suse.com>, ian.jackson@eu.citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson, le mer. 15 juil. 2020 17:25:00 +0100, a ecrit:
> From: Juergen Gross <jgross@suse.com>
> 
> stubdom/mini-os.mk should contain paths used by Mini-OS when built as
> stubdom.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/mini-os.mk | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 stubdom/mini-os.mk
> 
> diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
> new file mode 100644
> index 0000000000..32528bb91f
> --- /dev/null
> +++ b/stubdom/mini-os.mk
> @@ -0,0 +1,17 @@
> +# Included by Mini-OS stubdom builds to set variables depending on Xen
> +# internal paths.
> +#
> +# Input variables are:
> +# XEN_ROOT
> +# MINIOS_TARGET_ARCH
> +
> +XENSTORE_CPPFLAGS = -isystem $(XEN_ROOT)/tools/xenstore/include
> +TOOLCORE_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toolcore
> +TOOLLOG_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/toollog
> +EVTCHN_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/evtchn
> +GNTTAB_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/gnttab
> +CALL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/call
> +FOREIGNMEMORY_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/foreignmemory
> +DEVICEMODEL_PATH = $(XEN_ROOT)/stubdom/libs-$(MINIOS_TARGET_ARCH)/devicemodel
> +CTRL_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
> +GUEST_PATH = $(XEN_ROOT)/stubdom/libxc-$(MINIOS_TARGET_ARCH)
> -- 
> 2.20.1
> 

-- 
Samuel
 Créer une hiérarchie supplementaire pour remedier à un problème (?) de
 dispersion est d'une logique digne des Shadocks.
 * BT in: Guide du Cabaliste Usenet - La Cabale vote oui (les Shadocks aussi) *


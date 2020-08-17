Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1224643E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 12:17:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7cCW-00014E-Bw; Mon, 17 Aug 2020 10:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDWc=B3=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1k7cCV-000149-KQ
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 10:17:11 +0000
X-Inumbo-ID: 2e47fe83-72c3-4a8d-9098-a292693a18ff
Received: from hera.aquilenet.fr (unknown [2a0c:e300::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e47fe83-72c3-4a8d-9098-a292693a18ff;
 Mon, 17 Aug 2020 10:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id ECC633159;
 Mon, 17 Aug 2020 12:17:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x3KhW64Hhigc; Mon, 17 Aug 2020 12:17:09 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 44E69309B;
 Mon, 17 Aug 2020 12:17:09 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k7cCS-001Xzg-40; Mon, 17 Aug 2020 12:17:08 +0200
Date: Mon, 17 Aug 2020 12:17:08 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH II v2 17/17] tools: move libxenctrl below tools/libs
Message-ID: <20200817101708.widu6u4p35x35cbi@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <20200817094922.15768-1-jgross@suse.com>
 <20200817094922.15768-18-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200817094922.15768-18-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Juergen Gross, le lun. 17 août 2020 11:49:22 +0200, a ecrit:
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 6fcecadeb9..440adc2eb4 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile

> diff --git a/stubdom/mini-os.mk b/stubdom/mini-os.mk
> index 32528bb91f..b1387df3f8 100644
> --- a/stubdom/mini-os.mk
> +++ b/stubdom/mini-os.mk

For these,

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>


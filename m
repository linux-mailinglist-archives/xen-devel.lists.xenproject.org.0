Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE03094FC
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 12:51:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78821.143533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5oln-0001D2-W6; Sat, 30 Jan 2021 11:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78821.143533; Sat, 30 Jan 2021 11:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5oln-0001Cd-Ss; Sat, 30 Jan 2021 11:50:27 +0000
Received: by outflank-mailman (input) for mailman id 78821;
 Sat, 30 Jan 2021 11:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcvp=HB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5olm-0001CY-Eh
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 11:50:26 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 341a9fc7-bd8d-46e9-bb4e-f499c552b809;
 Sat, 30 Jan 2021 11:50:23 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10UBoDBV024245;
 Sat, 30 Jan 2021 12:50:13 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 5364B281D; Sat, 30 Jan 2021 12:50:13 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 341a9fc7-bd8d-46e9-bb4e-f499c552b809
Date: Sat, 30 Jan 2021 12:50:13 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <20210130115013.GA2101@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org>
 <YBKbEhavZlpD75fU@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBKbEhavZlpD75fU@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Sat, 30 Jan 2021 12:50:13 +0100 (MET)

On Thu, Jan 28, 2021 at 12:08:02PM +0100, Roger Pau Monné wrote:
> [...]
> Also, the qemu-ifup script doesn't seem to be part of the NetBSD
> scripts that are upstream, is this something carried by the NetBSD
> package?

Actually, the script is part of qemu-xen-traditional:
tools/qemu-xen-traditional/i386-dm/qemu-ifup-NetBSD

and it's installed as part of 'make install'. The same script can be used
for both qemu-xen-traditional and qemu-xen as long as we support only
bridged mode by default.

qemu-xen-traditional did call the script with the bridge name.
This patch makes qemu-xen call the script with the same parameters,
and add the XEN_DOMAIN_ID environnement variable.

Is it OK to keep the script from qemu-xen-traditional (and installed as
part of qemu-xen-traditional) for now ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--


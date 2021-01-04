Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5832E933D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:26:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61064.107166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN3n-0000LZ-Ul; Mon, 04 Jan 2021 10:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61064.107166; Mon, 04 Jan 2021 10:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwN3n-0000LA-RV; Mon, 04 Jan 2021 10:25:59 +0000
Received: by outflank-mailman (input) for mailman id 61064;
 Mon, 04 Jan 2021 10:25:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwN3m-0000L5-Td
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:25:58 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2a20baa-8979-46d7-bb40-ce281220ea3b;
 Mon, 04 Jan 2021 10:25:57 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104APqbO001729;
 Mon, 4 Jan 2021 11:25:52 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 5DFE2281D; Mon,  4 Jan 2021 11:25:52 +0100 (CET)
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
X-Inumbo-ID: d2a20baa-8979-46d7-bb40-ce281220ea3b
Date: Mon, 4 Jan 2021 11:25:52 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 07/24] Remove NetBSD's system headers. We'll use the
 system-provided ones, which are up to date.
Message-ID: <20210104102552.GC2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-8-bouyer@netbsd.org>
 <20201229114638.yegfswyqzhz7tj25@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229114638.yegfswyqzhz7tj25@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 04 Jan 2021 11:25:52 +0100 (MET)

On Tue, Dec 29, 2020 at 12:46:38PM +0100, Roger Pau Monné wrote:
> What would happen when a new device (or ioctl to and existing one) is
> added?
> 
> You would then run into issues of newer versions of Xen not building on
> older NetBSD systems, or would have to appropriately gate the newly
> added code to only be built when the headers are available.

I prefer to have the build fail if the system isn't new enough, than
have it build and then fail to run. We already have version requirements
for e.g. bug fixes.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--


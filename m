Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0D379FB9
	for <lists+xen-devel@lfdr.de>; Tue, 11 May 2021 08:36:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125619.236425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgLzs-0008EV-BW; Tue, 11 May 2021 06:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125619.236425; Tue, 11 May 2021 06:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgLzs-0008Ce-8P; Tue, 11 May 2021 06:36:00 +0000
Received: by outflank-mailman (input) for mailman id 125619;
 Tue, 11 May 2021 06:35:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nFSD=KG=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lgLzp-0008CY-Si
 for xen-devel@lists.xenproject.org; Tue, 11 May 2021 06:35:57 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 315daa80-185c-4cb4-9f77-b69b0745ace1;
 Tue, 11 May 2021 06:35:56 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lgLzk-0007pF-Gz; Tue, 11 May 2021 06:35:52 +0000
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
X-Inumbo-ID: 315daa80-185c-4cb4-9f77-b69b0745ace1
Date: Tue, 11 May 2021 07:35:52 +0100
From: Tim Deegan <tim@xen.org>
To: Costin Lupu <costin.lupu@cs.pub.ro>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/5] tools/debugger: Fix PAGE_SIZE redefinition error
Message-ID: <YJolyMVdxPIXVCQo@deinos.phlegethon.org>
References: <cover.1620633386.git.costin.lupu@cs.pub.ro>
 <88d4d2deeca3259450dc9af2b97f2fc1453a5d7d.1620633386.git.costin.lupu@cs.pub.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <88d4d2deeca3259450dc9af2b97f2fc1453a5d7d.1620633386.git.costin.lupu@cs.pub.ro>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 11:35 +0300 on 10 May (1620646515), Costin Lupu wrote:
> If PAGE_SIZE is already defined in the system (e.g. in /usr/include/limits.h
> header) then gcc will trigger a redefinition error because of -Werror. This
> patch replaces usage of PAGE_* macros with KDD_PAGE_* macros in order to avoid
> confusion between control domain page granularity (PAGE_* definitions) and
> guest domain page granularity (which is what we are dealing with here).
> 
> We chose to define the KDD_PAGE_* macros instead of using XC_PAGE_* macros
> because (1) the code in kdd.c should not include any Xen headers and (2) to add
> consistency for code in both kdd.c and kdd-xen.c.
> 
> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>

Reviewed-by: Tim Deegan <tim@xen.org>

Thanks!

Tim.


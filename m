Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE56C2EAC09
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:38:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61993.109441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmXC-0004Cn-9u; Tue, 05 Jan 2021 13:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61993.109441; Tue, 05 Jan 2021 13:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmXC-0004CO-6U; Tue, 05 Jan 2021 13:38:02 +0000
Received: by outflank-mailman (input) for mailman id 61993;
 Tue, 05 Jan 2021 13:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LPBs=GI=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kwmXA-0004CJ-Cx
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:38:00 +0000
Received: from MTA-09-3.privateemail.com (unknown [68.65.122.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb7e9ff7-a5d3-413c-96cd-be951f439ee8;
 Tue, 05 Jan 2021 13:37:59 +0000 (UTC)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 9916C60083
 for <xen-devel@lists.xenproject.org>; Tue,  5 Jan 2021 08:37:58 -0500 (EST)
Received: from mail-wr1-f41.google.com (unknown [10.20.151.236])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 627CE60082
 for <xen-devel@lists.xenproject.org>; Tue,  5 Jan 2021 13:37:58 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t30so36241937wrb.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jan 2021 05:37:58 -0800 (PST)
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
X-Inumbo-ID: eb7e9ff7-a5d3-413c-96cd-be951f439ee8
X-Gm-Message-State: AOAM5300jtZGVFMailh66sBWQ6HOl0mZSCU1h/2yXp33A1xtn3l0rrh8
	ptxMWoMeB8DbNx7SgcKO5BqSVGRvNSoayuWnvX0=
X-Google-Smtp-Source: ABdhPJyehLtdrdk329+NSNoPE6eeh8tLos7KIummUGohwoH9G8WVCic8G5n4LNiHr/ean5PYkPI0R/qolA7w9rwNG4E=
X-Received: by 2002:adf:d082:: with SMTP id y2mr85969962wrh.301.1609853877003;
 Tue, 05 Jan 2021 05:37:57 -0800 (PST)
MIME-Version: 1.0
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com> <3b9757c7-d0cb-9a47-b508-71b2e3b75a68@suse.com>
In-Reply-To: <3b9757c7-d0cb-9a47-b508-71b2e3b75a68@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 5 Jan 2021 08:37:20 -0500
X-Gmail-Original-Message-ID: <CABfawhncBWrKZxZCqtzYxGQ2AF=gz0Y4zpZwhvaTuEm2zJDOZg@mail.gmail.com>
Message-ID: <CABfawhncBWrKZxZCqtzYxGQ2AF=gz0Y4zpZwhvaTuEm2zJDOZg@mail.gmail.com>
Subject: Re: [PATCH 5/5] x86/mem-sharing: don't pointlessly use get_domain_by_id()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jan 5, 2021 at 8:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> For short-lived references rcu_lock_domain_by_id() is the better
> (slightly cheaper) alternative.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Tamas K Lengyel <tamas@tklengyel.com>


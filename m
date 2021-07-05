Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37193BBDEA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 15:55:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150243.277814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0P2y-0006Rl-3x; Mon, 05 Jul 2021 13:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150243.277814; Mon, 05 Jul 2021 13:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0P2y-0006PT-0g; Mon, 05 Jul 2021 13:54:04 +0000
Received: by outflank-mailman (input) for mailman id 150243;
 Mon, 05 Jul 2021 13:54:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0P2v-0006PK-Ok
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 13:54:02 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95c136aa-1654-4e28-8743-58cbf1d0b650;
 Mon, 05 Jul 2021 13:54:00 +0000 (UTC)
Received: from aepfle.de by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65DrsMiT
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 15:53:54 +0200 (CEST)
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
X-Inumbo-ID: 95c136aa-1654-4e28-8743-58cbf1d0b650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625493234;
    s=strato-dkim-0002; d=aepfle.de;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=QLXRo09UfmkGYFe7C1EAoICYUXR6slim+FEZ5oOrstE=;
    b=E0njObK+iTHzrUb+slz+WFY9SIjrkLlaKGaZzu4rG+oKLw5HiJ6Umoo/zRsi+NrVG4
    Fa/6tHezv/OXhUuhmMhJcVXo0nLykeuq67PCDSXxom5wiQXaNisU8yHdBhRT8WQzKnlT
    LrfKjEhftuZGCavjxBlnxag7O1jnuvDgsRLfI0qdZvp+F7RrSLIjwkWpsBEDnOHwIVlS
    sEyu9PssEHl/xv1tL16OpG0yoZXEhvFxpybIygs0Zmp/mFtTz8ZxnuSnm3lygqg1Ax7J
    pZ1V/QxujmYpuseCvH+gjqBzyzDyAg8WGC9A9U+sklyP7GjHtPL+YewSNxOb3f4+M5id
    bNTw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QDiZbDmui9LcK/RdXt7GAQpV1nK0bLlEYINdoY/p1XzQbc+3kk9TsJTnzSvdM+YSIzPms="
X-RZG-CLASS-ID: mo00
Date: Mon, 5 Jul 2021 15:53:50 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210701 12/40] tools: unify type checking for data pfns
 in migration stream
Message-ID: <20210705135350.GA31821@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-13-olaf@aepfle.de>
 <e5f00724-61fe-fed3-35c4-35df837a49c2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e5f00724-61fe-fed3-35c4-35df837a49c2@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Jul 05, Andrew Cooper wrote:

> What do you mean "This specifically deals with" ?

This was a result from J=C3=BCrgen pointing out that XEN_DOMCTL_PFINFO_XALL=
OC
is not handled. If all the type checking changes go into a single
commit, the commig message has to be reworded.

Olaf


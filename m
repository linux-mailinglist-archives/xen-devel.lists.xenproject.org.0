Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E863BC6DC
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 08:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150760.278714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0eqw-0002zK-Fy; Tue, 06 Jul 2021 06:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150760.278714; Tue, 06 Jul 2021 06:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0eqw-0002xU-Ca; Tue, 06 Jul 2021 06:46:42 +0000
Received: by outflank-mailman (input) for mailman id 150760;
 Tue, 06 Jul 2021 06:46:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0equ-0002xH-3T
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 06:46:40 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.54])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9c016d0-de25-11eb-8475-12813bfff9fa;
 Tue, 06 Jul 2021 06:46:38 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx666kUOpm
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 08:46:30 +0200 (CEST)
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
X-Inumbo-ID: e9c016d0-de25-11eb-8475-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625553991;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=1jffNqQLHogyo3Jw1Ton40YbgCBL6qeVPHajT2tmOkg=;
    b=YscXZBChmkI50yJcH6TLcebrVvSqhmPEtXjSGCQNPxdGRvlsgUZDDwPrgXQOLN5Wrj
    jfmRsbEuj7cxL51FsPNUw3JxO5IlU+nhTL0+aUQGCBVXXXatpPzZ+jVZY6jTBzI5X9Uq
    V0YgSOvEbyJXkZzNYea5ivMaOP1IUmfnKuw44V6L6jmQ2ywzEH3/K0pFDewc9OkWyEW8
    X2iWRfo0qB7O5KxEmRMDUVUKUp133GVfxazqhlR1evGhDEF8nWZQ35HhRoMilUIrM1kg
    +OhmSPjf7jtdU40CEdkgVr+faJhINKh6yhEg9jLTQyEKTIZhVQHmQ/bYeqZrY/bvYz6u
    UB6w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 08:46:28 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Juergen Gross
 <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
Message-ID: <20210706084628.360a7f2a.olaf@aepfle.de>
In-Reply-To: <f70be58d-99f0-0631-2b01-436e3e94e5ee@suse.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
	<668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
	<20210705192612.5cf50887.olaf@aepfle.de>
	<f70be58d-99f0-0631-2b01-436e3e94e5ee@suse.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 6 Jul 2021 08:39:21 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> the size may change in the course of migration

How can the p2m_size change? This upper limit is queried once, then all loops take this as loop counter.

Olaf


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B413BC6FF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150809.278804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fIu-0003BM-Md; Tue, 06 Jul 2021 07:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150809.278804; Tue, 06 Jul 2021 07:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fIu-00038Z-J4; Tue, 06 Jul 2021 07:15:36 +0000
Received: by outflank-mailman (input) for mailman id 150809;
 Tue, 06 Jul 2021 07:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8sr3=L6=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0fIs-00038E-Kr
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:15:34 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.82])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e2714ff4-01b9-4722-8511-852f932590e5;
 Tue, 06 Jul 2021 07:15:33 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx667FQP00
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 09:15:26 +0200 (CEST)
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
X-Inumbo-ID: e2714ff4-01b9-4722-8511-852f932590e5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625555726;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=K6W5nMyFaq0SpWx0zPJZO6/GCcQWlH3ZKLCmhHf35Dk=;
    b=h4f7qRH9dSomWPNdwH16mnZkru6fia3hjj+wgRJT4AyN1HVcRBmyLSI9GMyTrHKYsb
    2Dz0TBf3DKhBvs3D5D+s+4UZyylbHuO5/LTKC3/m703cdkPfhI/1WFnCBiUPAp5IjmHI
    U+3C/W+yL0nYZcckUtSVY0TcsOU4I/SSYBRca8QWWsxJqj/FIrdvJldgY5Ioqmtf6nVN
    xl9g4p0PjKuScvt6IueYIosCNXvJM/ZmdLcf/FmaN1vIWeJ2TMVhHYjKTYaXJMrytbiy
    Ucl/qjXeRAmENIMl2fCYExSgWtItGSecaRZdm0DnbuksqLdyqVDztFRa4EjDrkJsjymY
    cIMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisF+Ax6FOE3sSy9BcWAcR/hQoAs9MGk67vg1baqX"
X-RZG-CLASS-ID: mo00
Date: Tue, 6 Jul 2021 09:15:24 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Juergen Gross
 <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>
Subject: Re: [PATCH v2 03/13] libxenguest: deal with log-dirty op stats
 overflow
Message-ID: <20210706091524.7e4af39e.olaf@aepfle.de>
In-Reply-To: <c4463e5c-48f8-8d46-e959-22c9e3710637@suse.com>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
	<668ef720-389f-4cf1-608e-64aca4f7c73d@suse.com>
	<20210705192612.5cf50887.olaf@aepfle.de>
	<f70be58d-99f0-0631-2b01-436e3e94e5ee@suse.com>
	<20210706084628.360a7f2a.olaf@aepfle.de>
	<c4463e5c-48f8-8d46-e959-22c9e3710637@suse.com>
X-Mailer: Claws Mail 2021.07.03 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 6 Jul 2021 08:58:59 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> Well, that's part of the current limitation. The size would need re-querying
> before every iteration (or at the very least before the last one, after the
> domain has been paused).

Ah, you even wrote that.

In addition each iteration should also query the state of the domU.
Right now a shutdown is not handled and the dead domU is detected only at the very end.


Olaf


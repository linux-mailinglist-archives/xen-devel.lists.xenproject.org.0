Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A288B40183
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 14:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106410.1457110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQYy-00015x-Q3; Tue, 02 Sep 2025 12:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106410.1457110; Tue, 02 Sep 2025 12:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utQYy-000140-MO; Tue, 02 Sep 2025 12:56:40 +0000
Received: by outflank-mailman (input) for mailman id 1106410;
 Tue, 02 Sep 2025 12:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jdug=3N=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utQYw-0000hN-Ly
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 12:56:38 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42add78f-87fc-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 14:56:37 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 582CuZhP016800
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Sep 2025 14:56:35 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 582CuZgu004018;
 Tue, 2 Sep 2025 14:56:35 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 182A6107F7; Tue,  2 Sep 2025 14:56:34 +0200 (CEST)
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
X-Inumbo-ID: 42add78f-87fc-11f0-8dd7-1b34d833f44b
Date: Tue, 2 Sep 2025 14:56:34 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: issue with dom0_pvh on Xen 4.20
Message-ID: <aLbpgqT0DX4d1R4U@mail.soc.lip6.fr>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <c0ac2079-53eb-4e6f-89a9-b6759f344d03@citrix.com>
 <aLbTxH5q1KpeyTIS@mail.soc.lip6.fr>
 <9a263568-54be-4193-9a4e-cd31268c5ee6@citrix.com>
 <aLbiBb3bWqGdnGQm@mail.soc.lip6.fr>
 <50994916-4307-4224-9e48-053459b00a92@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50994916-4307-4224-9e48-053459b00a92@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Tue, 02 Sep 2025 14:56:35 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

On Tue, Sep 02, 2025 at 01:52:11PM +0100, Andrew Cooper wrote:
> HVM: Hardware Assisted Paging (HAP) detected
> on boot.

So it is:
(XEN) HVM: ASIDs enabled.
(XEN) VMX: Disabling executable EPT superpages due to CVE-2018-12207
(XEN) HVM: VMX enabled
(XEN) HVM: Hardware Assisted Paging (HAP) detected
(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB

but the RIP printed by Xen may be right, after all

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--


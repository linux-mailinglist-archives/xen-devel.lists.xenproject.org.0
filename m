Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7722BB406F1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 16:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106653.1457291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utS43-0007Kc-1y; Tue, 02 Sep 2025 14:32:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106653.1457291; Tue, 02 Sep 2025 14:32:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utS42-0007HT-TH; Tue, 02 Sep 2025 14:32:50 +0000
Received: by outflank-mailman (input) for mailman id 1106653;
 Tue, 02 Sep 2025 14:32:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jdug=3N=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1utS40-0007HN-PB
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 14:32:48 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1aadc85-8809-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 16:32:46 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.18.1/8.16.1) with ESMTPS id 582EWj5e011669
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Sep 2025 16:32:45 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 582EWjQ5027272;
 Tue, 2 Sep 2025 16:32:45 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 91481107F7; Tue,  2 Sep 2025 16:32:43 +0200 (CEST)
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
X-Inumbo-ID: b1aadc85-8809-11f0-8dd7-1b34d833f44b
Date: Tue, 2 Sep 2025 16:32:43 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
        Juergen Gross <jgross@suse.com>
Subject: Re: issue with dom0_pvh on Xen 4.20
Message-ID: <aLcACzUuBFjvnaty@mail.soc.lip6.fr>
References: <aLbEQ7Bav8seazP1@mail.soc.lip6.fr>
 <68988b80-f642-4fcf-a624-49ad9fdd685c@citrix.com>
 <aLbNbiHLntX13E46@mail.soc.lip6.fr>
 <957429d8-ec8c-4327-b8fc-71fe9ddb2d33@suse.com>
 <2ad255ea-6c5e-4e9a-a821-db7449432399@suse.com>
 <aLb0I01WASpFremM@mail.soc.lip6.fr>
 <5953e9aa-4b56-4112-b952-7b4ff0ca2a62@suse.com>
 <aLb6AcjEer83IrFC@mail.soc.lip6.fr>
 <49551fca-5059-4ca4-b551-d282d6099e36@suse.com>
 <aLb_GO1lOCAdPiP1@mail.soc.lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLb_GO1lOCAdPiP1@mail.soc.lip6.fr>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Tue, 02 Sep 2025 16:32:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.4.1 on 132.227.60.2

On Tue, Sep 02, 2025 at 04:28:40PM +0200, Manuel Bouyer wrote:
> yes, that's it. I'm looking at how it's loaded right now
> 
> > Then, as per the scheme in elf_load_bsdsyms(), can't you find the start of
> > the ELF header from the end of your kernel? At least that's how I understand
> > it's supposed to work.
> 
> I can, but at this point I can't easily call C code, and doing it in
> assembly doesn't look easy :(

Oh, it looks like Xen stores the size just before the ELF header.
if that's the case, all good !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--


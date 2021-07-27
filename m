Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2185D3D76F9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 15:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161210.296009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NJQ-0001uq-7U; Tue, 27 Jul 2021 13:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161210.296009; Tue, 27 Jul 2021 13:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NJQ-0001sD-4T; Tue, 27 Jul 2021 13:40:00 +0000
Received: by outflank-mailman (input) for mailman id 161210;
 Tue, 27 Jul 2021 13:39:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NJP-0001s5-24
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:39:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NJO-0006Jb-JD
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:39:58 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1m8NJO-0000e7-IM
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:39:58 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1m8NJC-0002cf-H5; Tue, 27 Jul 2021 14:39:46 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=nt507/J/JBlV+z9dTi+R+qRzORHUlZYPjI3xmvZ88b0=; b=VMQRE6TdrdXMICN3zvM9bRNbsF
	cNbVyObp15Lej2kstYc0iQcuDywmKBL41XNfi0Tz2nDrSfFtd0sbdJs3FwQveNmReQmOhCQHuHkE4
	tP4J0Z6Z1nK1ya81jrmuQusDwpLxhQpn5mFPGIHwSYr7G6txj1NzCe/0lET+pJCjU0Tg=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24832.3234.356168.227371@mariner.uk.xensource.com>
Date: Tue, 27 Jul 2021 14:39:46 +0100
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Wei Liu <wl@xen.org>,
    George Dunlap <george.dunlap@citrix.com>,
    Tim Deegan <tim@xen.org>,
    Alexandru Isaila <aisaila@bitdefender.com>,
    Petre Pircalabu <ppircalabu@bitdefender.com>,
    xen-devel@lists.xenproject.org,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    Tamas K Lengyel <tamas@tklengyel.com>,
    Juergen Gross <jgross@suse.com>,
    Dario Faggioli <dfaggioli@suse.com>,
    Paul Durrant <paul@xen.org>,
    Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2 08/10] xsm: remove xsm_default_t from hook definitions
In-Reply-To: <20210712203233.20289-9-dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
	<20210712203233.20289-9-dpsmith@apertussolutions.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I have read the thread here and it seems that there are some
disagreements which may be blocking progress.

The mailing list thread is a rather tangled way of dealing with this.
I did read it but I feel I am lacking some of the context and/or
having trouble synthesising it.

Daniel, if you agree with me that this seems to be getting hung up on
disagreements, do you think you would be able to summarise the
disagreement(s) including the context and the arguments you can see on
the various sides ?  I'm not expecting such a summary to be neutral
but I think you are in a good position to motivate your changes.

Thanks,
Ian.


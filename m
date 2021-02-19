Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392A31FC66
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 16:51:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86951.163652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD83K-00044T-F5; Fri, 19 Feb 2021 15:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86951.163652; Fri, 19 Feb 2021 15:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD83K-000446-Bn; Fri, 19 Feb 2021 15:50:46 +0000
Received: by outflank-mailman (input) for mailman id 86951;
 Fri, 19 Feb 2021 15:50:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD83J-00043k-N6
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 15:50:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD83J-0003K6-M8
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 15:50:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lD83J-0006KL-Kq
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 15:50:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lD83G-0001EC-Cl; Fri, 19 Feb 2021 15:50:42 +0000
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
	bh=u8nZQgrCi40A/rBG4PVPftmjeH8BU5sMLURTLylJDSo=; b=4j+ayX1tIq3ozDwnqyyMmNyiHL
	nQZXJi2qfh6fSN8j7c6cmFNYqgwa9gpvw51RJ1xxiKiJ/WQjEOx/hx1mQIPBdULjVasWyp0jj19RT
	MtuYvCRuo5HEgRP6RSdSfBTa0ha9ppDBSaC06V5/znrzyMN5tavWXtcwv7EhT8zHPUAk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24623.56913.290437.499946@mariner.uk.xensource.com>
Date: Fri, 19 Feb 2021 15:50:41 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    Wei Liu <wl@xen.org>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
> Re-sending primarily for the purpose of getting a release ack, an
> explicit release nak, or an indication of there not being a need,
> all for at least the first three patches here (which are otherwise
> ready to go in). I've dropped the shadow part of the series from
> this re-submission, because it has all got reviewed by Tim already
> and is intended for 4.16 only anyway. I'm re-including the follow
> up patches getting the code base in consistent shape again, as I
> continue to think this consistency goal is at least worth a
> consideration towards a freeze exception.
> 
> 1: split __{get,put}_user() into "guest" and "unsafe" variants
> 2: split __copy_{from,to}_user() into "guest" and "unsafe" variants
> 3: PV: harden guest memory accesses against speculative abuse

These three:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

On the grounds that this is probably severe enough to be a blocking
issue for 4.15.

> 4: rename {get,put}_user() to {get,put}_guest()
> 5: gdbsx: convert "user" to "guest" accesses
> 6: rename copy_{from,to}_user() to copy_{from,to}_guest_pv()
> 7: move stac()/clac() from {get,put}_unsafe_asm() ...
> 8: PV: use get_unsafe() instead of copy_from_unsafe()

These have not got a maintainer review yet.  To grant a release-ack
I'd like an explanation of the downsides and upsides of taking this
series in 4.15 ?

You say "consistency" but in practical terms, what will happen if the
code is not "conxistent" in this sense ?

I'd also like to hear from aother hypervisor maintainer.

Thanks,
Ian.


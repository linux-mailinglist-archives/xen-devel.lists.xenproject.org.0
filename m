Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD2F30672D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 23:29:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76477.138036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4tIa-0004ZU-UJ; Wed, 27 Jan 2021 22:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76477.138036; Wed, 27 Jan 2021 22:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4tIa-0004Z5-Qt; Wed, 27 Jan 2021 22:28:28 +0000
Received: by outflank-mailman (input) for mailman id 76477;
 Wed, 27 Jan 2021 22:28:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rW5C=G6=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l4tIZ-0004Yz-W1
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 22:28:28 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2edee481-de83-4241-afbd-f930f90dd7d4;
 Wed, 27 Jan 2021 22:28:27 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 10RMSEq0027675
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 27 Jan 2021 17:28:20 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 10RMSElr027674;
 Wed, 27 Jan 2021 14:28:14 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 2edee481-de83-4241-afbd-f930f90dd7d4
Date: Wed, 27 Jan 2021 14:28:14 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@citrix.com>,
        Wei Liu <wl@xen.org>, Roger Pau Monn?? <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/pod: Do not fragment PoD memory allocations
Message-ID: <YBHo/gscAfcAZqst@mattapan.m5p.com>
References: <202101242308.10ON8Umj004866@m5p.com>
 <b2ad35f1-3adf-a78a-5e82-2ac4a672d624@suse.com>
 <YA8D85MoJ9lG0KJS@mattapan.m5p.com>
 <c0a70f39-d529-6ee4-511d-e82730c14879@suse.com>
 <YBBWj7NO+1HVKEgX@mattapan.m5p.com>
 <f6a75725-edc2-ee2d-0565-da1efae05190@suse.com>
 <YBHJS3NEX5+iEqyd@mattapan.m5p.com>
 <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ef8210-a65f-9d6a-bea1-46ce06d47fb7@citrix.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Jan 27, 2021 at 09:03:32PM +0000, Andrew Cooper wrote:
> So.?? What *should* happen is that if QEMU/OVMF dirties more memory than
> exists in the PoD cache, the domain gets terminated.
> 
> Irrespective, Xen/dom0 dying isn't an expected consequence of any normal
> action like this.
> 
> Do you have a serial log of the crash??? If not, can you set up a crash
> kernel environment to capture the logs, or alternatively reproduce the
> issue on a different box which does have serial?

No, I don't.  I'm setup to debug ARM failures, not x86 ones.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




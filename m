Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025A6C1473
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 15:11:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511944.791404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGEM-0004E4-3Q; Mon, 20 Mar 2023 14:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511944.791404; Mon, 20 Mar 2023 14:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGEM-0004Ac-0g; Mon, 20 Mar 2023 14:11:22 +0000
Received: by outflank-mailman (input) for mailman id 511944;
 Mon, 20 Mar 2023 14:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9b8=7M=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1peGEK-0004AK-F5
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 14:11:20 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1446c20d-c729-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 15:11:18 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.16.1/8.15.2) with ESMTPS id 32KEB013086069
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 20 Mar 2023 10:11:06 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.16.1/8.15.2/Submit) id 32KEB0CI086068;
 Mon, 20 Mar 2023 07:11:00 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 1446c20d-c729-11ed-87f5-c1b5be75604c
Date: Mon, 20 Mar 2023 07:11:00 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/2] x86/APIC: include full string with
 error_interrupt() error messages
Message-ID: <ZBhpdP0PiJ+YNQJH@mattapan.m5p.com>
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <b03e331fc242b4c46e2adab124c7657bc3bb1340.1679084101.git.ehem+xen@m5p.com>
 <50badf48-a0d0-8141-f409-42bf339bec36@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50badf48-a0d0-8141-f409-42bf339bec36@suse.com>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Mon, Mar 20, 2023 at 09:49:14AM +0100, Jan Beulich wrote:
> On 17.03.2023 20:45, Elliott Mitchell wrote:
> > Rather than adding ", " with each printf(), simply include them in the
> > string initially.
> 
> Why is this better? You're now using more space in .rodata. (I haven't
> looked at patch 2 yet to see whether there's a possible reason there
> for the change here, but if there was it would need saying here.)

I would expect this to give trivially better performance.  Instead of
needing to needing copy some data from the format string, then strcat()
from the arguments this turns it into a single strcat().

Other item is this sort of change is very often a precursor to replacing
the use of a *printf()-type function with a str*cat()-type function.
Though in this case I doubt there is a strlcatk() function so that is
unlikely.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




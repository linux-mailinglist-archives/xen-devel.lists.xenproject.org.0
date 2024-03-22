Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DF8873CB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 20:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697087.1088333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnkTA-0001uK-DE; Fri, 22 Mar 2024 19:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697087.1088333; Fri, 22 Mar 2024 19:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnkTA-0001sT-Aa; Fri, 22 Mar 2024 19:22:24 +0000
Received: by outflank-mailman (input) for mailman id 697087;
 Fri, 22 Mar 2024 19:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ueuq=K4=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rnkT9-0001sN-Kr
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 19:22:23 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80149ce1-e881-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 20:22:20 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42MJM42A055590
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 22 Mar 2024 15:22:10 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 42MJM1fV055589;
 Fri, 22 Mar 2024 12:22:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 80149ce1-e881-11ee-a1ee-f123f15fe8a2
Date: Fri, 22 Mar 2024 12:22:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Kelly Choi <kelly.choi@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Wei Liu <wl@xen.org>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <Zf3aWXfCANR7zXj8@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <ZcqoVBnsgUJw8G0l@mattapan.m5p.com>
 <ZfiY7/FBTwPQlfYi@mattapan.m5p.com>
 <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-mL=xndFd7xTU4Q+9hjLL-7zqZUGjYcp3_REa6QqXvtyAEYg@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Fri, Mar 22, 2024 at 04:41:45PM +0000, Kelly Choi wrote:
> 
> I can see you've recently engaged with our community with some issues you'd
> like help with.
> We love the fact you are participating in our project, however, our
> developers aren't able to help if you do not provide the specific details.

Please point to specific details which have been omitted.  Fairly little
data has been provided as fairly little data is available.  The primary
observation is large numbers of:

(XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I

Lines in Xen's ring buffer.  I recall spotting 3 messages from Linux's
SATA driver (which weren't saved due to other causes being suspected),
which would likely be associated with hundreds or thousands of the above
log messages.  I never observed any messages from the NVMe subsystem
during that phase.

The most overt sign was telling the Linux kernel to scan for
inconsistencies and the kernel finding some.  The domain didn't otherwise
appear to notice trouble.

This is from memory, it would take some time to discover whether any
messages were missed.  Present mitigation action is inhibiting the
messages, but the trouble is certainly still lurking.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




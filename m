Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5577B3783
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 18:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610617.950063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmG2X-0003nH-6y; Fri, 29 Sep 2023 16:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610617.950063; Fri, 29 Sep 2023 16:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmG2X-0003kJ-3j; Fri, 29 Sep 2023 16:08:29 +0000
Received: by outflank-mailman (input) for mailman id 610617;
 Fri, 29 Sep 2023 16:08:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xnwI=FN=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1qmG2V-0003kD-Mg
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 16:08:27 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b0379ac-5ee2-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 18:08:25 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 38TG825N011485
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Fri, 29 Sep 2023 12:08:07 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 38TG81cg011484;
 Fri, 29 Sep 2023 09:08:01 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: 6b0379ac-5ee2-11ee-9b0d-b553b5be7939
Date: Fri, 29 Sep 2023 09:08:01 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org, jbeulich@suse.com,
        andrew.cooper3@citrix.com, roger.pau@citrix.com,
        bertrand.marquis@arm.com, george.dunlap@citrix.com, wl@xen.org
Subject: Re: [PATCH] bitmap: fix n__ signess
Message-ID: <ZRb2YTMPzDsncZAR@mattapan.m5p.com>
References: <alpine.DEB.2.22.394.2309281616200.1996340@ubuntu-linux-20-04-desktop>
 <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <592517ec-f093-4789-8cd6-320f886e45ae@xen.org>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on mattapan.m5p.com

On Fri, Sep 29, 2023 at 08:24:37AM +0100, Julien Grall wrote:
> Hi Stefano,
> 
> On 29/09/2023 00:19, Stefano Stabellini wrote:
> > All callers of the bitmap_switch macro (which are all within bitmap.h)
> > pass an int as first parameter. Do not assign it to an unsigned int
> > potentially introducing errors.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > 
> > We could also have gone the other way and change all the callers and the
> > callers' callers to use an unsigned int instead, but I went for the path
> > of least resistance.
> 
> I understand this will solve the issue right now because the callers are 
> all passing 'int'. However, all the callers will need to switch to 
> 'unsigned int' in order to solve violations in their callers.
> 
> That unless we decide to use 'int' everywhere, but I think this is a bad 
> idea because 'n__' is not supposed to be negative.
> 
> Overall, this may be an easy win right now, but this will need to be 
> reverted. So, I am not happy to ack it and would in fact be leaning 
> towards Nacking it.

I would have tended to review on the basis situations like this unsigned
is always the way to go.  n__ *wants* to be unsigned since such
structures nearly always have some level of implicit assemption of being
unsigned.

Turns out though the situation is worse since as proposed this also
significantly changes the logic.  The value of `(int)n__ <= BITS_PER_LONG`
may differ from `(unsigned int)n__ <= BITS_PER_LONG`.  I wouldn't expect
these functions to get negative values, but if they did a lurking issue
has been added.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




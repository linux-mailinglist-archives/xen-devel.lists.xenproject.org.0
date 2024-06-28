Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36D91B344
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 02:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750406.1158571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMzK2-0004rg-Os; Fri, 28 Jun 2024 00:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750406.1158571; Fri, 28 Jun 2024 00:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMzK2-0004pZ-MC; Fri, 28 Jun 2024 00:18:38 +0000
Received: by outflank-mailman (input) for mailman id 750406;
 Fri, 28 Jun 2024 00:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0kmA=N6=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1sMzK0-0004pT-IQ
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 00:18:36 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f21b6a-34e3-11ef-b4bb-af5377834399;
 Fri, 28 Jun 2024 02:18:33 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.17.1) with ESMTPS id 45S0IGo1052639
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 27 Jun 2024 20:18:23 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 45S0IFhr052638;
 Thu, 27 Jun 2024 17:18:15 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: f3f21b6a-34e3-11ef-b4bb-af5377834399
Date: Thu, 27 Jun 2024 17:18:15 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
        Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        Kelly Choi <kelly.choi@cloud.com>
Subject: Re: Serious AMD-Vi(?) issue
Message-ID: <Zn4BRxTcXKufonw5@mattapan.m5p.com>
References: <ZgHwEGCsCLHiYU5J@mattapan.m5p.com>
 <ZgRXHQpamLIdu7dk@mattapan.m5p.com>
 <c2ce4002-58d5-48a3-949c-3c361c78c0ac@suse.com>
 <ZhdNxWNpM0KCzz8E@mattapan.m5p.com>
 <2aa4d1f4-ff37-4f12-bfbb-3ef5ad3f6fdd@suse.com>
 <ZiDBc3ye2wqmBAfq@mattapan.m5p.com>
 <f0bdb386-0870-4468-846c-6c8a91eaf806@suse.com>
 <ZiH0G5kN6m+wlNjn@mattapan.m5p.com>
 <Zj7vkp4r0EY9rxT4@mattapan.m5p.com>
 <ZkHTC4RpUSpKj4wf@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZkHTC4RpUSpKj4wf@macbook>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

I'm rather surprised it was so long before the next system restart.  
Seems a quiet period as far as security updates go.  Good news is I made
several new observations, but I don't know how valuable these are.

On Mon, May 13, 2024 at 10:44:59AM +0200, Roger Pau Monné wrote:
> 
> Does booting with `iommu=no-intremap` lead to any issues being
> reported?

On boot there was in fact less.  Notably the "AMD-Vi" messages haven't
shown up at all.  I haven't stressed it very much yet, but previous
boots a message showed up the moment the MD-RAID1 driver was loaded.


I am though seeing two different messages now:

(XEN) CPU#: No irq handler for vector # (IRQ -#, LAPIC)
(XEN) IRQ# a=#[#,#] v=#[#] t=PCI-MSI s=#

These are to be appearing in pairs.  Multiple values show for each field,
though each field appears to vary between 2-3 different values.  There
are thousands of these messages showing up.

I'm unsure whether these can be attributed to the flash devices I had
been trying to use in RAID1 though.  I've got another device being
problematic with interrupts which might instead be the cause of those
messages (this one is lower urgency than the flash devices).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB88711BF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 01:34:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688544.1072800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIl8-00062v-Ul; Tue, 05 Mar 2024 00:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688544.1072800; Tue, 05 Mar 2024 00:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhIl8-00061H-RE; Tue, 05 Mar 2024 00:34:18 +0000
Received: by outflank-mailman (input) for mailman id 688544;
 Tue, 05 Mar 2024 00:34:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U3zO=KL=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1rhIl7-00061B-GO
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 00:34:17 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1752fb01-da88-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 01:34:15 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4250Y3PG027067
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 4 Mar 2024 19:34:09 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 4250Y3I5027066;
 Mon, 4 Mar 2024 16:34:03 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 1752fb01-da88-11ee-afda-a90da7624cb6
Date: Mon, 4 Mar 2024 16:34:03 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: AMD-Vi issue
Message-ID: <ZeZoe2FJQMHaiCz0@mattapan.m5p.com>
References: <ZbLDlRi0vctlhsNp@mattapan.m5p.com>
 <f3cbf20c-f591-4aec-bbe3-ef0efa24c42d@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3cbf20c-f591-4aec-bbe3-ef0efa24c42d@citrix.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Mar 04, 2024 at 11:55:07PM +0000, Andrew Cooper wrote:
> On 25/01/2024 8:24 pm, Elliott Mitchell wrote:
> > The original observation features MD-RAID1 using a pair of Samsung
> > SATA-attached flash devices.  The main line shows up in `xl dmesg`:
> >
> > (XEN) AMD-Vi: IO_PAGE_FAULT: DDDD:bb:dd.f d0 addr ffffff???????000 flags 0x8 I
> 
> You have a device which is issuing interrupts which have been blocked
> due to the IOMMU configuration.
> 
> But you've elided all details other than the fact it's assigned to
> dom0.  As such, there is nothing we can do to help.

I've provided the details thought most likely to allow others to
reproduce.  I've pointed to a report from someone else with somewhat
similar hardware who also encountered this (and had enough hardware to
try several combinations).

Sorry about being reluctant to send exact hardware serial numbers to a
public mailing list.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




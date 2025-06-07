Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6C9AD0FD2
	for <lists+xen-devel@lfdr.de>; Sat,  7 Jun 2025 22:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1009521.1388174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uO0aD-000074-SR; Sat, 07 Jun 2025 20:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1009521.1388174; Sat, 07 Jun 2025 20:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uO0aD-0008W6-MF; Sat, 07 Jun 2025 20:56:05 +0000
Received: by outflank-mailman (input) for mailman id 1009521;
 Sat, 07 Jun 2025 20:56:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7sv=YW=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1uO0aC-0008W0-De
 for xen-devel@lists.xenproject.org; Sat, 07 Jun 2025 20:56:04 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d177efef-43e1-11f0-a304-13f23c93f187;
 Sat, 07 Jun 2025 22:56:02 +0200 (CEST)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:8ac4:0:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 557Ktk99099307
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Sat, 7 Jun 2025 16:55:52 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 557KtkLS099306;
 Sat, 7 Jun 2025 13:55:46 -0700 (PDT) (envelope-from ehem)
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
X-Inumbo-ID: d177efef-43e1-11f0-a304-13f23c93f187
Date: Sat, 7 Jun 2025 13:55:46 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: me@alex0.net
Cc: xen-devel@lists.xenproject.org
Subject: Re: xen_acpi_processor driver is bound to dom0 vcpu count
Message-ID: <aESnUmUv0o3_tokb@mattapan.m5p.com>
References: <A56FE54F-6BE8-4A4E-9598-B1C98028270F@alex0.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A56FE54F-6BE8-4A4E-9598-B1C98028270F@alex0.net>

On Fri, May 23, 2025 at 12:22:44AM +0100, me@alex0.net wrote:
> I think I’ve just uncovered a rather nasty bug in the xen_acpi_processor driver in dom0. If the vcpu count in dom0 is set to anything other than the exact number of physical cores, the xen_acpi_processor kernel driver will fail to upload the C-state information for those cores to Xen, resulting in Xen never knowing about the C-states, which significantly impacts battery life on mobile platforms.
> 

While I dislike this bug, I don't think it qualifies as "nasty" since it
doesn't severely break anything.  Your system ends up using rather more
power than it should, but everything else continues to works as expected.

The simplest workaround is to not use dom0_max_vcpus, and instead do
`xl vcpu-set 0 #` to offline vCPUs after boot.  This leaves domain 0
allocating per-processor memory for unused processors, but does reduce
domain 0's vCPU use.

I believe this is partially bugs with Xen's ACPI support, but also an
issue with the Linux kernel module.  I've observed patches going by which
appeared aimed towards this problem, but for now this remains.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




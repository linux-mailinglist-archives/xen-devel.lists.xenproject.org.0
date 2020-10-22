Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB2829652F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 21:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10641.28397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVg70-0007GI-1F; Thu, 22 Oct 2020 19:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10641.28397; Thu, 22 Oct 2020 19:18:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVg6z-0007Fw-UC; Thu, 22 Oct 2020 19:18:57 +0000
Received: by outflank-mailman (input) for mailman id 10641;
 Thu, 22 Oct 2020 19:18:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kVg6z-0007Fr-1N
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 19:18:57 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34ca4d40-ad36-46f5-a35e-bab1a3cc54a7;
 Thu, 22 Oct 2020 19:18:56 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09MJIfm6082609
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Thu, 22 Oct 2020 15:18:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 09MJIeBP082608;
 Thu, 22 Oct 2020 12:18:40 -0700 (PDT) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JUr7=D5=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1kVg6z-0007Fr-1N
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 19:18:57 +0000
X-Inumbo-ID: 34ca4d40-ad36-46f5-a35e-bab1a3cc54a7
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 34ca4d40-ad36-46f5-a35e-bab1a3cc54a7;
	Thu, 22 Oct 2020 19:18:56 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 09MJIfm6082609
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 22 Oct 2020 15:18:47 -0400 (EDT)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 09MJIeBP082608;
	Thu, 22 Oct 2020 12:18:40 -0700 (PDT)
	(envelope-from ehem)
Date: Thu, 22 Oct 2020 12:18:40 -0700
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/acpi: Don't fail if SPCR table is absent
Message-ID: <20201022191840.GB81455@mattapan.m5p.com>
References: <20201021221253.GA73207@mattapan.m5p.com>
 <930267bd-5442-3ff0-bb5b-1ed8e2ebe37c@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <930267bd-5442-3ff0-bb5b-1ed8e2ebe37c@xen.org>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Thu, Oct 22, 2020 at 07:38:26PM +0100, Julien Grall wrote:
> I don't think we are very consistent here... I would not add them 
> myself, but I don't particularly mind them (I know some editors will add 
> them automatically).
> 
> I will keep them while committing. For the patch:

I would tend to remove them on commit since I dislike them.  Just as
stated, I was unsure.

On default settings, clang-format will object to:

if(thing)
{
	foo
}
else
	bar

Or

if(thing)
	foo
else
{
	bar
}

I *like* those formats, but was under the impression most people did not.
The indentation is the more visually obvious indicator, just the compiler
actually uses the brackets.  As such I *like* the misleading indentation
warnings as those seemed to have a fairly high true-positive rate.


On Thu, Oct 22, 2020 at 07:44:26PM +0100, Julien Grall wrote:
> Thank you for the patch. FIY I tweak a bit the commit title before 
> committing.
> 
> The title is now: "xen/arm: acpi: Don't fail it SPCR table is absent".

Perhaps "xen/arm: acpi: Don't fail on absent SPCR table"?

What you're suggesting doesn't read well to me.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E59304769
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 20:03:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75437.135837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4TcX-0004kP-9u; Tue, 26 Jan 2021 19:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75437.135837; Tue, 26 Jan 2021 19:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4TcX-0004k0-6A; Tue, 26 Jan 2021 19:03:21 +0000
Received: by outflank-mailman (input) for mailman id 75437;
 Tue, 26 Jan 2021 19:03:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4TcV-0004ju-PD
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 19:03:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76416527-7cb8-4742-a0eb-13ec3c2d8573;
 Tue, 26 Jan 2021 19:03:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 874F522228;
 Tue, 26 Jan 2021 19:03:17 +0000 (UTC)
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
X-Inumbo-ID: 76416527-7cb8-4742-a0eb-13ec3c2d8573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611687797;
	bh=CxdOm18QcjTByBOTXeDr+9j8JHLf6CUwJm+1nREHE5E=;
	h=Date:From:To:cc:Subject:From;
	b=QF1rFAJTsdyivFvbzd9fhnlQNj5LCk5C24fOWhe+dVTTc47fvfDQAZNuY6Ju7g2TS
	 KnddDIlHO5tT6hh1hMqLaktwaUaIow/StJnyVFpAVJ0Py4O9CmdQBi8axvyhXVnWvg
	 m/IsG04mqGq1EY3gwN3Zrp/bBjZWM0akFpOtay8eBb1J8nFry9vNjLeZKw+WYCg/2O
	 wYi9y/xC50iWkGxdYe9d61iEqkSa9ExXJjLGX/TUEy7i8qJ6OTXe+bRpeqMQb3Xniu
	 JXVhv82/HZJLdzUBUecc7+FCwH58JV7glb5pdh5kScNhx21zBrtqd9xq52aUiaJ8Tn
	 z/iqbLW2T/6/g==
Date: Tue, 26 Jan 2021 11:03:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, iwj@xenproject.org, jbeulich@suse.com, 
    julien@xen.org, wl@xen.org
Subject: [PATCH v5 0/2] introduce UNSUPPORTED
Message-ID: <alpine.DEB.2.21.2101261042030.20638@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

A recent thread [1] has exposed a couple of issues with our current way
of handling EXPERT.

1) It is not obvious that "Configure standard Xen features (expert
users)" is actually the famous EXPERT we keep talking about on xen-devel

2) It is not obvious when we need to enable EXPERT to get a specific
feature

In particular if you want to enable ACPI support so that you can boot
Xen on an ACPI platform, you have to enable EXPERT first. But searching
through the kconfig menu it is really not clear (type '/' and "ACPI"):
nothing in the description tells you that you need to enable EXPERT to
get the option.

This series makes things easier by doing the following:

- introduce a new kconfig option UNSUPPORTED which is clearly to enable
  UNSUPPORTED features as defined by SUPPORT.md

- change EXPERT options to UNSUPPORTED where it makes sense: keep
  depending on EXPERT for features made for experts

- tag unsupported features by adding (UNSUPPORTED) to the one-line
  description

- clarify the EXPERT one-line description

[1] https://marc.info/?l=xen-devel&m=160333101228981

Cheers,

Stefano


Stefano Stabellini (2):
      xen: EXPERT clean-up and introduce UNSUPPORTED
      xen: add (EXPERT) to one-line description of XEN_SHSTK

 xen/Kconfig              | 11 ++++++++++-
 xen/arch/arm/Kconfig     |  6 +++---
 xen/arch/x86/Kconfig     |  8 ++++----
 xen/common/Kconfig       |  2 +-
 xen/common/sched/Kconfig |  6 +++---
 5 files changed, 21 insertions(+), 12 deletions(-)


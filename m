Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32A992912E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2024 07:51:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754568.1163024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPyJ4-0001HS-Vt; Sat, 06 Jul 2024 05:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754568.1163024; Sat, 06 Jul 2024 05:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPyJ4-0001F1-TB; Sat, 06 Jul 2024 05:49:58 +0000
Received: by outflank-mailman (input) for mailman id 754568;
 Sat, 06 Jul 2024 02:22:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v1aR=OG=netbsd.org=riastradh@srs-se1.protection.inumbo.net>)
 id 1sPv4Z-0003H3-3n
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2024 02:22:47 +0000
Received: from mail.netbsd.org (mail.netbsd.org [199.233.217.200])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a061d999-3b3e-11ef-bbfb-fd08da9f4363;
 Sat, 06 Jul 2024 04:22:45 +0200 (CEST)
Received: by mail.netbsd.org (Postfix, from userid 1457)
 id 3238584D44; Sat,  6 Jul 2024 02:22:42 +0000 (UTC)
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
X-Inumbo-ID: a061d999-3b3e-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netbsd.org;
	s=20240131; t=1720232562;
	bh=mI0qwY2cgup+mnxCC6WbO1Fxx97Sbm0J56W2YH+EQt8=;
	h=To:Subject:Date:From;
	b=HhPqiIeIVM8kXH/NnTZrK1ThXugtzh/mTYeKcp7iMbUvjJuYc1TUq9qzFVvIt5N9+
	 pMFVkz+LJfHqotyvD8e8oRImGVJdcTjs8clIjVXbO6li9E1Pxqmj8GWfSGFDUrwR72
	 92iko/U5g+7luOGt5/kC26ycb2SHN+hX6+0aSkcc=
To: xen-devel@lists.xenproject.org
Subject: GNTTABOP_setup_table yields -1 PFNs
Date: Sat, 6 Jul 2024 02:22:40 +0000
From: Taylor R Campbell <riastradh-xen-devel@NetBSD.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20240706022242.3238584D44@mail.netbsd.org>

[I asked on IRC and Andrew Cooper suggested posting the question here.
I'm not subscribed to xen-devel@, so please cc me in replies.]


On a Xen 4.14 host (with extraversion=.0.88.g1d1d1f53), with version 1
grant tables, where GNTTABOP_query_size initially returns nr_frames=32
max_nr_frames=64, a NetBSD guest repeatedly queries
GNTTABOP_setup_table for successively larger nr_frames from 1 up.

The guest initially gets arrays of valid-looking PFNs.  But then at
nr_frames=33, the PFNs [0] through [31] in the resulting array are
valid but PFN [32] is -1, i.e., all bits set.

GNTTABOP_setup_table returned 0 and op.status = GNTST_okay, so it
didn't fail -- it just returned an invalid PFN.  And _after_
GNTTABOP_setup_table yields -1 as a PFN, GNTTABOP_query_size returns
nr_frames=33 max_nr_frames=64, so the host thinks it has successfully
allocated more frames.

What could cause the host to return a PFN -1?  Is there anything the
guest does that could provoke this?  Are there any diagnostics that
the guest could print to help track this down?  (I don't control the
host.)  Should a guest just check for -1 and stop as if it had hit
max_nr_frames?



(NetBSD then passes the PFN -1 on to HYPERVISOR_mmu_update, which
fails with EINVAL, at which point NetBSD crashes;
<https://gnats.NetBSD.org/58395>.  If I make NetBSD pretend the host
had advertised max_nr_frames=32, everything works fine.

I'm guessing non-NetBSD guests will eventually crash when they see -1,
but NetBSD sees it at boot while maybe it takes very heavy I/O load on
Linux to make it reach nr_frames=33 in this setup.)


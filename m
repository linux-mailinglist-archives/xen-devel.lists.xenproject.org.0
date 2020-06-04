Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428A1EE4B4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 14:45:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgpF4-0005VX-MG; Thu, 04 Jun 2020 12:45:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IlcT=7R=chiark.greenend.org.uk=ijackson@srs-us1.protection.inumbo.net>)
 id 1jgpF2-0005VR-Dw
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 12:45:04 +0000
X-Inumbo-ID: 35bab20a-a661-11ea-9947-bc764e2007e4
Received: from chiark.greenend.org.uk (unknown [2001:ba8:1e3::])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35bab20a-a661-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 12:45:03 +0000 (UTC)
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by chiark.greenend.org.uk (Debian Exim 4.84_2 #1) with esmtp
 (return-path ijackson@chiark.greenend.org.uk)
 id 1jgpF0-0006vr-PK; Thu, 04 Jun 2020 13:45:02 +0100
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: xen-devel@lists.xenproject.org
Subject: [OSSTEST PATCH 0/4] bisection: Skip some useless repros
Date: Thu,  4 Jun 2020 13:44:55 +0100
Message-Id: <20200604124459.18453-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <xadimgnik@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This arranges for an ongoing bisection to be able to restart more
efficiently when the staging tip advances, and yet the test being
bisected still fails.

This will speed up the current osstest bisection of the smoke test
libvirt failure.

There are no code changes outside the bisector and the bisector is not
itself subject to the osstest self-test.  I am therefore going to
force-push these four changes straight into osstest production.
(Obviously I have tested them locally and seen that bisection still
basically works and also that this fixes the issue.)

Ian Jackson (4):
  cs-bisection-step: need_repro_sequence: Provide info to callback
  cs-bisection-step: need_repro: Provision for $xinfo
  cs-bisection-step: need_repro: Support $consider_parents
  cs-bisection-step: Do not needlessly repro on tip

 cs-bisection-step | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

-- 
2.20.1



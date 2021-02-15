Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDB531C476
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 00:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85387.160092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBnZp-0005qr-Bx; Mon, 15 Feb 2021 23:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85387.160092; Mon, 15 Feb 2021 23:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBnZp-0005qS-8f; Mon, 15 Feb 2021 23:46:49 +0000
Received: by outflank-mailman (input) for mailman id 85387;
 Mon, 15 Feb 2021 23:46:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmGi=HR=runbox.com=m.v.b@srs-us1.protection.inumbo.net>)
 id 1lBnZn-0005qN-3k
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 23:46:48 +0000
Received: from aibo.runbox.com (unknown [91.220.196.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c493b652-372d-4272-8cd9-77c60a419d08;
 Mon, 15 Feb 2021 23:46:44 +0000 (UTC)
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <m.v.b@runbox.com>)
 id 1lBnZi-0005eU-98; Tue, 16 Feb 2021 00:46:42 +0100
Received: by submission01.runbox with esmtpsa [Authenticated alias (536975)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1lBnZW-0007iB-Pt; Tue, 16 Feb 2021 00:46:31 +0100
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
X-Inumbo-ID: c493b652-372d-4272-8cd9-77c60a419d08
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=4v9QKILfUudtdP3y6/ul7/qyjBU4cjEWU/fKUxb5z5I=; b=zFkxIb
	3wy3vTud7ItWm9o9/+cgnFqhS9de5gbgW4WThxhZpOtN7qwchyNXqut+NKtvoBGZc0NKuLpGQxeKS
	rjB6E8WbyvIhzqDdxDVRlesN51CNGc1rdWlTLkbrwdCOaBUZg3goil+9zqu5WsOCuTyKWqPdOSz5R
	UQUlR9+AloKgdSjOXf/XL0B0If8RLGp2Viz4nFatYpgn2r+R+GqYpsXpqSgiwE51ZGS2OGsQ3pAc0
	aTuEeGNGxSFzS/asu7qJp4clCtVz5VUty0HPXC6zh5GK/Kk1W69Qxk4myZ+UYrMHwWiMhi2thJiJO
	PEQi4NdjyqDgQfhTKXkFCF//K9HA==;
From: "M. Vefa Bicakci" <m.v.b@runbox.com>
To: xen-devel@lists.xenproject.org
Cc: m.v.b@runbox.com,
	marmarek@invisiblethingslab.com,
	roger.pau@citrix.com,
	jbeulich@suse.com
Subject: [PATCH 0/1] Fix for a buggy XSA-321 resolution in Xen 4.9
Date: Mon, 15 Feb 2021 18:46:18 -0500
Message-Id: <20210215234619.245422-1-m.v.b@runbox.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

I found a bug in Xen 4.9 involving what I think is an incorrectly backported
patch for XSA-321. I realize that Xen 4.9 no longer receives security support,
but as a Qubes OS 4.0 user, I still rely on Xen 4.8, and this bug affects me
negatively.

I would really appreciate it if anyone could review the following patch in this
e-mail thread. I am mainly looking for a confirmation as to whether the patch
fixes the buggy backport in an acceptable manner. The description of the patch
is very (and possibly too) detailed and should have all of the necessary
background.

Thank you in advance,

Vefa

M. Vefa Bicakci (1):
  x86/ept: Fix buggy XSA-321 backport

 xen/arch/x86/mm/p2m-ept.c | 57 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 29 deletions(-)


base-commit: 4597fc97b3b8870c39214e3aa4132ab711a40691
-- 
2.29.2



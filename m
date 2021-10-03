Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1476420126
	for <lists+xen-devel@lfdr.de>; Sun,  3 Oct 2021 12:12:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201109.355528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWyS4-0007uu-A4; Sun, 03 Oct 2021 10:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201109.355528; Sun, 03 Oct 2021 10:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWyS4-0007sa-73; Sun, 03 Oct 2021 10:10:36 +0000
Received: by outflank-mailman (input) for mailman id 201109;
 Sun, 03 Oct 2021 10:10:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DbZ3=OX=riomar.se=rio@srs-us1.protection.inumbo.net>)
 id 1mWyS3-0007sU-AP
 for xen-devel@lists.xenproject.org; Sun, 03 Oct 2021 10:10:35 +0000
Received: from mail2.riocities.com (unknown [185.20.14.89])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bac5c4b1-313c-479d-ae8b-fd57cbef9355;
 Sun, 03 Oct 2021 10:10:34 +0000 (UTC)
Received: from mail.riomar.se (81-230-197-241-no510.tbcn.telia.com
 [81.230.197.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail2.riocities.com (Postfix) with ESMTPSA id 204C34018A
 for <xen-devel@lists.xenproject.org>; Sun,  3 Oct 2021 11:52:15 +0200 (CEST)
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
X-Inumbo-ID: bac5c4b1-313c-479d-ae8b-fd57cbef9355
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=riomar.se; s=mail;
	t=1633254735; bh=p3Dx0Ok4EjvyMD83V6zwqjWJQHNk1P8tDcD2oZvEp4s=;
	h=Date:From:To:Subject:From;
	b=wnJVUkN+5fPRp5qm9quSWOdvy97zIdXva2zqQrtEGG7PuqxQM2jd7jodMzqGtsjpf
	 sXO/mWYMOoOD4WweMNyZgOixFrMSZXnJLwdQjT0DEDW86vw/SGyBGN/uYegsW9QDNQ
	 7ubFkq7+FWuL/IxnBp4DD3YH/KaAxWaNeLXhtCc0=
Date: Sun, 3 Oct 2021 11:52:13 +0200
From: Henrik Riomar <rio@riomar.se>
To: xen-devel@lists.xenproject.org
Subject: xen-balloon and 5.10.70
Message-Id: <20211003115213.d7d9d4c1a1bc371cd4b7dc76@riomar.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

Running 5.10.70 on a dom0 shows 100% load on one core for the
xen-balloon kernel thread (was a workqueue before 5.10.70).

I have upgraded two dom0's to 5.10.70 and both of them shows this issue.

Xen version is 4.15.1.

To trigger the problem:
 dom_mem=3000M,max:3000M

Does not trigger the problem:
 dom_mem=3000M

(the other system with the issue has "dom0_mem=4096M,max:4096M")

/etc/xl/xl.conf:
 #autoballon="auto" 
 or
 autoballon="off"
 or 
 autoballon="on"

does not matter, in trigging the problem (i.e. autoballon="off", still
gets [xen-ballon] to hog down one core).

Can not see the problem before starting the first domU, and shutting
down all domUs stops xen-balloon to hog the core.

Workaround in a running system is to lower
 /sys/devices/system/xen_memory/xen_memory0/target_kb.

With max:3000M this was 3072000 (kb), and just lowering it to 3069952
(i.e. by 2 meg) "solved" the issue, and stopped the fan in my laptop :-)

/ Henrik


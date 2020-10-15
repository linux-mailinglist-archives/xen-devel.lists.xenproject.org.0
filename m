Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C404828F4A4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:25:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7414.19362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4CK-0004Za-QP; Thu, 15 Oct 2020 14:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7414.19362; Thu, 15 Oct 2020 14:25:40 +0000
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
	id 1kT4CK-0004ZB-N2; Thu, 15 Oct 2020 14:25:40 +0000
Received: by outflank-mailman (input) for mailman id 7414;
 Thu, 15 Oct 2020 14:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kT4CI-0004Z5-DY
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:25:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1f53e1f-a805-4668-a92e-685360403d7a;
 Thu, 15 Oct 2020 14:25:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bKTB=DW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kT4CI-0004Z5-DY
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:25:38 +0000
X-Inumbo-ID: c1f53e1f-a805-4668-a92e-685360403d7a
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1f53e1f-a805-4668-a92e-685360403d7a;
	Thu, 15 Oct 2020 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602771936;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ISsVjYKh083/gZzNPG9aHljTD9ZFK2BfAgEw3ykuDXk=;
  b=csrDIlI5rF/bBgy26IpXOvcBJWzvQUc/iyzx45seJe4EQyeUj4JlkvBi
   w6T+tcvr/XgoMMzMqWMtWdHRpZKx4+beJIdfDTry3QM8QeyV5kaOrU/bR
   fAX4RNiFXxyOyzdveCYCPa5NIOQcldttSSaqI9Pd+Suo50vrzJH5duFHa
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: smY+e8aDkg2xJlFhPHHTjL7NFnuIum4Ix6GjOJ6YaxdZqsg8/1UJjJ32TKlqd1YxwjNbde6up8
 yC7T+ITSUXgNSY2a4I3MXHsYxUw76HFH6qA/2yGGUKm/+pj+rQybqlXAf1cXaThs6mkhm2wK3k
 pqMVlh9ZBlPOIKL6m1DFiAf9wxcsIcngd8kR/3HsJM2Q3Ubz6Pyt+VYHiMUuLtKqUOdGokDeuy
 sj416JtmG+wqd2uYZ2gp8ubZH6U3MNyhAgzr4CD2wFciLv47sWjDpXD1cheNq65fDjPfGzQP8J
 XSU=
X-SBRS: 2.5
X-MesageID: 30126341
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,379,1596513600"; 
   d="scan'208";a="30126341"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, SeongJae Park <sjpark@amazon.de>,
	<xen-devel@lists.xenproject.org>, <linux-block@vger.kernel.org>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, "J . Roeleveld"
	<joost@antarean.org>
Subject: [PATCH 0/2] xen/blkback: add LRU purge parameters
Date: Thu, 15 Oct 2020 16:24:14 +0200
Message-ID: <20201015142416.70294-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add the LRU parameters as tunables.

Roger Pau Monne (2):
  xen/blkback: turn the cache purge LRU interval into a parameter
  xen/blkback: turn the cache purge percent into a parameter

 .../ABI/testing/sysfs-driver-xen-blkback      | 19 +++++++++++++++++++
 drivers/block/xen-blkback/blkback.c           | 16 +++++++++++-----
 2 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.28.0



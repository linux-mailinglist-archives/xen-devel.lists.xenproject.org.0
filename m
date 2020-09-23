Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827242751D0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 08:46:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKyXP-0001Xx-JX; Wed, 23 Sep 2020 06:45:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eB7U=DA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKyXO-0001WR-5n
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 06:45:58 +0000
X-Inumbo-ID: 9c6b2c62-a521-4c15-a821-7bd8149edae9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c6b2c62-a521-4c15-a821-7bd8149edae9;
 Wed, 23 Sep 2020 06:45:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600843545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WytBWmaWuAP1A/mYEJxrs/84RU1hPLptGyDG+mhxNUg=;
 b=Z6+mp/S+cEBBp0/5bNScaaRIOxN0rZ16PJO7uIFiCFxKz0n+LEKQx8wL+NjMJ0wj9mqamU
 ZpT8olLYQ57Qt8n6mLR7W5y5C5wcFHo1cZvUIq6dskKOVqSjPhygB28+oILf4jLxFLsSp9
 kP69e1IakQr/0BPwI9qy1Eeo0dH1KN4=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5F3FFAE19;
 Wed, 23 Sep 2020 06:46:22 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH 0/3] stubdom: add xenstore pvh stubdom support
Date: Wed, 23 Sep 2020 08:45:38 +0200
Message-Id: <20200923064541.19546-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add support for creating a PVH Xenstore stub-domain.

This includes building the stubdom and loading it at system boot.

It should be noted that currently this stubdom is not in a working
state as there is some support in Mini-OS missing. I'm working on
adding this support.

Juergen Gross (3):
  tools/init-xenstore-domain: add logging
  tools/init-xenstore-domain: support xenstore pvh stubdom
  stubdom: add xenstore pvh stubdom

 .gitignore                           |   1 +
 stubdom/Makefile                     |  31 ++++-
 stubdom/configure                    |  47 ++++++++
 stubdom/configure.ac                 |   1 +
 stubdom/xenstorepvh-minios.cfg       |  10 ++
 tools/helpers/init-xenstore-domain.c | 170 ++++++++++++++++++++-------
 6 files changed, 213 insertions(+), 47 deletions(-)
 create mode 100644 stubdom/xenstorepvh-minios.cfg

-- 
2.26.2



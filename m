Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B853476593
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 23:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247617.426993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcef-0005c4-AP; Wed, 15 Dec 2021 22:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247617.426993; Wed, 15 Dec 2021 22:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxcef-0005a2-6F; Wed, 15 Dec 2021 22:21:45 +0000
Received: by outflank-mailman (input) for mailman id 247617;
 Wed, 15 Dec 2021 22:21:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LTfI=RA=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mxced-0005ZJ-TT
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 22:21:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6030be57-5df5-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 23:21:42 +0100 (CET)
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
X-Inumbo-ID: 6030be57-5df5-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639606902;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iPJtlo52ZPRCJ/j6YuQ5J89j4lSVCx0r858GzTa2D6o=;
  b=R5xhXNxSytcr0JpZyWQGb+nXW0PJAyq8UlSeQyYBiGwTWE0Adsc3ABUA
   TzWwIg9HNvps9N6//fB3oPvW++dhFiR4ESAj+pL4I9sbTNZwo2bAwHKej
   yF5ue0N/AO94v5Bv6UI5Z18M1Ykm1sIzYAhMPBmsn7Yjq/XMDV/M+djgN
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ab2mhAzUfyqKtvN8idDjc+9VpWqjge9+qxScC9caDqN0NgD83MQ66M+eI6k+j+xEMY3urLanuA
 sHxy3xomF7KBLtqn5vvO3KFuWNbtIoK7C9GBDWplFF+0awmPmlu9UCktkbV71ny018nvOb+YK3
 yc2v9aYrRrcRPYOL9FK3LFhJ8L+2SjHtWVItB98NVBsQ6Zl75hIrrlzBAfckYfkiAUi/RlQvMa
 IJrqrJzjig2AFgxZyHr632FIFMEthrFbsO0fjI9zeNn9ve2SlkOK2TaltyJW7VcH6pohtjhIay
 cl/NSZ8MOjck8KJrOE+dicta
X-SBRS: 5.1
X-MesageID: 59629091
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:okY9PqAVrPRdoBVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApD531DZUx
 2IXCG6HaPbeZDegKdlyPYzk/UgOsMWHnNdnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+EX570E87wIbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/mhqAmtx+5
 cpxk5nuRkQnMq2Poe8xXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjWlq15gfRJ4yY
 eIBNyNgfDD9XSRJBXRMWY0Ypbjvh1rwJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiG+rtxsQVPdPL8s/tg7OxKbUoD+SKmdRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8pDGJGT9bxgbQ+0RqmBNzDJrVml
 CJb8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9JtENsWohdBozap1sldrVj
 Kn741k5CHh7ZiTCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2l3hW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDtJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:KjFac6+ZytPU5PRwBrJuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.88,209,1635220800"; 
   d="scan'208";a="59629091"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/4] x86/cpuid: Introduce dom0-cpuid=
Date: Wed, 15 Dec 2021 22:21:11 +0000
Message-ID: <20211215222115.6829-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (4):
  x86/cpuid: Split dom0 handling out of init_domain_cpuid_policy()
  x86/cpuid: Factor common parsing out of parse_xen_cpuid()
  x86/cpuid: Introduce dom0-cpuid command line option
  x86/cpuid: Advertise SERIALIZE by default to guests

 docs/misc/xen-command-line.pandoc           |  17 +++++
 xen/arch/x86/cpuid.c                        | 100 ++++++++++++++++++++++------
 xen/arch/x86/include/asm/cpuid.h            |   3 +
 xen/arch/x86/setup.c                        |  15 +++--
 xen/include/public/arch-x86/cpufeatureset.h |   2 +-
 5 files changed, 112 insertions(+), 25 deletions(-)

-- 
2.11.0



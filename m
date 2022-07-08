Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3864156BE17
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 18:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363583.594219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiM-00061l-W8; Fri, 08 Jul 2022 16:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363583.594219; Fri, 08 Jul 2022 16:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9qiM-0005yV-Sd; Fri, 08 Jul 2022 16:20:22 +0000
Received: by outflank-mailman (input) for mailman id 363583;
 Fri, 08 Jul 2022 16:20:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i666=XN=citrix.com=prvs=181ea21da=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1o9qiL-00054g-5S
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 16:20:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db6a532c-fed9-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 18:20:20 +0200 (CEST)
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
X-Inumbo-ID: db6a532c-fed9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657297219;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JXYfonh7wj3ThAZmLEhpE9NLkOrzDAqig0RXIjQQqEU=;
  b=GwqvMqOurQ1dY7ipk+tgWSIrJEQZ3E/819NVtbRa9Srd2a0pPmbzg4jw
   ylgFiY0rCtoZb9/RqEDuSbT/WJ4VFaFGfvsqcyCSC0ApZtw53AOySPynQ
   5lnjkhjovMek7XYSlaCdgM/sKsMjyVt0wYO74MF+6U14nJGjM8EKOWllH
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 77956798
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:f8nGGas6jHDgQMY5R70n+E+aH+fnVFpeMUV32f8akzHdYApBsoF/q
 tZmKWuPP/aKMWbwed5+OYu1o0lU7MLVmNRhQVY4rS5jHn8X+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW1zV6
 YupyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8WLrLPm78+fiJDPAolbIEdoI7JP1uw5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllJyz3DAOlgapfEW6jQvvdT3Ssqh9AIFvHbD
 yYcQWUwPUmePEwfUrsRIIwAsM6CrVXdTzFJ9U6TpY8m+Vf08iUkhdABN/KKI4fXFK25hH2wp
 H/C/mn/KgEXMpqY0zXt2m2orv/Cm2X8Qo16PKaj6vdgjVmXx2oSIB4bT122pb++kEHWc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhQyiJisWdkwvXjQrZlBUz4K7kY8trR2aG76PD5WJYs3J9SDYm
 m7X83Jn2+pD0abnxI3gowmZ3mvESozhC1dsu16JBj/NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N702wcH82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYib1N/YnPNLrVZ56pUQFKTgDfqmFBjapSsEoHDJrAQk0PRLAt4wTuBJEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqLH/jTlk3/uZLHPSL9YepVYTOmM7FihIvZ8Vq9z
 jqqH5bTo/mpeLalOXe/HE96BQ1iEEXX8ris8ZIIKrLdclo2cIzjYteIqY4cl0Vet/w9vo/1E
 ruVAB8wJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:y48TFKhpmPGxOKj9ZFxRS0l1B3BQXtQji2hC6mlwRA09TySZ//
 rOoB19726TtN9xYgBGpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ8l6U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.92,256,1650945600"; 
   d="scan'208";a="77956798"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 0/3] x86/spec-ctrl: Bug / (mis)feature fixes
Date: Fri, 8 Jul 2022 17:19:31 +0100
Message-ID: <20220708161934.10095-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (3):
  x86/spec-ctrl: Honour spec-ctrl=0 for unpriv-mmio sub-option
  xen/cmdline: Extend parse_boolean() to signal a name match
  x86/spec-ctrl: Add fine-grained cmdline suboptions for primitives

 docs/misc/xen-command-line.pandoc | 12 +++++--
 xen/arch/x86/spec_ctrl.c          | 67 +++++++++++++++++++++++++++++++++------
 xen/common/kernel.c               | 20 +++++++++---
 xen/include/xen/lib.h             |  3 +-
 4 files changed, 85 insertions(+), 17 deletions(-)

-- 
2.11.0



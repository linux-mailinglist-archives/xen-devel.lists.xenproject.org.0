Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1172E577C59
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 09:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369275.600623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1m-0005SA-I5; Mon, 18 Jul 2022 07:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369275.600623; Mon, 18 Jul 2022 07:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDL1m-0005IR-94; Mon, 18 Jul 2022 07:18:50 +0000
Received: by outflank-mailman (input) for mailman id 369275;
 Mon, 18 Jul 2022 07:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDL1k-0004tp-Br
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 07:18:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcff2983-0669-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 09:18:47 +0200 (CEST)
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
X-Inumbo-ID: dcff2983-0669-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658128727;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mum1aKh8B28t6+mlcr+GzyZyZrglrMoFRYfHGq4I0qs=;
  b=Zuu7XkbW4U82RljWa/OJqD8BvI9FPCqBCsPbUewEoLDUWg97ABwt/tqZ
   TzUDcXuw3x9mw9bvKdmH8s7g7GDe57TJmeiR2U2lRZEhy9TYt90+oK6gN
   H9xu0ymW4oiyL18q6+6RvM+iFNuUqMgV4v+dSB+CS4zEnMPN76fHxH3vE
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76442483
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Rcff2qBxOxqi9BVW/z3jw5YqxClBgxIJ4kV8jS/XYbTApGtwgjRWn
 TccX2nQOPyKMDH8Lt90O9zkoxlV75TXx4ViQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pe31GONgWYuaDpLsv3b8nuDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJW0rR095NIRE1B7Rb3P1zDUVQx
 6YqNS9YO3hvh8ruqF66Yuxlh8BlJ8j3JoIP/HpnyFk1D95/H8qFGf+To4YFgnFg3aiiHt6HD
 yYdQRNpYA7NfFtkPVAPBYhltOypmmP+Y3tTr1f9Sa8fvDaPkFYtgOOF3Nz9JeDSY8xloFqh/
 3uB8GvyW04aD/nC8G/Qmp6rrrCWxn6qMG4IL5W6+eRtm0a73XEIBVsdUl7TifW3g0GxWtVbK
 mQP5zEj66M18SSDbPPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLIZOlpf7YSTLK+
 nOstywyo6sh1/wWyPDulbzYuA5AtqQlXyZsuFiIDzr0v18jDGK2T9f2sAaGtJ6sOK7cFwDc5
 yZcxqBy+chUVfmweDqxrPLh9V1Dz9KMK3XijFFmBPHNHBz9qif4Lei8DNyTTXqF0/romhezO
 Sc/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvKV/frHs/OhbJjjyFfK0QfUYXY
 M3zTCpRJSxCVfQPIMSeHY/xLoPHNghhnDiOFPgXPjys0KaEZW79dIrpxGCmN7lhhIvZ8Vq9z
 jqqH5HVo/mpeLGhP3K/HE96BQxiEEXX8ris9pQJJrbeflY+cIzjYteIqY4cl0Vet/w9vo/1E
 ruVACe0FHKXaaX7FDi3
IronPort-HdrOrdr: A9a23:Kho/nKhMTd6jj0eTVbL0W7Yk/nBQXtQji2hC6mlwRA09TySZ//
 rOoB19726TtN9xYgBGpTnuAtjifZqxz/FICOoqTNOftWvdyQmVxehZhOOIqVCNJ8SXzJ8l6U
 4KSchD4bPLY2SS9fyKhTWFLw==
X-IronPort-AV: E=Sophos;i="5.92,280,1650945600"; 
   d="scan'208";a="76442483"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH 0/5] xen/wait: Improvements
Date: Mon, 18 Jul 2022 08:18:20 +0100
Message-ID: <20220718071825.22113-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This started out as patch 2 for a different task, and quickly identified some
technical debt, long overdue for cleaning up.

Andrew Cooper (5):
  xen/wait: Drop vestigial remnants of TRAP_regs_partial
  xen/wait: Extend the description of how this logic actually works
  xen/wait: Minor asm improvements
  xen/wait: Use relative stack adjustments
  xen/wait: Remove VCPU_AFFINITY_WAIT

 xen/common/domain.c     |   2 -
 xen/common/sched/core.c |   4 +-
 xen/common/wait.c       | 117 +++++++++++++++++++++++++-----------------------
 xen/include/xen/sched.h |   1 -
 4 files changed, 63 insertions(+), 61 deletions(-)

-- 
2.11.0



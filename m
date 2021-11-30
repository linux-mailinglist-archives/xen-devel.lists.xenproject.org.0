Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C512463D6E
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 19:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235412.408403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7be-0000QI-NQ; Tue, 30 Nov 2021 18:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235412.408403; Tue, 30 Nov 2021 18:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms7be-0000OV-KI; Tue, 30 Nov 2021 18:11:54 +0000
Received: by outflank-mailman (input) for mailman id 235412;
 Tue, 30 Nov 2021 18:11:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1hFC=QR=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ms7bd-0000OK-4t
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 18:11:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcc13387-5208-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 19:11:51 +0100 (CET)
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
X-Inumbo-ID: fcc13387-5208-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638295911;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/pUrjElA6slsBbeWTuKvX/U6+y7cE8rDWsCknQCS6GI=;
  b=EBwLx9SP3pKj7rHCJX2H1E8r/LABwxu7B+Z2r0RrK5hnpvjSE4daadn1
   LW2hwnNVDbdWfBHmsicWcZgwrawDquk41Y1ekIP0fbGszGTfHX8O9UQsJ
   PujSvlrvXl9GH31t5lgulOhvorQfzrzb0J7Qg9wGGWZS5YD/9G5ZfeQDy
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7nP1C6uTYs6YyDIVedK3VdiiS5hzI2JGu7RzRI6z8bK1lfVUk+W/j21Cit7f49DpRzxa21QR9n
 fYK3X5aSmyrM7iRVU+1J5/k39dppkW8DPANptTjQZRd0R7dgBSDpCz4bKt2UwU+GRuLnbUD1qL
 Qj81nM1XGYcZT2PCC/HrX5U4h/1NBjt1W9zTSqwAzOgmuKN/K2/ycb8FfdRH7O8tVld7puibSg
 llJzf1duavP6zv+HKCRue2RRsYo8HNJ6L1XZ3BN6vQ/zdqN6R78Ww+Xgy+wgI9OtbL7xZo0I4p
 YWs37os2ws/5dsWkTXrlsUWn
X-SBRS: 5.1
X-MesageID: 58893853
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uGQUyqkD2EBv0IT8JqPcqSXo5gwWIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWDyGaa6MZjCjedl1aYi38UlVupfcn4RqSFRorSw9QyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg29Uw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I9zrLXpUgErBaLVw74ydkFISAhfG5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKaON
 pFJNGEHgBLoTkFRZXUQULwEpNyr30TOQR5EhnvOqv9ii4TU5FMoi+W8WDbPQfSWTMBchW6Ep
 WbL+WvoDxVcP9uaoRKM82mlh+vGtSn6RI4fGrC++vNwxlaUwwQ7EAUXT1CypfCzl2a0Ws5TJ
 kIZ/CYjt+4580nDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSvYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OPSLl/SsAjfy+
 D+T93IRou0D1ucq8ZzuqDgrnAmQjpTOSwc04CDeUWSk8h51aeaZWmC41bTIxa0eddjEFzFtq
 FBBwpHDt75WUflhgQTUGL1VdIxF8cppJ9E1bbRHO5A6vwqg9He4FWy7yGEvfRw5WirolNKAX
 aMyhe+zzMMDVJdJRfUuC25UNyjM5fO7fTgCfqqJBueimrArKGe6ENhGPCZ8JVzFnkk2ir0YM
 pyGa8uqBntyIf05l2rsHr5GiuFxmnpWKYbvqXbTlE/PPV22PiP9dFv4GAHWMrBRAF2s/m05D
 Oqzx+PVkk4CAYUSkwHc8JIJLEBiEJTILcueliCjTcbaelAOMDh4U5f5mOp9E6Q4z/U9vrqZp
 RmVBx4HoGcTcFWacG1mnFg4M+ixNXu+xFpmVRER0aGAhyJ+PN3xtfhHLPPav9APrYRe8BK9d
 NFdE+3oPxiFYm6vF+01YcavoYp8Wg6sgA7SbSOpbCJmJ8xrRhDT+8+idQzqrXFcAi2yvMo4g
 ruhygKEHsZTG1U8VJ7bOKC10le8nXkBg+YuDUHGFcZeJRf3+49wJi2v0vJue5MQKQ/Ozyex3
 hqNBUtKvvHEpoI4qYGbha2No4qzPfF5G05WQzvS4bqsbHGI9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHu8yn6wk5tbpq7tL9SheHS3GPwaxF7dtAniaxs0T5KdD8aBU5FmtU
 UWV99gEZbjQYJH5EEQcLRYOZ/iY0a1GgSHb6Pk4LRmo5CJz+7bbA0xeMwPV1X5YJbpxdogk3
 f0gqIgd7Anm0kgmNdOPjyZ18WWQLyNfD/V7589CWIK72BA2zlxiYIDHDn6k6Z6CXNxAL002L
 2LGn6HFnbldmhLPfndb+aIhBgaBaUDiYCx38WI=
IronPort-HdrOrdr: A9a23:PWf2W6HKMOy5GJkvpLqEfceALOsnbusQ8zAXPiBKJCC9E/bo4v
 xG+c5rtiMc5wxhIU3I5urwRpVoLUmskaKd7LN8AV7gZniWhILQFvAQ0WK6+UyTJ8SczJ8o6U
 4DSdkHNDSYNzEb/KTHDRGDe71L/DDgytHOuQ609QYJcegFUdAH0+8FYjzrYnGekDM2f6YRJd
 69wfdqnB2JXDAyTun+Kkg5c9Plj/ijrvPbiWJvPW9Z1OD3t0LS1JfKVz6i/jk/dBtrhZcamF
 Kqr+UP3NTejxhL8HDhPsbonulrpOc=
X-IronPort-AV: E=Sophos;i="5.87,276,1631592000"; 
   d="scan'208";a="58893853"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH 0/2] x86/hvm: Cleanup
Date: Tue, 30 Nov 2021 18:11:37 +0000
Message-ID: <20211130181139.14398-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Andrew Cooper (2):
  x86/hvm: Simplify hvm_enable_msr_interception()
  x86/hvm: Rework nested hap functions to reduce parameters

 xen/arch/x86/hvm/hvm.c                  |  5 +----
 xen/arch/x86/hvm/svm/nestedsvm.c        | 11 +++++----
 xen/arch/x86/hvm/vmx/vvmx.c             | 10 ++++-----
 xen/arch/x86/mm/hap/nested_hap.c        | 40 +++++++++------------------------
 xen/arch/x86/mm/p2m.c                   | 12 +++++-----
 xen/include/asm-x86/hvm/hvm.h           | 21 ++++++++---------
 xen/include/asm-x86/hvm/nestedhvm.h     |  6 +----
 xen/include/asm-x86/hvm/svm/nestedsvm.h |  6 ++---
 xen/include/asm-x86/hvm/vmx/vvmx.h      |  8 +++----
 9 files changed, 47 insertions(+), 72 deletions(-)

-- 
2.11.0



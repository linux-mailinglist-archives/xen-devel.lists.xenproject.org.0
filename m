Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357CAC270C
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 18:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995934.1378007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIUq9-0001eb-BG; Fri, 23 May 2025 16:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995934.1378007; Fri, 23 May 2025 16:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIUq9-0001cp-8V; Fri, 23 May 2025 16:01:45 +0000
Received: by outflank-mailman (input) for mailman id 995934;
 Fri, 23 May 2025 16:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=12Bt=YH=oracle.com=liam.merwick@srs-se1.protection.inumbo.net>)
 id 1uIUq7-0001cg-LU
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 16:01:43 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3661a783-37ef-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 18:01:41 +0200 (CEST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFxT4H011710;
 Fri, 23 May 2025 16:01:37 GMT
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46tv4q8079-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 May 2025 16:01:37 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 54NFvE9H001898; Fri, 23 May 2025 16:01:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46rwev5r1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 May 2025 16:01:36 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54NG1Zq7032523;
 Fri, 23 May 2025 16:01:35 GMT
Received: from lmerwick-vm-ol8.osdevelopmeniad.oraclevcn.com
 (lmerwick-vm-ol8.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.255.219])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 46rwev5qyx-1; Fri, 23 May 2025 16:01:35 +0000
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
X-Inumbo-ID: 3661a783-37ef-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=/HSM8HF+XvdzD7AJ
	OUGZLdAp3QeqS8wTKQhywnwBqrU=; b=TjHYYmKPXQxfff6avkU4904RFrpK6MxZ
	78zUWbATL69DasbWSJ3BVrtJXfCF0q31N20tHWeo45l7H8DQoiiKGtR05VT310z2
	+xjiAhIqw0PLW4n7mVms9vfF/bPJDLfxFTzy/KYGEr8ZpsBzFNtjsTahdYzqKtfc
	xVpY1GLYAGF0eS2AB5Cm7deF4/ZXuOEqRgb2b+3nr5zR/hxTx9o1fT3lS1zBCEK7
	t7cTxg6R1JqqIYSd6g2JWwZVEF2jw6QqvtDjrkNalQ1WVxq7Eh+70EAR8DPA5wlK
	8NMhWQZ3GNBx0DWuM57161MJQ0a0JuAAFRCJY50nrmXDZOU+Zh5y9w==
From: Liam Merwick <liam.merwick@oracle.com>
To: dwmw@amazon.co.uk, anthony.perard@vates.tech, roger.pau@citrix.com,
        xen-devel@lists.xenproject.org, qemu-devel@nongnu.org,
        liam.merwick@oracle.com
Subject: [PATCH] hw/xen: Fix trace_xs_node_read() params
Date: Fri, 23 May 2025 16:01:34 +0000
Message-ID: <20250523160134.218997-1-liam.merwick@oracle.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=963
 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505230145
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE0NSBTYWx0ZWRfXzKhc12nOACPq ry0AdFC6085lYP89tiCbsgK59zp6dbmGaRNLjkmSFkTDJLkCByJwoyBoF7T3ms3Km+VGNsBnv0w bcZQCvQbXst7hNmq8vXblCJsOpzLCj8E4Z77T2KILxalaY2J528WJ8rXiSN3pqT55wXq4LLyvJa
 Lf7EOYZDKVWD0rIrrp1Nt/vkgpoIO6J5HBgV6LPif/qf5xReyirOybjbk1fJ2lg+Ut+5RN3TQbF 4BPh0x/POI6wgvyXoI0XIFzRNl8qN9Okqk8okEBJrV8D0Y2rdnmgyKO3SuKzGTW2Fy1yr2XB9ot aeun3TTD6dparyeqlownuPfW9DdzbFufu4CF+EwADGThttaShBZbXZeVjBeK1rULfVdaTzsMKjm
 EF7FuUwlUsMQBvtmJMMSbTuJI4UizbVeXBDKJJEtpXb4csCcfm9MV08Kanh2eGa4ciqAhYdk
X-Authority-Analysis: v=2.4 cv=VoUjA/2n c=1 sm=1 tr=0 ts=68309be1 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=yPCof4ZbAAAA:8 a=bOG54WbAxldRIBuYn70A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yj_f9Ug9G2CAGoj9LV9uUD-tIWKa7atM
X-Proofpoint-ORIG-GUID: yj_f9Ug9G2CAGoj9LV9uUD-tIWKa7atM

When the '--enable-trace-backends=syslog' build option is configured,
the following compilation error is encountered.

In file included from /usr/include/sys/syslog.h:207,
                 from /usr/include/syslog.h:1,
                 from ./trace/trace-hw_xen.h:224,
                 from ../hw/xen/trace.h:1,
                 from ../hw/xen/xen-bus-helper.c:13:
In function ‘syslog’,
    inlined from ‘_nocheck__trace_xs_node_read’ at ../hw/xen/trace-events:41:9,
    inlined from ‘trace_xs_node_read’ at trace/trace-hw_xen.h:903:9,
    inlined from ‘xs_node_read’ at ../hw/xen/xen-bus-helper.c:154:5:
/usr/include/bits/syslog.h:45:3: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
   45 |   __syslog_chk (__pri, __USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a check that 'value' is not null before passing it to trace_xs_node_read().

Fixes: e6cdeee95990 ("hw/xen: Add xs_node_read() helper function")
Signed-off-by: Liam Merwick <liam.merwick@oracle.com>
---
 hw/xen/xen-bus-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/xen-bus-helper.c b/hw/xen/xen-bus-helper.c
index 288fad422be3..1087a585cc71 100644
--- a/hw/xen/xen-bus-helper.c
+++ b/hw/xen/xen-bus-helper.c
@@ -151,7 +151,7 @@ char *xs_node_read(struct qemu_xs_handle *h, xs_transaction_t tid,
     va_end(ap);
 
     value = qemu_xen_xs_read(h, tid, path, len);
-    trace_xs_node_read(path, value);
+    trace_xs_node_read(path, value ? value : "<null>");
     if (!value) {
         error_setg_errno(errp, errno, "failed to read from '%s'", path);
     }
-- 
2.47.1



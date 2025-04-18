Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0642CA931A6
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 07:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958691.1351382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5eaC-0003sF-Vf; Fri, 18 Apr 2025 05:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958691.1351382; Fri, 18 Apr 2025 05:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5eaC-0003qn-T2; Fri, 18 Apr 2025 05:48:12 +0000
Received: by outflank-mailman (input) for mailman id 958691;
 Fri, 18 Apr 2025 05:48:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cO0Y=XE=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1u5eaB-0003qf-2G
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 05:48:11 +0000
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3a4f8e6-1c18-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 07:48:07 +0200 (CEST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I5NcHN002787;
 Fri, 18 Apr 2025 05:47:54 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46187xyrhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Apr 2025 05:47:54 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 53I5XBLs024756; Fri, 18 Apr 2025 05:47:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 460d54fy9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Apr 2025 05:47:53 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53I5lq6f036462;
 Fri, 18 Apr 2025 05:47:52 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 460d54fy32-1; Fri, 18 Apr 2025 05:47:52 +0000
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
X-Inumbo-ID: b3a4f8e6-1c18-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=+adpAbdYLs38FhIOhHdHbujyLz8AT
	wIWgf4obfGpmRM=; b=n1aMFpG8AJgT3AqY4fjpd+mJS3+7LE1CUienPM8CqMRHD
	glz/lSe6UtfzAo2UJ1EHYbkH215/48wka5AEORG9WJTx5+69TPrfUuwfmZUvzbV2
	egwPzgt0Q3HdYEB5LLvZtc/jSzpJx2eQGF8YVV1N0md/ILFDg/GLH6zfl/Hwy9ad
	4rwIG4vG9n59d1M+GIMdHVZ7OKc4PmtFtQOYl81q6IF/ntMq2MOCOLzCHHY2sKQH
	9uBRqkru2a2TFRy3ky9qcABzQSro+iNnGwMTTArD4Jp9NmyUekEk6bmAT7PVdb36
	rYfkYJS3kMVLmSjGjHT7wTy0Vt7fZi2vJ/Xz6Ne0A==
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
To: jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com
Cc: harshvardhan.j.jha@oracle.com, xen-devel@lists.xenproject.org,
        iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
        stable@vger.kernel.org
Subject: [PATCH 5.15.y v2 0/1] Manual Backport of 099606a7b2d5 to 5.15
Date: Thu, 17 Apr 2025 22:47:25 -0700
Message-ID: <20250418054726.2442674-1-harshvardhan.j.jha@oracle.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180041
X-Proofpoint-GUID: Mg-v3doRh43UKoQ1jKtAblkZyhHc9mAO
X-Proofpoint-ORIG-GUID: Mg-v3doRh43UKoQ1jKtAblkZyhHc9mAO

The patch 099606a7b2d5 didn't cleanly apply to 5.15 due to the
significant difference in codebases.

I've tried to manually bring it back to 5.15 via some minor conflict
resolution but also invoking the newly introduced API using inverted
logic as the conditional statements present in 5.15 are the opposite of
those in 6.1 xen/swiotlib.

Harshvardhan Jha (1):
  xen/swiotlb: relax alignment requirements

 drivers/xen/swiotlb-xen.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.47.1



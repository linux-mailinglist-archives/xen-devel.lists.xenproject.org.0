Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE13ACAD3E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003240.1382749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Pr-0006FV-E8; Mon, 02 Jun 2025 11:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003240.1382749; Mon, 02 Jun 2025 11:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Pr-0006DC-93; Mon, 02 Jun 2025 11:33:19 +0000
Received: by outflank-mailman (input) for mailman id 1003240;
 Mon, 02 Jun 2025 11:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkTG=YR=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1uM3Pp-0006CN-F9
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:33:17 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eda54ee-3fa5-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 13:33:15 +0200 (CEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525uF3Y004998;
 Mon, 2 Jun 2025 11:33:09 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ysnctcna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Jun 2025 11:33:09 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5529ZsOr039135; Mon, 2 Jun 2025 11:33:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 46yr77vhux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Jun 2025 11:33:02 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 552BWuca001684;
 Mon, 2 Jun 2025 11:33:01 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 46yr77vhuf-1; Mon, 02 Jun 2025 11:33:01 +0000
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
X-Inumbo-ID: 5eda54ee-3fa5-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=CfDjhvQigRmWcz+CuhlX6AvZKsSV2
	OiOmpQmK2j9khE=; b=abk8xrq3xSmGyzaxVFHwBna5bmg5JiX6X9pHDoDNY4xwv
	5dvXdaucHCmels5qSn3JScEk4Ra5L6aAIuxljx2+hAqm6SVRlbeZhLol3N8+DXBn
	whuC8TofbjV0U8NUx2capxZuC3xRACg/F8adHKPdsFmm8xrts9mxvg+J66bw+N90
	cp2P/f+F2aeFlZ0Jtxi1JwM2GIIbniHzHEQx8C0nk71SElANlpKwIPb2C64Kyxs7
	jxT0cfiVIL/O58dHKAH3jRNqECAnHFG8m1uGwNbDBLZpgdmtlVy7L0rB50fNjWES
	n5SkMEBYS/EMndZ+8U6VjzMjiuIURNkYxpSLmeP3w==
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
To: jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com
Cc: harshvardhan.j.jha@oracle.com, xen-devel@lists.xenproject.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
Subject: [PATCH 5.10.y 0/1] Manual Backport of 099606a7b2d5 to 5.10
Date: Mon,  2 Jun 2025 04:33:00 -0700
Message-ID: <20250602113301.3475805-1-harshvardhan.j.jha@oracle.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506020099
X-Authority-Analysis: v=2.4 cv=Jdu8rVKV c=1 sm=1 tr=0 ts=683d8bf5 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=cixntLcyVTLVvfsobb8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEwMCBTYWx0ZWRfXyNIOyIVGfBrV ktK1V6Xu3f79srrd4w0S1bq7yGbLZgDZ3shoFa2l01puyzAxv6ParH9NBJtpHU6X+sTE/pvvDF+ WuUu4PvasOTDK9ZCxWkIbsfetzmDLj7F4jPgp5UdsjAIiaGAqLH5m0+5ViD6XLDcappv2I7292r
 iEcrsXOGkx9mAyJvB4zK8418JuMVUR6K75n0icDT4u2AAYfthTfYjRHhcCLcr1joYEjz0mK5AuM eb6UB1YRXxUdwxJ+tax/ZqjIUECNJBSX3+NG6X5BPpVBtIzCwf/1G/5cjJREtoG8Pg+CQ88OAwp bIkymP/ni2Yn/Avq9Sb0r/XhB905U4q7WQQkQJIHlbELKqC2S6KRBXZarM/8+XYcsrEUYw1TWa8
 gtD+nw4y0WsCSZJZaW5JABeXOJJ78061uHj/owALA5avyUG9p3kjnp9d4BdQuTCzzomDbVtn
X-Proofpoint-GUID: LWPjPIADqO7-S79GFkKNeZQ-FKaukyki
X-Proofpoint-ORIG-GUID: LWPjPIADqO7-S79GFkKNeZQ-FKaukyki

The patch 099606a7b2d5 didn't cleanly apply to 5.10 due to the
significant difference in codebases.

I've tried to manually bring it back to 5.10 via some minor conflict
resolution but also invoking the newly introduced API using inverted
logic as the conditionals present in 5.10 are the opposite of those in
6.1 xen/swiotlib.

Harshvardhan Jha (1):
  xen/swiotlb: relax alignment requirements

 drivers/xen/swiotlb-xen.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.47.1



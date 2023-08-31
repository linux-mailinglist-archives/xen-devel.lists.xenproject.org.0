Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D5C78E49B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593321.926308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWo5-0007ju-Km; Thu, 31 Aug 2023 01:49:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593321.926308; Thu, 31 Aug 2023 01:49:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWo5-0007hX-Hl; Thu, 31 Aug 2023 01:49:13 +0000
Received: by outflank-mailman (input) for mailman id 593321;
 Thu, 31 Aug 2023 01:49:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fRny=EQ=oracle.com=martin.petersen@srs-se1.protection.inumbo.net>)
 id 1qbWo4-0007hR-NT
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:49:12 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92dd5e22-47a0-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 03:49:09 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37V0EjDN012132; Thu, 31 Aug 2023 01:48:59 GMT
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sq9xt8sma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Aug 2023 01:48:58 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 37V0VnKT032764; Thu, 31 Aug 2023 01:48:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3sr6dqtxmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Aug 2023 01:48:58 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37V1mnKr000352;
 Thu, 31 Aug 2023 01:48:57 GMT
Received: from ca-mkp2.ca.oracle.com.com
 (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com
 [100.100.251.135])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3sr6dqtxfw-5; Thu, 31 Aug 2023 01:48:57 +0000
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
X-Inumbo-ID: 92dd5e22-47a0-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=IoJ55lmsCSiFbRgBXJ6sb7E1RfD5nkFY93UY3DR6jeo=;
 b=yUF/LTaCmn5a7K3jdw3honoUNKeo2AOzsEC/iBY2dkkrxAbHf1Yw8Rl/6M8nYgYK39Mx
 OYQCbJ4PKxo/NgJEnmMFR2z7WW9x8L81fQUhUMzDBpoOed5eZpdaMqASwqtUXJHLx3YR
 rav8TyINmOiemyBmMNPyjFT2AEIfCyu3shbuCEmWlbjr9QXgngrKZajFzqlTU/kR+HIT
 yp0qjH7ZANeDH5VPn8xjdrhifPjU15s49MQKJc/l5tjfqHC7O41KqbkcLD5+9W2gW9Yi
 L2f14wa7Gmrd8EgFbmUfj1rV95SEQBLJBVZDUEahIbHPHTeK1AT5Q93KGWTwY3TYMPEB lQ== 
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Juergen Gross <jgross@suse.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        xen-devel@lists.xenproject.org,
        Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] xen/scsifront: shost_priv() can never return NULL
Date: Wed, 30 Aug 2023 21:48:32 -0400
Message-Id: <169344360100.1293881.8692912884292085962.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822064817.27257-1-jgross@suse.com>
References: <20230822064817.27257-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-31_01,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=882 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308310014
X-Proofpoint-ORIG-GUID: zwa0klpZnT3pvexSHJKeq2TYYWeJVYWz
X-Proofpoint-GUID: zwa0klpZnT3pvexSHJKeq2TYYWeJVYWz

On Tue, 22 Aug 2023 08:48:17 +0200, Juergen Gross wrote:

> There is no need to check whether shost_priv() returns a non-NULL
> value, as the pointer returned is just an offset to the passed in
> parameter.
> 
> While at it replace an open coded shost_priv() instance.
> 
> 
> [...]

Applied to 6.6/scsi-queue, thanks!

[1/1] xen/scsifront: shost_priv() can never return NULL
      https://git.kernel.org/mkp/scsi/c/73c7881b5066

-- 
Martin K. Petersen	Oracle Linux Engineering


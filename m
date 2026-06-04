Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QNgKKf3yIWpSQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5C1643B07
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 23:49:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ford.com header.s=ppford header.b="X8w/KRXd";
	dkim=pass header.d=azureford.onmicrosoft.com header.s=selector2-azureford-onmicrosoft-com header.b=Wn5uclyO;
	dkim=pass header.d=saarlouis.ford.com header.s=ppserprodsaar header.b=fwiMuJKb;
	dkim=pass header.d=ford.com header.s=ppfserpocford header.b=pPdMzuvR;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=ford.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328592.1592987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwZ-0003CC-Rr; Thu, 04 Jun 2026 21:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328592.1592987; Thu, 04 Jun 2026 21:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVFwZ-00039M-Or; Thu, 04 Jun 2026 21:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1328592;
 Thu, 04 Jun 2026 21:49:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@ford.com>) id 1wVFwY-00039E-FU
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 21:49:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVFwX-002eHJ-SN
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:49:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2f1-bab6-0a2a0a5309dd-0a2a45088f06-2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:37 +0200
Received: from [148.163.146.23] (helo=mx0a-00498f03.pphosted.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <dmukhin@ford.com>)
 id 6a21f2ef-63b5-0a2a45080019-94a39217228e-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 23:49:37 +0200
Received: from pps.filterd (m0482516.ppops.net [127.0.0.1])
 by m0482516.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 654Iek5f982189
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 14:49:35 -0700
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013027.outbound.protection.outlook.com
 [40.93.201.27])
 by m0482516.ppops.net (PPS) with ESMTPS id 4ekeutsk5u-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 14:49:35 -0700 (PDT)
Received: from BY3PR03CA0023.namprd03.prod.outlook.com (2603:10b6:a03:39a::28)
 by DS0PR16MB6880.namprd16.prod.outlook.com (2603:10b6:8:314::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 21:49:32 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::12) by BY3PR03CA0023.outlook.office365.com
 (2603:10b6:a03:39a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 21:49:32 +0000
Received: from mx0a-00498f04.pphosted.com (205.220.161.53) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 21:49:31 +0000
Received: from pps.filterd (m0426317.ppops.net [127.0.0.1])
 by mx0a-00498f04.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 654LWUaA3759767
 for <xen-devel@lists.xenproject.org>; Thu, 4 Jun 2026 17:49:31 -0400
Received: from smtp-us.ser.proofpoint.com (pmta-usw.ser.proofpoint.com
 [34.209.42.160])
 by mx0a-00498f04.pphosted.com (PPS) with ESMTPS id 4egeyps42s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 17:49:31 -0400 (EDT)
Received: from localhost ([19.12.92.221]) by cmsmtp with ESMTPSA
 id VFwOw8LTGKoqdVFwPwHeAS; Thu, 04 Jun 2026 21:49:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppford; bh=Ems8YkBOb7rDG+KJX9Lw2brC6
	MfS9/quGLpPVAPPZDE=; b=X8w/KRXdD52eNBT+DYsRNTDWbOAXYc7wVWoa2hkan
	XJJrPgagNrlc3w9ntRNSq+yf8qNw6GvJ6/+EnUopY1qPx9gLQOAhfLv3wLKoTElg
	Cv7kHO0MHLTyAAwq0l3Knb2LUEfqyfeSiYyvtOSTYYxRZvFJ38zZah9xLfzegAEC
	NMwEMLKHSXzhZe30HHat/9P+8e5lBKu4HBe7ELOcs5trvYwchnX86czeP+5SuZwx
	KxMAQc3bVlv/UDRMoQ+KmJU9rBuu71BgNXLTjZE9/LTS7QGpsocGMt73fWlSHX8r
	sswByzDmJPzidNLXsF1RpJ90Nkfq+k+J5vjX+qLiEvY/A==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0A5Rx/6e+glO1Gq8Zv0hLp5YbppKth2qMB0VxfV5/XsVcX0eAf597ZcZnMsRJtVlD9WYByMuVXvjDaWBming1S+AE4o3A/w7A0gKWpKQj9npw6PPC4sUcKifnohgwLAsCLrnqBCCebEm0tDRafZt7/4nvY1T+sszaDNjx03dw6EtOf8ofUlQyBKSLDW4CJraF+bYxp68WBvfOE9R7nQaGsIrvuETRnx3IsfgfXfF8iO/O/S2X8kBXt5wLLtrMNQAtsr+4NzkIjcXIV7xPmCbl4NMltJCMzaYYP0V6UHBfDecQFcEk1vAOiDWSaqSHRDUtchSNTZ8zFNteq2Uxr1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ems8YkBOb7rDG+KJX9Lw2brC6MfS9/quGLpPVAPPZDE=;
 b=R2vYwAzDVIw2BVxyNDa2n0Dp8BojtcU6FOOg+BKf43CILmDCKyEebjLm3Il3B7OAYEiY3OOdS99KYHfzIpi6oYE1s4cMxRUaarAe2qKaNDNJyxBYeuQOBVnzaAvgXJVJto8o2Gik/L55ptadKbKRahqBQQJd87NbNHVhQ6pSLsKgXeoI/DPZ5by2+vC/ShWHgSTmvSbqt5Yk8JMNjRQlpBYSlr9dz/Ui4psEvMrGHWrMuFr1dessdcsSWyvxcCqyzE4iLrpMh/0CvAcH6YCqswRgmpsGRbPntBRT+4vyXlTfmQLvfV0cIsHeSm9/CB0K40aes2yMdkGTg9vTsuqOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 205.220.161.53) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=ford.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com; dkim=pass (signature was verified)
 header.d=ford.com; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=azureford.onmicrosoft.com; s=selector2-azureford-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ems8YkBOb7rDG+KJX9Lw2brC6MfS9/quGLpPVAPPZDE=;
 b=Wn5uclyO8wQGD5+IPP7XgBrZpVUGYl2oF1vW1CxdsSA5CxrNTOmZdYeVd0h7b5M6tDNF83kHxIhcWBzJXGaHdVuO/Pdyy4CchLDpe+M4hLJyDH4UpbfDgxbnIYUBAQoZ3o565j/hCWGaMBCJ34Qyet6hIEWoEW5Glm4C7vBftYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 205.220.161.53)
 smtp.mailfrom=ford.com; dkim=pass (signature was verified)
 header.d=saarlouis.ford.com;dkim=pass (signature was verified)
 header.d=ford.com;dmarc=pass action=none header.from=ford.com;
Received-SPF: Pass (protection.outlook.com: domain of ford.com designates
 205.220.161.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=205.220.161.53; helo=mx0a-00498f04.pphosted.com; pr=C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	saarlouis.ford.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to; s=ppserprodsaar; bh=Ems8YkB
	Ob7rDG+KJX9Lw2brC6MfS9/quGLpPVAPPZDE=; b=fwiMuJKb7noeMAQnCJv1YAX
	FNeC4jOhx+1Wwlz0zPEbeOj03TJDl+etAUhIeC6n6Zdf8PqrAHaJB0vJInKAnKpq
	rL69FB3C6xfMBiAIhdJOhLmM4LCFlkitDKMlEXSgOMeVjge28HitaPjfXU/4cSsx
	AYrbq6F8JCVZzjep47V09U64AGNd+hPcZOVrLJ0pXzE1FZztbfESxgZAEHsUtXT5
	YpOO1ULjlTAribAaAFwKpMgkM0wPtwYu5Ly3RMdmN19wlZrk6ViIfiULZIRMGNLH
	kf1gmjY6ygm7MeCqIz4eDwAcf/Ri1C69oAAs8PydqLbJGh5FUzhEhDFIzknjvyg=
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ford.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=ppfserpocford; bh=Ems8YkBOb7rDG+KJX9Lw2brC6MfS9/q
	uGLpPVAPPZDE=; b=pPdMzuvR0xJubWJVExLeFKuRN+kJbwbd3cQd0Kn56jMg3mB
	OCTy5toXGc9fhlpba8BGOHTADkFfjQSx8ZqWTSA5NZGKcogFGMD4AahtImSz2WKK
	PD2WwapmkGi9or7W0rnaS49ZARUImKkJiDZB+U6J/diggAB2ZVkshsVcJT0hAMwU
	3mIpkA4mrT6A6sc/42YgzDRCw5JNhu564a4Sw4d4Hmu1KN4efEQmC5P5Oije2+dd
	vfxVDY7aEBa4vYXHikISC6jmdk83ftLu7G3BVUMMu1blJS5BG9acfpgGE1G1l6yw
	ZJcZGv0H83QE+hVje08G8OWwn99r1ihjIL6+Hog==
X-Mailer: SER-76bead168636dc6ed1c9e51ce4dea80dbdd4163750742b614a4d871e565792b7
X-Cloudmark-MID: VFwOw8LTGKoqdVFwPwHeAS
X-Proofpoint-CID: eb09f7eb-2dc2-34ab-a188-7b293c1db1fe
From: dmukhin@ford.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
        julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
        sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v6 0/6] argo: few log fixes
Date: Thu,  4 Jun 2026 14:49:20 -0700
Message-ID: <20260604214926.1735194-1-dmukhin@ford.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
PSER-M365-App: SER-APP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040214
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|DS0PR16MB6880:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c59d0e5-c34d-43ec-e2a1-08dec28328fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|18002099003|11063799006|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	z9HpKL0qi8J4TPh6VXlrHmsaeQCytDWz2rJyBh/eQUnxHM+Ui7a4u12fcinhF0PXjuY2appoq3ABszfeutSoxxr5Bt2n03dT2QLB0ua/HYxKVegx0FVTcPLvJOE2Pn8fiihUO/JZp2iMFLHFO1j0ieV2y1AJkqDW+/12AEamUOMR+H20NWh2LvKW54T1bxQUjuexNmzCklSAGXokUqxlg5Nmawmzo+Wv3XYc6QMwCek2riuV6M4h5Xz/x/zmsPaU+i8+USzi+4GnZiBz6NSE2P0rH3Q8uhyvo6N7MUxrk9rG0PVGq6wSoksnGwh2ZSpwU+1hOAlslTHVt1CiSwi2FLu9SBDEZ7yC+L7g0ox+71oS5UZYHsB3mhZAzkESdswYSFkd1MsfLvK2kNXXoAEQWveL1h+ebjCWGCrlrw9qVK8UsVdsRv/7Uj+zO8ViKCJ+/GQZvYJ5jPFJfOC3KrLiiTxeFErXYslvQ8UL5OUXlV43+NtsMWxk7kyzl8xAcEXrs+IXS4I8ADxQwPeBdr4J/L29cvqS1vlBITNqf8fC9blsd1TdKXzXixkO3EqaiUsPkRlmkMIfQN1K9Tzx/YU5i5nLj6nVj5OUpVaz3l7j3DETz89XTvP4TtrDaGSpyBo8Kg9ysagCi4eLY32eg0iD2fe6BN4Qf2SWKHpt4uN1/yHzScPWBdpbCviKRiCHqz05XPvGEVxczyjr2KN23uIn30nviufwFMnpUZ6+MY5jBu9atNzDAGzXKu1Odg2K2LWQ
X-Forefront-Antispam-Report:
	CIP:205.220.161.53;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mx0a-00498f04.pphosted.com;PTR:mx0a-00498f04.pphosted.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6hER06fH78JZyutBvQN0nXb9VpPNzT/8K/mNU20rptxaL+pOS38yPBoXcx32Vvp1+bALBSwTousLI3aXRlDCWgZybDmBkqfS065uDZanKCVVyIsqAvyjwHBxuiH5t9uHmMDtw7nfsUEO8TA9GsE1+GyR3duFDZ66aaF8JLKavic8wQPr+hVFR2ISxcGf6DawdHxmkZtAfRsvN3NhDbfhOFcL5ajDe/j6qcpDOFKSWHtme2Y3TGOZ6wG77nEcvXwxR7dxucEgKUyVCaalirpeLBufOvJBTCcRGyigK1P6UufAe77e34vDqoaLe4PhtYoRijUF/2vILjeCOMff+II/YlLCte/Dlf1DSq3WAMwqqnqOnvlUTEF7kxLewkmUPXdbmyCiboCfzkPv1jMPbMB+tLGEHz+Lres0B9rB11UwQ6+CF6GT6thJNEdPgZQ0ERDq
X-Exchange-RoutingPolicyChecked:
	J3mGEiFs+VoNlc6BGpHXOKJHBSorOuZ1bVtWnIcHgM+NeW8jaX3aufSkgz4SyyT5T/5J6hGQoDNrmEIDjh/7Vs0sKKy70cyBSKvT5R3yxfCRIm0FTkdUUOSHRYN6A9GByndRBlrrTI/inFkzq3Nkfyiwi84ZdQESlhXMN90uKCt7iBP26Sdd0TiosGZ9xZxYLVAXT9MX4d7RnnrJJgd+G64edbUq+tyGrQrwlkamGPud5zOpzhYiIuat+UXSfoKEW2iCuJ41UyrwSPPyrlQF+7S1gLoNI0BZh3vH9/hbT0GaFOQTKVr+6ZGzJZP/bcYVD/mgkdZOT/h3jI4+Uzr82w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NkJSf+oqFktsl4x5P+VNulPPf9rF3AUyyJzYqamfBiGJwx1z5EuaXSK2EPcVk9NTPRYhYQ5aOrj0j/Lo1ipU5qpADXo/dW3PTuhoqF3lVZjk/t4Hw9X9/+qxcWqL8Ca6y4mamR0KJagMdp0IUFFLLBiE7uOmZfhyOzCKiO44YP5tW5u9GYJpCUIyh9eqQpljHx9ddPFRYrCuN9MoczoLlRI/qkw05npI1192yzt+gtWIpxzD5iaHfdqcqgJHjf3ciyZ/unmHJ2zM15LJHNhwFVjROLcMu6bxQnKD6D0Hj/r1A6PWO49d5N+LsJiYmJAPqbIqsnjD1a0WvJ74jHU4qkIpWImGkGfrAUAQSh9vw2ckP0BeSJtzJnXllaH9AA5TAyrnSZhL1ZFq9fNkm7X9iKcW/7CYRYCG69irE2EZM0cTQ6hBAw4W3DCXbCyLFT7FMnaDfL01MCOjyLiDdLAQRAyL/fH5vKuyJ8AtYkqJx3Bomx6H9/u0dpRgRnSCrIBojGq8sw6B//9JYuc9sRE8VzaylozwUO3abKSw1t22LB1IVl88digYYXG6QOXvIbhPNKWJ93A/ZvXpb6e2rqL/Ic2DYY+IP0gepbIbdfn3PTBQ3YlGv9z5rUEUwWHLqCMA
X-OriginatorOrg: ford.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 21:49:31.6865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c59d0e5-c34d-43ec-e2a1-08dec28328fc
X-MS-Exchange-CrossTenant-Id: c990bb7a-51f4-439b-bd36-9c07fb1041c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c990bb7a-51f4-439b-bd36-9c07fb1041c0;Ip=[205.220.161.53];Helo=[mx0a-00498f04.pphosted.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR16MB6880
X-Proofpoint-GUID: A_5c0uFKPLzH8V7HMePosDfL34J9Syzf
X-Authority-Analysis: v=2.4 cv=ffKdDUQF c=1 sm=1 tr=0 ts=6a21f2ef cx=c_pps
 a=WwHAhc24fKszT02xmrP0gg==:117 a=lOEMawUel/sSvQipkIvNbg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=3PXLN80vpJUA:10
 a=6NUGLSImWEsA:10 a=w9pew1qAHqMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P_n1zlmtWsCQbjROFjcg:22 a=NvsXeTrgx-CJMFV-xl94:22 a=p0WdMEafAAAA:8
 a=VwQbUJbxAAAA:8 a=cbNQJ9GKAAAA:8 a=9Rjklcs_zL7GqLz8L0MA:9
 a=P0bj-C3X3jJDpopQwM1U:22
X-Proofpoint-ORIG-GUID: A_5c0uFKPLzH8V7HMePosDfL34J9Syzf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDIxNCBTYWx0ZWRfX/0qpl3X6dXyP
 iu1sdUF0kuHd/tHwKy7ZvWAcXweQMW2ZRXuoyKnScBTpdJynRB4e6kDvyQbhjj6Oo8yrkbm2dY/
 bGjggQslQGBNIzWtk+w91I1MsJDTinJsQV2MlJOtr6srahMU752ObR0cR5OXKywd9mTlNfUMUx+
 Y9HlFO92oi9BNFHFy8ytHa2NSKUfM0VvtssImn6OWkJZ55Bl72FJ8VhUr+4NMtC8OU1aIiwmVeQ
 EAyjYMPo2ptaPCKp6+UddMHiexlcmJVNoGsKzCUahqyFf4LQ+glAF41KqCxBpKaU8qSogwBm76f
 ah8H84+6QrQzQG48QRI8TqSYwAuIRWn9tpXSzzujR61ckdOPgUBccedEWY5XUZeGPwQ0XN2Knbg
 su4j181VpupADSpxb/vQhy2CYlIk/4076eAJLnqKjhjkO01YBPVVXhecKNO9GsVtwfBZfpDRY35
 23l1oG2PJUvsZ2bTOGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040214
X-purgate-ID: tlsNG-c1860d/1780609777-BDB6CDB1-23ED163F/0/0
X-purgate-type: clean
X-purgate-size: 1185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ford.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[ford.com:s=ppford,azureford.onmicrosoft.com:s=selector2-azureford-onmicrosoft-com,saarlouis.ford.com:s=ppserprodsaar,ford.com:s=ppfserpocford];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[ford.com:+,azureford.onmicrosoft.com:+,saarlouis.ford.com:+];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[dmukhin@ford.com,xen-devel-bounces@lists.xenproject.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA5C1643B07

This series corrects Argo module tracing.

Patch 1 lowers the verbosity of a spammy log message.
Patch 2 corrects the debug logline.
Patch 3 cleans up existing loglines by dropping duplicate prefixes.
Patch 4 re-wires argo_dprintk() to gprintk() to include mode debugging
        context.
Patch 5 adds new Kconfig for short-circuiting extra verbose Argo traces.
Patch 6 enables extra verbose Argo traces in CI for ease of catching
        potential issues.

CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines/2577682899
Link to v5: https://lore.kernel.org/xen-devel/20260603194131.1468654-1-dmukhin@ford.com/

Denis Mukhin (6):
  argo: lower level of noisy connection-refused log
  argo: correct logline in ring_unmap()
  argo: drop argo prefix from argo_dprintk() calls
  argo: fixup argo_dprintk()
  argo: introduce CONFIG_ARGO_DEBUG
  automation: enable Argo debugging in CI

 automation/gitlab-ci/analyze.yaml |  2 ++
 automation/gitlab-ci/build.yaml   |  1 +
 xen/common/Kconfig                |  6 ++++++
 xen/common/argo.c                 | 22 ++++++++++------------
 4 files changed, 19 insertions(+), 12 deletions(-)

-- 
2.54.0



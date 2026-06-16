Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y6gVCqWuMGrAWAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 04:02:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B4B68B5FB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 04:02:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b=mR8FO6LS;
	dkim=pass header.d=oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b=B5F5caGi;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338640.1599678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZJ6r-0006bw-Lc; Tue, 16 Jun 2026 02:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338640.1599678; Tue, 16 Jun 2026 02:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZJ6r-0006ZD-EB; Tue, 16 Jun 2026 02:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1338640;
 Tue, 16 Jun 2026 02:01:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <martin.petersen@oracle.com>) id 1wZJ6p-0006Yn-W9
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 02:01:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZJ6o-002ZpC-O3
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 04:00:58 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <martin.petersen@oracle.com>)
 id 6a30ae3d-5cb7-0a2a0a5109dd-0a2a4505919a-48
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 04:00:58 +0200
Received: from [205.220.165.32] (helo=mx0a-00069f02.pphosted.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <martin.petersen@oracle.com>)
 id 6a30ae58-aaa8-0a2a45050019-cddca520a796-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 04:00:58 +0200
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65FJNwYv1382432; Tue, 16 Jun 2026 02:00:50 GMT
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1ay3n7n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2026 02:00:50 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7)
 with ESMTP id 65G1r5b9007099; Tue, 16 Jun 2026 02:00:50 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11013030.outbound.protection.outlook.com
 [40.93.196.30])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4etq66v2qp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2026 02:00:50 +0000 (GMT)
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CH0PR10MB4873.namprd10.prod.outlook.com (2603:10b6:610:c7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 02:00:47 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::e525:dd71:b002:6ad5%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 02:00:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=aFn316IGv+KL1guyUZ
	eCfFJv1oXasbSyu8/9/CADhq8=; b=mR8FO6LSTY7Sb2xQUkFUsLocLf63A5pTJ/
	AEpSqbekWrZWfSj+CJG3vm1QGUdK5dp/Ur/X+VmIJnBaRX8Di89gk+QbCoeXCPOv
	EFD4+bSl6NjveH5rTIze0k+Q1lEz58y9UlBQYSXqNvKpn5Kdy63OzuiY0/LhzY5j
	GzM+k10X9DiQa9SMBRxSugup+hOIl2D3evMWe+Xg/mkqdgLcWUsnYzgiibq5+3F1
	2qJUsoq//kfmS+J3VS7BGQ/JrCBUZZ6+naPoW1yYxXSrDRda8xlavtgMWB5Z5TUk
	J3r/nWdUXWWi+U5Xd0vm/HkujyFH6aVVnHkuvTKte9blN7gj4MYA==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RK6sV9HM5u0EuwtyAnWF8Y3fLAlgB1eAXBFeIxvI10DDR+rzwWDYAgNrpSkrYjQMlSiQi+obVyEtvbnr+5P6iSV10N6pWgLKSyGD7l8lSHmn9iRLMQ6VDxM1P/V66tOLDK2aWmxuqNPSOcMFXH//bAFdnb/WbOfkCU86tA64/lW/MhfYho3SvHicEUt5fJIRX/hPL43P03DgLhTrS+Qq5E9htEddNlVNq0yiKoUQXvhzKoN7VeIwR6l0MXzKgG9HmjBQpc3ESkFJDsquGFL7oQzfOHU9EQt0hyNNUko6iEZJAhEtJfAzyIhpBa/7sYNKR7zUrdnRZAWUqWvr7p/6Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFn316IGv+KL1guyUZeCfFJv1oXasbSyu8/9/CADhq8=;
 b=u6GZgxDnhvF3f3bQjn4bU1z8fNtK7yiFrtrp6lMwTgOOeo4yHkJcNUpOvzVeb8uJfLR2WOFt2QJcCwhAO2qRdyN86fTIM4nleova7HPLl8eU9/3xXxFAXiDIJVCt0wVeoDm86Vnf1VtD98MvBXkXZMyEm9s+S2wrvhtS4AeTPSIVgmNeHS4UdOVyysg4vvwNMLthzUB2hsSej6tRGFw0vH+yQ0zes5Svxm7/qqkrVc7BbtAvnoD2Yill9ZfCPKdam3OOy5LCbP1lITP7FSAzxMITYywHGqBHHODDNFy4GDmDKPhgYh/tsukzQAsn+F2r8WfvRUjLscRohLD+ZSHtoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFn316IGv+KL1guyUZeCfFJv1oXasbSyu8/9/CADhq8=;
 b=B5F5caGi7s9oMhRe0aYQaXUNCOjNup/fjh1FnWHw5oq9AW683xwFlyvpRThCwNGCYDIGRJfBxKUJsvSuV0BkL75yebaEGeapY8SF6LvhkOpdqP9WSlcZulKmeClOgtUKSgjFInt9Yn5Ky4GGSA5p7tmgrAnPJQAVhI8XWkCcMyk=
To: Michael Bommarito <michael.bommarito@gmail.com>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini
 <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>,
        xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
        stable@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] xen/scsiback: fix command-tag handling on
 pre-completion error paths
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20260611123046.2323342-1-michael.bommarito@gmail.com> (Michael
	Bommarito's message of "Thu, 11 Jun 2026 08:30:44 -0400")
Organization: Oracle
Message-ID: <yq1cxxrutvh.fsf@ca-mkp.ca.oracle.com>
References: <20260611123046.2323342-1-michael.bommarito@gmail.com>
Date: Mon, 15 Jun 2026 22:00:45 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::29) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CH0PR10MB4873:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cfa179-7675-404b-b5ff-08decb4b1510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zDtLDCZDF+wp+XYVfwaegJj3EiWZRBhkXGeJRxDDIcIpUclN3pQlmq9pNhi3wkDeixXhqq2oR1ZhIf+VxZlAnPG+FAsiCfRts+8rsqBLuTJdwR2xRfL1Ftz7qL41cg4RqWxxMqQeasCBWrTTvVuvxuXCGSobqwWYQZO/DOXJ0D7aXcgEOtWFy3jOQ/HlJoH2Jo4AhU44Yagu8GKLq8o5F3c6JS2lsX4GSntxpN+jdhDJEBLvbjqX24zpLrMNt+Oo1upKhyZ9jGinXibsioUwhR7qRTk4TQza1Wja3RGh/FBb+NSIEPuekZ0ARRyDAIrihClFNkM4brqF9swdF97V8YVCchEuxI8VIFK/xfT1BliqN7xsV4U2NiZ97DKMOLSuRqjz1wtG42P/QHSkKbG0PtMctwgjMp0iaTQQM6QnWib2w9pPaQPoVDWSObv4irVNTmz0HHHlpnw4dFLBPar0yT1o4+A0nK7OkaanByyO/qCXG9k5A3j4xd61im5gcq8N6p0tYaSPC/n4wjjvRyGyvhaIOJKpje2H7uer5egsQbY6l3uCJ+zpY6Pv9Ez2p8fx4Dc7UKdL8UJwsnpjX1xL2vANEXtrwPdMiMh7q+FLLqtjsIenaOsIo4xIBAKEme7L4RNHo/QfgQyEQTNadG8zw+LLAxKQhp3sVPPzonvUe19p4Z/xiYlm70bROJqRM4Jb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AFAKbgEr5bkjd5AkoetxQClQ3F9/UkkwnSq9bjXQwzJJB9ka3lG1b8oFjb4g?=
 =?us-ascii?Q?ZJ9ECwhEJEEE7XNiQHx+G+vX9Z5YQHUqmKqkT2ivCWN8dQBzq1GxMOUHalsv?=
 =?us-ascii?Q?Q+P5RzrZ5J1a4SrSEVn/maca0bbh2XkyoE9g65rdSt+EB2edCc16t/n675K6?=
 =?us-ascii?Q?2yoDK7OXkI9DSBPKXUv572mwAjGgwrQfRMw+MNHX6S9qgZOJaSx3vt6vRy0p?=
 =?us-ascii?Q?QVum4PLgFcKkcAAglMiXiB4KfR0oLBaH8HDW151foR68yGxEtjQLrmyAFflS?=
 =?us-ascii?Q?mRJzGyHX5OMK98GB2MOy+SCHXC5riaUWtbdLlXmzizBWOD3+e6seC7Lc8H64?=
 =?us-ascii?Q?vcSlaem/ZhdhyEMg8HMeOnsOMREevVkfUTPVkynRuUOShkKdtDtrY1DJmCrf?=
 =?us-ascii?Q?/Oop3V9a/zEOA9ApC7oKwG3aa+bntt2dCBsWq59BzV1JysyFYUHYwQ46OYcU?=
 =?us-ascii?Q?5rbaTcCJCWxfFBuBSWjkAdKcDFUUxkYSOZY6VZZ1TnDrjSZ/kXjyjcxt9qBs?=
 =?us-ascii?Q?H7C3Mr+BDVJhFF/NkkOqHYalv4NL+AupZd6i3Ys7zFh7JsA5R4M6oTkBn6By?=
 =?us-ascii?Q?VKFAJZzBHMS2Wd8LfeNHE3U2A2Ku2tD9IkYhO0J2qEKw+Ci0wk7PiYc3SDt3?=
 =?us-ascii?Q?V0jUfcGycN7PHOiDz5dHvslQcwd+Ww5vyNDiUne/mzxvNYBlTICtrmyZu6eI?=
 =?us-ascii?Q?BF48XBaiynUrzGejhCShxdyJneyaNd+QRmhQcNzHzZuJUVskCVMlauoNT2zE?=
 =?us-ascii?Q?g1d+aUU/agvbGAOe/F3550813C/+C+EsPb5tCx/tUXswnSPKqIRjvlykwAKG?=
 =?us-ascii?Q?EhHLsdbPPUlHHOigobi0j5/RI6o1AVj5qcHA1bUMbRtA6sjFVbkJnTbhdJ0L?=
 =?us-ascii?Q?I1fvWtGYw/FGG6um+H3nCcpnrABTAZcS3l9uN5vD27/+q21dgf6spOk2Tm3+?=
 =?us-ascii?Q?tpVE2jO0m4FW5NmCYJVb46esnwPek8Fc2McdpyI04sOOp8TFJLkpJ1LziJn8?=
 =?us-ascii?Q?uO/GlOP4KkwZBBz9k9Dwrz3WHQ+wxx19L/gCLXnNDn0E5cZQp3dLQJ9O0J3c?=
 =?us-ascii?Q?1TISqd5wKPkyLRzFiFTfgZvlPnv4lTnU8APQ0U1X2hZWAfksKyhfYBMi5l38?=
 =?us-ascii?Q?d84QQFZr/vf0+d65wskpiyXL76nnMus16eXaLpW0bQQDpUZiXD9STyS4wSKU?=
 =?us-ascii?Q?PZ+SFZ+vAPmxWJVcF3q5ZI1Um+a6C2KIUOpv55MU7X3aHS5HfCcjMGEHHurm?=
 =?us-ascii?Q?eFhODCqyYzVQr2zYaKFGXuMs+6rSNG23fSiu3+b6WCCTMEyMtpDCLstn4Pus?=
 =?us-ascii?Q?vxnagENl8nAc/dls+5sxjG87js2/cRBgpXjhfepXZ2vUlFsojJZIyCuLpENx?=
 =?us-ascii?Q?39NQWuF4PtfUj6KW9VMQsrXdJrKojEy7vegDOdt10M+6CLPDBiZfh/cCDmXn?=
 =?us-ascii?Q?jwmF6jfzHfapLYnA5SYc5H7mSc6hnZkIv8oCn6hVinSeB/IMzhWvAAyjOA1h?=
 =?us-ascii?Q?pQX5Ue+6EIS26iW5Ustsq2J/sLd/D3P7G/R15s4nl1aUfw7tAMb9KLjyy/+r?=
 =?us-ascii?Q?ODqbBnybxaQquvTMoWDlmVI1yFr8s/x8i/oMGyy2AGuVTdEJUgZ3xo+AUXsd?=
 =?us-ascii?Q?mWr7BDc/yElmbpZQlNZebSYz9ZJp+TzcurfD+lelTnbtmRX9SXiR6hSDQAl6?=
 =?us-ascii?Q?2uJcR1mp8HQmdSU1vronYh9un4/Qk71mHbIBDOEANoI7q6xrFCW9pZDpyFKA?=
 =?us-ascii?Q?88giEutBWTbi84SFggAJJiaPiECLc8k=3D?=
X-Exchange-RoutingPolicyChecked:
	MnhQTp/M0+9aPBw8jr7Spwisw9QhfMGJuUkv7r0oN06Mb95EqG1VjUSUYn17OW2s4soqGkfwmJllKwu/gX5eXGjVwuv0Ypl07IcTBSumYQXa58QgkDdHxJh6z2zPzQB0Bko426D9wBfKy5WfOop7xdPsX1IjXN8LdPLshUYyamCjUU1w/I2CGXPyr0kiCbkUhzY5EXIedgKdod1FUvWTRIIrpR2FUtlGZB8QkkE+C6+NvBfc4ttTK9cc9fVICyCLsEvbVw+VwdOy0/kyWR0QVf4ExdJU4M0bFlLijsm2fWxevoi+XBSKC45fuljtBKN7qXTps9/8EjvYCZ3CLFsgTw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vwqAh3/Gw+pwne3r3oOF7iluqQC2AOr0EpONKaO2n27zlE+VywSV/RKq3KRJo/vk3O/QQuw5JbCPp0qtk+Q9qDhfPKzXB/ifP+JQaz+DHUg+kXTg2a3bxfmPBpgDT9Yo4vpPRvFrYKtt3A6ctoJxBK7xhT7+oj3Q9kR8nEjkwIyUJBaxBSHC1Bc5eiKBaOm8rQB3InVMBB0z80o1Fhb6+4A2tb4vVhEHJ2yAVNycU3jK/QkzQNqXNhHHGvX5oAJ4aJByagOTt2q/o+60Gb4WvcFklyKtd5w1HazxtyT6j9wK9sLKUWr973SJdw/wBSXFjRaFNtqQdJ6ephYQSllZtkrCZU2ek2std9oMh63VswNTMZr23Nv5Vk8uBOMI1P9ng2fTF/WSWOZ4LpTvw3qjGNA01J2LLykAL/0BMXqLDkY1icPcBfc6KjS6NpF8ErFJ8RYz5LLLma7uiI/jgQ/5Yo2Pt0byccxS4C+LZIIob7uwNKklZg9HY+pftWs0jPvAQfvRMPpcLeLzFQPn4SuFlbrWlYdSmE6aZtw8GjG0oGea6VbQHgGlrykw2KbCIkvf4shVy63zebat1JPfZVqVF2AEtdhc3rfC9H6Lj1HXxFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cfa179-7675-404b-b5ff-08decb4b1510
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 02:00:47.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQZzZwNJuxUoziDFdbq0d+1pKswMMjNneiXgQXoAQhbfdMUrpTErAxydQ2LNPNCTN58mwjlxlLNE4wwuZYEMKBT5b8jdKo5j6fYwWhv616A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4873
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606160016
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAxNiBTYWx0ZWRfX62aGZj6Ch/TG
 UtJdYzqnPfZ2ioKclwAcjOYJOAvtvO7HBqevtHll7E4O0J4+RslZYkEYLlOtcosn88e2KxmtMAQ
 onAorksnLPJahbY5nuJr8E5TGIjYk3SHGQeHCGMvyVFnCWEx3cyw
X-Proofpoint-GUID: Y_ZQnv_xGJZahWp83NTb00QZQ9hGbzh3
X-Proofpoint-ORIG-GUID: Y_ZQnv_xGJZahWp83NTb00QZQ9hGbzh3
X-Authority-Analysis: v=2.4 cv=PazPQChd c=1 sm=1 tr=0 ts=6a30ae52 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=cd8x-zEzMShnuW5xUh0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAxNiBTYWx0ZWRfX77R8zl3HawcM
 ok7Ijme2Eb7UinyJ9s8TJIJ8jJywOIyEZvLyK7LJEYP4nUYglnDtNi+xEoKghJ79seBxYzV+aLK
 n2lsQ8iTuxXNDLuKoWtrFSsMLXQm8bOxEpBkyuAQN4HXLRKKpfok+POrSgpK2kqCh1f9ODB1nbK
 IpTgNNpG1h9Y+TgJfy4UFnPsMaTmEnq5juRu9qvUKkHbsf6LU0vMZlBmJLn22z1tOPdxaVxI6W8
 pKehQymnIUzuMnYQ7JBuEisLJRqp2HMbcczj8XtBs+q5tfBLdbNcDykesBQyl/kEQyWVhT7NDcm
 tv6/HWPjqquWw7Ioo+28D4bralwoLT+XovLZtwgW3vOeCnECXjm4S1fKnagjD6O4T4Fa4e18aps
 Rys/KIzULNics/oTnOye6KP9PzTA3Xa93yaPFDK/LIItCQgR4GDVR3yBn8vvwv3GkpTIahlHNen
 zoXH5ePhrao2qGrAxBg==
X-purgate-ID: tlsNG-c201ff/1781575258-DB563443-5F2A0737/0/0
X-purgate-type: clean
X-purgate-size: 332
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.19 / 15.00];
	WHITELIST_DMARC(-7.00)[oracle.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[martin.petersen@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:xen-devel@lists.xenproject.org,m:linux-scsi@vger.kernel.org,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martin.petersen@oracle.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.onmicrosoft.com:dkim,ca-mkp.ca.oracle.com:mid,oracle.com:dkim,oracle.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75B4B68B5FB


Michael,

> scsiback_get_pend_req() hands a pvSCSI frontend request a session tag
> and a zeroed se_cmd. Two error paths that run before the command
> completes through the target core mishandle that command and leak (or,
> in one case, underflow) the tag.

Applied to 7.2/scsi-staging, thanks!

-- 
Martin K. Petersen


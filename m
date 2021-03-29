Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D75F34D978
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 23:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103265.197049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQzEN-0006QQ-Lv; Mon, 29 Mar 2021 21:15:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103265.197049; Mon, 29 Mar 2021 21:15:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQzEN-0006Q4-IV; Mon, 29 Mar 2021 21:15:27 +0000
Received: by outflank-mailman (input) for mailman id 103265;
 Mon, 29 Mar 2021 21:15:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmwh=I3=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1lQzEL-0006Pu-2o
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 21:15:25 +0000
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef4b350-952f-446f-ab28-0c01000a58c3;
 Mon, 29 Mar 2021 21:15:24 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TLFLIP160028;
 Mon, 29 Mar 2021 21:15:21 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37hwbncynw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:15:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12TLAX9R170068;
 Mon, 29 Mar 2021 21:15:20 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by userp3020.oracle.com with ESMTP id 37jefr9f6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Mar 2021 21:15:20 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4416.namprd10.prod.outlook.com (2603:10b6:a03:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 21:15:16 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 21:15:16 +0000
Received: from bostrovs-us.us.oracle.com (209.17.40.37) by
 MW4PR04CA0095.namprd04.prod.outlook.com (2603:10b6:303:83::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Mon, 29 Mar 2021 21:15:14 +0000
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
X-Inumbo-ID: 8ef4b350-952f-446f-ab28-0c01000a58c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=O+Eb95b8wJMI2NvNP5U2nCrXRJneKPvPebbBCQxucnY=;
 b=vl86/rWqRJH+PlUrcp0KaHhvkY97xflh1t+fTgptI9PwiMyyuLpiSvR9Z+kHPAAqOr8C
 T3/0KaDv0cSvt6C9MH+ekUniVGEyK10E1lmq1FcY6j7TS7cCSQiRVN9tJ1xcKE+5wqmK
 +3VEBZg1DRnbeAiO2FyPcQsCYsz07fl+cnJviqsd45evDxtPD0So/DpgTEjm1h444UAA
 X7rq5BrB677ovMjHh8ZdzVtkxkObHvccXZ0SXCFf5sjoaOX/iRjhE1zQBQFzYps4xDFq
 yaMWMX4SY0E0RFIar0auaezf/9HgpRdcuAn91B3vAE4PhWZETwR2mL7M752Bi6QlfbFX ng== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qxcu8ksJWCKhC/nMbcH1Kfcf/ahx2gO6n9zCel24IFcDgQIB7U/IyETFAjeQCbYDmah5VRWQXC/iC8X47OQXkKaIAl58KKcEg3/RkLMkom3dZQauu1yGXQtVdXxiYxPZ4AcPs9Dci3ncW9Nj2sCBkmwQ/n6NPU44H1Z0z2DLgcMx+cA4s1kRWVreR6m04eZKb0Q30Iy0SISJGPmI++DmqfLfampTxQcxPVhr/I1CnSHJgMg+pHmzbtxc+RRTqfD96pwm3FY1K1z4Xfz2QAwNQVYRsYMYSDUO4grPZ0qwHlyDJZdNPW+7/aE2Gc+wsf/WignJafyJ8bS/C/E+BaX2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+Eb95b8wJMI2NvNP5U2nCrXRJneKPvPebbBCQxucnY=;
 b=YHk9U7OCL+3JUYzhz1q08udMpnmfdulQHVJOKZ3GqaonXoxaC691V2uYEdNY82lAWYTFTyTNMZ4SFKI1rpDHP/5bKt1dlyrfxdsmtTY9sUDCplcmXXkTfSnIYJfuax5eknQiVbssvyB/zcJjle+XtmoP7Wiet7ktdUeeT6gj7+8+eEd7cAYK9r1XbCQdRCrbDhGZm0zGPVXy5q5+od5RqbjL11K2Nx0Tkgfx+Ye3OUKrjr3EvEt9xINqs6j2qVMk7+PgRl3neD2wpciN2vvEtZKzrZKoMum4J/1IFWY5q20WoOlW0ZYilfQJeTuJ+Y43UBWHqLhSCcy218TTChcftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+Eb95b8wJMI2NvNP5U2nCrXRJneKPvPebbBCQxucnY=;
 b=GqsQEdBnJhMAmTfAQ/aozzUAzjh6EfFKOsiSev75P4kyG6BXDQLUNcynNTQ9L2reSEylDqtIWYaruHBijwWOMSI2rLJNMKsHN5z2aDSjq74sLe5drTPeVDNcM01R3WdD3ZTv52/6BSSVfGzTdt/20jIui/SuET1fvCSrCBmqPe4=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        wl@xen.org, boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com,
        iwj@xenproject.org
Subject: [PATCH v3 0/2] Performance regression due to XSA-336
Date: Mon, 29 Mar 2021 17:15:00 -0400
Message-Id: <1617052502-14181-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [209.17.40.37]
X-ClientProxiedBy: MW4PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:303:83::10) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb6a28a8-851d-4f50-6c5a-08d8f2f7bf9f
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB4416D2E6F56489ED6272F8DC8A7E9@SJ0PR10MB4416.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RFDr5jwo80Z+zuXci4GIttyZEmHE89ETC/CwfihEi4R+99SO1ReKpPJ1HrCM5YD+HHl+ObGWm1x52aoDZyhPBDJvRYnwIk1fLyqoePRLpz2DXxpZ6kzcGKfzQZ9a1vP6PeYgQre7jxU1GZdRctBxM/1hAonNtUYOXKozFj/0zs9Va9kmSZpMGUjDWZrg3ND0ebIpLdQeFTOgj0z1SASdKATqEW2RfwHMhazHNYX7Lk/jTx78mANCZGNwR5Mc0R7m0TyXwt0x026HTQ/0/EQM6D6bjZTWMDuYy43wORsGBogSyVUljBENADcP/kx7k7rmC6Q8Crc90A1htbuVSqPxm1xPlRMx60OZOo+w3Pa7m38VK0uLeqKWuxGwvl3UOgilY1Jxo824OAcg5Cx0ozxE2fowThkqMEecVSx+lz/Vg7fohbFlHMDMDAHGXfRDOVBplpgKbYDypXhBZR1h/bthjyIoinS+0/hnWLILqPbuPRqdfl1j7dowSMLTF6eCNalYcLbcd5L4ojYit23WG8+sAE0Q9fiSaHhDRTDhFhOj7d6FLwr0P4vb0vMWlICvEc2kEE0Jsl5S1mQCGX0qaY5LDUnEvezmUVs2CBShQfMK8BACZbFkGsNkk9oUVfeY00tG2evmgQEyia55H9/V7lCf4rB92o9C3ONEi2eXMvaEO2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(316002)(5660300002)(36756003)(6916009)(8936002)(6666004)(83380400001)(2906002)(16526019)(186003)(44832011)(2616005)(38100700001)(4326008)(66946007)(478600001)(6486002)(7696005)(52116002)(8676002)(956004)(26005)(66556008)(4744005)(66476007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UXhYbkU2c3EzVnc1TVJ2TENvcUxndG9HYzQzRno0SklJUnBiWEkxWWtBcEFr?=
 =?utf-8?B?eGdrZHQ3U2Fmb2pFYnFFU1h0QWtCdHFiMnF3cUJMRVdjZ2lCajltTlJET1NV?=
 =?utf-8?B?bHhiRmZuaFFmT1QyNUFlVEZnUzdDZFFrd1YxZHlLZ1F1elRxZzZZZjIyWmds?=
 =?utf-8?B?SVJtTk0rNlk2VmxBTmUvbmZ2c0pLd0s5R0NETGxGbVV4M1IrY2ZtNWExSmlO?=
 =?utf-8?B?YlEwa1Z5c1VFMWdzQ3p0T2Z0MzNnQUVjbzdMZGZIMThQSWdtVjJ6TmJESmV4?=
 =?utf-8?B?bVVpZXZUUmlNSDhpMVZHSm04OTJFZ3Q4MXhHZWpxaEk1emF6eEp0T2U5ZFRD?=
 =?utf-8?B?cm1UOG1nV2Q3RHJ3UEVBRWlKTGlMWjlJa3pnZy9lSXgzZnRITnRtaldDb3d6?=
 =?utf-8?B?VHZuVFhwOVNUODNEMkswaDRENUY2MGRsOVhDbVlhQkJXeTg3ekVDZXpKREFO?=
 =?utf-8?B?ZmRqTDJ2V1dnSnJVQVljUVU3Rk9oRWdINTV4a1dzbHVzN1Yva3hzaDJUeEg2?=
 =?utf-8?B?RTRqUXB6QTdJRHZ0ZzhTYTRJY1Q5MVpSc3FNNjBERUplMHhVR0tKUEtrUFJP?=
 =?utf-8?B?a05tbWt2L01KNHR6UzhKQ2hCVEpJZkdKOTJaMVY2OW5GSThhMmlSZVUxNXVn?=
 =?utf-8?B?a0Y5QWlVSG9RNWpSZnBGNzdWc2JtNmhSaVpDWjB5bGJqV2hwcEd2ekhJSXpx?=
 =?utf-8?B?OFBvK1NOWEdNa2VkZ1ovOTFzVmlGYzNQU0V0KzNjakdyaVlPUllUOWJZV3V4?=
 =?utf-8?B?aTNUOTBGNjFyTVR4aTZDRWsrQytWc2w5Y2lmZllqNG5QUTZiZFRmWm5BbDZV?=
 =?utf-8?B?UkQ5cHVvcXppa0cydzhKa2RrTDBUZGgyUHgyeTBFWXA5RVoycFl4VVpCcS9U?=
 =?utf-8?B?RmdXRmxET1JjODAyV0ZuL0IvL3RzZkpYa0hkekEzaTdDZ2pSZG1mZXkwSXJr?=
 =?utf-8?B?WElRdkZ5N0ZySkg0UGZYMnJsbUFreDExd0tiVGtCUHIvU3dwbWs4czVRdkhZ?=
 =?utf-8?B?bkVKS0FqcWtDcjdTcUZKZXdBS09jcTNyKzZOQUdKQ29DZHcvaXZJVk5lYy9H?=
 =?utf-8?B?MkxIaWlibHFyNytUaERCMVQ2RFE1ZTRDb01vZEljeWIwMGQ4cEkrT3R5Q2hY?=
 =?utf-8?B?ZnZ1WFZxcTVUU2JybmFjS0gwMUk5L1pzMmFGelRKSXZwMVAyUTBkemJKMVBs?=
 =?utf-8?B?U2ZUdis4YzlmZHY2SVhBVmtFSDZhT1Rtb2taNzltV1BMcDEzSWwyekxONWFv?=
 =?utf-8?B?dHlTVmJ5ZHVacTZUK0YvRUpXa0orTDNnL0ZBZ0ZTWHNaRWcxZVdqVmlmV01O?=
 =?utf-8?B?SUx5OW93YXNqd3o0cEZtTGlwZFZzWnArYjBaZEpCUmM4RTdicHF5aVJwV2pH?=
 =?utf-8?B?NHhlTkpycnovRDBoUlBiNmNPZHBwRzVhTG1wb0cxTDNmeDN0alcvUlh2N3V5?=
 =?utf-8?B?dmhuNEx5ZUlyNVdEYzhpYzczZjdER2djWmVWM1ppSko5ci9GMm9MTUZIQkVI?=
 =?utf-8?B?OE83a3hYS0VtWG1VWGJaMWhBMDEycWZWcFJRWEI5UnU5VmdjSG5rL2hwb2dD?=
 =?utf-8?B?OHNFQUh2WWd1T1Y0U1lwZEQwM1NWdmhiQkNyMVNYbzVjY0EzS3lUbXdsYVQ3?=
 =?utf-8?B?UElRTUZOT0hFVWJwWjJiV0ozYnA0cFJWQjhrc1BIUzc1QUltbUNHZkdmb1B4?=
 =?utf-8?B?b0VValBTM0Qxd3ZkWjR0Z0MzK0tzdjlPcEpWKy9pdWg5KzRiVXdMbkpvOXRm?=
 =?utf-8?Q?H/Xh2PitLYvFvfeE+/b7+WJC0eZdoKdIrpf/FdP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6a28a8-851d-4f50-6c5a-08d8f2f7bf9f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 21:15:16.1983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXs8N4PWVga2ZUEpzz48aIJwm0Fa24fxlo8m3LqK8HahuE0koSkrdkVI+Ui4SZHW6LnyEHQy43hMfeh+KXc/hT3gQ0JEvOHeYMNVN/qTXVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4416
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=651
 adultscore=0 mlxscore=0 malwarescore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103290157
X-Proofpoint-GUID: SstBIfmmOUER55_kewQwhQ4XBovKK0e-
X-Proofpoint-ORIG-GUID: SstBIfmmOUER55_kewQwhQ4XBovKK0e-
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0 clxscore=1015
 phishscore=0 mlxscore=0 malwarescore=0 mlxlogscore=844 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103290157

The first patch addresses performance regression introduced by XSA-336 fixes.
This patch could be considered as a candidate for inclusion in 4.15.

The second patch is a minor cleanup and can safely wait until after 4.15.


Boris Ostrovsky (2):
  x86/vpt: Do not take pt_migrate rwlock in some cases
  x86/vpt: Simplify locking argument to write_{un}lock

 xen/arch/x86/hvm/vpt.c        | 48 +++++++++++++++++++++++++++++++++----------
 xen/include/asm-x86/hvm/vpt.h | 18 ++++++++++------
 2 files changed, 49 insertions(+), 17 deletions(-)

-- 
1.8.3.1



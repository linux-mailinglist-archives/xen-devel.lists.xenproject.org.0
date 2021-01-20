Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8692FDCB7
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 23:50:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71798.128868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MI6-00036F-TS; Wed, 20 Jan 2021 22:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71798.128868; Wed, 20 Jan 2021 22:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MI6-00035u-Q3; Wed, 20 Jan 2021 22:49:30 +0000
Received: by outflank-mailman (input) for mailman id 71798;
 Wed, 20 Jan 2021 22:49:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2v3=GX=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1l2MI5-00035p-Lw
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 22:49:29 +0000
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 696870e5-34b9-407b-a15e-73d3bb1014b2;
 Wed, 20 Jan 2021 22:49:27 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMhXXe133811;
 Wed, 20 Jan 2021 22:49:23 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3668qactca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10KMdirK148865;
 Wed, 20 Jan 2021 22:49:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by userp3030.oracle.com with ESMTP id 3668rdxwkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 22:49:22 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com (2603:10b6:806:f9::18)
 by SA2PR10MB4441.namprd10.prod.outlook.com (2603:10b6:806:11d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.14; Wed, 20 Jan
 2021 22:49:20 +0000
Received: from SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140]) by SA2PR10MB4572.namprd10.prod.outlook.com
 ([fe80::4c5b:9cf:616d:b140%6]) with mapi id 15.20.3784.011; Wed, 20 Jan 2021
 22:49:20 +0000
Received: from ovs104.us.oracle.com (209.17.40.41) by
 BYAPR03CA0002.namprd03.prod.outlook.com (2603:10b6:a02:a8::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 20 Jan 2021 22:49:18 +0000
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
X-Inumbo-ID: 696870e5-34b9-407b-a15e-73d3bb1014b2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=y6hgIzpmWFihpRvpiTwYRDgI6KEJ6O5ZlUXasnWJg1o=;
 b=ULmMd3oS2BhcdPhwdFbgt9nNvPNy9xf5I4pno33pFDpywdN3859FVS5Nj4+i3Vb6p2dB
 dvGP7m39hbjfA9IrkaEunN34XWNSaFMIEES0nqtgDta+PgZWv40Cj7c4E6+UDArUswc1
 yqKRrizCyGbSoRoGPgqXDlHCwE7kfNzlygQDwqEnRVHywcLevl4ymU/2oVcQQAAGmU/A
 pq9aghcmEpGYQQXAmqHitpQxHI+MZVbnKBlCTnzAdGc1Fpdoppkw9juDMgsJm5JNuVQl
 x5lOW2fqiD8TM90QUpyTYBnCltcK0UMwh55jzDjrSi0aXsODl3gmeCrSSHjTsOMiqhJ6 oQ== 
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXCP5PFGTC604egdmnHRyVS96IfEMakuCvEeW5a1sX3MIdFM9WOovpk5sEa/InfCmhM7p6Tf7MqvAzXrKRITXrJ8zZIBOgNF1iad2EYDW+gS12fU2OKtkmK6V6NhNlkSeAQIFNy5Ysdyu1pWSnKjzQZ8Wmp1QbvIVL3Me5jLtkJ0vEmEfjsbjv7MyGS9hZfnG5cECS+1iE8SEFHEvwvjkap2otd8bhrn1yT0WlfYRSUbK2VVn50FPZABTc1e69iOGPVYGkyZN3p51coz+2bNkb2R3t1T7VKF23Dvjh1bULMZaGKhvHbfFyLa5UDagtTm7MLw0Ir1f0I/lAZNAm7POw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6hgIzpmWFihpRvpiTwYRDgI6KEJ6O5ZlUXasnWJg1o=;
 b=koQZ8U3sn9qX3xWzyTsvEf0qVKBsRb9yOZDp/9EcEPXXoRDuNrYgY+KzIG/9XASUJxOCfNL/sCv+dBhfRTUEv5aOnVTpN4+VoAaehHcsSk5VFu9pNqiiZmuxOSYVmB9Ufqq9ulR7Hl0uB9P+YaJiW1Ln2qkKcG6aN4QfduvnAFwrPtnJAzDwbaDaKPKi2x0peomsc2++Vm6D9/fbkRR/qBw9SiyGmViEKCxuQkqnpM0bUJrn8IjNL3jHr+veV13VeqcCNa7a2y+XD+jUXuGmLPvPFhCKfdAuwJEgNkrwjmCQt0gQLbVQcbrVmgi8g5Vottcp+S9+ybU6F6FvkBCrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6hgIzpmWFihpRvpiTwYRDgI6KEJ6O5ZlUXasnWJg1o=;
 b=y1qgfsfdM2t8DPN2DFSPi0WER6TiCRfEte+oaV0yt5cezwdYn9/9cK2lMPZpRafrcaeIX/4SngNXBZUFeAQ0PSsz6trE2MrMxXZQx4EGPUSIcXQIjqHfojJ0Qmlb562g9quGwUfdDJJ5Q/A4OhjGGD1nuGrWk97NoBF9I2bQgko=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=oracle.com;
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
        jbeulich@suse.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
        jun.nakajima@intel.com, kevin.tian@intel.com,
        boris.ostrovsky@oracle.com
Subject: [PATCH v2 0/4] Permit fault-less access to non-emulated MSRs
Date: Wed, 20 Jan 2021 17:49:08 -0500
Message-Id: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [209.17.40.41]
X-ClientProxiedBy: BYAPR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::15) To SA2PR10MB4572.namprd10.prod.outlook.com
 (2603:10b6:806:f9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe5557d-a2f3-406d-0f4f-08d8bd959fd1
X-MS-TrafficTypeDiagnostic: SA2PR10MB4441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR10MB444168959D790FFFD1F7AE5B8AA20@SA2PR10MB4441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8zEI09WH9PTs7qHGPDykcWcPHioOt950xnJSGkwUeMEIZVPovnNNOvXy3OLX2ZgkMmk2+nV/qqzTcGuVx+r9PteY0ebuGbKiln9wIAcMwyQJHCScCmLf8jcskigjlM4HjKh9cUv5EWjlQvLTtxiMzM6T3CgBHy2BG5ipP6Mt8q7ZNEiL22AFmlxQuH9KWU6ZKGlxjlsFVzY4Ghq51sQ/a98xC+WXemf5YOc14l+FNbYLsg2b+r6kWGybfj/D60Jiccm8/ixhVOnDP0f7Yutl1D/uJ5cM3SyD7M25KsGVhJrSpa35k3ZbIlPmBPZzDvsgZzdu0NIsgsZG15OMF5kNCIqDMEO0/zRWH4LRARtDTc8MXIOuc3ws7GwvI4zLd2ubvhTSYcqmJ4TDVeFopSxL5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4572.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(136003)(396003)(39860400002)(376002)(316002)(2906002)(52116002)(5660300002)(26005)(4326008)(86362001)(66556008)(36756003)(7696005)(508600001)(186003)(44832011)(6916009)(2616005)(8936002)(66946007)(6666004)(16526019)(956004)(6486002)(107886003)(66476007)(83380400001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?C7+OJmhNj2RhwKH2RdjkTvGo3KXgFXHmk/wErDfGAiQGFamn8UkD5AReGzFq?=
 =?us-ascii?Q?EAN1DN2aeYPJi3MF93454iSj6TnvcuJ0FoDcZdGdJvndqG13F6o3SgOU79mA?=
 =?us-ascii?Q?1/jvRsZoXLx5EmM+Q7D9Oh84jghc9p8duLs9lo0vLlKrMj1rwcY1TwLf04UW?=
 =?us-ascii?Q?YDLwQbGvcnAHNHI9aw0ckIFpDL+WzzVklXVgtTM1Oqqrxvk6BpT2C72Uk+6Z?=
 =?us-ascii?Q?OLkIcH3nvv3FbxgAmsi+NZZ32xbCumsEfd8yHS2PrQyvdRdJdZTM2wZeNQEV?=
 =?us-ascii?Q?S1WRCIQMjAx4Z7BSeXi1fVOImBurRUh1a46w5dt4+dIsIU9zk47rEuOLHA+w?=
 =?us-ascii?Q?KITovuCsSMdP3iDDUNGWNGo0R4mWwLoHr+dMi/4gHndfO4LMqLNbVxW7s0ar?=
 =?us-ascii?Q?ybI6lp+kvSa4Z6I5aR0P2f/UAF43BeyP0pJZdcjyGj344wJVzt2T0z3Djx7r?=
 =?us-ascii?Q?HqZAyBC4aERLLccWiXycgDSMascWSVTWJeROquAHnGjEVcy5qeIVLT/OWyzc?=
 =?us-ascii?Q?v27lke82z6WGnE4hucHdljCAQXzZNx9y+vTrznGfAdGeMh9zDYB7vD7SCCAd?=
 =?us-ascii?Q?GC8qWJMCWqSziKVUFn3MsidZEmpwaLvkl8pz6fL5cVFgWSx5/hh9MCcLFeT3?=
 =?us-ascii?Q?s+i08q4IgVWbGxC7Dd/aMeF0+dxfgwkR5CNPDTpgxNgQd3pLb+jCuaBldHPV?=
 =?us-ascii?Q?xNZQsueICPmubblgy/Te994UuyxV0Iul9UI7Mjwe6IKpE4ypTUS6w06iw8H7?=
 =?us-ascii?Q?fkK5WSG/iPN4iouDwJWQUYOYxRqeGvMC9IH5ut4g1d7V3TXwzLeC9nXrN3iH?=
 =?us-ascii?Q?gTJBN8kl4J+0FWkCe8KU1rTDvy/NgfvKwJDaAtWAamlkYUxtMiahKHDr1Nkh?=
 =?us-ascii?Q?gB8exU5yab4lenbMNpHGwQuLWSaBLtqrE5GbMSFLfiRr8yVLO93+7GJQWNt0?=
 =?us-ascii?Q?skHURMH9IFfqFA2y8UYnrDWhjHaBPiPJBpZCHAH0xDMekoQheCt7rEWGMmRI?=
 =?us-ascii?Q?p7HgBJJjXkv9Ok8Sdj20mnp5oL6ST7N08HtnEWLQS0SKKHbzjpV/QbgOwPV0?=
 =?us-ascii?Q?taFHdx1d?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe5557d-a2f3-406d-0f4f-08d8bd959fd1
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4572.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 22:49:20.3483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmcBczNZG7GQLV3Yq4TK/oz463jgBEUVforDUhVAh6Trupc5KMn+SK2rUml0EOUQdTBrgSAaI2eg5pwEb32GXHy+mgas5nkFfefs4eHk8nY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4441
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101200130


Disallowing accesses to MSRs that are not explicitly handled (done by
commit 84e848fd7a16 ("x86/hvm: disallow access to unknown MSRs")) caused
regression for Solaris guests who access MSR_RAPL_POWER_UNIT assuming
it's always there.

We can add special handling for this and other RAPL registers (and that's
what should happen for pre-4.14 releases) but a more general solution is to
provide an option to allow accesses to unhandled registers to proceed.

The new option is "ignore_msrs" and it can take three values
    never:   Issue a warning to the log and #GP to the guest. This is default.
    silent:  MSR reads return 0, MSR writes are ignored. No warnings to the log.
    verbose: Similar to silent but a warning is written.

v2:
* pass ignore_msrs in msr_policy's value filed, not flags
* use 0x400002ff as unhandled MSR
* make sure MSR policy is only consulted for guest's MSR acceses


Boris Ostrovsky (4):
  xl: Add support for ignore_msrs option
  x86: Introduce MSR_UNHANDLED
  x86: Allow non-faulting accesses to non-emulated MSRs if policy
    permits this
  tools/libs: Apply MSR policy to a guest

 docs/man/xl.cfg.5.pod.in               |  20 +++++-
 tools/include/xenctrl.h                |   2 +
 tools/libs/guest/Makefile              |   1 +
 tools/libs/guest/xg_msrs_x86.c         | 110 +++++++++++++++++++++++++++++++++
 tools/libs/light/libxl_dom.c           |   5 +-
 tools/libs/light/libxl_internal.h      |   2 +
 tools/libs/light/libxl_types.idl       |   7 +++
 tools/libs/light/libxl_x86.c           |   7 +++
 tools/xl/xl_parse.c                    |   7 +++
 xen/arch/x86/hvm/svm/svm.c             |  10 ++-
 xen/arch/x86/hvm/vmx/vmx.c             |  10 ++-
 xen/arch/x86/msr.c                     |  32 +++++++++-
 xen/arch/x86/pv/emul-priv-op.c         |  10 +--
 xen/arch/x86/x86_emulate/x86_emulate.h |   6 ++
 xen/include/asm-x86/msr.h              |   3 +
 xen/include/xen/lib/x86/msr.h          |  17 ++++-
 xen/lib/x86/msr.c                      |   2 +
 17 files changed, 229 insertions(+), 22 deletions(-)
 create mode 100644 tools/libs/guest/xg_msrs_x86.c

-- 
1.8.3.1



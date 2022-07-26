Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E5B580E4E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 09:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375083.607390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGFOh-0001om-L6; Tue, 26 Jul 2022 07:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375083.607390; Tue, 26 Jul 2022 07:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGFOh-0001m5-Hc; Tue, 26 Jul 2022 07:54:31 +0000
Received: by outflank-mailman (input) for mailman id 375083;
 Tue, 26 Jul 2022 07:27:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yKM=X7=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1oGEyb-0006kf-1i
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 07:27:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 682b3060-0cb4-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 09:27:31 +0200 (CEST)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 CH2PR12MB4876.namprd12.prod.outlook.com (2603:10b6:610:67::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Tue, 26 Jul 2022 07:27:28 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec80:e3fd:e3e2:605d]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::ec80:e3fd:e3e2:605d%5]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 07:27:28 +0000
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
X-Inumbo-ID: 682b3060-0cb4-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTT0akrSmxMhMVNNIPxwAq2i+JWBVs9Dx4ziAPIzlqDomIKejSsHMs8DxPXiQNnYJWeJd31gfmUFHU6huCaEeDY5TK6eqoR8SC83/xrVAe19zZYtOj+5LRG9AIi4OqNdiye1WRBU7WdXgNmqCIjjjkUIsGJvI6ZyvV6zU3X9gYC23aOVYgcSoIux1+YaVXS+8d98matO/AjcSutrQviAoNkynGzUyfhfuv66oywjAzGApV1Tevgjc3XlT6uLrDf1VRQSitinJgg9tgtQ/Ls8Fn4hw63qbWO7/X0bEjttLDpPir484XRtP8OVS3dWlbMZHHAVGbpZb4v6X/05WX9sLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22UwUfqLHVun0WsIx7T3Dig1cCtbEOkI11uEVVytnBg=;
 b=ljRouiX+SN1SEX7RRbJPYGhlkaH2idVhX/90yu/LOgnrJIk56RqtgzNzuUhkYBqZF7lzEGq/kuuRfPWecVbKZq3cRS9huc6jqPRo0eSjFwcURwKP2HTH3yaYyxJRetiDNlQRomp/ETl280VlUJwkh5fOm6Onm3fjbKzs0KuK1Bk0lPd2VkcBvyoS2MbpEBHjDsgi4hanQPTG8gpHzAXbHWdCZlwuzUypwDkOwEbp2cLG4Z1FufrPoqyNR+zV24YTlRUYFqJvHx6koTrx4ns+HJPmLGgyuiDOnnOaIlLVFygPGc8kK53LcqUILM92Dw2BT7/oXxY8+MhbqAtrkqz5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22UwUfqLHVun0WsIx7T3Dig1cCtbEOkI11uEVVytnBg=;
 b=vn7IlPcrRPz7HmSHiFigAqKNsC3fzL2yQUeUk08KKvW+FQ5MLXGjWtI4fkSuQ+FZDS+MKGOtu8/uX+fA3J388kmKVN6ZHbIHzI9rvOP8aaZP41SU803yAaHHJNyOlcXu1hqvl81EzWSGvnHB93XjHRom+TrlzIjLNkFODZ6v+uU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 26 Jul 2022 15:27:07 +0800
From: Huang Rui <ray.huang@amd.com>
To: anthony.perard@citrix.com, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Cc: Trigger Huang <Trigger.Huang@amd.com>
Subject: Question to mem-path support at QEMU for Xen
Message-ID: <Yt+XS81vmsWoJA5y@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:3:17::27) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d6d8da-9007-4d0f-8b0b-08da6ed84b1b
X-MS-TrafficTypeDiagnostic: CH2PR12MB4876:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5HTpbED94Roz8ouAJpF5vu99VXvPWcgJirTwu8fSOuVqNgzGbloSC8iIFaToGUmouwAjxZQr+LVdfvulzQc7g4LKO70IDD+O8Snm62TeQa8jO1CgUaGj/ltpoJ05NTFTxWNVUZTC0eIF5eZGoAgUo3H7DnRWHP5aoUsbjWJ05AfKkmIsYuQZlwByqn5x1W2IMwDK8yHA3Kw7TGKPYmSfSt+Pbeu5xB8k3XA38SPanqtZh2wqu+H+4/vw6roMeZTajMfGgCbySYh+AEMb1oUpY9EMSJ6447uCNQjoe0DCnXHMinluEGnyJ2NgcYX3J3lPm/FBiyPP662TIvIYkCJg1mqiVnSYL+UF4ql9Z09jA57SgSNLmNYCt1Y9w/JjqiIZKVcXQRv5untl8SkskDiyfVbEeZ9bLOPyQqqrlv5PbsmtsNQsc3PieIkdJWgrkgiYSqdAphGXGOb6Y+hOTp5LIAocomg0Uc2UoE4/bj5bqV9uv6qXoouk7ZJwC9a9raUWL9bsa+vYV4Y2AGP+rdDdNaniBjW+ji1JTHvwIDCWNoBPjQJlMmXeiGna25qjczUZzoJ/CGoqjYholKWs0QF/YH+MIsBLEGn6339chnlqnk3geLwL93+MEf+jpXEsu4c+lQazrrrs9YlccXRi4K5puwvU7aIPbQrYB3adUEHwMhaQE1bhtjJn3Q3LjcYbO7qUNRaCLS9RD6C58sfuVdLOh3xFpT2DtBnQ6BLu17qfKz1THiTQrobn9g1pE00+pqh4wegIzeW1dIQOPn35SbESDYVgwnj5+REdFTqTF5tX7BM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(66556008)(66946007)(8676002)(66476007)(38100700002)(6486002)(4326008)(6512007)(478600001)(26005)(316002)(2906002)(41300700001)(86362001)(6666004)(6506007)(83380400001)(4744005)(8936002)(36756003)(2616005)(5660300002)(186003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/ZGtlzo7NQu79UfERErzBw0ueK0BGgF12+O4DYn3fCWlhyaxUxxMSd/hFbJl?=
 =?us-ascii?Q?wQxi+O0XWcN8bGq4RB9QlJYki/272puJAN/ti14tDNd1vodCnGDOBZnDYav6?=
 =?us-ascii?Q?L9PlsFE88eTaU03lS9iMRcbY9Y0IyLHqjoXJvMWfRo9n7tVRtIJd0ixBxj+m?=
 =?us-ascii?Q?RjTXqOp/lBwtKR06t1/6/3M2gEiJVCWDoyhYQdQJrGvJ61B6kVwprw8F6tuH?=
 =?us-ascii?Q?NmmY0R/OLuCEbCznaGrkx9oVYpSJI0VBICQB6Q6izJDPi47VfTB01KeV9Ntl?=
 =?us-ascii?Q?J/8drnHzgBwroXiD12wJUm855U3VyKErom/0LwCzwmV2A+1EU48rsE0X6CzR?=
 =?us-ascii?Q?NO69aQ9Hjlq4GW0UkUk2hloiIG1z07MFN6+vzc1TK1BR8DYfzQxuPYodnYc+?=
 =?us-ascii?Q?q4OzG331FZx6FbvkfakmC0Oz8pdEklDhEHWWy2zYLPKHn3COO8vAEBSCTEA8?=
 =?us-ascii?Q?EYOAvrfnCDoKDy7LHSUcnQrpPSSS9TuoM5mtnPwxQ/vcb64MCx1gWR3kMgej?=
 =?us-ascii?Q?L58qm6VpTwm0JEFYs91qQA2Wvc0Pw/APQhx2/4mxOlnc+bybb0k79yQqpJPZ?=
 =?us-ascii?Q?pAYLlw37Q54uCtLyt9TtxBEN223WrWrFjpAicjunDHGrQmYSOFpjitwxAhjR?=
 =?us-ascii?Q?adL4o835kqjPNIBgf1JkTUnVlm/5XWOeHsZWUEjU5r3PZxFuMW0f5HSJrXDP?=
 =?us-ascii?Q?7hD5thWw/fr9a7CDFpydwu/j/WAgqnAVhXpJ2wDHNdMftEqYoj6FG0TuiIbR?=
 =?us-ascii?Q?N1mG2EWTf8VTEAXwYqEkLMdsjfSAf6XBH4HpPIHDQseBfH858jU4zx8kFrPU?=
 =?us-ascii?Q?5S2MhTHWGcOAN2VpQxROMbaB04I4iJabfhwaimH+W5h2C89P73Ba2dHDDzjE?=
 =?us-ascii?Q?2RcPYs2FE16NP6Z2Nnc3BKi2lPxbbmy9dTkPy8ijeojKcIW2PVI0N/ATcJNe?=
 =?us-ascii?Q?BeMQNjeVXHsZYV37rUKGLi5vxpRFh0qo051hH5rx/EGuZuuyfAuP6E5nZJiZ?=
 =?us-ascii?Q?BCe2QcinUJPVBbkxiZparZ3XMcBkxR7MAliI0U7aEBJB2P7/RifWm7I280uW?=
 =?us-ascii?Q?9TB3nFEHnxAIUFwXr2KHm7D2jEEMeAFeLPoXAQDYI5kloCtRHfkZWyoLlnkJ?=
 =?us-ascii?Q?a3zSFgVn5LluEh0FfFtoRJ/3QOj402F7OKCGMIVUPwYYsDje/QcCSkxSIQrw?=
 =?us-ascii?Q?F6ALixn78QGU6gvgWsiGrpynyBM97I1pOW+NbdVex1uP94pIlY1hC/BtQ3LW?=
 =?us-ascii?Q?qWbcgw2czHYFKZ2tcfPzWPEWMUZxKiHZhTyzZF5VbjIlQBDVUWmYtlefmeNB?=
 =?us-ascii?Q?jBCKlB5/Xt6vK+mDMe4ivExBeKLwyaYYRq4UWYAyu/zmWWzIzRs/Se6TzyrV?=
 =?us-ascii?Q?9vbGlLjgs4Go/zm3BnNT+3B/aYl6w0SsbuDcmqkn2eD+/KawfPEBFnyxoi++?=
 =?us-ascii?Q?v1P1Xz5DiIUIC8gzM5jqnJJlBHjfL8cZLREXxmboEkVQNK3VZ5xTrwwwp5rh?=
 =?us-ascii?Q?myS0WnUSaJM4eHeFxEVUO8FmDw4W+YpuBTcCtWbi5I5BvBUr63vpdgqnL3Qi?=
 =?us-ascii?Q?cDPy+CL6ADg7Fytsb+eNHw6NM0juGvSnNIo9kDhb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d6d8da-9007-4d0f-8b0b-08da6ed84b1b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 07:27:27.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENv+5gf61BqVaY1rdExOwyOUAkRHY6kmNvTgwCQBZ+CHsIiYLW+MspTaVpx9BD5aIQGDcJKyccMa2MCdrWdRgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4876

Hi Anthony and other Qemu/Xen guys,

We are trying to enable venus on Xen virtualization platform. And we would
like to use the backend memory with memory-backend-memfd,id=mem1,size=4G
options on QEMU, however, the QEMU will tell us the "-mem-path" is not
supported with Xen. I verified the same function on KVM.

qemu-system-i386: -mem-path not supported with Xen

So may I know whether Xen has any limitation that support
memory-backend-memfd in QEMU or just implementation is not done yet?

Looking forward to your reply!

Thanks a lot,
Ray


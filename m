Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C843700C61
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 17:55:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533871.830849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxV6Q-0003K2-8W; Fri, 12 May 2023 15:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533871.830849; Fri, 12 May 2023 15:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxV6Q-0003HE-5n; Fri, 12 May 2023 15:54:42 +0000
Received: by outflank-mailman (input) for mailman id 533871;
 Fri, 12 May 2023 15:54:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLzh=BB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pxV6O-0003H8-1s
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 15:54:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e88::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44d493a9-f0dd-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 17:54:25 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24; Fri, 12 May
 2023 15:54:22 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%7]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 15:54:22 +0000
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
X-Inumbo-ID: 44d493a9-f0dd-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOIXF96DU/1Iwy6VtkDZ6/Dh5Ah++V0Bh2mZadu67/sXz3jWOUCNC6eal7lKU/drPltLheWwFPYaO+cP2twS4x6NWU9c2t8ngNUtnjgzKdm7CYMFZz8MBc8hA6lcV/ToggO1ifph8HT9WT9QycBCv9/143ws7jH+DWzJ8eawcCxWiQ6EZaZfIlIPHAO8UBU4dBTQm4hHgATwKEtkMup+M8smffmk1CPa4ZePnzjDOAcZ6Zv91scjBI9mxbtZhurRAGAzrCdp9tIykOZWJpjFq8iXER79YCq+Zh/wnFigEEFn1G+3H67IqrOHLW7hQyOoh0afRzlk31fo3wqcukNOUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toZEIey6sJUbumywqr7pcneTwrRK5qzqvt8Mr0njl3w=;
 b=htS/2LzB+364pn9wFO0RErmupQEh6LXSaswi7usBtqHkFEE6x22xuHUo6Cjh1RGIL7pyoFSrpUqBIvR4xB1HxWkKFyomfV0tIprxwStzn5f7/et6iR+GoFTJX/RSsffzdtroPyNEjCwSbCYZso4G18lQERrx0yUfjbv6eBrwNieZc0RwUUtAZfZYm7nyjgvby18KA2LQDPtlc2ThaJNp7XStwizdbf4GU6rZDwEjxW4+ShBzZaJsPY7RLMymybJpXeBUDBuAfAjTuLe2TiKI1EcYQhVj/uwHuwLec1GBcrbPW5BZTUlXmQvDX8YFljcqLaAjzdxAMy2zCu5YIakU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toZEIey6sJUbumywqr7pcneTwrRK5qzqvt8Mr0njl3w=;
 b=d8weIgZW7Azh+zjjLPmt+7abRqV9WS3JgvC1oOctfBdpamQTumdldDJSDu0p25HC1G+3XDz3n7M6rWuaKp96GciNVeCn/Wj+SeeQTy2B0QstamwMrafGqFVlPydcuEim39kgbco4BUH6uj2hZeh3zuKkdcEUyIctSrfLjYH0BCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0147e7c2-32b5-9185-b269-fb890ba6dfc9@amd.com>
Date: Fri, 12 May 2023 16:54:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev()
 parameter
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-2-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230512143535.29679-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0007.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::14) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f11a52-48ab-42ef-b784-08db53012712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v44Bcpwj9xk1Dkx2s0R3i6hKqRaCqm7tMach/ATWmHwTDtMCyruaTls7PVJWC7pilw7+b1VqxFJdfOxxLEEjqWAM2TLnqq3J26h+2JW3g7EAINcNx9szOjn9BjhF1Jug1TsD0U/aMc1QS7gP4nZ8xZVQeWlodb4F2Mj4Bfqs+QjCDSqAC8ReLhHULVZmWvYXi/rMKrio/HHwEGADVt3TDADk0CuKYoIdmiX8HIA/pmPeDoOiKnO63Z0E4/K2T4c6WvVpJF2qYdQDgtgovyI6Y9F3Si2T54ND3kfdRWGxWol75cMChE909k4/hGjqMiNq+Ofpd1VFokiayoKXc7FiBTeziWpegwqJEaB1F+MKbZ/oEFL0t6DtL9Jsu3QF01dBbKCeOZhYNcj+yUMPes/86EjkmwQZFoeXjpsHw6Uu+Z8rkrPHpdN8YaL3utzqw4AdwS9g4sryxftW9dtsCI5a1sXPS+p8mEvHv4k0fsr9hkRMJ3r3KjvVj5UUosETmo/ZuuekejZqbMNeOz2ADWqnMNwZsblGLg1u0YZjcOBJ7oxHlM08Pv79t5BtUHNBrTirsd8Dj/MDuNvn300338dh7ZBEddVLsGKPn1cj4J7w/cWuRaMDv7IZxURHcAJhsgYEbqWcIUyJKWRVyxlaK8DO2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(451199021)(6506007)(6512007)(53546011)(26005)(41300700001)(6486002)(6666004)(186003)(31686004)(2616005)(478600001)(54906003)(66556008)(4326008)(66946007)(66476007)(316002)(5660300002)(8936002)(8676002)(2906002)(36756003)(558084003)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0ZqcGMyN0x0azZkOTBDQVdFeVE5RTZoUVpqaER5Y0ZhbGNWczkzM0xXOVg5?=
 =?utf-8?B?VEFZeEMyTDNPRXRqWkYydzVGQ2F5am5FN2dWTk1Vb3V4ejJ5dm5YSmFMQVJ6?=
 =?utf-8?B?OFNmNFRhWDVuTFNEU2IrM3RDRGlVeGRSV2lrWXduNnc4K3NMaU43RWJIaHFn?=
 =?utf-8?B?TWdzM1paQ2IxVzM1VnZjUkZwT1ZMMVpXVlR0U29DOUdDRVE5cDQzMXJuc3FD?=
 =?utf-8?B?WXNKZGJrcWdEd1hxZEYyWmk0aWIyTHVmR1JMOGNkMWNYZlF2Nm95dHExNEp2?=
 =?utf-8?B?Ri9DTHNwMnpVOXVvc1UwRjNVSFl1a1VEbzRWK0o4dWt1RnJJOGJ0ZXlpZ3Bv?=
 =?utf-8?B?eEhJcEF1NUhvU200RkFLbEpoQWwxYXNpSEFkNnNuNWxWLzF0T05RZDZ1Qlhk?=
 =?utf-8?B?VGg5bS9pWmNDRXFxZGNXVi9GeVM2cE5OZkVOSEx6Zml3TFc4a0dXOW9QMWND?=
 =?utf-8?B?azBLZUtSOEFsbVRDc0NnUmVibEdjQnNsVXUwUjJJM0ZoYWpTZEVEWlptOVlZ?=
 =?utf-8?B?SU1rQlZRZk50cEdZdHRxVmpOVlZySEZFNEYyV1NyTlhUOU84VElNcFQ1T291?=
 =?utf-8?B?WW1vbnNKOGNjb1BWaG9xMk9CRXRsU0NIQXNIYm5SanZVejdmOFp5eEl0TXM1?=
 =?utf-8?B?Q3dOdXZFRHEyOXdYdmxLZ3hJWVRCQW5oUElFYXZtN2ZFRE5SMTVlb0dZdjZQ?=
 =?utf-8?B?QzVqM3FnNmdvS2F5aXU5N05keWxtSklYQWhjdm9kTS9YQ01ZM2hBWXFjTDNF?=
 =?utf-8?B?Mm1wTGRyaUduZWxWbjVtR3pYbU1EbFc0QTg3VTNpdjVWZWtja1dhTGp3cUxK?=
 =?utf-8?B?WWhLRFRwQTk4eVJLYm1xbmIrWFU3dDd1Y1oyYjFLcFY3Y3ovU1pBTU1lU1Np?=
 =?utf-8?B?Z1l1SW9PekJXM1RvcUxMSHFiYXFJVlFJQithYmxsRlc2WnljR3RGL2FTa1h2?=
 =?utf-8?B?L1doMU1LRzhtT3J1Z2RTZzBhYzFldGJOK0NBOHVXT1NmNDdVMCsxd1R2Z1Bi?=
 =?utf-8?B?ckIzRHVXZjNkZk40ZHVEbE0yTkUvdVgxazZWVUg2d3lrQVRPNEloQm9XQ0Jt?=
 =?utf-8?B?OUZxMEl5dm9xdk85Znh5SVZ4WFZnbDVsV0hjUnlOZ0IzWUwwM1BnYmFFeVhu?=
 =?utf-8?B?bU9OcElzMFhjZFkzQllqNmVHYUZCZG8vSm9RVHlndXpSR1RSYjV4NVBkS0pO?=
 =?utf-8?B?Zkw0TDBLSURrT3drWjdVbFE0eU5OZG40YmIwRC9SVlRUT01hNklXRVZqYWow?=
 =?utf-8?B?am1CWHcyYjVHaEhRdkNuYkdDT3VpZTlqMHFuazlyYWU1TmhpbkhZdDZTbzRF?=
 =?utf-8?B?eStmWG5kZXdzWnZ4dkdWSVV2YjVjb3VkM0Q0RHZpNWRibGNDSFNQTWd4bEtX?=
 =?utf-8?B?SXlhL09mc1M2RUtjVVpvWUpvTEZ6VVEwc2xKcnk1N3NFdW9jNElQY2JwU3pJ?=
 =?utf-8?B?YnE3WE8zcTgwdXR1dzVibFFYaGFkSzd3TEZ5RUQzZkZCRXFYNUJrMmxJd290?=
 =?utf-8?B?cWFpOU9YNlVyNmVPZ091TTRMYnQ3cHMxSWpvODZuVmFPWGpQWUlrYmYvN3Z1?=
 =?utf-8?B?QVdTL0loeks1c0cvTVh3VHg1NStzMWU4cWZzYWQxN1dPcUhCNDR3SEMzYVQ1?=
 =?utf-8?B?a1lRbmEyeEtLazErSGZ3QStvNE5oYnlrTjZueVpSTmdEWXREcDk5dFNSTDFr?=
 =?utf-8?B?Z01va1g3UEJNbWdNb0hNSnF6azF3ekppZUpZay9keHdoZTd3WlZPVmYveE1h?=
 =?utf-8?B?L3krcUdSM0U0alVyU0l0SWhmUWswWXZDQ0o2VTV2N0w4WUI1cmIzSUg2QW1x?=
 =?utf-8?B?WmV0ZlE0N3h1RllKRFRKVnVXWWFORSs0ZUV0OGpHTWh5eGtpSzFpUlJCa1cr?=
 =?utf-8?B?MCtxQ1dUL1p2dWx6T1krTGw5VTAzZS9yZGZRL3hzRHB4NVl3UWdmZWFYTHZj?=
 =?utf-8?B?YXdEcEZJd01xSG5TQXFEQzN3N29jWDVSQVlKdDBvczRyU0xTT0YrcnFIUndu?=
 =?utf-8?B?TXZoRUZCRlhhemYxdUsyYWJzTTBBV1Y0RjZ4L2JMNCtpbGRRTjIxVmY2YUdo?=
 =?utf-8?B?cURGTktVSGluUG9kWUJBamxNRkExeERRRmU5TTlSalM3djl2WVpRT2x0Zkc4?=
 =?utf-8?Q?Pkr3JhOFhd/k6zb9Gx3wIjz5+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f11a52-48ab-42ef-b784-08db53012712
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 15:54:22.1455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/yHBkDsf7if7Eh2EjgbmMiiXMWSMvt907ti7WU53SdqxejnBvCJdP7TfVvDzU6JU2OW1zE/HfjlUxqUbhh/TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053


On 12/05/2023 15:35, Michal Orzel wrote:
> This function does not modify its parameter 'dev' and it is not supposed
> to do it. Therefore, constify it.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


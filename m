Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EFFB9DFF0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130190.1469785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1h4r-00089s-Do; Thu, 25 Sep 2025 08:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130190.1469785; Thu, 25 Sep 2025 08:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1h4r-00086u-BA; Thu, 25 Sep 2025 08:11:45 +0000
Received: by outflank-mailman (input) for mailman id 1130190;
 Thu, 25 Sep 2025 08:11:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1Y2=4E=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v1h4p-0007tH-AN
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:11:43 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f9347a-99e7-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 10:11:38 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA6PR03MB7855.namprd03.prod.outlook.com (2603:10b6:806:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 08:11:34 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 08:11:34 +0000
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
X-Inumbo-ID: 41f9347a-99e7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rralwjLiYyP+y3A8zI8zH3j0iblpJ+ZFj7sMNjM8xcyHJ4bxZqhcb3ueoG/zVIUzL2IBvVCCfh86IOPSNh9m3RcSpBB+oqCo5Q1CgJCLpx0pHt6MYYWowdJnUkL4HDGVe5KZ3cijNBahhcTdkYjYDxB9090g+CpAk5VRu6A21yv7HJfBLsIUTa25hnv3v8pRl2A2PFHwE3SmYcpEZsdx3m5MPX0RZfXX3NftneC542x7c75dNrrrtb9koP5fA9v0uSuy/DJBCvsd7+rBC470urh6wSLFjbxNz70laDGdyhLkZ3mbCLXySiHJcL878nBYhjcDD9zEC8gfV2Pm6+JRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBZXJt7yW1WiAgNZSVMolrLF1fqf8EzbZIDx2yqPEfc=;
 b=JbBClEud8dHBrKn1mhLvPMIhTOK22yHuOp1DwjsUuPNCgIizwuLvL+cAOEaq45DKm4SrM4oMpg/Ji8kEJ2WaW6WnJNtPnLTOYSG2MgegSKuTCZEe71BJbHAWiNWHst0IrhVF4wzHCOfE436Clg8LsX2lUzBQl0vAwrB6t2s/OXehAb8LIECw3FqdI2c6dFYNFGIBkr0cBMtEVKwsMskt77wFodLhk2mbOjqsZkKXE7oS+cwjI86ZiUPU/GmDQOOpqwP21GWDPAmKwyEUKcoTXQ8OpI8xibUKa7klE61myd5Qv4AEwJwcWzqASeUAgCrqVW9hZ7+3B9+GS1Y7X5Ohbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBZXJt7yW1WiAgNZSVMolrLF1fqf8EzbZIDx2yqPEfc=;
 b=VaRqHor4t0KPnrucVRlbu4zQ+rLREuv7AspJsU2cD7/8BWbUC0LGkg14fidMJljUWTZtMa5OEbn/P2O0G3Meg3AFOTzvcUYp6/6jD57E+/RDbMP02z3lECiwSQy1Cqm0J5LqdPEMP3qsiK84rqbC6tcPYVtGY3XovIsVBydYs9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 25 Sep 2025 10:11:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper@citrix.com>,
	oleksii.kurochko@gmail.com
Subject: Re: [PATCH for-4.21] x86/cpu: populate CPUID 0x1.edx features early
 for self-snoop detection
Message-ID: <aNT5MZMU29bdoRE4@Mac.lan>
References: <20250924110051.2160-1-roger.pau@citrix.com>
 <2d17d2d502df489f97b51e43a2d86535@DM6PR03MB5227.namprd03.prod.outlook.com>
 <aNP0iNtp2q3342G9@Mac.lan>
 <3d45a9e8-a836-46bf-a3bc-321551ac755b@suse.com>
 <aNTwlR02jijpwYeC@Mac.lan>
 <1083faae-d565-48ab-8e41-3a5a12178a9f@suse.com>
 <aNTx1DuSIRvj7eqv@Mac.lan>
 <58e5e9ae-9b57-41b0-a2d9-bdd2f312293b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58e5e9ae-9b57-41b0-a2d9-bdd2f312293b@suse.com>
X-ClientProxiedBy: MA2P292CA0017.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::20)
 To DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA6PR03MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: cafade7f-7926-4d2a-b5ed-08ddfc0b23c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXhDNDB3dGFnTnhNYXYwZmN4REdmZHhTRThqdGxTSzdVeG5ST3I0dnhGcUxs?=
 =?utf-8?B?MjVFSnB0RGVmMGdLNnlFRXFqU1I1TUxtUXBmZVpFdHJwQkJTVzE0d2ZIOERa?=
 =?utf-8?B?RlpGb2xpZVNZVUt5VzAwRFpsa3hiQVFXbFFid1BzQlJwVFhGUURhVVF0Ky9H?=
 =?utf-8?B?Vk96SWhPMWZkMFM1dVZ3SzdJS1IwcFAxTng3dlBwajRRemp3Z2x0aDVVKzFy?=
 =?utf-8?B?cFp1a2dMVCt0dGw5VkovK09lK1NBOTVDcEpFQ0xRMHdmUTM5dWFIS2Faak5p?=
 =?utf-8?B?S25IZmRUTUQ2ckJHc1JDYWdRSWJYSFlFL0RzRlpoZ1ZrajF4L1N2akNpb3Rw?=
 =?utf-8?B?M3hBejc1R3lCMFlTcHIvVFlvWVkySUNJaG0raHRrU2Y2SXZEckpySGg2SUtL?=
 =?utf-8?B?VCszTHpUYjVLbnZkWVRrUzF6OGUyQU9PbW56ZG10S01aWmczWUllUUg0dHJJ?=
 =?utf-8?B?bGh3Qm9zRXFrV2ZlNUljSE9IdFBnWnJ2blhGekh5SXlicXJleHdlM0JzdGFG?=
 =?utf-8?B?OUVvQXZwYWRmbS9rSWhRZnA3TFdCZnZJKzBlRUtZZ2hHMjY0ODNMbmVOSXps?=
 =?utf-8?B?MXpwakVnR3lMWlV5UzV4WDBsRVpPMUgxZG1wVWlUd3BTQmRFam1YSytRQzMv?=
 =?utf-8?B?Uzd3b2h3RGsxWHR5OU5jZUNPTXh5a21HODR6a0l5bjBLQTVzY2dRMXFkcEpR?=
 =?utf-8?B?QitiWUdiRW9pTkhPUzBhdC9mZ1kxQnRtdWxJTTZMb2xSbEhoUkN3RTFaTXZQ?=
 =?utf-8?B?STVhUFRHSm5wb2F5VFNGWm5XWG9mQnBibWI3dmVuYjkyUXhyd3dDUlp4Ylhj?=
 =?utf-8?B?aVhzaGQrYXZSbkdIRkVLNU51TmtIdE9OR3k4dWtJNlhCdjFTUlFBZ25Sc0pK?=
 =?utf-8?B?MlRCNEdYdDQ2eXlmWGF3V1hwY3RUa21ZTERmN0JFS3N3SnQ4VXE1OVNJdjNW?=
 =?utf-8?B?V1hvR1RGL051UFcyWWxheitiZWZGZUlzQVM2eXVMNjMxMFJiZm1na1UrN0k5?=
 =?utf-8?B?OW95QlY5Yk5rMmp4eXR4dGdyU25ZOWJaclA0NGFub0c3ZEU1Q1ZQU0E4YTRN?=
 =?utf-8?B?VWc2MzcyLzA1YmQ0RjN0aGVRM0k3alVLZDBEbjB0c2s3by9GNy9Xb2RWbW5s?=
 =?utf-8?B?emVBbEpUeTBkVGNNbi9HZGFNQ2NxUG11bkhzNnQwS2t2L1c5ZVBpWG1MOEZn?=
 =?utf-8?B?RnBuOTlROFpSS1Q0VVBLTDBrRWFuMXp0aUxnMjk3UitMMlJYSTdJV0VScCtO?=
 =?utf-8?B?bnZVdGxvaTg5dHlsenFVKyt5RklhTFliNnJkNVp1N3ZyeVlINkdwOXdDY2pi?=
 =?utf-8?B?M3lvbkRwOHBtYkhRdHU4bkdJdjVNeUNBVnR6SDNDYm5IYUphNm9RL1cxbUIy?=
 =?utf-8?B?ZHRJMVFMWnp0NE82c1Vpbm94UjRYcWtCaXFZT1JYOER0bjZLU2xmZWczRlFH?=
 =?utf-8?B?SzhTZmdQMWhQTS9ObWN1S00xNThOS3V0L1BwRUJYTysvS1Z3YnI0TzNoNmY2?=
 =?utf-8?B?aXBLdGJVMjMzN1dYRkdocDIvTDdxS3R1dG94YnZPZ05mUVpjckJoLzRtN2pI?=
 =?utf-8?B?OFp5RmdnY0Y4eHdSRnR4YkVNZTEySUFkanNYU2IvK2xaeW5paXY0aW9VN05E?=
 =?utf-8?B?UmNGRGpvT1BsVTUzbGhVSVNhdW9EaHArWXpNd1V1SkwzL2NhV2VjSkQwVW1I?=
 =?utf-8?B?MmM4S0w4MnFsbW5PdUtRcEJVVzJnS2RMWmhtNVU5WmVWVGlybENjY0JoNjRE?=
 =?utf-8?B?UTd1WWc3ZmkydG9XanFaMHNNZEtXNlNvSTNlQjdSOXkremYrbUZyZ0o0MjNS?=
 =?utf-8?B?Y1BtR2paYmViNXkvaSsrVEhiTFVIM0ZrU0gyZ0VWRFpnR3YybS82VHZLd2RX?=
 =?utf-8?B?dTVSNEdLMlNQUi93OTg4ODVMTGwxcTR2NVdTZFc0UDVpOHRYOExBNVZESmxw?=
 =?utf-8?Q?mfOx5DHw8o4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?REE0MTFTZzVCeDR2OFowUEZEblBxVXc5RWxPMlQyeFFjWE5CdGFrTnhvNyt1?=
 =?utf-8?B?YjNUczR0R1lsblRacTNzV1JjcVNDd0g1cURCS3htTHA0czN4eVhCNUN0bGVo?=
 =?utf-8?B?VG5TNzlKekY5eEFqaTMyUEVtZ0tsUkNBeUg5RFBxV21pRklYQWhyWmxTSllu?=
 =?utf-8?B?QjRIVmoreU1XQXFaUmFHdWRSWDczSFpvZlNQcmp4akR0SjZkNFBKNnU2aUkr?=
 =?utf-8?B?ZUVrZTByREhQaTA1ZlBZOXFPaG81aEwyZTZCNmVHK0d2aUNMSnhWUUpxOE1S?=
 =?utf-8?B?MS90aVRpK0t1RTIrSGc0cW9oZS9XbTZFMUlaVDNHSGJ0N25BMmNnWmxyRitW?=
 =?utf-8?B?dXV0Q1RmbnpZRGprZEwvdkRwQ21Jc3ZZOTdYdXBnU0gxbHZvSm9iUm1DVzdR?=
 =?utf-8?B?NlBWK1g2K1ZSRUJRVnZtL3BZMlFpbjAwb3VSQzRpY1NmblB6UUVPMFllZlN4?=
 =?utf-8?B?T2Fjank2SmVWZUorVzBRMVozelpvUHhnVXpveHRVOTlmNXN4bGZXdzJveFUv?=
 =?utf-8?B?ZllGRUN6c1cyUnRYRDB4Vmo1VGFoRkh2M2IyVnU3UVJ0S0M2dlZqWllYL2dL?=
 =?utf-8?B?TmpyenpwV1lNUzROTXFaU2tqTmZzd2MxajNPbnFPSEVQeUtJODllNlE1Vnpn?=
 =?utf-8?B?TE4rL09WQUhBK1NaUHJvaUVFSTVqQ25DYytxUTMyZUxYS2JRNU9rSjBvb2RS?=
 =?utf-8?B?S2Q1aUdlVjFUS25pZnRObWs1NHNGeTNYNVBrdVcrWnpzZlNLc1RUWTdueXVK?=
 =?utf-8?B?LzdTdkEvdGNibVlJUXJnbXFkVWJrQnBHZERYUzd6TVJ6Qmc4RlFHdXcycGl2?=
 =?utf-8?B?S2QwWmhZMGNhUFhuSFdyZzc3a2VjODhGSGVtLzR1Y21qNk5NSDJyeEEwWUxv?=
 =?utf-8?B?L0pDekJKNGpoQXJCVWl4VGo5RnpXQWRrOTNRbVliVm9sTFJjOVN2QWxINy9l?=
 =?utf-8?B?WEpreC9HTmQ3TzJxSnYySDdVZnUxUWJVQ1ZhUS8va1VHWXRyYzRjL3hGbkNB?=
 =?utf-8?B?eUJmaVhxdUxJY1RDdm9yRDh0SE9EM2VZWGNac05MaG5sY0lwaVVxTDl2RXRQ?=
 =?utf-8?B?Yk1qVnorYktqcDF2ODlEbTlkQ0R1d0tNbHE4MTNWcFZ2L2MxSzQyejgzckI4?=
 =?utf-8?B?V3dBSUhaNHhITmZQZWRabTlQNFZKMEhWQ2pEd0xVblBENS9vKzRvVjIyM2c2?=
 =?utf-8?B?bXlsdWdkemhyenpqbmlZK0FLdzl3QmpLTEorQ1VPOGpnNENrQ3Z3L2tGNXFm?=
 =?utf-8?B?ZVhlSCtoRmFTVVQ2TFRoendBeVNJMHl5bXFPME1BYUJyOTNzaXh5aitJY0ZP?=
 =?utf-8?B?MDB2U0lwb3JXOUdPZ29hY2RxL2hSV2RvYWZzTi9tMTNNd2RQODhsR3JSdmpP?=
 =?utf-8?B?ZUJLVnJSWGIrcXFtU0UwNmNDN29COWtNcFQvWGtBY2JhMEFqRDRwRXd2WkUw?=
 =?utf-8?B?VmVidEJGc2FpWVNsT3I2U0tJZ0JaWWZodWhHV1poemp4S0lUSDZ0WVM0OTBM?=
 =?utf-8?B?bElMMWZsVFIzUHFaNHlKK1psb3d3S1pHa2RZNUdpV0JrTTlMZTVYZkdaQm9J?=
 =?utf-8?B?dkdUZjlOUHhWTUN2TzU0RUJGNzVFT2diOStucWZzcjZtM2k4eERYY2RRdFYy?=
 =?utf-8?B?MWdqdnljTDNJN2w0WFJuekxKSjFsTHlReG5GYzh3TS9YU2pFNitlWEd3YVNK?=
 =?utf-8?B?MWcvbGlrbytZR2pSVU9aREI2R2llZjVrbHV5aHJxSVE4RnI5eU81QzExWUpl?=
 =?utf-8?B?S2V4eTlTdC82Y3E4WmhCdzI1U3FFSjJkM245QWsyakpDUmdLVFN4TEVaRmNp?=
 =?utf-8?B?NDI5VEJNcWpKbmJndTltWTA2bTVFbFk2Q0MrL1pvTUJTRHRIVkZqRlhuTUVp?=
 =?utf-8?B?Vmg0SWRjaTVEcXNXcWlrZTZNcmp6ZHlIc2ZaNUJRS0cwZFE3YkgvcThOdFRz?=
 =?utf-8?B?OXVWckJCL2tTODY1eHRHS2FhbTY5dTZYREdyVzdKekRvOWEreHdzYXY0bWFk?=
 =?utf-8?B?TGJ2NGJkTHVqSWJVWC80eTFZaWhWN3Q0UU5JYjNNYTd2VnhHMkM1Vys3SFpQ?=
 =?utf-8?B?ZWt4cWR1QzMxVUpCSXRUUU5yNWpabUE5ODNFMlBLejY0SjFlOUZUdmNCNHox?=
 =?utf-8?Q?eWkt47Qq0xv3Nax0IRg86nCgs?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cafade7f-7926-4d2a-b5ed-08ddfc0b23c1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 08:11:34.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5h+XtKhqu7yRyAo6Tq1u0H1MYA3tODqJGfv3a4Tpm67+6RLR2YLNQEZ5UoJHTweFfcPxoEESkoEM45AhZxOg+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7855

On Thu, Sep 25, 2025 at 09:41:43AM +0200, Jan Beulich wrote:
> On 25.09.2025 09:40, Roger Pau Monné wrote:
> > On Thu, Sep 25, 2025 at 09:37:46AM +0200, Jan Beulich wrote:
> >> On 25.09.2025 09:34, Roger Pau Monné wrote:
> >>> On Thu, Sep 25, 2025 at 09:03:06AM +0200, Jan Beulich wrote:
> >>>> On 24.09.2025 15:40, Roger Pau Monné wrote:
> >>>>> On Wed, Sep 24, 2025 at 11:50:02AM +0000, Andrew Cooper wrote:
> >>>>>> On 24/09/2025 4:00 am, Roger Pau Monne wrote:
> >>>>>>> Otherwise the check for the SS feature in
> >>>>>>> check_memory_type_self_snoop_errata() fails unconditionally, which leads to
> >>>>>>> X86_FEATURE_XEN_SELFSNOOP never being set.
> >>>>>>>
> >>>>>>> We could also avoid this by not doing the reset_cpuinfo() for the BSP in
> >>>>>>> identify_cpu(), because SS detection uses boot_cpu_data.
> >>>>>>
> >>>>>> Doesn't this, mean ...
> >>>>>
> >>>>> Well, that's the reason for the rant here.  The reset at the top of
> >>>>> identify_cpu() has been there since 2005.  It's arguably to make sure
> >>>>> the BSP and the APs have the same empty state in the passed
> >>>>> cpuinfo_x86 struct, as for the BSP this would be already partially
> >>>>> initialized due to what's done in early_cpu_init().
> >>>>>
> >>>>> The underlying question is whether we would rather prefer to not do
> >>>>> the reset for the BSP, but that would lead to differences in the
> >>>>> contents of cpuinfo_x86 struct between the BSP and the APs.  In the
> >>>>> past we have arranged for leaves needed early to be populated in
> >>>>> generic_identify(), like FEATURESET_e21a, hence the proposed patch
> >>>>> does that for FEATURESET_1d.
> >>>>>
> >>>>>>>   However that
> >>>>>>> creates an imbalance on the state of the BSP versus the APs in the
> >>>>>>> identify_cpu() code.
> >>>>>>>
> >>>>>>> I've opted for the less controversial solution of populating FEATURESET_1d
> >>>>>>> in generic_identify(), as the value is already there.  The same is done for
> >>>>>>> the AMD faulting probe code.
> >>>>>>>
> >>>>>>> Fixes: f2663ca2e520 ("x86/cpu/intel: Clear cache self-snoop capability in CPUs with known errata")
> >>>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>>>>
> >>>>>> ... this Fixes tag is incorrect?
> >>>>>
> >>>>> I think the Fixes tag is accurate; the code was OK before that change.
> >>>>> Nothing in c_early_init hooks depended on (some of) the x86_capability
> >>>>> fields being populated, which is required after the change.
> >>>>
> >>>> I agree. Hence:
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>>
> >>>> I wonder though whether while there we wouldn't want to also store ecx if
> >>>> we already have it. (Really there is the question of whether we haven't
> >>>> other cpu_has_* uses which similarly come "too early".)
> >>>
> >>> Yeah, I was about to do it, but it's not strictly needed for
> >>> c_early_init, and it's done anyway just after the call to
> >>> c_early_init.  I can set that field also, but then I would need to
> >>> tweak the comment ahead, something like:
> >>
> >> Sure, i.e. fine with me.
> > 
> > Oleksii, can I please get a release-ack for this to go in?
> 
> Do bug fixes actually need release-acks just yet?

I always err on the side of caution and ask for them.  Maybe Oleksii
can state if/when he formally wants release-acks for bugfixes.

Regards, Roger.


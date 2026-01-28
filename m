Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GVvGTn7eWkE1QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED30A0F98
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 13:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215573.1525723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4H0-0000Xq-B4; Wed, 28 Jan 2026 12:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215573.1525723; Wed, 28 Jan 2026 12:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl4H0-0000VW-8P; Wed, 28 Jan 2026 12:03:50 +0000
Received: by outflank-mailman (input) for mailman id 1215573;
 Wed, 28 Jan 2026 12:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl4Gz-0000VQ-7G
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 12:03:49 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6688429f-fc41-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 13:03:48 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by LV3PR03MB7357.namprd03.prod.outlook.com (2603:10b6:408:195::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 12:03:44 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 12:03:44 +0000
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
X-Inumbo-ID: 6688429f-fc41-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwfjTNw5oiEP538dN7OsG4dLxvWx7xR+UbQ4vBewMQei5PPrrCxrit526ftUIquR3tJ1D1MJnnH+E7Pd5M3WsHDxOV4sVwR4uOf+knb5yj9CK3ofOMveHAbFbFaQy8Uhc8k2DSlGwsXKeGZ65CurH4eAdGLhB2bNUlL4gX+JcKgjXcL8LbarAKK0ghV2o8mxbhopbp9D4RFjIIfrlX3q2ul9TXZ3xvcaBvECSvlSpycMp9+KzEKH5m9YlS864nLCxsMf5DNwC3+qzPYMuIvOT+wqwuX1iwaOnD3eFbgIHh98+iqpnsmT7Dc+1zl1cxoaIMeW+WfHQdpEaV2JFYr0+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AASb60VUGh7C4L8MvrD+m88IZPP9u1JUX4R81RrzRjg=;
 b=g2adKCzHZuOtThy6SSvtcZEvfBFI1BO7+maitdpBG//bAI9RFsrVaA3DtBCEghw2oL1InoQ3b4NPhqk5wRzeDJc6EJJdiIFTxHsf6rHsgBPuJ6LmJX/CAGQcc0ASntRxs7C+GwWHIY3lAS+qKhaRIoD6gJnTyI9LYzWDUWwGOsUK4T6Yd78YLPbPFL71R5iyXXh3wJPKusq9GB7uiUZwKZZEWHxUrAa1ZGB4uwb5ovJa1MmQPnJt/Lz6ZOxvwGe3xIonutMmwPvIWFrOcAXiIVOkzzEGnj7A+4c/scvbpQ3vu6hMFj6C9lWYTWDhiWFbplG6fj33fgT0mqgWK8KEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AASb60VUGh7C4L8MvrD+m88IZPP9u1JUX4R81RrzRjg=;
 b=L7zbdrvDZupXnTLe6gMU95E8+bAcSoOE2DKJv4IMecI4x2DMlsNwnPnLOzhldojaKb8QYPi/Q85dtgFkmDBaqEWWVjSz8wuWaQldRRTSY1tilCfjRmqTPW58M2YLFa/LHPc8gxc9BCsU52iTHuN8cyxWW6HcA9RPsL386q6JasE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 0/3] xen/mm: limit in-place scrubbing
Date: Wed, 28 Jan 2026 13:03:36 +0100
Message-ID: <20260128120339.47373-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0143.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:51::22) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|LV3PR03MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: be5e2de0-3952-4915-6196-08de5e6548e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXVwY0ZqRHA2M0o1MTlldVlGQ0NtalJ3K29aeEJGbllhM2pkTzYxMklpY3Nv?=
 =?utf-8?B?NUFaMzhMUk5zRGFkdlZCVHdvNG5vTms1N3pmRi9IZHpqdm4xZDZ2eUU0TzhT?=
 =?utf-8?B?bUZHSFRPU2JpZUtvRkhueTRaUFpjWklwVEg1UUxpUlljZTI3VytrMnR4ck1T?=
 =?utf-8?B?S0pqMmhXVUVEdi8xdnpVeE44SlZTTjhLdTBDVnYyaHdJb1VjNjN2OUxmb1pl?=
 =?utf-8?B?RGVrdWtOMDRBSkgreGgxUHBRYm5GcnB6ZWN3YzJxOEd3N3EyaUk3OWQ3UDN1?=
 =?utf-8?B?TUV0TCtKcDVuNmRpQ2xxRGVpMWpqNUF1REViM21oRGthYmI0QS9hZkk4OTBu?=
 =?utf-8?B?MHg2NmRiek12R213Y05ZL1k1MzlwNFNtejgrYVBralFwOU1BUDM1SDNHYWwr?=
 =?utf-8?B?MFpweDJxNXRONy95K1VVZlV0YWMwZ2RuWHozR2tiV0FIN3ZBK2FYNXF3MkxI?=
 =?utf-8?B?Q3k1ZjVweGtFZVR3bkI4OCt3M2Npd3VaVXd5VG5vb2h4dVUzeVJoQ3ZZUDRw?=
 =?utf-8?B?bE5zM1JtZTdHaGtIOUptNzQ4ZFhJWTJCalZEMElrdmRzVDJHQlYybm9DVzZW?=
 =?utf-8?B?MUg4eWc3dlhRTFpQdmh3bWJnbndDaS9rQlF2bzZzZDBPcklKa0E5MENmWDZI?=
 =?utf-8?B?ZnA1WkJvVEo5YXRiWEUxNTJob2JRcEt1dytNNkJ2YlR4TFJBTlNXUitvVkR6?=
 =?utf-8?B?b1Zya3pESzhUR3IwdUxTTE56akhsdTJqbnBMTzdsZFU3azRUWVdyV3hKZWFs?=
 =?utf-8?B?UTY2L3NxTFJpbm5NbmZkQ2NrSU00d3huN2xaVkd4SGlBRndpYnMvTXkxUnMv?=
 =?utf-8?B?bHBWZWp2bkt4d3IxY3YyNW1POTRadjhMeFRDWm1JTVZZeVpoVDU3MUNyOStk?=
 =?utf-8?B?bi8ydGpWMEFzMXhVUmRyUFFxK3lzSjd5R3dZUDNYajdwZXFGOHl4WXZweVMx?=
 =?utf-8?B?MHRYOTNQRlhibHhsOFUrV2wyNEhlZE9jL0VxL1A4RnVRTUJNTjAraUZCODF5?=
 =?utf-8?B?d05RQTgyNU9qQituOGJxWk9oVGExeEUzTlVUaXNKeEhjTElSQllTVmVCbXdh?=
 =?utf-8?B?d3N3bU5NTGtGOW9VUVVQWnlsaUloZ3BhMys4R3kvQVg5aTNsbWNMZFllcTky?=
 =?utf-8?B?b2lqYkloM3hDMjZLWStkdDQrQU14cmZQV0crcjZWR2xWZ0hMdTBuRkFiTmYy?=
 =?utf-8?B?cjMrNGY5ckhRbEE1eHd5QVVsWFBlZ1U3WTU0MlBWZXhCemVXMXkrTVhKRlEx?=
 =?utf-8?B?V1pRZ3ZQQW9LS1J5eFlsSThWbzVsZjQvdEpqV0hxZzFDZjJ3bytaTnRqRytq?=
 =?utf-8?B?TkIzYkpIbnJBb1RRM0tjQVdwYmtRdDUvUmpWM1dnREc1d2E5ZmVFU005ZXFH?=
 =?utf-8?B?cEJvSWR6czk1WHl3akpEQ2VydG5Gb0RwemZBN0hDRFQxZEhlK1Zra1J4a1Bu?=
 =?utf-8?B?MWVqS25NN3U1azI5L054RGVMTG9LcDBNQTQ5WW1GUXlqdDBrTmtNTTBkL016?=
 =?utf-8?B?OEdoMTJ1aEFYZ2xMampJcUFNNDJ1VWhQWkExRFU1YWwvOWduNWNndk5pblNN?=
 =?utf-8?B?bkthT0kzUmtHd3piekt1WGFYOTMvcUVnN0RXMkRhc1FaQTdpT1JDcmFFa29C?=
 =?utf-8?B?WGhDL2c5T3RLL2Q5Vm1YSmJvYnhid1lwSDZFclVOWXRHMDBDY1JraWJjNkdR?=
 =?utf-8?B?OXYxRWV5aXQ0Tk9LRnVIQ0xqWlNPRGMvSFl2YTVuRWhhb0lnRU8wMytLTjZv?=
 =?utf-8?B?ZVBGQzNZYTREWG1WQjNKVzJpbFB3b25tNVUyVUV6RFZzNGpLemVlWkh2Wm4r?=
 =?utf-8?B?RE9WUmU3cUNKUGcxQTJPY0svUGtRNlhBd1k4VG9QTTIvbkYyei9LNWtBdzNx?=
 =?utf-8?B?MVlvN3pyZzNCelg3WERzU3V3U0RPcDZNc2RMeE5jN2l1YjBjQnExY1ZZMXlj?=
 =?utf-8?B?UU84MWw1TWdzdUFGMmZudTljN1dGSzBQL05lM1Z1NXlMei9nRE9USUpvR2RX?=
 =?utf-8?B?ZG1OL1JSUnFsQ0h0amZUd3RpWXpYbFlJMXVSTmJOVU1RV3dwbGdkZVZHRmNk?=
 =?utf-8?B?eFVjbzRBV1dpSlk0MXhGd2RsZFJjTUU1Y08wa0plSGpZdktTV2wwVWtBc2xm?=
 =?utf-8?Q?M1aU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDlhRy9aTkdhaitXMEhDNnBQaTZrYml3Qlh6ZS9UK0p3Q3FheDQwM1hQRVhV?=
 =?utf-8?B?cGdlZTNQRDk4OU9CdGxNeXVsQWloQ0NpazRGa2wyL3hDS0Y3eEhBZC9BcVV4?=
 =?utf-8?B?MGVKaktJODdrZXlscFI5bnpmbTh4REl2TkF5bU1NcHZBbzhxbHpnUG5Obldm?=
 =?utf-8?B?YjJaNTgxYmI4VkJGaFg5dGJQNk9VTUdzTiticU5LUmI2MzNJNXRtNHFRVGlK?=
 =?utf-8?B?NGVnRGVEMG9WTEd2blo3OXVqdllNUE9lNTdRbzR3KzZHeGV5aVlpL0JlVnhW?=
 =?utf-8?B?QzFxVXBLVXVhcll0U21kY05NNTh3Z0t4ZkMwaXE2VVNRb3doMWhMb2hzUXNT?=
 =?utf-8?B?YkRLWC9YZ1FtRCtoL0h2SGV0cGlNcDdWenZZeGhhSkp4T2MvR29WMW5iRUd3?=
 =?utf-8?B?eFpHREZNdDZtbDE4WHlHbFoyOWpqclpGZnVpb0hYZDVOUUhZTjByU2FqdE5F?=
 =?utf-8?B?VE5EdWhCWXBnOFlzcDNXNW1ON0dhZXIxNkdxY1A4UHBhUlVsaGs1WG9IL1oy?=
 =?utf-8?B?Zk10S2hQRlJtOEVxZ24yVzZQc25NTFdYcTArQk93cE02VkFONlBqN085MUJw?=
 =?utf-8?B?MWdxc3luTUhUZTUrbzAvVDJzSVVLM1k3S1YxR3BmaldVUXJSNnVEWmYwdFhY?=
 =?utf-8?B?RUlaVlJoMklma1lXTlVWU1RxTnRQSCsxRFpoYmlpM2c4QTV2bzgyYjQvUlhS?=
 =?utf-8?B?YUl1b1pBdVlESnFPZFdwbmVaS0xHWUNPTEFlNGpiM2daRG96MDJFTUhSTnRv?=
 =?utf-8?B?b0s0OThLd1N2Y0VGK3JQcENDNW1vL0h3TUQyQnl0VHQ0ZnV4eHEvY3VoVzZm?=
 =?utf-8?B?UXc1YXJJVmVxNktxU29iWUMvSW8vY3VLUjVFVFRzQzlyL3B3QkQ5UXRqMEp2?=
 =?utf-8?B?ZFl3U205dXk2eC9rT1BqdElqRDRUcE54UHRRcjJNbkUxWTdaRFdmbHlUT01i?=
 =?utf-8?B?ZjVtNWF6YVhzRWZsVVo2U3BMSlVhNGRBRmtVVURoT3dkSVJMbkhwcUxZOGU2?=
 =?utf-8?B?TSt3K2JKMzN2MFFDTjhaSEhjNjlLWnRGMEprcWI5eXlMVHh5bHdmVDgwMGI3?=
 =?utf-8?B?djROTGFkS25Nd2NzTWhBU2tGNllMRWZUQTNZSE4xN0hFM2xmQ0U3TEJ6TGJB?=
 =?utf-8?B?REFpclA1cy95VUdQbmtWQXkzbGVMVlF4NXgzV0VrcXhTU1NlekxaTFVXUmZh?=
 =?utf-8?B?VFRwRWl2dGxEc1hXQ0QyOUFlNUtEb0JJM0hEN2wrQkorcm9uTDdvK1BUQjI3?=
 =?utf-8?B?Umx5a1hVM2xjTS9tQTNpZUFTSEpCdUFDeFJiUDVwYXhIOFVUbGZLMXZsNG56?=
 =?utf-8?B?Q21TM3F1R1VUb0N3cVFUSGU1bnNHTFRoS3BBcVlTcW1yRkRjOURVelVhL004?=
 =?utf-8?B?V01JeWRNM3Z5QVpVM0x3blVLUlZPaDFvWTdRTktoL1VsYk41THR4SktJaGhP?=
 =?utf-8?B?T3RveVdEVE5rY1d0ZGpHdjhkSmZQVEpYSURhVkpTM3ZNNXY0MkhlTUVwajBH?=
 =?utf-8?B?VW1Vd3lKL2JJT0tvMTA4eFA3NU93S0VJUmdnN3dwNUIzNXRLbC9MUnRPTzdB?=
 =?utf-8?B?UVJYRW9kcjIxa1hYNGpDaUhNRmFTK2EzS2VNeTJhR00xOFRndi9Cc25rbG82?=
 =?utf-8?B?UkhGbFBvY2t3eC94Y0hVMjNLcXNlSjkrSCtYaTlyQVU1aXhPYWVlZXV4OGVv?=
 =?utf-8?B?VUJYT2Q5Q1gyU2hwUmtkSnpWNGZ3UnBoWE1ZK1RjTFJZS3BrQzg2SlBtUEI2?=
 =?utf-8?B?ZUNic2VFUUlCMXpNRlBxUUZ0Q0ZMcDNySGR4dEZybDJ6b08yRTNPQXZqcDlL?=
 =?utf-8?B?REZDZjlRZ09TZFpyTGxPejNHb01lWUVxODIxaG5mTzk0eHVENElFYlNRMUhs?=
 =?utf-8?B?elR5K1UxenpQZXRpV0M1WG5hNTRsNy82c0wvemJ4M0pLa1NUTThEZEpiZTYx?=
 =?utf-8?B?amI5V2dSdkliYUUycGtSMUQ5TXNucXgvenhEcVlNK1ZlM0ZsUHQrd0YrTXk5?=
 =?utf-8?B?WnFkR2h1cUNNcG92UVNRM3g1YkdKWjdHb2lpRXA5L0kxd3MvMDNoRUF3SEZ6?=
 =?utf-8?B?cnZWM3FFak5yQmdsbVIwS2dCT0FyN2xyZGxHWkF5c0RHZFhDNUovM3Q1Q0Jo?=
 =?utf-8?B?a3lrQ2w0cEQ3ZXhqVnd1ekV0Z2RSR29KTy96YTg3ZEpvU2ZlV053SnZHZWsy?=
 =?utf-8?B?dHB6bC9wM2pLbFZqQlNNSGc3OW1KSVovajNzODJ5OTBremdDaDZvTHRMcEN2?=
 =?utf-8?B?aTVmd3JWY2xOdnhxLzJOU2pKNVB3Q2Z6cCt5czVLOTlDQWx3djlDVTVtVG1Y?=
 =?utf-8?B?eEVmMk5nck1XWWNwUmZRN3JPOGR6eGp4K0lHdk85ZUw2NmJkTHRPdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5e2de0-3952-4915-6196-08de5e6548e2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:03:44.1926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCmkDQOh7sv90VXHdmIqK+k+Phh3qs4X7mVKMJuKpiiRpQDXSq624vn3OYZ+NmnBGAf3xzESA2bO8Sqay6sAEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7357
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1ED30A0F98
X-Rspamd-Action: no action

Hello,

In XenServer we have seen the watchdog occasionally triggering during
domain creation if 1GB pages are scrubbed in-place during physmap
population.  The following series attempt to mitigate this by adding
preemption to page scrubbing in populate_physmap().  Also a new limit
and command line option to signal the maximum allocation order when
doing in-place scrubbing.  This is set by default to
CONFIG_PTDOM_MAX_ORDER.

Thanks, Roger.

Roger Pau Monne (3):
  xen/mm: enforce SCRUB_DEBUG checks for MEMF_no_scrub allocations
  xen/mm: allow deferred scrub of physmap populate allocated pages
  xen/mm: limit non-scrubbed allocations to a specific order

 docs/misc/xen-command-line.pandoc |  13 ++++
 xen/common/domain.c               |  30 +++++++++
 xen/common/memory.c               | 104 ++++++++++++++++++++++++++++--
 xen/common/page_alloc.c           |  30 +++++++--
 xen/include/xen/mm.h              |  14 ++++
 xen/include/xen/sched.h           |   5 ++
 6 files changed, 187 insertions(+), 9 deletions(-)

-- 
2.51.0



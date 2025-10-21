Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9E1BF5496
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 10:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146879.1479226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB7s4-0008Ik-C8; Tue, 21 Oct 2025 08:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146879.1479226; Tue, 21 Oct 2025 08:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB7s4-0008G4-7p; Tue, 21 Oct 2025 08:37:32 +0000
Received: by outflank-mailman (input) for mailman id 1146879;
 Tue, 21 Oct 2025 08:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5X6=46=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vB7s1-0008Fw-So
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 08:37:30 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a368cc6-ae59-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 10:37:24 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by SA0PR03MB5404.namprd03.prod.outlook.com (2603:10b6:806:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 08:37:19 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 08:37:19 +0000
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
X-Inumbo-ID: 2a368cc6-ae59-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2paXRsfrTXAii+P90vrbJnePOArh502OJxXM/UM6+Eh9F00bzIcyEzUyVa2/chhbI99/XpO+l5hn2Vk2M9OmcxYP8/La4vMgcpZx9oE/uGMaqgVud4YTtHAgt8hXPMeQmfrlMBM/KsBrv/bjt/HVxFTTbZ+HdSUyfz9iBxFvgFnv1lLQ9YJbFmuW/6x63gGEGkSvUd7OmUXi3CuKgO5yJhRMhesF5oIO8OE0ejA9YyKnL7gG96/NGm4AguhgLpX8ozYcIzEGcyWY4rBkb7EvwQVmwSNWond62puKizfmkDzVebc5eLXVNqErqv2U0Ee5P6xOJKt7dSf4qm/mQvB9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LTqibx3g6wnI108TYsMuXRkTbyKk9frSN9hWkQXLeU=;
 b=atzkQ8JyJ52xo6jBnQx95/NXu3I5KT+bAvqTpWxQ2ozifHs06jaJO1jXM5YwioNoh+857jD8uYD/EDaKGRrC1lek9BlXMrZ3fdS9LcMvYs4hT3GWPe8Aw6TkTZkaQ0t22sv/0AE4PoJN3X+EGubj4SM1digPxDHpLENbopjY8/XJ93Fmd91qEimaw5HA1BLufN0B7q56Hyk6bxZEgBTewGPyaqNZvJt6VV5oo0PqGY/FdSQPgOICKgqyyYr9GOsYGcSC1grzhIIfTVGcE8P1Fnh1nnmCdF6cayupe9igXWHmPlQnrIsk72vuJSK3BopkUUAkjXkVhuF97sJaYFMJ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LTqibx3g6wnI108TYsMuXRkTbyKk9frSN9hWkQXLeU=;
 b=T6fxiXjYTVInKiB+sCsx/tl70tWKiPn/tJ6F4onbD1xfs//N38YYijNlPDwzjjp3lMuNNJfXkPbKh1msIx4WwuAyRkztEFqzsPRdHeuXvhJZ6OVW3KRtGRs5wEhhVYHloXsZ86LTSztPOl1Yoq+BOO31yzN06Rofjo8z5foo59g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 21 Oct 2025 09:37:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
Message-ID: <aPdGOSXPvrRH3SOM@Mac.lan>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com>
 <aPEc3VWLI0ofq22f@Mac.lan>
 <39f00b12-a3f7-4185-a8fa-2c99c43695d9@suse.com>
 <aPH8Waqi5hJyCuzO@Mac.lan>
 <1e14d71a-4c23-46d9-a123-475a22bdc856@suse.com>
 <aPZaDJZiPsOazcHN@Mac.lan>
 <c27a671f-0001-4c32-9fb5-41b19a3f0a49@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c27a671f-0001-4c32-9fb5-41b19a3f0a49@suse.com>
X-ClientProxiedBy: MA3P292CA0004.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::19) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|SA0PR03MB5404:EE_
X-MS-Office365-Filtering-Correlation-Id: 48f1f7fa-5dcb-4942-d159-08de107d0b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmwwQVJBOTFnNVJUaDFUekJFSTB0Sk1DZmNIcmRTaTUxNXdaZGx4bmZjU2lQ?=
 =?utf-8?B?Uk9Ub2RpbFRBZFB2K2Y3UlhMcGpFbnlPb3R3bDU2dElUNmxwbCtScmc3cjZl?=
 =?utf-8?B?Y0Z1YlV4ejFsOWx0QUx3MjV2U2pUV04yaDQ4RTUvOGFjRUsvdTB2SXdGd0Vo?=
 =?utf-8?B?VUtOWU9pcFlveU9wdGY0cmpZL3phd3VzK2phejkrbWV1UEQwVC9rVEljbnV0?=
 =?utf-8?B?ZTZIVTBoME4yRnk3ekdTMkI5N21ZTVREUlZPQUZRZEVFV1ZwZW9zei9jNWM2?=
 =?utf-8?B?V2N1Q3U5OUIzWGFubnl5VFNZNG9PTGpnVXl4N0RKZGVzUm9pQWZ1czZZUXdY?=
 =?utf-8?B?Z1VsS1piaUU4S1ltUUl4RGd5TXZZTXY2T3c2ZHc1aldFeE5Ibjl4M0pzdE5k?=
 =?utf-8?B?b1k2bDlrUnRqTjJ0bVJVR3RRQlcxb0ZKWTdNV1hHV2U4V3M4WXM5SWljVzYw?=
 =?utf-8?B?eEhmN1dudUlva25RbGQ0Sk9JV0dYVjZWZnQ0V3VqM0J3dGhuUjRQU0N6Qzdl?=
 =?utf-8?B?QWZRb3pHUmduTjYzQzZvb2hRUU1HNHJ2MnJvZk5WZEZFL1E2MWhUQUg3M0RQ?=
 =?utf-8?B?cEtZdWNjdm84cUg0dXpScWN5QWhwbGdPNEo4WnlielNZSm43UFA5L0d0bFlu?=
 =?utf-8?B?WTA5Vm9WYzN2WC9aS3JkZTR4cFkwZnliMmNCYjZyRmtXSjQxTXl6UmxCRldo?=
 =?utf-8?B?bm5kcndxYkNDYnFCSzl5MFpncy9RNm9BSGZXTkcvSEYzZ1RZd1k1K015eWtT?=
 =?utf-8?B?aDZNQUd1cTlSdWdxV2xnc2dsV3NRUktqay85QTY1ZlpKdmd4UlU5S1EzTXh4?=
 =?utf-8?B?anpVVnk2YzBmemJsTVdYc25HMkhVLzVlaGFPWThsMGJhZFRkajZTbWFlUk1z?=
 =?utf-8?B?SStYdUJDWEROSDE0cVRjWStXb3FsVy80WmE5eGhwMFBCTGxJeUdXZ25mMys2?=
 =?utf-8?B?YkkyeDJnd3EvQi9NNEN4eXczV1ZEOHB6TFFxMzdRWVUvTTRqVDBZdWJsckFV?=
 =?utf-8?B?L1JtaWF3VlhiZVNMUTc4a2svTGRDd1hGcW9FbjRZa2p2VUtjYUJGUnkvLzZO?=
 =?utf-8?B?Y1l2T3J4QWlaVHptWCtiLzdxUkxOdkg3UVhjenRSWitCSC9QWE83SHQxYjJH?=
 =?utf-8?B?ZHdJNHdkamJsdVdKQS9ycXpwS0IvTEtpNnZsbU9CK0RUOFd3ZUhEcytCM1d2?=
 =?utf-8?B?V0JjZkhlMTFqZGswdlM2Z2cvOGJiT2xOUmZwNUp3YmVWL2R3UUNCSEcxdC9m?=
 =?utf-8?B?dlFJTGJvUkpzUThUd0wwd3lUUU5IZDBEV01TblUveFM0SExjbVluZm9QZ3Jm?=
 =?utf-8?B?TWkyWDQvUHBWLzUxaUU2UDFKZ0NHTDUyMnpSV25lblU0TWJENFR1cnlHVW9q?=
 =?utf-8?B?eHVRTXBSMy9DdDhFUklGdVYzbjd2RXg0RUNXL2RlTHZxU3lPWmEra1MrOGZv?=
 =?utf-8?B?elJUeEx1SVM1MEs4SDZGZUVWM1BXOEtLeGJJVkdJQ25oclVSYmhYbWwxVzRG?=
 =?utf-8?B?a2NOUEpxZDdYcVJqYllkS3REZ1N3UW1WcXFjQWVVRkhVMkJZNStXV3NuNkpv?=
 =?utf-8?B?Smxnek1yb25pVW50RFhra0R6NS96S1NVMUx3d2JnREZiRlp6eGNaN3U5c1dp?=
 =?utf-8?B?cGxVYVZ0NTBaZkVLN3ZPUW1xSk1ZeFlYK2ZMaFh5TGRMWTBHc0ZCbGh2T1Vz?=
 =?utf-8?B?YjVIMGNxcmtLdldxWWllVGsya01KYmJDLzZyVzJWQm1vM2JBRE9PQ2VyWk8w?=
 =?utf-8?B?a0daTVJGdjVwblcxNGdzNXRHQ0dncDNaWWJtc0RFUC84dy9pSDRyYlNrczBr?=
 =?utf-8?B?MHhkUVh4Y3ViQzNaL1RYUUlTa1dDcXBoa2EzU1NXcE1YcitLVXFsem95Ni9E?=
 =?utf-8?B?MHZvc0pqS01Pc3l1MjV6clA1bDNyR0J5Wk9Mbmh5WGRKblVNVkZHQnFUa0NZ?=
 =?utf-8?Q?aIGTtiFj/Tu+Qo+48ajf12KEuRW4pMQs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGhUUUFmUzd4ZHRFZnZVdFE4VGs1WlZXUE9RVEtUL1NTcjFYRVFGQ2xOV0hz?=
 =?utf-8?B?NjIyQVQxQ0U1eDAyZWdhVkJLaGE4WkQrc0pLM295L21wY1dsQzBQMDdocFdk?=
 =?utf-8?B?TWFWcWV4d0sxUmo0RUJiYUFCeFZyN2xKWFVHWlE5U01yQms0bitmMjFUMXM3?=
 =?utf-8?B?Q09YZUxuNHJnUFBiQTJZRWVzZTE1NDJZL2VMMFM0cFUrSTJvbVk3ZTU0VDcr?=
 =?utf-8?B?YWxEcmlKaStqaW85L1pyenUxeGs1bE1WU2ptbjBFYml5TFJvTVBVQk1kV1Bu?=
 =?utf-8?B?K0hCbkh5NmtVcVdyNVZHWWkvVTZ4TE1nYkxScXA5N1ZZeDFvb3dvZmFxaXMv?=
 =?utf-8?B?N1lUc1R3YVpFaHhTZHdHZFF5MHIxYjVqQWd5T3l6ZllKL1lnamNrdDJicHRQ?=
 =?utf-8?B?WHAyNmluZXJHREgyM1pUVm1CS0hQb3FWMXhleHZQYklPendiM1o2SG5TakZl?=
 =?utf-8?B?Tk9xak15QlBsM0JJOTBXYUNJbTd5eld1REV3dDlHbDd6ckhnV1pUZFVNK2lv?=
 =?utf-8?B?TDZ2bnc2cDN4SXpNTlNCREEyNmJScmxjTFc1bmJiR2NqdmYxbmhqb0xkN3Fa?=
 =?utf-8?B?RUE4UHVCUUZ6MXhNdDBOK2JOQml0SEJGYllJNm5idXU0TnAvYTg0WGd0cjhG?=
 =?utf-8?B?cE40T3MxVXg5WU91Zkd6S1FkRUs4Q2xPV251dlhGc2tHcDJiemZnejZkRUx0?=
 =?utf-8?B?QlQwZ0t1ZFVRcndIY3EyQ3VGUVlkVERUeFYwbkhXV2lwV1F4T0RBR05mL2sw?=
 =?utf-8?B?dzlDQjBwdnNhYllEODVjb1FuMzRvOW84cUFJYXhLUlBHeUdGaTlpQ21BK3lN?=
 =?utf-8?B?T3kyK2FLbElZbnM3b3gxOFBsWlI2dDhNUzZwMFd4a2tWYkc3eHpCTXVnNUd6?=
 =?utf-8?B?UVRvK1ROZlBlRElKaDB6UXhwU3p3OXJTRnBsbUpIMFR0cFpkSEorYzJqN2Qy?=
 =?utf-8?B?ZFVkOXBmekt5b054MXlMbEFvNTI4Y1J4dXVubDRCSThvTTNFSDZJYUwwL3Jt?=
 =?utf-8?B?SnZQRGhQSnBZUXNCZDhrUEZUemRTc1ZnK0RxQXhtdXluVkw1aHlQQVFPbUxU?=
 =?utf-8?B?cTRFQlgvOVlmY0RHNEMvUm5uL1ROamR1OFlJbmxsZ1hsTXVYY1dHRE03WWZy?=
 =?utf-8?B?N0x6aW03REk1MFhvWTd1V052NzNmSTNxdGg5OE0ycldWNmFwWm5kZHVhWHJE?=
 =?utf-8?B?VEp4a1Rmc20yd0dXdjYvSnU5WkU2WHp3RXpiWXl5bENmYUI2UmZpWWxHd1B3?=
 =?utf-8?B?VW91bW1RVDF2VWVaWU5RVmZrSlZyK1h2MCsrNEZDVTg4UGRSYjdYVWlsaDQ5?=
 =?utf-8?B?L1FjVGxqV0JXeGd0Tnpvb0Z0amU4aHFJV1ZSR1c2ODRJUENFbFV6b2pHYitE?=
 =?utf-8?B?N3VJeUMxaWRyTnAwNENRNkFFWWFPSTZuZ3VUL1UrTzYrSmhjRUFhOFVkRVEr?=
 =?utf-8?B?U3FEZVordnNRdXhJSkdQQVozaHN6aWhBWkw1L2ZXMXhndjV0cTVvNEJUdFhH?=
 =?utf-8?B?OGZEcGJLajVhU2lZa0tzZ3g2NWNCVnJ4VEtMTWIvdk5pVTNyK3FGdXBaeS9M?=
 =?utf-8?B?MHloTkZNeDNWMDBSNWxOZW01aHZTNE5uT3FNY0pzNmNuTVlxRGIyVDczR2Mx?=
 =?utf-8?B?SjZtRzQwRkx4dE8vQ0dTVUNHa2VXY0JxeHNhblBPdVBmQ1ZVdFRaUVJjdmV6?=
 =?utf-8?B?cVZ5dm9sM01hMHNJTFdRRXNQUjU0S3NaaG95ZE1FZSt6cnR0UFc1dmFMaFRz?=
 =?utf-8?B?bEVSb2hjT3pQTlhNT2RWWHBwTWt5OW9TNmhvc05tRVNUZC90QWxtWThlckJx?=
 =?utf-8?B?V2Z3MFNFOVNqSnBGNHYrdmV6TTFmem51dWQzaXV0cUMzeVl6K2QrcWJpOEpJ?=
 =?utf-8?B?NUprVkdXdExUOGUwU3VZMmhKYUdaMGV5eUtLOTF3b1llbHNIMXhkc2s2aWk4?=
 =?utf-8?B?dmNuOW9YWGc1Um5XaUVYQUg3V3VJTEVwTGFiaG13OWtEYzNHSG9jcHQ0WXFC?=
 =?utf-8?B?eU9TUzJuWEJQOC9IeC9wdWhjWFZIL1Q3OTVSM0xIdFdPRWRhTWlvcXZ6c2x2?=
 =?utf-8?B?SDlWV2FoME5mZzM1ZDVxSUFQMzZYSmFCSE1Qbk8zeHlUeDFtNElzc3hFbXI1?=
 =?utf-8?Q?jY1YFzjS2nkEUml+uYH/A01/X?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f1f7fa-5dcb-4942-d159-08de107d0b7c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 08:37:19.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b46mSG8LFwjB/btf4KZLivw5pWaoNs7XNBP2PtJQPMMdHB78ZpHglqCqvJGiO1arEAMsrUPQa0D8Txtce1ndbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5404

On Mon, Oct 20, 2025 at 06:05:04PM +0200, Jan Beulich wrote:
> On 20.10.2025 17:49, Roger Pau Monné wrote:
> > On Mon, Oct 20, 2025 at 07:53:51AM +0200, Jan Beulich wrote:
> >> On 17.10.2025 10:20, Roger Pau Monné wrote:
> >>> On Fri, Oct 17, 2025 at 09:15:08AM +0200, Jan Beulich wrote:
> >>>> On 16.10.2025 18:27, Roger Pau Monné wrote:
> >>>>> On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
> >>>>>> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
> >>>>>>      spin_lock(&desc->lock);
> >>>>>>      hpet_msi_mask(desc);
> >>>>>>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
> >>>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> >>>>>
> >>>>> I would set the vector table ahead of setting the affinity, in case we
> >>>>> can drop the mask calls around this block of code.
> >>>>
> >>>> Isn't there a problematic window either way round? I can make the change,
> >>>> but I don't see that addressing anything. The new comparator value will
> >>>> be written later anyway, and interrupts up to that point aren't of any
> >>>> interest anyway. I.e. it doesn't matter which of the CPUs gets to handle
> >>>> them.
> >>>
> >>> It's preferable to get a silent stray interrupt (if the per-cpu vector
> >>> table is correctly setup), rather than to get a message from Xen that
> >>> an unknown vector has been received?
> >>>
> >>> If a vector is injected ahead of vector_irq being set Xen would
> >>> complain in do_IRQ() that that's no handler for such vector.
> >>
> >> As of now, setup_vector_irq() makes sure the field isn't uninitialized
> >> (i.e. left at INT_MIN). With that change dropped (see below), there
> >> would indeed be such a risk (on the first instance on each CPU).
> >>
> >>>>>> --- a/xen/arch/x86/irq.c
> >>>>>> +++ b/xen/arch/x86/irq.c
> >>>>>> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
> >>>>>>          if ( !irq_desc_initialized(desc) )
> >>>>>>              continue;
> >>>>>>          vector = irq_to_vector(irq);
> >>>>>> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
> >>>>>> -             vector <= LAST_HIPRIORITY_VECTOR )
> >>>>>> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
> >>>>>> +                        ? LAST_HIPRIORITY_VECTOR
> >>>>>> +                        : LAST_LOPRIORITY_VECTOR) )
> >>>>>>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);
> >>>>>
> >>>>> I think this is wrong.  The low priority vector used by the HPET will
> >>>>> only target a single CPU at a time, and hence adding extra CPUs to
> >>>>> that mask as part of AP bringup is not correct.
> >>>>
> >>>> I'm not sure about "wrong". It's not strictly necessary for the HPET one,
> >>>> I expect, but it's generally what would be necessary. For the HPET one,
> >>>> hpet_msi_set_affinity() replaces the value anyway. (I can add a sentence
> >>>> to this effect to the description, if that helps.)
> >>>
> >>> I do think it's wrong, it's just not harmful per-se apart from showing
> >>> up in the output of dump_irqs().  The value in desc->arch.cpu_mask
> >>> should be the CPU that's the destination of the interrupt.  In this
> >>> case, the HPET interrupt does have a single destination at a give
> >>> time, and adding another one will make the output of dump_irqs() show
> >>> two destinations, when the interrupt will target a single interrupt.
> >>
> >> Just that as soon as the interrupt is actually in use, what is done
> >> here doesn't matter anymore.
> >>
> >> I continue to think the change is correct for the general case: I'd
> >> expect these special vectors to normally (just not here) be used as
> >> "direct APIC vectors", in which case the IRQ does have multiple
> >> destinations.
> > 
> > I think it depends on the usage of the vector.  There are indeed
> > vectors that are active on all CPUs at the same time (like the current
> > hi priority ones).  However in the case of the HPET vector that's not
> > the case, it targets a single CPU specifically.
> > 
> > I think it would be best if vectors that are used on all CPUs at the
> > same time are initialized using cpumask_all or cpumask_setall(), and
> > avoid having to add a new bit every time a CPU is started.  It's fine
> > for cpu_mask to contain offline CPUs.
> 
> I don't think so. There may be less dependencies now, but look at e.g.
> the check in _bind_irq_vector(). Or this loop
> 
>             for_each_cpu(cpu, desc->arch.cpu_mask)
>                 per_cpu(vector_irq, cpu)[desc->arch.vector] = irq;
> 
> in _assign_irq_vector() (that may be fine because of how the mask is
> set just before the loop, but the loop itself very much assumes no
> offline CPUs in there). The most problematic example may be in
> fixup_irqs(), where cpumask_any(desc->arch.cpu_mask) is used.

Then it looks like the comment ahead of the field declaration in irq.h
is wrong:

        /*
         * Except for high priority interrupts @cpu_mask may have bits set for
         * offline CPUs.  Consumers need to be careful to mask this down to
         * online ones as necessary.  There is supposed to always be a non-
         * empty intersection with cpu_online_map.
         */

I realize now the comment says "Except for high priority", but we
don't seem to make a such differentiation in most of the code (like
fixup_irqs()).

Hopefully this will be way more simple if I can get rid of the
cpumasks in arch_irq_desc.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zXeDHyIymGleCgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:06:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2228166A1B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 11:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236971.1539447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNOD-0006Gv-DS; Fri, 20 Feb 2026 10:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236971.1539447; Fri, 20 Feb 2026 10:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtNOD-0006Ei-9S; Fri, 20 Feb 2026 10:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1236971;
 Fri, 20 Feb 2026 10:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uNHm=AY=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vtNOC-0006Ec-0s
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 10:05:36 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2b16d52-0e43-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 11:05:35 +0100 (CET)
Received: from BY1PR03MB7875.namprd03.prod.outlook.com (2603:10b6:a03:5b1::10)
 by DS7PR03MB5607.namprd03.prod.outlook.com (2603:10b6:5:2ce::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 10:05:31 +0000
Received: from BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c]) by BY1PR03MB7875.namprd03.prod.outlook.com
 ([fe80::20d8:6571:d4aa:166c%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 10:05:31 +0000
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
X-Inumbo-ID: b2b16d52-0e43-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNJWQ3Np4K/cgpJQuOrW4wuKGGzELItkOx05Yr81Upm9CPrfZ0NNf2T5TCAPT44As0r5KP5VP7MHUXHW3L+gaMJic7iIhlmhw9DmYwY8X5xH8z/4FFA1Erto5ctmJhp79s0mpSFBRmiZNS2Um8pjQGj34gqaugj66uZKJ5Sh3NVdCMpLm+mNTeX+7GJfSWGPn784oKEfDOMw6sFE1wltghfF6chjX8YDsQAqvVgYiptxtiIFh/147xMK00sI3q0hero9rUqTD9KuTfnN39AiiAv5ctGpUToMS5oRQfdPjWR/lhlp7oJX8+x0BjcfPLUVmN1cnLvC2IwGEuKGJbu4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyAS27eQNRwQ8J599vmW4Ox6jx0UwNKLDJ6E1izmSqo=;
 b=MDAJVTDyYFy55KZ1Sqkmup4kf2Ye7gD73SIsAtHQxQaUi0iG0p3dYvPTgVn41nm2Xi30fUhH+gkUrxrEyGUFmvPwplJcwP9K1ObbScoRd9GISQIVD2AEylQMJRoSROpCTUH21rM1kzfBvTTWKQ32jxSmScLNQmjWSfBPbprUf/+x/wa2mRqgETN4hD00MoBS8G4uDibDrOjY/Hgj1vtc8p3vzb+7WlJGRWVW/CcKRa/XyKM2FPOiOhpewQCHJ7U3FFOTw8QNqkBFwX6/Y+Izbfsaezuw1iI2+mTpi1Avnt5HnkCVwKBAoxYk9BrDXjmm7BUZ89ScH6uN3vewa/RQFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyAS27eQNRwQ8J599vmW4Ox6jx0UwNKLDJ6E1izmSqo=;
 b=HX+mXWNfMBEijVZGRDk3L52/uCDtmpezH8jDNLorOH6FBPx+qGLd4vY7KbrzSTYvYh+BuI9od1mjavHQavlgPFG9XtSNyNdFVlXd+CS2zv33yqNz5Ipnh3tVQSOZ4bbW9rqraaC7Aw/ottxVo143cXtgcNuC3K4LcWX3mCmzhks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/p2m: clarify foreign map handling in p2m_entry_modify()
Date: Fri, 20 Feb 2026 11:05:09 +0100
Message-ID: <20260220100509.49700-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA3P292CA0038.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::7) To BY1PR03MB7875.namprd03.prod.outlook.com
 (2603:10b6:a03:5b1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7875:EE_|DS7PR03MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2d8e54-e516-4715-79c8-08de706794ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVc1TTVWRSs2WVJhOU5QaTk3NnhKWmtLRmdlMDdTa1N0VlhJVElqbFNlRkgw?=
 =?utf-8?B?aXVES2JUcGJCbXVOa0dGSUc0cXNiZHFPdHRTSWFudkkxakFGcU5udUZZTEhD?=
 =?utf-8?B?cGNDWXdMbzIwVmNuTEZzZlpNVmhZWnhZamtUU3VyTktjaXk3eWVDN2JVWU5S?=
 =?utf-8?B?aTVMbTQ4UE5QQWdybkdHL2JLeHREdGxoRHUyREFZQWNySTgvVDFoR0ZiUHlN?=
 =?utf-8?B?U3FJYWZvR3ZrWkJSYzh5T3JSZENGenFWTE9tSkdRdHlSQTByamtTRjlxMVlx?=
 =?utf-8?B?R1VxL0pCamxlUENDU3Y0YU1KaGVmOXZsSHIvOXNzMm9HbVFEV21qdis2SnRq?=
 =?utf-8?B?NEgxVk9zaHQyN1ZZRUNoeFB0Tk8weno2RVJGdmROU3M5bGM4UVg4SnVSbEw4?=
 =?utf-8?B?K0NJSzNYdlJwNGUrU1NPR05oOW1FR2NLL2x3amNCTGtXUEpSNWhrMFlhaWFD?=
 =?utf-8?B?eXNHWFhnanZ2Zk80dGUvbjNFaVB6c2xBelpaSkd5dk9NM2NjVWxqaVkveVFF?=
 =?utf-8?B?aWxCcnU5b01Vd0NudjdlTDhWQXIvSGQwRXRrRTc3MElaNmVaOTZ2WWdRY1Ra?=
 =?utf-8?B?emExWHJ3WlpKcy91UEZ6cUIxb3JpdU5BZXB4OVJnb0tCY2FVQXEvcHNtQ1Bi?=
 =?utf-8?B?NXo4RnA3QmNFbS84cU9ITWZlSUcwUXZjT0lrVUc4YjkzT1kyaGZzQUp6dGhk?=
 =?utf-8?B?MlVaUTZDaGFmZzRuTXhldFlOY3VselBTODA5NlZUVVlENEpEcDJOOEpabEdJ?=
 =?utf-8?B?VU9CdWYrcUZUVkhCd2ZKZjZrcnZKUHRZV2xwZlc4QVNBMWFtSTRJVjZJaTZC?=
 =?utf-8?B?VEVja1RBYWNRdC9MblRtM1JrZ1ZuWFg3U1FpaU1WRGUreFdLQWJqeW0zNDRn?=
 =?utf-8?B?aENvcFByZzdyNXkxWHpnWUxMNDFPUSsveHVoWWtEMWhrWlMyNzZZWHpIcWRM?=
 =?utf-8?B?UFZLajdGQ3NnNDh3Z3F0VzdoSlJOMmFnRFlRZVZlSEVCN3JnN0xHYTJHcWZq?=
 =?utf-8?B?Z3kyVVA2ZEJPTDFOYm1teXBzUU5lQkRsRmtsRERvdVNEZVN0dnBNSzFQY21Q?=
 =?utf-8?B?dDdTL2dyYVNndjZJYXlaUmlhQm4rK2pUNXhxM1I5VThJZlRsNHZGMzJkOXFo?=
 =?utf-8?B?SmhIZlZRMXZtQjhnV1F6OEQxKzZweUNSYlE4dm5kM004NzYrVEt6NEpnb2JR?=
 =?utf-8?B?U0dwdEtzc0JoOEtOU2xxUjlWcW9nVUtjWk5tOExYejJqb0FHdVpjOEQzK1Az?=
 =?utf-8?B?YVVYV0JKZzBIMW9qNTBSQjdNWVIrcjhTa3ZTd2hsVHo3MDFnMGJ3QzlRNTRV?=
 =?utf-8?B?VjhPbEtZTmFLVDN0RUFTVXJjc25QU2loV2FDNnVmTTRpeVkwc3M5RGo1RTNP?=
 =?utf-8?B?OVNwK1hQbGtsQXFPNDBhVTNsMFNnOS9qSWZKYTZ6Z1VISXUvdkNMR3lleGdM?=
 =?utf-8?B?cW1nQ2xUUitkVk5EdlN5YXJpMis2NlpYb0RMQ3FPTWswYlh5ZmpHdnRYTlFu?=
 =?utf-8?B?Mm5DdmtidEJvL1g1Y1U4Y1YvQ1FCZjRxcEc3bmRhSmJBNDJsenFhZHlIY2xU?=
 =?utf-8?B?S0lkaEQvOHZkMkIyUWpUcU5SeldQOS81OE9yUzFGYkd5dWFlRWU4OW5QRUxW?=
 =?utf-8?B?aXQrMVQzZ0ZRS0J2UXdCOVdwaHJYaFQxaU5TTlliZGs0UEtTbXNJd2JWVHNy?=
 =?utf-8?B?QVdVKzJ6eVUzRjJ6K0dWM3FrNnpPNjYxbHU0c1dXYllGLzI0aHg2aCtIVEtt?=
 =?utf-8?B?Mm1renMzeG1hZFQrZzQvMkR2QmxLNnY3ZzBTcGdpTCtEYjFialJpWVNPQ1F1?=
 =?utf-8?B?dXFTOVEzc3NKa3ZLSGJCdStwVENoZ2QzcVJyU2dDZUYwczUwM000dzVwbGRu?=
 =?utf-8?B?VGVZN2tDbWg1TVZVMWtuNHNUSnl0bEY0elpxNXhtYlpZeERhWXB5K1h3QjRH?=
 =?utf-8?B?T1NYa0pEWkpwUzgrdU8xbnhORW1STzRQdFl6UXdlWTNzVkVSMkplNWkxOHNH?=
 =?utf-8?B?QzFXaFliYzRaeUx6YThjL0FTZWdhdlFpUllydGltcXZ2ZVFOQWNhOStOd0Zt?=
 =?utf-8?B?RC9kMkg4UDJwMVRrdS9NYWNKMGRrb0tMcHd1ZHFNMnVDeFRQT2JFeEQ2UHE1?=
 =?utf-8?Q?Qaks=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7875.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0JWekpYZ1VRcHNQbkJ1TVRWRjN1czQ5MlppNXI5YkJ0Q3VTUE55cHdzeGRJ?=
 =?utf-8?B?Z2xZYi9PaUtSZklwWHRLY3RyeEd6bGJ1RUVIVTNYQ0VibzZuUFF6TkJIdms4?=
 =?utf-8?B?dWtQRWZmcU5CZnVSdWtEK1cxbGxpUDNwU0NXNENYaGxxc0pzaGNld3ZhQ3Rp?=
 =?utf-8?B?SGQzYTNzUzVlVmlXK201MFdtVmI2YUkvanAyZVN2RXAvc0RTbE1ESzgza2lN?=
 =?utf-8?B?RkxLSzRSQUZyMmFmR2hQM0MzZThZb1NkL3JJUDJSTTFJc2tBQ29uZGNRZWhZ?=
 =?utf-8?B?bXBDL0hNM3RDclZJWGc4Sk5YUCsreVBWanZKNzQxZDlUczRGTXlPZHNqWU5B?=
 =?utf-8?B?NkNzVXVBazJoYXJkR1hGd1pHVGp4TXhxQTc0Ty9zeUJzOE5oUU1kSkhxQWpV?=
 =?utf-8?B?bm5Mb2llZ1BPdUpEN2wrZlQ4anVsam1WOEViSkNKVVRnczd1VWV4eW1nOVl1?=
 =?utf-8?B?WGJ3VENHWDZzUDFQdlplR2xHSXdlWkUwdHpwMlcrbk9TMmJqU1lzZzFGSzF4?=
 =?utf-8?B?WS9XOVhkTnczNHlTWDVXNFh1bFZESG9oVHBpemVLajBkWDJ0cnA4NmlEcXg4?=
 =?utf-8?B?eU5BbUt1RUxyQWZRc0RUNnZHay9kbFhySXBVeEhUQ3h1bC9jVVBaMkcyOUpp?=
 =?utf-8?B?VW8wdTIzR0lOYjBNVlZPVnlGZEFEZHNESUQ5Y2VTRy9FMHcyZmJzbTV5bnVI?=
 =?utf-8?B?bDhzbmFoQ25UeE9GUWZBYUhrdHhFRnZEOGNXWEx0N0FpNDduQmdmYW42YlBy?=
 =?utf-8?B?SHFDVE9YWGF6MytmaXNybXRaWUY4SE9vK3ZEazhDMTRWYXYrK0xiV2tKb2Uv?=
 =?utf-8?B?MnpXU2VLazNuejZVdXR4RGgvZ0loWkdUdi9KTk5VdkFoVmQ2UE9jd2tiM1Zi?=
 =?utf-8?B?aWJHSVhUQ2pma0VDb0pKUlBxaEozSEFmbVd5ZzcyTisyVjBEbWJYWElFaCtT?=
 =?utf-8?B?Z0xmUjF5MHhxNFJzcTdzMFd3OU1ZOU1ydFErVFFMZ083cm5EZUh2STZvU09G?=
 =?utf-8?B?S0NYcW04alNxVVowOFN5VU84ZiszamdQMDl0SDZIVGVYbW1XYnZIWUtEakZT?=
 =?utf-8?B?YmdQNkZBZ2FuNE51WHN4T1dwblpxYmZiNC9vRHExaWhrYU9FMlFSdnhheGpj?=
 =?utf-8?B?MlJrb3BQTDNLV0xUZnU0NzZ5SXA0dFdRa0dZYnNXTmZtanJTbVVNajRyam1s?=
 =?utf-8?B?RkNvbFV3UmdPNkxCN1lHdGdZK05pRUswWk5uL2FVT2tKVW1wbDQ0aldGMmYy?=
 =?utf-8?B?RmxJL003QkdzZkNWUzRXcEJzZjBCUktzVWZ1OUxseFlmYU8zeS95QVBwVG1n?=
 =?utf-8?B?Mnpsa0J4UVd6dHRNNXpkYlprQjY2SDYvMTh0UDI1RFNsUU1ia24rWjIrK0NW?=
 =?utf-8?B?VXF3OThnaUo0Witnd21EbkxqZDVXcU1oa0ZYMGFkandNNks5bnM0TkxUYjkv?=
 =?utf-8?B?N0w0cVErQnB1SzdtUmk3b3B6NURYYjJNTlowQTNuTWlHVzYrNDNOc1czdkM3?=
 =?utf-8?B?c0lmUXIrU3pqdzh1eW5ianVnbjIwVy9uRy9jQXZYeldpK0JwNElvOUlVVm1w?=
 =?utf-8?B?VHlkc0RKdHkyZUVYU05mRHppNmpRYzJSbmhqblY1M1JBUnp3M2lrdm5RZ3da?=
 =?utf-8?B?UkpsUmt2ZVlCQ001MzF6YXd3Z1lSUS9aaXFVckFyQmFpckJaV2hJWHBZNTlN?=
 =?utf-8?B?QWk3RzVCRHl1WitSbThVM2VpQVZ5VUVvbm11MkxGM2tiZHYzMlhIbzhIYnhi?=
 =?utf-8?B?QUgzSkdRL2ZHem9LbUZvanh1cGYyWHhtZ1VKVEV2SmxSQ2w0K21VMExMS1ZL?=
 =?utf-8?B?SkxvbWlDZW9GQXMyQThTaXhtZ0J3MHNSN3U4eUU5cHNjZHAzVVllRTB6cCts?=
 =?utf-8?B?dE5DK0RxVGFqdFdJOXl1MnE0VVZXU3BTQlAwamZ4ZjBQaFNINFhjdGhkRmQ2?=
 =?utf-8?B?c3FWWkVLRlJJRjQ2ME0xVmtEczZJRjJDWFRYRzFQK3pDUEo2cFhPd0ViRVZq?=
 =?utf-8?B?aDlOUXhlMjVoNG1QQmJ0TDJXY1ZHTzVZWWkvdUZSRG9vbk9uZ21ORThwc0Na?=
 =?utf-8?B?elhUckhRaVNGa1ljZUJLUnphY0tVNFo3Sk9pS0plZmFoYWV0VXEzVFBLUDVF?=
 =?utf-8?B?Yis2RnR0L2UyY08xT2NJcUVjamtlL2pFS29UU3pQcjNrbTFCV21IZFhEc0V1?=
 =?utf-8?B?cXllSFZIQ2NrMEpLeWJLZUdUVnZISW91eVl4Vy9udGk3a05kVitESXA4NEpJ?=
 =?utf-8?B?T01WdnFMd3FvdWtmQ3JFbGEwZ0JmVW1wTkdXMVVuWGZjVkd4QmlXZW1JcU41?=
 =?utf-8?B?VFJ1czNGdEpweGhTek1JdVk1R3dTb3o0RHRvQmlQWVRMTVVEaXpMQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2d8e54-e516-4715-79c8-08de706794ae
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7875.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 10:05:31.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7p7ULqo8cLWaIrcFbUm+xNEF41pBQnFgAJjKD4DboY84WtaOUaUWaoBgEJn7p1HPRDzkjXbyvYhLuT2zzYe5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C2228166A1B
X-Rspamd-Action: no action

Introduce an extra check and comment to ensure the outer caller has
possibly taken an extra reference on the foreign page that's about to be
removed from the p2m.  Otherwise the put_page() in p2m_entry_modify() won't
be safe to do ahead of the entry being removed form the p2m and any cached
states purged.

While there also replace the error codes for unreachable paths to use
EILSEQ.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/p2m.h | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index ef6b02ff0bb6..1ceb248b9da6 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -1066,7 +1066,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
         if ( !mfn_valid(nfn) || p2m != p2m_get_hostp2m(p2m->domain) )
         {
             ASSERT_UNREACHABLE();
-            return -EINVAL;
+            return -EILSEQ;
         }
 
         if ( !page_get_owner_and_reference(mfn_to_page(nfn)) )
@@ -1088,14 +1088,26 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
         break;
 
     case p2m_map_foreign:
-        if ( !mfn_valid(ofn) || p2m != p2m_get_hostp2m(p2m->domain) )
+    {
+        struct page_info *pg = mfn_valid(ofn) ? mfn_to_page(ofn) : NULL;
+        unsigned long ci = pg ? ACCESS_ONCE(pg->count_info) : 0;
+
+        if ( !pg || p2m != p2m_get_hostp2m(p2m->domain) ||
+             /*
+              * Rely on the caller also holding a reference to the page, so
+              * that the put_page() below doesn't cause the page to be
+              * freed, as it still has to be removed from the p2m.
+              */
+             (ci & PGC_count_mask) <= (ci & PGC_allocated ? 2 : 1) ||
+             !p2m->nr_foreign )
         {
             ASSERT_UNREACHABLE();
-            return -EINVAL;
+            return -EILSEQ;
         }
-        put_page(mfn_to_page(ofn));
+        put_page(pg);
         p2m->nr_foreign--;
         break;
+    }
 
     default:
         break;
-- 
2.51.0



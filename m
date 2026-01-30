Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBM4OJLHfGnaOgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A0BBD5E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217653.1527070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyp-0000K4-Cr; Fri, 30 Jan 2026 15:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217653.1527070; Fri, 30 Jan 2026 15:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyp-0000HI-7P; Fri, 30 Jan 2026 15:00:15 +0000
Received: by outflank-mailman (input) for mailman id 1217653;
 Fri, 30 Jan 2026 15:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlpyn-0007Ra-Jk
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 15:00:13 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 603537b5-fdec-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 16:00:11 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5329.namprd03.prod.outlook.com (2603:10b6:a03:22a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 14:59:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:59:50 +0000
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
X-Inumbo-ID: 603537b5-fdec-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxSVNY+H06UcZuHBWayl5UWS6JIFcyHyBgdDoFW421knGu0YV/z8uS/6alyMNbhgUOxXGK84FWgnu5vJ6MOCr+vlYjTtfmgttfQaZH0H2RVBNlERPnC9dLyBa8yF36oX7j3y1+kcgJoVUGNKmYEzQFDMnbVijINvcvIbVxUKVYf0mfZ0Ma7Ws5OQhUxgVw2v9dz70buf1FlmSbhLF/OdgV+KsMDfngO1LewYDJAxbea8wKHMCy+kJq4uJBY+g7jzgXfm7y+85ip6bvZjO3EHloHSc/sq0EOEwQ/MKPEMDarOZtZ5dkyySIE87UAu7OHz7LtQkYUxIBXHiCgYA/1D7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMY1WE+YoJfenQ/Yslc4hayY+Dxvy/1KaKMmJebvlhM=;
 b=DGu+nZId9U+TlNRFpvPPYQvcR3eUrKQCy6iVK+F3TRCVqEEMCGq4vWGdsBMy3x+adnSV8lZPAtCy+6unYv/YWG9f1NL6xM7HCGPg8gfZJSlSK5VuSTjngwqhZEi0Pfdiornkd5wjUG66qlaMZUmZbv++5xcBVFOHH+SY+nm6F1n3jbTyDiyNHSKyQKhhXpWd53NiSI181PDderQXVITkPZymvoZoQeHBOu7z98TbS9mNjUUnz/SrlkHhUKXUhS8eAhybAI2ZDbGyAxTV4gFeYbN/Yazdm+cavpplKxSODcBtkXVcmH4lLJZXqtiEmnZqAJhEgSV3BTsbDn7VQfNy7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMY1WE+YoJfenQ/Yslc4hayY+Dxvy/1KaKMmJebvlhM=;
 b=Xkir3ZfghtEgAq5BGkNp7XMN9NWyjV1P0b7Y9yRug42FW+yG7bHZOoIlFdDhX6/mBxclVrIcITH91EIPJyoNqCNGlxuikDeql4O1Sghi7VbBz5sFkaFS90gZ2r5pVWCAcwIKcSoTrQFJVuQhK6BHSNQJ2oSFpRyPj1qVyeoQ9mM=
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
Subject: [PATCH v5 4/4] xen/mm: limit non-scrubbed allocations to a specific order
Date: Fri, 30 Jan 2026 15:57:26 +0100
Message-ID: <20260130145726.85907-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130145726.85907-1-roger.pau@citrix.com>
References: <20260130145726.85907-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::16) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 40828875-fd64-4bad-c2cb-08de60103776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aERaYzdqTEt0ZCtlU1hTS1BQakM3KzFvUDVlVzEyYU5nNC9CRlVRNGFkczl3?=
 =?utf-8?B?WjA2c1JPZFBOdG8yWkJZamJtSlgrZ1FLb0VUR2FPaFNsS28rN3pIT2p3Z0NB?=
 =?utf-8?B?dnd0cnVyeFFZNC9yMWVjUnJTNFJWUStqSnllU0pTTjNoekxGN0xtblJBWm41?=
 =?utf-8?B?OG9XYnBMTkNveVpockQyNlpBN0tjYTVOUUk3cDhJNllTRS9GS2MwbURucFIz?=
 =?utf-8?B?c2NYcWQ0WEkrczk2RDJ6MkFteUJzWnYwblpURnErNUpxRnRody82b0xjWW1l?=
 =?utf-8?B?MG00akZQMjdPT0ZGNmFoeWZLZGxaSnVTYUpGZm42dEF0cDBNNWtIM05HZnhv?=
 =?utf-8?B?WFd1eGxIbTVCZWIrbkVWSTB6UEdDaUdaak1JWWpnTmcwMWdpdzN5YlVqOUJC?=
 =?utf-8?B?VmhhdUtNV0JjUUZXNlhJY1pLazNSVjI0SEpkVzd5eWxOMjJ0ekxSb2wyWWZH?=
 =?utf-8?B?cnFTbVoyY0ZhZHRoaDg2TVhObmJPOXFLZlVTcnFZdWZ5WDU4QTBOeUNDeURr?=
 =?utf-8?B?dTRRM2tNQjd1M0RWYlNoOWFFS3NjVE5RY1RYaG0veUQrTFh2WjlnYmx4amxk?=
 =?utf-8?B?dWRtK1dvd1lCYml3RU1JVzZXakpXb2JhV3d3YmUxOWVHMCtOWWtOVW5aY3BM?=
 =?utf-8?B?NzlOK01INHo0Q0pycXlPQmRBNmhyNDBnTFV1RFhXQXdrSEZWemk3cXBTV1dY?=
 =?utf-8?B?SnNSWmMvSHNEM0xuTGdtN2VDYnM3SkM2RFZ5R3pvbjFiTE8xSGFOZ1lCVHNa?=
 =?utf-8?B?bHBOWS9EYWo5SVFqSGdpdVlLaDNKZnZFbGYzeFY2SFZtYVpSZEViZDhqNytE?=
 =?utf-8?B?bERSRXNmaTJuOUxYbTQ0M3hCSmV6TlVobDlrRk9reFFQRnRwTEl5WXpaUlhJ?=
 =?utf-8?B?dFRObzk1a3VBdWNPVWptaVp3eDZ4YzdYNWx3Wi83enVvOWo0UnBqeEh3WjNY?=
 =?utf-8?B?SUlCMzF0ejVyUXpSNFU4cDZVbVZraDFVaTZrUzlrVkV1VjYzdUp1QVRFb2Rk?=
 =?utf-8?B?eVpiZEN3VGprU1BXSnN0U21nUmFZLzN4ZjE4N2wxWEdZNlFYbnoxM0YzSTlo?=
 =?utf-8?B?dDYxTVVWeWpvUDYzRFAvYmNNWGtuYVR2dWRDc25Xd3lxaTdnaW96MmdRODQy?=
 =?utf-8?B?RTlPWDdxdVdMcEgyVXVFbjU0dzlKQ2kyL0VMSGdxZ3lpdFJWUjZweGM0VGNQ?=
 =?utf-8?B?YXFNSUZrY2d4TmpBdXF6dkJ1UG1xWXNHRklVWVN0RnNpbWZvam8yM0p2bENC?=
 =?utf-8?B?QnBrKzYvNnJGa014UVo5ZkNleVpvU1poZHlXdEIzdXNJSDdHVTBpR0E3blhE?=
 =?utf-8?B?RzFSUnNRbVpVUVZZQUtMbEZ5L3lMczlzdk9VTW1vNXJWeFFQZjN2bXVDZW83?=
 =?utf-8?B?VE1FOTM5UFlMWHNsVS9qT3RMQ0Y0bFlWTTdrblBqQVlZdjJUNXRSWVdtVjJZ?=
 =?utf-8?B?SnRkcWU4UTVhOG5zVVgvMjdlMHhVbWZmNXA0MTJGWEswNzloQm4xS3FmNGdJ?=
 =?utf-8?B?TXplalZvaVNaN2xNNE9ta3F1NEd2QUdFSyt2R3g3THhKYVdhVm1LMkdyTzFD?=
 =?utf-8?B?Ymd0aXRTRi9zcVpvaGFNaUhuUFE5VHBHdTZvUTdDU2ZjV0FoYXZpVDI1S04z?=
 =?utf-8?B?Wkt3ckViME5QQ1lrQ09rVWRSci93b3lvRlhIQm1RT1l6Z0VmYW8rZUFzRm1G?=
 =?utf-8?B?M3RqT3FWamhkK0J4RjlhdGhNRll6Mm1QLytJdzdBRnhMSVdqZFVWZllzL3Ex?=
 =?utf-8?B?NFR1czdXcFlmaUdOSmlXWEh4dmJHaDdDQTA1R2VvMDkzSXBBWnErcFRrT1Z1?=
 =?utf-8?B?a1ArSFEyV2xQSmdqNnZOMXMvM0VxSTBtaU9mU25tdGF2b24xWk11QktEQVFz?=
 =?utf-8?B?M0NYUmlac3F5MFJsWERKc3gydUxoUk9mVUZxeDFhVk9QeWhvUmZSTGNJM2VU?=
 =?utf-8?B?SWZobmY2T0hJZ3Z5akE5am9qQ25MZFdDRU1aOWZPODFhdGhoMndwTkxUemZG?=
 =?utf-8?B?MjBQWEdaT0dHTDRkRlJNczFTNGN3S2FnRUFQTzllSlJTTWs0SzZ0UTViY0Zz?=
 =?utf-8?B?L3ZvWGJPeXo5cENCYm1ObGpDbHVPL1g1TGVrb3U3cmdlS3N0Mm11VWFjTEMy?=
 =?utf-8?Q?P4ns=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lTNEtuOEkxdHUvUHVNSWJ5cjJ2SUVnRW4zejFVckFyRk5IZkdUU0NlZEVq?=
 =?utf-8?B?NVpBdkRpdUk1V1Rrd29Xc0pXUlAzbHkrSHZSaEs2UUFOL1J4c25jcnNFNVJM?=
 =?utf-8?B?RUhzQktoeE1xdkdHVXlhcVI2NmRHZmRHS2diTDZqTjlPRkwvR291SVFVUVVR?=
 =?utf-8?B?bG02MnM1STJCY3U4VHViYTM3dlRDdmZlQWdRMmtkRC92L1Fld21yY250MWFh?=
 =?utf-8?B?R0NpVnA2RkhvcFRidlljNlMwSU8zYkJhTzNodFAzMFJ0bG1QbEZSVThjY0w5?=
 =?utf-8?B?ZkVaYWNmTlpBUEhseXhucFozd1lSSnVzdTd3OEgrY1B6VGRLeXJTNGplTUJ4?=
 =?utf-8?B?VmRHcUoyQitVSnRyZmdZU1hCdzRSRTk5SklxK0tNVGlVOFhCekswRWNmS0lx?=
 =?utf-8?B?SHZ5WVhEanVTOHdDUXZWNnVyVkp3OWUrREdNSTZjcWdHbDlGaS9KUWVqR3FV?=
 =?utf-8?B?MnZjRDFNd25xSWNjcnVuR2NEak9EVVE1KytmdStUcjlzelZvYjNmMlhnbDJs?=
 =?utf-8?B?ZUhFNzVDQUluVzRDczBiM1hDV2VHbml1aTk1czc2TSsxamVRMFlLeEo2bTJD?=
 =?utf-8?B?OUF0RWxZeW11dVhxV0Y5RVZFU0s3em9aY09obXdsdVhhbzIzeTJmdU9leUZ1?=
 =?utf-8?B?TjBVcUloTXdMcit3THlOckcvemM3RHhpYlBNQnYxV0xHZmdxWUVVUXl1VFhG?=
 =?utf-8?B?Zng3NS80UWlpbTRCYTZnS09ibXFDUW40SittdFF4YUxkTXY2SHg1b1E3Q2Ju?=
 =?utf-8?B?bmlIbHlFZkZ2MlNBSXBCaWdnMGZib0ZlUVVPanZBRmQ4eVM4dzNtZVdHVFpE?=
 =?utf-8?B?UkFtd3YzRUU2ZkR1OFIzeUFYbzA4TThhVFhRZXk2UG0yWU5JN00xMEZRd1hi?=
 =?utf-8?B?U3VYMDFOV2hkeWJzS1RsaTdYM2R2MC91YndYaG8yanU1b2Q0THVDbERheUtn?=
 =?utf-8?B?THQ4Y3ZNNFd1ZEc1Q3VmZE0zQXE5Zm1xNE0zU0k0Q0ZWcWJwRFh6a3NOVmxL?=
 =?utf-8?B?SHlVUEQwZTdEaFR3Q2Y5QzR2ZkJreUd4c0pUZ0FPRHJyY0R2ZlFoZmJYSTBh?=
 =?utf-8?B?RWZURXdoRmR3ZHVpOEFCam5pWXBWaXhySVFlMHVId3k4bXFzcnlBTk5XcXFF?=
 =?utf-8?B?eWgwelVKKzNwbzJTbVB0bEVKc3NQNDlNNTd0NXBoZUJUN3BMNDBFUmhNVTVN?=
 =?utf-8?B?NzVwbFNZU05VZmV4UVNmbHJBL1QxRmQ5Z0V4bFluMEVjc1NpZnlwNU05QVZW?=
 =?utf-8?B?VEhXbm0xY0NZNDJZblUwd1pvYk5CNitHMVI3NEtxOXhTNDRLRTlnQVI0TTJl?=
 =?utf-8?B?VHN5NVoxcHJIcUt5dkJYNlUxeHRXMDNKQ3ZwVnlrb2U3b3lKS1U4WkV1TEQ4?=
 =?utf-8?B?OVpKbnJ1V1RkeVpXVTF1dVpDUVE5VWR0YXpRYUI1eHlZL2tOK2l5SkViR3hr?=
 =?utf-8?B?aVNFbEFsRzg2UzgzV3RuaXp2b0dreVJ5OGYrT3BXM2J0RXJUWVRYc1J6NXc0?=
 =?utf-8?B?R1JjUEJLcVUzNHBkZUZxeUhmejYzWDkvSzM2VVBoemRJSkdNYkFkN25nbGI0?=
 =?utf-8?B?ekRjL0xBSG1FTXIvblNMZ05yaHBqaUZpSFY4c0xVNjZBSWErWFFrdHF0b0to?=
 =?utf-8?B?Qmk0U2ZVeXZydWpQYVkweEtvWTU3NnZML0V4SWFjSTNkblhMcDRDY2hkeVM4?=
 =?utf-8?B?ZzdYMml3TnJjcjYzOFJYM1phSTNKYlNvS01aYmpwNk1aV0JwQ2l6cFU5TjFs?=
 =?utf-8?B?ZXlKQnMwMUloMkJZalg0aEs5aHEwTVBWdXZjWFJ6WUhPZmVaYmpSYzl6VHNI?=
 =?utf-8?B?SlVyZXVQU1VEUkJhRXFQRzdqYWhLbmRzSzUvcmFLNXR1MUF3VSs2d0trcC83?=
 =?utf-8?B?V2FQaWxwTm9HRi93ajJvdkhhZ2pHZ0c3aGE2NjNOL2kwc054c2N6K3dxTmJC?=
 =?utf-8?B?WkdrSW5wR2NhamwvSG12VTRuV2R4MEhCNEtJMHg2d2V4MkRWOGQ2ZWUyQW5P?=
 =?utf-8?B?UWY3MHV2S0NmUmYrOCtGSUdGNjBJakRWUXphcCt6bDJySmYxL1YxSjFJWFVz?=
 =?utf-8?B?eDhvODVoMy9GL0hwT25EeGtCS2lRZWQ3S29UQVBialJQZ281NytNNmovN1c2?=
 =?utf-8?B?ejNpczhSUFAvREhKWjUycE02eHVnbWxMWE1uL3NzNUhmeXIyOG9ST1h6RHlJ?=
 =?utf-8?B?ZTdXTVY2cEtHZE5UaC9ZTmtiNXh1a1lQbXUrTlUwWW52cjkvSktuZHFUUG5q?=
 =?utf-8?B?ZWhkck81NkZDdm9tSGNRb2JKdCt4b29PeFFwRyt1ZERhNGVWbHIrTHE4aDZt?=
 =?utf-8?B?anVnZko5QWpLdm9VOWJ2Q1AyNmUxZVZnc0JyT2txV09PRVZ0QlpQZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40828875-fd64-4bad-c2cb-08de60103776
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:59:50.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDiA6ntw4JjT2SI5r/rkIF51X5+aOPWCQ0MZcl6El2XJefWJocqqemexQ/vezLfdLd8xYEhGPvs5FBO0tOhGwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5329
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
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E97A0BBD5E
X-Rspamd-Action: no action

The current logic allows for up to 1G pages to be scrubbed in place, which
can cause the watchdog to trigger in practice.  Reduce the limit for
in-place scrubbed allocations to a newly introduced define:
CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_PTDOM_MAX_ORDER
on all architectures.  Also introduce a command line option to set the
value.

Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Note the order limitation is only post-boot.

Changes since v2:
 - Move placement of the max-order-dirty option help.
 - Add note in memop-max-order about interactions.
 - Use CONFIG_PTDOM_MAX_ORDER as the default.

Changes since v1:
 - Split from previous patch.
 - Introduce a command line option to set the limit.
---
 docs/misc/xen-command-line.pandoc | 13 +++++++++++++
 xen/common/memory.c               |  3 ---
 xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
 xen/include/xen/mm.h              |  4 ++++
 4 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 15f7a315a4b5..3577e491e379 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1837,6 +1837,16 @@ presented as the number of bits needed to encode it. This must be at least
 one pending bit to be allocated.
 Defaults to 20 bits (to cover at most 1048576 interrupts).
 
+### max-order-dirty
+> `= <integer>`
+
+Specify the maximum allocation order allowed when scrubbing allocated pages
+in-place.  The allocation is non-preemptive, and hence the value must be keep
+low enough to avoid hogging the CPU for too long.
+
+Defaults to `CONFIG_DIRTY_MAX_ORDER` or if unset to `CONFIG_PTDOM_MAX_ORDER`.
+Note those are internal per-architecture defines not available from Kconfig.
+
 ### mce (x86)
 > `= <boolean>`
 
@@ -1878,6 +1888,9 @@ requests issued by the various kinds of domains (in this order:
 ordinary DomU, control domain, hardware domain, and - when supported
 by the platform - DomU with pass-through device assigned).
 
+Note orders here can be further limited by the value in `max-order-dirty` for
+allocations requesting pages to be scrubbed in-place.
+
 ### mmcfg (x86)
 > `= <boolean>[,amd-fam10]`
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 285546298ed9..c2682ecbe5b8 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -56,9 +56,6 @@ struct memop_args {
 #ifndef CONFIG_CTLDOM_MAX_ORDER
 #define CONFIG_CTLDOM_MAX_ORDER CONFIG_PAGEALLOC_MAX_ORDER
 #endif
-#ifndef CONFIG_PTDOM_MAX_ORDER
-#define CONFIG_PTDOM_MAX_ORDER CONFIG_HWDOM_MAX_ORDER
-#endif
 
 static unsigned int __read_mostly domu_max_order = CONFIG_DOMU_MAX_ORDER;
 static unsigned int __read_mostly ctldom_max_order = CONFIG_CTLDOM_MAX_ORDER;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 87ebf5a024dc..725d6ee488a4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -267,6 +267,13 @@ static PAGE_LIST_HEAD(page_offlined_list);
 /* Broken page list, protected by heap_lock. */
 static PAGE_LIST_HEAD(page_broken_list);
 
+/* Maximum order allowed for post-boot allocations with MEMF_no_scrub. */
+#ifndef CONFIG_DIRTY_MAX_ORDER
+# define CONFIG_DIRTY_MAX_ORDER CONFIG_PTDOM_MAX_ORDER
+#endif
+static unsigned int __ro_after_init dirty_max_order = CONFIG_DIRTY_MAX_ORDER;
+integer_param("max-order-dirty", dirty_max_order);
+
 /*************************
  * BOOT-TIME ALLOCATOR
  */
@@ -1008,7 +1015,13 @@ static struct page_info *alloc_heap_pages(
 
     pg = get_free_buddy(zone_lo, zone_hi, order, memflags, d);
     /* Try getting a dirty buddy if we couldn't get a clean one. */
-    if ( !pg && !(memflags & MEMF_no_scrub) )
+    if ( !pg && !(memflags & MEMF_no_scrub) &&
+         /*
+          * Allow any order unscrubbed allocations during boot time, we
+          * compensate by processing softirqs in the scrubbing loop below once
+          * irqs are enabled.
+          */
+         (order <= dirty_max_order || system_state < SYS_STATE_active) )
         pg = get_free_buddy(zone_lo, zone_hi, order,
                             memflags | MEMF_no_scrub, d);
     if ( !pg )
@@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
                     scrub_one_page(&pg[i], cold);
 
                 dirty_cnt++;
+
+                /*
+                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
+                 * interrupts are disabled.
+                 */
+                if ( system_state == SYS_STATE_smp_boot &&
+                     !(dirty_cnt & 0xff) )
+                    process_pending_softirqs();
             }
             else
                 check_one_page(&pg[i]);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d80bfba6d393..cf3796d4286d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -232,6 +232,10 @@ struct npfec {
 #else
 #define MAX_ORDER 20 /* 2^20 contiguous pages */
 #endif
+#ifndef CONFIG_PTDOM_MAX_ORDER
+# define CONFIG_PTDOM_MAX_ORDER CONFIG_HWDOM_MAX_ORDER
+#endif
+
 mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags);
 
 /* Private domain structs for DOMID_XEN, DOMID_IO, etc. */
-- 
2.51.0



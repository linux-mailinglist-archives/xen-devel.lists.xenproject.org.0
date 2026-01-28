Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGzKN3hMemkp5AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 18:50:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8AA7377
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jan 2026 18:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215917.1525977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl9fW-0004BF-Ot; Wed, 28 Jan 2026 17:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215917.1525977; Wed, 28 Jan 2026 17:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vl9fW-00048F-JH; Wed, 28 Jan 2026 17:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1215917;
 Wed, 28 Jan 2026 17:49:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4J3=AB=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vl9fV-000489-Ei
 for xen-devel@lists.xenproject.org; Wed, 28 Jan 2026 17:49:29 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b072bdc8-fc71-11f0-b160-2bf370ae4941;
 Wed, 28 Jan 2026 18:49:28 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6488.namprd03.prod.outlook.com (2603:10b6:a03:397::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 17:49:24 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 17:49:24 +0000
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
X-Inumbo-ID: b072bdc8-fc71-11f0-b160-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDaIBalq5F81qjjQMz+p/f1P+6/cqauDt3IH10InZXCb6anO8WSFhGBV9v6YYSCaZOblaSJRjjpyTXhuil/J5dhj2pQXxXRDGv2ZXpYEV688+n9pTaGTm+wkKL+Lfp6JFY3Q3m4srBueo/zetv23nujE5zGWG8XTlbJrV5NhmzB8kCO1PT/0BNRHYr5oCqxpaDLRWpBgQOXoyD4J0AY1pjC94hTZ+61Brpi7YlEC0+GebnkEV2f5zm13FCra14ZO3mFSK1y9RMdjcBkvuSy0Pi1tn2D/ENgLKBeXXtEjT3AiWNbmZqHWeP9krpNlAvqVUsHWFeAV29imiL7wQ1qovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpKW9dbfwCCxuO08czMMhuq8JZ763hOj6WAxtJmoQWE=;
 b=tVUATuH+yukG/XCFDJMbpcQXAtEOOkLgh5Fs7kZIpstygH3k1cOpmwOATaY+JrFjU/AUXccLIKfykr6ycaarngFLqq/4uWwa6LN3hmPlAJh7CySC/gSGJvIedOGlR3np6DY3/aD0cRdLaeAwmJBbJNuhBzR5H3j4whTqmUAZyXU4Mz4xs6ymZ0t7dRvIUyRUXWYpzgqrC5Uyh7LBXw7YW3IzN5JSQ+0ZWEwL52QZ7fdQWA0PnvzuVJ5RrIDF6e0BD3UZHuzQjdTXUNHFHQt1rOabwDYsQianYDO/96/eptPhaid9CovCO+/n1EkcgVDtMUm82lm3QaHSJ++0zR/GMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpKW9dbfwCCxuO08czMMhuq8JZ763hOj6WAxtJmoQWE=;
 b=EtM/kxbGwI3V8GJS+icBbXrZtmHwfwqiX8uJ1vMHMpVyCLAF9fFBkxd9h096uebwUbpufXcnE1qJ9H5cJTubg9ekT6mWEbwIX5ZX9NKiRgKXKI3JAx5nUp7XzGU1m8P/11kvQNxZ2NK3XFBTYjiypzTUNVHfffQ9okO9Z4Rq1fU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 28 Jan 2026 18:49:20 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
Message-ID: <aXpMIOuRZvX8IyFK@Mac.lan>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
X-ClientProxiedBy: PA7P264CA0319.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: 118537f1-1c4d-4371-68c8-08de5e9592be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFNDMnlCaFdmelgvdjJwQlZqSmJDS0lqSGVuRzFoUjFxdloydDRzY0NPV3h1?=
 =?utf-8?B?NmI0bFhuM1lSeHVrTGZsVWVpTGRzcmV5SHFmdVgxSjh6MXZZZEdHU1FhNTcw?=
 =?utf-8?B?emdiaWR1RlkwbUtUNnBIemhYcmUzWkFIcWJYcllPTHk3anYwWkJITms0cDdk?=
 =?utf-8?B?MUhtWCszNUZqaGR6blBsT2dpcXRCTmlsWldYS2xMN2lGdjJrT2doUHo0OUN6?=
 =?utf-8?B?QXE1RXA3dzJscFQwQ2IrdmcybC94OW1MVFRRdTFweUZWVzFSdGNobkZ5eUZo?=
 =?utf-8?B?NEJhcWtYWWtrUThCOTNLSTQyL2E4MnVLamdROVQyU0VPdkgyUjhWT3l1TUEy?=
 =?utf-8?B?SlRqZzB6UFE0MkZqdVoza01sWjFXanlCc1dySHlZLy9pbGI4bHZQdmswWjl0?=
 =?utf-8?B?SEJHMlZ4T3BRbEVXcndiTnpJUWRKdWtaSjB2ZEZ6OC9INVJQM1lDbmg0dkZF?=
 =?utf-8?B?dFBPaG96czdQby9KYUk0YzBJN1VjTllVK3RWVit5NktqT3NTRE85bmxPRTZU?=
 =?utf-8?B?c2FTNUtVNE84OXNBd0lFWDRacFU0L2dJZ2NTVjRHOUVpZldNMm1jVU5lQnFa?=
 =?utf-8?B?SldiK3Ayc3A2MUd4OWJXUlVPMjNiU3VoZlE4eUNTWUZWWThJQndyWEdxcVpu?=
 =?utf-8?B?RmY2M2d4SytxUkVzcVdmWTJDd2x5L2FGTXlkY0ZjemtSOFU4NHlCNFArWVdU?=
 =?utf-8?B?L1U0cGZmV0o5OGRydTN4dHB1QmhqdThGOVEwWHUvbC9ObFl4d29PQUNEbXQ4?=
 =?utf-8?B?bnJZeldOY2FBSi9nWnZrOExmSXhuSnFtTUVXQVdIRmx1VDNvWGxPQTVTaUhH?=
 =?utf-8?B?OVFHVS9SOGxteTI4QjIrZDBPSytJZ2o5RlNFdk4wdGtWeXlFL0dSZGtpaS9B?=
 =?utf-8?B?akJxY3I4UzZhQ1NzMURQTGc2RmhXbzJ3R2hKNHpoVG5hdzFFanNtbE5IZWo4?=
 =?utf-8?B?Qmt6OUVXT1d5cXd1cCtHVXdiVG5ROVloOWVhVkhPZndnMlRKLzVCTitzSWo2?=
 =?utf-8?B?MmFETHhFak1tdmNNdGkweEYwYU9pTlA3OTFad0ptNVV4OGpqbitQcmV0U0Iy?=
 =?utf-8?B?SHhHRFJSU0oyZDBUZEhoOHBOYnNEWENVRW1VQVpxaTBsR085RHNyN2JnWnNm?=
 =?utf-8?B?QmlCbGdkTG9QUDhQQmc1NjhSdU9qeElOZ2hFcTEzeldlYTgwRFdxRUs1dHov?=
 =?utf-8?B?cU9KU3ZYMDFsSTc1RVJ4ckduZEl5dXVUZFZyY2h0OE1TdDNFb1pPTmIrV3h0?=
 =?utf-8?B?clJIMkFMUmN3MUZMclNMeDFlN2x2Z3hTSjJOYXNFVVU1TlJrREhNbjJ5b1hO?=
 =?utf-8?B?VGdaQXJOT05QdjJLNktZZnBZNXhVYjBSMHdBOEhDZUtVQnoxQ1REdnl2YTFS?=
 =?utf-8?B?SWJ4VHpkRndPbHVnWkNWUE9Yc25tblJPcW1qLzhWTGR2VVVUOERLTnVVOHpW?=
 =?utf-8?B?RkZtRWU0S29tMFhJM2hYMmIxcjRRZjZvaXVoSmVZL0FZVkdOTC9kWCs5aDBP?=
 =?utf-8?B?S1dDMG5tTk5lMHlpM3MzVVF2ZVJBLzJYMC9DT3J5aUpUSlhZSjNyT3lsKzlr?=
 =?utf-8?B?T1NMbVRUWVpNNGNWNitEZ2J6UXFkN2xDOFZpTnJrbXN6emRhSEVsM0tJWDZ1?=
 =?utf-8?B?QWh3YW5zRzhIeXlzRXdHQWtReG1xNmpVRlAvRjVhN3ZFaUtPS3RoMHoyRkVl?=
 =?utf-8?B?Um5nTklUbWtIU1BJRjlDM0FJUUF2bUk2RktFZGRqc25jakxuZXlLaFVIN251?=
 =?utf-8?B?ejhwS3dUc1h5SHU1Vlk2bFF0RVk3b3I3dXdCdUx1VXppMWVpa1BkMUdNUzZs?=
 =?utf-8?B?Skg5UEh2NUZHWDVtcEc0cVIrcWNORU5NMVY4eFZKYm5pWDNQSGE4a2ZtcVRv?=
 =?utf-8?B?WU5SNzdjRnVzOWJwVExqcUxyZmQ2R0IwU3hIL1cveTVJSnhXV3NzRElBdkVG?=
 =?utf-8?B?SUdvcWNsV1hCZTdHOCtTb3Q5cUpGUm5lOUt0QjRkZ25GTG9yL1RCYXpFcVc3?=
 =?utf-8?B?K24wd0cyakRlcXpWcjRDU09pY0VOMytGQ0VsQmZiZFpFUUFrRXA5V0xFd3Jj?=
 =?utf-8?B?Z2pZS1ZneWxGTlhNOGNyR1JBZ2EvVGQyUkZvUXJubkloTXdlVTVYNGsya0JI?=
 =?utf-8?Q?SUfY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGl2Qk9qY3puRUlENFFDM1ZzRWpZclJJd0lVYlhTakFSNmtobjVXNzcycmVp?=
 =?utf-8?B?VlArdUxjT0pzb3hoVGVocnJtNHMzajhCbzZWMEJjYUFtK1dhVEFoZE1WajBH?=
 =?utf-8?B?VTJpckFVRUFKZzdXNVlrb3Y1ZjVBZWV2ZmdJRXVSdWU1bjc4YzBhN0E2S1o5?=
 =?utf-8?B?NnBCMU9ZV0JTUllZNWp3MUN0N01yeEhCOXNndXVqZ29USjkyenZWVnMwaTM2?=
 =?utf-8?B?RW1wWjFmYTZ4eWl0Q2hvMzhNLzFFRVB4b3JPMzBVYW1hK2YzSW1ZUkx2LzlC?=
 =?utf-8?B?bGw5V0k4WDZ6dkNxTVNoSFA2SEhNV2tFZklzbDZqcUZ2NTgvV0ZhamFneldE?=
 =?utf-8?B?dnhFMGlFNW9rRHRvWno4S3BrSHYvNUlCNHkwZUkvV2Q4Y2RiQzNEcGVpcGVh?=
 =?utf-8?B?NEt5Sm9jWGZ6ZVA3VHc5c3Q1RmZFM003b3RDM3ROSHJhNmFTbGdOTlJKc1JV?=
 =?utf-8?B?TG5za0xadlBWbnJFWTFuL2s5MFVMVUxia3pEaXNSczZ2bDJ6QXJlUFpsK3pO?=
 =?utf-8?B?Q1RoUTRvemhscG1OQVFkbysvVTkvVzNYdTliYnFOWG5ZMjFkN2xST1JuYlRw?=
 =?utf-8?B?eHIrRG1UV0ZXa0VOZW84bS9icVJ0N0VXM3ZSMnZabXExWGk3SEVONS8ySFZr?=
 =?utf-8?B?di9vTllvTlFlQURhMDlWUEtHeE9ucjB5emE1YXp5SU12MlhOd2FWSGhwWkFP?=
 =?utf-8?B?dys0Rys1S0J4citsTkJ6L1h6dEJNOWloNWNibXBaQ2dpTXVObEFQMG5FMzds?=
 =?utf-8?B?b25JTDZCQTdnOGw5WlFzQW5Pd2RQUkUrT3ZZa2lQMEhIU3dTWTduVEhXMTFi?=
 =?utf-8?B?U3p1ZEZLa0g1eHNQS1NBNGl2RXBta3pTajhwRHozVDhQdGZzVnUyeE1EYXZT?=
 =?utf-8?B?SDRyTnpseXFqVElycGFZZlJIZGFLcm1UWmc2aEcrTHNVVllGdTR2Z1RPQWYv?=
 =?utf-8?B?TER6S2VvQktUazR1SjVmaDRUdFBKZDY5bWJqUU43cnpUc05ETnBwaURqQzZN?=
 =?utf-8?B?bGRWcHNaMUZqNXJ3c0RSNmo4MnhpakpKTzFiRVpOQmtyT0tucVo1VDIyNVdI?=
 =?utf-8?B?VTZUMDM3ZFVmakt3Z290N0N5QlN6RzZGTkErRS9lek5jUFZVcVkrRUZIaCtl?=
 =?utf-8?B?YjdqQWRKTVBoNWpEbkZ3azVJZE1hU3lWYms4MFlnVG1ydmRnTDlxUi9JZG5u?=
 =?utf-8?B?UFJmOURGZ291OGd1Qm5Zanc1c2xBQW5Xc1hmcTFVSDVvUXJqR2lKUUV6OC9G?=
 =?utf-8?B?M25BaklLc3VRV1VUbmJjNE44dmV5SnhHZWZ0TG0zK2xoSENuemZCTjJBWlp2?=
 =?utf-8?B?U2UwZHdaRU1pcTdKUXFqOVBOMnh3MW1HQ2JtaU1ORU45TkNWMjhJdFZBbnZS?=
 =?utf-8?B?WGd5VWZxYmNlNml3NWJ2VFVYM0dtVEhDOXBOUHBva2VHNmczRGdJdlFpK1d2?=
 =?utf-8?B?b0M5ZEd2UG1DZldRWWtwMm1CSXM0Y1dxWGU5RDZ5akJnbFpMc29nWnVRdU5w?=
 =?utf-8?B?OUFTVnQ2YlBzQ0xTZkZIREFHU3V3UnRuQUFDMktzOUdPaU5Mcm9OT0ZmUUhK?=
 =?utf-8?B?SG5DRU9VWndrQStFTVhmY0ZFblBaUE5nRUdNVWpOWjF2cFU3elNkR3RZSTE2?=
 =?utf-8?B?cmhlRGNiSW56Rm4xVlAzR2ZFeDFaY2ptb1p1SzdRNldsNGZEdEgrdkgxTWhR?=
 =?utf-8?B?MjZLcU1Tam55TXJ6R2JYVkNpcWtWQUp4dlVsMU5xQk83dUhlbXl3VEtQM3l5?=
 =?utf-8?B?NXhNakRLQ1gyNXRSaU5ab2hTTmtkQkk0SVRCMVlFdm45ZlQvOVg3WmdIYVN4?=
 =?utf-8?B?cDU4bXlEQndrU2JFbkYycU5BRlVXUGx5bXpEbmVxT2VwRllsajlVR1BLTCtz?=
 =?utf-8?B?YjFEZ2VVQW5hcHBPUXY0amIvM09iZDJkZDQzMnByUklkU3BsekVVS29YVzQr?=
 =?utf-8?B?WlNXbXMxaWNUK0huMjNrR05HcElqeEN4aURyaXZxTmZtd2xkL1VKYTFRWkRj?=
 =?utf-8?B?cTMrcWg2dUN4ekliTzBDWGk2a2s1bzgzVk8vRXBGMW5jcUNWT2hWUURldFBz?=
 =?utf-8?B?M3VkTWxjWmVmR1dJTk5LaTdJNEJjYWduTzBqenN0bXE0U3FIU2xyZjlTYjJE?=
 =?utf-8?B?Q2JwdEh2VnM0UFFkbFVYU21FRkdYN0tJZVlVWG1lSGp2Z1RYTEtEcm5TbmRV?=
 =?utf-8?B?QVR5ekEwQXVpWU9UU0pFWVRqenZiNVVRUWkydGlacjdmYWgzT0k1K0t5Mzcz?=
 =?utf-8?B?NlBqM3NZdTNpMUZBNFpxbXhRMnVibUtObVdjSU9xN1VkZ2FiV1paZkhNYTN5?=
 =?utf-8?B?aVJ5NDBlZ0hPZWFhbFZVQ0tldkhiL2hHZno2WkF4T0tpWmdxVkd2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118537f1-1c4d-4371-68c8-08de5e9592be
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:49:24.0465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FzvzbZrRSmAM1iVNgkGnCrQ9q0XbBOGV7YE7pG26on1AvAI6hnOXMxebu4p18cbozX1ktbFYtolS6mPG7DVjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6488
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 29C8AA7377
X-Rspamd-Action: no action

On Mon, Jan 19, 2026 at 03:46:55PM +0100, Jan Beulich wrote:
> Legacy PCI devices don't have any extended config space. Reading any part
> thereof may return all ones or other arbitrary data, e.g. in some cases
> base config space contents repeatedly.
> 
> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
> determination of device type; in particular some comments are taken
> verbatim from there.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
> exit path?

Possibly - we expect no change in that case.  However it would need
to propagate some extra information into the callers.  I could see
that as a followup optimization.

> The warning near the bottom of pci_check_extcfg() may be issued multiple
> times for a single device now. Should we try to avoid that?

Yeah, I've made some comments about that below.  Not sure how common
those broken bridges are, the comment just mentions two specific
models.  Adding yet another boolean to track that is cumbersome, and
what we would like to do is mark the bridge as broken, instead of
every device behind it.

> Note that no vPCI adjustments are done here, but they're going to be
> needed: Whatever requires extended capabilities will need re-
> evaluating / newly establishing / tearing down in case an invocation of
> PHYSDEVOP_pci_mmcfg_reserved alters global state.

Hm, you probably want to do something similar to re-scanning the
capability list, but avoid tearing down and re-setting the vPCI header
logic to prevent unneeded p2m manipulations.  We have no easy way to
preempt this rescanning from the context of a
PHYSDEVOP_pci_mmcfg_reserved call.

> Linux also has CONFIG_PCI_QUIRKS, allowing to compile out the slightly
> risky code (as reads may in principle have side effects). Should we gain
> such, too?

I would be fine with just a command line to disable the newly added
behavior in case it causes issues.

> ---
> v2: Major re-work to also check upon PHYSDEVOP_pci_mmcfg_reserved
>     invocation.
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -22,6 +22,8 @@ int physdev_map_pirq(struct domain *d, i
>                       struct msi_info *msi);
>  int physdev_unmap_pirq(struct domain *d, int pirq);
>  
> +int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg);

I'm not sure why you need the forward declaration here, the function
(in this patch) is just used after it's already defined.

> +
>  #include "x86_64/mmconfig.h"
>  
>  #ifndef COMPAT
> @@ -160,6 +162,17 @@ int physdev_unmap_pirq(struct domain *d,
>  
>      return ret;
>  }
> +
> +int cf_check physdev_check_pci_extcfg(struct pci_dev *pdev, void *arg)

You can make this static I think?

> +{
> +    const struct physdev_pci_mmcfg_reserved *info = arg;
> +
> +    ASSERT(pdev->seg == info->segment);
> +    if ( pdev->bus >= info->start_bus && pdev->bus <= info->end_bus )
> +        pci_check_extcfg(pdev);
> +
> +    return 0;
> +}
>  #endif /* COMPAT */
>  
>  ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> @@ -511,6 +524,11 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
>  
>          ret = pci_mmcfg_reserved(info.address, info.segment,
>                                   info.start_bus, info.end_bus, info.flags);
> +
> +        if ( !ret )
> +            ret = pci_segment_iterate(info.segment, physdev_check_pci_extcfg,
> +                                      &info);
> +
>          if ( !ret && has_vpci(currd) && (info.flags & XEN_PCI_MMCFG_RESERVED) )
>          {
>              /*
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -422,6 +422,9 @@ static struct pci_dev *alloc_pdev(struct
>      }
>  
>      apply_quirks(pdev);
> +
> +    pci_check_extcfg(pdev);
> +
>      check_pdev(pdev);
>  
>      return pdev;
> @@ -718,6 +721,11 @@ int pci_add_device(u16 seg, u8 bus, u8 d
>  
>                  list_add(&pdev->vf_list, &pf_pdev->vf_list);
>              }
> +
> +            if ( !pdev->ext_cfg )
> +                printk(XENLOG_WARNING
> +                       "%pp: VF without extended config space?\n",
> +                       &pdev->sbdf);

You possibly also want to check that the PF (pf_pdev in this context I
think) also has ext_cfg == true.

>          }
>      }
>  
> @@ -1041,6 +1049,75 @@ enum pdev_type pdev_type(u16 seg, u8 bus
>      return pos ? DEV_TYPE_PCIe_ENDPOINT : DEV_TYPE_PCI;
>  }
>  
> +void pci_check_extcfg(struct pci_dev *pdev)
> +{
> +    unsigned int pos, sig;
> +
> +    pdev->ext_cfg = false;

I think I would prefer if the ext_cfg field is only modified once Xen
know the correct value to put there.  It would also be nice to detect
cases where the device has pdev->ext_cfg == true but a new scan makes
it switch to false.  Which would signal something has likely gone very
wrong, and we should print a warning.

> +
> +    switch ( pdev->type )
> +    {
> +    case DEV_TYPE_PCIe_ENDPOINT:
> +    case DEV_TYPE_PCIe_BRIDGE:
> +    case DEV_TYPE_PCI_HOST_BRIDGE:
> +    case DEV_TYPE_PCIe2PCI_BRIDGE:
> +    case DEV_TYPE_PCI2PCIe_BRIDGE:
> +        break;
> +
> +    case DEV_TYPE_LEGACY_PCI_BRIDGE:
> +    case DEV_TYPE_PCI:
> +        pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_PCIX);
> +        if ( !pos ||
> +             !(pci_conf_read32(pdev->sbdf, pos + PCI_X_STATUS) &
> +               (PCI_X_STATUS_266MHZ | PCI_X_STATUS_533MHZ)) )
> +            return;
> +        break;
> +
> +    default:
> +        return;
> +    }
> +
> +    /*
> +     * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express devices
> +     * have 4096 bytes.  Even if the device is capable, that doesn't mean we
> +     * can access it.  Maybe we don't have a way to generate extended config
> +     * space accesses, or the device is behind a reverse Express bridge.  So
> +     * we try reading the dword at PCI_CFG_SPACE_SIZE which must either be 0
> +     * or a valid extended capability header.
> +     */
> +    if ( pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
> +        return;
> +
> +    /*
> +     * PCI Express to PCI/PCI-X Bridge Specification, rev 1.0, 4.1.4 says that
> +     * when forwarding a type1 configuration request the bridge must check
> +     * that the extended register address field is zero.  The bridge is not
> +     * permitted to forward the transactions and must handle it as an
> +     * Unsupported Request.  Some bridges do not follow this rule and simply
> +     * drop the extended register bits, resulting in the standard config space
> +     * being aliased, every 256 bytes across the entire configuration space.
> +     * Test for this condition by comparing the first dword of each potential
> +     * alias to the vendor/device ID.
> +     * Known offenders:
> +     *   ASM1083/1085 PCIe-to-PCI Reversible Bridge (1b21:1080, rev 01 & 03)
> +     *   AMD/ATI SBx00 PCI to PCI Bridge (1002:4384, rev 40)
> +     */
> +    sig = pci_conf_read32(pdev->sbdf, PCI_VENDOR_ID);
> +    for ( pos = PCI_CFG_SPACE_SIZE;
> +          pos < PCI_CFG_SPACE_EXP_SIZE; pos += PCI_CFG_SPACE_SIZE )
> +        if ( pci_conf_read32(pdev->sbdf, pos) != sig )
> +            break;
> +
> +    if ( pos >= PCI_CFG_SPACE_EXP_SIZE )
> +    {
> +        printk(XENLOG_WARNING "%pp: extended config space aliases base one\n",
> +               &pdev->sbdf);

Hm, I think this shouldn't be very common as it seems limited to a
short list of bridges.  However every device under such bridge would
be affected and repeatedly print the message.  I wonder whether we
should make this XENLOG_DEBUG instead, there isn't much the user can
do to fix it.  More a rant than a request though.

Thanks, Roger.


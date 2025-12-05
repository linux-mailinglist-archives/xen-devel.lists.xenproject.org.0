Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3485CA77F1
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178856.1502547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUV7-0008LY-PJ; Fri, 05 Dec 2025 12:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178856.1502547; Fri, 05 Dec 2025 12:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUV7-0008Iq-M2; Fri, 05 Dec 2025 12:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1178856;
 Fri, 05 Dec 2025 12:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRUV6-0008Hq-HL
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:01:28 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20467779-d1d2-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 13:01:27 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS7PR03MB8339.namprd03.prod.outlook.com (2603:10b6:8:265::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 12:01:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 12:01:24 +0000
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
X-Inumbo-ID: 20467779-d1d2-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+YZYRKga3acZjkDDtNm20tivEzL97PvKbTpPnWvRZB3SB2oVa50XN1OqsZJFoQFJDd0odzXJkVEQSp6biU/uk4fc0ja/ZqatxvDbOK21xkjQnljTVLn3Vtub+u7ve16JFd4882Vhlgs5wv9JQTeUomrvOlF83vVMVij4feqMmTTcs4379w2+U4RkCnDdEDDp8PLMd4DzVeB+EZKSjvbwl/NScjhNEQ107B9l33Mv/nUtLwc0PNF8FQoAFRZDR4dnfhqijF+n+NqPozkfuEG5ak/2N++wZR4JwzpKmShjXIMcw2HNW8RKgFnaX4ga4wjzb/tsiNGBcaKpHKdOtiP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgFsAg5CEWOchthZ5JlpnG2LZCvuPq/+aHO1OFxkClE=;
 b=lHqZXzqgG+C5XlKlRL2kgYo54l6HVE3HMW+Z+4TrJsitzmap3Vjze+7FwYBVkNPeLzWjw8aKPAbwdwVObQ5GBR5XsY2n5k0tBmbQI340n81hF0l8eczvqtP85IsMANDVfl0i4AlXZc9TIGYKzCnMFZKO4jZWUpAZVhTxg/IInIdAG0HXcAFg7bKfq0f3PejWKVAu0YDtkhHjKo1Jzq20Ma/xvB0c36/SkmXIIQeNDdbUAb6XnptbJw8u9X2fkY/+GLJc6DFFmFDDgD57XjaklOTbuUjPAz+DkbauDfRbhivndOfJwXrdEzudKKBUj9z+anYA0TmEQikc1EywEiVc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QgFsAg5CEWOchthZ5JlpnG2LZCvuPq/+aHO1OFxkClE=;
 b=UwBmn4b5aQPVr5nNslrd0dm0Dp5RbTKnMjHXeaYPrIRBgbw02m2E1fL+vm401qnoyDUSrOrI0vw7UQucD+QD1y4WgG8MlYFoFCQAnC4/kL4p4vD6oegabSKhi+GtLsE12/nMHSPJHTfYeZRYOGANTTQxqcx/qCMk9aVXu1Cpzzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e2ce221b-f852-4f9a-8a82-322e6f2af522@citrix.com>
Date: Fri, 5 Dec 2025 12:01:21 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH v9 09/10] x86: use / "support" UDB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
 <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0212.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::12) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS7PR03MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9cd902-bb1c-4bf9-fcb3-08de33f602dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OElvZXJYd0JLclRPQ1d5aE45Wmx3SjF5cnhXVHlBaHFBVEtESFRYUUZJQ3dG?=
 =?utf-8?B?bTdTNU05QmFjOHlqcE1oT1NZVkFURmVRR0x3NWlCNU9nMW1HN1BxMUVzdmNN?=
 =?utf-8?B?M0V6R25TQkNERnJqUXozeWNuTW9YM0NxUmsrTUVhNU55WlhFVEFHSkZweWJX?=
 =?utf-8?B?M3E5Q2pFM09Dd3RHU2NPT3ovaC83VjZDbTYycGNRMUFnd1RmSURxblRLc0Zp?=
 =?utf-8?B?eW1INHNOWG90TCs2clViTVluVVVnTVpQSmw0WnI4Sm55eGNUYlk2VXg2OFNF?=
 =?utf-8?B?Z21xNW5vVUlyTWlxRGpqU2ZaMEVlMnk2Vnlqem5nRzcySGZYQXJOV2g2QnBl?=
 =?utf-8?B?bGNjRXI1d3FiS1YxQkIwRGpkUytMNWlYbjRwSFR2d1lDWHB2dTcycjdhVzNZ?=
 =?utf-8?B?RzluMTVFcnAzeFpCNUJnb0pzRGJSTHFOSFk0YXFhcWd4T2xOaG9oc1FJWmxR?=
 =?utf-8?B?WnhrdXFseTlDWHVqU3V5QXcrTnhmRmt3RFZ5OTFyaGFqdGtKSGZFVm9sR1BR?=
 =?utf-8?B?aUd2UDRnUklkZ0tUcjFrdkJrdmJZdGIwekZiS1dnL0RweEpSSEdUdktQMFZl?=
 =?utf-8?B?UjM5RUJoMHZQZHJkejd5YWVRWGxGUkcvMDM4MFJRRENlZmJta1dUM0t2VGx1?=
 =?utf-8?B?d3BlNmxOUWZ3eGlKaEozaEs1Y1ZCdFhKMWViVVdjSUhiV3FydlVrK1pxbXlL?=
 =?utf-8?B?WGxmWEQyZDUzZXVKWHF0aTJwUWlEdzBlWUxSUkt6MXltNUo1TzBrRzBPeXJh?=
 =?utf-8?B?eFJROUk2THJRRDNKejJtd3hOUmtKcFZRZmk2aUJpQTdhaTBFSXNFbTdlejNn?=
 =?utf-8?B?cmFveS9iMzk3dWcyY1p4TDBweFNWREpQakZiQXZTcGFpU29mNjc2ck5pVkhH?=
 =?utf-8?B?UlFjdDh6K2RrZ1NFYnNtRko1blNJMXk0d0xHWDY5amp2dzJLMDAzNGI5bC9q?=
 =?utf-8?B?YndGK3c4M0N6WWt5YUlxMGNsRExFN0xIejB4YVJSN1hqM2dtcnBRd2V2b0dt?=
 =?utf-8?B?b09sejVrdHM0eWtMVUVUOG5GcDkwbmdNK2Nxc1VLSXRQYlBOb0RzSGtyNkVX?=
 =?utf-8?B?SUpON05ScHJaMmZVWTQrR2dzejBSMlFVSWJ4OVR5TXJmUHBaZWd5MVg2aEls?=
 =?utf-8?B?Lyt3MGFadFp1a2JpZE8wNlY0U3lmaE5kMHluL3F6cWc5SXg0YXNOZTZKMENI?=
 =?utf-8?B?b3U5MCtONlN6bmJkWnBlV3V3UzhwT01iNVFBVitOMTQwdFhic0gvcW9rK1BT?=
 =?utf-8?B?VFlISUxlMU5jNGI3WDRIMGFabmNWRDFwOUFaSVAxQUkyQWZreDFEZ0l0aGha?=
 =?utf-8?B?Y3NmaE02aGtSV2tJKytMUUpWakQyV05JaEo0UzJVbnRmRmR4NWdGU2psbzZZ?=
 =?utf-8?B?Q3VBOHpLc3h0Y201M0FHeXoxK3BteEVsNm41VitUVVM4SkhGQkZpL0FHN21S?=
 =?utf-8?B?UlJmYzZ2dVhmZVNJZmxINHlxMzhoU1FKeURwa1FMQUZISlp3QWoraTlVcnBw?=
 =?utf-8?B?ejFveUI0MitzSHErVnZiZzE5MjdKcTVnUUFJekI3aU0wZzJEMmpJcHpDSFhh?=
 =?utf-8?B?OFVtdis3ck5PWVp1S2xSTFJqVmk3dCtmaWJudENaQVVoOEo4ZzdoQlJaY1kx?=
 =?utf-8?B?NkxmSEttc3FUK29ibkVYSExvZjdUZm1tcUt3UVVxS3JhSDNiMFlwWU83TC9l?=
 =?utf-8?B?OElZSVRXL3VTVzZsbjBXTlQ1eTMydmx2OU1qR2VXc2ZXUWxaT21UMHZKWVZt?=
 =?utf-8?B?RGxrZlhGRVlEVDQwbWw5YWhUNDV4WDFJY2E4S2ViU1hULzRmQmtGaWM0a3BS?=
 =?utf-8?B?V1RBVHJVak1iZkd5Y01vZmtjRis0bm9yZ0p2OXg0ZmVGN2U3REVtVGJyK1d6?=
 =?utf-8?B?UFFyY2FmKzVrUWdvdVpzRFVWSW9hMnF1Qi9UYko3bnNBaDZ4ZW5rNUpFemFl?=
 =?utf-8?Q?6tkB1fyfzUXGMe1Kei5H1MDpsVBCZNqI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1d0a3c4Wmc2VjhEaS9KK3dqako1ZW5VTnJPSE9KTFZ1bzBtVHhkMkRId3hv?=
 =?utf-8?B?MGpVREZMc1JMWk0xRkh4eVFtTnc2Z0llQ0JLTmVkUmlUWjRVNzhqNzh3V0Nw?=
 =?utf-8?B?eXVHK2JhQ0FHK0tyMXpsMzJkUXhmT2hvVi9uOGVHTHVvZmF1Y0JCSHR5ZFl1?=
 =?utf-8?B?SEpuQmErbzdER0FjbGU2Kzl5Zmg2SE5HT3puTTgrU2hxK1VVU0UrWE8zdkpq?=
 =?utf-8?B?V3Z6aFZXbmRDaS9NSE93cEY5NCtsY3FDdkoreTc1Mm1IMHkyNUhDQ0gzazhX?=
 =?utf-8?B?Sk92YUFyYTZISkM3R0pGTjBCL1JYQ1N6UHMvcW85TDV0SStWc2FBTkw2ZGFR?=
 =?utf-8?B?MTFFdDRJVWx6cDVPRGhGWUxQTGFUUmd6WlJjaTdyOHRZZlprbmw1Z3ZLL3ZZ?=
 =?utf-8?B?RmtERmpsZUQ0UktscW82N2VncnJRbFZoeXFoRmxsSk5xRC9JWDBZcG5XU3pt?=
 =?utf-8?B?L245Tkw4TEdhMUlzQ1RRNStJMjB3MzB4aUZZUDFWaVVscUZJZ3l2UmNGS3po?=
 =?utf-8?B?L21VZm1wZHVhd0ZHWmJoRGdoRTJCWG1RSDEyZ1BhWHQ2NUtWeHRKTlNDWnhl?=
 =?utf-8?B?bVcrSHZXWXhXbUhZb3Bla1dtbWNrSllRTm5mOVgvOHJYbHB4WlBpWXRubUd2?=
 =?utf-8?B?eXJUdmkwUWorRWhHU1k0Szg1V2MyaXlPK0NnNEcxUjBieGphYnk4SFpHY0JC?=
 =?utf-8?B?SjdLK3E0STYvUjJnS2w0c2c0UzB3L2FyZGdweFA5SXJXMnlGcW5IZG9KbTZv?=
 =?utf-8?B?NEEyM1lzRmwzS05vNTQxMmZRbGR0NkNYcEp3MjNzSW9GSFJOdWxrVE05WFN4?=
 =?utf-8?B?SjZtWjE0RUw3L0xVeXNPYXdBdkE3ZEtSeVRQQW5oeDdZR2FJUjk5UEVsZHBF?=
 =?utf-8?B?NG5tcVZrNCt5Q0RldFplRGZCV05nd3RBZ0twVlppVkJpeGRmWmxTdnBQS3R4?=
 =?utf-8?B?bGo3OFI3QVN4SllpdHcyZWFqSmJEYllBQml2RUxmdVNkWnJ2b0ZoTmJpUVBP?=
 =?utf-8?B?aGFGWnJXblAzWm1lSjFHVy9pS3hwMUdZUTRQN3pzditjS3FZMW1pbThQYkZB?=
 =?utf-8?B?bGI3WU8vS25zemZ2V250MEJrVlR1azdTY1lROElrMUlvWEdlOFcwNEdPblRL?=
 =?utf-8?B?R1hxMjI5eDk4NUVkdDJxRFhybFpzMUUwSzFGU28zZlRuZ1FNWW1rbjhoQ1gv?=
 =?utf-8?B?cTNHMndBdmRSYjRjT2tsVmtPZDB3dW1IVEdWU21FdU4zYmp4ZGV5UzI4ajVZ?=
 =?utf-8?B?UW5zS1JIUzQwZVI0YWFnUUQ3TnpFSzB3MU1EaXR1b09TL1UraDErelVPZWxC?=
 =?utf-8?B?VjhCcjZXSzZYS3ZQbFBiL3B6NStnNys0NFQwZEw2VlUvMGM4TDNzRFRDMmc0?=
 =?utf-8?B?ak91T3ZTWTVONWpKdmdGbjZUeEVGdnRJaDVyNWNqSW1kdlFaSk41T21rSVln?=
 =?utf-8?B?MHR6RTNuR3NNYnJqN2dyRk40QnlvMjU1T3hTRGJmMUtUSnlKZXJFVVFWNTc3?=
 =?utf-8?B?b20waFl2ZlFGV0U4eGhOSWRqRjhZMjBKUVh2anBxTFM3dyt6YWlpM3R0OFBa?=
 =?utf-8?B?UmlSeVNONHhsZVFHSTNwOXZkdmxNbXVpM283NUcwNzlYOTRyOVREV2lYQThD?=
 =?utf-8?B?d2d5MjJ1V2lIZG9sWDFsZGQ3OUtWV1JLMnVkcXNPM1dYVm1iV0xId1hpTDVI?=
 =?utf-8?B?S2d1bG5jSUhiYUNPSjZwMnQrc2VzdEd1WnZ0K1JMQ0JCNzJXSFZRR29CYzFo?=
 =?utf-8?B?TlorY3VkS1RaeHdjd3hOUThybjV5Z3Nud0Y2aWVhd0xLVE04eThZa1J1ZmZB?=
 =?utf-8?B?Z0syY3M4NHk1RHdZUjM1NlNlRUtvK0hNOXpmbWRKYnkvUXBFNWQ2YS9ZZWJx?=
 =?utf-8?B?Vm42ZWNuRWxMVXJmT2k0SVZIdXhWUFlYNDRDQ3p2Nzg2bGkvbnExZ1FhU01X?=
 =?utf-8?B?SWhVc0UzaXd1bHlpSXhseWJlUXFabnFNRXVIU010SjgxbWZkNTVySTRFUk8z?=
 =?utf-8?B?UEFWL3NsdmJ4Ynptc1RRZ3R3SWxJYnp2c1pqa1dCbm50THV5eVJ3SlJtekg2?=
 =?utf-8?B?VnRiNmx6VkhMdm1mWFZPY2dqUTNzNTNVb1dhN3VjaXpvM2hDZkR4ZTllcDl5?=
 =?utf-8?B?d3p1YVhaMmNyZEVvZXlSeGVERFhhcC8zcloxa2RzUVJJRDFva1YrUlp5K3VQ?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9cd902-bb1c-4bf9-fcb3-08de33f602dd
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:01:24.0243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijPx1T0J6s4YxXaIWAAkzaBf5ARsshlo73lx094av6yzLZxW/13Dg2zcH2opaeKh3tN2PP75m26ijCR/BEah3n2eDUHgQ1hzAd4kV+FbatU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB8339

On 24/11/2025 3:01 pm, Jan Beulich wrote:
> With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
> mode, use that instead of the two-byte UD2 for bug frame marking.
>
> While there also make the respective adjustment to the emulator.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Should we also switch {svm,vmx}_init_hypercall_page()?

The hypercall pages are 32/64-agnostic right now, and used by 32bit
guests.  UDB isn't safe to use in those cases.

> Furthermore x86_64/kexec_reloc.S also has two uses. Question is whether
> "tailcall" is being open-coded there, or whether that's deliberately not
> using the macro we have.

The code in kexec_reloc.S long predates the tailcall macro.  Also I now
regret calling it tailcall; terminalcall might be more accurate but it's
overly long.

Very counter-intuitively, Linux has plain KEXEC which is phrase as
"call", and KEXEC_JUMP which the ability for the invoked kernel to return.

For the regular cases, Linux invokes the new kernel by spilling a
register to the stack, and RET-ing to it.  For KEXEC_JUMP, it does call
the target kernel, after some games to set up a stack in the target image.

Either way, we can convert these two to plain JMPs.  One of the ud2's in
particular cannot be converted to UDB because of being in 32bit code.

I can do a patch if you'd like?

>
> One of the table entries in stub_selftest() uses UD1, yet not in quite
> an appropriate way: The 0x90 following it (presumably meant to be a NOP)
> really is a ModR/M byte, requiring a displacement to follow. Wouldn't we
> better adjust that (e.g. using 0xcc instead)?

Oh lovely...  That was my mistake in 2eb1132f7963, where I was
converting what looked to be a double ret.

Can't we use 0x00 so it doesn't look like an int3 either, and update the
comment to make it explicit that there's a ModRM byte?

> ---
> v9: New.
>
> --- a/xen/arch/x86/include/asm/bug.h
> +++ b/xen/arch/x86/include/asm/bug.h
> @@ -21,7 +21,7 @@
>  
>  #ifndef __ASSEMBLY__
>  
> -#define BUG_INSTR       "ud2"
> +#define BUG_INSTR       ".byte 0xd6" /* UDB */
>  #define BUG_ASM_CONST   "c"
>  
>  #else  /* !__ASSEMBLY__ */
> @@ -37,7 +37,7 @@
>          .error "Invalid BUGFRAME index"
>      .endif
>  
> -    .L\@ud: ud2a
> +    .L\@ud: .byte 0xd6 /* UDB */

add/remove: 0/0 grow/shrink: 1/520 up/down: 284/-1024 (-740)
Function                                     old     new   delta
x86_emulate                               144961  145245    +284
zap_low_mappings                              82      81      -1
xstate_set_init                              298     297      -1
...
paging_mark_dirty                            280     261     -19
csched_schedule                             3711    3691     -20
vmx_create_vmcs                             3740    3663     -77


I think this says quite a lot about how bad the vmread/write helpers
really are.

> --- a/xen/arch/x86/x86_emulate/decode.c
> +++ b/xen/arch/x86/x86_emulate/decode.c
> @@ -651,7 +651,7 @@ decode_onebyte(struct x86_emulate_state
>      case 0xce: /* into */
>      case 0xd4: /* aam */
>      case 0xd5: /* aad */
> -    case 0xd6: /* salc */
> +        /* 0xd6 (salc) omitted here, for #UD to be raised in 64-bit mode. */
>          s->not_64bit = true;
>          break;

Why does the not_64bit logic not suffice?  #UD is exactly what we do:

    generate_exception_if(state->not_64bit && mode_64bit(), X86_EXC_UD);


~Andrew


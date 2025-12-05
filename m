Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 793CBCA7845
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 13:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178877.1502556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUaO-0000n0-Ah; Fri, 05 Dec 2025 12:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178877.1502556; Fri, 05 Dec 2025 12:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUaO-0000kt-7x; Fri, 05 Dec 2025 12:06:56 +0000
Received: by outflank-mailman (input) for mailman id 1178877;
 Fri, 05 Dec 2025 12:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K96r=6L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vRUaM-0000kn-L5
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 12:06:54 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df39b9dc-d1d2-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 13:06:47 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6991.namprd03.prod.outlook.com (2603:10b6:303:1ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 12:06:32 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 12:06:32 +0000
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
X-Inumbo-ID: df39b9dc-d1d2-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuO1VEC+w/zwlukU76wICEkkvEjZZ0oC36hDrAA9vJ8t5uXIh79H/8QmLT3LRToqrv3637F7LtHfx2Ljc80HtYIvoUTVVk8QGyORb67bmYQGME9Q79uPCooMEPRBaDRxPtjLMle1Zak3wBuDyIQys7GbcHmm8cgTQiohZLfN0h0x6uw6Mmec9A3jg4/E9H/wYeMcTInW+IDkn1Casue33kV6QZgOPfNxSdt8yYrx08Wbri+K/HSpt04N+jBBb/Lji6jm/cquvYBqLl5ek7de+9y3STBnLLBss6YmK1gWFMRZS+NEoUNdXEKI+DttRuAD8m7G7tOZXsPgyEkPZGrLlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVBI/kQmLsGOHt+//8JzIikHLFqytSb6UmPY9cwUaes=;
 b=mR94UfwG2udsQRoAvpwjFpdGQNt8SYpivr7/L5lbA1LMj5qnynVQltCLLcHMYL8wgm5h/r027ZXl960xjn44vcGMM04fMP+TyjH9e2387TFd0TYbOvNDyP+ZSK2ghzyTQD+DMZzxJGSoIRHZ7G2eubfVzuI/95hrirO7mnOP/4zgcRdQ55Sg00w/8r7md2SJlwzL4pf9rODxv1ZERinN6T5EKpLSrRjooHBTcEq6Z1Pd41IeIi9NHJJW/8xN/dw1WGMC0Zd9slbG63Fp/i1gxuI2wCAw3Dkc1/dp149HnCV3EtinQ83OxcLI6CfOiARGDbUQOJiDP28Qj/ffpCkKiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVBI/kQmLsGOHt+//8JzIikHLFqytSb6UmPY9cwUaes=;
 b=ASWU6jB6VD9PoWCtHUHCybkJ+Vag/eT8Yseg5Qa4T0plKBTc+2QxPR/9B3HVo5bLbddbGJBoKr4txYsq485XyjQFAlWXW0nX9GS3HnBWkgH2k/HjJORwcoqsSAuZYUT6DU1lcbITpik8btUTUrqPVCV1uKtSrIlfym+USyp7PeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <737e9b03-fbad-47ce-be30-d229bbf0a948@citrix.com>
Date: Fri, 5 Dec 2025 12:06:28 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Anthony PERARD <anthony.perard@vates.tech>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/3] public/trace: Add U suffix to
 TRC_PV_HYPERCALL_V2_ARG_MASK
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20251205115000.49568-1-michal.orzel@amd.com>
 <20251205115000.49568-2-michal.orzel@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251205115000.49568-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0439.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::12) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bb3c0d-f34b-4fa8-4d7d-08de33f6ba83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXpuRnJEQUorUDBFVVcvcVdjaDdoUkdaUEJvZWxiVlRzdjh6bkpML09lZGZm?=
 =?utf-8?B?aVRNTlc3c01XZ0JsTnpVYUpqaFUwVllWaXZ1aGkxN3MvekRldmRLTnp1ajVy?=
 =?utf-8?B?YnNtUU1TQTFSa1lKQTVxV3U3Zm0zNSs1cEVJalV3SkxRWTdlV01xRWZVeE15?=
 =?utf-8?B?OUhZWGoxbVRrdWFjRDVQVm1GRDZOMy81TzBMcnUvRVV6NFBzQldKeDM4TUhW?=
 =?utf-8?B?U1VmaUliLzFLaXNrRmMwNE9LT1RKZnZmRlh4YlI4NlJzQVowZ0xIVkxjQjJv?=
 =?utf-8?B?ZFNGVFJ6cml5bTRsN1B2M0VZL3JPKzBTT0xnYzI5YTA0cEdlaWhyRC9ZdzRk?=
 =?utf-8?B?K3dsWVZRUm9UUnhPZmpZV3AvSTJZcDVPcksrOHFWbU41MFRLZGt0bGJLeVR3?=
 =?utf-8?B?Mm9XL0ZjZkZpeWY1T1dUY0xKU29Vd29mUW5pMEdOTExOZmptMlYyNnh0c3Js?=
 =?utf-8?B?ZXdvU0dXdjdHWEp2bVBKejhYeTFZRGJ1SERxdkJJWXdQMUFlbVJNY2h2b0g2?=
 =?utf-8?B?dXFCdTFDaCtWeExYZ1haMXFhd0c4MDVyb25UN3M5eWtHZ1RUZUFjdjJJTEpN?=
 =?utf-8?B?WmFXRXZ3RzJEcFhGTVhUYVh3akhGREpsUENPZEpWYVV3bkRRY0wxTE10QWRp?=
 =?utf-8?B?WWJFOEpPZWltOEdMU2NUVGdJd2dFVEFsV2lsd3NBOWxBRVZEL1BvQ2ZKMkl2?=
 =?utf-8?B?VFA2R2xzenFXdkpyS204cmM4cmRNN1J1UmdJeHJGajE5V1Y0VFlmUmxRdlB5?=
 =?utf-8?B?djRlUU4wNllxT0d5bEh4NjB3ZnluNitrdUZ1NXAyQ1dKNzQ5ZFhScnJUMDFI?=
 =?utf-8?B?MVRubEhENzhVOUNDSG9BWEJkaVZsRXVMbXVuVURLT2l4dk1icTN6QjZacTli?=
 =?utf-8?B?RWJ1TG9TNllOempjM1NyOVgyZU5FdVNKUWNLQmQ1UTVoVmVYT3J3TDBPb3U3?=
 =?utf-8?B?SzBDbzZVNnlERFFXbnBOQnpTN1p1TVJuNUZ0cllZR200bGR5T2pkQ1VjZkV5?=
 =?utf-8?B?SFEwU2tVVkc4cVp1ZmdVQ2FZNTdhWnVkMEdST1NhN2ZQRGNoRS93T1BXVTdE?=
 =?utf-8?B?cXV0alRNVWg1cFVaOGdMaHpaSGRVN3BmVkF2QXR4U0xqUzlkeEE5TlJWRjVz?=
 =?utf-8?B?SlNwUzFJOWV0c1RHV2thTkcyQWV5M1BiaGNXSzBHTk1rN0N1T3VQVEU0NHlx?=
 =?utf-8?B?d1pFOXg0ZmFWcmNWc0hBMExoWndQSzQ3QUxxS1ZYeE1vSm80NXhkNVcvY0pw?=
 =?utf-8?B?bjY5N0x6VHEwVGVyMnhIVWtDaktMYTdnZlUzdGY3QjUyU2t4QjhPN21tSFdO?=
 =?utf-8?B?MmtmL1RaMHdwZXYxYkNSb3M0MTg4TU42RFpKT1BpOEl5T1RBNXErUm84ZTNS?=
 =?utf-8?B?MVNDeWFoSWVGSDQ1WVpWdjdwTklnenhIaWd6RTJxclUvVUl2akk1NGNYdk85?=
 =?utf-8?B?WE5tSTV2N1lscFpFVFJFemcrd0N0TEhDUmpWek8wMDhFaG1rcFdkR1l5cUZ4?=
 =?utf-8?B?Yy84eHNRdTdoYllMRVZ0aXJJWEx0VjJwYXJsMzlWcXBYTGdyUnlLK2tuaG9B?=
 =?utf-8?B?aVNVdDdjdFV6azJwb0NQTWdQb3JwVnNvTjhOeHRFZDRoaGtuMU5PK29Sa00w?=
 =?utf-8?B?TFVEbkl6dXBvMXlNSU55QzZTdy92K0FUL3hpazBvSXM4RUVFTnQxbTduQWhB?=
 =?utf-8?B?WHhsU3oxd05UbjNVZUViM2JqaEJiKzBuK1d4REpQczVXRjlJUk96TFNZVnlw?=
 =?utf-8?B?OE5IajlpZEZZRVpYMXU0aFd5R3VOOGVBOUJGZUU5VFJNanB3andNd3owY3Bi?=
 =?utf-8?B?NzNpNjkyaUhDZkhNWWF2OUdQUVpUaUtOanpYZ3g1TGx0Tm90YVgvU3k0dHI1?=
 =?utf-8?B?cXJybzBLazRzaGhUV1FVV05jZFI2c0M1MktoVDVubit4WElHSmM5TXJBUHZ1?=
 =?utf-8?Q?OtsmqzJsYXl2tLv3F+JT7R75XOruPs6T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VEJNVk0zUklrV0w2Zjc3UHRjUXBVME9TOW9oZmZRTitiWmhUSlFjZzY5NzVK?=
 =?utf-8?B?WmRDdFdPQnpxNStyc25COG1QRVgrdXhrMnVIOGVJaGtSMk9uS2kwcDZXK1Bu?=
 =?utf-8?B?K3NyUU5wTVZHM0poNngrcE83UllsZUIxWC80U1pwb0tWRHhYU2hsU1M4NW9s?=
 =?utf-8?B?cDh1OWd4M203bmtZYjk4Q0hncFRFTnVqWVZIVWhuYmhwNmgxRTZ5S3gwUGpO?=
 =?utf-8?B?VWZJU25yNCt1VkE5V0VjYVZuby9CdlNqK1krWkUyZjJjRmJYalpSMnp6Si9T?=
 =?utf-8?B?d0J1azJPRVhjUTNJa2hNczlSSU01WUVuaEI1UHJxQ1FIUlhFUWpBbDlKQXoy?=
 =?utf-8?B?QUZvTlZqcHBJM0lYc3AzWi9rZnhwck10KzJKYUJmbGRpVUhkREh3TFAyQXlw?=
 =?utf-8?B?dGtKUDRFV283YWJYdmpMSXB2Q2xBSXFlZDlra1RxakhPZVMySm9TQlc1V3lM?=
 =?utf-8?B?OFVPbndBaHNqb0F5bm51VXZYYlFCRVdSVnczSXpBbDdPVFJaeTczc3pLelZq?=
 =?utf-8?B?MjU1SVBhRS96alFvN2tUMVhPaXhGa3FYREgxdUpRNDJ4S2M5R2dabVZ2RWNO?=
 =?utf-8?B?WFNTSmhGYUZxakEzK3gvaHJoTks5TFFka3JxS1NzWmRQZlZkZE92bTQwaitN?=
 =?utf-8?B?U1NSQnp3WnJzViszU0szRlVTeGRhS2M5ZGVYVUxaNUhnZFZHeURJZTFOS3hP?=
 =?utf-8?B?SndSeUE0dFhZS2pJQnU3ZEJHbTJIUExrUDUrdW9IR05CQVVsSFRBZlo4cjgz?=
 =?utf-8?B?T2FKbGt1SDk1c0xZRzFvWjlvSkNrVVRjUDJhSXFGSm9DMDh2VExFOVo4SkhY?=
 =?utf-8?B?dlRTUUhoZnM0a2xpQ2FBNGtucER3aGZUczVwcWtSZTdlaElMbUM0NG9IVm44?=
 =?utf-8?B?ZVNxdHZjZjh4QzdWaE9CN3l2WjIycWJNNG1IbjJMQVA4NHJpaEZrLzJtRXIw?=
 =?utf-8?B?SkpzZ2IwNW9QSEc1UTc0WXVYZy95d3ZCU2JNbVVJZGh3VFJyNnQwYkp3RmRm?=
 =?utf-8?B?L2hHSjRnWDM2RkN1VGZ5cUNPZ05ZaDVFdkZsb2M2WnNicmtsRW9ZUEZOaFcy?=
 =?utf-8?B?Y2dwRndrM0tkblp0R3RLSW9Pb1EzZVU3dnErVWJSTmhJbmx0cXlCbVI0cWhX?=
 =?utf-8?B?aEhrUWphTnFDNGluOFMvSFV1SkZuNkttU2xzTEM5UEJtWEVLRW5ucFROZGNq?=
 =?utf-8?B?a2VKcDUvejdTOHhNdi9EK3M0SWVZbHErM3MyT1N0dG9lbnRLZ0JMOXlsTnBy?=
 =?utf-8?B?T0l1NDJDcEIvcWFDdTdwNnhnbW5wYTF4dVhRQ2w4SGJiOHVtWWJCMHJmZjRn?=
 =?utf-8?B?MGRzdjRVako2MFlmdGFpZUx5UUY1TFV5QXpWd0JDcmRiN0k5M0pFbnZpdFJK?=
 =?utf-8?B?S0NEQTZ3dS9aWmpseTNiaWliQy94QWFQajArQklSQVpHbkMrUGhOU3Mvc3dS?=
 =?utf-8?B?bnVndEMzclh5ZjltQU40UXh0ZmVYNlJmVDNJOStKY21kNDFhRGFJZWMvZmMy?=
 =?utf-8?B?MC9XTEgwazBZaEVpSWVOYjhXZ1NlOFV6YWwwcktRdy80bTllMnU0Y3lrS0NK?=
 =?utf-8?B?VTQyQzNFMVJ5L2xGWDZFSkNLSFE1ZFZaNGdoNS81UzhHOTlFZFQ1cHY4U2J5?=
 =?utf-8?B?TUJlamQ5T0VEcGVwa1dWb3ZISlpvcnluZ1UzcnlJeGp6NnB4aUJPOUJvbkxU?=
 =?utf-8?B?MitFenJzcy9LNUcyK0ZmamliMHJiUjdnTHllRnIwVlpKcjE0SWhHLzd3NllW?=
 =?utf-8?B?NFFxUDZXclVKaXBncko2TFp5bTB1M1ZuMWV5SEZPM1hsWnh0UzBVQytWWkxh?=
 =?utf-8?B?azlFNk5xejh3L2FEMGlYb1ZJc1Z4MXlLUUlZV3JLdXNPbmxvaktaQVhVVjZr?=
 =?utf-8?B?RjVtd0hrUDdpMCtZb0c4SnVRcDI2bWc2WERrRVJOVDIweFdjWWliUTc2OElJ?=
 =?utf-8?B?MTg0aWd2eEpPd3YxUFlsWnhOQUNMcS8xN0xhbE1QMnpJSHV2a1R3UjRLUEhm?=
 =?utf-8?B?bEZTbmtVMlpXTEQ5eTJpRjhJUUtpWVhyTGwvaTBhdElrU25aTTEzN0JSN0F0?=
 =?utf-8?B?WTAyMkN1SjdOUXFZNkloVXdlVWt3cTJLQUk1Wjhhd3BNOGNxNWxzcXJnWHdV?=
 =?utf-8?B?ckQyRisyWW1IenN3TG1YNEk5WDlXc2psT1FEelFta250Q0h0NTJpKzMvaWZr?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bb3c0d-f34b-4fa8-4d7d-08de33f6ba83
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:06:32.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyD8xWqWrmv2rSw3BM2DwPNZ5xzldayjxBmIXsZBDTpualK02K3SiCYHNDh/JtKB1/Souh6v57lr8C1GCF6SS+9WeOZxQ/Obt6p3AtNP2Eo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6991

On 05/12/2025 11:49 am, Michal Orzel wrote:
> TRC_PV_HYPERCALL_V2_ARG_MASK represents unsigned type, so according to
> MISRA C R7.2. U suffix should be applied. Fix the violation.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/include/public/trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/xen/include/public/trace.h b/xen/include/public/trace.h
> index 141efa0ea7b9..a7d7fb8c507f 100644
> --- a/xen/include/public/trace.h
> +++ b/xen/include/public/trace.h
> @@ -157,7 +157,7 @@
>   */
>  #define TRC_PV_HYPERCALL_V2_ARG_32(i) (0x1 << (20 + 2*(i)))
>  #define TRC_PV_HYPERCALL_V2_ARG_64(i) (0x2 << (20 + 2*(i)))
> -#define TRC_PV_HYPERCALL_V2_ARG_MASK  (0xfff00000)
> +#define TRC_PV_HYPERCALL_V2_ARG_MASK  (0xfff00000U)
>  
>  #define TRC_SHADOW_NOT_SHADOW                 (TRC_SHADOW +  1)
>  #define TRC_SHADOW_FAST_PROPAGATE             (TRC_SHADOW +  2)

Hmm.  Ideally we should use _AC() (or whatever monstrosity we call it in
the public headers), but this header contains C structs unguarded by
__ASSEMBL{ER,Y}__ so we don't need to be so careful.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> but if you're
changing it, you can drop the brackets too.


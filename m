Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B711C5CF35
	for <lists+xen-devel@lfdr.de>; Fri, 14 Nov 2025 12:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162560.1490166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsNn-0000VB-HU; Fri, 14 Nov 2025 11:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162560.1490166; Fri, 14 Nov 2025 11:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJsNn-0000Tj-EQ; Fri, 14 Nov 2025 11:54:27 +0000
Received: by outflank-mailman (input) for mailman id 1162560;
 Fri, 14 Nov 2025 11:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Irg0=5W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJsNm-0000Td-AJ
 for xen-devel@lists.xenproject.org; Fri, 14 Nov 2025 11:54:26 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9da5483-c150-11f0-9d18-b5c5bf9af7f9;
 Fri, 14 Nov 2025 12:54:25 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5366.namprd03.prod.outlook.com (2603:10b6:610:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 11:54:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 11:54:20 +0000
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
X-Inumbo-ID: a9da5483-c150-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ab45AB4kFf+6r0weWuxBvDgPOIHvy2zCI65CSECIMuYRvIgGUMiL8u8GP9RoQRKUowkJhN3MiqoQx/2uA+uxBRRsdVKPFWQVsqnlE54O1+KmURdhrMT+MwHlqFfO8WjDffxrL7EABM0FzZk8Hkjn53t1A+Zr23gMTzR6fo9b1w6iWGzqmT0ClVYrU+JaNzezGzfQMP8zWlydf5OG6qHaW0EWqP7uzbdRXQTdFG2EXOwCNaMcRrVdxJG2TbCKetFZ8mvPEWdj9nBWJVOJRBXHvBUdvViNQVFzMeI367vpE9b844MBmVzkqxfbJnqzH3EAQzHy3OwCtWKsoKXLlcAalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+7YXKWCSILIEXb8JNs06kc3dr+L/tP/IkNr3smpeHk=;
 b=PGmBokA5RPCF1JhdO94r8w2P6JpSeGSZf2kYS8FKpfrDvwFSgccUtvxWV0yDd/6+5Qgsms0uesjSSDejxJ6INtUS2QXQ2em+I2q3YWGbvdtbV99prnhkaxaXBTn6t+PTvmm3UA25oL2zWgSr4ZVADACJWUYb5XnXU9W/DafMErJfQxyfXVjVXIMHgJm3abieQCBk+fTlDYTqP/Ro/rd1nPEgPhGxW2jLO0s3rOUGQnCNEPmZH2utxJYZcGb+u30NYMpVUMlq58I/sWUHkguDsiTKMyg7WJVqtUL0H1NSvw0tewLRbWR1qL18MCEfW4W2PKOkUBnjyc5QWTMPciGqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+7YXKWCSILIEXb8JNs06kc3dr+L/tP/IkNr3smpeHk=;
 b=YQZtdqFaC9FUJ2AJ+I6RZ6HGl2ThwTqv/HQdr7DDPSKvwDZsebYNcB4tcf8+w+dCvN/vz+qchyWxE+CSR7mRCiaj8TdkwXpt6f1AJCwUi33Hi47Lq6pKNDSQBLYkhUoABw4KB9/dPC5RzvxbyuG6c+N5oP+r2rc+UgQEldYZH0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d558864b-baa7-4262-9336-1f3362d7924b@citrix.com>
Date: Fri, 14 Nov 2025 11:54:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] tools: replace @xxx@ markers at build time
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-5-jgross@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251114113238.9279-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: a80e1f9d-6243-41a3-50aa-08de23748bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFJRKzFpVStJRm5uVm1tVjBWblo1ZGJvWkF5eitDL3Y3SUZKdHlkWk1NYzZw?=
 =?utf-8?B?R0JsNnJENmwxV1c0UWprdXVON1ZSUWJpcWFXZFVvV2g3K1lBTmNxem9tOGJE?=
 =?utf-8?B?YlRJU0N1ZDFSajFzMVExUmptdnlRVzJ1bzliMWlKRmdra280UHVMUjhZQ0Zs?=
 =?utf-8?B?N2hCTEtTWVVoVk5MdzN4V1BKblRKSUVLNEcvZWlqdGpWUVVRRDlWL3VIenV6?=
 =?utf-8?B?TTRSeVUxdm1JWTltTEN0UnRUaUlmaGY0V2w2V3hVSTkvK3ZtOFNxQ0c3Nk12?=
 =?utf-8?B?WTlXUzBLNEZvSG1FYUZRSzZoVUkrMjl0SWdGaHduNW0rOTdZWjBsUXNUZmRz?=
 =?utf-8?B?L1BLSk1IaytXeGVmcVltM2wzVVVqR0tRYkhiUEJzMFZoaHc3OUpsVjRXV1JM?=
 =?utf-8?B?dW53djZOMGhGb3MxWU5DaVh0QVJwNnU0Q2NRNGptTUpSYTdnRGM3dXh5THdp?=
 =?utf-8?B?Q1JQcURXb0gxS3BGblQwSWdPbmhJWmtuK1VHTWttdG16eUZnWGlPMTFXOTJS?=
 =?utf-8?B?WC84WU9ZQUtSSitYSjZQdDNvNlk2QjVaOXBRaUZvVWhMaWdrcUV4MVRxMGRz?=
 =?utf-8?B?ZFdVM1BYSU44anYrS0REejVSMGpjS3h3eWJnS25ERjBycUNvcERGL1dVa01T?=
 =?utf-8?B?OHJPaFZGVVgzaXhwQ0RGb2Q0VXlvU0VuOUc0VmRIeldsSWMwQ0Y1Z1VQMjZw?=
 =?utf-8?B?N3llSkg5cTBkYndyaHVBUVpBQ3I4RzFEeWc4RXZBU3JGUUV6R3NZVCtFSm5s?=
 =?utf-8?B?L21pTDBSbVBOMVJoa0FsN1RwK3VsSXRMZTgzZjFXSlhQMlhSOGpRcjZtT3pT?=
 =?utf-8?B?dTdsdGphNEU4dUY3V2Mva3kzdlA1OFR0NUJ2djdabTNrdm4yRFZpcFRTVHhT?=
 =?utf-8?B?YmhFeCttbWkrQ2FLSFhqWFRHOURRM1NpaDRNSGdrM0ZjTFd6RDUvZjVEbU0r?=
 =?utf-8?B?SUVyNHV0YUtUV1ZkQmFqUlJvMUI0Qi83WTlDUW5YajFiSk5WM2VSZlRxcGF0?=
 =?utf-8?B?NGZGZ1VWSmluMUhjUjdNejVUSEFINy94R3hPUG8rZ3cvdTU1UnVlMWZqOUZ6?=
 =?utf-8?B?SWw2RC9EWFpsdkp0RlYrRjZFS2VrRG1TMjZ6VnJCL2lWOXJTWXlBOVJET0R1?=
 =?utf-8?B?L21vZVhzcm10Qks0TjRXNE9ET0JpdW9vMFAvQ2ZtQ0g2ZlFydXVrZzhVNHRk?=
 =?utf-8?B?eHR5d3Q0eWlnOXVjbFdUN3VXYnBHSFdkcDJOV2xTWlhkMnJhT2wyN0RNS3hq?=
 =?utf-8?B?SDFrNHdudkhDRi9IZVJ5SElQOTdIYkMzM2V5Zm9MZXBXK0FKYnl1NjlSUlRy?=
 =?utf-8?B?eU8wUEd4QWNJdHRyVW9uR3JxQUZoZk5DZWFqWCs0dklINWR5RndieUJ5V1Ru?=
 =?utf-8?B?VThjVnBzcFM1NlJBSzB3WW5odVRHTFEybzR2ZFltRFVod3JBMFVBUnVYOVo5?=
 =?utf-8?B?am5ya09PUlhTMlMyRDRMNVFzblVVZXptR21iQjg4WkZ3ZXc5a3FxMThkVHRm?=
 =?utf-8?B?SWFYYXNyb3Q5QzRRZG9ZTlpkcGJBU0tTdk5WWTFaKzQ1SktnSEFWY0FpUGR4?=
 =?utf-8?B?b05LL0xkNFhPYUpqUFFaR2J2TDZXR0VFdE91WHVBZHorYnc1WlBzd2d2a0NE?=
 =?utf-8?B?OXdDNllDcDlKVUFTM3BjbXg0UG8wRFlsUlNsc2hTdGh6L3VPbjJCc0pDbk1S?=
 =?utf-8?B?NTQ1WFFEY1hJcVBFUWRicTgzRm5xenA0U0RicEs3WEZURXl4V2V1bUY0M09L?=
 =?utf-8?B?VFdqM3FVNDExT1d4QWRYdTN1aWZrNW1jdER4VnVnUVV4aVRxOVZyQmprTGI3?=
 =?utf-8?B?REd4dmxRVzc1elFSSFdkUEZqMGY2b1FTckp0OFMxUDVOb0tHbHRHMGF4RkJ1?=
 =?utf-8?B?MHp2d1JtUFBmeGQrVzhSbWplV1E4L3paa2Q4Mk1tTTNTcm5vczhVMStQdXJy?=
 =?utf-8?Q?OK6yDUNXvUG5jafTHnVG9WUzADDLbK1i?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHU5LzJBWHBPNWFnWnk3WEhlbVIrbDlCdEtLV3BKSHl2cWtNbWlodVJKM3Fx?=
 =?utf-8?B?TXZzK1JBZnB2Mlc0aE1sVXI0TnBIK0FuYXZoN1gxTFBjOVNCQkNmVFBVcFNP?=
 =?utf-8?B?UW5TUXJPWThDeGtTUEh1akZnRTdMRDZNZ3FlQTh5UDc2NVg3YktCckRaWm5x?=
 =?utf-8?B?Mndyb1FPNHBaQUNKSkpqUllmN0tDc1g3YXFiSnhjNTdTS2h2bXJuUWVmcG15?=
 =?utf-8?B?R2pwRzYyTHlmTEV6a0E0LzAzR3BmbHV2dnpHTzJWMEJEVFhzZEZKSlFDVzAr?=
 =?utf-8?B?UXZITlNRbGttWVhnbkdxajZYWTE2NkpkNVIwWUpyODFlczZvRStuSGdsNXpT?=
 =?utf-8?B?QTJnZTFrMFBNUlJmYTkxWDU4N1Q1RjlaZzMrMWt0aWU5Z0Y1K0JhR0VWOHdW?=
 =?utf-8?B?STJiTWd2MTF4aXozajBvdFVhOU1WUVdoZEdqOUQwN2xYaWZLL2g2L09JZWhC?=
 =?utf-8?B?U3c4S3Jjb28yL3F3cm5Nejl4aGJWNDMvdG9jSlduV3dwdkh6cFNRdGdlYmlB?=
 =?utf-8?B?R2VhSjhUUFdTZTRlVlhPenRkSzNOalhYWWI1aEdaaGMrSmp5c0FaMndDcitV?=
 =?utf-8?B?Rkw4bnZwS09hWTFUTzJmUVAxMHI5VkdwekhMMVpLVFd5cmlySlcwaFlYc1Bp?=
 =?utf-8?B?Zk4ycUVXK3RpVFVadVZoanliSnJxdjNUenByWk5za0NpdjhZdzBrRDdEdDVP?=
 =?utf-8?B?aUVlWHp2WlhpSWpuNS9hSkpjbktWUFgxQTNTMGVJKzB5S0RnOVpZZEZqVTdJ?=
 =?utf-8?B?NUlLVW9rdmd1Ync2N2NLUEsxUnlTT2NvQ1RqUTdCK0R5NXFGOU1IYlBNME5q?=
 =?utf-8?B?c3c5WlhXSnIwTUVOZE1XZlhBZnVIc2tHUVRuQzNyUS9rTW5NRjlZbEFic2Z5?=
 =?utf-8?B?Q001VW9Ed3EvTW4zRGVjYWdtMytmaTI5SW55Q094cE84TStsUWRxeXQ0S2ZT?=
 =?utf-8?B?cEd3NU5ZSzJVN2NVejhZdWtmMHRQWVpqYmFwOXQ5WklMd21aamwxcGs4aEFK?=
 =?utf-8?B?NUNNcTU2bGhwTlo5TzBWaE1vVXFDaUxqVElmSFpsWHBwd3dhNzB0YmlYRkMx?=
 =?utf-8?B?RGZRTkprU241Q3R2NkRkTWpVcUNmcGFIcjVZZlIvYnlKK1VFdjNYZVdRZ3h5?=
 =?utf-8?B?eDBRN3g1OGtQeGE0cmQ0d1d6SUpMeE1mMkhoSjFWVWZOOHZ6Ykdaekc0NGZ3?=
 =?utf-8?B?MjY2SjRKME5PL1dOSGFSakYvSXMzaXhtL1I4eWVNdXlUSGVZSURoQ3lZSjVS?=
 =?utf-8?B?Sng3OEJ4YnFNYU9PSHl5d1dGTFphdXczTFl1TGdWSlJtNCttYkNlS3pvREJS?=
 =?utf-8?B?bExrY0wrVnBJcGFJVXZLRUgyRjhZNDdSK0NIR05HZ2t0SXVLMU1RVlBsZTlJ?=
 =?utf-8?B?ZlRnR0VSeXN3L1BLdVY0MWF0Snk1bHBIVm5SMHM3NTA3OUhON053MUZZelNj?=
 =?utf-8?B?c2lpRm1UZFU2clQvRGwzd1FoRnpHK29CUGdBSzlranl0dnlySTdSdSswYUMw?=
 =?utf-8?B?RmVVZ1pxSkVSNHRkVzBTT2s1MjRINlFGdUhKOHdhVUp5MkxRNm9GNFFNeFZi?=
 =?utf-8?B?M2dWUTVIbTg0NlNaYlJsaFV6UnYwQ0ZST0REY0Y0R2txVUhVWGdadXgzbEpr?=
 =?utf-8?B?Y1pXR0pYVnM3Z2F4bUpFWTF5QnZtaXQxY2s2bGVSMks4d3R2K01BTW1qK1lv?=
 =?utf-8?B?NnFuYVlnM2IyOFRzeDZyU3R1NWlwaFNldStDekhJMEUvcGZTWEU5alpuM09H?=
 =?utf-8?B?bnBybnB1cWppWk5ubTQwRHRuRTN2Zm5nd055U2RRbHpkNE01K1dMQkdLYi9F?=
 =?utf-8?B?UzN2VE9OdGpkQ011MTh3SHhOQmxDa2JqUlhxTXVZVUV4cnFadFRTZ3IycUJz?=
 =?utf-8?B?S24vQ2pVdjBRZzV3aUVPbmhBVHJCOXcrV1JNRVBML1lDS1JyOVB4NGxvTVVv?=
 =?utf-8?B?YmZEZ2dmMzdpLzMwczhXZUV5TU9uUU5KSVQ5QldrYWIwTzZ2WnZpOFkvQTlG?=
 =?utf-8?B?RHhLYW9sTVBrRkpHeXh0UnhHb2JzVkdTTnR0eno3L2ZoTENENDNGd3k5L2Rx?=
 =?utf-8?B?amdBN2RtN3RzMk9MeW56V3RGSDBLajNuY05aWGh4ZDJxK3FFb2pDZExSYndz?=
 =?utf-8?B?K3JEQTJ6QTdnbUhCL3FJc2IvNVJLLzdIaFFGMFh0c2JGZStySFVGeDcveHd6?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a80e1f9d-6243-41a3-50aa-08de23748bd6
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:54:20.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN/dkTcz/rYTdjg+sHFMdF/6AiUK3xtkA1C8wimA5QA5cgxa2URMoh1GGiCvvgQ9KKkT7RYPbxvHSnmQ+P0YDtS5EXUKA+Xp1+W/k/k252Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5366

On 14/11/2025 11:32 am, Juergen Gross wrote:
> diff --git a/tools/hotplug/FreeBSD/Makefile b/tools/hotplug/FreeBSD/Makefile
> index a6552c9884..8de923781c 100644
> --- a/tools/hotplug/FreeBSD/Makefile
> +++ b/tools/hotplug/FreeBSD/Makefile
> @@ -51,3 +55,4 @@ clean:
>  
>  .PHONY: distclean
>  distclean: clean
> +	rm -rf $(IN_FILES)

In addition to the points in patch 2, can we use $(RM) (which includes
-f IIRC) when adding these.  None of the generated files are
directories, so the -r wants dropping.

But again, this is far nicer than v1 overall.

> diff --git a/tools/hotplug/Linux/Makefile b/tools/hotplug/Linux/Makefile
> index 9a7b3a3515..6fcf84a6f4 100644
> --- a/tools/hotplug/Linux/Makefile
> +++ b/tools/hotplug/Linux/Makefile
> @@ -37,7 +44,7 @@ uninstall: uninstall-initd uninstall-scripts subdirs-uninstall
>  
>  # See docs/misc/distro_mapping.txt for INITD_DIR location
>  .PHONY: install-initd
> -install-initd:
> +install-initd: $(IN_FILES)
>  	$(INSTALL_DIR) $(DESTDIR)$(INITD_DIR)
>  	$(INSTALL_DIR) $(DESTDIR)$(SYSCONFIG_DIR)
>  	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)

Hmm.  Logically, generating the files should be part of the build step,
not the install step.

I see you already had to adapt this way for Ocaml, where the generated
files are source files, not just config.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPocDX52uWnQGQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 16:42:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FAD2AD381
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 16:42:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256178.1550883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2WYD-000073-CB; Tue, 17 Mar 2026 15:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256178.1550883; Tue, 17 Mar 2026 15:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2WYD-0008VY-8r; Tue, 17 Mar 2026 15:41:45 +0000
Received: by outflank-mailman (input) for mailman id 1256178;
 Tue, 17 Mar 2026 15:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lT9B=BR=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1w2WYB-0008VR-BR
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 15:41:43 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7352082-2217-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Mar 2026 16:41:36 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5312.namprd03.prod.outlook.com (2603:10b6:208:1e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 15:41:30 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 15:41:30 +0000
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
X-Inumbo-ID: c7352082-2217-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcHz1C7YagK2Kcp55Ap2oQ23UM+TWzMG5XxYzHho+IhCKSyhwVVFnjj3GOqjChyGfTrNhoeQwYDQu9lyhIhSNQhWTOyqcZZ4tBMhT8ijXReCsZodBgqLD8WbdXek9GC83ez3CsV3Y/QqtX7QsprcLWWaYsMqYVSUq9vxKO6zjvyO0+MAzj8qLZBMVJOkGS0KztTui5axCDBrlRv7WYT//825XtoO5nnWm23Xc/V+wUBdKbRdMONep+pDZ+pfgpcukRiutaP0YcsWGgYwRswVeX4GTvN0N4yKF42A7HOmwlSLWZutdKIx/UvwWpoRbUou/BXGibxQ3zypy1hbdXY60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GstyDCrXQ93AcDzVdPdE1572Xd/IfL3MoAZgm7QvYzg=;
 b=DCNvPw3i71CYe9U8zzAqcztfTahsuO3a/rjiEfuoJ3bnAKv0l5IfCVeACre5hM53FXzZpblYwqZ61ybzfHswhN/bhTry9Du0kE8LVTpIyolwc2H/kmulvD+/CWItobqdfnBlS7950QR1UVHzS+GkhMpQLjP0RSRbRrFd5cjeNv+lEiA0q/AOoOCTICSyFrEHwQyivjkJlQAmWHd1fY5MRFNKwwp4nH1xcIP7+mEykKiUhy6+iUs9V49/wZTsEI0IjzeQgXiMJjl8pNMWsRAKplyvd4ygNKm/M2LNXuGJVp57P1FVVvxay/4lCr9cCNmRv48Sdfw3xsZGN5ekLQSxWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GstyDCrXQ93AcDzVdPdE1572Xd/IfL3MoAZgm7QvYzg=;
 b=eFE9FThGultm+SQCL+U6hUYB47RQ7M1yzVl5U7/XqV6pZ4dIKD692LnYeI/kuzIxZC6+AtYG/nIMZp9AQAy4gRKxI2cEHxcHo9KolT4DIKj0r9k6yOMLcal7NSWUS6TjjMbV3kT28N3OndbL+2pVNmelJr7D/kKdKD0NRpD+Xos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <31624c02-8144-4a85-a1e6-9a690a9195d5@citrix.com>
Date: Tue, 17 Mar 2026 15:41:27 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [RFC PATCH v3 1/3] x86/efi: Add BGRT image preservation
 infrastructure
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
References: <20260312111414.17808-1-soumyajyotisarkar23@gmail.com>
 <20260312111414.17808-2-soumyajyotisarkar23@gmail.com>
 <ablitN6qZAOOG2ZZ@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <ablitN6qZAOOG2ZZ@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 2023bb84-6e24-4796-0c3d-08de843ba907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8KacEGT6o59j4Ad/9/q2gc+fOrxSM4V+/ah58SHwrA9Pa3ZF4z+p+ANq7k4AJxSKnqbsdlxiCwex8biPmyi44BA0xoyOevAVpkc3UYWOBGcaqZa+r5FKS6vS1ajH9luFhqmg8R/Y3S2/o19oH1vDIpC5KWIhix0AEj3p0Q1gmvLFwHClvZjz8/OkYJ3V31UvqK3u3fkTjsYePEqHlDzGByeSORGspG/lxOaBnuxQS0pEh02BGXC706k/BO2AmLwX+gHd9JEvs8YRRSBKvbStZ5meG2bGijRyRgDp/fZ9y/oIQOzV0Fx/5+WELCa5lsj5YQsQ03gNvAk8dX+YE19kJJO6DpHHGdZPJQXXgC3Ao7ov+EhFEGide51OYrbCtFT9qiNyX8sbfE2T8mw30bTBSQ3uIcVHqnpy3onxxCg3TovUPRWRlHyWQwm99PeeMDz051fPkxEFEp4V/j8j4/C2ANMs37hPzsMmSa1xHDNNhST00+kZ2znMu0KpsjCdwAlW8px1I/1X0GORTJy+TsTa0DB/CRoQwvg6xWwvvOcdfPcKzzyWF72HGvfSgvJqvf1pLI0ECIB+0JjmBxpGXslIX2pOnKal0jsRsUgDEmTIbkju8BDFXDyssf36Au59hKp3LtvSXa87NRjJb3N6hlgmSyslM05RAU64Hxkxjd9xfF3eme3RHdU4fiarO5FrbBcjMSWBSo3hvIqKpeL1pQ1RbJ/iHlbHM9whD2Vh8czf704=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGhSWmNjVzFTM0ZOTmQzc1dkUGFjK1JEME9aeXdsVU5majFPNFM1bEgyWjlF?=
 =?utf-8?B?a2xMeENDMmxkWFMrNkx1Y1FPb1RmT29zZEFVYWtsMktiTFptOERrbTF3Sjds?=
 =?utf-8?B?M1prWnhGU284WXZ2QTZFZTFMb2hRK0ViWW9LdGxWSXBBK1JVQmdOWDdoZmRQ?=
 =?utf-8?B?OTA3VllORmM4eEJmbWxscU5KUDFRcFlIMHJPRGlVN3Q1aS9pZG1aN3Y5OXlS?=
 =?utf-8?B?cjF6V1dGVTZtTHJkZTJTS0NGcW8xZUsxam1wQ3M5SWJxdjlBdDNpSDBuRjNT?=
 =?utf-8?B?amMrUENidVZEa2ZQdUM0Z2ZJS0hHK0ZCbFFUZzQ5VzR0Q2F2bDRZWnZQTUU2?=
 =?utf-8?B?QXhzbHU0bFpxOVVSNjJ1dS9lNUE3cVkxK2hydGJ5aU15T1pvOExBdnJ2aHFO?=
 =?utf-8?B?VG0rd0lIemJyT0hMNXRhaDV6dzZMZ0N3NzZXQ0l2d3FYVS9tRWJ0a2ZvdmNj?=
 =?utf-8?B?amFzM2IrTzNqeXA0Y1pRWDJ5OFBYdzhXc3RLUGRLbHRQOExJdTM2Y2V4bkgw?=
 =?utf-8?B?WVF6WnhzN0h3bmkwcXVIUHdUQldPMHU1WndENEZtYlphZkY0dVJyS1BLbjRp?=
 =?utf-8?B?SS9Ca2Z3YlhITU1Ma0NNOUhSQ09NcTJ2ajZzVjByQmZpR2pRS1dZZzR3MGNC?=
 =?utf-8?B?ZkpwOEJTcG05QTRyZDQyMFZGblFaUFB0dDRPekRVM0JkaTAreUdnVDhVM1dr?=
 =?utf-8?B?bjFTa3BmYTcxeW1qMmdxaGg1UmRXUjhWMkdJai9vY21zNEppMVFsMjRXS2J0?=
 =?utf-8?B?ZzBhVVJ1eTV6RGFJM1JHYi9lWWJwVS9ibkdOcmpmcHhML01vOVRGZjh3cDdl?=
 =?utf-8?B?MVFYS2hHbDRUS3lvc2pkbVZ4WEx5eWUvaVByYUFFNndqU0loc3BJWTNEajFS?=
 =?utf-8?B?MHJtZUU1Q2lzR1ROT00vRXVEQlhFY2dsMTBibVRZNU9sVklCU1hFT1VaRUwy?=
 =?utf-8?B?KzJUb29uVUNQdkNrOHo5bVVMWnc3amdaL2orTG1OdUFjdFBsR2hGQndWUDNq?=
 =?utf-8?B?UjRMaG1ldkhqQml2RkcrY25UYmNBM3RPNDY5R3dPaGtQaFB1UHVCV3dvOXhn?=
 =?utf-8?B?SEtCcTVhQUJibkszak1hUyszQUIxWHJCYTErVTBFOGRONk5JeWMwSDk1dzdU?=
 =?utf-8?B?S1VZNkU1SU05YTZsYTd4aW0zdXVlS1pZRllYSUszS21LVzZQb3pxaEg4Ui9L?=
 =?utf-8?B?U3ozdG9nc0RjTzF3VnVKNlpNMmdZeWtoV3BwNWsrZ3lYak8rUHk3S09wcmZa?=
 =?utf-8?B?emxiKy9MeDB4YnlBOXk2QlMzS0hPb0Q3bHdQTHR2eFE2RkJIb0MrekVKUllE?=
 =?utf-8?B?bkpDQmJwVnpQRlV3NFh5cWlGMFdvUFNSQ003Y2lOQUVHN1pZVjNtUlFtUEZE?=
 =?utf-8?B?eW9KUmUxMnlKaDgxOWRpbUtEM1VVeUszUklkY3ZRam52QUVkUjdIcGNqY0lz?=
 =?utf-8?B?bEUxY1JuNXV2N3BGcmFkcTZPNlNjY3RSZGZFUm9GdUp6cUhQQkUxYXp3a1pR?=
 =?utf-8?B?eVVRK1Nzb3FrLzF3TEdYY2RHYU9qY2hvTG5vR2ZiQkYvZjlNR2V3RWx0cEd1?=
 =?utf-8?B?S1FINFZXbEFCVHorTWNaMkZpR2JnU2c1SWM3K0NkVHJzcDMxb2FDSnAwcm8r?=
 =?utf-8?B?VWpxNHNlTkFDdE1VWFJncGNXTmxwaXZtRFBuYTMyQVR6Ymllc0VlYXdCQjJi?=
 =?utf-8?B?OSsvaU1SVnMrM090NkQrOGlSWkZTYURJNFRPSUIrRFdkenQ1RTlWVm5oRm9U?=
 =?utf-8?B?dUFSYzdxRVorRHFuQjhNTnM4WndvQjE2QnhDTmtzRWlxRFpRWXprNzE0am0r?=
 =?utf-8?B?M2VmMFB1cEJQVlp1VmxDT1RFdVJMdUNhbFdFdGNkM29hVXd4U2pRTmxMKzUv?=
 =?utf-8?B?ZnRwTTJpRXJURVBxNXYwbTFDYUgwVHFIb0JBbWF3K1k3c3AwcTg3alM4Y3dm?=
 =?utf-8?B?dmhveHg0YkxQNzVLTDlyOHB6cDNrMENIbllXOG9qSzl5RkpKeU5lOTNGS1pY?=
 =?utf-8?B?UnllOTc1QkJ0Y0VMMDZRQ2tYcEJIVnNhd0FpNXFmcGJNWmFPcE8xcm53YkFN?=
 =?utf-8?B?TXdkbHIrckd4cjZJMjBWajFTN1g4eUYvQTZQbC9RY1NPdlk5eEo2cDZqTmcz?=
 =?utf-8?B?NGFZMktIZmZHTTU4YUdnTFNMeXQ4dyswajZkSXRPeXRvZlZiL29xVnZRU3Vs?=
 =?utf-8?B?TTFmZktsNGVQbXFoYzg3RjJ4Tmx3NEV0MEUyaWcwVG04UmtXZnhOQ1VYUFA5?=
 =?utf-8?B?a0FYUU9xaENucG12TEVkWHlnUzlJNkM4d0t6RFluaTFjMk5WOVFBQnBVMTZr?=
 =?utf-8?B?ZkNsOEhTS3IwT1BMOTlJZjlkNnVMd0xnY1VjaERINWdxSEN2OTlaQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2023bb84-6e24-4796-0c3d-08de843ba907
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 15:41:30.7953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4w3NUaG6XcJSfXglOQ5a5ukm3R3D0uNRe6I1xSCdXz1SONykE8bsHLBSVSQHJwXeN5SxBR/AFUgrg4e1r4o0nDYr3w53t0S8REXvuhAUPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5312
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:soumyajyotisarkar23@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[invisiblethingslab.com,gmail.com];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[citrix.com,lists.xenproject.org,gmail.com,apertussolutions.com,suse.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 70FAD2AD381
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 2:18 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Mar 12, 2026 at 04:44:12PM +0530, Soumyajyotii Ssarkar wrote:
>> Add core EFI boot services code to preserve BGRT (Boot Graphics Resource
>> Table) images during Xen boot. The BGRT contains a pointer to a boot logo
>> stored in BootServicesData memory. Without preservation, this memory is
>> reclaimed causing ACPI checksum errors in dom0.
>>
>> Implementation:
>> - Walk XSDT to locate BGRT table (reusing efi.acpi20 from efi_tables())
>> - Validate BMP image signature and size constraints (max 16MB)
>> - Allocate EfiACPIReclaimMemory and copy image data
>> - Update BGRT table with new address and recalculate checksum
>>
>> The preservation follows the ESRT pattern, running before
>> ExitBootServices() to ensure image remains accessible.
>>
>> Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
>> ---
>>  xen/arch/x86/efi/efi-boot.h |   2 +
>>  xen/common/efi/boot.c       | 133 ++++++++++++++++++++++++++++++++++++
>>  2 files changed, 135 insertions(+)
>>
> ...
>
>> +static void __init efi_preserve_bgrt_img(void)
>> +{
>> +    const struct acpi_table_bgrt *bgrt;
>> +    const BMP_HEADER *bmp;
>> +    const void *old_image;
>> +    void *new_image;
>> +    UINTN image_size;
>> +    EFI_STATUS status;
>> +    UINT8 checksum;
>> +    unsigned int i;
>> +
>> +    bgrt_info.preserved = false;
>> +
>> +    bgrt = efi_get_bgrt();
>> +    if ( !bgrt )
>> +    {
>> +        bgrt_info.failure_reason = "BGRT table not found";
>> +        return;
>> +    }
>> +
>> +    if ( !bgrt->image_address )
>> +        return;
>> +
>> +    old_image = (const void *)bgrt->image_address;
>> +    bmp = old_image;
>> +
>> +    if ( bmp->signature != BMP_SIGNATURE )
>> +    {
>> +        bgrt_info.failure_reason = "Invalid BMP signature";
>> +        return;
>> +    }
>> +
>> +    image_size = bmp->file_size;
>> +    if ( !image_size || image_size > MAX_BGRT_IMAGE_SIZE )
>> +    {
>> +        bgrt_info.failure_reason = "Image size exceeds limit";
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Allocate memory of type EfiACPIReclaimMemory so that the image
>> +     * will remain available for the OS after ExitBootServices().
>> +     */
>> +    status = efi_bs->AllocatePool(EfiACPIReclaimMemory, image_size, &new_image);
>> +    if ( EFI_ERROR(status) )
>> +    {
>> +        bgrt_info.failure_reason = "Memory allocation failed";
>> +        return;
>> +    }
>> +    memcpy(new_image, old_image, image_size);
>> +    ((struct acpi_table_bgrt *)bgrt)->image_address = (UINTN)new_image;
>> +    ((struct acpi_table_bgrt *)bgrt)->header.checksum = 0;
> Question to MISRA experts here - is this casting away of const okay
> here? Or maybe better be done on the `bgrt` local variable? Or some
> other way?

Casting away const is not ok.  The bug is in patch 1, with
efi_get_bgrt() returning a const pointer.

You should never lose the mutable pointer, and it is only objects in
rodata which legitimately lack a mutable pointer in the first place. 
Everything else is strictly mutable from C's point of view.

First fix the build issues, then run Eclair on the result.  There are
other issues in the series, I think.

~Andrew


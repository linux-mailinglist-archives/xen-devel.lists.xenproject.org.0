Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD567A4BC7E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 11:38:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900168.1308087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3BJ-0000bK-Ne; Mon, 03 Mar 2025 10:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900168.1308087; Mon, 03 Mar 2025 10:37:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tp3BJ-0000ap-Jm; Mon, 03 Mar 2025 10:37:53 +0000
Received: by outflank-mailman (input) for mailman id 900168;
 Mon, 03 Mar 2025 10:37:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kv9T=VW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tp3BI-0000aj-Rk
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 10:37:52 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2407::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a4caa7-f81b-11ef-9ab2-95dc52dad729;
 Mon, 03 Mar 2025 11:37:43 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 10:37:40 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 10:37:40 +0000
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
X-Inumbo-ID: 89a4caa7-f81b-11ef-9ab2-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uc78cU1EDGa9etbJd6PPeU+1qaz9DuHOKHKjll31x8SFRPRUGAylu4PxbMDY3QFKlilJFt0hapsuSUh5Hg/yOxu7eOkLv/VNKQWASZBwsbB6eECNyX/IBOTrj81N+oahD0JIZgojzBTSiq47kyRy82j6gFYpblxcDItFXqi9brTaHvOtB5vD4o+p9DLKnpWoZaUrZmUb4eVOaXKmGrxsrAW3P1SFuarxo77yspS1dFbVPMk5lA9gvWwyZrUpufNUKAdGe1tiAjAVXulKY3JBvd9wfFuoqUXUJxPCk1mmdIdQhEu6XjjJ6/2PJe3LFRhVVzDzDfaw3QkIH5aNBAeJCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtZ3WPDwBdUli6hx0UDzsPaHfRYaMKuScf7dDOJqVkQ=;
 b=FKifQbU3yF1S9zMFDojgX2aFAEqlAhydSADtm2F6Fm0sLKrEtaXK/whvu1SO1p6FYwBGm8GiCmJsPTOBZXV6hCkif47AbCOPy2Zy/RyRQu9hKJtSnRPfsBDQsZpfPQ7UBj4XSkePBtA5pZ1NOhWaSUJP/huKmHYO+0I3Ve3fikj8uCJI4cwedGiA6Bye68yRkhof17tNI5t+98G5JWssNlfYp55DrkBAeMWvHhLe5mFeBjgoLh1ahsWDghDiNLELnBPnEKySNQW8idRPbEQEaW7iXUrNnIluhA0rLDIHH9qJZamTKzPQ0vVuu6UkyTvA9+G3EdUspfZckpb5Md0N+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtZ3WPDwBdUli6hx0UDzsPaHfRYaMKuScf7dDOJqVkQ=;
 b=bFWc6CjjiqL6Kn4YCxwtTb8xlWeUVCszlc2gIZjmtzooiF0SzxZMUjsZbyE75ZlLSQbPz+NWym5v4+0nTBs9GQbGnn394Uy8/xpptYi5hju1NMfDMmdNQX3Ld7SlKUUBPiLb7eoL6aANJiJ7Y9sqAzMiMGsfVsg7ENh7jtcFZfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <8a557cb8-7640-4c67-b59e-d62accb56293@amd.com>
Date: Mon, 3 Mar 2025 11:37:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Fix platforms Kconfig indent
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <fdf893f3d685ad48340ae8c11ecf0723523c35ad.1740997574.git.bertrand.marquis@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <fdf893f3d685ad48340ae8c11ecf0723523c35ad.1740997574.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0346.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: d92706cf-b1c8-4289-7ba3-08dd5a3f6c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z0tpM0hobTgxYXdJZHM2NzU3ZmFHU2Zqc2FrL3NwdXIvenFQUEhhNzNGYkcz?=
 =?utf-8?B?ZzA0MklKSHg1Yzc2dGl2cFd0dVprUEI4Y2ZhWlR5cjBxZXJVNE5qSGo2Z21L?=
 =?utf-8?B?TGFadVBpVFpNOTA2YkpwNiswTmIxUWpjVW5ZQThBcEp3d3pEcGYvSTlQeXBt?=
 =?utf-8?B?dDYvbEFyWDBncllsYit6TEx2ZC9PWkNJM3JmeGFpVlhIOGYvN09CaklTVUVL?=
 =?utf-8?B?bVpkTjY5Ujl0SURtdms1UUpzUzUwMEs0MXBsc2NQODQzMUFZZGRzeGowV0lM?=
 =?utf-8?B?QUY5ZUNYaXErbWsvNjM3MjhwNkoyanRTS3pWNE1uRU9jWXJtaUNsRlpKbm9G?=
 =?utf-8?B?aXduYzlNY1hvTW0ySDBycFRhUERIQTBpTTJNdy9NVjJYcEJ2ajU3bVRMMnNG?=
 =?utf-8?B?WTYvdy9vc05vak9DRmN1dWM5VlYrcHExV0p4Qjh3TEVnS0xwZHVmL1JBVzNl?=
 =?utf-8?B?WDBpN3cxbE9GRHNSbkNicTFmUDhrMDJUSS9EVnh6eGtSaVUvRkNaaUlWaGdR?=
 =?utf-8?B?L3REbmsyZ1BadGVsenpnY0VPcUVNMHF6ZWdDcUd4MUhSTVZOSlVBdTBLSnhy?=
 =?utf-8?B?RERzRlh0Qk5QSmdHRkJveVVZMHJpSGVKL0NySEdUQkNUTldMSFFXalJQd1B6?=
 =?utf-8?B?SmQrNldUVS9nRkIrOTJBMVVLTmZNU05lbUtYbW1WWGVlWm1qeEpsYnFhSlZi?=
 =?utf-8?B?RUs3cUVuSUR4VEJ2aVNxUUZDRUV4RkNQSW14bElDM0MvczhHSC82azlvaTZu?=
 =?utf-8?B?VThZR3c4ZkJoNFZ2Y1RUbHA2Sy9QMDhnU0JoYlpsYU4yUFpUZDFMclNqM0cz?=
 =?utf-8?B?TGtKSHJVcGFudE9sOW4za1poZ21WS21jOTZkUU1ab0hmb1ErSGFJTjI5RUVN?=
 =?utf-8?B?M2xVaVRyRW9DQVFacWYrY0R6SjJlZEJNeVFLWXpHUWcwUXhGeEwzT0JTVDJ6?=
 =?utf-8?B?VzZwL2lqSFRjTlM4Z0pENEUzKy9uNEtnd3Y3VmtlYTZCekdscWRSa2IvOEN5?=
 =?utf-8?B?Y0ZvczNiaVA4NG1tRHNkMXdNZy8zNkVWMnozVEVoSlY4dmpqT2JSYzRzLzRh?=
 =?utf-8?B?ekFOL1NZcFVMSUtDNGdWYUhLMW8wUkw0KzcrejJOeGJkNDdBU28yQXlsejI4?=
 =?utf-8?B?NFczajVtNUs5N3ErT3JCbU9rZmpvVUllb0xSRTFXWWY1c0d1VU5TQ1cxSTJl?=
 =?utf-8?B?Mk5MemdLL25GSG9iL0RwQWZMVnZsOTRSNlhpQ1V1aUtiMThhb3RXNm1UV0Q3?=
 =?utf-8?B?NVV6YkJFdjNRL0hZb2tkclRrU2NxTW92S2Y3VENtdE9XT0s5dy9kTzlGRnhr?=
 =?utf-8?B?enBRdWdQT0UyQzl1VHpGN3NXTzh5Qkl5ZHJQSXRYQmJpVm9od29DeDc5QjhF?=
 =?utf-8?B?aTFScy81NFNza3cwd0JDN3FISWRGc2EzK0dWdGd2T0lXdGw5OHpWSXdxVmNm?=
 =?utf-8?B?VGNYRmExSkkyWE5wRGJqK1cralpkUVAzNldJUDhvVW15WjduMk1nMEMwV3V6?=
 =?utf-8?B?Q3FrVnpNanJEY2xVREVrTW5MNUxHdUpnQTd3WmdxS1BmejlWc0dVSktzSjRo?=
 =?utf-8?B?akhPR1IyeFdhNkZlUmpzMVkwbmJpU3NYeHpvTXAvQmd5b0xFVjNmaGtJU3Vz?=
 =?utf-8?B?aHY1U2kvQVlTbkhBOGxLQVBuS0dyWlBsSFRLVWxhbVZ1ZW9jallBV2lqRURx?=
 =?utf-8?B?U28xbFN4bGg1OFpQYTVNSVFvMTFybmtrNngzQUR0NjJ2S09jaDNtU3pHUitX?=
 =?utf-8?B?RkhvVE5sYXJ0RHJlcElUT1J5R0hIL3ZHMTQvZ1hPSXhzYUZiT08rWnZXRXVM?=
 =?utf-8?B?c29vUE9VaXMzWitRRDRFZlNFRGRUZHprKy9nODBlanRFck05Rk9veG5HdklT?=
 =?utf-8?Q?rzAeRGMLT76Q7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGkxcmt1UkIweEFacVJ0QkpUNGs0YzFER2NmeTdTMjZqUEppYno2b3FYYVMx?=
 =?utf-8?B?NkFFYXprYldPbHkvanhTNWx6Vzl1UjBVVDhINmJxUlY2N08xbGpUYlYybXN6?=
 =?utf-8?B?SU8zaFJVOE9nTXZqSjFxeVo2emNDL2ZXaDdwc21VT1A5ZHR1Uk52c0MvWjJ2?=
 =?utf-8?B?Y0RyN1dNQnp2ZzAvM3dpSlJKRE0zZ1RTYjIvUWJYWVlxem5ucUlodWlCcUhQ?=
 =?utf-8?B?WG9BNDhDYTlYQU4reE9IVno0NDY3cXdEZE5jY2cyOVlsSmF0d1BoQXUzQXpm?=
 =?utf-8?B?Zms4aVc1SzFZUWxycDZiaFpweFZjYkJZMmpkQ2YyaitRdjNkeGxhdWcrM1R1?=
 =?utf-8?B?NTFJditSMnpQVkl2MmVmc0VLK3lVdWVWYkdINmNLY0diZEZCcTlmUFZ6RmNq?=
 =?utf-8?B?bHk1c3BzSG9rdVI1L1FRTE9QL00rZXNxMXNNVWE4OEh3MzZhUkVTM0FPbjg0?=
 =?utf-8?B?SGNmSGVZTEtOblBYRTJ3eHo3SnBZeEpER29nSjltRGxuUHhja3ZzK3k4blJa?=
 =?utf-8?B?ZWdNRVlaV1phbVcyVnhNUFJhN0hRVHNiZldPQTlXWGNGMTB2dmFJMzZWUjlW?=
 =?utf-8?B?em5VU1ZpditINmpQaHJ2ZUZCSlZuSXlZL1pVQmJaSXgwdTkxMGVvK1JEWmZH?=
 =?utf-8?B?OGVHa2dLWHpYeXdvS1ZiUE92OXpHbFl1Qk8xa3NKRjFMNDhQczdEejZLTTkx?=
 =?utf-8?B?ZnFDQ3VETmljeXBPVW43V0JaaWwwSFBKbnQ4dVZ2S085QWxjN1JtcC9Rb0ZE?=
 =?utf-8?B?U1F1ZlBxekFUZm5CRlVldXZyNmhnQUtVN3gyMmx0VWlPNE1tQS9QQXErdjBv?=
 =?utf-8?B?azhheEtLQVcvOXBGbDg2cXRxQ29GNEUwOUJCU3FUMTFET21SajFWaG03YmRz?=
 =?utf-8?B?RGRpbDlIWE5aREptcWNpZFd5WVYvNzJXOThVSGRPR0RFSkNTZXdhbDMzSk51?=
 =?utf-8?B?T2JsTllJRjB1VW4zaGJISnF2ODdLRlBob1ZFWFl5YTVlYVFRVlJuZWtjZGwr?=
 =?utf-8?B?bXlKYnZkWjNHdXpIam1xQzlWK1VDc0M0Y3FqYmpYdHN0Y0lnWUovaVBvVDVD?=
 =?utf-8?B?ZmtsdEg2bTlsOHZ4MWVCaFNCemtZWkl1MXBTS3pvU3d2S0NkREZ4eGJwck9k?=
 =?utf-8?B?b2VIdEppL2pENVAwUWNsY2puVFBadnlaSFhFc1VCUDBKVVp6d3dCdTROcFNR?=
 =?utf-8?B?ZjhUTENTNVdONTQ5TmFSZ0g2RHIxUnB3dXZERnRBbWpURzBLcnhubWNzL2hP?=
 =?utf-8?B?c3ppbGE1YkVxVmtoNnVPNUdFTFp4b1M5Y1hIdCtBZFJ1T3NrSVhSR1NQSWJi?=
 =?utf-8?B?cW5kVkVzb1VSOGhZdkVwaGRwNXBaa0RwbzhNSXNnaWc1OEoyYzRLUmNpZFY2?=
 =?utf-8?B?ZHpLOEEzUVo4UTU5VnNxRDIwclVjRXpkVlk5Wmk4YUdxcHlaYTZ4amtEOG5V?=
 =?utf-8?B?Q0swQXppY1JPMHpYQWw4TUlmMnpzd0NKR0lSbWJaQUFaWXJJQkVaeU0yV1Y2?=
 =?utf-8?B?THlsL293ZGJMSUFUZTNTSzZRTzJHKy9iN05wWFJwUHhqb2JaLzZ2cGdIcUdY?=
 =?utf-8?B?UC9qK1dqa2FyKzlhcGZrRFo2QTFwU0JlVklSbzJIWUE3SUtqeGt5YnYvM3pk?=
 =?utf-8?B?MDNxVlVqd0hHME5tNlRpT0gxMkYwbHJRM1FkaGJmSDdUYXN3TjVheTRYTU5X?=
 =?utf-8?B?emw2c2VTOVRJdC9VWnR3a0R2NG9zOU8yRDJrcjkzSHZ3a0dwTzhFeUQrY0lZ?=
 =?utf-8?B?Y0VUbTBicmJjdEZiUnkxQjRrR01rLzJ1MGEzaTJRaDFkUWFSeWRRNC9lY1Ex?=
 =?utf-8?B?S1J4SWVYN3g2Z3NlZXdQOXFtYjBzbFJIK1U4VnRocmFKbUUyTHpaQmEzWldH?=
 =?utf-8?B?NjUxc0dNWVYzaE5VKzRyazFta05pYUNBMVpDU0RnU3l2MDUrOU9uZkUwbzVS?=
 =?utf-8?B?Y2dtZFpxT1Y5OTkrNS9xblE2c3R5UzdvTi9yUmlYTk1UVTE4WFhtc2l1OHV0?=
 =?utf-8?B?SWh4YUs4c2JDYzEwTk94SlEwSWxVS2lITTY1eE53NnhjMTBLZGpiOUs1QVhJ?=
 =?utf-8?B?S3djNW1uR3NWRktTejdmMUo5WXB2ZGVXeXNBUWgyVk1VeXY0R0pWbTRXeXN2?=
 =?utf-8?Q?h008=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92706cf-b1c8-4289-7ba3-08dd5a3f6c58
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 10:37:40.5718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6u151bB5amfFbkkS1vdh0ZUUiWAY8SuZHkhKd1xQBSU2Ej4HzroxVoGW+4f46bz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450



On 03/03/2025 11:27, Bertrand Marquis wrote:
> 
> 
> Fix platforms/Kconfig and Kconfig.debug help ident to respect the
NIT: s/ident/indent

> standard (tab + 2 spaces).
> While there also move some default in Kconfig.debug before the help
> message.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



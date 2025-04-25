Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B66A9BDBC
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 07:11:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967171.1357072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8BKP-00066a-LA; Fri, 25 Apr 2025 05:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967171.1357072; Fri, 25 Apr 2025 05:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8BKP-000658-Hd; Fri, 25 Apr 2025 05:10:21 +0000
Received: by outflank-mailman (input) for mailman id 967171;
 Fri, 25 Apr 2025 05:10:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vdn=XL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u8BKO-000652-AI
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 05:10:20 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:200a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9380e51a-2193-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 07:10:18 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DS5PPFEAC589ED8.namprd12.prod.outlook.com (2603:10b6:f:fc00::667)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 05:10:13 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 05:10:13 +0000
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
X-Inumbo-ID: 9380e51a-2193-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0dWVk+74JNuUY5EcAMQhIDyJz250mUMycOsjreMlzYnYbktfttp4YQSMgdEtavIotUt/HVDRp2Mp7uWp8oF5xxbdio6uxzTzCBwE2A2GQ4001hYlPenme9UdgSljD8NhXU0o4a9FEcXYl0fn7qtvbjUhnl3Oxtdrp72MBD0aRkuNUBGp7gpr4v/KqvhLksXPAV1Z8YxcDApGL9MeARWVBjy/tANwXjftgJjuTfsIm3rPd1AnoiIBmDRX/UoJfvrM4X4hauL5UfWAq2BXJPCN5AVGPuQ6P1BiTAEe8YQL1ml56IT3tUWug0Nrc1PFnKN21jVddj+5eustfpePd7iOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY9BtOPWT+uN7oJHWq5UEKBsr79x0J1yoC3ECVYbNKo=;
 b=iTX8uQ0zwIL96dP1bzxFTG7HXE0SljOXU1zj4jzMzp/UQhb0lyFQnm47LJ5/KS2a/7gM+a/a4HzYcnUse7vV5zXoExtuICDSUiK5YjmW9yHf7wfdrvOSOnf3t2oRsleYzqAYvFTVhwzBf5ooeuN6dyaeWSXh217stBxn5m+5VlHQMwvdqeBwZ2ITqmCkDotvtBuUoQM9dj4gbLttss0OUjZnDgnLPYLNZmOz+zmsaMVkkoPL0r0Hb2CY/ra4axglV9A3kDNpfnGnNBi4b5CtNycZoqjOoF5szQ2MCs1mNh2sCWBoyKXaFTc4+cE0J+L/KsjamMg6/+cjljPaFS4PBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY9BtOPWT+uN7oJHWq5UEKBsr79x0J1yoC3ECVYbNKo=;
 b=gdQRKgkYYzU68iUB9NVDVk9F81s4wcnI+bMOpiP5sZw4qKEDUfcFdHTpl/S6NeyUY1JoY8dINrCA9FGy5O5UzijVIVgSZV+pB59d6U0nOJfun88is7V6Efj1KGa5H60uZLqPAup53iMTW+U5uU01Cd7YlevyWwDhoG3BQ2PU1IQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <b73c7dcc-278a-413c-addc-44aef753d1dd@amd.com>
Date: Fri, 25 Apr 2025 07:10:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] uboot-script-gen: Dynamically compute addr and size
 when loading binaries
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: andrei.cherechesu@oss.nxp.com, jason.andryuk@amd.com
References: <alpine.DEB.2.22.394.2504241808470.785180@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2504241808470.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::7) To DM4PR12MB5277.namprd12.prod.outlook.com
 (2603:10b6:5:390::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DS5PPFEAC589ED8:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b78a37-0549-4b5a-4278-08dd83b774c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bElFS0RoRDhURzlEUzZ6dU5hL0xrUEJVdmR1MUhsallQYlRaQVRtZURaS2JP?=
 =?utf-8?B?MzFaYVJRend0THlXckQ1Si8yTHRVcCt1anNMNUkvUUd3STQvSkJQMlFudDhG?=
 =?utf-8?B?Q3VNQjF4cW5yMXh5MzlJYzFDakRXVzlad3BETkxlbzVsZ21CWDBYNmwwYk5D?=
 =?utf-8?B?Q1JGS3VRQXNwdThVVFQ5bHZtYlJOVTJLTUxnT3lXRnJXQW5BY05pYzI5cnkv?=
 =?utf-8?B?dGtpZUkzQ1hSbmVVL0JJTE9CS2VzL1lLUDZZNzl5OFg2UUdPeGN1aDdOeklN?=
 =?utf-8?B?SE1jVktsTjF1R1BmRjNKSXM0Y2NLQkxIL0lqS2JvSEExQ2c5OHIvL3lSWEdV?=
 =?utf-8?B?N3dLeGRNVUFreHprS1g1dmJpN3BWTW9tNlBiZ1UyMHEwSHlLYzNrbGpkS1d0?=
 =?utf-8?B?NjE3eUFVamkzWk9xS3pPOVZNRVNTc0l2UjlYNzBoK2RtQjN4RVpqUlVodlBh?=
 =?utf-8?B?K1h3WVltM0srRExHcm1JMHJ2Vnlkbm9FQkRFODdqbXNXTXEzTkJicHlrQXpF?=
 =?utf-8?B?T2VDazd0WUNmeVNVT3NkNXBtR0ExZ05nQU1JQzZUUkRoY0FCa3dWNDZ5bm9K?=
 =?utf-8?B?d1JxTWNvbFA0M0Zoallpa09NbE5SZTdYM250a0g5R2JFSjFta1BXeWczcEt3?=
 =?utf-8?B?RG5PQVNZTC9nc3h6ZTlyM2daeGZqMlpSM0pWT3Uzdkh0ZStLam9aWUVyci9z?=
 =?utf-8?B?YW1LQTh1cWoxZEVCK01NVEdHa09LUURRV254WTVHaXNreWRKRHdIWjJ1RzVn?=
 =?utf-8?B?TTVUZUxxTXA0T2pIa204ZDhPUWU3V2hBTFRySGZ1UXpsaHhFRDI4TDAybEtG?=
 =?utf-8?B?OW9zMGFZaUppKzF0VllvVHNybkRrV0xFVnV2SGxET1JsRjBPUFBRQlFHWkwr?=
 =?utf-8?B?UjllRUVyWVpuT0V1aEJDNm81WnRHekxDdmNTamFpWlh1UlZadGJ0TFQvSWVD?=
 =?utf-8?B?NExHYWdlcG1PSTU1MlFSRkVkTWxwYngxcmxJbzJhL1ZtaGF6aGxEaXQyMG5k?=
 =?utf-8?B?MGMrNEFqRXBWaDhvcTl4RFc1N0J6VjVwZjFnSGNwWHZBWGtDcnBrbWljYXVi?=
 =?utf-8?B?NWJhcmVzQlo0Z05sSG9mdjBGekdvNk4rNXNLZi9jVUxBbzA1c0dTTEE3ZExi?=
 =?utf-8?B?NmRBNUxDVzVJNm96YjNuN0kxSjNDa2hyaEQ2cDNpSENTT2ZtQWlGWTNrN2Qv?=
 =?utf-8?B?cDNsbkxJZURrbGhma2RkVXpQZ2dlN1dlY1FCYUFPZUZlQk5oLzQxTXB3M1dO?=
 =?utf-8?B?N2MwV2lZUzJra3drMGtSd2pIMGtjWUVqZjJ3N2FMcC9FeURHOXVsendwcmNS?=
 =?utf-8?B?WDlYOTc4cVA3aEFLRnFjS3dRVHdxdHExaENrN2RHaEt1YUlET2cwQUhQL2RR?=
 =?utf-8?B?VVBoQUVuSTdPOThZZUttaEROcUhKMEZ4YWFGYUx2Z0c4UDVEZk0xcUVYQ3NC?=
 =?utf-8?B?ckZiTFdtTGVOSjk5WmdTcUZQclNoaURsSnp1VjVQUG5uQk9JSnZ1REdnbkdT?=
 =?utf-8?B?TkFvWmpNM3lTUGhtSFBxOFJoZDhUeGE5ZFNSL1hjR05Damk4RzhMT241R1RC?=
 =?utf-8?B?dm9aT2xaMEk4cWxKb1FzbGpSZEhZZWZZRmc4VGJGUFdMa1d4NFJLd0ticEcx?=
 =?utf-8?B?VjJFdS9GbFI2U2NrSlFTbS9SMnNEYTdPOXBKS2xJaWVGaVJCNURsTXhwcU9V?=
 =?utf-8?B?VVUwWXRnQkZwdjB2NjZwYzZDQ1R0V1V1R3Nia3l4N3BXQkhybHdGVUJ1R0Fi?=
 =?utf-8?B?YTlMTWdBTStobzZIOUFmcmRUcFE0STBIbVhZQWh4ZEpxbi96ampwdk1jcERM?=
 =?utf-8?Q?3ty5aYI5JdunJFI2goBdYBa7ej8OHyDXbK/Bw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnByM3NrY0NwbnlncHFIbEhoRFlUOFhGZTZyT0cyTForVFl6RW1PVEpUa3J6?=
 =?utf-8?B?L1AvL21ac0NYUXlXdmJ0RTFQRkt0S01pTDlseFRUUGF1WFRtdTFpalU4dXIv?=
 =?utf-8?B?QmpqZjJqMHNsSzRUV2l2cnVyenV6cEszRWdRa1hEa29EWVo2eWVRK1lWV0tl?=
 =?utf-8?B?WFI1Rm5zdUJWMmxZNG1FOENYaXV2Z0ZhSWRjSjFuV3lhTVoyQUU1YWNjb2dT?=
 =?utf-8?B?Uk0vT0N0SmRXK09HYlNMUTJLVlpuWXkzdEcwcU54RGxobjB2ejN5ckR6NHNM?=
 =?utf-8?B?TnNSZjV2ZmEyTXJoMTJmMkJtRkRwQ2xvYmo4cUdYVzRSV2VZWHJkR0VORFpt?=
 =?utf-8?B?Mi9qSnVMQzg5SjJDZExxaVliUUJRQm9tVllDSlVIWjdXMTRUY0FDTzJVMmlZ?=
 =?utf-8?B?RXdEazJPZUMvbVF3RUhzOG1LVDdKWHp2OFZ4UTYyYk5WdUhsY3BzeEtwMWVm?=
 =?utf-8?B?WGZ3U0hvSzJrRCt4Wm1xUmNVbDkxZUhHMGtGczhxQ3ErUU9OeEhEZTM1RnJC?=
 =?utf-8?B?dUQ4c2tUTEw3Y0lZWUwwa21HeGs5dTMwQjZwNjJtbmR4dGNTSXJZU1p6Vk9E?=
 =?utf-8?B?Zy94azNyazFaM3cyeXd5UGt0dnhxWDRwYWYwNk54UHRhai9waVB3WlVTOWVn?=
 =?utf-8?B?UDZMaHpObndCVTZUS2FwWUVuVXlOdHo0dXVFRkZhd3d0eld2b2l6Z1JkKy9K?=
 =?utf-8?B?aGlhc0x6ZjAxVXBNTUVKYnlBSjZyUXphemlieGUxT3pFWE41K2lIYXJpWm02?=
 =?utf-8?B?emYrc2hNbDFKVWM2VWVDUlo1VU1mRDRFdURRUCtGZDA2Z20zc1FyL0kwUUl4?=
 =?utf-8?B?d0RvQlZJbU1VdkxzQXI3eDg5c1UxYk9IMDZnZlVWZDRkaUtGNG9icE5kNXFN?=
 =?utf-8?B?M2c2S0E5ckJxL2FiN0dPYTNTQnpYcDhGYWY2L0w3UitHdFdjOHIwMEwvbW1Q?=
 =?utf-8?B?cm9PSFR5T0pZRFp1Q1dObjBPVURtWitBTWozVEVtTGFEZWFhU0JvcFZ6ajVD?=
 =?utf-8?B?YTk2bFpYNVVEeGh6RVBsdkZLejdIQU9iV0Z3QlduZ2ZrZXRkTXBacGtQUTdi?=
 =?utf-8?B?R3dtcnJURU15T1hqOS9hdE1IT2poQ3ZvNWlPZStWdXBvQ2x3aFRIaWpzVzBU?=
 =?utf-8?B?dGtMc2tvYXB5YlIzTUJmd2gzMUlwaUh3OEcwYStONnlRelM1dTZtd0tZOW1R?=
 =?utf-8?B?SEMzc3BtcDNDR0dpcFZFaWU4SW93ZTJmSFVYc0tMWG5UcXRyNXdwYVFZeHhC?=
 =?utf-8?B?TEJxOHpWQTRzYTBlM1hZZGFLTDcxaDBYT0JkNHNUQUx0eG9wSVFKbDZIREdl?=
 =?utf-8?B?T3ZDeDVDN3VoYVQwUjlCU0ZwOWZIaU11UXovS2NSQXJxU0lad0luQlgwYWVE?=
 =?utf-8?B?RC9XZHFTenVLbXdIdVpOa3daQnpJQlBXZVNTaGFKWEgxdHpsRGZMTHFhRDdT?=
 =?utf-8?B?dTUwc25ZTzdlcHVnQjJGQlZKb2N3aG1OYlNHei80b1k5dTg0WENzR1BzeVB3?=
 =?utf-8?B?ZzNLZlVsSmlFb0NENTB4amQwVFdWVnhhUDAwVEdmQ3puUGg2bFpvQlZITGVG?=
 =?utf-8?B?UGV4QnYrVDFwbDc4d2RvL1JjRzd6bi8rRTBzbW9JRjc1bjVYd29tRS9zOHBw?=
 =?utf-8?B?b1AxT0JrbTVBWWlUVDlGVzNEZHZ6SVlTeFgxWk9kVmVQOThCT2FYcU15cnI4?=
 =?utf-8?B?QkNJUHpXQVYyKzZvdmozaE80K1RXL1VhNVY0K2lFUzYzSHBjQ1dmWklOcjNP?=
 =?utf-8?B?TU5GOG9lMFJHVlJ3ZGJiVEI3c29HdmFQbGhHKzBJSUhRdThBbmNObjhycC82?=
 =?utf-8?B?NXp5a0JSdUVGSzMzSDFoTWZHOVJsZGRxMXVFOUF3VksrRmNZdUw2aTlNa25o?=
 =?utf-8?B?V3RmV0p4N1A2RzNVcm93ZDdGSWlWUXN4b0gzN0Z2cXhLK0tLUk45bVRnRjU1?=
 =?utf-8?B?SStHMUQ2YXFUMTFmcTlCZDVzNGltcG9tV0xRbWpISTZReWR1bWNJRkZrMHBi?=
 =?utf-8?B?UlZUOGZNeDlLVk9OZHgwTFlkTjMzNVF5ck1lRlJXTXpOVnViZzdkTVBDMGpZ?=
 =?utf-8?B?eVdDelkyZS9BYk5wK3N1Z1VGWU5oQlIyc09UODFnNlRJRlk0OC9OUlZ5WDE0?=
 =?utf-8?Q?nUeU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b78a37-0549-4b5a-4278-08dd83b774c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 05:10:13.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QC/iIFU7JztXBtFlmCFDSsmh61xW+QNuVslcHMlIJ6EdIzjmb0l5oJZf8W+FMeVd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFEAC589ED8



On 25/04/2025 03:16, Stefano Stabellini wrote:
> From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
> 
> Normally, the Imagebuilder would precompute the sizes of the loaded
> binaries and addresses where they are loaded before generating the
> script, and the sizes and addresses that needed to be provided to
> Xen via /chosen would be hardcoded in the boot script.
> 
> Added an option via "-s" parameter to avoid hardcoding any
> address in the boot script, and dynamically compute the
> loading addresses for binaries. The first loading address is based
> on the MEMORY_START parameter and after loading each binary,
> the loading address and the size of the binary are stored in
> variables with corresponding names. Then, the loading address
> for the next binary is computed and aligned to 0x200000.
> 
> If the "-s" parameter is not used, the normal flow is executed,
> where the loading addresses and sizes for each binaries are
> precomputed and hardcoded inside the script, but the loading
> addresses and sizes for each binary are now also stored for eventual
> later use.
> 
> Reserved memory regions are left TBD in the -s case.
> 
> Link: https://lists.xenproject.org/archives/html/xen-devel/2022-09/msg01862.html
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
> This patch adds quite a bit of complexity which is the reason why I
> didn't originally commit it. Now that we are enabling ImageBuilder in
> Yocto, it turns out this patch is required because Yocto invokes
> ImageBuilder before all the binaries are ready and available.
> 
> Andrei, sorry for taking so long to realize why it is essential, but we
> are getting there now.
> 
> The changes I made to the original patch are purely to make it simpler
> to maintain.
> ---
> 
> diff --git a/README.md b/README.md
> index f8039ec..28c9e6b 100644
> --- a/README.md
> +++ b/README.md
> @@ -356,6 +356,8 @@ Where:\
>     can only be used  in combination with the -k option.  This adds the
>     public key into the dtb.  Then one can add this dtb back into the
>     u-boot bin or elf.\
> +-s addresses and sizes are calculated dynamically from U-Boot, hence
> +   binaries don't need to be available at the time of invocation.\
>  
>  ### Signed FIT images
>  
> diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
> index 638154a..ee4af6c 100755
> --- a/scripts/uboot-script-gen
> +++ b/scripts/uboot-script-gen
> @@ -1,8 +1,11 @@
>  #!/bin/bash
>  
>  offset=$((2*1024*1024))
> +PADDING_MASK=`printf "0x%X\n" $(($offset - 1))`
> +PADDING_MASK_INV=`printf "0x%X\n" $((~$PADDING_MASK))`
>  filesize=0
>  prog_req=(mkimage file fdtput mktemp awk od)
> +CALC=""
>  
>  function cleanup_and_return_err()
>  {
> @@ -100,17 +103,42 @@ function dt_set()
>      fi
>  }
>  
> +function dt_set_calc()
> +{
> +    local path=$1
> +    local var=$2
> +    local name_var=$3
> + 
> +    addr_var="$name_var"_addr
> +    size_var="$name_var"_size
> +
> +    # Split data_addr_var into high/low
> +    echo "setexpr addr_hi \${"$addr_var"} / 0x100000000" >> $UBOOT_SOURCE
> +    echo "setexpr addr_lo \${"$addr_var"} \& 0xFFFFFFFF" >> $UBOOT_SOURCE
> +    
> +    # Split data_size_var into high/low
> +    echo "setexpr size_hi \${"$size_var"} / 0x100000000" >> $UBOOT_SOURCE
> +    echo "setexpr size_lo \${"$size_var"} \& 0xFFFFFFFF" >> $UBOOT_SOURCE
> +    
> +    echo "fdt set $path $var <0x\${addr_hi} 0x\${addr_lo} 0x\${size_hi} 0x\${size_lo}>" >> $UBOOT_SOURCE
> +}
> +
>  function add_device_tree_kernel()
>  {
>      local path=$1
> -    local addr=$2
> -    local size=$3
> -    local bootargs=$4
> +    local name=$2
> +    local addr=$3
> +    local size=$4
> +    local bootargs=$5
>      local node_name="module@${addr#0x}"
>  
>      dt_mknode "$path" "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,kernel multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    fi
>      dt_set "$path/$node_name" "bootargs" "str" "$bootargs"
>  }
>  
> @@ -118,26 +146,36 @@ function add_device_tree_kernel()
>  function add_device_tree_ramdisk()
>  {
>      local path=$1
> -    local addr=$2
> -    local size=$3
> +    local name=$2
> +    local addr=$3
> +    local size=$4
>      local node_name="module@${addr#0x}"
>  
>      dt_mknode "$path"  "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,ramdisk multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    fi
>  }
>  
>  
>  function add_device_tree_passthrough()
>  {
>      local path=$1
> -    local addr=$2
> -    local size=$3
> +    local name=$2
> +    local addr=$3
> +    local size=$4
>      local node_name="module@${addr#0x}"
>  
>      dt_mknode "$path"  "$node_name"
>      dt_set "$path/$node_name" "compatible" "str_a" "multiboot,device-tree multiboot,module"
> -    dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    if test "$CALC"; then
> +        dt_set_calc "$path/$node_name" "reg" $name
> +    else
> +        dt_set "$path/$node_name" "reg" "hex"  "$(split_addr_size $addr $size)"
> +    fi
>  }
>  
>  function add_device_tree_mem()
> @@ -358,7 +396,11 @@ function xen_device_tree_editing()
>  
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,xsm-policy xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "xen_policy"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $xen_policy_addr $xen_policy_size)"
> +        fi
>      fi
>  
>      if test "$DOM0_KERNEL"
> @@ -367,7 +409,11 @@ function xen_device_tree_editing()
>  
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-zimage xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "dom0_linux"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $dom0_kernel_addr $dom0_kernel_size)"
> +        fi
>          dt_set "/chosen" "xen,dom0-bootargs" "str" "$DOM0_CMD"
>      fi
>  
> @@ -377,7 +423,11 @@ function xen_device_tree_editing()
>  
>          dt_mknode "/chosen" "$node_name"
>          dt_set "/chosen/$node_name" "compatible" "str_a" "xen,linux-initrd xen,multiboot-module multiboot,module"
> -        dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
> +        if test "$CALC"; then
> +            dt_set_calc "/chosen/$node_name" "reg" "dom0_ramdisk"
> +        else
> +            dt_set "/chosen/$node_name" "reg" "hex" "$(split_addr_size $ramdisk_addr $ramdisk_size)"
> +        fi
>      fi
>  
>      i=0
> @@ -464,14 +514,14 @@ function xen_device_tree_editing()
>  
>          xen_dt_domu_add_vcpu_nodes "/chosen/domU$i" $i ${DOMU_VCPUS[$i]}
>  
> -        add_device_tree_kernel "/chosen/domU$i" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
> +        add_device_tree_kernel "/chosen/domU$i" "domU${i}_kernel" ${domU_kernel_addr[$i]} ${domU_kernel_size[$i]} "${DOMU_CMD[$i]}"
>          if test "${domU_ramdisk_addr[$i]}"
>          then
> -            add_device_tree_ramdisk "/chosen/domU$i" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
> +            add_device_tree_ramdisk "/chosen/domU$i" "domU${i}_ramdisk" ${domU_ramdisk_addr[$i]} ${domU_ramdisk_size[$i]}
>          fi
>          if test "${domU_passthrough_dtb_addr[$i]}"
>          then
> -            add_device_tree_passthrough "/chosen/domU$i" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
> +            add_device_tree_passthrough "/chosen/domU$i" "domU${i}_fdt" ${domU_passthrough_dtb_addr[$i]} ${domU_passthrough_dtb_size[$i]}
>          fi
>          i=$(( $i + 1 ))
>      done
> @@ -504,7 +554,11 @@ function device_tree_editing()
>  
>      if test $UBOOT_SOURCE
>      then
> -        echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
> +        if test "$CALC"; then
> +            echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
> +        else
> +            echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
> +        fi
>          echo "fdt resize 1024" >> $UBOOT_SOURCE
>  
>          if test $NUM_DT_OVERLAY && test $NUM_DT_OVERLAY -gt 0
> @@ -512,7 +566,11 @@ function device_tree_editing()
>              i=0
>              while test $i -lt $NUM_DT_OVERLAY
>              do
> -                echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
> +                if test "$CALC"; then
> +                    echo "fdt apply \${host_fdto${i}_addr}" >> $UBOOT_SOURCE
> +                else
> +                    echo "fdt apply ${dt_overlay_addr[$i]}" >> $UBOOT_SOURCE
> +                fi
>                  i=$(( $i + 1 ))
>              done
>          fi
> @@ -530,8 +588,12 @@ function fill_reserved_spaces_from_dtb()
>  {
>      if [ ! -f $DEVICE_TREE ]
>      then
> -        echo "File $DEVICE_TREE doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"; then
> +            return
> +        else
> +            echo "File $DEVICE_TREE doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>  
>      # Check if reserved-memory node exists
> @@ -613,7 +675,7 @@ function get_image_size()
>      printf "%u" $effective_size
>  }
>  
> -function add_size()
> +function add_size_from_file()
>  {
>      local filename=$1
>      local size=`stat -L --printf="%s" $filename`
> @@ -645,6 +707,24 @@ function add_size()
>      filesize=$size
>  }
>  
> +function add_size_calculate()
> +{
> +    local fit_scr_name=$1
> +
> +    echo "setenv "$fit_scr_name"_addr \${memaddr}" >> $UBOOT_SOURCE
> +    echo "setenv "$fit_scr_name"_size \${filesize}" >> $UBOOT_SOURCE
> +    echo "setexpr memaddr \${memaddr} \+ \${filesize}" >> $UBOOT_SOURCE
> +    echo "setexpr memaddr \${memaddr} \+ $PADDING_MASK" >> $UBOOT_SOURCE
To save some lines, can the two additions be done in one line, i.e.:
echo "setexpr memaddr \${memaddr} \+ \${filesize} \+ $PADDING_MASK" >> $UBOOT_SOURCE

> +    echo "setexpr memaddr \${memaddr} \& $PADDING_MASK_INV" >> $UBOOT_SOURCE
> +
> +    # TODO: missing ${RESERVED_MEM_SPACES[@]} check
> +
> +    # The following are updated to avoid collisions in node names, but
> +    # they are not actively used.
> +    memaddr=$((memaddr + offset))
> +    filesize=$offset
> +}
> +
>  function load_file()
>  {
>      local filename=$1
> @@ -657,10 +737,16 @@ function load_file()
>      if test "$FIT"
>      then
>          echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
> +        add_size_from_file $filename
>      else
> -        echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +        if test "$CALC"; then
> +            echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +            add_size_calculate $fit_scr_name
> +        else
> +            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
> +            add_size_from_file $filename
> +        fi
>      fi
> -    add_size $filename
>  }
>  
>  function check_file_type()
> @@ -670,8 +756,13 @@ function check_file_type()
>  
>      if [ ! -f $filename ]
>      then
> -        echo "File $filename doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"
> +        then
> +            return
> +        else
> +            echo "File $filename doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>  
>      # if file doesn't know what it is, it outputs data, so include that
> @@ -705,8 +796,13 @@ function check_compressed_file_type()
>  
>      if [ ! -f $filename ]
>      then
> -        echo "File $filename doesn't exist, exiting";
> -        cleanup_and_return_err
> +        if test "$CALC"
> +        then
> +            return
> +        else
> +            echo "File $filename doesn't exist, exiting";
> +            cleanup_and_return_err
> +        fi
>      fi
>  
>      file_type=$( file -L $filename )
> @@ -872,6 +968,12 @@ function linux_config()
>  generate_uboot_images()
>  {
>      local arch=$(file -L $XEN | grep -E 'ARM64|Aarch64')
> +    
> +    if test "$CALC"
> +    then
> +        echo "bootm is not compatible with -s"
> +        cleanup_and_return_err
> +    fi
>  
>      if test "$arch"
>      then
> @@ -997,7 +1099,11 @@ bitstream_load_and_config()
>          if test "$UBOOT_SOURCE"
>          then
>              # we assume the FPGA device is 0 here
> -            echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOOT_SOURCE"
> +            if test "$CALC"; then
> +                echo "fpga load 0 \${fpga_bitstream_addr} \${fpga_bitstream_size}" >> "$UBOOT_SOURCE"
> +            else
> +                echo "fpga load 0 $bitstream_addr $bitstream_size" >> "$UBOOT_SOURCE"
> +            fi
>          fi
>      fi
>  }
> @@ -1271,7 +1377,7 @@ function print_help
>  {
>      script=`basename "$0"`
>      echo "usage:"
> -    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH]"
> +    echo "	$script -c CONFIG_FILE -d DIRECTORY [-t LOAD_CMD] [-o FILE] [-k KEY_DIR/HINT [-u U-BOOT_DTB]] [-e] [-f] [-p PREPEND_PATH] [-s]"
>      echo "	$script -h"
>      echo "where:"
>      echo "	CONFIG_FILE - configuration file"
> @@ -1288,6 +1394,7 @@ function print_help
>      echo "	U-BOOT_DTB - u-boot control dtb so that the public key gets added to it"
>      echo "	-f - enable generating a FIT image"
>      echo "	PREPEND_PATH - path to be appended before file names to match deploy location within rootfs"
> +    echo "	-s - enable dynamic loading of binaries by storing their addresses and sizes u-boot env variables"
>      echo "	-h - prints out the help message and exits "
>      echo "Defaults:"
>      echo "	CONFIG_FILE=$cfg_file, UBOOT_TYPE=\"LOAD_CMD\" env var, DIRECTORY=$uboot_dir"
> @@ -1295,7 +1402,7 @@ function print_help
>      echo "	$script -c ../config -d ./build42 -t \"scsi load 1:1\""
>  }
>  
> -while getopts ":c:t:d:ho:k:u:fp:" opt; do
> +while getopts ":c:t:d:ho:k:u:fp:s" opt; do
>      case ${opt} in
>      t )
>          case $OPTARG in
> @@ -1340,6 +1447,9 @@ while getopts ":c:t:d:ho:k:u:fp:" opt; do
>      p )
>          prepend_path="$OPTARG"
>          ;;
> +    s )
> +        CALC=y
> +        ;;
>      h )
>          print_help
>          exit 0
> @@ -1533,6 +1643,7 @@ uboot_addr=$memaddr
>  # 2MB are enough for a uboot script
>  memaddr=$(( $memaddr + $offset ))
>  memaddr=`printf "0x%X\n" $memaddr`
> +echo "setenv memaddr $memaddr" >> $UBOOT_SOURCE
Why is it here unconditionally?

>  
>  fill_reserved_spaces_from_dtb
>  
> @@ -1583,7 +1694,11 @@ fi
>  
>  if [ "$BOOT_CMD" != "none" ]
>  then
> -    echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
> +    if test "$CALC"; then
> +        echo "$BOOT_CMD \${host_kernel_addr} $([ "$BOOT_CMD" = "bootefi" ] || echo '-') \${host_fdt_addr}" >> $UBOOT_SOURCE
> +    else
> +        echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
> +    fi
>  else
>      # skip boot command but store load addresses to be used later
>      echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE

~Michal



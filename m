Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0B4A7FA6C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 11:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941704.1341121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25f3-0002xW-UN; Tue, 08 Apr 2025 09:54:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941704.1341121; Tue, 08 Apr 2025 09:54:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u25f3-0002vr-RX; Tue, 08 Apr 2025 09:54:29 +0000
Received: by outflank-mailman (input) for mailman id 941704;
 Tue, 08 Apr 2025 09:54:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h40A=W2=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u25f2-0002vl-4v
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 09:54:28 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2009::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 740ecb3d-145f-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 11:54:26 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by DM4PR12MB8559.namprd12.prod.outlook.com (2603:10b6:8:17d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:54:22 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 09:54:22 +0000
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
X-Inumbo-ID: 740ecb3d-145f-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDdba88WnAX6FIUSpYxWJN/rxhnnTmM+ljLyTgapXw6vlT/g/ihf3g9aQOd9RxMNI94qeGzt+/++V1DNq3iLdd3eVWwGKCs8FoG1tWRQpkIwKmE5V+PIbwwX5u7lJSjVmObHljbd1yP9891GieXeakipQmua4mR+VIlntA9vGKnZpvelh67CaLyWxJXr0EUSMmcyOjys5ALQVqAoza+RhYD3yO6dqHqHo6XjEJeJRMt8c+Vr9H437L1hDVypCvd46m2ZTJ6twkpiEP/6lUO1MK7eGlLGKUca+1pACkoLssT1b8ZBhGP2vuYiVlI/BDB/o8QClzOZIujoEPYzKag4Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHXAem81hDao2oN467oEsDp8rqTm7P8isDB6H2TtoeE=;
 b=YWcUPQlB5Wz8qErCGSG8lliL3RYbJHd2vKzrbnGlwbGQlU4IHE/drRN80+5jEkiZdscpXV61C02pvNhwsrIg2OyrHPI2AzKBzZBaFonBh0r4nsn+Zhwm+NjSM3hw7wSk27pqvlkuK0M4oQAdwtgRw1EDPVwwZc+3HSAb54boVc69zLhq7+NWoeDEbSgP4BU92IHklsFDEc1aeW+/wIb5pxldfjti/j68o/mMsz7dEKQbSxIq8xqus7U7VBcmcc8kUTZBvUQlV1NIGv+JN6RC27VzMvGIDT/4o9xOfKRinKmwdJ0g1CtWx36PCKTMdxinPEELI1Rh8Eycv+UmHnYWRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHXAem81hDao2oN467oEsDp8rqTm7P8isDB6H2TtoeE=;
 b=XTI9fkK8VdPB3tMjJAGjZhpjky0sRRLuPSOUyq87zbXR40QnhEXP0440tvpXG8uph3eA6gTeMNDPWyJJkmr6jtQ0AbuPQAU1G93zJFH+JDAemgokjgoRwfk5+FYfvCdxe+eVCdG0oNettTezt0PRxFb/7/If5Lhw+YCkVzoNlD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e574f645-0c8d-440d-9f8f-7193d27a9d00@amd.com>
Date: Tue, 8 Apr 2025 11:54:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
 <20250407184443.1790995-4-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250407184443.1790995-4-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|DM4PR12MB8559:EE_
X-MS-Office365-Filtering-Correlation-Id: 5487eb4e-15e1-4231-65e9-08dd7683565f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGxpb3U1MzByOE9FUktFZ3huUFBEWndzMXJlNEdPODZMcWYvQXljZWZreVhF?=
 =?utf-8?B?ZGtiMGdwWnUxMnJFQ05jTkJMakNnSEVxWUkzNWd3Mko0R05SSDR4OHAycy9a?=
 =?utf-8?B?OVVxZXkwaXBNdUFrSUpJdUZHQlg3SVl6emFYY094Y0VydVJ3bjNxT0U0RVlU?=
 =?utf-8?B?ZHFXdDNNOUtBeTdBNDlrSUNqNzZYRTVOTi8zRm5RcHY5bzlZN1VSMHY4c2ZH?=
 =?utf-8?B?SHVFMjE5YjNzM2QwUHJuQjlodG5FK3JMT1ZxaGkwUEt5UGh2Vk1tcG02cDlN?=
 =?utf-8?B?REN0RlJoSUdwV3RCWU4xQnRpRnl6SlhDeFBHbUpkVVBkandRRXBzOFd5OEJn?=
 =?utf-8?B?Yk1iWnJBTTFyMXd0OFkvZnNWdlFkTzA1bnBCbW82YmpESDNEd2JZL2I3bmNG?=
 =?utf-8?B?Vk5maDNrYkR4cmNlYXU3c0hkQnVvT1RNdkI4MmFIZWExTTA1R0pRUS9FMXF4?=
 =?utf-8?B?cFBzTlBOYit6d1oxSlhZbHF1TG1nZFROQkxDaHR2SWNuVjk1S2tIaTN2WGh3?=
 =?utf-8?B?OW9jaWs5Z0Z1bTk5M1RNYkVmRWhVVVQ2RU1pMlFqRElwRTYzeGlIYUlpZUts?=
 =?utf-8?B?NE5KY0FhdkRrN3FLdDI4WVNlNStiRktySHhmT1Nod2RmaHZsc1VKc1lJQXNw?=
 =?utf-8?B?M0FXeUVQcjNEUG0rV0tyTVQ4UWFueDNkemd4VmE5a09XKy8wMEhnSVVtZmdj?=
 =?utf-8?B?a2I2dFJaNGdkTWFZVzRmSjVlbVJTdzkybGxqRytraXVldjZ1aVhJUDloUEMz?=
 =?utf-8?B?UVRCeXUvTnRaNmNwc2Q3OGc2aUlyZlRaWmdxdzVEczFUUDJnWUFEUEZ1TXBv?=
 =?utf-8?B?S0lPUUhjT3J0alVxME80TUZjMFMwcDJ6ZUVLTUxIZHZrV3RQNWQwbTJxR3ow?=
 =?utf-8?B?NnpSQi9BeXdSY3Q4Yyt1amVQb28wL3UvOHp1VmdlSzNVWUI4RUtNWmNXSHBH?=
 =?utf-8?B?Y01WbUZPNURVdGhYb3VUR3psUjQ0d3d6TDk4SDVKZE01ZmF2aVgzbG0rTk9n?=
 =?utf-8?B?K01zT3pRU3h4R21FT0FranRpT0RzL3M2SnhndThwUWVkMVJJYk1tMk55czBE?=
 =?utf-8?B?UlIvdXpYTURzNVRpQXVtTmM3dUtZUkFGVmowRzRnbzdXeGszZkFGU2pqWVJE?=
 =?utf-8?B?c1VZbWpVNlM2eDJqY0kzSk9QS1Y3UlY5MHM0endmR1pzSWJBUWZpT0dScDJJ?=
 =?utf-8?B?MWZoRWxpeUwvdmIzWEJHc1MvK1VwV0J0aDVIK1prdVBoQlFtb1BYWmY5VVpP?=
 =?utf-8?B?aUpkYnBacFlCenNZem9Fa2I0blJQdTBvS1hYVEQ2NFVKd2ZtSTlUOWhxbFkz?=
 =?utf-8?B?VEdHZnBWR1ZVbHNVWFpRMDdjOFUyVWhyZVdDTzc2WklsY3dBaW9QS2NVc05v?=
 =?utf-8?B?cGNhUkNuOVV2dGRhZ0N5dkZkNVJFWnhRL05JOHRIWlM5cXBQaWROdklqZzNX?=
 =?utf-8?B?K0dMcE9oOFdhZXpsQUZFTTBxaUM4Q0U0MW1pa0ZnK0xvQmhCS1R4QVBpd0NK?=
 =?utf-8?B?UlV3d1F2MCtPd3ZxYmRzL3JOMHBDVTNtTmJQZldERmtpcTN2TjF5anB1V25K?=
 =?utf-8?B?WXBDVWh2a1pBRzE4MVVlZ2FPeHEwbXg5aWNTNGNpNzM2a3Q0Q21lRjk1RmNB?=
 =?utf-8?B?blY1cWo0SUNjME81cGtjb3RXd3djT1pWVktjKzYrME9DUmY1bnRHdGxJekxl?=
 =?utf-8?B?WE9EUUVIRjZwV2w0ZWc4cDgwL3FaUXFIdi9GcERISVZHRkFTZWtZZnVtVkIy?=
 =?utf-8?B?ZUN1cDJmTDh5LzFmcVpHeFRNbjloRDZTalI5ckR3bjROWmhweDR4bVpkSUFC?=
 =?utf-8?B?WE9FVkFwdTl1U3VaNWhXcG1SbXNzb1dMN3VoOGVUVDhKTnBVaTl2emNZRHBm?=
 =?utf-8?Q?wd+t+ZSmCgign?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXlWTFFzc2FLRER4Umh3TkdDQ0N3TjZZSGd0V2Jkc0Zsam5sRTU5aUNCajJ4?=
 =?utf-8?B?THF2cmtoYkI4Smx0RVdwQkZZcGtpbmVmVFIzcjA5enpVZ3RXZzVnN2g4U2g5?=
 =?utf-8?B?NVlVZEhCQTJBZEdxK2oxRUQ0UEhFd0RKT29tUUdaMlJDZnp2ZU9qbVVMYjB6?=
 =?utf-8?B?WFpxNGtoY09jTzVSaVc1RVRlWU5jREkzd3E0enVjSUtYTmZnVTJLWC9RaExt?=
 =?utf-8?B?YWlOUmV2WmFCN3FGR0pVejBFZ0I3T0JrU0JZRUlsSThMazQyQmVNQWhBeElm?=
 =?utf-8?B?RU5jaDRzejdXb29uK24wemtCckIxNHRjTWpPWUljY0Z0a2R0bUNiN2dJRy9D?=
 =?utf-8?B?M0MyUjV6SDZybnlTeWlIVHoyZFQ3a2l4b3EyNnNMSDhxb2R4b2EzRWlqNjZ4?=
 =?utf-8?B?MGk5cGJHQnZaS3ByeGQzTVZqRVhyL2IrOTN5Zm5uT21NeFRaWWtuWkVHWFp5?=
 =?utf-8?B?dlNtYlB1RSt5czE4ZTVCTEw2bFVTOTlsSEo3Tk1yNFg1N1U5aUt6eEJ5TENy?=
 =?utf-8?B?ZnBWckQ1Q3ordUpjbC84VkcxWVBJZkZ3bTFuVkNoUEZDWm5oVzJrVGk5NUFk?=
 =?utf-8?B?L0Z0V25oYkM1RE9RQi9aOTZ0NHdZL2ovellqdEpoeWtlR1RNRmdJL1Q5M2c2?=
 =?utf-8?B?clVTVDYyU2ZqNUNqcmVYNE0zZXIxRHdXcTlKaFlKYzd3VU96WVN5VlVlQ2pm?=
 =?utf-8?B?QUxLengxVjdOaUd5c0x4aVVucXBDL0hRbUJoZFBKcW9tR0RVMnB0S2pySmZr?=
 =?utf-8?B?RnNDTG1pQ3JxTTYxU1o1Tk9jNjlUSXVkOE9GZ0xsUXhBY01pZmR2Y0lTL0Nj?=
 =?utf-8?B?ZlRRK0RkL2ZaaCtmVW5BUFFBd0d6d0ExeElyY3M0K28zWWlQSGFNeEl6WEU4?=
 =?utf-8?B?SnNWY05KN1IrVU1Jam9ZTlZIVkd6cHJJZTZBcXZrTDF2VDVSdk5Qa3dMVGFZ?=
 =?utf-8?B?RWNtTzVpZzlYUVdMWUNBcFhscjBPMGVvRXd2eUVRUkZucDZKVlk2OW1iNjdo?=
 =?utf-8?B?VThMVDBFQUdZTDZHQ3RUT0dvcW5DRlFXbldxK1NyTTM0THA0Wmg0SHpxckdL?=
 =?utf-8?B?R2hKemNOR2RVVnQzWFl4Z0Vtei9ObHdkN2lXQytZU2FNTVVwdm4wL3BWRTZL?=
 =?utf-8?B?bll5aWhVa0pObWFTbWxGNEtYdGMyOGZ0MXk4R2MzVVRNLzRoRmpHVGJYZmNo?=
 =?utf-8?B?UWZpV0hSelI2S2dwVy9jQ3dMOGhIMTVVZm1HS0xWWS9Id2J4K0N6WS93S2xZ?=
 =?utf-8?B?UVFvK2ZMakNkczAyMVMrdVdFZTh6QTArL0wwMTZNa21DQXdSUFhXTm9NN3JR?=
 =?utf-8?B?ZjJvY0JHb3AyR1hZS3l6R0xWSWgwUU5MTXRXUENBc3V5bDM1MXNUaWc1SnpC?=
 =?utf-8?B?bXhYN0FaZnFNajVZWHN4R29jZU5xZjhOaERRTDN6VHh0NEdnNzNsTmUvai8v?=
 =?utf-8?B?VnNWamdWN280OXkyVnNCWWpIcDJuekk4VHpXbTRLdHpkbXVQQ0s5QytDdVQ1?=
 =?utf-8?B?UVI4NVBTbnduck04K3htZHd2UGxjZDYwZ2ZPZnVmV3hEb0E0ODhnbTN4blF2?=
 =?utf-8?B?bjhPVU5mZi90R0dQc1hmdDJXbkVLcEU5QlhnL3AvK0srOUZBbnowSWlYZGtz?=
 =?utf-8?B?M2dZUnBDT05MVnVPQzZEdUZtWmVubUV6dGU0TTdYcFJOTWM3TVhhendpc3Iy?=
 =?utf-8?B?SXMvdmtSUlN0VStBM1JTV0FvSDRiOXdua241QmwvaW1SamhmRlczM3pTOEl1?=
 =?utf-8?B?MFdiMERyL0srWUcwUWZjaDhWUnhXT1hYOTJXNzRUTy90dzQ4MTgxeHBkdlBP?=
 =?utf-8?B?eGxxN0dqUHpaYmhOSEt6emhKS0pUTkwzUUdBaERGZElFeVZ6L3pRS1B0dm9z?=
 =?utf-8?B?V0xHV1hmTGxpWXNDY1VsclNPd0JLNDlNUkRtMFBSM09WUVpTT2pRQlBHTCtx?=
 =?utf-8?B?Q2VKNE1paHhkWFRNREJiRDMzRXZXZjNpR21QcjFNMkkvWE5GOWRsSk4rK0Vh?=
 =?utf-8?B?V1Vrb0EwMFNRMHFvWlU4dEVVVmc1V3R2LzR4RjdZcFZ1aXI1RFF6cDVhWXZn?=
 =?utf-8?B?Q2M5OWtLTXNJK21TeXZ4c0UrQTdxUnlTQ3FTbS8vTDg1ellqOWdlOThINUV6?=
 =?utf-8?Q?oCuZQC6nsfQ/tin/detfM6qHd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5487eb4e-15e1-4231-65e9-08dd7683565f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:54:22.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y7RLoN2xOu6k2DhFOTwy3t+DUsCJF2gbhYZJriz0eko0EnHHZHWjvp9Lezj8/Rl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8559



On 07/04/2025 20:44, Ayan Kumar Halder wrote:
> Add stubs to enable compilation
NIT: missing dot at the end of sentence.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> 
> v1, v2 -
> 1. New patch introduced in v3.
> 2. Should be applied on top of
> https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/
> 
> v3 -
> 1. Add stubs for map_domain_page() and similar functions.
> 
> 2. 'BUG_ON("unimplemented")' is kept in all the stubs.
> 
> v4 - 
> 1. is_xen_heap_mfn() macros are defined across mpu/mm.h (ARM32 specific)
> , mmu/mm.h (ARM32 specific) and asm/mm.h (ARM64 specific)
> 
> 2. s/(void*)0/NULL
> 
>  xen/arch/arm/arm32/mpu/Makefile   |  2 ++
>  xen/arch/arm/arm32/mpu/p2m.c      | 18 ++++++++++++++
>  xen/arch/arm/arm32/mpu/smpboot.c  | 23 +++++++++++++++++
>  xen/arch/arm/include/asm/mm.h     |  9 +------
>  xen/arch/arm/include/asm/mmu/mm.h |  9 +++++++
>  xen/arch/arm/include/asm/mpu/mm.h |  5 ++++
>  xen/arch/arm/mpu/Makefile         |  1 +
>  xen/arch/arm/mpu/domain_page.c    | 41 +++++++++++++++++++++++++++++++
>  8 files changed, 100 insertions(+), 8 deletions(-)
>  create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
>  create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
>  create mode 100644 xen/arch/arm/mpu/domain_page.c
> 
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
> index 3340058c08..38797f28af 100644
> --- a/xen/arch/arm/arm32/mpu/Makefile
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -1 +1,3 @@
>  obj-y += head.o
> +obj-y += smpboot.o
> +obj-y += p2m.o
Sort alphabetically. Always.

> diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
> new file mode 100644
> index 0000000000..df8de5c7d8
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/p2m.c
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/init.h>
> +#include <asm/p2m.h>
> +
> +void __init setup_virt_paging(void)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm32/mpu/smpboot.c b/xen/arch/arm/arm32/mpu/smpboot.c
> new file mode 100644
> index 0000000000..3f3e54294e
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/smpboot.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/mm.h>
> +
> +int prepare_secondary_mm(int cpu)
> +{
> +    BUG_ON("unimplemented");
> +    return -EINVAL;
> +}
> +
> +void update_boot_mapping(bool enable)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index fbffaccef4..5b67c0f8bb 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -170,14 +170,7 @@ struct page_info
>  #define _PGC_need_scrub   _PGC_allocated
>  #define PGC_need_scrub    PGC_allocated
>  
> -#ifdef CONFIG_ARM_32
> -#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> -#define is_xen_heap_mfn(mfn) ({                                 \
> -    unsigned long mfn_ = mfn_x(mfn);                            \
> -    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
> -     mfn_ < mfn_x(directmap_mfn_end));                          \
> -})
> -#else
At first sight, it's not clear why we diverge here and move Arm32 but not Arm64.
At least I'd expect some reasoning for this change in commit msg.

> +#ifdef CONFIG_ARM_64
>  #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
>  #define is_xen_heap_mfn(mfn) \
>      (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index caba987edc..9b98d12b07 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -21,6 +21,15 @@ extern unsigned long directmap_base_pdx;
>  
>  #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>  
> +#ifdef CONFIG_ARM_32
Why another #ifdef if there is one a few lines below in this file (below
virt_to_maddr)?

> +#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
> +#define is_xen_heap_mfn(mfn) ({                                 \
> +    unsigned long mfn_ = mfn_x(mfn);                            \
> +    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
> +     mfn_ < mfn_x(directmap_mfn_end));                          \
> +})
> +#endif
> +
>  #define virt_to_maddr(va) ({                                                   \
>      vaddr_t va_ = (vaddr_t)(va);                                               \
>      (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 86f33d9836..bfd840fa5d 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -13,6 +13,11 @@ extern struct page_info *frame_table;
>  
>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
>  
> +#ifdef CONFIG_ARM_32
> +#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
> +#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
> +#endif
> +
>  /* On MPU systems there is no translation, ma == va. */
>  static inline void *maddr_to_virt(paddr_t ma)
>  {
> diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
> index 21bbc517b5..ff221011d5 100644
> --- a/xen/arch/arm/mpu/Makefile
> +++ b/xen/arch/arm/mpu/Makefile
> @@ -2,3 +2,4 @@ obj-y += mm.o
>  obj-y += p2m.o
>  obj-y += setup.init.o
>  obj-y += vmap.o
> +obj-$(CONFIG_ARM_32) += domain_page.o
Again, sort alphabetically.

> diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_page.c
> new file mode 100644
> index 0000000000..8859b24e04
> --- /dev/null
> +++ b/xen/arch/arm/mpu/domain_page.c
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
empty line here

> +#include <xen/domain_page.h>
> +
> +void *map_domain_page_global(mfn_t mfn)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/* Map a page of domheap memory */
> +void *map_domain_page(mfn_t mfn)
> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
> +
> +/* Release a mapping taken with map_domain_page() */
> +void unmap_domain_page(const void *ptr)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +mfn_t domain_page_map_to_mfn(const void *ptr)
> +{
> +    BUG_ON("unimplemented");
> +    return INVALID_MFN;
> +}
> +
> +void unmap_domain_page_global(const void *va)
> +{
> +    BUG_ON("unimplemented");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Additionally, take into account Luca remarks regarding headers.

~Michal




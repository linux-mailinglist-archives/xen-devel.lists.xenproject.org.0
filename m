Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BFA4DD24
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:56:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901002.1308988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQsT-0001yh-IS; Tue, 04 Mar 2025 11:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901002.1308988; Tue, 04 Mar 2025 11:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQsT-0001w1-F5; Tue, 04 Mar 2025 11:56:01 +0000
Received: by outflank-mailman (input) for mailman id 901002;
 Tue, 04 Mar 2025 11:56:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpQsS-0001vv-87
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:56:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2414::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a027c1e8-f8ef-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 12:55:54 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 11:55:50 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 11:55:50 +0000
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
X-Inumbo-ID: a027c1e8-f8ef-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDBgHsKbtQQwW5sUAL/VDcQYktOO9gjRR17FBw9zu9T732fo6R5cf1arzlV0A8pwM3Nvjo0cg8qi6oR7hMeFwXylyQlGnGI5+6oCudubNAfVCp5bHRYhbqJzLj6MkfQdBVnCtUDOIZlEX1rtY6ApYC70TZkmgCJGAoXXK3HbsSDLo5p4H8VkrHYwcCZOyiWMjZ09EI/IqJCnGbPICWDsny0ddWhHmeMbSClnB/onEkgcEaDDbeuQDo/JxzLRh9K/vZqKPRNohCp6qj1wlwlnRNZh21FMh6z93+5PjvF0e2KUlPuJimg6c1zqPHh328XDI594o+VwW6HkmwbjoCvKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXwtg9EEMj5gxg7k3BpEXUZcWMEIR7L206vfuRPdqnw=;
 b=YYaKreNQ0SY3+hX3nE7HgGSflZxcodXDWfLUZOHgIk35pvSBucmkiYNcP+1gSLy/JjTk5i1e9k9WChMaT8lteWy6TupGFDdwfYr56C28LB2alPrLM3RX+/X/0k15B+kxCxIuefTQIFi/tV5OySWE3tmEq0UI+mzrxNpkStME9olOgAHa4h9tJaLxz5leNmYq9YS4l/+oyNzs4wHDeoIqzjLYylnGUWUz1mI1xTFwKj09He72gMnJvCuf0kaTeaosyAfUhpjT9Qsi+ZxloTNiY/T7emOxGQIGKoeBEKjuT4QTn6dYs5gHMPJFqabViPrdCRw//rysa6wYXrq/72FY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXwtg9EEMj5gxg7k3BpEXUZcWMEIR7L206vfuRPdqnw=;
 b=vnSyQtlXq2m5AtrGIr0yG5P7aPs9P6keRZiDwzUITFIiakd5CwZX4Q0QDAeSqPH787mces7FobwrNrEu9UFJrVvOZdOTZKiGbm2ug5F6USeK0J9WuQkPYy+6iZLafUST5sKbZlDH+lRw9c997S4Hvd2YWa26LiuQetKkj+3Q2DY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5c564bd2-dc19-4f3b-b4da-751a50a3ea14@amd.com>
Date: Tue, 4 Mar 2025 11:55:45 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm/mpu: Introduce MPU memory mapping flags
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
 <20250228161817.3342443-8-luca.fancellu@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250228161817.3342443-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0203.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::11) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5508a7-c23f-44a5-bc38-08dd5b1381e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGkvYUVSaVJib0ZCYVpXd2hLTDJUSDJWYmtSYnF5RDM2SkUzWk04amlON1ZM?=
 =?utf-8?B?MnAwbXR0dWJDN3c2cmVJd0J5SlhveVBjeWU2d3lKcTNwZmhuVzZmS3BYd0l0?=
 =?utf-8?B?cGxMa2lPajhrbWRvSUxaQlpCcEtidHc0dEtMSWozM1J4eEluTVVHYi9rR0hG?=
 =?utf-8?B?ZTBTL1Fvd05HbXpSWlZ0cHgxT3hLUzRieGNGM01wMXgwbjRHeXBZUVJiT0lp?=
 =?utf-8?B?MDllbm1Hbjk3M2FadGtYeTlJR2dtT00rNVdoQ2ptNXdoY3B0d3JEUy9wRUlU?=
 =?utf-8?B?QitQVlRDZUhiNG0yVzM0SFNoQ2JpRWVZSWxiWU9jNEtDSW45ekRhSGJpd0JL?=
 =?utf-8?B?SFprTTNLcUJGTEdqV2tKbHJ4TTQzUDRCOUlpa3h0R3pTS3RwUzhXODR0dGpB?=
 =?utf-8?B?c2F1NWFSa0lJbWhwNlVuOFpNdXdVdjJkbkRRc25MeGYzUVVPbzNlZjc3K1l6?=
 =?utf-8?B?RjFJR1pwQVZlcEFDMVFubHdkcGN6V3M4eittaDhnREtuVk0wTlRwOU1vQzlo?=
 =?utf-8?B?WkorN2lGWWpmVndHa1hsUXhCcURXamo1d1J6WHZ2SS9SbEJyaVhiQ2FBdUR2?=
 =?utf-8?B?dnIzVmFPM01BT3ZFMEduME1HZFZ2VDZzVGFqcTZVUjFKUXQ4U2xBcVR6YUpI?=
 =?utf-8?B?RFJxRk9qdXJla3I3NUx2YzZoWklkOVJzZlNhN2VrWUxiOFNjTkJkL0k1VXlN?=
 =?utf-8?B?bFA2bTBOS0E1d09XaTNieU0zbkZSalV6OUFxclNDdnhkQ3FFbmpCZWhZeUtJ?=
 =?utf-8?B?SHlkdkRKYkdVQVJxeGxVQjJoN1VXY3BBOEtjeHpGMXI4RnR5Z284eFVoeDV5?=
 =?utf-8?B?bmkzakhOd1M5bUhlcFk5WWNBSEkzcTM0VnZ6bHg0VVhkU3owM29WZG1mZXBB?=
 =?utf-8?B?eDB6QjNlSXJXUVlteUhiMzFzZkpPbVpGczZpZENZUEFtYzdaVElnNGVQaytD?=
 =?utf-8?B?bXlDQzdQdCt1OUF2V0M4SVNyRHhULzF5ell3UWFjS2h4MXlRdTFKanhQeTls?=
 =?utf-8?B?bFV4RTNMSGxhdU9HMytFMFc3TVRCSkg1OWhHSzIxeWVhWG1KYTNLOCtaL2ZC?=
 =?utf-8?B?Z25DQXQ3T2RHcHJzNllPN3B6SFZIeXlvZnlmWUhPRUlIZEJDelp5L2ZlZW9J?=
 =?utf-8?B?bWsyQStBTll3RlRPdnEwWmFPVFJKUm8zaDdNRy9rY05KTC9DdVgvQ3pUM3c3?=
 =?utf-8?B?NktCUHVkblNqK1dHeUZabzVsRjkvRDJaK2xScEcyamF6d0YvaUxPV3ladERH?=
 =?utf-8?B?WksrQWFyQ1BDczFzSHhMdExONFYwQkNvaDFxeWJjOW5RWjh5OU1rbGpzWXdE?=
 =?utf-8?B?elFUbHZubGtMNHBNRFlXcVZhM0pucm9VeXZ4TlhzV2lzaEdPUXkvbFJhc0x4?=
 =?utf-8?B?TnFURnJKakowMWxBcG1VVU83dDlTWDdwelV0NVc4U3YwaTVtYnIyRnN6STRs?=
 =?utf-8?B?SWo3TXlFSENmdVBuRFhXVlhwS1NSeUdBbC9SVm5EU2tENkppa1lNSktmSEg0?=
 =?utf-8?B?Wm5lbVFHam9CcUNSSnlycThvczRRZHFicVpLcUlXWllhdThNczRKeU5kaXF6?=
 =?utf-8?B?NHVWMFdCbUZjY200UG1mSEFPUWxScVlDM1F1QmVmbXZFUndjOG40SGUvZXJl?=
 =?utf-8?B?VngvbjJrdkMwOHB3eklmTGxXRnhyV2dNcE01dmhacVZ5QnJpYnZzODh5M3la?=
 =?utf-8?B?dDNhTStWaGtUTkhMTnJwRHhzVmNmVEIvY3pMUEpxOHl1aHMxRHBUS0RnOTBV?=
 =?utf-8?B?eG4vZVhsRlBCMmp1M1BKV1dIaGwzZ2xXYnBSQkhLNGtBVWVIYTlXRDhBL0J2?=
 =?utf-8?B?UEF6cmwvVUJnYk1Rb2Zxc3dNenBsSlIvZjg4MFljUC96NzhmektlTFlyMm11?=
 =?utf-8?Q?4hRo+JN8NqI9B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU93dmVXcTkyNkQ1WVErUHhGRFhmOThCOHFiK0dwUXBJYzBNZHQzSWpwMVkv?=
 =?utf-8?B?QWlnVGlKNnQzNHUzTTh0NFVBSFlvT2kzRlpCNm4zMS9rL3ZHOVlyOUNCV012?=
 =?utf-8?B?M1FGVHUwWEJsNWMzVnhBdzlOS25TbURvdWpYOTN1ejlXdmN2eUV3WU1vL2k0?=
 =?utf-8?B?Zmt5allzZU5sMnI3OCtvTjkxRTNTWFBBOTM4TWtUK29WQ0wrWmY1QzhmNXZP?=
 =?utf-8?B?YVRJQUlxb3RkSjZ3MnY2Q1c1OU1FZ2VSLzMvd2dpaEZ2TXZvU2F4SjZpV0Nz?=
 =?utf-8?B?NHdscnorM1VSTzg4b2t1d1Rhbkxjbm5NSWZEUWI3anRSWUp3Q0tZOWVWamRH?=
 =?utf-8?B?eFdXbzZoU0RjVXdSTFNJMGdWSU96N0pYZ2UrNDRDRnlHNDdBTVU5YXBpQmh2?=
 =?utf-8?B?b2pqam1lbnIrUlJ2Z1VTcjdNbVpIZ0lLY1IxTGVMT1NyWmZOMi94cnljZnZk?=
 =?utf-8?B?ODJOMUN6NE5uS1VKVnNVdWFkSFRVcllVZGVYeVRuS0srdXBuV1RoSVhhVERu?=
 =?utf-8?B?YVAvUnRQR1hUS2FsNmRXSUdnbzh0WWJvSjV4aUJXS0J6WUxYb29WcldVNW9K?=
 =?utf-8?B?Mk9QZmVieGQxY1llWVNsblkyOENzOTQyTlV1bWRDR2JBcTlxMmo0citZYVVR?=
 =?utf-8?B?U1BKMFNUTTdBdktBQmlLai92WisxQ0llS1lmNEtQTWc5S3M5aUUwVGtlM1dL?=
 =?utf-8?B?TmYvc1BUL1RIZWRQMDlKaHgrRHEyUDRJaE0yRGVOUlA0d0dKM2J0Yk00Szls?=
 =?utf-8?B?TTZTNlVUTUZ6YWpmOGF1U2R2WDkybkluUHNMNVc3V2RoUURQNWFvODBQRlpu?=
 =?utf-8?B?VUlBZ2FmN2RBQXB6RmtEUExveFV2Q3pvZzZIWE4vNy9ha3l6c1p4aDdjVGNL?=
 =?utf-8?B?MGRERkZtUTFCKzIyR3VIZms0RTJ4NnlDQllvZThDbUh0WUZZRWNRdmNGazVa?=
 =?utf-8?B?NUNRNjhucURpc1EwWUdOckxrblBlR01qYzdpZ2VQcUQxNkh0WStGWisxbDhS?=
 =?utf-8?B?eXFJZjlFVWh3bmN3NEhCY2g3UDBJQkFtdGVWQnV1VGlwNnJsUVh2RWxSQnIr?=
 =?utf-8?B?bVJWVS9mWVJOdDFBOVMxaG9DM0t4UnBtVHJxaWtxMnVmUnRIRVBlRm9meEx4?=
 =?utf-8?B?MklXdHhJeUtzZkhoeUkxOWlSakNNM3lqTVcxN1JlODlGemVybndIN2xJQjJ1?=
 =?utf-8?B?MTlZZ1pCZ1ViLzRUZC9sRUdwOUU1MjRXdmVjMTN3bTFaZFc0eFJsRmRlb0Qx?=
 =?utf-8?B?YkFaNUJVeFI2a1YyVmFiN044Uy8vaC9jMnNHNG9EY1RXZ3ZvZDRpUDBkbTds?=
 =?utf-8?B?TjNyWlBKWVZFUURUUE1QTklNQ0xQVk1FRWFBeXhYYXdYUGNYSjJSTjJMeW5K?=
 =?utf-8?B?eWRsNFplenozSUVueXZJL1ZTN1hHUDlCVXVYdTI5UDY1ZzFVMU5aTjgwYWgr?=
 =?utf-8?B?K2hWWkZaQk1oSUo1MGdBbVFUanhYTUJqL1pzMHl3eG0xOElwZlBmYnYzTjNS?=
 =?utf-8?B?M0p1VnMwRnA5UG5TSnFtVlY4QUlNb0JZeXEzOXVIOTRRUE1PS0loSmhoWm1y?=
 =?utf-8?B?K3QrejJGOGlpWEpQM3FkK1BwalhGWldnSDM4RUlzckNLNWpCRHRWMmNFWERh?=
 =?utf-8?B?STdLQXdnRXFHT01iVk5yU0NhYjVuQVNHRnlkU0VpZFpadTRnMndzZ0JKMUpW?=
 =?utf-8?B?Q0ttKzNlTXlXeVZvaitTZGZzOE0xdndSb1cvT05sUThudU9WUHp2K3Y0dVJp?=
 =?utf-8?B?c3JlbHFjSUxya1JRdmkrSlJPUnNDTWU1enczNXpjSlRkWjhqUE9sZ0tUNVRj?=
 =?utf-8?B?bDlXTHBLcWxKS2RrTHluS3I3YzlGQUw1ODU2RnRzSkNxa1ZGbktlR3R5cXVW?=
 =?utf-8?B?WUJWWktaeVhURzhMeS9nUE1TTjEvWWtGY2h3SDFreFgzY2tsZ0VBUHptYWFE?=
 =?utf-8?B?NGkwLzhNZStjSWhwaWVmNmw2R3JKbFUyakh2SWNtOG5vSjI5TDd2cCtWcEU3?=
 =?utf-8?B?L1phLyt4SmdxclMrSXo1SnlMTjlYRXIwQjNNaDZxa0ZISkJKYjZ6aWFZY0VS?=
 =?utf-8?B?WjNwM3MyUzhNd0VhYUpoSVBZZnF2L3NLSXgwUDNFTkhXanoxU1VqdFlpQ0t2?=
 =?utf-8?Q?E5u/FzOGO6zcxe/mqyFJH3rsp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5508a7-c23f-44a5-bc38-08dd5b1381e0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:55:50.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5R/WrHEL43xNgsEyrq6cMQuRTlfiQlIoFQeJLbVK7CvN/SI4YMdSsPP8icShwuXOZg+TR73s/Xma0872XAraw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853

Hi Luca,

On 28/02/2025 16:18, Luca Fancellu wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Introduce the MPU memory mapping flags in asm/page.h.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/include/asm/page.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
> index 69f817d1e68a..22f7d2c6cb30 100644
> --- a/xen/arch/arm/include/asm/page.h
> +++ b/xen/arch/arm/include/asm/page.h
> @@ -62,6 +62,7 @@
>
>   #define MAIRVAL (MAIR1VAL << 32 | MAIR0VAL)
>
> +#ifdef CONFIG_MMU
>   /*
>    * Layout of the flags used for updating the hypervisor page tables
>    *
> @@ -90,6 +91,30 @@
>   #define _PAGE_CONTIG_BIT    8
>   #define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
>
> +#else /* !CONFIG_MMU */
> +
> +/*
> + * Layout of the flags used for updating MPU memory region attributes
> + * [0:2] Memory attribute Index
> + * [3:4] Execute Never
> + * [5:6] Access Permission
> + * [7]   Region Present
> + */
> +#define _PAGE_AI_BIT            0
> +#define _PAGE_XN_BIT            3
> +#define _PAGE_AP_BIT            5
> +#define _PAGE_PRESENT_BIT       7
> +#define _PAGE_AI                (7U << _PAGE_AI_BIT)
> +#define _PAGE_XN                (2U << _PAGE_XN_BIT)
> +#define _PAGE_RO                (2U << _PAGE_AP_BIT)
> +#define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
> +#define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
> +#define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
> +#define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
> +#define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)

Can you point out to the references (in some Arm doc or somewhere) from 
where you have picked these values ?

Also, AFAICS you are not using these macros in your current patch serie. 
So can you send this patch later (along with another patch showing the 
usage).

- Ayan

> +
> +#endif /* CONFIG_MMU */
> +
>   /*
>    * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
>    * meant to be used outside of this header.
> --
> 2.34.1
>
>


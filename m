Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E28029750BB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 13:26:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796452.1206046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soLT9-0000rP-F1; Wed, 11 Sep 2024 11:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796452.1206046; Wed, 11 Sep 2024 11:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soLT9-0000p7-Bl; Wed, 11 Sep 2024 11:25:07 +0000
Received: by outflank-mailman (input) for mailman id 796452;
 Wed, 11 Sep 2024 11:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6AyE=QJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1soLT8-0000p1-Ni
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 11:25:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d65ec1f-7030-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 13:25:05 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB8825.namprd12.prod.outlook.com (2603:10b6:510:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 11 Sep
 2024 11:25:01 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7939.017; Wed, 11 Sep 2024
 11:25:00 +0000
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
X-Inumbo-ID: 7d65ec1f-7030-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yzdc2iEfyeH+b2dXEjiFsV+hjxVmZHzTAt8L+pm4armP76bWWup6T8XXTB6eXC1gOhvfEGMMol7YR5V/GvTB+QceDmWr0J9gGM/Nk24feRwhqFxwTrPDzXz+h3bwl91qsqagwQTx46EUOFQQYHT/MvprnME3dleWg/ru7oPEobhpK9yJavTPGZCRJIv02KR/tFKBfTmnZoC3TLQgSbCpPG39+10R1PoqMJuSEE+K1jKe6hlFXK+lPm2n2TxhhkehGjG/paVhFJIfrBXWBVQnJNLY0IiiOyqIDVsk1EhKOUtOIwvIBJURJUjqbSzIOuTknXhuyr1kh1iCkzEmCkk7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UO8QjgI9SO5lOJ1K6gSEFto5jY/cbxDS0TLAwqJyUvo=;
 b=tpebARlV6JeIH9PRqJeHuEbKxmeTZsBZxjVHZkAJSZPrLAkJhqUVyCtHK2Y1v6LWUIDFTMiMwdInkdJ5ENNVIagtA4dCn5VrWko9axc5aWErTenBYB0iLvy4M4ldxg5HOfq9YzAwgD66/z0AQmUNg4aJVg7YjZTZrqWIowA/zCNsXHfpBfmtHhz01E6r7JuRw6BREOy3cK6W4IaP2OsfBFV6ydLgScTKhG6c4vdqqKLxtJFOXRiJLL+Mp0DxmSGZJ5aMYnJsrUuLMm/dpyQE7CahQtXTN9xgByXgi/bZjuJPgmzTr0H10+lSQW7tcbTxK+KBCiTTASJ3MqMSUaDDdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO8QjgI9SO5lOJ1K6gSEFto5jY/cbxDS0TLAwqJyUvo=;
 b=U4/KURQl8lxSBYtlZCf4WFLjQmzfR3osWn/3VysBe1w+YNvkOQWvMZUwdf5X1H97LcfxifM3OGN3hUlTXCzrB/BOFzMiPUr7vQ74moUU9XFUFwtDdkVyYD+uYwjQ9APg1FptfEh2orbhc0RhjVKAxOvth1TjWe6YdSNPZVgaKC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <802d7cf1-98cd-4ac9-9d60-24aabaaa9e19@amd.com>
Date: Wed, 11 Sep 2024 12:24:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: fusa: Add Assumption of Use (AoU)
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20240911094456.2156647-1-ayan.kumar.halder@amd.com>
 <918755fd-ef73-4dd5-b77d-f386f8f74ac6@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <918755fd-ef73-4dd5-b77d-f386f8f74ac6@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 616fde21-5737-4849-75ac-08dcd2545f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTZwaG1va3VvMUREYWU3emFNWHhkSWxwcU5tZWt6em80V0w4SU9mM1Rsd1lo?=
 =?utf-8?B?YXRNSnVabVNTUFJENmVmV09XRDg3YVBVMFEreG5NVlRGdHVXV3FTcEJMQlVX?=
 =?utf-8?B?aGFVQ2crejlJbjM3VjZnWldvSU5lTURTdWZQRkhCZzlRcWRmU2xGRE9RbTBk?=
 =?utf-8?B?eVM1WnpEL0RZNjRBbnZPclpJZHVHVmFoZVpvWWs5elA0dkpFSHFod1VzN3g1?=
 =?utf-8?B?N0pmaUxNZHhZaERWR1hzUTdUTUhtWEJUMEI3Qnk2YXJBdXlMSk55Z2h1dnpT?=
 =?utf-8?B?NjQ5L2wvUVhRTGpXalNKR0tWbHNJaWQ4RGl5L0ZlTkttZUlsWXlBcFVNZ2pF?=
 =?utf-8?B?VmtQOXZJMEhEWnA0aUV0RGtOMWxDNFZUNzNoU1M0OE9vSm9jUmFXTEUzd2FR?=
 =?utf-8?B?a2xadUdCY1h4SDVCMlZzSm4yc1Flb0RNdVVZbDZFOWtYZjNDa1R6d2RSZkd3?=
 =?utf-8?B?dUFKOWZxMEREMmIyRitrN2laMWh2OTd2bnhUcHQwZ2lJK3lXY0RicHJ2VjlK?=
 =?utf-8?B?NEJSTU5YRStnYjRBQ0dWdUhxbkkraUVYVGIzWkp2VUlQZDNxdzdORUlnMW5U?=
 =?utf-8?B?WGxRdlY4a2dybks4b2NHVkhETXMwWkl3N240aHAzb3BsMGNNRGVEcGZjNEto?=
 =?utf-8?B?MWNQMzJlcVphajVkUWVpRkhQN2lRc3RqYXRIQlFpMVU4VjNqWk5GN1l5SHlZ?=
 =?utf-8?B?UFc3Zk1yTTZjUnZBc2NRYUNXdE5MQUN2MDdXak1nT3NhUHNWZGoxRjlWOXh3?=
 =?utf-8?B?eVhSSDZ4d2pZb3RBMWNiSEFwc1d5WVdRcmQ3QmdJdjlqQ2ZKcm9waWFMYjZP?=
 =?utf-8?B?VUc5Wjd2WWQ3WEJKYXhSYlBFMEF2cHYySGlGdlFuNVlZRmpwcHp2ektoaFFW?=
 =?utf-8?B?TEhoY0JEUHhMc3BRK1g1citSeTNIaXdPNWhuZXRBa2ZYVGVSc0diRDdpRTQ0?=
 =?utf-8?B?T3pScm1hZElVeVBJaUdBanBWSkg2YlZvU1ZLNWwrK2JkbXpzdUIrSlJ2WGRL?=
 =?utf-8?B?T3VhZ3pJMmpyVERSZWoxNkMvem9Xd1lDaFhMbkpOYXM3Sm9raVdBS2NjdUlo?=
 =?utf-8?B?YU9iYnNpN1JmRXNobnhKMW56dURsS1pKUFRxS0tHUDlhRmUvMWVlQmJ1aVRX?=
 =?utf-8?B?LzUzZ0VVakJkR1RWK2lDdUoxdmdqbWkyNTh5L3oxU1NZNUppNTFjU0VYVzV0?=
 =?utf-8?B?eEwyTzBjdWRkdC9TODBIU0ZnNUZSY01JYTFUNmxJSkNLcEpxMEFYbUlIald3?=
 =?utf-8?B?ZTdDMDZ5WFhWQnRHcDdtL0ZzcUlTYXRaZmlLTG9BaDMwK2RlZk5La0FmSHFD?=
 =?utf-8?B?NTF5Y0w1YTBucUYxZmFGUEx0OTJBK0Z6aGhoOVV3cUpQblpwQ0hZZDQ5RnlU?=
 =?utf-8?B?WjZ4d25WL3BXeHpJc2JzZTJBcGVSRWdFYzhSUG1EUWEvS1c4R3ZqdjBwSytG?=
 =?utf-8?B?cDhIdThJS2twRzdpS2UzaDM4b3FXQWI2QzFEb2xpVjhtakpaWDB4bVhySTZJ?=
 =?utf-8?B?VjduN1NtRWZhSndxNWlwd3J1RGtSdFRHaXljcE1PbDlvR2lFZFRiWURMWk9k?=
 =?utf-8?B?Njk2QnI1MWFBSTQ0dHk1bGE1bmYxajljbmhFRVR6VGErd2lGRWhiQVpsVnZY?=
 =?utf-8?B?QkIycEZoVWpWQXlzOFhtOFA3S3o4eDFSNXdpSTFaeEtkcjljSlhqdHZnVnU4?=
 =?utf-8?B?cWxhVjBkV3V5cGVCVFhSQjZ0ZnFvMGxLc2NXeDFwelczb2sraE83K1d1SWxB?=
 =?utf-8?B?V3g2UHBQanIwMER4eGVyYTlmSHdCMXhZUXN3eEc1bmhwMjh5T0JhakNvQS9B?=
 =?utf-8?B?blBhTC9BbGFHd0hZTmcrUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXdqQW1zd3Z6Y29IMi9yUENpUE1FYmN2VVVaeDY5MnR0WUdoaWZtNHAzM0ZP?=
 =?utf-8?B?QmVNZWhPcEFKTXdydDlybytRRmNFbXN3VG9Zd1Zja0lEamU5d3JqS1czVnNi?=
 =?utf-8?B?VkNnTGpla2hReEFRNmtlY3RHY0ZyQS9SQllwRllmS0c0ZUlSMVNON0hpT2Rw?=
 =?utf-8?B?c2thZXlCeS9XSHk0YmpYRVgxbnJlNmNqbzVab013S2VUbW5pYkFqWjNKSkFo?=
 =?utf-8?B?bGZjOFplYzV2ZHgwTklVUVRFSFQrYnpoREtUN09ZVmZkZ3pGUVBxRWM1WWxB?=
 =?utf-8?B?SWlXa1lOamJWUUtNWXU0OXZCOVZlbE9QcEl4UVNmNElnc2libmpzSWRETlQ3?=
 =?utf-8?B?NExNWjFCQW9CSmR2aENYNHpqaWZHSFdMRStYTnArN3NPbU5QTnl0b085UVI5?=
 =?utf-8?B?RUdxZHB3Z3JMSDBIR2JvWGx6eXNUUGlIM0FlSGd2bXVsQi82U0pFMWE0Vk4w?=
 =?utf-8?B?YUtzc2JkQ3IrS3R0V1dIZDl5Wkx1Z1NXdXBFYlU1cTJiMzc2K3U2VU4xSFhE?=
 =?utf-8?B?cjlpdHFKM2phNGFDV1d4eHV2MTNzdHVPcVBKWjR4VDhtR0tCUlB0TEhOa2lB?=
 =?utf-8?B?UkZndzVOZllqWG8vZDNncGRFZE9tM2ZnSlZNL1p1aXh0eVlPT1VvVlBuM05D?=
 =?utf-8?B?SmZhV056YTZPOEU3NW9XcENxSjNXWGsraXc4TXM2SHFtWVNIU2NtcGlURTZa?=
 =?utf-8?B?bmxwUzdacEtUZktrQnhES1hKdG5ObHdyeHlYTW5lZGkzZlhOOXErdnUxRUFP?=
 =?utf-8?B?aGdJVEJZKzZIYmsvTFZhVE00RnVJanBqeHZlOWJJNTllbGcxSHF5cE5JZ0xw?=
 =?utf-8?B?Q0tndmpQenBJVnhOU0tZOEIzblFrUDZncXRDQjVRV1dWNVRlUHpOVkNhSExp?=
 =?utf-8?B?Y3ZJL1VZb2o1Znp5cDZJOTJDbzhGT2dCSkVHMDQvNiszSnpqa0JJVEhRN2I5?=
 =?utf-8?B?eGE4RWhidnlYVXdIQytXS0l4dkRjajYrQjA0clNNdk1tNmJyMDExNjVSTWF3?=
 =?utf-8?B?WEprdURXTElMcDUrYWI5T0pjK29Jb0tVODFHMjZ2REE5M3dHdWlWbFZXbUZ3?=
 =?utf-8?B?MExhWWgrOWVlMmhMUUlpMVZtRjZyRkozNklYOUhVZU52V1JFN1ppSUtPaVhi?=
 =?utf-8?B?NFZqbVkrZi90RXRVRWlyZ0NRNkQ0RTNhMEIrNUw4YkVTc3BsM3dMN0h0MlZW?=
 =?utf-8?B?b2REdS9CZW1TcGRrRjJVU2c2eW1sZDhVdTlpYUZYS0dicmJ0b0QwZTRKSDVy?=
 =?utf-8?B?R0JSK1BueitBYk5wd0taYXJ2MXY1T0FVQmNxVUYxT2NIRG1XNjJ1dWUrVE1Q?=
 =?utf-8?B?WUI0UEQrOTFpZnI0cFBSOC9rZjhhN01MZk11cFVhVDdqck1CZ2hhbUdrRWlE?=
 =?utf-8?B?djlJVkx3MEQ4d2cyRjljN3ZuQ1RteU5TeDYrNU1URnFjOG44eTc1UkFESHQz?=
 =?utf-8?B?cno1QXM1clJqWW5DMUJTeXk5YzlHWVBQRjB2eWpDMUNLaFdKYW5yNnlBUHVr?=
 =?utf-8?B?RVBmMHE5STVmeHJEL3d6NFVCbUNNdkZweVMwbzVTQndWNDVleU1hOHk0Szdp?=
 =?utf-8?B?RUhFMS9yTEYwdWtTTXVKTXROM2xBMzZXMWtJTTBIWXR4dnBRcmwzMU9sN0pR?=
 =?utf-8?B?SS9NT0lsK2xBSUhNRVdHaWc1RXdLK2lnc3RiblZpZUMyODJJY045b0V4RzFz?=
 =?utf-8?B?Um50WjkrYndPV3k5aENqaXZlYlVWVmI3ZHlyUFUwT3k2QjhRTmpubVdMbFVW?=
 =?utf-8?B?ckJTdkM4N3dJUnlDb1BqMFczNUxwa1dCNnZLWGIyTUhZcCtWcm1WQk9abE5D?=
 =?utf-8?B?OWJtdmFjYnN1RmNTVTlRQVFaT3Ywd1FLS1h2bzBtamtVRUlQTEQ1clV6aGJl?=
 =?utf-8?B?eHdSNlQ3WndrbU9yUDRPd2hmOWs2T1BLS3NCVnBOYVNieVRoNFI4eFZaaEZi?=
 =?utf-8?B?S2dwM1o5bkdMMDlqbHJobDJoUEI5RUJKSVM0REExbys4RTArem5yR0NzRm9N?=
 =?utf-8?B?MzJqYmJmRzVMNkdCd3gxVk5icXhVRWFqK2JCanA4Q2k1djhsK3FFN0RtL3Ni?=
 =?utf-8?B?Z0ZRT3ljcnZFYWdNNHRGK3J3VzhuTjJVMFNNeTRoRWVOb1BNaE95UVozM3la?=
 =?utf-8?Q?uZM1VxIedRVXFEq38lWwjigF+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616fde21-5737-4849-75ac-08dcd2545f7a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 11:25:00.2998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+MsAbgT6o3WpTLDMFjkQHDu2hL235qM4YuwOlUlsjV1YHeTeHJ6mRoskDS9i5bq0JCn+Nndo0A2ot+w29WmZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8825


On 11/09/2024 10:55, Julien Grall wrote:
> Hi,
Hi,
>
> On 11/09/2024 10:44, Ayan Kumar Halder wrote:
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> AoU are the assumptions Xen relies on other components (eg platform, 
>> domains)
>> to fulfill its requirements. In our case, platform means a 
>> combination of
>> hardware, firmware and bootloader.
>>
>> We have defined AoU in the intro.rst and added AoU for the generic 
>> timer.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Removed the part of requirement which states that Xen exposes 
>> the
>> frequency of the system timer by reading the "clock-frequency" property.
>>
>> 2. Added a rationale for AoU.
>>
>> 3. Reworded the AoU.
>>
>>   .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
>>   docs/fusa/reqs/intro.rst                      | 10 ++++++++
>>   2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst 
>> b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> index f2a0cd7fb8..86d84a3c40 100644
>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>> @@ -30,7 +30,7 @@ Read system counter frequency
>>     Description:
>>   Xen shall expose the frequency of the system counter to the domains in
>> -CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" 
>> property.
>> +CNTFRQ_EL0 register.
>
> This either wants to be split or explained in the commit message.

Yes, I will explain this in the commit message. Does the following sound 
fine ?

```

docs: fusa: Add Assumption of Use (AoU)

AoU are the assumptions that Xen relies on other components (eg 
platform, domains)
to fulfill its requirements. In our case, platform means a combination of
hardware, firmware and bootloader.

We have defined AoU in the intro.rst and added AoU for the generic timer.

Also, fixed a requirement to denote that Xen shall **not** expose the 
system counter frequency via the "clock-frequency" device tree property. 
The reason being the device tree documentation strongly discourages the 
use of this peoperty. Further if the "clock-frequency" is exposed, then 
it overrides the value programmed in the CNTFRQ_EL0 register.

So, the frequency shall be exposed via the CNTFRQ_EL0 register only and 
consequently there is an assumption on the platform to program the 
register correctly.

```

- Ayan


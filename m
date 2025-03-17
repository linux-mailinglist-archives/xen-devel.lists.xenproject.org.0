Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D71A64C18
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 12:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916571.1321641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8S6-0000n6-Ta; Mon, 17 Mar 2025 11:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916571.1321641; Mon, 17 Mar 2025 11:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu8S6-0000kQ-Qh; Mon, 17 Mar 2025 11:16:14 +0000
Received: by outflank-mailman (input) for mailman id 916571;
 Mon, 17 Mar 2025 11:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xTS=WE=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tu8S5-0000kK-Cs
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 11:16:13 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b1e60e9-0321-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 12:16:11 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DU2PR03MB9999.eurprd03.prod.outlook.com (2603:10a6:10:490::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 11:16:08 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 11:16:08 +0000
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
X-Inumbo-ID: 3b1e60e9-0321-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qi4BuVgRYmt/ZgHPOgR2hBJ2KR5tvaICZaCAdH1yebJadxZhM7pxSZWyNieRjMQOHlwugbPTkOnrPi32byrnu+HMH74CDXd7LNTE+SCLDXwY2N3wEkN9ppPNJ0m16h39PqgBginbWkY1v9z2TNl+1hh276uuiBkrGeR91B7rTvC36TjpiDgoNt7tVu3+zjk4GW3z4+mupu8B5YmQ4k4lmELu86UVtENXobzrbFvF/E/3vRbyfnGd6HJKEtPZeLxK8eNVDTI1IDgx9R4NSlLqOy27lyRrJYCt/G2mSw5Kci7BfOh9QV+ZoG7hu9ERBGQCb9wwCGNkhW68v8OH2bsB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfI1fp9pZIPfQSq8BsdXPAntvA4TYc/mID6Sigz3ifY=;
 b=jrJtt3tosaTCeFnOiyvm+r4ujRyzZdHPHTsEudadDkpxmpg/wKA8g1m0UzB9ZrRPi6s0ZneJQwJIN1zr4HVZ1CwJo8YtWbVUvKyWB4Cqya0h8y5AGx9NiyAZ8g6yWjo0UZsXOdlv1QIx3D2lzXeUgNzP/4RSAgxorK0i8lcTiHZSgtIIpeo/DEXDQJaRRVZvt1G1BRdeRhWuh76N5c1v6zz2UHzqpN59m1qYCQMu4bSDIQX82xp2E0Pg6Gqp4/pE/zBQu5jmil72mHCC13e/ODWHwLyC8vAT1S24zIBG5uJElXR1jOkl1/uXIjjgnXVJMqhriRbLQt6qH0JbvXF1sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qfI1fp9pZIPfQSq8BsdXPAntvA4TYc/mID6Sigz3ifY=;
 b=uBZrB4EJTwFgEOmEbPq7mA3YK2P9KTEfUvGXLG3H3T3+P8K4c/CeQRZLfEspQGrdrnR4flC9W6r0/pVDI2ZfPqd7MQA/lMOVhEPDkTAcMx1UJSsChu+JB8D780ONq8l0UaEVrjWkcttKoTYRIdDDRyZgP/q0+OQ9dq54vvL8wC979XED6cIM+elzCYzLs1q8l+2dpKQ0MIcL9TcjdFMr6eCjTpElhwMDlqS13ilYn/gLTCv8IQNThjG2ws0a1C4g1SvznjhBIB+lJlAjWY+vZedOztZvmdvsWDS2SBk9DKSt9NruYeFUKEy8Rc+mea+d80plcFvI5yrCD6J58YBdfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0c399cdc-7a89-4482-a7fe-780da9ad6ca2@epam.com>
Date: Mon, 17 Mar 2025 13:16:06 +0200
User-Agent: Mozilla Thunderbird
From: Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [ImageBuilder][PATCH] uboot-script-gen: add debug option to print
 final dt "chosen" node
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DU2PR03MB9999:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e87f1a-d2cc-480f-741f-08dd65451df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmJMa2pETTI3enl2L0E0NnZ1NHlQWUwyNjRRUWFRUVhWUkZzM25vYWQ1WEhi?=
 =?utf-8?B?STBHSnpKUy9vbGRBdWx6OWJ4TEtoaVBMMEpuMUpJSzVsaU5lcjRZVENUdFd2?=
 =?utf-8?B?RWFMLzhZSjdqWUh3cGFVbFJ1TG9LZDVnODJIN011N3gzNFh5b21LYVk5d0VX?=
 =?utf-8?B?WjdaMHgwNjd1WDhZRU13VVBDQVRUd0FYcEFQY3podjdMMzhWclBtaUFvd1o2?=
 =?utf-8?B?b0pUTWpLVUVxRnFqMk4zem03ZkhvYzFhclRua3I4SEFaTXJtTTBabXE2TXAv?=
 =?utf-8?B?ZkJ0Z3JrMCtGem9USittMnM4TENCcllySEZqYjVBRW84bGdXVFYycUZoUWxC?=
 =?utf-8?B?aGhjL3hQZ05rc2RzZVJRa0V1OU1jWXliTEZxMDZsTDl2dmY0ZkZsTjZ5Wi94?=
 =?utf-8?B?b1VCNTN5YmZ3Q2daSkx4N2g4SXJ5NGZMcGFYK3F2VWljZHN3aUwweTI5Tjh3?=
 =?utf-8?B?WlRMTG5jQVVWcVQxL0ZVN1RRUjVDeUtGQ1U5VGp6ekVDWExJdWZaRlFMZk1R?=
 =?utf-8?B?aDR6NWpNUUFibS9UZzVBWmlaNFRxdHNSd3JId1ZoYkh4aExrZllXNENhZDZp?=
 =?utf-8?B?a0hGa1NXWjV3cjhRQVBXY0Z2eWtnanpMbWd3N1gzSEQ5Z3VTMUxDaDk2NkdW?=
 =?utf-8?B?dlNRWDFCdkRSSnVYaE5VWVFibExicFI4a1AwWjI3VUtKSjVNWndzQVFJeEN1?=
 =?utf-8?B?Nkl0ZWtrRWxUOFk3ZXZJUzdmRFhodXlFdnZweHZWS3pNbm5YNVBQdkcwdEJa?=
 =?utf-8?B?dUQ4N1VSTTJreGlrMzJHQ005NU1nWnBQL0M0NzhqKzlXVWtjRnhyMFc2eWN0?=
 =?utf-8?B?Qmxuby8xbUIvamVNTTlNdXZHSk5OWEwwM1JrSFF0R0hWbVg3VWxuTnFJMUE4?=
 =?utf-8?B?VFBMN2ZMc1dWdkFNeFBYb3VzN1YybHczWFpGcDhxT1hVYVVvSEZpc3BsV0pk?=
 =?utf-8?B?Q0dOYVlNbk5oZDhLYmN0ZWlzK1FPT1o2SEFZVzRnT3dXV2xSVzM5ZEgwVUxH?=
 =?utf-8?B?VkhtUkVjUERURGxRYkhEdFcxVHllWkpjdGd4UnF1bTRzZ1VYeCsvcnBucmpw?=
 =?utf-8?B?MXlBamZDZjRJM3hCK1VhNlBLTnpvNVgzMVN1YnhBVzIxdTV0TFVUNzEwQ1Ra?=
 =?utf-8?B?dVQ5eXNrUDBjVXA0ZEYwd0VhcXNQQmgxS0FTWHozaS9GaUVYYjhUWGZuZzdw?=
 =?utf-8?B?WkhUaHgrTUJsSmFMZGZIWGJIZTJXRFJQR3FjK01jRm1QOFh6eEpiN1NwNlIv?=
 =?utf-8?B?VElUNlRyVkRFRjhjNno3TUhnTTFFYzVSYkhvaDRtSjIxT3lzMEo0L3JnVXJI?=
 =?utf-8?B?VXBDcWFEMzQ0RkR6V1gxTVVIN0VYcVRsQnVYdFR4NEllK2RxTUkxZTYrVmQy?=
 =?utf-8?B?TjQ2UFhxWmhhbUZweWp2c2c0VmVFaGNXZ0ZENGFpRU5HK3BKby83bC9xUWpz?=
 =?utf-8?B?UTlPNmtMTGluRllwMzJVRXl6RUtSSi9Nd3VGVDc4ZXNRWmlVUnExWkZmNHVm?=
 =?utf-8?B?QlhlVWwrWFpnNDBEVWU3ZmVWMG1VRFNUaHBiQis0YUVVK09wNHlRQ2U2S1ND?=
 =?utf-8?B?ZUFlSVJPM1psOW9FMzNLQS80dGQxdkl3KzBtRzVtM3h1bEREcnJsUUlpZCsv?=
 =?utf-8?B?M1JGQ3NITEdqaUVnSk5JQm5INHRYZk1MQnFFQlJmMEFjdWJQZHgvMUZDRDlE?=
 =?utf-8?B?V3htYUhzS0x1OVdHN0htdXlNZ0g5UkdoandqeHU1eVh3TEkxMFI4ejdmT1lq?=
 =?utf-8?B?UEFsZXdsaytUZnBlY2owR1dtRjUwd3hmSm5pS1d5L3UwS2g2Q3hBMGhKUGtW?=
 =?utf-8?B?Q05rR21veVZJWlFqdkZLV1F5SlB2bzlSYjBmRTdOMVRRT2F0VTkxQXhkbE44?=
 =?utf-8?Q?fXunCJL/C8jjX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZCL21QVG5PaTkyZktwaEs2TllsVjVZZ3VHUWwxZ2pMWDNqL0x1c2NTV2VL?=
 =?utf-8?B?b2hDNkZJQ2xKK2hJdmxXVjNqSEp3OW5MdzVPN3BOVFgzOWo2UHRDVTdHdHlB?=
 =?utf-8?B?dlN3OGZ3cnNvM084ajBoc04yY2g3elBHN2RsMjY4N2M0RlNWMzg0REtZRU5Q?=
 =?utf-8?B?MEFuWkgzcEJ5cEpmWmQ2WXRyVVJuN3oyRDRFdmU0T3h6NGdqQmJSa1Erelly?=
 =?utf-8?B?OTNSM3p3Mktsc1oyVEh4VW5oNTRrWkt2U2RoQ0krQVdFM2l0LytiZVlieXNw?=
 =?utf-8?B?dk5qYTBzYktQMWNiYXV1MVR0K0g5MkY0aUMwQTl5RXp1Uy9vOG4zM0NkbG9K?=
 =?utf-8?B?T1BVSGRvVVZXY0ZQNG9BU3B4eFNpUFZ0bCs5c0cvV1psSHg0T0tDUlhZdmEv?=
 =?utf-8?B?cWo4OG1NTjNDOENBR3JOZFpqcWpxQWF6SVVOeFQwRzhpR3hzQ09ZeWs2TkJz?=
 =?utf-8?B?eHVrS2J4NjZDSEdpaU1Vem5zRWU0d2RUbUdHMlNqL1EwRVVQaG5RSG1pUUNq?=
 =?utf-8?B?ZnFDK05UVEJ5YVVCYlJwNmVIdjRhd3daOVUxcGNBRjVPTWZWdCtuUUxFNExn?=
 =?utf-8?B?WXNBK0duTW5Ed0NHbU1mSlpkYUZBN29WWWVCUTZqMmtBNWRoKzFUQnJVZGFJ?=
 =?utf-8?B?OStURzVoZ3pWQ2REM1VqTkNzQjBNY2dCZWJhRXpaamJwZUlGQThIYzVtV1N6?=
 =?utf-8?B?aDdGenl5WFVDYlQ5bnp5SXdFc2VWazVIeHdLZXJWVFVMVnBwOVd2Q0VjcFZJ?=
 =?utf-8?B?a01wUzhsOUxpL1YzN1JTSWhwSXhFYWRkMmZGTUhmeFJuNktxWWwvV2Y1WFly?=
 =?utf-8?B?dnRwK3o5dkVxbHBIMEhveG5KcC8yd0xHZ3F4U3luWkRnalkrNWlKa09ZNnNE?=
 =?utf-8?B?enZXb0g3R2hQRFJCdWowV3lPUEpzZXZaS3lpUUNWSnhMY0llTlh4WGhseExX?=
 =?utf-8?B?N0pxa1B2bnY4Zi96aWVBMjM1K2NjdDVqQ3BqZWVzQnRoenhBa2VmZTRJdllh?=
 =?utf-8?B?V3JTQWpUL2VQcEE4bnh3cDJDMWlqQ0RGMXYxVklmTms1MXpSd01uR2hsVERa?=
 =?utf-8?B?Q1owcVRwa044ZUNBZVR1NldOUjNYQ3hEUGdaREFjcVNUY09peGNmL1M4Qnlw?=
 =?utf-8?B?UENpRU1ZTHRPdTNJU1cwQjJZMzQ4TFRjZjRSV3ZhR3c2SkRXeW1uUTl4THJ2?=
 =?utf-8?B?WDl0SEVkZWpjK0N3ajVsbDhEWjBkVlZzUGROR2ttOU5tUXVSZHpmWUovR3Va?=
 =?utf-8?B?TkpIa3ZGVmRTbXRiakc0b0pPUUpVb2trVm0yQ0ZEVE5MRkNOK1RHaENPc3RG?=
 =?utf-8?B?dU5XK3NMOU1JV1NuUmk4RFVuYWlHMjJwME45ajdhT2RUZDh2V1BqZmVsekgz?=
 =?utf-8?B?VnJRMmY5cHRxbml1YjZyMENqb25OS2ZBUmJiWjcvclVFbHpndGhEU01BbGlu?=
 =?utf-8?B?R0VOcTVlSG9TYS8vZU9KSXVyay9Kd25nZHJZNHZwYjBldSs0dnVoU0NVN1dk?=
 =?utf-8?B?VHlDKzExU3BJaU0yYUR2aWpKZHlsbDVxenA2c1ovaDVnQWxjVy9IV2xjcXYv?=
 =?utf-8?B?UlVXV212VzRvV1JoNnBCTW81VCtKZDdHV1R0NEdrR3J6Z0JrajFlU2RpdzEx?=
 =?utf-8?B?c3NuWjdBWldSY0pENXZuV1NVWTZaSlBSZVU3L3hhRkV6aE9ER1hoRjhCUWhI?=
 =?utf-8?B?eXppYzE4dW9GcEtPMnJ4ZVEwWE9FQUF5S3RFYkNxaTFSUDMyemY2SC9LQSsw?=
 =?utf-8?B?MU5yaTYwSVl5ZzZDUkpQSjNYaEh5QXZqQnltcFB3YTFMYlRoWW9qdmxjUWtM?=
 =?utf-8?B?UTdrTFNWeE53cXBNaStzeVVIazBqaTBzbDlSdWoybmc0NXB3aUFmSW5kamsz?=
 =?utf-8?B?c3ZYcnNDVWVOcWQrRlJxdXdqeU9UVWlBSmJveC9EcjJjMXRraWlEVzRyaXh5?=
 =?utf-8?B?Q0dtbUk4ZEE1Ynh1bEpITC8rcFQ5OUxJekNTa0l6elE5NllKa3RIRkhrczhL?=
 =?utf-8?B?ZjEzdXNrejloVWpNY292TlNiZWdzbXY5KzJRZ2NGWGJsajhDYS9zRlErQlFJ?=
 =?utf-8?B?VGtBcWZjVHIxcXZpbkM4ZnY3T1psMXVqcWNPcnZOTXQxL011WUVMTzlpQ3RE?=
 =?utf-8?B?WWZucU8zUEhxenlLNHBKRDZvUjRxN095SWoyTkUycXRZOVd1TjZDUWZ5Nnl3?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e87f1a-d2cc-480f-741f-08dd65451df1
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 11:16:08.7988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCZTsmHp3NgUeuZNCHbZ+AhV4dXqpi0LuKtbmJCL8B+553wnPb0kqicrJfg7ju8CZS8X1c4NC5FNGp00vXhg1U8uLVzCUAJWzRZdw6fypm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB9999

Add debug DBG_FDT_PRINT_CHOSEN config file option which adds
print of DT "chosen" node at the end of generated U-boot script.

This is useful for debug and development purposes.

Example:
   ...
   setenv fdt_high 0xffffffffffffffff
   fdt print /chosen
   booti 0x43000000 - 0x43200000

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
  README.md                | 8 ++++++++
  scripts/uboot-script-gen | 5 +++++
  2 files changed, 13 insertions(+)

diff --git a/README.md b/README.md
index 4ba430ce74c5..5b75018ea956 100644
--- a/README.md
+++ b/README.md
@@ -396,3 +396,11 @@ disk\_image supports these additional parameters on the config file:
  disk_image also generates on the fly a xl config file for each domU and
  adds them to the dom0 rootfs partition under /etc/xen. It makes it
  easier to start those domUs from dom0.
+
+
+## Debug
+
+This section defines config file debug options
+
+- DBG_FDT_PRINT_CHOSEN specifies that U-Boot script command to print DT "chosen"
+  node will be added to the boot script.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 0607542b1872..74e3b076910c 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1357,6 +1357,11 @@ device_tree_editing $device_tree_addr
  # disable device tree reloation
  echo "setenv fdt_high 0xffffffffffffffff" >> $UBOOT_SOURCE
  
+if test "$DBG_FDT_PRINT_CHOSEN"
+then
+    echo "fdt print /chosen" >> $UBOOT_SOURCE
+fi
+
  # append extra u-boot commands (fixups) to script before boot command
  if test "$APPEND_EXTRA_CMDS"
  then
-- 
2.34.1



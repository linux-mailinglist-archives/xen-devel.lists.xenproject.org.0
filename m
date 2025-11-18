Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F6C698B0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164687.1491589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLRe-000064-8v; Tue, 18 Nov 2025 13:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164687.1491589; Tue, 18 Nov 2025 13:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLLRe-0008UV-5p; Tue, 18 Nov 2025 13:08:30 +0000
Received: by outflank-mailman (input) for mailman id 1164687;
 Tue, 18 Nov 2025 13:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/jeL=52=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLLRb-0008U9-WF
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:08:28 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8deef1a-c47f-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 14:08:22 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by PA4PR03MB6878.eurprd03.prod.outlook.com (2603:10a6:102:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 13:08:18 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 13:08:18 +0000
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
X-Inumbo-ID: a8deef1a-c47f-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXUJWPda9nJ1ISuvDRU6UKXfJEVY3k8QXJMOMYZgfyVSsx5ESLDGG2bxsWKbwx1EqIcqJpdidzS04SjMSkHdoerQTeQrn5DNF6MRXb+Ff9g6zK31JHl55fuf5EXNWk5gbXCATnV3citg4GMQnyvAdghnMCm3pi7gYGn63d6yxbdyppNybrEqqAMcwfUwoHuUIPBxuSEsaDsuN8i75lVPjm0BCCT8Bq/V7jJjkygoAmO2EYyzhhb9VmMDfMf3Tps3wp+7+/m1D6ip4Ji7h3ryplcLuFHTknqdViEGXqFvxnavAJUi0Kg6pXXYkjw8g3Mjj6ac59S2IhjBwCYFYyzoUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdE+ZIpLV+S5wnFmF9XxQntV3HFYQrAB4N3H5fpVw0A=;
 b=Z0sL6rWqf03XCDZltILUQEfGoAkzAOh9/lQeXqPwUnIj9DI2wyCK0W1tEUW6CHzbjP2ktOk8XDbnXarwvCR9nlFYj0PYP3LXZ+FYFtwh7Bq8e+XOqlZtn+LS2f8/5tz7WqMzLTVAV8AeLB9o9X5CDJCuq8z+Jna9hKySTnM2axLv28VSjzsYcIGDBansEigN3LvAzGmq4UMNKao9cGp6YY8E5vxGTWY2GkpqYIlRlIW/kR5f3YmWaKhoPXs2ll9//iHbpgqczJeDt5OAim21WoIM3g/MPVUiqCECj7i0BJ5t28HqimZISS5SdZ3ruH2Xm8KHSk3ujQ8NozqYKpxM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdE+ZIpLV+S5wnFmF9XxQntV3HFYQrAB4N3H5fpVw0A=;
 b=SAatXISlhyOka9yQnpKBAHZjsY5eMlW+HREra5fe4TO1RzeOINdZo9ZgsONH9NJGEiNipZaUa5QFMtQSD1lzh6KLbzPaJyzoji0BhIuX3PNVs6FPWbjpIDlbl13ibGLVWDjpIfMITW30HXpHQgKRQ+L5o9SCF1K43uZY/N6zjMCOOjtKPalySIaaafCuZjq2zqhhDr/2+kY8qcXW1oZsExy9vUqvQb96rDvvimFw+IGlYLdEFy23EjGnHWtvfTTooScyJlnQpIJ69ODv2ZGVfx00cbc5taYck0+6CNGQ9dRzgmuQR8ZVFO6CqU+otx+6mrwcLNKCehx5g6RVkDZ71w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <fdd51da7-c8dc-4c0f-aaaf-a9fd2094bcd4@epam.com>
Date: Tue, 18 Nov 2025 15:08:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114140117.270461-1-grygorii_strashko@epam.com>
 <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0337.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::14) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|PA4PR03MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 50745a18-cc57-4af8-8adb-08de26a38aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STBYQnhPemp5bk80aXVEU1BhVWJoV3RLcGxkOW9HWEVXL2thMjdNWDBObEJK?=
 =?utf-8?B?OExVRXBwVWRxK1hSWUhKRlQvRTAvN3EycHRsV3VQb21QeVFQQjY1YTVXV3RG?=
 =?utf-8?B?ZEJUYTlFU295b29FTU8rUmhaVlJpREVOK1VXZmQ0eFpkbjBlVGJndHdSaCtC?=
 =?utf-8?B?c0NUNUxhNFlYRmI5d0k1TVhpZDNMR0RDNWJPc2lyQTJkbzRYQ1l5M0VTMHBj?=
 =?utf-8?B?MTF3SnpYeWdVNFByck12YzRoK1RibjRBSnFNcjdwVlhjVmFtZjU3SUQxVzFY?=
 =?utf-8?B?cExqdU9NY2xyQklkcDhCVG1SOXRzSFNsd1FlZlNoZkJmVzlVc241dmFWMzhL?=
 =?utf-8?B?YmM0STBnSndRNGF6S0xveXF5bjF5R21CbmdxMDBIcCtYaEdVUkVtamUvbFoz?=
 =?utf-8?B?eWpiRCtKY0xzd1FPNVRwd3ZOTlVaTWxpVk9iVlVodXlXWTRJN1BXblY1Nk9X?=
 =?utf-8?B?SHpCMVdaSHlEN29ZQWpkQWhKZXQxV1g1VXpjTFVIa1dDU0c3REh5REZYblFJ?=
 =?utf-8?B?eW9DQ09wcFRaNGQranFkalhlUjhqc29KaFoyeFVkY2h6YVJjRmphc25OZkJk?=
 =?utf-8?B?bTZTUmtOSE1EYk1zWlRCdnVFNkxMNlh5S3A3M0dvS1EvR3hjVXptTEkrR0U5?=
 =?utf-8?B?VjYyTUdXOEEvRzlhRG1aWW1NZkp4dy9wd2ZZUnpOVGxjWXVoWmJZU3VuMVJ0?=
 =?utf-8?B?TXdOU1BvYktScTRTd09wenZXUDVPV2NDaUxRZWhHK1VLby9nL1Q4WVFNb3Nx?=
 =?utf-8?B?TW9NcnlSU2hJNWVyN0ppMk1ka3RKZzlvdGd2V3ZqNXZLUGpNdmpLK29iVTc3?=
 =?utf-8?B?NUZnVWtWUXR4aDdzdXROZkdJbU8zaHV0dFFHWmpkNjBEWXRjSFFDWllJN1oz?=
 =?utf-8?B?dGErTWN2bk0yblY3MVI3cEVoUzcxd0NBbWp3ZlB2VE1YRy96bVczRlQ5bmh0?=
 =?utf-8?B?SU5PaWRUNVBOdCtScUNBWUpMQWhISUNMMDN0QzV1T0tIY3NrTi81RnQ1ZExx?=
 =?utf-8?B?eUdYZXVNOGlYNmp2emN5c3RLZU9YTjFrU0VpV0I2US9sNHQ5SXJUeldadkRB?=
 =?utf-8?B?eEJZSHU3a1Y3aUlTRTFEUjFYV3dXT2RpNDFhbTc3aC95VDRqQW5yVUZsRjdp?=
 =?utf-8?B?VmtDUHlaV2F6N2JONDQvd0tlSkw2aUZOV05jc2txZTZsZ1FEUDZHZGRQVnpW?=
 =?utf-8?B?SXltVmxVcmV4Z1g4YW9weGxLdGhaQytZMW9Pb3hxNzdVN3BPUWxuOURSRExa?=
 =?utf-8?B?UHIvc2J0SERSL3lRd2tPZEd2OTNERzV4RDkzeFV0K3MyRkVtR2ZreDRtQmhB?=
 =?utf-8?B?STE3RmIyYW9sN1lIdUVKQUhGeHY0ejZhUkh5aUpWVjcwbXBTdlZlVnFCQUgz?=
 =?utf-8?B?TWFaZTNIRTNTSzVYTkNua1ByYkVKUkNrbXBIOFFyUkdjL2ZHeWExekc0WUE0?=
 =?utf-8?B?MjlWa1EvbVA0dVNDR1hMODNNMHI5aWpKUlh4Z0R0SDlHQmFGMUVGNDBsN2FU?=
 =?utf-8?B?WUdocWRXWk8xdTJnTzFTazlYeHRXQ09adGdvT3IxT1lvd1RwMnp3OGFabEJO?=
 =?utf-8?B?NnFJUlk3RE13dlM5TVVzOGRaZFN0cVhvMENLWjhaUnFGQUlRMHo4QXkrdXln?=
 =?utf-8?B?Q2xOVUpGa2c5RHk1ZGs0aGpGbUMyMEN1Qkx3YjNKdjdtekRxL0trZVgydGtS?=
 =?utf-8?B?UDNPUm9SV1hrcU5hVWUyeVRibjcxbXNLdXlKeVlhcVVqOUlvUDlRYnNXZ1FX?=
 =?utf-8?B?UUpkSEltQnF6a0hveGVBeWZkRk1LMXBVZytkSEF5ZlUzY3A0QlkxaTRna2dz?=
 =?utf-8?B?a2p0RW1BbkM0WEpoNjFGQUJrVlNVdXI2cjJmbVNuRnludldmcGdreURVeVdp?=
 =?utf-8?B?YlZtMC9Tc1lLRmpNR1EzdGE2ckhja2NONE03aDBRSXZyT01EQnNrRzdYclhC?=
 =?utf-8?Q?bB8+iWDikN4jkDO5BrgyVYULPq4cwo9T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUllS3YvNDZUUE00NUMwRUg2cWZWQk9CRWdDQlJUUkJUM0lydmt3LzZodDAr?=
 =?utf-8?B?ajNRYXozQmZqbml2Z0RRVGRzaXR5WEFEUS9VdEtUOEZmRVJ4VjdvY0RlS3gw?=
 =?utf-8?B?Tnovdi9NSVBGYzJKeHhWc3lWbmgwR0ZVZ1dEYXVZQ3RzdVFTTWhyS3dOV1NE?=
 =?utf-8?B?YnczR1RMZU9EUHArVU1sWkhvZTZyeVJRR1A1RkJIenRmL2QrTnpFeGRuQWJW?=
 =?utf-8?B?QXhDU1VKcityVkhoNUJnTzBjRmQxNkVIRC9CNUF1SkZhaER0Y24vcmNlaFpQ?=
 =?utf-8?B?OU9BNnZEaHFsQUVha083ait1UTRGbldUc2sxVmNZQVA4MFExTm8zcUJOaDk1?=
 =?utf-8?B?V3NEY0JXOFdUQzRERm1UM3N4L2xBZVU1NlNNQXdJT0VsNTREeThIMjBnWGFs?=
 =?utf-8?B?dDRueER2YXh4VHJtY2lYL2Uvb1JOMjhENkZHUHhnWHh2YWFJeTJyQkQwZS95?=
 =?utf-8?B?VkFpa0hTVG50ZUFSWDNIeU5XYm5HZzU0eVg1c2gwY1Q4MHRCSHZsbUpwYWpR?=
 =?utf-8?B?elY3ejlNZ0xoMlpVRGpObS9IcGZoUTVlcmxJRklDSmxBd2QzWmY1ZE9jd3Bm?=
 =?utf-8?B?TVFTV0xGcWRKemErRGx0VHkxN3BtYUFBbi9oUVl4cFhRV3JHSTVkOHEwYVRX?=
 =?utf-8?B?MXZOenlHQW1zOVdFcW1rczFkcG9aWlRQRGh0MThOWm9qbnJKWWlqdzF1c3Yv?=
 =?utf-8?B?WDdGS0Z4Y3N3Ynp5RE83V3FPMS9RVFVkZnFOMnIyRVBqRzdKeUd5OFRvYXNW?=
 =?utf-8?B?TDRvOXJkUmJaRGdjRWlKY09IMW5KOTUzdk92b0dkdUVLb0hwaXQ5emZnbW9p?=
 =?utf-8?B?TXIyU2J0Z1pmQjJ4L3VxZVdxKy9YQ3llTUNucmNiVmVOdjZyOHJ0eVJkVG9z?=
 =?utf-8?B?SG1UbFA0Tk1kNWREbFlqUkJIVC9zVUNNUUt2ampUeXhrRHFNQzZOMWJVbUdo?=
 =?utf-8?B?VFdROEpqZy8xZ0k1NTlOK3hPdjFGSGl0MU02UGJUMGQzMEFweWxDUFA1YjBW?=
 =?utf-8?B?UlNzMGJKVEpVWThDWVZoQk9oUVQ5NjVsVi9ET1IxWTdodm9rS1krby83Ukho?=
 =?utf-8?B?aE1ibC9qRnovZ2xJekxCV2ZENFltTDlLM2w5NU1IdVI3UXJDa1ZYQmFKdjU2?=
 =?utf-8?B?d1RSd2dlRkJqeFlqSzBvNmNYSlNmbHo5MjlaSXlmY1Y2dUFvelVUcUt6OWlU?=
 =?utf-8?B?T1FTdkVNdXZUbVNqM0kvMHdhc25JVGxwTXVubmZxNzY3U0drRllYeDc4dUtz?=
 =?utf-8?B?azFwNElOVVRoUWZ2VU1CakxURUIvT3R2M2lnMS96eHNhRWNtbWNyc2dkN0RQ?=
 =?utf-8?B?bDRWRUlHOVpMVjc4ZVFDVk1MTXFSZWg3cXViREErUngwdXFyVDNveFFvcVJH?=
 =?utf-8?B?STNXWWE5V3d3R1hFUHRtbnBSVFFNRnpESmdxcDJUQzRzblcxT0FpZ2ZxZDI1?=
 =?utf-8?B?UnFwWEhWRFA3YUw3QVhwYktMWkZ4Rjg3YUdZdmY0UjF2bnVJcEF2dU5QYlZj?=
 =?utf-8?B?MDJRR0hHcmdPVGw4WVl4VitMUk1RZGZkYTBOQ2lQY3MzR3prcUpPZlRvbjNm?=
 =?utf-8?B?b1ZraEFxNEpMZGRhVkt5bnlTdnJSR0ttb1QzWGxKOWVmQlZMSnVwS0g4dFZn?=
 =?utf-8?B?Z3JXUmZxMEUvT1RoVVArcHNyVHpabWNCRG10ZEdNSnlHSXR0cTZ0WmNLZ0pE?=
 =?utf-8?B?RS9RYnJLcWFYakE4NXlOQTNqMDM2VnU5d3dIdzhCb1o5OW1ueHoyanRVRElw?=
 =?utf-8?B?bU1TWkxhRUdxWld4eXZPYlRvTjZldm1Ob1lWVC9nN3AwdkJ1Y3lSYmpTbWlP?=
 =?utf-8?B?Q0hmVkg5NjVTb0ExdVpIcEloQlF2emRyRzNHTTYyZFRVRFpGYVZDWjBxQjlS?=
 =?utf-8?B?M0V4M2ZHWm1VeEdFQzdOV0NudE00V3o4ZTR2Unk5U2VYb0w1dnZJWlM3eFI0?=
 =?utf-8?B?U01xSzcza242aWxaVXNWbUpjM1h4SzhSdzd0TmduQ3dhd2lpWDBOVlFSMmgr?=
 =?utf-8?B?YTIzU28vbWZjUlZzQ2p6bldRQnU1anBCQlpCVXpuczJnczlnUy93dEI3YkJu?=
 =?utf-8?B?cFIvV0M5cS96dWZJTjhyWU4yblc5VjhaY2d5cFVVU25na3pPNWtDUTNhOEMx?=
 =?utf-8?B?bXh5WjFZK2FIcVJFNTNEaFZvZTFCWmtOWlpjcFh2Q3d2N0ZKS3FKMXVLaU9o?=
 =?utf-8?B?dHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50745a18-cc57-4af8-8adb-08de26a38aa7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:08:18.1771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5o9+RKIOmqcIF6wF8ZhpEk1WP1UJcml9O9/v+7sbpmfwwKj83U9o4cw5wMytyxGRbKaoksW6QcvZqPmAe3ZmLrpvgSngEEUj1FMMlMxlNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6878



On 17.11.25 18:43, Jan Beulich wrote:
> On 14.11.2025 15:01, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Xen uses below pattern for raw_x_guest() functions:
>>
>> define raw_copy_to_guest(dst, src, len)        \
>>      (is_hvm_vcpu(current) ?                     \
>>       copy_to_user_hvm((dst), (src), (len)) :    \
>>       copy_to_guest_pv(dst, src, len))
>>
>> This pattern works depending on CONFIG_PV/CONFIG_HVM as:
>> - PV=y and HVM=y
>>    Proper guest access function is selected depending on domain type.
>> - PV=y and HVM=n
>>    Only PV domains are possible. is_hvm_domain/vcpu() will constify to "false"
>>    and compiler will optimize code and skip HVM specific part.
>> - PV=n and HVM=y
>>    Only HVM domains are possible. is_hvm_domain/vcpu() will not be constified.
>>    No PV specific code will be optimized by compiler.
>> - PV=n and HVM=n
>>    No guests should possible. The code will still follow PV path.
>>
>> Rework raw_x_guest() code to use static inline functions which account for
>> above PV/HVM possible configurations with main intention to optimize code
>> for (PV=n and HVM=y) case.
>>
>> For the case (PV=n and HVM=n) return "len" value indicating a failure (no
>> guests should be possible in this case, which means no access to guest
>> memory should ever happen).
>>
>> Finally move arch/x86/usercopy.c into arch/x86/pv/usercopy.c to use it only
>> with PV=y.
>>
>> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>>    add/remove: 3/8 grow/shrink: 3/89 up/down: 1018/-12087 (-11069)
>>    Total: Before=1937280, After=1926211, chg -0.57%
>>
>> [teddy.astie@vates.tech: Suggested to use static inline functions vs
>> macro combinations]
>> Suggested-by: Teddy Astie <teddy.astie@vates.tech>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I would guess that this R-b would have needed dropping, ...
> 
>> ---
>> changes in v4:
>> - move usercopy.c into arch/x86/pv/
>> - rework to always dynamically check for HVM vcpu(domain) by using is_hvm_vcpu()
>>    as requested by Jan Beulich
> 
> ... with at least the latter of these two changes.
> 
>> --- a/xen/arch/x86/pv/Makefile
>> +++ b/xen/arch/x86/pv/Makefile
>> @@ -14,6 +14,10 @@ obj-y += ro-page-fault.o
>>   obj-$(CONFIG_PV_SHIM) += shim.o
>>   obj-$(CONFIG_TRACEBUFFER) += trace.o
>>   obj-y += traps.o
>> +obj-$(CONFIG_PV) += usercopy.o
> 
> Just obj-y with the movement.
> 
> However, is the movement (and was the adding of $(CONFIG_PV) in the earlier
> version) actually correct? The file also produces copy_{from,to}_unsafe_ll(),
> which aren't PV-specific. This may be only a latent issue right now, as we
> have only a single use site of copy_from_unsafe(), but those functions need
> to remain available. (We may want to arrange for them to be removed when
> linking, as long as they're not referenced. But that's a separate topic.)

It is confusing that none of build cfg combinations have failed
(HVM=y PV=n, HVM=n PV=n) :(

copy_to_unsafe_ll()
- called from copy_to_unsafe()
- copy_to_unsafe() has no users (unreachable, MISRA 2.1?)

copy_from_unsafe_ll()
- called from copy_from_unsafe()
- copy_from_unsafe() called from one place do_invalid_op() with
   copy_from_unsafe(,, n = sizeof(bug_insn)).
   Due to __builtin_constant_p(n) check the copy_from_unsafe() call
   optimized by compiler to
   get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);

as result copy_from_unsafe_ll() is unreachable also (?).

If those function are not subject to be removed, the
  usercopy.c can't be moved in "x86/pv", Right?

Making copy_{from,to}_unsafe_ll() available for !PV means
rewriting usercopy.c in some way, Right?

-- 
Best regards,
-grygorii



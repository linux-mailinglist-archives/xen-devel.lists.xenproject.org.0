Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895BD9B3E96
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 00:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827014.1241492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ZNN-00012G-JU; Mon, 28 Oct 2024 23:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827014.1241492; Mon, 28 Oct 2024 23:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5ZNN-00010l-GH; Mon, 28 Oct 2024 23:42:21 +0000
Received: by outflank-mailman (input) for mailman id 827014;
 Mon, 28 Oct 2024 23:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VaPr=RY=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1t5ZNL-00010f-NU
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 23:42:19 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20619.outbound.protection.outlook.com
 [2a01:111:f403:2409::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4470bf1b-9586-11ef-a0c2-8be0dac302b0;
 Tue, 29 Oct 2024 00:42:18 +0100 (CET)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by SJ2PR12MB8883.namprd12.prod.outlook.com (2603:10b6:a03:538::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 23:42:12 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%4]) with mapi id 15.20.8093.024; Mon, 28 Oct 2024
 23:42:12 +0000
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
X-Inumbo-ID: 4470bf1b-9586-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMazNoGSOdvZLuxd3emb31EXGGY2mDG22DDwHZYmXBQBxVcpmkKu3uWSUUEgbjpwgu1Mr4DiokCwGlTUdYYVJxwkYdhPRHCstlq7+IeK0yuqnc54IU2syXOU08D8AixDb9VBbP42+7GHCUZYHigUKzSuWUMO+rsW++GrjrQhGX4EZpMFzElCSc5Ysfw2GaSpaKfk37kWX4R7B69tOAPl7I3wEJ0l9/dhG9PakXbyPGoMrcIwamFVScnCp9uW0l/ByTF3bJXORqRghlbiYdJOOz1sL+3rv+xvlxzkWbKyCpnW8VSKoZymsNk+vIucAkOq7PrHPMVaDo7JHvoiwpOZJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So5MFSto4F/wdjoLJxH3oXJXdL9VeLuQd/7B8JJV67E=;
 b=En3fRtWqWhU9WTGFATtLwu8vSEyBVhG7cQYdGl9ot6lOb2flcTh7tBOA6rUTCsenbllCnnIz9EwTtv86GKyVS5GBdZHrQaNCnW+vfiEUKMElvIcEZ7UG8K4GnJ8Q3mIwYBfBnzx8biG+g5+9a8MhRRPPp/slCVBoAhwuqBvjAshQw/zHDP3PwHseGl0Q/IplgnBnZqr1V+3b1ZFvxpxjjryYyf1rrugbvmj+ho7+7+1KCZbdXRiKG6MsUB7rzddtrMYFBTVahvlH8j6KIkb5PxtZUqaHhwt6U0I+fuv+kEVzYFjoLZwm+rF7CDnWTetkKadieRRh51mFvarNsMPcTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So5MFSto4F/wdjoLJxH3oXJXdL9VeLuQd/7B8JJV67E=;
 b=vlOipP64hln+bevllZtYbz/ssAycm96RV2UCHtpkBwEt2MKj3lav2TtUBo7NAJFRFveb2gPp8v51RF3FRzOej5Wijm8T1TdhOW4mK22ckpG4UreDqH+tpVjDQLse1Tp2zJtcR1LGGNjgKb21gHhzdTqhAWVu9kFE4M4+bIiaJOM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <43ef31aa-15d6-434f-82e6-dc88c2e89309@amd.com>
Date: Mon, 28 Oct 2024 16:42:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] automation: add x86_64 test (linux argo)
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Doug Goldstein <cardoe@cardoe.com>
References: <379776d8c059d457a3be03e7701f24dc4f8bda81.1730155685.git.victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <379776d8c059d457a3be03e7701f24dc4f8bda81.1730155685.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|SJ2PR12MB8883:EE_
X-MS-Office365-Filtering-Correlation-Id: 196d226c-8e08-41ab-5108-08dcf7aa2573
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anViUmY1L0tXOFFaZ2JKSTd5QTBqN0sxa1gvUHBZc2hnVEMzU1NPbm84Si9Q?=
 =?utf-8?B?dDRTM21TZ1ppNy84dFY2NEF1bE5pSTZqWXJVZE5MNG5oZ3VaTmc4M1FrRFkr?=
 =?utf-8?B?WXBGRW5xNEE1ZlhzWlVBOEFkVHhYVWYybkhTbWdTRnkxWURmaHZDRkovaXJx?=
 =?utf-8?B?OEt6L0x6MWh5SkFTZm1IbWJwbEFBRSt6R05RN25LMDNVVGVYMTBLTy9WV2wx?=
 =?utf-8?B?RkUyUHVoaEJNZVUyTXN0b2RhUFgvSHlBT05GdWQ0cFIzRDlqa0JoajhXdnVl?=
 =?utf-8?B?NUQ1U0NjSmZ4Yk12SzNLbE90RXJwVUJnKy9GaDRxVE45dzlaQm00M1M5UmU5?=
 =?utf-8?B?NUdhRDYzemJLRGoxTWlhdGFHZ2w3ZS9SWXEzTmI5Q2I0SHFEZWZBYm45VUZT?=
 =?utf-8?B?anNiRFlTbFpRbFNvQTNvd0MwWGNWWlg0VWdNRFpXTmJuVVY1N0g5SXVHZ0FV?=
 =?utf-8?B?aWMybDh1VkpxQ2lWQVpOaEl0VlQvSWRPK2lGQituVmZoNEZlcU1pQnhVbGxD?=
 =?utf-8?B?SDEzK3NUWXlJL2s2WEN3d0RjdVZiOHFGcEI5L2src3c0eTVGbXJKdGhUVi9P?=
 =?utf-8?B?cmZ6R1N6K1JNTk5GTCtPT05aQ29DaVdjNWJkTWk1dGMvZUtrS1d3cGpXQnN4?=
 =?utf-8?B?R2J0NGdoVWR0MnVGcGRGeFJDTklEVzdVdnJaWnQ4MjEvd1BjT0JqQi80S1lI?=
 =?utf-8?B?djlyQzFGWE5iaC9HMXZXN01CZmxsM2IxQms4MXF2UWNacHJjcm1PZnRJN2Zk?=
 =?utf-8?B?d1dTdHUyd2oyclVyenRhYzREa3lJWmRZZHBJVEh3ZjhrLzQ2QVR1M24vMEd2?=
 =?utf-8?B?QnRjditKS0dKQlJ0K2ZrQ3V5YnQyR25RVHIvVE5Ya25IYzNaUWRNZWgzVm9p?=
 =?utf-8?B?Y2NmT1RaSkJhdmVJakljN21QUDA1SjVmUU1oWTd2UWV4UEpkTTkySE5ZcWJn?=
 =?utf-8?B?VGxFdDdueHpFc0xqbjhTNGg2eUZmOWFUd3JrbjhBTlp5aG8xd0k1RWpnV2o3?=
 =?utf-8?B?MWpkU0g2QXQ0Zmc5NDBibUdhUjFrWlRqWTBGUHlhTmZtd3c4L0xnbFo4Vk5t?=
 =?utf-8?B?bERuejZvUEFCQ3VWSnYydkVscUxSRkdtakVIT1Z2SGI2aUdBZnJrOWZ6TGti?=
 =?utf-8?B?SjdFaDZTSHJpdGY1eEE1dGR2RmtYVE5SemtwRGNLbGJNR3E2WVFHZjZTZlF1?=
 =?utf-8?B?ZnhOdzkrYjg2ZllCd0EraVNZck5tL1BLbGJqRnBuUlo5eWFwT3lobUo2WUxt?=
 =?utf-8?B?UFBqSmpIbHZjTGxTK3c4YjhZSWVzTXpLYXEwNWp0NENZZ2M3YjdUeWQxNzVz?=
 =?utf-8?B?WTZPSEtrM2R2NTVidEVsSGVWekFoRDVESlBrT0IxU0MzTVI4VXRlUzZ1MzU3?=
 =?utf-8?B?MnJ0RUFIVE03S1Y2UythT0M3R0lKaEszamU4UXhVT3pvdkhEV0VUdTVvanFu?=
 =?utf-8?B?UG5zMTFzQ0xSWjVybTZoY2tvcnh1Mi96Y2JFaUlvZFFrbXlSOVVuVDQ5KzZ5?=
 =?utf-8?B?czBuNjM5MU9CczQ3L1VkYzZrUS9hUWlnVEEwSisxczRJZUFqdGN2MG5NaWJL?=
 =?utf-8?B?ZlM2ODBWZ1RRLzliSXo2Qy9abE5OSnFHMTYzYVRzdUwydVpWNkt0cWV6WnRu?=
 =?utf-8?B?L0JVWkF2VzRDSDJ0bHovTkU4dklmSlZEV0xSbDJENTJwT1ExdUZpOHpIVmlp?=
 =?utf-8?B?UC9XRzhNQW1TTVhYcWNMUklRNVozNTZHSy96K29pUjNGaXpCWFFGalhMZkNZ?=
 =?utf-8?Q?ETrBLpOryqYSnzcvq2v4qu8Bg9k5MkA0WGwrcmh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWQwdzloUEtUQ3BWbW1MMDN5WDlEbkhCV0hIenpLejVSUXdsODlZT29lSDZY?=
 =?utf-8?B?cm5BQktYMmozK291TWF6ZXRzWUx3VVdodXRQV3F0eFFzN1cwY2ZpVC9Ob2Fv?=
 =?utf-8?B?VzF6MFA2cjBEdTBpbC9OcTlGTld5UTIybmdhU2RUaXc0WWJrY3NrOG85RnlB?=
 =?utf-8?B?ZEVnUjZWREdJQkVXTU9yZ3prRG1JNytmaG8wQ1M2N2E5YzZWKzUwMTRvTnMv?=
 =?utf-8?B?SzNpUk02WUVheGd1VU10U1BMNk9hcGNJdFMvMlVSVEpBZnpQR3pjMGVwbkV1?=
 =?utf-8?B?ZEhxMlZqaDdQY1pVMCs1YzZLVkVHcFNOb3E4dUhXV3BTTmZMdm94UFBvVTVL?=
 =?utf-8?B?ZW9ENHBjWDdkZWo4RGVLSzRmM25DZHJhc0JtcWZOcDc0Slc3RmdGOFNpUEtB?=
 =?utf-8?B?T3NISXlaNnNEQkVibDB5VHBHSlNMYkptbVg3dGdkSmVkQ1FqbzFabmxLa1kr?=
 =?utf-8?B?bC8rV0dGbVhwcVZhUzljekM2aTcxamc4eEk0WklLaFZ5QXlTY3ZzYmxhdi9B?=
 =?utf-8?B?a3ltZElWRVkzb0xrWGpGMXF3WnBNclpxY2t3ajdqSFBoM1h4cWpOdlc5RVFJ?=
 =?utf-8?B?NHdMZDBtUkViWnRYQk5sS2duWHB4R2w0ZVlnaVVDSVlLQmVvMzhvY1JzNVlQ?=
 =?utf-8?B?aHFjR3FmNlBCbURxMC90a3ZwWjUrSnlvdWN5T0JJUmJ3cExrbTVoYVFXWDdI?=
 =?utf-8?B?Q2RwR2RiaENrNzFxV2Q0cUVENzlVemhRKzdOQmJUQTF2TlhiT01rV20vTXln?=
 =?utf-8?B?QzNZMHNuVS95WVFIQy9zTEgyaVJRVllDOXNXdUNyeThqWElQTndrckNJNUFn?=
 =?utf-8?B?d0R3TzBxTUQrcnowTko2NDI3UDdwVS9KUlcyV0RmNXpmazFhcjZocDd1RXBx?=
 =?utf-8?B?UVVwMGpFYVdrdkJJQlJMdnZpbzZpeG13RkNqSHErSHFFOVFJN1RNdmExK3pj?=
 =?utf-8?B?OGFveExMcmNROXBtRlJyWnlwZnZGZ2ppTjhtcjVkOUpabWw4bWs5WUE5eW5v?=
 =?utf-8?B?VGpZNHNMcVhBOEVXSmkrWlB5VnpzUE0xREM3dDNMa3hoOEdRamR5WU92Nkcr?=
 =?utf-8?B?TTZqN0tCRUROOGZ5WEFHaDc4UDhSWmlDUml4UkZCWEwrZEtRMUFkcHk2NkZC?=
 =?utf-8?B?aGtJcXVEdDFBUVFNd01SSXQ1cXg1OUJPUEhZcmxQVFIra0RDeXZrTlo1NDNW?=
 =?utf-8?B?ajYvYWRFVXJWS3NIR1dNUFBOWnRSeDZQSUFQN2Fib0c3clBKRDBLdnZrR3R3?=
 =?utf-8?B?ZCtSQis2WUJjb3Y3RmpPQXk4ekNBbGhVaUxGT3RvbUZpRFdjWGFUZjZKcURl?=
 =?utf-8?B?WXBSYWhhNll6WUI4clZTVzhoTkJjUGltY2ZSc2xmaEszZkd0NHhZa2RDRGIy?=
 =?utf-8?B?Uk1QUWwxeTRmcVRYQktmWTVjQ3lmNW1XTE4xVDJJbW44clZvK1BxUmlFV0Jy?=
 =?utf-8?B?UkI0b1RFTFRKMkIzekZ3ZG11Y2pRUXhGdFpJVURqR29lUHQ2bFFVeGxndzU3?=
 =?utf-8?B?UG1VamovNi84R3JDVmZlMllnNlZsNVNSLzFXejBCdElpdXM1Q1dqMnpqdERS?=
 =?utf-8?B?cmJWY28rMy9sdWxOR1VlZjJRNUFJdUttNGpuTThYSGVKZ0VOUmJoa1lud3VB?=
 =?utf-8?B?ckcxMWhHWFdYQzczSS9RZythaDg1bEJlcDJLVjd2dDl0T2NtbkV2bFpyajZJ?=
 =?utf-8?B?bmtDU2lyeVlvV2tHNDI1Z1d1RTQxZXFpelhrN1pOcjRxa1FPeDk5WGg5bkto?=
 =?utf-8?B?NHpZUUx6NkovV3JJeUcrbWRGeWx1MS9LSmY3eURkWmFBS0RDaGFNckxGT042?=
 =?utf-8?B?cUlZclNuMGxtdlJUak83aXpTang2S01Vck1rbG03TmRoTWNlTzZ1dWg4UGhu?=
 =?utf-8?B?dk0xTG1wTGZpbjBadGZhSzJQTG5pb1JtQUU4M20wRVhwZ1R2ZXV2ckhCdkRi?=
 =?utf-8?B?dXQxZXo4TTFOK2JuYm5hUVl2MnlQaGtJMlhtU0U5N0hxNUhMTVNzbllQd1Rh?=
 =?utf-8?B?NTF0a1BPTERhZXQ4VFBkSGwyNjkrejI3MUtlT1QxV1I5ajN4NFNwTDFINXpl?=
 =?utf-8?B?eExDR1VwNS9tMldRMllBZ1pWN0IrZSt4ME1iNXg5a0FDN0g3cTNuVHhhU3J3?=
 =?utf-8?Q?uU4kUfWWMgd5XORPj1EbKJn14?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196d226c-8e08-41ab-5108-08dcf7aa2573
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 23:42:12.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRzeDklfJLQav8NnTbxz2UCfzKl0CVGVgADdEQQubTxrzbb/xq5GbCG2qyVB73W8IW6WNFQv+qz8wdm/Zf/w3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8883

Hello in this patch I have removed CONFIG_UNSUPPORTED=y from Xen build 
but this now causes the test to fail.
I guess all three are needed: CONFIG_EXPERT=y, CONFIG_UNSUPPORTED=y, 
CONFIG_ARGO=y

I will send out a new patch with the issue fixed shortly.

Victor




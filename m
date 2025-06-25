Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944C5AE8AA1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 18:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025354.1400965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTKF-0002kS-Uv; Wed, 25 Jun 2025 16:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025354.1400965; Wed, 25 Jun 2025 16:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTKF-0002iI-SA; Wed, 25 Jun 2025 16:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1025354;
 Wed, 25 Jun 2025 16:50:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GTF=ZI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uUTKE-0002iC-FP
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 16:50:18 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:2417::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75b67389-51e4-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 18:50:13 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Wed, 25 Jun
 2025 16:50:08 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 16:50:08 +0000
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
X-Inumbo-ID: 75b67389-51e4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w15h2qnXBKAfxpFJQ3ywpyXUMDXdk3GKE/ocw70gj8XGoDTxYpAq3W1D19ur4fs5UEmLrRqw0W39f9jnnQ0q+5E7qXsxIRogUcnGz6hmSyCr2zBqiZPim7XD2q7m1s+ufC3IgveZ1jYE+LXWZ7YuanU92iM1x3HlGxJ+qfFt7FgHUu+Vf+8mo7GXcS0Wx6s2P1cwVt38IC/DkA8T9hYd3p0f+wdx9OZrYscTolFbSsDOaBYNPOVnX7LJYNukj1xGN+xjTxMfK3V6kqYe1RRUflExUspoW6cYaw2MYCfCzLV4QREBZ7bF1C0+vYrqeqaVszS0GgMUHoB5T/ZOxAKO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+YeSWqwHsVG8icKv48d0Goii6UbM+lf2kEgO4NeEt4=;
 b=bJqRuibgvP9FIYwrVxGGvERbrkUlflUguEU69dmCabS0Kzrj0njIi+/QV5EupmW6fP8nwtzBk/Mrz+6OmOSrKUVrgxor1vdb6xieluuPPixD8V8bwcvJ9Zx6kaswz/DKLTJOdnDmM5RnpLvMz2rALhtBOeLzSOR5MJhnjz04SVOfldnOFHyIgVFBGohrfmVjY9Qsi3Rb0lCJWYHI9GmaY0ceQeS9cJww3WZIkunXrj+5On1sazeHNrfUQ9GZY7+okHFjJH7/IrOHjSZt7Twjl0/zSIaufIetMs7vXApXXzw7guHq4ZIhKbenVMfZ6+JNesH3g6r+xIeOCAiCta6Q+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+YeSWqwHsVG8icKv48d0Goii6UbM+lf2kEgO4NeEt4=;
 b=nQUfxvQCH2YghVpvKhSwx0dfnhw3Am5ipIsaTYmdzr7atq1pdn0xkSK6SujjPvqDc7Y5Uv9eBMBgs2aso5UWH9SQMhEuutYjEoAbXxfogW0UsAlIIM1emV31XCq35SsCClYMFdrsscWvD+ct3Q6DKsSdls9fyxg+6ZHHZ348cHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e3d28537-b531-4cc5-b875-4afa0437ece5@amd.com>
Date: Wed, 25 Jun 2025 17:50:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory
 mapping table
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <95cc28af74339ea617081f3935123e38a53cc657.1750411205.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <95cc28af74339ea617081f3935123e38a53cc657.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7PR01CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 01644961-59e7-44ef-1c7e-08ddb40857d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVhOR0RFYmdCWGtUci9sb1Q5ZG9VN3U3VFJKM21oMk9OY2xEc2VsdEdYY3k1?=
 =?utf-8?B?QjBKdFJUekgwL3dtbUFjaCt6WjZkTEFDVmNKcnd6aW9ZUkxEMUNkQTdydHUr?=
 =?utf-8?B?elFaTi9WenJ1NjdRdmtJZkNSWnZEdkxUY3RBN3NxZGZna0puYkpUWHB5Nll5?=
 =?utf-8?B?WlFjcmhHU2w1aHNFeFpHKzhBZ1NJd2NtTDNOUnFkTDMwV1RyZjRwRzZlbDRJ?=
 =?utf-8?B?cTFvUDJRTUJzVnNKdm1BdHJ4T3pJRDVLUitpT1R2S2p0VUEzak96c29pL0s5?=
 =?utf-8?B?ZXhwb0I2dDB6TTdjN1dRMHRsSkpDSFVJMk4xRjMxOC9BRmZzY1MwdkJScjI0?=
 =?utf-8?B?a1J0OE0raHNsS1hRSE5ERVM2MG1WS0JmTXMzSHYzMzZKdEFMRXhaVkVXMTMr?=
 =?utf-8?B?cEIxSDVma0JkZk4xb1gvMVBEZXplUzB2MVhTekgyT3NmVUZnM1lyUHNTZ21Q?=
 =?utf-8?B?VUkrMnk3Ui9KL0RGYlJ4VDVYd05raVpLeEpsUis1bDIvL244NWl2azRxWnFC?=
 =?utf-8?B?VS9NRGlhOFpDdXhleXlzMkhmdVdEWWFZbzNKbUVxdjNOb0hLSmpmQUxKVk54?=
 =?utf-8?B?ZkFvU1ExNXU2SUErK0FGdTJ2b2wxV0tGR0xCZDc3NDhkcVdMTlVOU0lLbDRp?=
 =?utf-8?B?ZnkzU1RoRUYxWTZkQUdJWWJJVEthTmFmc1NrTU16SzZsK3hWNk5yQzd2UnZu?=
 =?utf-8?B?WWJ3ejdjOFhjWDJwaGt3MkVKaTBFUXpwdXhZV2tQSnN5OWExZzJMTDE4OERt?=
 =?utf-8?B?My9BNElsYUFWRzhlSS9odnNhUk5hVzJvdzJaQTE5QS94QzN6bUc0dDZYUkdV?=
 =?utf-8?B?QkNlNlc3d2taL2tGTkNoMjZ2Q1R6dENkNHUrUzh2NzJ6aFpGYk54ei9Ob0tZ?=
 =?utf-8?B?S3drcXplWklaek1WNGxGMy9vSzlMMjVOd1Q3eFdseEI3bGZIcUNObjYzSDU0?=
 =?utf-8?B?RHFHcXg1Wk1XYzVOZWJDRXg3dklsbTlvSnFaUnpEdk5xb3ZvWmd1MDlGTUts?=
 =?utf-8?B?eVhKRU9jaEJncTZ3OW5oRTIyMFJvM2k5T09vcXhvWUZaS3c2QlpKMi9oUWVB?=
 =?utf-8?B?dmNCN0RDYkhLeDJINGxYSHpvaU9YVk51Z2xYM29TQS81WDMyV3lhSGdCN0dQ?=
 =?utf-8?B?ekRQdnZpRWlYZ0t6SGp2VlhFRWlwMWpIc0VQanI1RURBMmVkZGxVbHFpN2p5?=
 =?utf-8?B?Q0NKUm1wL3M2elpZUFZVUXpZRGZJcDNpMWpVRVZvVm5VR0dvdU43ZkwwdVor?=
 =?utf-8?B?YmNDc0UwaWMxbjlxUzhXTHdPTlFKeDJCd2pSZktPejhLc29xZDdEeko5ZWZN?=
 =?utf-8?B?QlcwRG41RlFwSXRXWEtjSU1oRndCODFpZERCMHRrSUMxQTgwZXBBY2lJbFNJ?=
 =?utf-8?B?eWx4NFlRczNKQTJRL0N1NVVXMzUwWWNiRG9vWlBMVks0TjVOR2U0SkJhKzdT?=
 =?utf-8?B?c2IrWk5vbGNSSVh6cFFZQnprRGt1NU9JbTFPNEJqa1hVanlzYVI4VmlLdEZi?=
 =?utf-8?B?LzN2SGdncG0wVzJSRE53NXZNWWhVZnNUVklRek4rVDlBcjN3d3d0U2pwVWJD?=
 =?utf-8?B?ZkFGYWZZTnJhVXhIQWpFczBzSkdqeTRTSkV1ajVQVjExVWFQSmhHYkJVQWZ5?=
 =?utf-8?B?N2hrdmorYWd0bkZVSGJBMVR5YndQVDN5aFFQM2xEa25sZ1duZGlBK1lpUWZq?=
 =?utf-8?B?SDdEL3JmZjhZMHI4Qjd3b1h5Y2ZsbWtHUGFzQ096aXlLdkNEUTRuaDJaN28x?=
 =?utf-8?B?OVNxd3BHSWsyUDdUeXFDQjF1ZmZTZ3VOME5yUXl1aTdTbG0zazA1NVJ6ZDdE?=
 =?utf-8?B?dFBlaG55anBnWmcyalBaOGQ2L2N6K2hIUnNnVUdMaHExbktSMUhSWFZyZkNp?=
 =?utf-8?B?YjhlQW1WTEtrS2tMZnA1NU1Mak54MjRDb1hteHpJcGg2Z3RPOXhWR2hwZHBh?=
 =?utf-8?Q?WLsRQo96pUE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkh2bEFqZWt6a0czbFJ1YVBMZlYwSmZ1TVk3bGo3RnMreU1BRGJKUVdTRzVy?=
 =?utf-8?B?MnBoSVJ4QVBzdUNCdTY2UU83SjFhQWNWMXNHM29QR05oVmozdFliWnZ6SDlx?=
 =?utf-8?B?YTJWaGpyS1IzQkpjdGZGaFAyMElyWVB4bUIxUm10M2t5bW0rL0lubXhxUzUw?=
 =?utf-8?B?YzhxQnd5RmJyTDN4QkFDZGY2NTNSTEh3aG8wQ3h4Wk1KaGtMWlJxUVBiblhL?=
 =?utf-8?B?ZVpoWFV3SUtmeUw5Slg0M2JUWEp4UG1RZHpOaDlCRmc0QTYvL1k0OE9leHcr?=
 =?utf-8?B?SWZaWVZZeVcza1U3c1kyM2Zqc0pPNWtwTlBxS2pyQnQxVFZRTG1TYTBjNWVh?=
 =?utf-8?B?VnBhalBZNEE1TXpaY1k2T3l5eVVKRXBhMEF3L0h3d3Z4QUxsYzFkN2I4SzV6?=
 =?utf-8?B?Qk5vdnFFQVEzNUFIL05DNlZyRDVTbmhBeEhFZHM2ZUp1a0E4RFZPY3RKZ0Jk?=
 =?utf-8?B?eS83QzB6TEhkK0R0MSs4QkgwN2ZMQ0JDT21OZ25TYTFNZ1hVdUpuNUVCUzFx?=
 =?utf-8?B?RnpTYWtBWG0ya0MwNVd5RVo1VEJGVzNGTlppY25YWXpEakZjMnVYNTAvS2Jy?=
 =?utf-8?B?ZFoxb1hBZUFMQk01SEZoNTlOaG1LT09LOVVUWmdXeFZGa2U5WmFDaDB4cHNT?=
 =?utf-8?B?bWZmYlhPNmEzZE9IZEVOYUwvcDVxV0x1cTV1cktJTUYxT2g5UlpPQVhhSHJn?=
 =?utf-8?B?RDBIMDhOb3haZWJRSiswUTN2WVBRRDQ1TS9WWFV3VjRKTVZ3dUZwN1VOTks0?=
 =?utf-8?B?L3BXajljTXpRa0VpR2VVVk9tSlNzOXRmbW5TUjZ0NzlidVo4RHZXbm5jblJO?=
 =?utf-8?B?bW5xWkhxZjh5Tnk1dVU0dGx3WGg0YVh2ampkQnpSV1JRQ2JJeDlnQTZCWGE4?=
 =?utf-8?B?SmVkL0JmL3hPdHBvc1ZOMHVyNDloTWZLWnhhYmZrTzBnMVZleUptdXB2SmtU?=
 =?utf-8?B?S1VNSWh0MlpvSHNmc3FGcjhZTEpwcTdjV3p4MmdYNHUyZ2RSK1lYSGl6dFAx?=
 =?utf-8?B?ay9SREV4TitGcE1LOEZPKzRDZUpyQzQ4akNnUjFRN3ErUmRvNUloZXRycWVo?=
 =?utf-8?B?NFpscGdseDJ6MERYSWpRVDA5MkxoLzgrK1NtcDdlaE55NTdZVGdKTHgwN1V6?=
 =?utf-8?B?OC8yMnlQZDhCYUk5MDBHRU10WFBQcVMwanpoVmhpL0l2czNlanhwRzVkcHB5?=
 =?utf-8?B?ejJjZ0xRUXdkbXMvSlZxQ3oyWDgxdmV5Z2trMkhKMkdWT0s3a1dkVlBDRUtI?=
 =?utf-8?B?RUV5dHZUc2l4QXJvWTdjVXhRMHIrNHc3K3VqMlNxTEZYdldHYlBYOGZoUndr?=
 =?utf-8?B?UFg2dW0yZ0xQVG0wb0dQYXRJdUQvOTdPQWhIZlZWTURwYThpNVF1ZlltYWQ5?=
 =?utf-8?B?TU02WXd0RUUxQnUvS3g5MmluclUwdG13MFZlTWN0ejBkZE1vQ3lubjJHdHdC?=
 =?utf-8?B?bnhwZnZjUTBhdk5TekhKWVcxOU1QUEQ2a2d5ZG9zUDA2Y25DSHVRU0tPY2Ix?=
 =?utf-8?B?MnRNenJ2MVNxMFlRK2pzWk15V0U2YVZQeFpiQ0tIUXAybHNaWGJOeW1yclFM?=
 =?utf-8?B?b1VDMTBUY21sb0VQZFBhZ0g4VHc0Ni9hcDRvOWV4WUxnQjhpRUdyZDVvN0Zr?=
 =?utf-8?B?dnIzbU5QbkF2dGZtNkYxL1czUzZHU2QraFpTMjZPQkdtNnhkSVJaSzllaHhq?=
 =?utf-8?B?Tk5mejVnbng0L1ZvdTFFVnBnNmNSL1hyeC9LbDl3MEhJaDFZZEpHRnZNNVpk?=
 =?utf-8?B?eXgzbjY2STdqNFRzQ01hTnhlVmhxbHVvTW91UFBCdmhWNzZTSGJpaXllNTVP?=
 =?utf-8?B?SGRaYm5LbFJrb2g2WS9KMWZ3bmRwOUJmMzE3SDVaNGhGRUorOXJNYkJBZlRw?=
 =?utf-8?B?OWdmVi9URUcrZVp4a1ppYWtDak9NYlNrOEtxbWZMMmVxdm50L0hOeXp4OFgy?=
 =?utf-8?B?czdyOFRzMm1PVGV5MzBwcEtFN1dVUUVmRTh5RWw3eDdic29SUFJiQS9MVlo3?=
 =?utf-8?B?eGxrei8walNmcGh2dm9Pd0sxUnBYN3YrWG5Gd2p6RlZvb2tZelNCYytNbklj?=
 =?utf-8?B?b1Y2RWJXUTNGMlZKSVJCMzdWTFFOTmRYd0d4SkpkZFJmVnpxQTNxYWx6V2px?=
 =?utf-8?Q?v0mFvgrURXTcVv+17eTZWQwlp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01644961-59e7-44ef-1c7e-08ddb40857d1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:50:08.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqkgNey2/9SJzxeF9P+cnRKiELLwE4NRaX6+uayvbs6QJnbiu3/e2/+BGG1Rc5k6kQg+h+r5y+ryi0hePkzBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608

Hi Hari,

On 20/06/2025 10:49, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Penny Zheng <Penny.Zheng@arm.com>
>
> This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
> destroying an existing entry.
>
> We define a new helper "disable_mpu_region_from_index" to disable the MPU
> region based on index. If region is within [0, 31], we could quickly
> disable the MPU region through PRENR_EL2 which provides direct access to the
> PRLAR_EL2.EN bits of EL2 MPU regions.
>
> Rignt now, we only support destroying a *WHOLE* MPU memory region,
> part-region removing is not supported, as in worst case, it will
> leave two fragments behind.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>   xen/arch/arm/include/asm/mpu.h        |  2 +
>   xen/arch/arm/include/asm/mpu/cpregs.h |  4 ++
>   xen/arch/arm/mpu/mm.c                 | 71 ++++++++++++++++++++++++++-
>   3 files changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 63560c613b..5053edaf63 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -23,6 +23,8 @@
>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>   #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
>
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>   #ifndef __ASSEMBLY__
>
>   /*
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> index bb15e02df6..9f3b32acd7 100644
> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -6,6 +6,9 @@
>   /* CP15 CR0: MPU Type Register */
>   #define HMPUIR          p15,4,c0,c0,4
>
> +/* CP15 CR6: Protection Region Enable Register */
> +#define HPRENR          p15,4,c6,c1,1
> +
>   /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>   #define HPRSELR         p15,4,c6,c2,1
>   #define HPRBAR          p15,4,c6,c3,0
> @@ -82,6 +85,7 @@
>   /* Alphabetically... */
>   #define MPUIR_EL2       HMPUIR
>   #define PRBAR_EL2       HPRBAR
> +#define PRENR_EL2       HPRENR
>   #define PRLAR_EL2       HPRLAR
>   #define PRSELR_EL2      HPRSELR
>   #endif /* CONFIG_ARM_32 */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 1de28d2120..23230936f7 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -199,6 +199,42 @@ static int xen_mpumap_alloc_entry(uint8_t *idx)
>       return 0;
>   }
>
> +/*
> + * Disable and remove an MPU region from the data structure and MPU registers.
> + *
> + * @param index Index of the MPU region to be disabled.
> + */
> +static void disable_mpu_region_from_index(uint8_t index)
> +{
> +    ASSERT(spin_is_locked(&xen_mpumap_lock));
> +    ASSERT(index != INVALID_REGION_IDX);
> +
> +    if ( !region_is_valid(&xen_mpumap[index]) )
> +    {
> +        printk(XENLOG_WARNING
> +               "mpu: MPU memory region[%u] is already disabled\n", index);
> +        return;
> +    }
> +
> +    /* Zeroing the region will also zero the region enable */
> +    memset(&xen_mpumap[index], 0, sizeof(pr_t));
> +    clear_bit(index, xen_mpumap_mask);

NIT.

These 2 lines we can move before the if { ..}. So that the region is 
zeroed even if the region is disabled. This will add a small overhead, 
but we will be sure that the region is zeroed whenever it is disabled.

> +
> +    /*
> +     * Both Armv8-R AArch64 and AArch32 have direct access to the enable bit for
> +     * MPU regions numbered from 0 to 31.
> +     */
> +    if ( (index & PRENR_MASK) != 0 )
> +    {
> +        /* Clear respective bit */
> +        uint64_t val = READ_SYSREG(PRENR_EL2) & (~(1UL << index));
> +
> +        WRITE_SYSREG(val, PRENR_EL2);
> +    }
> +    else
> +        write_protection_region(&xen_mpumap[index], index);
> +}
> +
>   /*
>    * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>    * given memory range and flags, creating one if none exists.
> @@ -217,11 +253,11 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>       ASSERT(spin_is_locked(&xen_mpumap_lock));
>
>       rc = mpumap_contain_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
> -    if ( (rc < 0) || (rc > MPUMAP_REGION_NOTFOUND) )
> +    if ( rc < 0 )
>           return -EINVAL;
>
>       /* We are inserting a mapping => Create new region. */
> -    if ( flags & _PAGE_PRESENT )
> +    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )

Same question in this patch , why do we need to check for _PAGE_PRESENT. 
Can't we just rely on MPUMAP_REGION_XXX ?

>       {
>           rc = xen_mpumap_alloc_entry(&idx);
>           if ( rc )
> @@ -232,6 +268,22 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>           write_protection_region(&xen_mpumap[idx], idx);
>       }
>
> +    if ( !(flags & _PAGE_PRESENT) && (rc >= MPUMAP_REGION_FOUND) )
> +    {
> +        /*
> +         * Currently, we only support destroying a *WHOLE* MPU memory region,
> +         * part-region removing is not supported, as in worst case, it will
> +         * leave two fragments behind.
> +         */
> +        if ( MPUMAP_REGION_INCLUSIVE == rc )
> +        {
> +            region_printk("mpu: part-region removing is not supported\n");
> +            return -EINVAL;
> +        }

NIT.

Can we keep this ^^^ outside of the outer if condition ie "if ( !(flags 
& _PAGE_PRESENT) && (rc >= MPUMAP_REGION_FOUND) )" ?

> +
> +        disable_mpu_region_from_index(idx);
> +    }
> +
>       return 0;
>   }
>
> @@ -261,6 +313,21 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
>       return rc;
>   }
>
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
> +{
> +    int rc;
> +
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
> +    ASSERT(s <= e);

Can we have these asserts in xen_mpumap_update() as well ?

> +
> +    rc = xen_mpumap_update(virt_to_maddr(s), virt_to_maddr(e), 0);
> +    if ( !rc )
> +        context_sync_mpu();
> +
> +    return rc;
> +}
> +
>   int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>                        unsigned int flags)
>   {
> --
> 2.34.1
- Ayan
>
>


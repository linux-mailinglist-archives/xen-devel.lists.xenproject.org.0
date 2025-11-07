Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880FC41E2D
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 23:51:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157905.1486491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHVIA-0000fD-JH; Fri, 07 Nov 2025 22:50:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157905.1486491; Fri, 07 Nov 2025 22:50:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHVIA-0000cg-Fh; Fri, 07 Nov 2025 22:50:50 +0000
Received: by outflank-mailman (input) for mailman id 1157905;
 Fri, 07 Nov 2025 22:50:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NFVh=5P=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vHVI9-0000ca-M0
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 22:50:49 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 333166f7-bc2c-11f0-9d18-b5c5bf9af7f9;
 Fri, 07 Nov 2025 23:50:48 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 MW4PR03MB6393.namprd03.prod.outlook.com (2603:10b6:303:120::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Fri, 7 Nov
 2025 22:50:44 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9298.012; Fri, 7 Nov 2025
 22:50:44 +0000
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
X-Inumbo-ID: 333166f7-bc2c-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yo5gf8hguAXWSkivfbagHAm8FcLMa+7xZayMV/yH9Pz76ezQrtsmbIr56CM9z3DztyHB3ywJjuLyZbMZyKKJavNN4tCskaVgr+qQshvCHDwlU4hb4UnllNj7DDagBO4c8z8HW7gJO8kEVCs7vFGJpGv40t9UZXXc11X0yRGdjdYIjCJ4/4KeQAHosOqFiPC2f7NvK7MTI6cANUMvjS4MoBvpnVRAGi6zoW7CYnQjro91XxgE3Fzlo6dMuD6K4tmquU8R4C8yiYTC55Y2gtQzaVWUE3vBTRf1VUq92XVP/i83yawT5fhOa990CKQAfHL9EgLBrgh+93Bt00kw9z2WTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqwxiOrD/gYMZ/l+Bx7Y9hfeywbPkllx7n6cpZI53j4=;
 b=h211SrQ79DbfVFKsDxvKXbxJ/8s0q9XjTkMhC0JP26b5Yk40CuzfWE0dMJmfkHIJBBQhYhfL8Cch/WIWVY4eh3f0uMJvLlzr0zGNHcPwQWOy0PHiYL1evPUDPnb2D8PbazLUEU16n8USTjxNy066RIa4250Bc6tupBrJ+NqVO683mHe+EWXSp9uI/yectybK7n+rAFC5zZq++vSIQwtupAd1ra0loOXQgcV++GnS8XMv/oKrTY7sJueMPHSCcUW/P2RpQdEma41EpWYdm6aMpokr+W4YonXnBXs8uJLhOxN1jCuoHtr+WB9AtS4e4qENS5CUNwERdAWLRTygPpIvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqwxiOrD/gYMZ/l+Bx7Y9hfeywbPkllx7n6cpZI53j4=;
 b=RfCIow1RTjCPqIr9kYZFtNN/OKxowHAB1wvywVUpQvvwslp8+fdCaAidXsipU4TItMEjf38MpQbIUUxN3Iz8wL4i2WsZis36OTHBMeUUOes+kFNh/UEnKTqhFVzd1K0Pa+n6tHZ5JKwsJNGjQmsF1wgm+dHbeLOaM0hIplDjr78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8c9f0988-0eb3-40f0-bd22-13b23af03ed8@citrix.com>
Date: Fri, 7 Nov 2025 22:50:39 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] fix xl.cfg docs to correct viridian defaults
 list
To: James Dingwall <james-xen@dingwall.me.uk>, xen-devel@lists.xenproject.org
References: <aQ5HR2eEQ9awKtpC@dingwall.me.uk>
Content-Language: en-GB
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aQ5HR2eEQ9awKtpC@dingwall.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|MW4PR03MB6393:EE_
X-MS-Office365-Filtering-Correlation-Id: b4266db2-7998-4336-7f16-08de1e5014f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnBZQ1VQejJzek1tcFF1WXN3b1ZMcUNXNUs0bGorblhiWjB0eWVjcFdiOWVF?=
 =?utf-8?B?SDVyMTMxZjUybjVnTDlyQytXcUEzSnlobkwrZXJ2YWtUVGxHdEE5LytZL3Vl?=
 =?utf-8?B?eHVhbmJtN1d3WGp5dzlZeXBiazhPSTJ6MkFONTFJRXRaQUNSbjRCZmJjNVJZ?=
 =?utf-8?B?ZHU1aXRWNnEvVTJoY25HdG8wc1hsWEZCTWl6bjBYMFU0N2pNVllhY2JHYmpj?=
 =?utf-8?B?Mi9YUkZwM0FkaC9KYUptd2tnMXVNc3dBS2VYdHliZHk4anQ4Yk9meVVnZjVv?=
 =?utf-8?B?OEtFVngrZ1lHMGVjd1RHamJXOTFtMGxWa09ncHJNMnY0Zzd4WWR6bHpibnZj?=
 =?utf-8?B?SldaNFU2V0dUYnBIVitjUzdqWmNYUjRjZmlKSVhOZ0FmeTBWSVdXWjJ5eitJ?=
 =?utf-8?B?dDBrM1ZtR0VRdWIvL1I2bUJwVUFJRmxjRld4ajZjWk9iZEFJSGExVjNFTTRU?=
 =?utf-8?B?SDExV3RFQjBoVGRSR3F5YmxWLzdmcXFYcFdTUkRsWWo2Q2FLdDRoMlh6UGRM?=
 =?utf-8?B?UWtmRjZ6Ymc2QmNjRms4YXZ0eXpNRXJsWFpKRFNnZ09abG5VLzEyV0lXZ1Yy?=
 =?utf-8?B?RHZQK3lsMlhpR016WXhXU2J5TDdkeG54Vk1DTE9DenFWNXFzajJvMnBzV1VP?=
 =?utf-8?B?OTNrR3BoRjBJYkUyNC9ocG4wbWUvemthYU92enRTYWpsR005Wjd0STNmb2ZP?=
 =?utf-8?B?d0JMcGEyalhFNEt4VEY2Zmt3Wktqam42dVpWKzREQXdEQ3NEc2phZVlUcWIz?=
 =?utf-8?B?c1Z2Zk0rL3A1NVBiSXU3ajg4SWlZQVFNZkpUY0JxWjVJZ2VnTFc3cEwrbGRC?=
 =?utf-8?B?QStoSFhESk9lYVZHelNuSi8zd3QrOThZWVZ0c3Q0cHN2VzlVMGZiREhlZ1BJ?=
 =?utf-8?B?cFZKNFNlcHQwclNSc0Y0bmF0dWp5OUVRWWlhYStxM3YxRjVPaGYvVjhaSjg2?=
 =?utf-8?B?c05lOVNOMmN1Q3dDc2NIdDRNUEZVY1ovR1QybDk2cUkzWENqeDdGeGZWZk5m?=
 =?utf-8?B?dGJMemFQZDhPbkRubGN6S0NkMFFMeXBHWGRIcTFHNjQ4NVN6QUpSKzRqVlFY?=
 =?utf-8?B?YkFSZGJkVWovV2loSVBlQzdhZTUyWDNOU2RlQmNXcDRGSElJTzNvRFk3ZzJa?=
 =?utf-8?B?NWQ5K0MvRzZpSnF5ZENnck9YdkdvcDRXUmpMTlVOWVU0MkxBblVYSGMrWFhP?=
 =?utf-8?B?Z2tKYmtETmVhTm5nYmkxTFJkVm9zZFRzMUtkcCtkajhhTDNib2dyTGdYNk9z?=
 =?utf-8?B?SnJHYTFMa1dzOEZYRVlkMERhbU5JdmlCdkp4RkUwckw4WDdpWFhadVM3QmZK?=
 =?utf-8?B?aGR4ZGtobVI3L1ZhU01KRzJ6ZitwMDUzZlAvbUZFMmZIY3BIRzNFMDZDcXgr?=
 =?utf-8?B?dzVRWUhVSk1LQTNYRDg5bm0yMkIvZnljMC81NnV4Rmw5T3N6a1R2em54SkhB?=
 =?utf-8?B?VVRKVjZ0VXo3NWZWN212eWpLNUFISHFWOERtTXhWMSs1QVVlZ0JOUTVHTzZ0?=
 =?utf-8?B?L1dTVVVNUlVmVXZpZEVnRm96MFpPSGFUdXZDRk0xOFlkMjFrVjZCckRvaVN5?=
 =?utf-8?B?R2hRdE9XcWdWNGtzcWtpZUhZSjgrWGkvMWxKOXcrRTYyOFUzZjQ0QkJ1bXhl?=
 =?utf-8?B?bDU3Ym1YQWd3Sjh0YUlRZE9Oekszb0kxVUJGWXJEMEErOTBIQW5wUmloVEho?=
 =?utf-8?B?M2NMN1hxTVlWQ3YyV0lTVjBFWU5iUVoxNlUxWWMwc1R3S1VQZ3ZabzBkTnov?=
 =?utf-8?B?ejB2OFhPYnhoZEVMTTdFWVNwUUQyWExOYzJwRlBTOGlSSG4xbk42UGl5S0hj?=
 =?utf-8?B?N0dLWGhPbDFucUYrT1M0SldFUkxDcDhUZ0d2eDZnS2RZWlJBU29rOXpNYy83?=
 =?utf-8?B?aVJFQVVKYURFS1lOblE5emFHc1JId2tnTXhsRjFscVNGNjg2Z2pqMHpXN3FR?=
 =?utf-8?Q?+1o7EVNWeyzkpMb+HIRr9gv/8/9jHzbD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0wyUmlhNnhna2JJMURaUkZDc0czYWxtR2s1b2ZNbDNRWUVFeGwzNG0zaHRB?=
 =?utf-8?B?SDlrbGpjL3Roa0IrM2MvSWdDRUVoaE5uMC9JWHdQREJIVGxDUWtCdC83TkJP?=
 =?utf-8?B?eE5DUmgzVlo0NW5WWWNSbFZqQ3d1bGdGQUplSUVMcG8xbUp5b3ZTeEozWlM1?=
 =?utf-8?B?YTljMnpYZjJRMFdtZU5zUkxZVHdNaEVQM1FLZWhVc2M5Njc4OTg4NXg0NFhU?=
 =?utf-8?B?RTMraGtWOThzbG1naVdNcnVYbU00STBjTnllam4ycFlObE1UR3dPMk5yamtm?=
 =?utf-8?B?UnQ2Q3V6R1BraHk4SmZ6TU9QdTd4aGVvbG14cFZ5NSs1RmRHMkdvalFVUld1?=
 =?utf-8?B?bWE2bEZVTEZtYnRuSEp5NjJIWmtDYTNUR0kwMHZXN2Jpemh3b1BaQ3ZWMWt6?=
 =?utf-8?B?cHVLM2NxVFpaT21tczFHdS9PajdudnNTT3BGbUJnbmJTNis3SFNELzBUVU5E?=
 =?utf-8?B?K09ISWY3K3RQZ2pkNE5yTThTaStQelc5UlpEWlhqOVpnMEJZRTdHN0h4MTJn?=
 =?utf-8?B?dGNsQ0hXbm1kczBqMm1VcEdUUEd0Q3ljaXNSVXVJdHFpZDhiMVlVWnB1Z1J3?=
 =?utf-8?B?K3hHNUFxbGhXd1BvemdxOFk1bWFmMDdUNXE3cnFJOXRxck9XclhweG81TUZ5?=
 =?utf-8?B?TTlaTFdCTks1dDEvZ3o1eVBLY3hEeGJ3UFh5aHF1NUhld2pWT1hIMkFmOWlx?=
 =?utf-8?B?MC9mUm9TOTJUcG4rTzUrUm14QVhtUG9URVFLVE03VDFiOFp6SWZPbkxkampK?=
 =?utf-8?B?VndxWk8vMlQ3cXZzTHI3enhLNXBKRkJJejRKZ29rdXBDbHpoV3F5ZU9BeTlH?=
 =?utf-8?B?OTRtazB3Q1E2SVI1Y2hFcFlDTjFYcWtmYzArUUI3b1M0aHpKVkNZQnNKYmQ5?=
 =?utf-8?B?dGVqOXZxZTFvdzRKVC9BcWVITTZhVitoMUxqQUdOb3FmczN4a2Z4NXIxL2dU?=
 =?utf-8?B?TVk3dDVLeXRYOTVDaVB6MmpSazZBa2VWc2J3bVZsOTZoVEoyc09mNXk2eHhE?=
 =?utf-8?B?azJ2aDk5ZDI3dkJlVlNFYS9GK0htM1R5YlBrK3JEQTgwWnFGMHlNRVJCdFIz?=
 =?utf-8?B?ZDV5YmNDeTBBT3krNzhaWjFESXZuOEdXcUZFNUZZa0pQalpHcXE1ZVBQR2hs?=
 =?utf-8?B?V0VHOUwvQ1R1OVY5SDB3M0VpNlRlUE10dno1MkhzMTkrQ24vcGFyWXh6anBx?=
 =?utf-8?B?NWk5cG9DcS8wMGxoSXhzQXpUQUtVWFEwWEY5QnlHeERoUktTVlpwWldoQ290?=
 =?utf-8?B?Z05jRzhUMkhFc2N4S0VHSVNUR0VlTm90d1hQRW0zemhGYkNRdTVxVnFoOFBZ?=
 =?utf-8?B?dlVHaWhkS0RKQVpWVGFRbEoxNDZaeW00QkI4bEg1TFVUR0taTzEwS1pyUTBy?=
 =?utf-8?B?SG9KZnhGMXZHV3h0ZXlRaDZXYi90QVZTMWw0RjVXWDhSWWRwZS9kdGNQdVJO?=
 =?utf-8?B?eEVET0FVdmg2RGhTNWFpa3hkbDFiWjFpUW9ESlBvZldud0NHdEZWQklSd01P?=
 =?utf-8?B?VlZUTHgvNFhGUW1hRlRrUUJFS1hmckhBTXhHT0wzZ0FiZ1hRU3lpVUtzMDF4?=
 =?utf-8?B?NFR6LzhscENDMC9DZ2l0eEFzaVVZV2ZvOHQ3ZTNXSmsySE02aEwrM0dpdzNQ?=
 =?utf-8?B?ZFV3SWdhZHRDSHVsR1Z1aUYycVNwSzBSa0VTOEZvU3lZRGp1YjhvTTZnREg0?=
 =?utf-8?B?L1Fjdkg1Uld5RlRqaEdGUU9xSjRwYkZIWTFYS3dCYTVHcGhTOFZ6QTV1UDQx?=
 =?utf-8?B?VE9DN1NJekpKMEhOa010UWhKbGVDMkdpdHVJWWZkaEIybXBNQjd6OEQ3eWdm?=
 =?utf-8?B?azV1cW1Qcy9CaGJrRXZscXNZUWNERGNPZFd4cUptaUdWb1Z0VW5VOHliNmZm?=
 =?utf-8?B?TU93TEkyY0hLN1lDd1U2dDhqSUN2NmoxZEdwWXpTaTZSL2lZZ254bW9SSWVw?=
 =?utf-8?B?WkFBNXJ1bk9OU3BzSE9GdWpaQUFPVEtkWEphdzVRVWxBaVpia3Rxd2FvM0o1?=
 =?utf-8?B?K0xLaDZJM3NweWtKZjRsamI4TFgyeUlseVpweTNrYTBaMFRKUGk2SjlDYnNz?=
 =?utf-8?B?amRTbW42aTZZZ0g2dDRweTlPcTErdlZESGRrM3diOVFCejRLbXRDV3R1SGth?=
 =?utf-8?B?Z1NSVU1MbHNnMUMvaytVTldvVUtxU2N1Y1kwZWQ0WU5ES1R6MG92ODlpclMy?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4266db2-7998-4336-7f16-08de1e5014f4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 22:50:43.9908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lmzK+9IcHzKOUo/F5sb8H+0T1AWUYnmpenklTVQ92dgcPlurX7ath0+2MSH5xXcC59Wp2NzR84bXmzFZd9s/8J/z+8feu+zU61dWMqHleo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6393

On 07/11/2025 7:23 pm, James Dingwall wrote:
> Hi,
>
> I was trying to work out why this would cause my Windows 10 guest to hang
> when it should have been equivalent to ['defaults'] or 1.
>
> viridian = ['base', 'freq', 'apic_assist', 'crash_ctl', 'no_vp_limit', 'cpu_hotplug', 'time_ref_count', 'stimer']
>
> Checking the libxl sources show that in fact the defaults are:
>
>     if (libxl_defbool_val(info->u.hvm.viridian)) {
>         /* Enable defaults */
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_BASE);
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_FREQ);
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_TIME_REF_COUNT);
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_APIC_ASSIST);
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CRASH_CTL);
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_NO_VP_LIMIT);
>         libxl_bitmap_set(&enlightenments, LIBXL_VIRIDIAN_ENLIGHTENMENT_CPU_HOTPLUG);
>     }
>
> LIBXL_VIRIDIAN_ENLIGHTENMENT_STIMER was removed as a default enlightement in
> e83077a3d11072708a5c38fa09fa9d011914e2a1 but the docs were not kept aligned.

Hmm, indeed.

For the patch, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

It should have a fixes tag, but I can fix that on commit.

CC'ing Oleksii.  This is a docs fix should be considered for 4.21 at
this juncture.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D62BCA1C0
	for <lists+xen-devel@lfdr.de>; Thu, 09 Oct 2025 18:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1140796.1475570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6tKD-0002bI-B6; Thu, 09 Oct 2025 16:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1140796.1475570; Thu, 09 Oct 2025 16:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6tKD-0002YB-7i; Thu, 09 Oct 2025 16:17:05 +0000
Received: by outflank-mailman (input) for mailman id 1140796;
 Thu, 09 Oct 2025 16:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZ0Z=4S=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1v6tKC-0002Y5-17
 for xen-devel@lists.xenproject.org; Thu, 09 Oct 2025 16:17:04 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6156eae8-a52b-11f0-9809-7dc792cee155;
 Thu, 09 Oct 2025 18:16:58 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7929.eurprd03.prod.outlook.com (2603:10a6:20b:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 16:16:56 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%3]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 16:16:56 +0000
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
X-Inumbo-ID: 6156eae8-a52b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezlv6yic8xQuHrVM+xMwKgKvhIehS1jLqm879UMZQuRDbeephd9NUspz8Gi1+fbjikugFt1r3r6gOL4PBB+hF8OQ0dZUKriWhGybX/ZgOvtV0jCSwbV+377FRsjVZh6wXKmO18fZQBGEp4kxuy4TVjFHA7Ki3fZ6xlBgtxtcHgoxg+8fBorotvvqaV7S/gERiEX79FSDz8KY3zthuNvc2PKo2LzqqhS1U5oc810jyunjLi49vY8x44Xj/hwy1xsf5eiy8JzFFJ1S9/ndKBO4InHtUFZRmiYE2C31pbB1BMtZyShqtLmWBKmwJrPhBGRFvwrqIEeGg5HN3aVRTGkUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hydw63ReTdg0aiMVp/2bSqcGoDRu8X0sidBBd6kBVrU=;
 b=RzATH1DyBojxCynEh3br3g3O1X5oRhpdWeQSGuM+vKmxPbQjdH54PFzcFGOOqxV57w6sz2aavKuwP/qhUxdE22N0qLgYzYhJ6MBGyP+nB7+bozAU70bBoPepCd0TOgZiWhvL8cwE16tUMErkEdOYDKCdc7fh69V+cYNpPd1FrqxPZyC8dpFf+XeIh7tXZc4InWO0OCIVqEnWTgWlZ+DR0BITYZAQeGnEw36voSBuktOMqfC4C5TIFo8XOm6IVyHeiwtYTOLP5ogcV7yIXrKaOpJ1XuW5lHM6XxllGOUokF34+OxqkXxwOWVG+qcfkzEYRG5HWzgDr9cAuCFlHBsNYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hydw63ReTdg0aiMVp/2bSqcGoDRu8X0sidBBd6kBVrU=;
 b=KQTOsqmKxduHNKa348eB2NaGDnVTDLQ6SwTZDKBuRhDpPZdN74Unnn2GFCtOYOjEXkq1PhK3NbF9Q8ntQSs9pdvsjHe4q+MZtjOkFoWlurH9VNdWqpnjuoyj3HJWa3JthQZrQMZdZ3qJ2t7/hhvJTnUWy/34akG4FIdUYx1S1mZoG6+vPnRlWMzl/31noaF9tKjtTTgRADfPMIPAb8HXZJDmnSDB9jNL2IwOaiY22JFQAM6KJE2bXcDgT3OUql0XK6uL0ev3WjaG+q5Vsjk7YN0La9CeBIa4gvIL5YA7RweBVXeQ3AiACkmtCiO6biWza+twx81SjgtrA4epKn6X9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <a35ca989-e199-4072-bf73-c9d135f7c2e7@epam.com>
Date: Thu, 9 Oct 2025 19:16:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21??? 1/3] x86/vLAPIC: add indirection to LVT
 handling
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <amc96@srcf.net>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <265d5053-af61-42cb-a3b9-ef60df39c21b@suse.com>
 <dd6b46f8-76f7-46d3-b3be-083b58781f32@suse.com>
 <6a3494af-96a7-4092-a8fe-39aee85fc983@epam.com>
 <f5ae9852-4fa8-4441-9ad9-491e1d1143b9@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <f5ae9852-4fa8-4441-9ad9-491e1d1143b9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::10) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: b5a97342-52e6-4a9d-641a-08de074f4439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGcraTdCTll2WTJncWxFM1lEMC96QVJrVG9kMG11TFRUYytxMkhBTnZiWXNX?=
 =?utf-8?B?TkZiSGQzZjRKa3RDcXp5eExLYUI5R0xKbHpBL0xtOTNtMFJIZXo4bURHdENQ?=
 =?utf-8?B?SW10WEhFUkx5YjJsMWYrdzNuaHpuSjdaN1hpWDQyNk1Idml0dHhhM3ZTbVJw?=
 =?utf-8?B?Zk5GYWhsci8reFcyd3FLV1UxMUtldkJFQTVHYURXLzNKRG5VMThuUVdNLzA3?=
 =?utf-8?B?QzZHejMxZzNuNDR5TVZDamZQeUFVYjVxNFNYd0ltWnZRSmNwQWhQRHhmWEZ3?=
 =?utf-8?B?RXloQkF2bWtHbml5UkhXa0gzN05EQUxWTXhONnBrUnBWZ2JBcnBldmoxRjU0?=
 =?utf-8?B?M2UxL2J3R0dBZ1NvdXdMNXpYRUNoT1R2eXNWLzZWUTlJUjBJYTJ3Zi9jSnlx?=
 =?utf-8?B?NzdQQjdJSmozbFd6anc1dkVWVzlxMmVKbElJaVVpNjdxZjdKVkdWMmJtbUtq?=
 =?utf-8?B?U0JGNmJYNkYvcWZpSVBxdzJRcy9IeTk4QlBhWGNaZFlwaXBZWHdrQ2hub040?=
 =?utf-8?B?eG5UYmJTQlk5cmo3VkxMOTdJMDJiTlJhRnhVZndDSzFGQVBaT3JzQmVTb2VB?=
 =?utf-8?B?WkluNEhnNW5GZnVCeGh6T2xGU1F5MXV2RkRZZHIwZjduOHMzaDR6TmFwQ1hx?=
 =?utf-8?B?bHoyL050bnhqakJPWTM1WUplNzhvR3hhanVGNFdwUzM0a2xmRG1uMzhaVjhv?=
 =?utf-8?B?aitERjVWcXJDbFdJTDRBb2R5SjByanorUWlRZDdaZDZaUUo1V2s3clF6TVVV?=
 =?utf-8?B?RlJQdmRPYTdWcHluYm1KRDJVb1VEdjZYNUlvVWdTYXhGMnQ3eGNJcTNHVTRH?=
 =?utf-8?B?c2xZZElORzR6MW42Mm5ZUG14RjVWU0VFN3I1OWE2d0s0dXVWR0hKUmtxUFE4?=
 =?utf-8?B?SFJ3TVRud1czREs5RlpTMi9OU0FHLy9xQitoeWtvMWM5N3BaUmo5OXlveXMr?=
 =?utf-8?B?eVF2ZlZHejN1VnZma1FvaFp4Q1ZJTHFVcnZzK1JBaTZMQ2hyRmQrMktGQ3NS?=
 =?utf-8?B?dzBXQU15QWZEMkJuT1FiY1JKUDNEYnNwWVU2cDNRaHgwN1hWR28xRHI0S1My?=
 =?utf-8?B?ZU1NZXF1TWhuUEd3OFRoTnpKc0Fscy93NVlBVVR5QTJxR3F1dHRnTEs1RUJ5?=
 =?utf-8?B?aC9IcUdlREVZOWYvTWVzcjJxM1AyZHhNQUVnVFhaaHJuanQvSi81SnhBdFND?=
 =?utf-8?B?VmpUb3hacXRwd2pDQVljVnlJdDZzL0xqRVBNTU02WURrbXI4Z1V1OEkybEV6?=
 =?utf-8?B?cU9NN3BYanE1MWdSRisxQzU3aXpKdjh1ZlVobUlHOXcxMTFDd21yMVZZamR2?=
 =?utf-8?B?YVJtOHZWMnRqVFIwK29sTEUrZnpYWEpYNVdEV05hV29CQytQQ013UG1RcHM0?=
 =?utf-8?B?bS9UZFpOQkVDQndoSENjbWNJckVsdHN4T2REdUN2bkJGY3A5RXUrMXYwcGdm?=
 =?utf-8?B?aGdKWG9VbmZGSzFrUEdVUlRCSnlyUm90S1ppZWhiMXowWnBBOVhPNUV2eDhV?=
 =?utf-8?B?Nk1hYy8wOVRVemlMK3FZNkVzN2NwQXg3OVN1bnpNczJKODQ2MDdRZkhrY3RP?=
 =?utf-8?B?Rnk4eVFnRGk0QlVNUnVVT3dDRnBIekZWM0VlS2EzdTlWMTNyM3VPSHpvNm9J?=
 =?utf-8?B?dHJTS3FqSUdRRHY4VU9xSFV0eDNVWSszMnRpOFFwQmEzZTQ0Z3FJaVJlbFFj?=
 =?utf-8?B?dmorNkQ1OVhDUVNQbWdzUUs2RWlqcGNWamg3TzVQZERyYlNvbTJqRUJpejB3?=
 =?utf-8?B?S2VSZklLN0ZFbHdIOEF0Q2hMT0g0VjdwUTkvUzd3cUMwLzFkRHhocmgzYzlF?=
 =?utf-8?B?WUExWE10elFkQjdTQy9sTVptVXhuTk9mc294TEZVMkxJYlBDOHNick9SREE1?=
 =?utf-8?B?RW5aUHdkbmo5SldGbW5WVEJTYlhQM1lLaWgwcm5BYlFsUjY5OGdTMnMxS3Z6?=
 =?utf-8?Q?bfTRWdSe8BzW6IP6nmTWvzs9AgGCm0NR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUw0SWhQVXRLd0xQZDhwdDhiZFFKa1B2ME5Malk4K2E4VlVoaDJOTjVFUlNJ?=
 =?utf-8?B?Sy9aSjdpc0lzM0Frc29xdHZsRmFFalQyWVJYT1pUVUdoR2MxQmRzVWJZWWF0?=
 =?utf-8?B?MFpGck0rRlFZUm1OOVhWTlViamxiQ2s1ZEZIQTdiNWZON2ptU1drek9KaXJS?=
 =?utf-8?B?Y2E1Z2xjZWFpdm93aWF6Z01HV0lZWFpiNmFEdFZWZ0ZiTzBKQUUzK1FycmdD?=
 =?utf-8?B?LzZHYXZlcjZOOTYyZ3JzazZLeURpK1E5RGtBMkd4TGkzWG1zNlFubHpJZ3ZC?=
 =?utf-8?B?L2NmRExUL242bmJyakpGT0F4eXhTQjNrRW1oMjRXT3lvdmdDM1dJK1ZvUmMv?=
 =?utf-8?B?KzlCUHFncGFQVWNrOUJFNGhaKzNHMHpXell6SjZNcEEwNEhUS2s0cjRQdGtF?=
 =?utf-8?B?d1ZXMWZrZzdta3Q4NUIrUC9LT0dUY3UyRXI5S29vTFR3YjJaSDVUbzhKY2V0?=
 =?utf-8?B?VHVwNlR4VWZZS3FtMjBvRVk5SndSRTN3ZDM2Tmd4VkNHZGJ6OHlQQUtQYlk0?=
 =?utf-8?B?NzRPNFRuRGRSdTNNTFRhYUg1UzZoMXpkVmNzY3Z0Z1lqa0diSW5RY0hFN0Zj?=
 =?utf-8?B?bFdnTVdyeTVmdTRETXZSUDRwVlVQUUhIUVRSeGxMeGZLalFRQkJwUFBPeTI1?=
 =?utf-8?B?MWdpd1gzVDNpQWUzeUJiZXZRZWdTdWdOUVVudDF1ZyswR3hrRmhoYmtmWWEw?=
 =?utf-8?B?bCthYTQwYmE2djBBcmM4dngyRXhrcnl6Tmw2K3hheTRNQVBQRVppNzhSWjIz?=
 =?utf-8?B?VUhMVHVXbkJHQ1FYVW42eG1HZVdWNjIrZGVJMk1rclpsQWJmdkNrbFlETmxJ?=
 =?utf-8?B?cFFQNjhBMmlRWHZNb3UrVndEeVp6TGxQdXpKdVBMWmQwbCsrSFMyRkxQaFJM?=
 =?utf-8?B?NDBPOHhac1h4Y1NkM20vQmR5WFRuTFV5bkVESXNFZ1U5SFBicjhOelJIMTZ1?=
 =?utf-8?B?MWlPMkUyU2ZBdTNvMVhyWlFGT3hmNGVlRWZZM3F4eWM5MndqODRvSzNwczR4?=
 =?utf-8?B?a3pzV0srRGtMMW1wcFFTYk1VcjQ1QThJVUVFVHg1azRLVFN5MW1OcGJXL1B3?=
 =?utf-8?B?RlhlZXpIQjF5aUZtaVg0dWdITGVqZzc4UkVzV2ZSUmdBOVRFbGc0Nlc4TlBI?=
 =?utf-8?B?OURMZHBTWTlheTRjaVpEZ2N2ZXo2elVac0NQWjJyMGpXaVJIRDZPSGtsdjZE?=
 =?utf-8?B?ZldqalBJdElqbDE0V1Q1ZDZBOEc1ZmNQdTJ2RkVlbmUzVjk5aUxpNmdtUWpk?=
 =?utf-8?B?cE1ZTUVJb2JiN1A0VUhwektpTy9DVTc1TFBrMzNrTU1XQlFMb21helFmNkww?=
 =?utf-8?B?YVpWUzJoWUc4Z2tFYXdDWFRuSWR0bStyQjh6RWhIaGFpcldsdHBLcDE1ZDNR?=
 =?utf-8?B?TU5xTXRiREpLSERIM083TU9sNGJJMGduUzk1Tm1DQm5mQkt2bytxdUdRY1dj?=
 =?utf-8?B?bUp5YnAwWlBpUkVGak9OdHpscGtyMmhvV1lrbXBIdUwrUzVZZVZlZHdkakJy?=
 =?utf-8?B?LytVV1JLOXhGdmRYMG9kS2lYSzlrbG91Nkx2dkkvTmY4SDZjREdPd0F1K0pB?=
 =?utf-8?B?TEpSellKa0Q3eDYwQS8rbUUvTzJJNmMvN2dpUzhuRkhobTNkdjhzMW9WbXZs?=
 =?utf-8?B?MXZtbjg5Y3RFbkk4TXBnYlZvYm1GTFlSYjNSWFNBTm9kRGZMelVaSmRMWGxN?=
 =?utf-8?B?RmJ4UFl6alltWTJ4bUtSeCtBVm9oUWFZaDBscDQzaDNJekZ6aWVicnRqNGYy?=
 =?utf-8?B?NHhRTVVSNDhaODh6NUErdGh3U3hYNnlaTTJhZjVCc09lczNhMXI0T0FmbCt4?=
 =?utf-8?B?eDZBZ2lnWlFVaVE2MGg0bnJwR0V6YU9zOFRYOXhyWHh2SkgzQVhnT0VONFRM?=
 =?utf-8?B?aThMbndkZVUwWDRHeGVIVk1abDJXTnM4TlRiTFpmWHRhaXJOMThrMWg1bFNO?=
 =?utf-8?B?SEQzZ3BwaitET2hrM3VkVmVXYjNNdXp6YmVCVlpxMUIxMXJrVW9JdzlpWW5X?=
 =?utf-8?B?VXJGMWFod2NMYlZiOHJjbnhMSUxCbnVDNmIrM0dPckVpdWwwNSs2eGJ5VXl6?=
 =?utf-8?B?M2tuWUpxOUc3OUlwZ1R0YlFldmhwaVp4aUtibHNRb0o1dnhxOXdkQkgyd3Bs?=
 =?utf-8?B?TW5tVnJ0bGx5aktLclBxRmVwMUJocFlDVTd1S3hidW9JZFJiVWQyZUQ1WXZ5?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5a97342-52e6-4a9d-641a-08de074f4439
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 16:16:56.3401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: motA1icz225MgWDSAeoSxOctJeP/G4bhtv/9eRKaH/4LpKsf/XH1NLS5Gp+dvG4+ThdNg9s8KC30aEVmwcv9KExueNUk+7Dm3av1N9gVdUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7929



On 09.10.25 18:31, Jan Beulich wrote:
> On 09.10.2025 16:56, Grygorii Strashko wrote:
>> On 08.10.25 15:08, Jan Beulich wrote:
>>> --- a/xen/arch/x86/hvm/vlapic.c
>>> +++ b/xen/arch/x86/hvm/vlapic.c
>>> @@ -32,7 +32,16 @@
>>>    #include <public/hvm/params.h>
>>>    
>>>    #define VLAPIC_VERSION                  0x00050014
>>> -#define VLAPIC_LVT_NUM                  6
>>> +#define LVT_BIAS(reg)                   (((reg) - APIC_LVTT) >> 4)
>>
>> LVT_REG_IDX is more meaningful.
> 
> Not to me. I don't like LVT_BIAS() very much as a name, but if anything I'd
> want to replace it by something clearly better (and unambiguous).
> 
>>> +
>>> +#define LVTS \
>>> +    LVT(LVTT), LVT(LVTTHMR), LVT(LVTPC), LVT(LVT0), LVT(LVT1), LVT(LVTERR),
>>> +
>>> +static const unsigned int lvt_reg[] = {
>>
>> this is going to be used by vlapic_get_reg()/vlapic_set_reg()
>> which both accept "uint32_t reg", so wouldn't it be reasonable
>> to use "uint32_t" here too.
> 
> Possible, but against ./CODING_STYLE (applies to your other uint32_t remarks,
> too).
> 
>>> @@ -41,20 +50,21 @@
>>>        (LVT_MASK | APIC_DM_MASK | APIC_INPUT_POLARITY |\
>>>        APIC_LVT_REMOTE_IRR | APIC_LVT_LEVEL_TRIGGER)
>>>    
>>> -static const unsigned int vlapic_lvt_mask[VLAPIC_LVT_NUM] =
>>> +static const unsigned int lvt_valid[] =
>>>    {
>>> -     /* LVTT */
>>> -     LVT_MASK | APIC_TIMER_MODE_MASK,
>>> -     /* LVTTHMR */
>>> -     LVT_MASK | APIC_DM_MASK,
>>> -     /* LVTPC */
>>> -     LVT_MASK | APIC_DM_MASK,
>>> -     /* LVT0-1 */
>>> -     LINT_MASK, LINT_MASK,
>>> -     /* LVTERR */
>>> -     LVT_MASK
>>> +#define LVTT_VALID    (LVT_MASK | APIC_TIMER_MODE_MASK)
>>> +#define LVTTHMR_VALID (LVT_MASK | APIC_DM_MASK)
>>> +#define LVTPC_VALID   (LVT_MASK | APIC_DM_MASK)
>>> +#define LVT0_VALID    LINT_MASK
>>> +#define LVT1_VALID    LINT_MASK
>>> +#define LVTERR_VALID  LVT_MASK
>>> +#define LVT(which)    [LVT_BIAS(APIC_ ## which)] = which ## _VALID
>>> +    LVTS
>>> +#undef LVT
>>>    };
>>>    
>>> +#undef LVTS
>>> +
>>
>> I know people have different coding style/approaches...
>> But using self expanding macro-magic in this particular case is over-kill
>> - it breaks grep (grep APIC_LVTT will not give all occurrences)
>> - it complicates code analyzes and readability
>>      - What is array size?
>>      - Which array elements actually initialized?
>>      - what is the actual element's values?
>> - in this particular case - no benefits in terms of code lines.
>>
>> It might be reasonable if there would be few dozen of regs (or more),
>> but there are only 6(7) and HW spec is old and stable.
>>
>> So could there just be:
>> static const unsigned int lvt_reg[] = {
>>    APIC_LVTT,
>>    APIC_LVTTHMR
>>    ...
>>
>> and
>>
>> static const unsigned int lvt_valid[] = {
>>    [LVT_REG_IDX(APIC_LVTT)] = (LVT_MASK | APIC_TIMER_MODE_MASK),
>>    [LVT_REG_IDX(APIC_LVTTHMR)] = (LVT_MASK | APIC_DM_MASK),
>>    ..
>>
>> Just fast look at above code gives all info without need to parse all
>> these recursive macro.
> 
> And with no guarantee at all that the order of entries remains in sync
> between all (two now, three later) uses.

The order in lvt_x_masks[] arrays are guaranteed by "[x] = y,".

Comparing or syncing lvt_reg[] array with with lvt_x_masks[]
would not be exactly correct as they are used in a different way and
have different sizes (after patch 3).

if somebody decide to add AMD Extended LVTs which have offsets 500-530h
then lvt_x_masks[] will grow even more and will contain more unused wholes.

> 
>>>    #define vlapic_lvtt_period(vlapic)                              \
>>>        ((vlapic_get_reg(vlapic, APIC_LVTT) & APIC_TIMER_MODE_MASK) \
>>>         == APIC_TIMER_MODE_PERIODIC)
>>> @@ -827,16 +837,16 @@ void vlapic_reg_write(struct vcpu *v, un
>>>    
>>>            if ( !(val & APIC_SPIV_APIC_ENABLED) )
>>>            {
>>> -            int i;
>>> +            unsigned int i,
>>
>> uint32_t?
>>
>>> +                nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;
>>
>> This deserves wrapper (may be static inline)
>> Defining multiple vars on the same line makes code less readable as for me.
> 
> I don't see multiple variables being defined on this line.

     unsigned int i;
     unsigned int nr = GET_APIC_MAXLVT(vlapic_get_reg(vlapic, APIC_LVR)) + 1;


-- 
Best regards,
-grygorii



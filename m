Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55FAE8B76
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 19:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025403.1401009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTro-0007nX-41; Wed, 25 Jun 2025 17:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025403.1401009; Wed, 25 Jun 2025 17:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUTro-0007lC-0H; Wed, 25 Jun 2025 17:25:00 +0000
Received: by outflank-mailman (input) for mailman id 1025403;
 Wed, 25 Jun 2025 17:24:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GTF=ZI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uUTrm-0007l6-Qy
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 17:24:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f301abd-51e9-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 19:24:56 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SJ2PR12MB9242.namprd12.prod.outlook.com (2603:10b6:a03:56f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Wed, 25 Jun
 2025 17:24:51 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 17:24:51 +0000
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
X-Inumbo-ID: 4f301abd-51e9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABRTcAEew/t39LwpPw9ro6gJZLwQ7X3DXVVSe8Pr4MhfQ33ign6Aqzwo5XpOAAoprcBMap/h0Vwmq7tfxinF4cspXRffH2C1/KCpDgJKmWCo+Cp9ejjT+E5YbbZJwCzFw0daKZjJa09hiF4xoNHck5AD7GNDLw3gulkUR5kt6jxiCLhgp1NVu1N74WOpylX+ULs4aty8Av36YznseoegQ3rTV6IhsZwG9TDRqEv2H9RaNbWBVRgG+OH08g4ZQMTUFbcejBMZZ4h/wwImw7NBvzRWO5H0kFwniqO+21xAnocO5quN0ZoW793dVrV6j5vekYroTFnuC8mKP53vqc0tiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38IiDfL3+sgUkD/I3AVMLowzxSszLt0gLmARJVyjBU0=;
 b=i5qUb5716IcUFwrb/IucQf/KDKFnH1/LMBXtldqUaB5r3N9/Sh9J1KgTxdN1/4Lj4W88aVS/LaZZYYqcU9cdGzoxX73h/BSWy0CnPsKRvsle92nYg6kyaD24b8tNSokaeAbcZ4+HGi30B3vabPPGyGmoYXmbKOVynBk2TxTmCEouIInJT0wdFl8DImSHNtPT/DNNYynLqFIKZj6ix4KrZpPDhSrS/31AnDGX9V/oNCLrOM55k13J13fBUwuJMotWGjyWkM9SjUEsos4TYpwCPNqXg9d/B6oJnGWQxHaUK2T1lRUvFdV/V31c9eEfZVRCJkFswfk1GE47gsevXw/ZGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38IiDfL3+sgUkD/I3AVMLowzxSszLt0gLmARJVyjBU0=;
 b=UuFyGzdo7suOFhf8qsXYk3wHcH3vOLb05z9qEiOibpcH1eWQr4DTl4UhirsVfUvf3xli77Af6DdnBkXipkErKcgQL4Y33rag+DXcBmAGioVe5xsdlQKLnViQZwaR51YnwpR+XPuvpK07AGXin1tIkcSEkyA+60HCREV+GyoGuIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ec31a7aa-8b34-4b95-af08-13f478951020@amd.com>
Date: Wed, 25 Jun 2025 18:24:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Content-Language: en-GB
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <deccb1566ced5fa64f6de5c988ab968b76dc945a.1750411205.git.hari.limaye@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <deccb1566ced5fa64f6de5c988ab968b76dc945a.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::24) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SJ2PR12MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d4f51bf-3941-477a-fd84-08ddb40d3112
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUs1cHJ1Vkc5SXk4aTIzamhmbFZxMytETm04NlN5cjVsZ1RMd2JpWHdKS21x?=
 =?utf-8?B?LzlDa1ZEZmw2aWV3RDB4Q0lZUHdwZHB0Z0FObytvamhjaTlBejlnUkJZTmU1?=
 =?utf-8?B?UkxZS1BtQjVSZDRLeEJiL1JheFJKYjFnbGpodnl4Z0VNbjJEZ3h0UG4vdEEy?=
 =?utf-8?B?SFVPNHF4VHFhbnVOVkM5a2ZIUEVSOFRjR01SQ1pnN29WaTBPMlBXZFM4VnM0?=
 =?utf-8?B?Z05kd1NobmVzQXdabkFydXJXTzNHY3g4SDBvejlmY2hEd0pLT0VoaEt6bzdu?=
 =?utf-8?B?bnNpRFpTQmdTWjNsMFBJUjgxemhTcjRKSWlVM2lISm40NXc0SlhzVUsyNDVY?=
 =?utf-8?B?TGord05hUmV4T1hJSWFSZ1Rma2l3ZVNkSzJLY3J5N3I2aEJ1T3hkdVNFZEJH?=
 =?utf-8?B?N2lrNVd5d3JxYnc2ZmN2WVl4aGtFZHhsRjJPQWlZdjFDaHl3RjdacWJQQ2hM?=
 =?utf-8?B?dVYyV1JML2NScWI3OHZYRmM5eW5QMFlWK2pBWk14WUE2MjU4MDJOYUVobENW?=
 =?utf-8?B?Wjk5Mml2RExxWktHSitadzNIM1h6MWc0L0xIYit4dk9BVWczQmtUU0dDejhz?=
 =?utf-8?B?aGZ0ZDNmTVpYMUdGM2pmZkpOZ0l2UmVLcjRVTFZYc1hRVERQMEVxbk5WUkpO?=
 =?utf-8?B?UzFlNTFqUTNVYVBkZ1dZZ0hnTmdEdHZPTWt2anFmU21COWN1UG1jR05BU1VK?=
 =?utf-8?B?QVgyUEdUQjZoWTgrRmhyaFVXTk1SbE9qeDVKaDQreHdVNVBZWWkvYjE1b1Zm?=
 =?utf-8?B?VUdreU1taE1kL1h3TGVzWVhwenNqQTdFUDc0bzViVVB4QXJXR3lkNklmd0FP?=
 =?utf-8?B?YVlIUmlzbXl6dzdwUG02SER5YXM5U1FBaHlKZ0tmTklMQTQyVmdORk9FdTZS?=
 =?utf-8?B?VFFlU0R6VXBaQnRSM3hMK2JtUkpsU3l2ODlzaGx1ZXpza0NURHBLY3VTUWZ4?=
 =?utf-8?B?cGtQbDZWVzdoVm9TRTBWV0JDSEVEVEg1U0k1TFIxa01KTElURTZhOUVCWFB0?=
 =?utf-8?B?MFFMZVRQazVUeGRQQXdwNmZpRFRSUWwwQVorbEVhRXgvb2p0c3lBUmE1Um9z?=
 =?utf-8?B?YUI1YXRZVDMyNjFRS2dWM3EwWk9pcERIYUJoVTV0SC9SSlFoVkJ3NGhMSk1I?=
 =?utf-8?B?RzQ3c205RllmN3FEVFRYMnpENzVoazREbE5najZyWWkvZVlLbEpBKzRndEda?=
 =?utf-8?B?UFNSSzhnV0xoYmwxbHBVa0cxaWMzcGk0YXhqTytjR2VaZkVXU1VtTDJrRWRU?=
 =?utf-8?B?eERXazJxNVJKdlRnY0RQR1Q4Qno2bFBORkdFNFFQY1lHMERPQXpWdk1GT3Rp?=
 =?utf-8?B?cEtsZDFFU1diK2Zyc1liTkpReC9TOUNiZDg1aDhFcWlBZjVET1BwdlAvRWdh?=
 =?utf-8?B?VytXK2tyUVlGYmZxVmlwMDJhRDVncndKSGcvNlRQTWxXbW9FV1FWOUx2aE5I?=
 =?utf-8?B?UW5JeFVtaUdGcHNZTEVGVUNMd2VzcE5wbDlDbndyRnlBaVJHenc1dkJpdWkz?=
 =?utf-8?B?SkFGb1c0VWNPQmZ4QjNOMDFHaDJIMzM1SGloWGZxTVNCWmdVd1kvYldBWEFa?=
 =?utf-8?B?dnBkQWNkLzVUN2RBQWJ2SUt0THVKeFdRWEcyOFY1aGl3YWxTbG90M3Q2TE95?=
 =?utf-8?B?N1p2UHoxVjRLdXhrbzQ4WWlQc0xDZVlveC9UZmgvY3V6ajZtNzJ4dTVINUJM?=
 =?utf-8?B?K0R4OVhHdVVtOVZ0RVdta01RNFlBRVUzbHpESU1wTWRaZFc0TFQyaTM4eVpY?=
 =?utf-8?B?VUlQMnZvKzVKcGdQeTdYb29zYzlMSW5MSnhTcFFIaGFoQ0hBUVpQVjhMd1ZJ?=
 =?utf-8?B?VFE0WUY5Zjc4YXQrNHRWMVNqK29QM2xxOWZuUHFIQTVuNFBXYit3eVA3dnRJ?=
 =?utf-8?B?QWRSekcxNkZMc2pvSkZKR09JVjNoRjQyNGVGV05WMWxvQWdOdGpRSE45ZHBj?=
 =?utf-8?Q?VJi5pidnMXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE94TTllVTN3cUJrK2tKNWlxWmRDT1NCc295VnE1aHBaRUt5VTlMVzJzVTVU?=
 =?utf-8?B?TCtqTThvUEZhbTVGeFUxcGoyTFRqbk53ZWNuTmNRQ210bk5iQVF6VEJzcDEz?=
 =?utf-8?B?RUlERXZCTkthWnVNSjA5UDFlUkRZTUpZZDF4bHQxcExwT3ltOWoybnNOQW1O?=
 =?utf-8?B?V1A0bGs3c3JuVDdPN285dlZ0RTdGQWZrbjlPalZYS2FsTVUrUlNQcWh5YUcv?=
 =?utf-8?B?QTAxZERUT2xlc2ptQThYVDdicmJJNWs0U0tubmpqNTM4dndqSHZ4d0IyZDZv?=
 =?utf-8?B?cExlSlNpUEJsb3oxZW5LNEVyTFpuOFo4dzAvVzU3clB3WkZlM3lHZ1hqUEQ0?=
 =?utf-8?B?ZHJDT1YrTDRXaDh0dTY3SEtKY0lacGdEWm8rTlFtTGczQ0hmWlM4VDZpWnRw?=
 =?utf-8?B?alJIMVdtQ0FmMlpPRHBYL0pkM085b2hBdmtyb0ptQW5YNDRNaFF3RHc3Q2dU?=
 =?utf-8?B?RCtpdWtsaEJtMlZ4TDZreUFzTHZRYyt1NWNtMDVTeVBrYk5MTkpjVGMwbjZi?=
 =?utf-8?B?RVhOTWc5elN5a3h3aFdPeTNUbnRGK2NFRWVacU5EcFA4U21kTThYdElWazVF?=
 =?utf-8?B?TXhpNGlMRWQzSzlua1NxMGRDT0hxL0l0eWNVbkZPSlhsU0tUakVTNk1KVkcv?=
 =?utf-8?B?SmQ5OExBV1gxR25QQ1pwUXFoWGhSWm5GRnlsSUFrUVZVaGpFQ0E4aVM0ZHNa?=
 =?utf-8?B?U2RMajRtQ085aUg3MVlZWjhqNE4vUWVTSFRxTHg5Ymw4d3AzNERIN2VZaVNa?=
 =?utf-8?B?TUNQNHVSYlZtTzhqQWJSUXRFQmlWWjdWR2U2UzZoNXJCWEtpWlVTK096OWJR?=
 =?utf-8?B?WGd5RS8vNWpjNHh3Q3hUQUswRGdmYU9tVFdHWERkejkxL3FBR1c2VGtvQlFK?=
 =?utf-8?B?OVNUM1V5eUswUHF4SCtRMW93NHNtME5iMldrdHRWRFhBTGhDSktick9mMVJy?=
 =?utf-8?B?cm5wdEFNTXBnbndYc1VnRjlLVWhCK0F0YjJkbVZYWXliZUJPL252RWJGcU94?=
 =?utf-8?B?M0NCWFVIQ1ZkL3c3aEFlcDNvb2pWOTUwVUZpbHRRdHhTSHRrY05hOG91c3Vz?=
 =?utf-8?B?RmZrWHV1b2JSbllzQ0tYd096Zmt1a3c3QlFXMEFUdHFHWGFPYUlCaStMRUtX?=
 =?utf-8?B?R1BtbVduUnR1SWVmRUhpSEhzczFVMTV2cCtnZWhjVEV2cFJoNG42WVFFeW9J?=
 =?utf-8?B?K1BwaHZhK3Z3aWVXSTBSb0lpZ2dSd2VCNDUybmI5TTMxL1N5YVNrN1hzUnph?=
 =?utf-8?B?RWExQkF3cEFNRDg1N3VNekNuMkFLdW01MDljRTN3cmduY0ExdXFQU1VkK25x?=
 =?utf-8?B?TWFhNnJWWVJWR052Z3N4eHRkR2FyZVZaS0N5WlJwcUYxTmhDRVRxQld4a2Yx?=
 =?utf-8?B?R29ubmtWbXBVZlk1T214dTdpd21wUHZwbTE2a3UybW16SHRWeGphQm9QN2JV?=
 =?utf-8?B?R0RIakZnYlNIS3ZiYk5aMk9lWXlWNWxGdWo0N252a3RJRnByYnl4K1BFR0tK?=
 =?utf-8?B?cVhCeWZLb1BYY0dTb1JhVEZpbVhBeFlXQnlkdWQvdnZIcUNZVkZsZkdabEg1?=
 =?utf-8?B?dTl6SWxYYTA3TzBhMVpXeWRWcDBxS3hLd083cUNVRmFZNUR0a1kzV01XOGMz?=
 =?utf-8?B?UXdYMzZPVnZXcjhBQTZFbFNpcGY5TExJcEF5WXpYU094YVNFSi93YWVQMFpW?=
 =?utf-8?B?OUpOOTVhZVo1Ri9tNmZMd05KcU5KQkd4MkU3U2oxUTdCRFBxYnBKeWdub2k5?=
 =?utf-8?B?dDlMQWZ5ZFFGNFRiNWZRUFF5Q3hjOGR2QTdVTEwyRXJhQlhWNnFlajVmMmFU?=
 =?utf-8?B?YUFPaGF5ZENQY1JlY3R4Slh3WnQ2djBVbWF3V3U5Z2lwK3Bjb0JtNHpNVm9h?=
 =?utf-8?B?RHJ2dWN0UktTRjZpaDA2czNzeTM2UGx4RGprd25janpkc3B0STF1Wm85azc1?=
 =?utf-8?B?UWtNUkJyZ2pKYnpwY095WGpBOGVKdU1uNVM0dXFUN3kxdUNhVitEUWlaenpk?=
 =?utf-8?B?R09UMHFneUFLZFR6UjRleVY0NGtUT2FUYUlDVXc3WHVyU3hmd3g5cG1VKzBF?=
 =?utf-8?B?blpiZGVMaDlHYXI1T3hRZnRnRFphTW9LNmZwQ2RESGdFOENhLzBlN2E4elg3?=
 =?utf-8?Q?OMcJ/uPErT1Fg9d2v5MIkiqF5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4f51bf-3941-477a-fd84-08ddb40d3112
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 17:24:51.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r97S+8icojzXf0WbjeH7TfV3aCK2CPxqA6l5K/EwkBSsPRTTw/YmYRyF5UzViwBigywB0NRaeXhozLZ3NVkqpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9242


On 20/06/2025 10:49, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Implement the function early_fdt_map(), which is responsible for mapping
> the Device Tree Blob in the early stages of the boot process, for MPU
> systems.
>
> We make use of the map_pages_to_xen() and destroy_xen_mappings() APIs.
> In particular the latter function is necessary in the case that the
> initial mapping of the fdt_header is insufficient to cover the entire
> DTB, as we must destroy and then remap the region due to the APIs no
> providing support for extending the size of an existing region.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> ---
>   xen/arch/arm/mpu/setup.c | 74 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 72 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
> index b4da77003f..ab00cb944b 100644
> --- a/xen/arch/arm/mpu/setup.c
> +++ b/xen/arch/arm/mpu/setup.c
> @@ -1,17 +1,87 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>
> +#include <xen/bootfdt.h>
>   #include <xen/bug.h>
>   #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>   #include <xen/mm.h>
> +#include <xen/pfn.h>
>   #include <xen/types.h>
>   #include <asm/setup.h>
>
> +static paddr_t __initdata mapped_fdt_paddr = INVALID_PADDR;
> +static paddr_t __initdata mapped_fdt_limit = INVALID_PADDR;
> +
>   void __init setup_pagetables(void) {}
>
>   void * __init early_fdt_map(paddr_t fdt_paddr)
>   {
> -    BUG_ON("unimplemented");
> -    return NULL;
> +    /* Map at least a page containing the DTB address, exclusive range */
> +    paddr_t base = round_pgdown(fdt_paddr);
> +    paddr_t limit = round_pgup(fdt_paddr + sizeof(struct fdt_header));
> +    unsigned int flags = PAGE_HYPERVISOR_RO;
> +    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
> +    int rc;
> +    unsigned long nr_mfns;
> +
> +    /*
> +     * Check whether the physical FDT address is set and meets the minimum
> +     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
> +     * least 8 bytes so that we always access the magic and size fields
> +     * of the FDT header after mapping the first chunk, double check if
> +     * that is indeed the case.
> +     */
> +    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> +    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> +        return NULL;
> +
> +    /* DTB starting at this address has already been mapped. */
> +    if ( mapped_fdt_paddr == fdt_paddr )
> +        return fdt_virt;
> +
> +    /*
> +     * DTB starting at a different address has been mapped, so destroy this
> +     * before continuing.
> +     */
> +    if ( mapped_fdt_paddr != INVALID_PADDR )
> +    {
> +        rc = destroy_xen_mappings(round_pgdown(mapped_fdt_paddr),
> +                                  mapped_fdt_limit);
> +        if ( rc )
> +            panic("Unable to unmap existing device-tree.\n");
> +    }
> +
> +    nr_mfns = (limit - base) >> PAGE_SHIFT;
> +
> +    rc = map_pages_to_xen(base, maddr_to_mfn(base), nr_mfns, flags);
> +    if ( rc )
> +        panic("Unable to map the device-tree.\n");
> +
> +    mapped_fdt_paddr = fdt_paddr;
> +    mapped_fdt_limit = limit;
> +
> +    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
> +        return NULL;
> +
> +    limit = round_pgup(fdt_paddr + fdt_totalsize(fdt_virt));
> +
> +    /* If the mapped range is not enough, map the rest of the DTB. */
> +    if ( limit > mapped_fdt_limit )
> +    {
> +        rc = destroy_xen_mappings(base, mapped_fdt_limit);
> +        if ( rc )
> +            panic("Unable to unmap the device-tree header.\n");
> +
> +        nr_mfns = (limit - base) >> PAGE_SHIFT;
> +
> +        rc = map_pages_to_xen(base, maddr_to_mfn(base), nr_mfns, flags);
> +        if ( rc )
> +            panic("Unable to map the device-tree.\n");
> +
> +        mapped_fdt_limit = limit;
> +    }
> +
> +    return fdt_virt;
>   }

LGTM

Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

>
>   /*
> --
> 2.34.1
>
>


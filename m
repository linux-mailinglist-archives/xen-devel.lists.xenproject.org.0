Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 888E9A9C871
	for <lists+xen-devel@lfdr.de>; Fri, 25 Apr 2025 14:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.967833.1357558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8HjA-0005Kl-1t; Fri, 25 Apr 2025 12:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 967833.1357558; Fri, 25 Apr 2025 12:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Hj9-0005Io-V8; Fri, 25 Apr 2025 12:00:19 +0000
Received: by outflank-mailman (input) for mailman id 967833;
 Fri, 25 Apr 2025 12:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m1g=XL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u8Hj8-0005IG-Fd
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 12:00:18 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f403:240a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9c00497-21cc-11f0-9eb3-5ba50f476ded;
 Fri, 25 Apr 2025 14:00:17 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH7PR12MB5879.namprd12.prod.outlook.com (2603:10b6:510:1d7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 12:00:13 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 12:00:11 +0000
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
X-Inumbo-ID: d9c00497-21cc-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/YAIJKndomkNmQVyyGOmqqEFxoslsK33key5wM2nk5mko2pG5C0dpLC53dopjpf1dfYFG+qnO+aRZGampK+jTNXMRBqNwuFkjbBt8gv8CRlWeQzmiAh5vTqu1bk52i6LTuJ3Aw4V7jI07jJJDsL5oX1ChOHSRkGei8+s2S+YpobmtdKj7QlobPljkVu3UjKbtz9FfTFzTyEnWYMTTJ+bSyVN8NomYuyrQwyGa4SJkPStOWss+M05sDvJV/h+Tz3OBdVhDrG+5Zgby+oirkkglZXI9QF51RDzTnYB1TEgpyRr9hpUAu1mgh+dJzGgp3vV6VxCgS4MGlaQPKLv816fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrklMbc9X+diIryfky2BmDAKkIiH0mOdbRI4w9TYwfY=;
 b=LA4kQ6NAm1lVA97N99xmnQpp9YRIFCsi10LrQ7+K1Zlk8e0g7Pko2MbrAMQ+AJRdRvtgntx5I15iYXj2DUERk7/aNE6UdOTQd9tTBwjGQME/g4vUkZpQr1UnvfS6EsTp1eKDpiuBXC09dwR3pj88xUrCMCJ0I2Uy7pmy6bkXRnQwZEhd+wR+ZwhB9cDSN/dN+be/X7eMixBOjggl/UgMB60fO/DeQiBzrr7hOEKFs0Qla99gLGhK1cGZkRVMxHbBFvxrz0wGPeyqeFcVbekZqv/K0Gl4/W/z4Z4GLiIeh/Ulf6P4tjMm/yq1fcfJGcyZeZHZMAqdpwmBh/E7y1o3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrklMbc9X+diIryfky2BmDAKkIiH0mOdbRI4w9TYwfY=;
 b=NiTQkhsuETjPh74E6j9wY0frImchDdFfkJFXvGsICE5opD3dZ6FObQ3964v+1LLz+P0duCjQZZ0/3EdcOlku2sHkdEM9zQjfFAqfUCDwk4HnuIGhh2fjfmGovP5G1BFoKfFKfxshgtm8Tew+Oz2P6Lli9TsqAiJgvWNvga6qD/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cebb0020-531f-467c-bc81-54d2ba1aa8e0@amd.com>
Date: Fri, 25 Apr 2025 13:00:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
 <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <306e5414-1552-4605-86d6-b23b89d00bc9@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH7PR12MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd5506a-fcf9-4814-fe74-08dd83f0bab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0haVEo4UTRMTHRsUXRBZ0tSZUptbjdVZDNlODlaWGNQdzR4aG95VHVzaExC?=
 =?utf-8?B?Tm9tTkdod1FFNW1ZK2FkbVpQbEs1KzRSMUFmZ21KRm10aGhIdklaMEI3SDlo?=
 =?utf-8?B?SkdFd3IyUnVrT2ZXN095ZHBJOW9lcld3YmZ0SEd0Z2h6Ni9xSGF2RWk4M0dJ?=
 =?utf-8?B?UkgvQm9DZm1GQktaVzF2c2hwQ2dLZWdCNzl6ZEtoRGxxTi9xYjdnTDRJQlpj?=
 =?utf-8?B?K21OL3JYOVVBS1BFQ0ZtaHREeHN5S3hOSmZGY3pCanZqa2RFcDNyQi9UcTdX?=
 =?utf-8?B?M1J0THZIblhJU25QeEpIalZWOHAvMW90UWUrM0ZaRmoxKzFPV0JUU3hsSWgv?=
 =?utf-8?B?VGNTOEV0TVU2cXM1VFZoOFV1Zk9YRlYzZDhCaUV6VWtPOVhNM2JGa0t4Vjh4?=
 =?utf-8?B?elp0RHN3d2tVME9oZ2gzV1RTQmMreWVUcHNGSTlqSjE0ZURlWWRGaHVwd0hw?=
 =?utf-8?B?WFIxd2J2NzFnUVNVZk1yTnkyRmd6bi9JRzdRQy9lUVljc2NKRXhCRFFsbFhp?=
 =?utf-8?B?cVhRWmZhaDdmeGhETzM2Mm52bm1KekRGTFU2TGN1eVA2NU1HdmllSzJnb1J1?=
 =?utf-8?B?WnVxeTU0OTFMVU1lLzh2ZHNTS3N1TG1zM3U2NEhWR2hEbG5GQm00TXNMNFVy?=
 =?utf-8?B?TmhhR25XNkh2WnFZVzF3NDRoN0Zadm9VaDVIelVmeUhzM2NsNnFlV2tUU0F3?=
 =?utf-8?B?L0hyMTkvMG9vVnY5T2ZleDkwZ2g1bVpHUGlyN1gzMVkyZk0wVkQ0MkppYndp?=
 =?utf-8?B?NURFOGR0cDZsbmFIMG9pbWY0Q0lHUnBrWHhWd0N5NlZzMUdEcXRnRmNpR0dy?=
 =?utf-8?B?OEJja3dkdU8wbm5YSFYxQkx4OE5ZWE5DNVllWEMwRVdiMldiYlQvZm5oaTUy?=
 =?utf-8?B?aWkwV3RDRXh4cXV3aENiSnVHc3FLV2V0andSUnpMZUVPVVBQSXNzdlordEF5?=
 =?utf-8?B?b3plMk5ob0VCS0phdzFwV1JOWjBYMkNMMTdnalFPOEg1YzkxdlNHdHM0emFW?=
 =?utf-8?B?Rit0eDg2eEVLc1pNY3BpbDhyMGZ5T09HRDZ6SndBS0F3cm1SWDNTTkQ1Nm01?=
 =?utf-8?B?elhrVFE3UUozTnU5SmxRVWovUmRJU3lQb2dQMS9kcitXSS95ckRYaldrcC9o?=
 =?utf-8?B?TStEWXRNMkFZMjBWVFplUm5nTlAzaTZubUQyclVwK0R6anlTUHhWb0JnYXdE?=
 =?utf-8?B?OUZOUVBaY2hrR3kvbkFRZEtFMHB2b2twMDN6UG4wMDV0MWs2MEY0cnl5dUs2?=
 =?utf-8?B?dTZZb3NUdEkrUUVYY0pabUlzN1Nnai9tNFFkRmFlN0VvZjVnenRWZGdUQ1RB?=
 =?utf-8?B?aUgwVHk1UnVKM1I4c1FJWEFFZ3FlZldoamFCbFNHbHg3SGtNV21nM1liTGIv?=
 =?utf-8?B?MHNaalFzejFjOHdoOW52OFJSS0lhVTlLc0VsZlRFc20vV09zdkVwT1R5dENx?=
 =?utf-8?B?MzZrejRIODlEM21kbkEyR1RXMHNKRmFKUnFPcEp1UHArRzVyaTZOQ2dTcGxm?=
 =?utf-8?B?cUcwMlR0dy95UzBPODYxa0hqZURQNjVxaEVxWWFnd2VBK0Ruc0pMTWpIQXFk?=
 =?utf-8?B?VTVkbjVYSDFMNHRGSlY3ZnpwVGRtbVQrNDZjUkFtYVNwNkt1bUxFZGdLUDBu?=
 =?utf-8?B?aS9LbnlwcUtpQlJmRERKRStpT2ppMzFTK2ppVTU3dmZ6QXdDeHk0Zy9NTnE5?=
 =?utf-8?B?NjRNMXpqMk1SdnlFbWpZWUNINlRUQlRyK0c3Qyttdmt1ZExGQ1ZWU0QyTzdt?=
 =?utf-8?B?K0pyWkMyejlieTRWRllHOGRyc0FSWHdaRm9nYTROOGM5a1hHTEtiMnpXWFBU?=
 =?utf-8?B?R2VkL3Q5b1BWV0VNeVdjVjhZdjVUeU5EY1lSRmRZQ0dubWRFMzQwT0pCREhY?=
 =?utf-8?B?NzJiLzNPaGJXQys5Z01WZWNNY1YwZGVCOG82b25SdXRGTTk2c3R6TnFaWXFR?=
 =?utf-8?Q?uVH9ghsQpBE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnJ2UEdUc05PMXFNM1RkRzFYdWYwckx6VkVJWFlRc0QrM1lzdUJxbVYvdEM0?=
 =?utf-8?B?aWpOSVREYVNGUGVOZ0dJbHhZMUNuUXZvY2VUTWVteVYxSkhOQlVnWXVvVWhB?=
 =?utf-8?B?eDVSWnlpTzBIWkgvamdwZE9rMmE3Y1NzaHBlTmVYU2ZKR0xRTXllY2dsUjJD?=
 =?utf-8?B?alRCNGV6eXlzdlJwZlBwSWZiY1BTOWdGenNWYXB0cWlhVjVEcU1KcGlPeFZp?=
 =?utf-8?B?MUNwYW5RVy83cTI5UThldnhuRm4wYm5JNGlEWnN6QW1ZazlUWXpnalV0aDcy?=
 =?utf-8?B?Wm5qT3VQU2NVQUVIdm95dFdOWm9ZY1NORnJXZEFGM0dUV1lWTGF1OWIrZUZW?=
 =?utf-8?B?ZmVwVTZFUmQvN211Q2NEUi80KzlCMUNENkVpa3YzV0MzRTZxam1WdWJzL3hK?=
 =?utf-8?B?SWMwYkpXQnNra0tETE4rRjRsaGFQeVJqdUlzcDBiRXQyOCtTTmI0MGpFdmIv?=
 =?utf-8?B?RVVkRXRxL3duL1NQb2kzMzBHdVROc3VSMTFOMHRXYTFCNW1FQjBKeGN5ME5O?=
 =?utf-8?B?ZERnRkdhWUdZWEVST202M1BidWhEdXFFUjE2dGNyS0xSbEcyV0xmdzEwM0Y0?=
 =?utf-8?B?SFFtcmJyREtVbkxQL1VzNkpueWFCeE80RDlDL08wVkliOWdTUnBtNXljOWgv?=
 =?utf-8?B?bThUUkFsc0d0T3l5SlJ1OXFqQlhDRXUrQXk3VWVCdnAxUW05SCtyekFhYTdF?=
 =?utf-8?B?ZHdzalBtbDd4ZkVKN1ZuUlJxa2pCb2k4NTJSSTg5ekF2YVB0WXFhNll3OXI5?=
 =?utf-8?B?a3hWVUhuZmxiRVo0dFlKeGkxZkpkdlJBN2xBVWpaVU9uOElPVHd2VlRyVTFS?=
 =?utf-8?B?VStnSlJPZXFjSmgwbEN0SUMzcHJCaXlJL09qYTRjNWdXSitybkhuNU9YOENr?=
 =?utf-8?B?ZEtvNE1pYklWQ0pNOUJHTGZLOXRpbFdxU3RybzEySjFCd0hNRkFlaUZJOEJ6?=
 =?utf-8?B?UVhCZEt6eTNLZSs3NHZtYlU3YXJKRkFkVmdSVFd3cFBvUGkwc0xlNXVieUFZ?=
 =?utf-8?B?ck5EdnNUd3RHSE5HNzcyeHI5TzVGVHY1MW1OMlVCMEtMV2pLZklENGhzOWpI?=
 =?utf-8?B?SVVsRG1id29LUGhWeGtIbUxWcjYxSmFxa1JDN2tuVnJtZUhTN25WQ29zdWI1?=
 =?utf-8?B?bHo1M1hyUWZ2NU9qbUZ0QjZEVFRPS0k4RlQ3MXhwMDYzU09kRmVMVitrQVBk?=
 =?utf-8?B?L0xQQlV6OHE3SjBTVUFwMzFMSWJWeC9TeWpIcFF1dTNGU2lRYnR1dlN6WWp5?=
 =?utf-8?B?Qmk1NnNvSGNrQ2s1UUJyKzNoQ01Ub2orY2VyQjJxeldQUXZaWC8ySUkyVFVD?=
 =?utf-8?B?RkNVSHh1U1JFbk1UR2FqWHNKRHdTQ3IzSjBoMnRqUUNBN0V0aHRNellKcVdy?=
 =?utf-8?B?dTRhbU5QVSsvSlVlcU9MU0pNYXJySE84eTh5Z3BPMmFBQUhCejhNd3YxZUJG?=
 =?utf-8?B?c3FNaWVpWFdyd292VVV0K1AvZjVNYlc0UFh4MmFraHhacC9HeTdxOVVhRlY1?=
 =?utf-8?B?N1ViRnl2ZDlESmlxWUNJVDJXb1lHZHc5MUdOZ1p3R2UxV3N5Znc2Z3Iyckx2?=
 =?utf-8?B?NndKcVJ4NFR4ckR4YzJvUG9iTU93eDMzNm5LajZDTWtIWmlFenNUSFBmS1kw?=
 =?utf-8?B?NkhHYk1TTDdENVBLR2JoWVo0eWh0UW5EaTJvSnpHNmFXOFN6eG5FRkh3SWty?=
 =?utf-8?B?NysyQkxtUmZQK1ZWbFBiOXZPNGlvMmRWK2NWd0IyaUxnM1cwNHlTTkwxblls?=
 =?utf-8?B?NndWc05DUDBIZlBsYzd4NGRlZzdOcWtOamN4TGEvTUROYkVrZzByaG9MRzFz?=
 =?utf-8?B?Zld3aDEvRC8xN25oemhjSFQ1ZVZ2Qm1jM0RuSTVmNDNsZ2RpTThwaDcwU0NQ?=
 =?utf-8?B?UDRpYkM4L1MvRC9SenlFVVlidnpqdUw4Rk1kTm1RRXV6TnlMZnVqRm1aYjU1?=
 =?utf-8?B?eFhBendoeElqeXhkMGFZSzZiU0xuZXlBNzExell6NjJubWdyek1VRVVxUTAy?=
 =?utf-8?B?UHYxVFFyVEs1eWlZMHFNbktDcXVxWEFrc2g1ZFo1Tk1EM0laYUFrQzI5S256?=
 =?utf-8?B?aUw0RUdtZ1ZmME9Md1N6ejFDWDIvb2RwYVJBRE5MNkJ6TFhTamJCQVhaTUtT?=
 =?utf-8?Q?OQMUKxaBLQ0vft14dn1UhO8E5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd5506a-fcf9-4814-fe74-08dd83f0bab7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 12:00:11.3766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ONVV/K76bvHL5VNid3kOCfKXqSd8feTXSEEUR7bkZP9qGzlzdUB07zhZO5wHIae6Vtw4wjjorzPM8CSmznNIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5879

Hi Julien,

cc-ed Luca for feedback on specific points.

On 18/04/2025 05:54, Julien Grall wrote:
> Hi Ayan,
>
> On 18/04/2025 00:55, Ayan Kumar Halder wrote:
>> Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
>> The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3 
>> HPRBAR<n>,
>> E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.
>>
>> Introduce pr_t typedef which is a structure having the prbar and 
>> prlar members,
>> each being structured as the registers of the AArch32-V8R architecture.
>> This is the arm32 equivalent of
>> "arm/mpu: Introduce MPU memory region map structure".
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> This patch should be applied after
>> "[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to 
>> enable
>> compilation for AArch32.
>>
>>   xen/arch/arm/include/asm/arm32/mpu.h  |  59 +++++++++++
>>   xen/arch/arm/include/asm/mpu.h        |   4 +
>>   xen/arch/arm/include/asm/mpu/cpregs.h | 135 ++++++++++++++++++++++++++
>>   3 files changed, 198 insertions(+)
>>   create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h
>>
>> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h 
>> b/xen/arch/arm/include/asm/arm32/mpu.h
>> new file mode 100644
>> index 0000000000..4aabd93479
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
>> @@ -0,0 +1,59 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
>> + */
>> +
>> +#ifndef __ARM_ARM32_MPU_H
>> +#define __ARM_ARM32_MPU_H
>> +
>> +#define XN_EL2_ENABLED  0x1
>
> I understand the define is introduced in Luca's patch, but this a bit 
> non-descriptive... Can we find a better name? Maybe by adding the name 
> of the register and some documentation?

We can rename this as PRBAR_EL2_XN if this sounds better (cc @Luca) in 
Luca's patch

The description can be

Refer ARM DDI 0568A.c  ID110520 , E2.2.2

HPRBAR [0:1] Execute Never

>
>> +
>> +#ifndef __ASSEMBLY__
>> +
>> +/* Hypervisor Protection Region Base Address Register */
>> +typedef union {
>> +    struct {
>> +        unsigned int xn:1;       /* Execute-Never */
>> +        unsigned int ap:2;       /* Acess Permission */
>> +        unsigned int sh:2;       /* Sharebility */
>> +        unsigned int res0:1;     /* Reserved as 0 */
>> +        unsigned int base:26;    /* Base Address */
>> +    } reg;
>> +    uint32_t bits;
>> +} prbar_t;
>> +
>> +/* Hypervisor Protection Region Limit Address Register */
>> +typedef union {
>> +    struct {
>> +        unsigned int en:1;     /* Region enable */
>> +        unsigned int ai:3;     /* Memory Attribute Index */
>> +        /*
>> +         * There is no actual ns bit in hardware. It is used here for
>> +         * compatibility with Armr64 code. Thus, we are reusing a 
>> res0 bit for ns.
>
> typo: Arm64.
Ack
>
>> +         */
>
> Hmmmm, this would mean someone may mistakenly set the bit to 0 by 
> mistake. If the field is always meant to be 0 on arm64, then I would 
> consider to name is res0 on arm64 with an explanation.
>
> This would make clear the bit is not supposed to have a value other 
> than 0.

On Arm64, ns == 0 as it can only support secure mode.

So we can change this on Arm64 as well :-

unsigned int res0:2; /* ns == 0 as only secure mode is supported */

@Luca to clarify

>
>> +        unsigned int ns:1;     /* Reserved 0 by hardware */
>> +        unsigned int res0:1;   /* Reserved 0 by hardware */
Then, we can change this on Arm32 as well.
>> +        unsigned int limit:26;  /* Limit Address */
>
> NIT: Can we align the comments?
Ack.
>
>> +    } reg;
>> +    uint32_t bits;
>> +} prlar_t;
>> +
>> +/* Protection Region */
>> +typedef struct {
>> +    prbar_t prbar;
>> +    prlar_t prlar;
>> +    uint64_t p2m_type;          /* Used to store p2m types. */
>> +} pr_t;
>
> This looks to be common with arm64. If so, I would prefer if the 
> structure is in a common header.

No, in arm64 this is

typedef struct {
      prbar_t prbar;
      prlar_t prlar;
} pr_t;

The reason being Arm64 uses unused bits (ie 'pad') to store the type.

>
>> +
>> +#endif /* __ASSEMBLY__ */
>> +
>> +#endif /* __ARM_ARM32_MPU_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/mpu.h 
>> b/xen/arch/arm/include/asm/mpu.h
>> index 77d0566f97..67127149c0 100644
>> --- a/xen/arch/arm/include/asm/mpu.h
>> +++ b/xen/arch/arm/include/asm/mpu.h
>> @@ -8,8 +8,12 @@
>>     #if defined(CONFIG_ARM_64)
>>   # include <asm/arm64/mpu.h>
>> +#elif defined(CONFIG_ARM_32)
>> +# include <asm/arm32/mpu.h>
>>   #endif
>>   +#define PRENR_MASK  GENMASK(31, 0)
>> +
>>   #define MPU_REGION_SHIFT  6
>>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>>   #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h 
>> b/xen/arch/arm/include/asm/mpu/cpregs.h
>> index d5cd0e04d5..7cf52aa09a 100644
>> --- a/xen/arch/arm/include/asm/mpu/cpregs.h
>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>> @@ -6,18 +6,153 @@
>>   /* CP15 CR0: MPU Type Register */
>>   #define HMPUIR          p15,4,c0,c0,4
>>   +/* CP15 CR6: Protection Region Enable Register */
>> +#define HPRENR          p15,4,c6,c1,1
>> +
>>   /* CP15 CR6: MPU Protection Region Base/Limit/Select Address 
>> Register */
>>   #define HPRSELR         p15,4,c6,c2,1
>>   #define HPRBAR          p15,4,c6,c3,0
>>   #define HPRLAR          p15,4,c6,c8,1
>>   +/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
>> +#define HPRBAR0         p15,4,c6,c8,0
>> +#define HPRLAR0         p15,4,c6,c8,1
>> +#define HPRBAR1         p15,4,c6,c8,4
>> +#define HPRLAR1         p15,4,c6,c8,5
>> +#define HPRBAR2         p15,4,c6,c9,0
>> +#define HPRLAR2         p15,4,c6,c9,1
>> +#define HPRBAR3         p15,4,c6,c9,4
>> +#define HPRLAR3         p15,4,c6,c9,5
>> +#define HPRBAR4         p15,4,c6,c10,0
>> +#define HPRLAR4         p15,4,c6,c10,1
>> +#define HPRBAR5         p15,4,c6,c10,4
>> +#define HPRLAR5         p15,4,c6,c10,5
>> +#define HPRBAR6         p15,4,c6,c11,0
>> +#define HPRLAR6         p15,4,c6,c11,1
>> +#define HPRBAR7         p15,4,c6,c11,4
>> +#define HPRLAR7         p15,4,c6,c11,5
>> +#define HPRBAR8         p15,4,c6,c12,0
>> +#define HPRLAR8         p15,4,c6,c12,1
>> +#define HPRBAR9         p15,4,c6,c12,4
>> +#define HPRLAR9         p15,4,c6,c12,5
>> +#define HPRBAR10        p15,4,c6,c13,0
>> +#define HPRLAR10        p15,4,c6,c13,1
>> +#define HPRBAR11        p15,4,c6,c13,4
>> +#define HPRLAR11        p15,4,c6,c13,5
>> +#define HPRBAR12        p15,4,c6,c14,0
>> +#define HPRLAR12        p15,4,c6,c14,1
>> +#define HPRBAR13        p15,4,c6,c14,4
>> +#define HPRLAR13        p15,4,c6,c14,5
>> +#define HPRBAR14        p15,4,c6,c15,0
>> +#define HPRLAR14        p15,4,c6,c15,1
>> +#define HPRBAR15        p15,4,c6,c15,4
>> +#define HPRLAR15        p15,4,c6,c15,5
>> +#define HPRBAR16        p15,5,c6,c8,0
>> +#define HPRLAR16        p15,5,c6,c8,1
>> +#define HPRBAR17        p15,5,c6,c8,4
>> +#define HPRLAR17        p15,5,c6,c8,5
>> +#define HPRBAR18        p15,5,c6,c9,0
>> +#define HPRLAR18        p15,5,c6,c9,1
>> +#define HPRBAR19        p15,5,c6,c9,4
>> +#define HPRLAR19        p15,5,c6,c9,5
>> +#define HPRBAR20        p15,5,c6,c10,0
>> +#define HPRLAR20        p15,5,c6,c10,1
>> +#define HPRBAR21        p15,5,c6,c10,4
>> +#define HPRLAR21        p15,5,c6,c10,5
>> +#define HPRBAR22        p15,5,c6,c11,0
>> +#define HPRLAR22        p15,5,c6,c11,1
>> +#define HPRBAR23        p15,5,c6,c11,4
>> +#define HPRLAR23        p15,5,c6,c11,5
>> +#define HPRBAR24        p15,5,c6,c12,0
>> +#define HPRLAR24        p15,5,c6,c12,1
>> +#define HPRBAR25        p15,5,c6,c12,4
>> +#define HPRLAR25        p15,5,c6,c12,5
>> +#define HPRBAR26        p15,5,c6,c13,0
>> +#define HPRLAR26        p15,5,c6,c13,1
>> +#define HPRBAR27        p15,5,c6,c13,4
>> +#define HPRLAR27        p15,5,c6,c13,5
>> +#define HPRBAR28        p15,5,c6,c14,0
>> +#define HPRLAR28        p15,5,c6,c14,1
>> +#define HPRBAR29        p15,5,c6,c14,4
>> +#define HPRLAR29        p15,5,c6,c14,5
>> +#define HPRBAR30        p15,5,c6,c15,0
>> +#define HPRLAR30        p15,5,c6,c15,1
>> +#define HPRBAR31        p15,5,c6,c15,4
>> +#define HPRLAR31        p15,5,c6,c15,5
>
> NIT: Is there any way we could generate the values using macros?
This looks tricky. So I will prefer to keep this as it is.
>
>> +
>>   /* Aliases of AArch64 names for use in common code */
>>   #ifdef CONFIG_ARM_32
>>   /* Alphabetically... */
>>   #define MPUIR_EL2       HMPUIR
>>   #define PRBAR_EL2       HPRBAR
>> +#define PRBAR0_EL2      HPRBAR0
>
> AFAIU, the alias will be mainly used in the macro generate
> the switch. Rather than open-coding all the PR*AR_EL2, can we
> provide two macros PR{B, L}AR_N that will be implemented as
> HPR{B,L}AR##n for arm32 and PR{B,L}AR##n for arm64?

Yes , we can have

#define PR{B,L}AR_EL2_(n)          HPR{B,L}AR##n for arm32

#define PR{B,L}AR_EL2_(n)          PR{B,L}AR##n##_EL2

I will send a v2 with these changes. Please have a look at that.

- Ayan

>
>>   #define PRSELR_EL2      HPRSELR
>> +
>>   #endif /* CONFIG_ARM_32 */
>>     #endif /* __ARM_MPU_CPREGS_H */
>
> Cheers,
>


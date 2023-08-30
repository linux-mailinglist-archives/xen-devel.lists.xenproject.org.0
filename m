Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2571478D47C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 11:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592794.925624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbH9q-0000q5-TL; Wed, 30 Aug 2023 09:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592794.925624; Wed, 30 Aug 2023 09:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbH9q-0000oP-QN; Wed, 30 Aug 2023 09:06:38 +0000
Received: by outflank-mailman (input) for mailman id 592794;
 Wed, 30 Aug 2023 09:06:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbH9p-0000oJ-C1
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 09:06:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe13::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85706301-4714-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 11:06:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9056.eurprd04.prod.outlook.com (2603:10a6:150:1f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 09:06:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 09:06:34 +0000
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
X-Inumbo-ID: 85706301-4714-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT5yUVbYdScfT8PTBOl5qx6VlcUQEsQBtuVIzPDSJmtoxiGiwVjKiERLzgkKOJOjdofYf8La5UftWfhi2TvLJVTTO1+tS0PTkTJfKo7VD4DfPgMNar+93fBdi2jTYzzDkXqxyUuLGbjQXAUg+YiYhIXENrxpS9r7p5bSkeC4r5+MWH9Lrm9zD2JXj2rg/v4EB2Xe8VC+OzlvpzWvqTyXFTTzmj45hAeeq1d4GFReNPmm4PmqcxU1j2ps4KKukLSdTpS5zSIyQWHE+przdm/7L9FrSzl9D9u1Z010twk2PSR3UNOpKxa213I4NwN57lgIQttYySvSWJ2xC3dKZqHpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9LJRpR2QIOSfC5C3oBzNjmcOF4DcpNj+MY0YrvSkc8=;
 b=CUDvei+k0m/jX1UW6jO8PF+GMtXhGKBoDu6PZ5hthA335lhTck3J23UsXImwt+wjpoaZc4v+H4c5JjIJ8qAii/AlAc7P0NBmsPfwqvR8v3oa4a+OKRGfOzq7XCBzlDhJWH91QGq5dXPLSQ4lw/Ws1eAFkKYer2xXCe4Q+hyXSMN6TtAmjttZNDnm0gAXgnFc9qPtPS//5TT7xu6NpcOGR8W6N7R5mXOcszuDDQTXI11Jfx40tuRu0rpn8ik1J1q/5U2eMz4NS4TRIsT5aC6zeGEA+g2ZGSNxeoY6Es+UQ3WCVGMeX9svC0apkAIvqjd0MVaz8Yr5Y5KqTgkFme8Oug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9LJRpR2QIOSfC5C3oBzNjmcOF4DcpNj+MY0YrvSkc8=;
 b=efE4AG0fd/KGMKdzAeJeeYirskp9PPzuM3SQhRamfyxwBodR63dqcsMa8h1Kbt1dGQGNdEtxYB2yUNmoK0OyXcq0dGvzonHnTuMS9eRT4EhIRM1Vuq/NB5XTEKWTPsp3Vu18913Pr7VD4z4ScOIFocTXRFtNxfXbeNdA5PhPEYD9GtqPsXI5FuCZpI3jOrgbY0XwAKEpQVqUyJLzpvjA3DFX3NxIVm9N9U4RARd1MBM3gJVVPlWnlK12Huq6p8u5sjhr8b8tkeYdT5903oWk/4o2NxAsKn3UNmBaVe0fMr7XAOQe2gbUF/ITRH/sywk+pOnToGthQoWUeRCvmX4ZWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9833439-c34d-791d-62ae-be0c23cecc59@suse.com>
Date: Wed, 30 Aug 2023 11:06:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: 4.17 backports
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <033f7255-9f9c-5ab8-3035-6b79084f9663@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <033f7255-9f9c-5ab8-3035-6b79084f9663@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf769dd-5107-4f12-013a-08dba9386843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jjHxnam3PGbVPIdJU1ZjuW1BWZiZ04fI/oeVimcImpdcfQfYkyhOslUPR/PxZ6U2fqnP4AilamCowEihprv5QibXNsDu+YdGQyLpSBNkV802k4wgBzN6+VTR3r0YstnV1YRXXZdMblFDpaSDjxSHKvbYCoDSUoC04CSGx4iXGOYScf0Ew1KiB0/RatqJhO3apOk3pPfxHksMax86P/+/sWotOZV3uqz4+j4cpbwWzzyHhFvlS1a9lKz5ZuEarUryPwRkq1z+DckLRm59RZf/YaDfSRURYn4EHhUGt3RX9NpVV9WQPKIb93NVXSN3df56CsvK2WCuA8piU9NvjYhWomJ8wyOIGJUu9m9ks6W1ojHM7nn3ED34MFj6sCPfB/PTpvn58iATZri7f9XlhkKr2GAtUb7vlPdJXeWLNNFR+ZMSpcUU6yEbedAYQwXnHIvACU71v0YcChuRJQTmwCt6Fb3bAqDeI2mvmEvN7N8WrurfpAnh0M7vfEN2lKTbXAK/xOaEMch9fDbHUk/qodIdsW/3193z9w+NcpEks9AMOy5yjTy/GrFaBoRengKfM9j/G10rkVUtK3RDW//XYKrkNtk9beQ1lpuExwCdsEFzufvt50wWtWELPCVRM3gPG2LPFwd5QfS7lJN1w09pKhh/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(366004)(39860400002)(1800799009)(186009)(451199024)(8936002)(6666004)(66946007)(31686004)(478600001)(53546011)(6506007)(66556008)(66476007)(54906003)(6486002)(316002)(38100700002)(41300700001)(6512007)(5660300002)(8676002)(26005)(36756003)(31696002)(83380400001)(2906002)(2616005)(6916009)(86362001)(7116003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVVNR25vTDJSN2hSU0YrNzl2ZHAxaG5TeFd4d0M5eTlRTWpsRkZ5V2t3djBk?=
 =?utf-8?B?cTF5LzB3ZnZtaEdoTzQxcGRSZU1UQ01Mb2VqNG9ESG5zRUYvLzVPRzlrbXZx?=
 =?utf-8?B?dk92V2VzUWJUaWprak5pQzBmOTVaVUJ0UWVEeEQ3a0VKQ0djdkVINWd5WGdi?=
 =?utf-8?B?QlpyUHk2NS9XVzQ0eXBJK1dqNFFOUXNZZlZpZTVSa0FPOCtPRGIzOU5SSDhn?=
 =?utf-8?B?OEdmWVEzS21KTzEzZVlOMS9TT0VIYmcyRkdIaGQ4Wm5qT0lndWdOOTJtWG1U?=
 =?utf-8?B?ckJBRHZXTm9YRitWUXFZVmlWczBhWkVOK0NXWmxWRHpJd3hCM0pOeHdIUUU1?=
 =?utf-8?B?OTVuWEpWVSt1MDNmWHYwcS80dEQ5Unh6Y05wUVp4YmZsVk9VMUZwZGx5MDNa?=
 =?utf-8?B?eTdLVVhJc1l5MlFhUVovbDBQdi8yeUFrOGZtdmo2RHZyVGp0aDJER2c0MU9X?=
 =?utf-8?B?KzVNT3hzTFdaZFJRaHJKbzJ2MHBrSlNodHhEL203TjBQVDNBWmNIRDY0VmVI?=
 =?utf-8?B?eS9PdFZER0ZLdUVmbEpHMkhuRXdYWHB0SGdCeWtwMDYvUEdTOTNmRHA5NWM2?=
 =?utf-8?B?M2pKT3F0bTB0UXVkY1Vqek1RMFlEU2FrK2RCdW5EZGUydDBiWnYvQzNTQkxj?=
 =?utf-8?B?YVl4TjhNOE9HT1IwNWNrMzFxUHRyWDhoVEdUNnh3TVZXQWViQ1NSbXBjOXIw?=
 =?utf-8?B?aWxiZzJEcjVZbHVsNVNGR3hHc3dLckVmQ0hxUEc1OEFPbVJqeVhORXdsTm9m?=
 =?utf-8?B?RGRwR2V0ZjhqYkcwN2VQTVRMa0loNkZOdkEvbDV0eHA1QjlqWnhZR01nL043?=
 =?utf-8?B?QmU2UHU4WGVUVkl3UGhJNGtZa0E1djBSaTJwTEZheU5QOHFsZGcyTTgvaWpa?=
 =?utf-8?B?SUhiVW9PYXlZbEdaOHkxOUhLOGtBOUFsdzlOaElrdzRENjJ4NGJHVlE4dWFH?=
 =?utf-8?B?eVcvVllsRnhyYXdVOVM4OEVUckF0OGNOZHpIQjRVV0hobXJIbmxGVm13S2x4?=
 =?utf-8?B?WmpYUm43eVdkbzBjUXh4WElXMUNMYXZLWWNnRm11MktCa0N1dFMzeXJzY21a?=
 =?utf-8?B?dW5JaG9mUm9KUGhPd0k1SFAyRVY1TEVaWG5GOWdORjJISG1MOGhlazBFaWIv?=
 =?utf-8?B?Y3VVU2ZSbGw5ZVFkSE5abFZMUkZKazF2N0JFc25QK1lkWnhjVlNUTmI0cFJ1?=
 =?utf-8?B?Q25VcldpU3l1Z0UxZzBxcjdERG5NaFB3VEdLZkR4WlozdmFQOCtGNmlIYXhZ?=
 =?utf-8?B?N2xFUVRHandSRlZJMEpBRU5vcUxFMlJCYUhObXlPMCtxSTVxN1lEeC92WXFG?=
 =?utf-8?B?K0tUMkFxWjNVTzJXeEd1RTZicDFTeUFXSGtEQ2pjcUYvTmVZclg3aGNWOHpG?=
 =?utf-8?B?L2YwSngzeks5WCt5RVBuUi9yRzI4ZmZsSCtQMEcwNW42d3Z4Nit4WGdrb2M3?=
 =?utf-8?B?Y0dQV3FjaFlEbGFMTzh3WnlVQmdyU09tTWJGRnZqdW4yNkl0UXd1OEJZZHo3?=
 =?utf-8?B?ZXVBTFRtb0grVk1PMzdKTGg3YXRnL1RSRHZpM1NleGtIN3NtVk81NndPSEIz?=
 =?utf-8?B?VGV3MHcyb1J3TTBOOW54dkNQZ1FZam9xQkZ3NEw5ZS9RVzR6N2RIRmxkUVZ4?=
 =?utf-8?B?Q2NVSXEzRGtpMVRjdHhCc1VpRG9LT2RweUpHNkZ3dkZRenFYcFdiWUZ0ZDVN?=
 =?utf-8?B?V1plVkdmb2pwUDV6cDNpRTFKdTl1UTk5TG5iNXFjT3ljUmoxZzk1ZVlLN0dV?=
 =?utf-8?B?K0lWQ3Q1Q3RNY0FqRXNxcVJOSk5WME1NaEdGYUY3SkxQWGpvdXdQa3hNSUlZ?=
 =?utf-8?B?ZU0ybzNmQWxsRDl4M3FRM0YrQTlQUVRQZVAwVTRET25HcTk0UzRxellSMTRB?=
 =?utf-8?B?L1M4emJYekptNzcwOU51RUFrQkc0Mkx4cnJkcFJBMUhrdS9ELzEzZnFmamNY?=
 =?utf-8?B?QkY1aldrZEErQ2FqZHNmeUx0NEUrTzZUVGpiMUc1aWVVTCtzVFI2cms0SzhG?=
 =?utf-8?B?SFhoaXBjcGZDWDRlNzZQT0txUUI1dWZJWlRmUVhoMHA5Q0VtYmxhS2VOWGsr?=
 =?utf-8?B?UjVWTjUrbzR4TzFBYTVZMGYydU10WmpiUUdWb2lsVFM5YjI0cldrYUg3eGFR?=
 =?utf-8?Q?5/YnE6iBPwipoXY+Pc3HFcKmR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf769dd-5107-4f12-013a-08dba9386843
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 09:06:34.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lLGJMuVI/2Np2zJOL7sm6QzQiVyc/gnfzM7ILqFlfi96C+eSdC8tBbyLCR5ff474NjD3ksUZYGpHmntEXD2/zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9056

On 22.08.2023 21:25, Andrew Cooper wrote:
> Looking at the patchqueue, the following should be considered for backport:
> 
> 19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future

I will admit I'm a little hesitant here, for being an ABI change (even
if to the better), but I guess I'll still include it.

> 0946068e7fae x86/head: check base address alignment
> eaa324bfebcf x86/trampoline: load the GDT located in the trampoline page

Reading its description again, this was done merely for consistency. It
doesn't read as if it fixed anything.

> aab4b38b5d77 xenalyze: Handle start-of-day ->RUNNING transitions
> c81b287e00b1 xenalyze: Basic TRC_HVM_EMUL handling

While the former of these two clearly is a bug fix, the latter looks to
be more like functionality addition. IOW I'm not convinced here.

> 813da5f0e73b x86/ioapic: sanitize IO-APIC pins before enabling lapic
> LVTERR/ESR
> cdc48cb5a74b x86/ioapic: add a raw field to RTE struct
> ef7995ed1bcd x86/ioapic: RTE modifications must use ioapic_write_entry
> a478b38c01b6 iommu/vtd: rename io_apic_read_remap_rte() local variable
> 3e033172b025 x86/iommu: pass full IO-APIC RTE for remapping table update

These I really merely didn't want to take right away. Now that they've
been there for a month, I'll include them.

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715DB29FF7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 13:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085936.1444186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxg1-0004gP-G6; Mon, 18 Aug 2025 11:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085936.1444186; Mon, 18 Aug 2025 11:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unxg1-0004eJ-Cr; Mon, 18 Aug 2025 11:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1085936;
 Mon, 18 Aug 2025 11:05:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vF/Q=26=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1unxfz-0004e7-JF
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 11:05:19 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39dcc57a-7c23-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 13:05:18 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7252.eurprd03.prod.outlook.com (2603:10a6:20b:261::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 11:05:16 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.9031.018; Mon, 18 Aug 2025
 11:05:16 +0000
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
X-Inumbo-ID: 39dcc57a-7c23-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rz3bvIhS8Yvdx9tiWGshNUjA5OKqHfEC5Zb4ec+gIA/I2+DHnWVgMqMyCOhWG6hFIP3tB/26zUXpI+cnNe6xAemNuGZ/nHk6fsDVWFEZbLGUxERlEurr2cnUhkgnN2XHWnDXQJ606mDj+juo+45LZHFopsyKWbp8ozusNgmHKvVZJPElnVH9EIL5EI3dYaywUtpyjYq3HKk0H39Ptqp3ZLpMbE3ElL867liZcEDerrqO+e9AOE9IdpFCDllkZ/wA2yrCzsWe7A9p/E+VZ3hPY1XWw3pMqYup26KQ8q6SXVIRmAp2E/xuMnS0meI2VCSw4qiy7rDK1jvUOLbTgwZURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEEVsKvUw3gYPGQzKfXXvO/h4+13vEHAuwYIS+sjKCY=;
 b=sgzrR2mBOadmpQCUEFwOzxThZRrJWpiLG4vCbZTsI01oy/SLUYnsN374dMUyh7558ezRHwPuw+pNZs32VF4V1MZmQuiB+74sO0rqD0RLzMHRtUMh6SZUlqYSvJQmZd47aBLXJXUDhwNMbRrGA1ZpqC9jNNPExtse/bg4T28HQzVJYK0NeuxGlwKRPP7V0wKOHiB+t2ySKJLQ4sGjY92yIPAZsEZFvUg+5Kaprn8roxNZT4e1rpvSpGOX6vjx8b/UwyuOxow8i6LX7Yvr7U8MFkeJFwfeHrZR5yel3KRmp3pbu6iAMTtsqHh0ypUFmQG3g+/kU+Qdt2Dtu59EViB20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEEVsKvUw3gYPGQzKfXXvO/h4+13vEHAuwYIS+sjKCY=;
 b=qh7C1Dsgr0NJoPDI+LuVum5LFnlzS04SrJoNsdUhyvHOhH2uK74Mfvj+CZnvNaonOJAP2Wgr3eLhGTsi7/DoQNdqQXbnddLv3kwRBdxySIB+Eak+jOFQqgfwmihiO83G7h7YmfKfxV+TFTyY5mqePAO74we3xe6UVYEn+KRX1cj9ORDnj+fMTG8ewFhGyMv7/tjJTA6G7CDfEuq2W4g9YkL1VlMN21drNSmYF8H2/yIaX807T2RRwfUZds2Dwsd53GhA2jQYxrBd8h9A/LTNWS2YdXlYUQNxkbl2BXhc65WKJYMcjBeeEIngULBaxXWhvDGYPQlRAEbzhvgoBgE2og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <49b552b5-8199-4fd6-bd9e-bdbbb9afe726@epam.com>
Date: Mon, 18 Aug 2025 14:05:13 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xsm/flask: add AVC pre-allocation boot parameter
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20250815102330.778749-1-Sergiy_Kibrik@epam.com>
 <de3fa546-1ef8-46f6-85e9-4902379bd435@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <de3fa546-1ef8-46f6-85e9-4902379bd435@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a05b965-8697-4f2f-d69a-08ddde471c23
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3BKNmI2SHFDNjJMaUgrZ3Y1QUIyWkdYWU5hNkRKVUFOcTk4UXJodmx2dTBB?=
 =?utf-8?B?RDNnbktsTUNkbFNNQzBPeWNFWEFZcEZXZVM0Mlk1T0p1c0ROcWRTZk5NV3Nw?=
 =?utf-8?B?SUY2bnhaWmlvSURFNUpCQ0d5bUxoMGRkdlNFZXR0M09vTFlrT0FuU3dUNXk3?=
 =?utf-8?B?SHQzWThOQXNXYXNFUWZSdFJOME1ocXJWMmlKNG9jdGJJUFc1cXRsNDRBcFZ1?=
 =?utf-8?B?dkxKd24wQm15cTFDRVk5WXNNbjM0R3hkRUJHZmNsR2kyMHJuaHJtQ1UyWGkv?=
 =?utf-8?B?VnJjemJxRkk5eSs4ZGJ2ZXdKV3lpSk9iMCtBVENzK0tRZ0FnZExuM0tlelBU?=
 =?utf-8?B?M0pkWU9RWGsvcVVCSkdlN2tkMUtuRTBIWGc5Sml2Z2J6Vlg5TWk3eDk0dWtZ?=
 =?utf-8?B?MDNJaUJ4cWF3NHhHYlZPbmVQa3F0SVBQRExGMEJud2xPZ1A2OTBQZzY4MnAz?=
 =?utf-8?B?WDEwYVk3YXR5bTB6TjV1c2cwSEZKNDZyUWQ5bkVLSlNmUnptOXRDeUhQVTZw?=
 =?utf-8?B?OTN4UEpWKzRqR2ZNZTdqZUcyTW84ekJsNXZoUnBnZUgzT3BCN0xRVElkc2Js?=
 =?utf-8?B?NUVRb1hENXE1aWNZQTNqMkZNMjR0SzBUcGRvcEF0MDRRNTc4WGtld1hIQ1Za?=
 =?utf-8?B?a0U2MzBVQ2ZuZzhuWVRhd1hWVlFIdzE0N1A0Nm5aMkRwOG9ERlRveWlTRGNT?=
 =?utf-8?B?Y2w3ZzNmMUs4cWV1aW5lZHp4QzNWdVFDR3ZlQm9KQmpvcnFqYlgwUDFLQ1pq?=
 =?utf-8?B?ZVZCM1VLTEFDMTNtN1B3UGxITXlIamZKRjIvZFhNSEt1dTVvYm9EaHkzRE8x?=
 =?utf-8?B?a3J2QWlZSEZ2bzVBdkZMV1hkQnRKZ2pjQnBqeGlYcDNYMW5DMFdMd0JjMEor?=
 =?utf-8?B?alU4TjA2NlR3bnZzWndReHo4L3BOZFprKzd6QVBlZEJabWhJaWU0ODJ4STVS?=
 =?utf-8?B?ZkxGMEVmUG9zRVJobjdyRlZPd1Q5c283VzBLV2sySXJsT1Qvek0yUGVmbG4z?=
 =?utf-8?B?YkxidE56UEVEOUxkdmRSSjhEYXk4RnRncjFiMXB3ZmNpamphTTNZbFpQLzds?=
 =?utf-8?B?YmFIOWFOM2EzbXJyclgvZ2Q2S3o0dFpaN3l0eitJcDBnR1hTZDdYYmNHclJv?=
 =?utf-8?B?VzBpVmFXamxBa3pyaDVDa0JMc05tTlQ1OTZWTUR2dUJYTFdoMWo5bkZxYmJG?=
 =?utf-8?B?SWh2bkRXSUc5elg5YVlyVWJmVTNXU0ovcHF1blExek93RjVSdTd3STIrVFd5?=
 =?utf-8?B?cmNRNHNTcU52WUhoYlVHdWUyTklaeHdXVmo5UU1sYmQzRHdFQkdGQUtyMnNB?=
 =?utf-8?B?d1JrMEZsSER1RG8zWmhHcklsVmZZMTlvT3dKd3prelFzcVRCZjJsZEdXNVUw?=
 =?utf-8?B?cVVSeU92K3JkQUI3LzJCZnVHcjIxSi93anozVEdtVEloa2syTmUzYVE3Q2t6?=
 =?utf-8?B?NTF5eWpMa3hvTGJmSDJXeE1ZK2k2MTI3NUtLZERIU2ljZTVBdUkrWkZKMG1a?=
 =?utf-8?B?MkxkT0VHQVJuNlNkVDFsUnJEZjFTSXNzdE5mMHVlc0hTcjhKZVVKTXhHdUdO?=
 =?utf-8?B?c080RWhxVnlhWXNQM0d3TjJBOFhhMzNQNXRKemhIN0twRnQ5cExBb25xU0JC?=
 =?utf-8?B?OWpka3BBU0JzZ0hpeElwcU1hTWVjaHlFUm5tUnE5SWgydis5WXhPdTZ6UDJu?=
 =?utf-8?B?Y0JuT3lsSFV4VWFzSldwamVqaTJNZFo2Y0tHUzQ3NHpIWTFsdFhERW9Jb1dn?=
 =?utf-8?B?K2RLWjhqaFErcjZuMjgwSWhFb3E4K1ZzcXFQbmQ4aEwwTTNDM0RvQ29kZ3F3?=
 =?utf-8?B?QWpqT053Z0FRT3E0bUhLeGJYeFVicStyT0oxOWVSRDE5RW1tandWUGhOZURL?=
 =?utf-8?B?eTRJcFIzZ05GVVJUMmcvcTFnQTBrdG9sWk9ZdWxnSDdIbkVBSFIxQ2NIM0No?=
 =?utf-8?Q?jiiKDxj+nbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zmt5U1ZSbytKZTNoOTFjN3lPSEZPcjY1c3JSd2JsN2ZpWHZDN3ZxaXprREdo?=
 =?utf-8?B?ZUszS2tUaUU5d01sRHBGQTRKRW55VzZGcm9nR2lFYUQ3ek1QYjJMNmdiV0N2?=
 =?utf-8?B?VVRtQ3owSzFkeTAzdzBHQUF6OURsYmFxZkZUSWRlR1NaTWJxZlVXOWFSeFJy?=
 =?utf-8?B?aDhrNmF0Q0EvcFpObkNEcEN5dnkzaTRQN0dhN3lDSFpWR0dHQ0xBWFhwb1or?=
 =?utf-8?B?ZmE0SW1SajRqUU92Z0l0WVc2UnMrV1dwNEFrcUoyVHZVNWNzNlpWSURBWWUy?=
 =?utf-8?B?a0tDUUJaU1FLQm1ybDc0eXpuTTVJZGx0VzBHb0NsN3hha2ZxcFNJclo3bUlV?=
 =?utf-8?B?bk9xZUdGVVdCSFlLd0NOdHBMVnFsQXREakRYRmlBNlRiUDI1TmxTOGdrd2E0?=
 =?utf-8?B?cEMxMDJSaDl3Y1lFY2R6amxQMFhvanNrNm90YThGdXA0THJSVTQ3aHVOaUsr?=
 =?utf-8?B?TEozSGlxTm1OSzE4SFRRaDYrVkZyR0VybEhVR1FOQjVWRTJaRUhUSTlPSkdu?=
 =?utf-8?B?eW9GTXIzNEFqNVFwODVRRHJZY1JjaStDR3dCS3Nrc2N2REVWOG1HNWZrd0t3?=
 =?utf-8?B?angzZ3lERjFhaU5HR3FJTTZFTGhWMVNnNjMwSVZ1VEhFaWhhZGFQTG01S25o?=
 =?utf-8?B?TGdlKzdCeWQxTHViVXdSSUV2bXpIWEpPYW00WjFNbjJmZVhpYXVwenp2ckl2?=
 =?utf-8?B?a0tsNzM5alVzM2Q4aFdzakFaMjQrVEdVay82VXBDNmZjMHcyajZwK3dOUGpj?=
 =?utf-8?B?NEFOVVZieVVDdzRNcE5XT2NIOUsrUGRReXRmOGg2QjZqbDlSYnM3a2xINFZr?=
 =?utf-8?B?T3Fmb2RMZ0NxK2F4ellmdXFGK2VSK3I3Q2YzMXVwRWpBaUN0RHRkaWtjZ0cv?=
 =?utf-8?B?cmt3T1hlSk1WcWtRN0FHWTBXUXJ4em9VczZlRTJIdlFyREg5dmFrbUJqdTQ3?=
 =?utf-8?B?TVk1M3ZEeHZ6M3VlaCsvSEwrWnRHaUZQRElveUUwenUwbjc3T1BxNUMyY2Uv?=
 =?utf-8?B?Z0RKemc3RHVGbUxoVkR5Nm1hbzZzL21NNGx0TVV1ejVKa291UW5GdzMxMGhM?=
 =?utf-8?B?WEw0eE52WFFlN3BudVJWU0cyUW8reVBZU2swUzhXenhoYlk2b1NaMlViQUZh?=
 =?utf-8?B?azc0MXkzSkVvVDBDMG9KeHhBRjNVdzR6UGFQUDEvc3RNbEJCZXNEc2dPOTlL?=
 =?utf-8?B?enV3aDJ1eFZHU2gra0kxTlp2QVdENFJVbGlBNnVkYWVheXBNSzljdzl5Q2hQ?=
 =?utf-8?B?OE9mazV2S3FSQXM2ZFhoM2xCamhSd09lMnF6SHRGMWw5bm9LT0UrV1N4N1R1?=
 =?utf-8?B?TzkvazRCZzJHbW5Henp5Y0ZWZ0VieHFCMHo4TXdSTmxqcVV1SUxMUFVRRS9a?=
 =?utf-8?B?ZnBpN2RXWGdMUkRaR04wSDdCN25MaTlGS0xtLzU3Y21CM3pzcWtzaXE5L21N?=
 =?utf-8?B?ajZZbUNhTHl4RlR3TWtNaGQxOTNOeDR2aTJPbEw2bHJHZlVqc04zUzZLWko3?=
 =?utf-8?B?a3Brd254Vm1zMWFmbCtveWNCYVNMSXdhZGN4YzVDT2VIR2VxVU9ZQVJCaGwx?=
 =?utf-8?B?RjVzaWVYa2NYQ2Fzb0d2R1h2TWFZUm02QVVBREd0RVBoN0ZCekR3K2VOUElE?=
 =?utf-8?B?OWFTd0pybGQvTWZLMmQ5RWhLNmdQWVNYb2VldjVhbTF1VVJ1REJXd3RaSDlL?=
 =?utf-8?B?empaTmczZzVEaUNvczVESk1xQ1hsVnVQWHBVcUhwMjI1TmhOY2Y3KzJIRElv?=
 =?utf-8?B?RlFOLzh0YzkycVQwUFU4a09UbGVqcm00NU04eVlPckVKN2xKd0VlUTl4L09N?=
 =?utf-8?B?QUN4OEVCN2IzL2JqQUdhV1hIQ3N6WVZEcDMvS1VTOUl5cWNUdEVDUlJOWDdl?=
 =?utf-8?B?R3g3OHpIOWNXRUMrTUhPdFhCamJXNTgyTHV6bXF0cmxEdHFoZWcwc0VFVjcw?=
 =?utf-8?B?aTBHREI1bG1ZeUIrdW45RlVpQTZLeTJBeUxmU0VUZzVmUFIvMzlheERsb3RC?=
 =?utf-8?B?VS8vWXlQYk5NQTVKOTFzTldYT2NYcnFheDV2akJEc2c5d2hiRG45NHpRbklE?=
 =?utf-8?B?cmhzaGpnYmh1Z1ZmWXczM243Tm1XZEIzblhza1VlY3pkUFA1NjRROWpLVmxV?=
 =?utf-8?Q?jZb0CVE1z+E2IruDBdAOP4hLS?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a05b965-8697-4f2f-d69a-08ddde471c23
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 11:05:15.9286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+W908g1HISAqSw9jPvBifMwWMMpYBTXCQ3lDY/9EE2eUnTD5fwMpEe/we/HdkJiNkMrNoiKg68EySR5mF647w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7252

15.08.25 15:20, Jan Beulich:
> On 15.08.2025 12:23, Sergiy Kibrik wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -238,6 +238,15 @@ loops for Queued Invalidation completions.**
>>   Specify a maximum amount of available memory, to which Xen will clamp
>>   the e820 table.
>>   
>> +### avc_prealloc
> 
> In addition to what Andrew said, please prefer dashes over underscores in new
> options.
> 
>> @@ -97,6 +99,9 @@ static struct avc_cache avc_cache;
>>   
>>   static DEFINE_RCU_READ_LOCK(avc_rcu_lock);
>>   
>> +bool __read_mostly opt_avc_prealloc = false;
> 
> __ro_after_init?
> 

sure, will do that. Thank you!

   -Sergiy


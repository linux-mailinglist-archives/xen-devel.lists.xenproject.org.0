Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C6554C551
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:02:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349851.576045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pqf-00065h-0l; Wed, 15 Jun 2022 10:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349851.576045; Wed, 15 Jun 2022 10:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Pqe-000634-Tu; Wed, 15 Jun 2022 10:02:04 +0000
Received: by outflank-mailman (input) for mailman id 349851;
 Wed, 15 Jun 2022 10:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Pqc-0005BP-SC
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:02:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 339a0e9e-ec92-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 12:02:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8981.eurprd04.prod.outlook.com (2603:10a6:10:2e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Wed, 15 Jun
 2022 10:02:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:02:01 +0000
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
X-Inumbo-ID: 339a0e9e-ec92-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kYp65T//nkR28kV3cdx87RQ7bQ3kDUJC7v2Sp4RRfTqwg0SHFOLtu5qy+qxufXkDrJWZZzvHuvHc3r1KBS+60rWN6TRu7YfteQ19ym/6HwXPBiXF3YyyBBVxzAwDfzIuDrZwrWu+dviuK42a3HNgrKitds67h7l+pqLgwpgw1NJ+FuPb+QIXPgX15ee+meZQyIrv848uQW9vmxA/Jj1IVQckMzUSN25uaXqq6D7faiPhIyFVBhfrAnMBHIHkPafgQ/2S2uPOx8R3PVpaR973qQBkLtRPr1ivol1yBlJW5xrPzlXDQZlewsvogQnp/jE5PuWCac2J0t4Hb3ZVHa38SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnM2uO5eniVgAzvSjds26CJAnOXmHdpe3X1nHICp8gU=;
 b=WI0THgEG0Q98BUvTsGKSt6F+PlMTn6S1JI0vubUKDg7NkJ+9bpaResBFss2OBzkBClX1U3gAX2Y6zJSqVsie0S7iruaUbBpR3Se3N0RKmHm0XhnRTqTP/AbB5rj/lUwpdkr3W7A87Rq/rlrSOiPxISOeGaHG/vIHkZco6YRXdkP92gBDn1pyQxygNTmigE1cMKxDAWlamk+reKzqaGPIPK2GEITHo7SBPg7SctoQ8SwHytnJBGIg2CHEUzexC88mNv2KXLVh0WIWzirTB/MX2GDaSp62ASt4hpkTR4g6aFOHm5d1W0t2H72YUfv3OkeUhXfwPt6bQewJw28JorDHCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnM2uO5eniVgAzvSjds26CJAnOXmHdpe3X1nHICp8gU=;
 b=uAQQzs3s2slgvcvap/SgB7PGQoBVL9FHXPmsoe+hwcTsauHqFuSFTuOzBouEnGQMK/xzR2+3IcwFUy7v1Oj9vgMsniIkavRMHqtGSJWF+vOssKlNJnQm+/pPPZmk7440fJjsEBqdV+PCD1fatwoHp7fkFsbD3stlT4Gw474Toen/x7F5pSVT6BUIl/MgD3iSLt1zmKNf6J/KYP3li9xdA6F1QdBcTd97ZkmRbzS7HjSrt4PfLQfTN1KOe9/cIu4uwSA2a8ImM2xID6fDkZtLNwxOWNZuRu4UkUw52aBLKVyYImEyKcY8os1CVxA4tOEJqU6ephF8YIVzXjWxdMiFWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <693131a0-4815-36c8-6fb8-cd28bb7b0a08@suse.com>
Date: Wed, 15 Jun 2022 12:01:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 8/8] x86emul: build with -Os
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42b24e1a-1280-4432-a402-08da4eb61748
X-MS-TrafficTypeDiagnostic: DU2PR04MB8981:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB898192A9A7FB4B9C89FC0583B3AD9@DU2PR04MB8981.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rz0ADYynevDn0g0PCvGN9re/1rq5njqdQaSRKflQ8lcglTDiU/wPURVY/FzGROsLIDwjfMi4Zb7mwSHiY8oj3+0QGV/xhvcZJx3rHHGeqhINw4SMF5ZwGiGk07LZH7BhRpu03kWH3GAoarwjpsMjKU7cA/rUgpqX5dZpxiggbBk4OcqCo1gKX36d57JCHPu4PuEN6a95TdgX5nk9B9wEdpM+rLiHxMWenrqRR/u90EuPl01bILqxdzBfOvqY3ms0xvDfjMpiwqqwmL1tH94BpIR41fEL6n0XaiSS84FOPc8tcTx+qF35qUEcLzJLQs7J0YGSWgIkmmqUPvhCip0WMnXoL8mo1gatp1qhJjO9C//1pdD0zdE6fZfNtvd2SBAMD6DzfQxWNT5A6wUsUq/Si6v+5+F14IryySXVJjZfPgUQR1RVzsyIf58DPai/4ug+5+HxX6qS9nFLvr4XmWYmSScBtLNDrSFsP79/iIqKeXd01KeIQWLD1lZ5xLqD+Y2WQdtFzZ+JW1B4m3gQcWijnlKxePWnaeZLLAzfX31AABUdmDhAYSrEwn4Diy053v5mrq+azlt/FHZ3orVgD3WHBvzmsRrHh25n9dLSmK65Rmt8umDpAEDssOXe5Pvtvyg+DQruu05Gujz4X+7tBWPHCGqYeTXXAkp3cGmc398GbdRI/KcYaTB6nPfbtAVRJqVFwiWABMCyHDqvlI9IDDc6Y+HlJ6YbCcAruL/pSXJLwbFlbUtHHIQaUXeHdYNAubiv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(6512007)(4326008)(26005)(54906003)(66556008)(36756003)(6506007)(316002)(186003)(31686004)(2906002)(4744005)(5660300002)(8676002)(31696002)(6916009)(86362001)(6486002)(66476007)(66946007)(508600001)(2616005)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkl0WGkyTjZSSXREZjhhd1lGb01KYXA1ditnMk9NZWM5ZXVOa0RWYjhNVmdP?=
 =?utf-8?B?RE9NMHZMSlNrbEE0RUZ1eGJJN09EVGU5Q2orVTkzbG8ySHRxR2k2Qkl6VlVF?=
 =?utf-8?B?UmxzZTV0L3oxYWVBMDVrcm12UWkvdEtNZUJ4ZDVsSU92Mk51K0pFcGRVcUMz?=
 =?utf-8?B?clhDN0pDN05Rc1ZkMC9xNG5wVlFnRVd0My9CS1JzYTRWV3NLMDlxSmVDRG43?=
 =?utf-8?B?Ylh5NnlnWWw5aU5lZ2piQWNGUHRPTmRrb3ppT042TnduSXFQZTJqOHQzU2Rt?=
 =?utf-8?B?eHZRMWFad1VUR25NbFYwSitkdGRHemlSYzUwMXArTC9Zc3QyZUFxTDBIRnFS?=
 =?utf-8?B?NkdrRERJM1M0dDRlbGhBVXkybkxoRC9zQkcwWENHL2tCcGJhSndMTGlpMmNW?=
 =?utf-8?B?SDZnMS9WZUl2MVFIQnZob1U5dG5NbllOaGc3c2szWHMxUEZZMWtLaVFBVHpF?=
 =?utf-8?B?UnhHa014L1NUUlRVbXYyck9kcUtudkxOYnhOejhubW9ERGxsczhKaFBwS2tm?=
 =?utf-8?B?UGVVSHlGZCtMYm9aTzFYeS9tY2I0d2NVa1ZEdzZTVUlBRjBsQW5mRVlOT3Vu?=
 =?utf-8?B?NEt2TVJVUEZ1dU1QOWlieXpHemw4SElacnF2amJkNTUvWC9HZmxUc2tVRkRN?=
 =?utf-8?B?MVRDb1FYWXZBOEdNd1lKcjZET05SUGlMQk03SGttMzhweG9HbGlPQTJDNU9i?=
 =?utf-8?B?RXhlVGNTeHZPeUxobXgyNThaVjdxTm9iYU5pbmJsbmFqRlpiYmQrS1dPMTVO?=
 =?utf-8?B?NCt2Vk9CRFJEYnBMd0dkS2ltUzBGU0JvNml3RmVYRHR0RzNWSUlPMnBYbzh3?=
 =?utf-8?B?dWYrYWU3dEVwVzFhL2RlS2ZjNURVanQ4SURJK1Znc2JKM1RKcW5aUk1TM1VJ?=
 =?utf-8?B?ZTFmMXA0L3IvbE4rN3FjUllhTkE1OThTWUsvK1JwYlJzL2ZtMTA3UVBRM0ND?=
 =?utf-8?B?SHNsaHFWRExlYktRZWZJNmdpMkhYcjdaWlRzM2I2Q05ablc1eGo2enh0K0RS?=
 =?utf-8?B?NVBJTHRVWW1UeS9OMVBQVjB4WDVHbXhDTFU1UGZwZ2pSU01WeU01YmNyTEJh?=
 =?utf-8?B?SEtaMXd4d2FHVVVSQ1pKakRGZ2hUUzVoSHluTHg3bnRXMGhUZnp2eXdJei9s?=
 =?utf-8?B?Y3FaZWtMclFtRWNEMVc3L0xidXlvRit3VnZBeW5TTWRFQ1RhQXlDUzZ6bjZ6?=
 =?utf-8?B?TEJWQjBDVWFvK2Jic21CeG82UlNQaE1IazEwZXBXcHRMNFdGT0lBMDdSN0lP?=
 =?utf-8?B?RFBKY1k3WDhRc0VMY21ZbC9QZGI4eWgzSHVCZ1JMWDF2Vjg0YnkxZGtFQ3BZ?=
 =?utf-8?B?dU5TR1ZNT1pPeCt2MEE1Ym11VEdXaFZRZWRRMjRDb3JSeEwyNndkMjdGK2tW?=
 =?utf-8?B?N29wdDhEdlo2YTZPeWkxQ0NkdW1kSjg3Zm9CTlk4VkpWSURtalY3Qk9DVkd5?=
 =?utf-8?B?eEh2V0Y2QWZVTkZ4eWhhaXhwWFB4c2lmVEdmc21QVmVYZFRwaTBGdnhiVThm?=
 =?utf-8?B?b2lBUWRhNHZ1MTlLVThkMFRoNHRLL0JXdjM2VlNhSlZib3NSRzRZbVhsVTl4?=
 =?utf-8?B?RWRoVnZQNlFSLzBUNFk3TUR4dHVBZ0RGUjVXbmZsd2JNM0dqWUZNQkdvOStR?=
 =?utf-8?B?RWxEQUJSU2JKRUp6Mm5TUFI0TXd6Q2VDaitCUmw2NWVObWxpQkRtaUxTNGZj?=
 =?utf-8?B?QXNic1NsakdWemxFTms5OVZrU3dtSlRFbWhEY2xMS2hITjZ0cTZoUENWMHRF?=
 =?utf-8?B?L2tVeEF0YUZCVkowUEVSR0hrQmtzbGtVZVQ0RXhyNkltTFMwa1lHVWc0V01I?=
 =?utf-8?B?emsyaHYrYWREMzZMRDh4ZFIwaEU5YXR6MnJLbkZDVEVmZjM1NjVZLzZOUkQz?=
 =?utf-8?B?MHVwbDJHVWM4TzJON2hHQUJWOFh0ZHI4SFNjR0FqUmpRWlRkUWNkWWg4T3FG?=
 =?utf-8?B?VkhiSHJzTkVPK0d0R1FoWXZPTTk2dkVGd256ZVEvNHRjV2hUR0RrWWN3bWd1?=
 =?utf-8?B?U0dPUElrY1YrVk1PUlphT1lxNVBMWXNSOWZWdjY0aXNRM3ZnUUh4dlVMamhP?=
 =?utf-8?B?SjNna3Z5QW1CZHJiZkpYak1WZDM3NWNJV05FTWJQRERvYzcyME81cEVESCtR?=
 =?utf-8?B?YlY4MmMvM0o1QTRDd3hERFhzQmRtNUFnaHlLZERQZDcrMTYrbytRTzRrcFFp?=
 =?utf-8?B?WXlJS1NPd1NVOW44akdrN1drQVVhYitNM2xlbXdnenZwZHZWMW81UVpQQ0V0?=
 =?utf-8?B?WGlNOHB0Ti9TR3VoSDJDdFdWaGhJSTlFRkRlSHVnOFVweU5tRFVvYitJeFlx?=
 =?utf-8?B?TEM1L2ZUL0dQNFdqSTA1UjA0eEtVUFJLWFZRZHM1SCtPU3RWUmwrZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42b24e1a-1280-4432-a402-08da4eb61748
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:02:00.9403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixKQZLz34b4bd7RXWZOdimII39DzlpjyNrhHB6M5Q96cz23El707pSj2K0yF+N28ZOyURSz6FEgJTc9jA2/p0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8981

Emulator code is large and involving it in guest operations cannot be
expected to be fast anyway. Help binary size as well as, for release
builds at least, compile time by building all involved code with size
optimization, independent of the build being a debug or a release one.

The size savings observed in a release build (with AMX and KeyLocker
code in place on top of what's upstream) are above 48k of .text, with
gcc 11.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -89,6 +89,7 @@ hostprogs-y += efi/mkreloc
 # Allows usercopy.c to include itself
 $(obj)/usercopy.o: CFLAGS-y += -iquote .
 
+$(obj)/x86_emulate.o: CFLAGS-y += -Os
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,3 +1,5 @@
+CFLAGS-y += -Os
+
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o



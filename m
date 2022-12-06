Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB26064451C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:57:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454897.712472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YRl-0006ZN-5D; Tue, 06 Dec 2022 13:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454897.712472; Tue, 06 Dec 2022 13:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YRl-0006Wk-2T; Tue, 06 Dec 2022 13:57:21 +0000
Received: by outflank-mailman (input) for mailman id 454897;
 Tue, 06 Dec 2022 13:57:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YRj-0006We-Sy
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:57:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc822b37-756d-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 14:57:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8670.eurprd04.prod.outlook.com (2603:10a6:102:21d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:57:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:57:17 +0000
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
X-Inumbo-ID: dc822b37-756d-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/pyHkZZIu4T3K+8/r8ATdkXsupm0H9aEMV2ikEKf3wTXcRzbIVLQsGmTJ+mnwUnF65cDePIkQSmn0ZWQ/sCFpCr1si2dSB2Q2rbA3qnD3ZPDTo4uPd57yoOD1NHqScEizEG21xlYQCzAg/4pQ7BK1za6ZjN5XVspRMjNTLWsyBFNs4HFKD+2nLh00rIbFxbOw03WlIICQzUGGEX7yNg9FrJnTxTwZ8SyRDA5d4aK93+IBDoTwWoiKj68GrjJjijpWdjGmm2/XfXAcMyZ3F7E/fMmZIq84oTMHP3X3hP3YV2Ka2l2RD6HkBM6/tFVUQDZ/5ZwDVOw+TXxkpPZiYsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8P+ZvvlWseJQ7rCEbvxjpP5fORRzmdqcqG4aQ2OAwuE=;
 b=JUEirW6I2jC3S9g3jYj7Ou9pNPy8R1U6MlSmy5RnWYbG+U9+Z0k9cQFgXeXwl0NAYSjFBj0f16g0RVS/1NEb0jWrBl34bgIoEaZV+2L8FCIyFFl+9nGiM+e4N4uCnicGs4II7yVGDaKVqkGIfz1KMkNOrnN7u6gJ/GFcnGVGMzypZVch3QZrPtdxOK/5aZ38V6uojyZ+hcBkaxuwj3kKS1t3VXLtVt3qrpvCF82t3+HbDqP8UgA4Z9Hyd5I9/doJh3kGv+IofgKDqOgADnSo90I4aoxudYD0GizbripIZPBUi/LcRdbMSPJjX7+mm/Zhb4K16KwU2VIvma1dHJyZyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8P+ZvvlWseJQ7rCEbvxjpP5fORRzmdqcqG4aQ2OAwuE=;
 b=tZZqIK2PdlwKp5Ik6UAudZBEhg5JTkqPNev939K0znnpzz00HMlYqs+cAw9ak7rdPrm3LabtZ9gBnSaXa/HVl5/Y0docGq6jG8eUY3aGD2egunQGoUUJyz7UqMRhL1S8lfTJPtnIZBXDumxYkD8aY3mTDEb/U4WEd5LmM3Qo8Ub5qU84LSeT5fPG0UBFprbRZSpHzdP04SqaVaWLNGwmDRZV7xqFCbbCOvvuqrMTU+ERvowf6EYNuqPIi9zVwFxW2yWQDMpPsd7qVRAkMQDzG0fIBZMPgkD8rGYmTD52LvyXRHOyv2teZWtq6hJSX41MnHVmAzZSf3o4ylFaardynQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <028fc34e-8a39-b0b5-34bb-2c96a82fa452@suse.com>
Date: Tue, 6 Dec 2022 14:57:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: [PATCH 5/5] x86/tboot: actually wipe contexts
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
In-Reply-To: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f977624-e6ab-40dd-6566-08dad791c913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8NO7GVKCIvj9aYXP+YKxIqqmeis+dFmLKUJYYX2/LVZyXx2c5IiPXinF8myi9fE91edbRJCJ6iBPnFsTaM7dlzQFKNe7t9sjFN4AmEARlCkM6UsRfzEbwxnv4Eo5uN/ytReX8F2uYpZiL8rI89Gc2eQdFMdSfjYr7vIAzpJPE0ZDsRnDGWRjJKy2p88eKjd53bofqztbih7Yo/Ji5u4Jjp4FBAwOJEw5GJ1uOVgpSFP5rE21RVlB8QdM1Sq6El3F3bRMtzI31E+EVouHRv2ihqcRg+2PQDEH3/ejz3qp8y01O0V734I0ghYiIwDpqyfsEQEn2w6JWiVJwwQw4bwpTcPwl8MzUV5H+mkbdUgyhJmAfUIAhIM/QsSbizfvtnSuDKRH2xwD5fp+b5QtEFcCnEBY3pZbPps6wCWglLX55IafS2Mt/TC6Amx+/Od9zMLPM3RytJ9kERmN/LBW8ZADv+hTY2gpD1tsNZpuT8ZqeDJl17f9oNVy4GEGLTExu21UmsbImZ2kB9S+MD8waY5K1J9won+y6JFNKjdg3f7obcBRJqYPbFkEMdo8qkGxPfWLZHnZTBAH52OXvil4QNx80bGEY9nBC/S8uL4+F7BvmKqhhljdya7q+HuqpKNUZ98ULZwi0tltJKVZknWi0MdMNmMtv5nJ5xblcIHuMf7qEbLUF06Kf9YkjI+/FVnCeqxfi2IeLJPgIsTpb72iAUruB9FKXLIrWPrzrrAsDulfbqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(36756003)(31686004)(38100700002)(5660300002)(86362001)(31696002)(8936002)(2906002)(4326008)(41300700001)(83380400001)(478600001)(66556008)(54906003)(6486002)(66476007)(6916009)(2616005)(316002)(66946007)(8676002)(186003)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmlGQWJ6ZTBQbUluZ1piMkN5ZnlrYVRJL0ZxNFJpTmRSZm1GTUtmTXpsbkIx?=
 =?utf-8?B?WDNMd25qSlA0VUZkeGlXK0lwNlB1NFA0MGFrVFBHV0xMaDhKZzl6SzNmRTcv?=
 =?utf-8?B?TWNzQnczREhYcWtCSVZiUnBzUXVab25mOWhET0szWktEY25POHRiOG1KOXNa?=
 =?utf-8?B?T2UyR3k0Vk1QWDU3YkJDUThlN0hOYm55Q0FMRnc4S3dHa0NyUzZJWnZPL29l?=
 =?utf-8?B?b3FLNjBaZUN2eS8wK3d2OS9tRXd3T0hNeklKOTRvWmpSVUZjTG91L3p3UmlC?=
 =?utf-8?B?c1RVN1h2eThKRzFtakgvNlgyQjRKYlhyVXNSSzd5RjFiUGtJT3BzMEJybmJ1?=
 =?utf-8?B?RzRmd0lYR3I5aHBQVWRVcHEwWGZkeHdRSU1jaGpoMUowWm1wMVZXcWg0dy9q?=
 =?utf-8?B?N3k2eWRmZVIxQ3RmNzA1UExlVHROeXY4ZzVNZmdMSmxjdkcwWWFWY29iV3dT?=
 =?utf-8?B?NDVOQitLOVQyeUtncCtTVjZzNDVYR2I2MHdKelN1cWgvSHhMcjhzSTZqZ05Y?=
 =?utf-8?B?U3Z3enJuMFhQL3pacWl5OGJtQWtOcS80SjRMRThJcVZhZm9tM3ZFQUZLaGx3?=
 =?utf-8?B?QmFJYnFrS0t4VWV4V3JTNW9xczNsVUlYYlBtcHZ5V3VYeC91VFVoQ1hvZFg5?=
 =?utf-8?B?bnBiV25GTEhqU2Q0S0k2YWpNRkVxMVdJUFRiY0h0bkdRMlhzK3RITjF5L0F4?=
 =?utf-8?B?VU1aQnVqaWZvQTc5V2xoWHVRMzRBc2s5ZTFGZDVqY3lkTzRUV21wcUhZaVRl?=
 =?utf-8?B?NERUWXF6NnA0WW1YQUh3bmY5ZFJDTCtnaS9aY2NTZ2pEZWJFOXd2Qi81ZWtx?=
 =?utf-8?B?eE84SWU5VDk5SzY3TzV5eHhIMTYyMmw5WkFlMGZVYk1FVzQ3RE8xTU9ya3lC?=
 =?utf-8?B?WmhMeVBCYkViV2lCM0gxd2VuNVk2cDJaN3B0LzNUVHQ1dnlDTmF1SnRZY1Rz?=
 =?utf-8?B?ZWhIeE84ODhUU0JSc2hNbnhPWW1IQnkrSjYyMFZWNGFYa1dBK0g0cXB3dU5S?=
 =?utf-8?B?NUl4MW44NEVHa3cwNzJ3SGUzblBrdTJuZG1YdGRUSWUzb05JaWVHN0ZXa0Jo?=
 =?utf-8?B?ekNaOWM3dDZmNHZDSGVJRE9pbmN0bk8zMmJ2ZHkxUUI2Yit0ditmM0NhemVX?=
 =?utf-8?B?MEVzTUVjQWdCVzFtbUxXYXBRS1AxREY2Tm1VK2EyQm5iM2lmN2h3UCsvV3dy?=
 =?utf-8?B?WmRVU2V1WlpURERYUnFXWUFsOXMrcXRUUWswZG9wZWNmMlhZY05vWHRHNnFE?=
 =?utf-8?B?bVdsRCsvMmIrQ1RBRkNVYUxWYndCb3hiTW1wUStpL2MvNEFQRUVGbUhtcU4y?=
 =?utf-8?B?cy9SejBKRFlyK1dQQTY3eVMyd2RTbTR0QTlrdXB0VThyTG9LblhSTVRaN0FS?=
 =?utf-8?B?aUs3R2dGRXN5c2hYSHFjK0JJcjNPa0VjZTJYMjVuVmx3UXM2cDRzNHpZNTNt?=
 =?utf-8?B?d01hR3hFWG9DdzVCamJLeVo5QlpZMEJqb01EN0N0Mk9NTU5XcGc3Z29kdDRU?=
 =?utf-8?B?enV6WGlzOU9Ia2RmZ1BMeTVBSitzKzhaREhINXA2cTFDRFQwSytiQnZPWEJX?=
 =?utf-8?B?S1M0amNrWDNkT1NjRkJUOVlHZHJ3Tjl6OHR6ODV3OHFQVkJqTnpHaXZRREZv?=
 =?utf-8?B?QklVKythOFZraFVBdFBQMXdFdjZNU2JBdmR2V1VFcEhvRkZINkRiZHRQOUNI?=
 =?utf-8?B?OG5YVS9UbXRRUkxwbzdyQnZmbWM2cXVCRHVkQjNLb0Z4azhSbTdWOEJtMmcw?=
 =?utf-8?B?eVFWenZZTGJwaE9XMER2b0M4N1ZOQi91TFpOVXZiYlhaMFBZazBISVZhRWsw?=
 =?utf-8?B?OVdZbExDZ0Nua0grMlo0NFAxRnlKT3ZEdWtQL0FaNHBhbnJhb3dkWXRsakd2?=
 =?utf-8?B?dkRHelo0SFBqeHFaWDZGK0Y2bUZubEhGaGFSekhFWmVJTzNGTk5mSU5DMitW?=
 =?utf-8?B?d3ZZWjFMelZxY2ppaU0vcXpnNDBGSHZJTDNsUnczY1libGkvSVNsa2VBcENp?=
 =?utf-8?B?Z3RkTTFLWnRrMk14STFBck5kenlXdGtlSVY2UUlBQm9kVmFKdVJCSFV5TkVk?=
 =?utf-8?B?ZDFLcGpaVWJsQmZ3RERWb2NKem42aHVUazV6emdHcE5Yblh5NFkrTjdpUjkr?=
 =?utf-8?Q?p6ZQCldUPTia7bFifT7g91PId?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f977624-e6ab-40dd-6566-08dad791c913
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:57:17.1161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1Ilni8cgFkT1XgRAqQlHiu6PphGos4Os2Tp4ZplSAenOb8Z6mIbSENak2nhMSOlMYZ2L4FuZjTpzOboa0lU8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8670

Especially with our use of __builtin_memset() to implement memset() the
compiler is free to eliminate instances when it can prove that the
affected object is dead. Introduce a small helper function accompanying
the memset() with a construct forcing the compiler to retain the
clearing of (stack) memory.

Fixes: c021c95498d9 ("x86: Replace our own specialised versions of memset and memcpy with")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Fixes: tag names the commit which broke the wrong assumption made by
6deab1ae316b ("txt: perform per-domain (and frametable and xenheap) MAC
on entry into").

--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -179,6 +179,17 @@ static void update_iommu_mac(vmac_ctx_t
 #define is_page_in_use(page) \
     (page_state_is(page, inuse) || page_state_is(page, offlining))
 
+/* Wipe ctx to ensure key is not left in memory. */
+static void wipe_ctx(vmac_ctx_t *ctx)
+{
+    memset(ctx, 0, sizeof(*ctx));
+    /*
+     * Make sure the compiler won't optimize out the memset(), for the local
+     * variable (at the call sites) going out of scope right afterwards.
+     */
+    asm volatile ( "" :: "m" (*ctx) );
+}
+
 static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
                                        vmac_t *mac)
 {
@@ -216,8 +227,7 @@ static void tboot_gen_domain_integrity(c
 
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 
-    /* wipe ctx to ensure key is not left in memory */
-    memset(&ctx, 0, sizeof(ctx));
+    wipe_ctx(&ctx);
 }
 
 /*
@@ -278,8 +288,7 @@ static void tboot_gen_xenheap_integrity(
     }
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 
-    /* wipe ctx to ensure key is not left in memory */
-    memset(&ctx, 0, sizeof(ctx));
+    wipe_ctx(&ctx);
 }
 
 static void tboot_gen_frametable_integrity(const uint8_t key[TB_KEY_SIZE],
@@ -307,8 +316,7 @@ static void tboot_gen_frametable_integri
 
     *mac = vmac(NULL, 0, nonce, NULL, &ctx);
 
-    /* wipe ctx to ensure key is not left in memory */
-    memset(&ctx, 0, sizeof(ctx));
+    wipe_ctx(&ctx);
 }
 
 void tboot_shutdown(uint32_t shutdown_type)



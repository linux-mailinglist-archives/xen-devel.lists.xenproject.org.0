Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94533A3EF8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 11:19:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140302.259272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrdJy-0001ym-5o; Fri, 11 Jun 2021 09:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140302.259272; Fri, 11 Jun 2021 09:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrdJy-0001wu-2Z; Fri, 11 Jun 2021 09:19:22 +0000
Received: by outflank-mailman (input) for mailman id 140302;
 Fri, 11 Jun 2021 09:19:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0bEB=LF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lrdJw-0001wl-Ao
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 09:19:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae846314-eb8d-48c1-9257-3b79dd6cd847;
 Fri, 11 Jun 2021 09:19:18 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-dJbJ-qPhMb2OlkGPv3_6_w-1; Fri, 11 Jun 2021 11:19:17 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7038.eurprd04.prod.outlook.com (2603:10a6:800:12d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:19:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 09:19:16 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:208:69::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 09:19:15 +0000
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
X-Inumbo-ID: ae846314-eb8d-48c1-9257-3b79dd6cd847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623403158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lKEcglE5r0lHaY0ElKUC9DDU4DNKyO6COr+pggkSwLY=;
	b=KuqnQfFDFIYgOMRiInt2LVQ9LeGdgdigeLiBJ6jcaS+ZNC96PSP9nXbxFKO2la121dUTgR
	biRxiZKBHfzrivwOcUl4/ayIEA9Ae2sCHjTAF8LF3JLJRPBmC+WhsvkG0pHoWGVGbkkUpt
	/Rma/hxBGGQ4YNBpNxnG7VDes9ril/U=
X-MC-Unique: dJbJ-qPhMb2OlkGPv3_6_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJsn829xi1UVDXQxOw/Tt+q334wIwpT49Z/GBnklr2FwoMVjNi6iOZ2SbvTUBbakZZ2rkm3q/juC5Kd1Dl68C8d9rX2AHv8ZXdkgZuqlB9evPEvsDyiIimKrZQeUus/204SefofXk9nwI6IDS33O8AewFRg0m7kxJiHBHD9ZZubUts8kt6g2pXDZAam7v0jf23uEb0cKGBXcAI5AvrFNp20BMr9XoJ2AeeaklQeRlK0vM3nC1t1mZnCIQl/E6qcPWcMv8a27ZTGx32Qf876d9rbLSO/hShVu+sLz1eQH7trARAHt6zPEUQ3rzv3YYLnXoCi8GaZa1HJOCdSjv/IKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKEcglE5r0lHaY0ElKUC9DDU4DNKyO6COr+pggkSwLY=;
 b=CT1OPRtdzhQp8B1YjYqkJDD64Xg/3JDuVW1sPXFDrxISkqK9tj4Th0PToyIukZDWU3j8uQDsnPqdT/kMEWHc66pKfkLmyLf4YWaumqwCxetyT3dR+cDMpfU3Op4L2BoyAemCyUoMCQyUBAsmII0kcO6s2y0F1tftBj+C1c2KE5YKbs2BTbgVQoommYWqrC4QMKfJuiICW0YmJHhxvEZUxUyfsg+G+CYJcJIc2zF/uy8QU2Y+kxSwvSXZ+i0UdeIxTJUb2CbbKEhOV70raeHsDigaD73uH5WWtPSLoRZH951SZcP/6r/pjEJWtTofC/Or8UjM9AFDYK7AnKRzcZ/0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm32: avoid .rodata to be marked as executable
Message-ID: <25f1b0d2-9270-ba42-d110-2bf14e45b7b8@suse.com>
Date: Fri, 11 Jun 2021 11:19:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR03CA0095.eurprd03.prod.outlook.com
 (2603:10a6:208:69::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93388112-e2f9-4630-ea58-08d92cb9fc1d
X-MS-TrafficTypeDiagnostic: VI1PR04MB7038:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB703856A02732033C1F0EB435B3349@VI1PR04MB7038.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3fCoz44NxDb+famBbKn6BPpB1jBH7aENDa28crRfuw6gwDMjyEE7fwUqOPw0d7Ty7YDmPbQFoyxFJQigRjoklO+TG9zxHIv0XOZ+dQzzQGycBmC6vMCTjB0auIxuGeZ606GhYfUXDUy01y0FnEsRUr6+8uFvVeSP8KxKKDy2VyiKdcr/p5aeX7ZNc5OmvXx1lqiDYCxc7BoKD+m2qOsvEH5V2wX6ZHUkZBMxvlTihOHO1oIFKdfbccOVYfIgYr9JofM+5WJDCG+dzqx7IGw338OLVfaJ8xMdbfonOPU7lvGryYi6lSzO93ACch45yiO2biIZcjxnX/z21OO7M+sZ58BPACcBE/8xlJr3X7K41iyaQaqldAmraYOjOf6zP5gG79ZhMU87/Mcu6byt8Mof6BQMAP9ugFZ8c/tdcr9NPlEefRctXFkbQNAr1prhKBgxsn+RBEVJ1cWBnCHd+0Wb9vffytfftv16Q1YgcfLIhleVhw/43fWdSOLqSBhnQVPWP08tIQIiyP42/SVX0SBlKPw6hr4nExukiCTK9yy/vMjT8oDELeaEhqTgBMdnCcfIxaos5nXqVIq88EZZLqgD9kLO6/MYVTwFvKZvsMF28+7qjkjaweZsQSOXD2mbLP+naYMlSCFPeUKZzDEb7Ed6ZrO7PlEBZG18z0lv5QbP8Cao+Nf41slyhAE1eG3o4hC2OVkoQ08zZjYWt+neRXh5HQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(136003)(39850400004)(396003)(16576012)(316002)(31686004)(956004)(4326008)(6486002)(478600001)(66946007)(86362001)(66556008)(66476007)(38100700002)(36756003)(186003)(16526019)(6916009)(26005)(2906002)(8676002)(5660300002)(83380400001)(8936002)(54906003)(31696002)(2616005)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5xY3U4WFp1SjdXZ3dURjJ1U1R2SXEydVpCKyt1dEh2eks3VlF0QWdnMXdl?=
 =?utf-8?B?RmpISVY4T1lWNS8yZ0ttY0lxSng1MUkvc2FkaG9mcU9WUEorZUsyWFdQK1Fu?=
 =?utf-8?B?OHoyUHgramlwemw2UEp2L3dlejZGL3ZoYWdqTFJYMTJHRjdvemhES1htRmpS?=
 =?utf-8?B?NkMxSUhpMHB5NitJMGxuZ1NLeEYvc3M5MUtJekdWTFIxNmtlWEFkTE5ZNGdV?=
 =?utf-8?B?QUVGV2RPSk5GTWJ4NU1sZ3pYZnZkblF6N2xwV2h0K0xnSjIrcEdXOFQ2eHU0?=
 =?utf-8?B?M3BjRjBNRHdRa1dZZWhnMG5CQkRZdS9UaGFPR3l1NWE1WFFYZ09GZ0tuMzZY?=
 =?utf-8?B?TDBuWVY2YVhFRUFsQ2ZDbG1HMUFTUVBjRDFKYS9XZkV1dlloU1hTSFlCajZq?=
 =?utf-8?B?cHhkS2tTSU1WdTFsU05iVE1sWmpiYUlXaWl5djZpcE55U0FKblQ0NytWTm1M?=
 =?utf-8?B?dFRDQTlXci9OQk95WjFueVdBYTUyQndoc1N3Wm96VVNBMnAvQkpSV2NRbDdx?=
 =?utf-8?B?RVEvWjc0MUpodVhOMThtbmplMm13dlB4enFHQy9XTFg0WVJJV3dNQW01K0tW?=
 =?utf-8?B?dm1EZEU5TXZKZVVMVEFWRDh0dW9PUi9XbktxRCswaFlFLzR4VkVvaXN0dm16?=
 =?utf-8?B?MVJ2eHZjUCt6TEl4Rmh0c1BuSU9mNm0rem9MbUszRU9CelQ2QTdvMjRaOGhK?=
 =?utf-8?B?eVlva2RIalYyYmx4WWExdC9LSHMyblZuZUF2dnhUcVpDMHlINzhuVld0cTlu?=
 =?utf-8?B?RHdPOExNbVpuTlBDWnFZTVFENHhVcUZnaHd4dHNWN096TjdKUkZHUjVvREJI?=
 =?utf-8?B?QU1TcmZJamk4MVJwRE01RzBxbnE5ZkMvVGgyc29vaEJYYXpXcmxmVEI4dDdh?=
 =?utf-8?B?LzA3cEs2ZjFWdGtreGgzcnBINE55OEx1TGRXOVZzNHorR09rY002aklQY000?=
 =?utf-8?B?WTIwUDJlQ0xGMFRxY3RZbXZSWW1acXE4Yi9aaGpxYytYMkczOWVTV0V3N2JD?=
 =?utf-8?B?VENMK3VuaE4xTnpwYlBQK0RPS0x1Y1RVaWN2WTV3TTFwWUIwS3VoSk5UY2h5?=
 =?utf-8?B?RVQwL09pcGRJdFFOK2w1TFEvb1EyNXdsUkVaT2dibkdtZ1pJaiszY3FUSy95?=
 =?utf-8?B?S0V3em1oa0tRejFWM2J3R2oxQ0Q2NzVOM1Q1cHp6QUJHQ0xFT2lJLzZ3bWFm?=
 =?utf-8?B?eG1tR3BlN3lhRGpUVXhieFVrc21GaDNNSWVKQVlkOGpvZ0ZtV0hSUTArS1BL?=
 =?utf-8?B?blRMbnJjL21GaHV5SmoyQTVWc3lna2p4TVRkNjd5eEFOQlBLSE9QZ0R4WTlZ?=
 =?utf-8?B?c1BOZ0RRM2tZakpFb09NckFCbFQzdE1DRDQ4TnpMNnR0WVZPZVNXQ3kyb2dR?=
 =?utf-8?B?bStnbExITXAxUjR2L21NYjNHR3FKUkJaRlI2WnFiN2l6czJrUjZrcnE4ZWhL?=
 =?utf-8?B?QjljQmt3M0Y0UDZZYVQvZ1dNOWtERUZaMWJWTWV6S0ptdENHQk1HcEdZNGlI?=
 =?utf-8?B?WVdMNGpJL01oaEx6dU9Ba0x6THdwMEtwT1FCTG5WQmt6WUk2RnNTTEZyajNq?=
 =?utf-8?B?SllPR0c0aDZra0tWd0JwanFGTyt2NStGNUdXY2RBOE16b3dnSmJLSkx5cDhX?=
 =?utf-8?B?Zmpla1VrNzFMNEloSjY4aWVZZlNRSzRmRGN3NVBXWldFKzlzZmFqcDlFWFFR?=
 =?utf-8?B?TXVlOEFBbHF0WWdycEFoR2g1N0tKOHdhczkvL2g2STJtWnRuZ2V1MDAzQVJM?=
 =?utf-8?Q?/FMvZYcHA8g5KqareEW4w7cQ5cAw44JwoQB6sPe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93388112-e2f9-4630-ea58-08d92cb9fc1d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:19:16.2225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2v05AwhOLPLro/NWMGvkXFwm2Gy9VvtGwkDQuC863dpb2sUYS7+zaX8IyjyWC8NDC+Mc+BAbR0C7rzJi17HQHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7038

This confuses disassemblers, at the very least. When this data still
lived in .init.*, this probably didn't matter much, albeit the
"#execinstr" would have been suspicious to me already then. But the
latest with their movement to .rodata these attributes should have been
dropped.

Fixes: 9cbe093b7b84 ("xen/arm: link: Link proc_info_list in .rodata instead of .init.data")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The PRINT() macro in head.S is another source of such confusion of code
vs data. While in head.o there are mapping symbols guiding disassemblers,
these mapping symbols are gone when looking at xen-syms. But I realize
adr's reach is too limited to allow for a halfway reasonable approach of
moving those strings (e.g. to, at least, have them all together).

--- a/xen/arch/arm/arm32/proc-v7.S
+++ b/xen/arch/arm/arm32/proc-v7.S
@@ -29,7 +29,7 @@ brahma15mp_init:
         mcr   CP32(r0, ACTLR)
         mov   pc, lr
 
-        .section ".proc.info", #alloc, #execinstr
+        .section ".proc.info", #alloc
         .type __v7_ca15mp_proc_info, #object
 __v7_ca15mp_proc_info:
         .long 0x410FC0F0             /* Cortex-A15 */
@@ -38,7 +38,7 @@ __v7_ca15mp_proc_info:
         .long caxx_processor
         .size __v7_ca15mp_proc_info, . - __v7_ca15mp_proc_info
 
-        .section ".proc.info", #alloc, #execinstr
+        .section ".proc.info", #alloc
         .type __v7_ca7mp_proc_info, #object
 __v7_ca7mp_proc_info:
         .long 0x410FC070             /* Cortex-A7 */
@@ -47,7 +47,7 @@ __v7_ca7mp_proc_info:
         .long caxx_processor
         .size __v7_ca7mp_proc_info, . - __v7_ca7mp_proc_info
 
-        .section ".proc.info", #alloc, #execinstr
+        .section ".proc.info", #alloc
         .type __v7_brahma15mp_proc_info, #object
 __v7_brahma15mp_proc_info:
         .long 0x420F00F0             /* Broadcom Brahma-B15 */



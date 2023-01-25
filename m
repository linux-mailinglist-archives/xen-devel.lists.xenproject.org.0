Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9849B67B5D9
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 16:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484425.751000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhfi-00014T-Sn; Wed, 25 Jan 2023 15:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484425.751000; Wed, 25 Jan 2023 15:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKhfi-00012v-Pq; Wed, 25 Jan 2023 15:26:46 +0000
Received: by outflank-mailman (input) for mailman id 484425;
 Wed, 25 Jan 2023 15:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKhfg-0008PB-Qd
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 15:26:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2085.outbound.protection.outlook.com [40.107.14.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab9f44a7-9cc4-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 16:26:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 15:26:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 15:26:41 +0000
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
X-Inumbo-ID: ab9f44a7-9cc4-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CR/jY9DYtV8ZcBFm/SD/ViDqcDsMptrfwccZHAQWBZCpYuRjAxSv0vkuvgL1uJNnhjHstGyBi9LceuD4Tv8XxvXUUKZD7zUrdQ52AwfDhwVBJU/eCj+JWVJbYmU0k7f4JCmrPF1JH+BwG808c1DgBZmfQjJA3Dv+032qgfu2LRez8Ok6sCfsBoJo2TzFPiLlvlVGpkgggJGjwQrN4QcZxlL0iOcKXcH0iNAyAQmC4dFsOWG+T+HUKaEZUgNe7buVyUfQrb4p69lIwqPMhfoItl5r1AMphu89VFsuN8Pz/uNwhnFeKhRGPMRfOj1gvcOk+5W2sAe1mvLmfI3tchFcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxE8sU+0fw6taHSR/FfhMJ8LA+rLgHnMSqhdgo6D/y0=;
 b=giwGbcvOEsP2fp7R1guOV+dUq0VrCVqUBCkTf91MDVxrS192ASZHBDqRnb4Gu08Y3tpvtsCOjysy02slsRrKoT4Vd4b3z5NM4qF/QdQsEFf/cS3grbXJasA2zphyj6XBM8H1FqnEpzUCAZqWgoj8uQQb7Ep5SJR1o3UZjmPYOYjzxPcvKbUMueFAKCE+emdRmJXPVexdYPJf9AAAjY9hi1uNL+IOHTaABmO8bt3FygzLoTE0TekbProFWCJP3KuQWIMc5aJzsET3Cdpm+ZZ8E0CBCLKvdSFMBqnwzy4b7b4ANAu4QQE7jLRY7Q0drFqL/vjzuHuVdrcJKhfBaFVBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxE8sU+0fw6taHSR/FfhMJ8LA+rLgHnMSqhdgo6D/y0=;
 b=TUxuJNihnYbBRhav70J2n5dMIvXeBGJu6zwr9TThcv6uMQdBnwsDWqiTeRiHkhbTgMYW758y33kLV5Oa2P9E995dmEUu39/JzL3CcRee8TUcIdyilvZ4kxgq5iLGe2pUL7AjzmAkl9p5T9FXTe34TcQvI8j3RQ//HmsuEu2BBdtp5YioHem3cI9FnUBYcxsBm9KuhzjCEs8w2wyRpUGbyekArMIqdJoHluGG+9Ab1UmxtSNP46uYRHF0yy/gJgzPPr2y7tZgFi4/9MkYIHE1vRgGJ43teaA4jq3ooDl/vVNZI8L2JF70rLrtzO6vcVfD7vZ60NIJzY+3gTAkEoJ3BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c39faba2-1ab6-71da-f748-1545aac8290b@suse.com>
Date: Wed, 25 Jan 2023 16:26:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH v3 3/4] x86: limit issuing of IBPB during context switch
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
In-Reply-To: <930254a6-d0c8-4910-982a-bfd227187240@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: e7be8421-044f-4350-b2f4-08dafee88f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h/nj97cr8vLxJVhcB/2C3S68VXOlpq1DL0vMgHYb/eQsjD17sxVwWJXDAt5hMe/rTOSE++pRDGVQmLW2GJVBfDUsDYSXwQ+wWMJ4rp4t/O6IwE0lRX7m/D9RLcanM1sQrr+OoJ9k/DtHiIhW2bnFYTWs1/Y8Xx+QFHu6vPc5XGbhvbsmAAZq0C9RiZoSBNbaqsG3s00L6v1g5v/TBJNsNWKHvF6hPn5ghP+LLbYVeSVLKLpj3umeea841J9waEwkaljEo+G43KCV6iAit/2rLSZBDE9JfE5xA/uR2G4KxEgL7qKIWok+Utwu6coupun4HB+CJIoKMG/DfyK9KafsMHdXAutESXGv7ecBK0x8sdY1TbLp1lf6znCKsPM9Q906wpXkBxuso/g+B1NmrFy400G50u1XPZtxR+S4Il/llYtP+hbAjzcMMr/p7O9p2vB1lVg5gSstCXUCh9zTCJOKTbH+vpqc03hXF8t5dlhIgqac6jDWSGhwTdM1lCiZLaJva9ISd2OHMuIHPpUGqMz379P7AfDVB4MoOwQr5rB0EMNiqNBlaDoA8BV1Dp9DzLrc7Pu1kH2s1VVKgPkOSOhk+DeEoxQDLV2Lx9BPVkyMd7/U7NR3Kj5a69N3rKLrEsymeEQrWI/FvPmk0Gp86Qf3Grm7h7WtV0GNOlGGUIwlbTk2EXRu0qcZIfIS49U6Gv5f2S9n7LDLN+ylkw3k2uD4bQHAEcQkYnfv+ZmC8t+zTFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(38100700002)(26005)(5660300002)(4744005)(2906002)(41300700001)(86362001)(8936002)(4326008)(6512007)(316002)(6506007)(8676002)(186003)(66476007)(66556008)(2616005)(54906003)(478600001)(6916009)(66946007)(36756003)(31696002)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2ZFMjlVb283WUxwOGkyY2hKZkIvcDlaT1FDckJTTDhsRWxBQWJ5dGFRNTh4?=
 =?utf-8?B?SXhJekRaUXJjTnFYRVJScEpwTHhXcUlqbmJyOEs2dnhnbkhwTmZJZzVXNkFD?=
 =?utf-8?B?K1FYMUVTeElYcGRrWm4zWnFXQ2k5TGdzcWptVkMwUUdoc1daR2d2K2twZU14?=
 =?utf-8?B?M2xVOHZnYm5la2NlMW84QkVRNlNzMHArd0ordWd6V3FxejN0d0JneHgrdzBt?=
 =?utf-8?B?SFNuemdWcjlqSmhhb3JiMCtzaU9QZWJNNm8xaUhQaEtBVG14UlhvODFnTUpO?=
 =?utf-8?B?alRINTNyTWtwTG1aUzFNOXc5aGRLeWtEYjJtTmwwZUVZU3k4cVlBKzg3Z21x?=
 =?utf-8?B?aC9ZUURxV3VFVDF3VHFxUGhlMmFyeFFjYWordk5keUh3aUJiSWVOM0lraG1U?=
 =?utf-8?B?ZzFDRTZkOWVnS1RQZGhDdTlYSnJsWm44WStJbm82RGM2OWllTE51NUd5Y01t?=
 =?utf-8?B?VGtTbmlpMFVUNWlTZGZnclJsUFhMdHJFc25MTGlDYUhUNFU1dExTMEpMcllF?=
 =?utf-8?B?Y05oakl0VHRoUlVGdjJteGRkdG8wRW9uS0QwejdITEJoZzV0U0pTZVloU2dE?=
 =?utf-8?B?cEV1eUx1dWJvZHgyZFRJMGpPb3NDZWZPSHl6amFIbDVRYUFPeGEzNEpSaVNs?=
 =?utf-8?B?dUF4SGlNQVMram5HZ0V5bHRCMTF0M1NXREdGT2M1Y2YvRGxQMjU3TVJ2Yk1j?=
 =?utf-8?B?VncwdEYyK1hyTTVPcE9IU2pxa0J6bkJKVkFCcWNNRGloMU4wblNsV05rVFlP?=
 =?utf-8?B?c1JObHZQY2l4bnRYdGszdlpyNDhuTGQ4R0RQZDhDdnJnTll5ZUhRRnJoOEJH?=
 =?utf-8?B?dnI5VUZLQlZSYXR0VHptVFp2QVhuazFtOHRNZXhKaHpGRDdGeUtRb2x4bjBa?=
 =?utf-8?B?bTdON21YU1RYYXRXZkZnZWx6azMzcmhXV0U3QjVaOEE1R29YWCtHTlAva3hW?=
 =?utf-8?B?UnRYTnBPd3owSU5tYVVoSE4rSTJWOC82SnJENVZzN0xOdGhqKyt5N2o5dFYr?=
 =?utf-8?B?cDVDb05RYzZwQm42b2xQVTdpb1JWWnJIYjRKSHNUOGJ1YUFKV084WVVId0Vk?=
 =?utf-8?B?dFhMSlg1QmprTVRGQTU2clRYenNpSllrSHdUTEc3aEgrelpBWlRpdDdwcUJq?=
 =?utf-8?B?Q2d6V2o0aGxYSERURW83ZDdlUVUyWTdLZGo5akZLM0dHWXh1ZlI2WTQyVzU3?=
 =?utf-8?B?ajJkdm1QL0dRbE90STMxRFoyTHBSU2w3c2ZnYTVYSUljWnplVE5sY3JTbDZv?=
 =?utf-8?B?cjBqU1poS0p3MFZyZGplK2RtZGYxQzh5dWNteXkvYWZLNnVXankzK3hwOFUy?=
 =?utf-8?B?NFFoVk92dXB5S0tiT3VPamx2bUZhY1ZPaUtMR0pKcDFCMWFPQng2eERFMzBX?=
 =?utf-8?B?bTFFMzR4c3FYUXZGNkg5MzhzRTZERENoUDhpZnIvM2I2ZXYrT0dLWlBMMnFV?=
 =?utf-8?B?dUxEblVtMG1MNGZ5VWVrNGxuYy9NQk5FMlVoR0EzVFFmWlVremF3MVBaV0M3?=
 =?utf-8?B?dHNYTzVlTjBvUU1VZ0VITERmQ2oyNVVMcE5WMnB2NmlSMTVKUDNmZlVGZ2xM?=
 =?utf-8?B?UjQ1VCs1NS9XVHBCai9vMHp4UHZrS0UxN3VuZW84ZUNrUVhhV0Y1amxHN0ps?=
 =?utf-8?B?T2YyY1dKTVJ5SkNYYWsyT0RaTXpNTEI1eHNnNEVtajc5TXlueXNnaENTckx1?=
 =?utf-8?B?cnQ5dWdzQjdGRk02Z0ZqTE9CRG13V1VtaW1xMTlkR2lKOG8vcVFKRVc4am55?=
 =?utf-8?B?SmUweEpYeUM1L3JwMkZ2UjdVMlNSWHJvclh1NGpIUy9HSVhUOS94eS9pN3FV?=
 =?utf-8?B?NW56KzlZd3QyY0J0bWNWUFhSS2NBNWdpMStmY29ZSGtFZVRjZ0JKWHZDaC96?=
 =?utf-8?B?bG10ZzZ2UVl3T21JZTFXQTlwVFdGdDNCWjE1ckdaZEUrNlZGNmFocU1HWW12?=
 =?utf-8?B?UUd0UFExSlRsaklmK05Za2t4eStwSkN3OU9CWnUrbXRDUFV1cGhpckhyTzZn?=
 =?utf-8?B?UytJbnhhRDZ2MFdCWnY3eGpxbXZwOUp1S0VrQ08rcmd3QnhSYnpFT3pPVG5H?=
 =?utf-8?B?bFJsWmtqaGk0a0x0VEJRRnB6RXcvWTFYNS9QMmEvbTY2NUVEYWl0Q0JuRXdv?=
 =?utf-8?Q?iNND5m0FLichtQdvjmg/B6jIU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7be8421-044f-4350-b2f4-08dafee88f0e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 15:26:41.3725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIYie6s0JoJqtRru9GQK+4juuWunlc5kWx4e++VJaK11ykHnSEV9Sdor9Gz2duKJ+/lzJ2VMwxU2ZVoUcnWKUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8948

When the outgoing vCPU had IBPB issued upon entering Xen there's no
need for a 2nd barrier during context switch.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Fold into series.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2015,7 +2015,8 @@ void context_switch(struct vcpu *prev, s
 
         ctxt_switch_levelling(next);
 
-        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) )
+        if ( opt_ibpb_ctxt_switch && !is_idle_domain(nextd) &&
+             !(prevd->arch.spec_ctrl_flags & SCF_entry_ibpb) )
         {
             static DEFINE_PER_CPU(unsigned int, last);
             unsigned int *last_id = &this_cpu(last);



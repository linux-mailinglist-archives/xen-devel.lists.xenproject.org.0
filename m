Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797763C32E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 15:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449450.706195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01xU-0000MB-EX; Tue, 29 Nov 2022 14:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449450.706195; Tue, 29 Nov 2022 14:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p01xU-0000K4-BV; Tue, 29 Nov 2022 14:51:40 +0000
Received: by outflank-mailman (input) for mailman id 449450;
 Tue, 29 Nov 2022 14:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EGMg=35=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p01xT-0000Jh-0Z
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 14:51:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2078.outbound.protection.outlook.com [40.107.7.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53511cea-6ff5-11ed-91b6-6bf2151ebd3b;
 Tue, 29 Nov 2022 15:51:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8423.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.21; Tue, 29 Nov
 2022 14:51:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 14:51:09 +0000
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
X-Inumbo-ID: 53511cea-6ff5-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+32Gj1PB7Ixdg1qC03zO+vCShEvDfMbIdvIDHX3QE8suu3dCSTzkjoHAscNVLt8kPYKeB89xpwbSurDmTrIPJAkI2J4dRszcDPpEzjYP2E8LTAIKkO1RqvWM1taQOFwEviXaaLWe03KD66SppElmLC74pRwBlxRSuLAxYM0sx67IANwGpOY1FTn3asH+gxNK9HRk3RaquI1YNF/f45L52pYYRxmn78xTE11891XiS5zmpVaqB+q4Eye55UVhCbymqTk7pdw2dbKNhlL2UTwbac9EbRocQTJ1QBNCN+m++pszQKPfq8bQg86v2g9NN8D83qQPsMOEL2xP8eXGh/ADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKflOQr2l2Ku3B3wa6fmhkMpxp8G8wXgKeSq/bg7zl4=;
 b=QEdRW1aQkqVip3DTjhG4Nv5AWucLbH1Y2rkKa3MGYHvv2Sy7niWgh8vhc8TA3JAFhclAm1M2PnmVuwGN+4DRbrnL25Uc8yqXjsm9zxEa2XFs2I70W2Ox7rblrpIjcwYlwqjh7M8Kte67LRF/XzguKlvNFeaj0PqVDpFEwYnzKuSzPfXmzutcNJVUKXPZdNGw7KfEV6+ys8nTI3IkbgRnD3wwJvj7TkpOEgfltazPmn9foITyFxrUqmU3us3PSjvWvGhNY9Yxr1Bksi/n03a/gFDnK2qMqLFdelc1HS05bj0l+QHamxJdpDQpZX28rv+dlzQ5IKAKzXPXSJFe8yMXrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKflOQr2l2Ku3B3wa6fmhkMpxp8G8wXgKeSq/bg7zl4=;
 b=qPuPvTWjLH+aG6HLjz5nTp/OZ2ThB3AHr0CkBbtBBsUuSppHhkGr01hpz1bqV2c8lGhlcnmbWt/1mqPGwQf7T5paaj34w4vANs4BwiO6FU8UK5USqKahMSzeKNLxcSFf3h1RDapRInEUQ6Wq7iZczeKeSIqbFgSd8eIEOHp65ilONRIj7CN+2q961JlC0eyRMw5yOeHMv1gNuXzjM1CcH9b+wnrp8CRviEToylJ5OST09PR/vezDfdppe/AYqiW3iyEWDbon7YixAydTllp0EAeT+Sn0bKJwAYKeQlzgfgu6vO62F9meuTOdNTue+JxPP1VwEoCNEkj2H/T3i7Cyhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a1cacbe0-2bfb-e365-77ac-e4814067ce6f@suse.com>
Date: Tue, 29 Nov 2022 15:51:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: drop stale check from hvm_load_cpu_msrs()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ac0ace-0d35-4ed2-9157-08dad21926ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0pBuMUXsNMEz3d2E/tuYy4INZniYbF9QD1RZwmMP/fAyndOfRS24qUYAmbwaeUBkNaeQaAQgULe9n+Z78J2WzATSHRvx5Oh+rPX46mS3RLkCxtE05Sy4iwbHMP3+ghXUqkgQC6C8zTObVaeC5akLNyRW5U7eUW/NYXLMEb40QelgwGdmBoApNHWhxKfX/XBcq0zIkcYXZCveeUCK+3M9RS7GaeLjHpAU8/Lfr4SbYaTPPhjokTasu4Wv3hP05B/bormUrpTNCycD3t48hlJKYT4aQyyST13QSTzI4bvSyqjjGiViKGUJMBF+/cbE7oJRUHyxOJgExur81P+ysAZL6SeMfbXt5scD0PJcfT+orSDTb2afnhj1SxaD6Is6VwN/IN1wbsHlCOfLg1GCepDQAfajcFb01WMbSrsROuHtGH9yrZu+KbBougP8Dl/9LAAxlbBm3TBbuZlCgg0cL8D+1uOJJsiDr0JHiNdtGEKO4Kl+ojDzt+bZ11wXUi2Dbm2v4UsoW6jslIv4HeKMI5+9NKTrZ0TkBpzvBdjhRd9724heJ6fs7Z7+b8T4vETAxLg8girtFwEu4u8E2zjfEtIgLhIU4AEh9+GrPEl2DfeMupmfxtIFTI0Xy22q9fm7uH1k3fU8yQrzo5mElXGl7fYnfLXcNU371IpDUhVF1/5QNnAgUGqzDZZccmjFcHx16dMc1HobIck6UCf3jQUE1LqLNCq26NlsoXoR2UOCDc0eIjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(2906002)(8936002)(4744005)(31686004)(316002)(41300700001)(54906003)(6916009)(478600001)(6486002)(5660300002)(4326008)(66556008)(36756003)(8676002)(66476007)(66946007)(2616005)(6506007)(26005)(6512007)(31696002)(86362001)(186003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGl3UlN3Z0RmcUpycjcva2Q4OUFTOTZTNTFlYjNDU04xa21uUFVjUmg0K1lQ?=
 =?utf-8?B?U25XV0prWXZkVnhLWnhSc0Iwa2xnQW8xcTFOS3V6VlBJeCs1QStXbTBiZnpx?=
 =?utf-8?B?RnRGMFd5STNtOS9VK3NyNlBRbnVjSTlJcXR5UXBGVy9kSWU0U011M2tTeXZ2?=
 =?utf-8?B?T2ZYT2tXUGVoclk4VDRaSm10bVhvbkRQTXpxUG16TTlsNCtianRLb2Fvd3NZ?=
 =?utf-8?B?MDVYdHNJdktJei9tZDFSa1FHWVdyK1Q5YU91cld0Q3Evd0tmazBOWHJKVHEv?=
 =?utf-8?B?blJRM01TVDR6V0x5YmNadnJSeTRNN0trVkJHSVRSNEpYdzJpZ1NHdGgwVXVG?=
 =?utf-8?B?UHIvYXpNd2lMTjlJbnZ3ZW51ZjBKZ0pwN1BwUVlrTWI3K3ZMaEdvaTJ3K1BD?=
 =?utf-8?B?ckRlWXhmaVNTMituK2w3RmloSk9OQnBrY2dKQ0p0bXlxOFM5REFHWGxWbUw3?=
 =?utf-8?B?RXhOVkFlWjNqK2FxSlQ1b0lPcFpTeE82SjdybFN6UFJjcnJ0TS9Ram5Fbmo4?=
 =?utf-8?B?T0g0alQvaTFjVUNTbnlJZGdYdG5UYUlMSUVNMHVWYjE2WGx0ZzJIeEJGbWNl?=
 =?utf-8?B?OXZzSjhsL1BVZWpqY3pzdDRqL2ZmRm5YbWROQi9iVE41YW9xa2EzZnoxZk9a?=
 =?utf-8?B?K1BWNldFVzZJNlpTOVhhVkhvbk9pQTM5dWZ2ZXNEZVJsKy9TN1RMcGJKMzJi?=
 =?utf-8?B?bkx5ekZRL21zNjFhVks1ZVIvZlhlcVFFWWFLSjVVaDYvN3JkUG5nNjA2aE5Z?=
 =?utf-8?B?STRXUkt0MW94amRkQUNjVDFGVXpiTkJWSDRwbys0YTZoWmVNT1lJYnA2WGFK?=
 =?utf-8?B?TTdhbktwRlNhRktIV2tzVGhUcGoydHAwNVNNb3kxQ1Z6M3gvL0xLU1Bsd1No?=
 =?utf-8?B?Wm01Zm1WbHBRY0x5MXR1aDZmVVVxakpKNlQydkpSSlYwdnpkSjE1VURRblQ0?=
 =?utf-8?B?L2x6aTdLdVBSbHp5STRtZTBUZkl1c2xFbjdsWUoraWFRUTB5c1NRNlg3dTYv?=
 =?utf-8?B?NXRSY1hzeXk1OUhSczhBbklvWEFQL2hFZ3FVT25sNldqQ1lNQnlnS0k1bklH?=
 =?utf-8?B?U0sweTJHT1h1bzlXdUhqRFo2My9ZanhPMStYNW9JdnFoRmpnS3VnRlNJclMz?=
 =?utf-8?B?aElnTVArV1IzTzZnelpveTlyODdFTHhjTEk3Yk5mMjNZMyswdFVlMmx2U0ZQ?=
 =?utf-8?B?NnF2QTVmL1VHL281RFF0a1U1OVl6WlJBVEJ6YjJlcU1WU2NMM2UzZ0NLd0tj?=
 =?utf-8?B?Z3BRQmk2V0dPdDFhZExFb1AvNUNzQzdiRmR2cGlQaDBRUDl1NjZLZHlsUU95?=
 =?utf-8?B?VFZ2c3ROUHJ2SjNjc0piS2djcllGM2VFdEtyM1VvemExWnJUbC9XdW55UGZF?=
 =?utf-8?B?cWs0V0I5RFRvZnQ2UGpIem9rNzJyNlpHMmx3c0FsdjAwRENlMjY4SVRXZlN1?=
 =?utf-8?B?UThrZmFPMXpuSlJYOWtQUUxMTFVrZkVkb1plSk4ycWwzY1NNbnFmdGxyYnpt?=
 =?utf-8?B?Z0hsdjMzNE1rUVRlOFJhQjN6RnNwMTNoOFoyZzJKYzNlRHIrVWplQjFYaHpW?=
 =?utf-8?B?REdhWnJhVUlub1lBTTZFakJrTzA5bmMzdUFhTGhFK25iSmExa1BWTVZFaGVo?=
 =?utf-8?B?Y280SHpCa1RFUU42a3Jkd05lNGdRTkR2RjFTVjhCOWltWHB6NDB2eWxZVi9n?=
 =?utf-8?B?ZTFMTWJOQUdpbVY1ZzI1SC9QeXp2MGcrR2hwZHJTckgvL1ptcGk5WmdLOFZZ?=
 =?utf-8?B?NURDSkVtK1ZvOGpZcXlPVndKbUpYaUc0RkNHUnpYUTRoenc1eGM3dkY5QmlP?=
 =?utf-8?B?MGZ1elFaNEt3MUtTUTRUMFR3b1dLMFAyTFJ6NTQ3aG40bCtBVFVzTlNjSUlB?=
 =?utf-8?B?QTNhdnN5aEdFRVhBRm5wYUdCS0VSWktCWFBFbWJpZHFNUVFKZmZBQXBaZ21C?=
 =?utf-8?B?U0JUUG80eHc3cm9kMVVSL0tvOFZHbkdhZ2cvb2NtYzVKUFR4WEIwbnVlL2Zr?=
 =?utf-8?B?L2ZaQVAvR0V0NTdUV0hqbkxrajVzd1Y2VGdGd1NsbWRuYU50SEc0RFR6UXUx?=
 =?utf-8?B?N3EwWXcvKzVUL3Rnbm5IdGFTR2tJMzM2c0tXSWwxTFJQa3duRk5jMHFmcGxO?=
 =?utf-8?Q?Dj06bFnpCmZgIah/sz8cfkAN9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ac0ace-0d35-4ed2-9157-08dad21926ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 14:51:09.4371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oeF10TgIQzB/FouiWXQQqf8Rh23KxckeKkToAaARTQLJ1mSZ+2BO9NkTF91S+nitG/PsHjGRmMz72l07LoRDxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8423

Up until f61685a66903 ("x86: remove defunct init/load/save_msr()
hvm_funcs") the check of the _rsvd field served as an error check for
the earlier hvm_funcs.save_msr() invocation. With that invocation gone
the check makes no sense anymore. While dropping it also merge the two
paths setting "err" to -ENXIO.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
We could go further here, removing the local "err" variable altogether,
by using "return -ENXIO". Thoughts.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1494,13 +1494,12 @@ static int cf_check hvm_load_cpu_msrs(st
         case MSR_AMD64_DR1_ADDRESS_MASK ... MSR_AMD64_DR3_ADDRESS_MASK:
             rc = guest_wrmsr(v, ctxt->msr[i].index, ctxt->msr[i].val);
 
-            if ( rc != X86EMUL_OKAY )
-                err = -ENXIO;
-            break;
+            if ( rc == X86EMUL_OKAY )
+                continue;
 
+            fallthrough;
         default:
-            if ( !ctxt->msr[i]._rsvd )
-                err = -ENXIO;
+            err = -ENXIO;
             break;
         }
     }


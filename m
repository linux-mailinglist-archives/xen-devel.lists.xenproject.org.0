Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB31646E74
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 12:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457045.714882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3F1S-0006Ql-8f; Thu, 08 Dec 2022 11:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457045.714882; Thu, 08 Dec 2022 11:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3F1S-0006Nf-51; Thu, 08 Dec 2022 11:25:02 +0000
Received: by outflank-mailman (input) for mailman id 457045;
 Thu, 08 Dec 2022 11:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3F1Q-0006NN-Hv
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 11:25:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ecf0a414-76ea-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 12:24:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 8 Dec
 2022 11:24:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 11:24:56 +0000
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
X-Inumbo-ID: ecf0a414-76ea-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfEvJxxvojO48+hClQQdu3DFqnRLS1TMlgW9hHwqMNvhbrClCHXu1cfuvLByLNIYsUK6vxI5l2wAoLoFZBTmbYFl32wHo5K02dl9M4olDfl3NLR1MIWzvXsjUXrwlb91+oEnP1U0y+SiGTVa69ptGjKrQZSx1fH7XlaP5HWNtHeY/4Smph7Id3v81UG9FzvfAkntqBXx62BsZ6TB82b/a7Jacrm8DQaptACSHci0ljzlUsibSElmX9KXMb6ocTJapgW8Du5IwymXnJJxdQoejFjASekB4XZ+qJR1kencjiimEwtrAAuDEqxsRTtPbKtx4wxpap2ZQ/mYWz+hK59hLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Fjreq8M49cgfRSguLDlB8os5Le7I82LY33Pfvxzqu4=;
 b=bKuUNZatmZEMAGZQjStFEbM0rhIxyogcgibXsPbCHKpyIqDtcKSngydVI5hz8aecIgh2MWbYxFHI5WExMqFfB+QTbTg4U8mg37wLte0O7IYvWbsXEnl3m4FJR8oZtiuByEWT2604VmxELqOg+Qu6SyZyyksAakIjQB699JOn3bO3GTh/kPAQMqUbWBhR6CsMARpwqBhUQxZsuG1wdLR0oDTUe2ded6pUsEn72OrVaxXy9Xtbd5YWwO+W9F3N7UHUTBhYBHeX/3olNFHoZtygwOnuk0KeO88XIHNu9LZP1UZJT8bvG8pxwl//+bdW7GHCqJa0qOY+qkJwR1/p1KjkMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Fjreq8M49cgfRSguLDlB8os5Le7I82LY33Pfvxzqu4=;
 b=higBIdDWHmzhWyfKQG7RSDtIjB1TEj5arM6lqXb8oLkzjxBO2Vksg4hqEipqPC3B3ng3bm/tW69Ny1csZljasabD5d8AzjJh0VVapaY0gY5qU6CcnGh5IkZZoNyHb3Ekz1jmAAxd8JGcFbGY0e0ACg3wEGj4vHU4ZgpwGuJ/Wx1KqP1QO9b2L3pfuLThAz0Sc3w9WNfdl5KPGLwpTHoSqRFjHrP7hR4suobvn5lTn1gsB1NghH0iBSKNxlUgNA46fukgNxfL6qtFLK1Btir+S1sfuWeIl/5qtn86ice/zS3fEOxANeWUKREAyp10G5M6u8PM5PURiCVmiqwo4lK+Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6189fed4-2aac-8ca3-90f6-7a750a8993dd@suse.com>
Date: Thu, 8 Dec 2022 12:24:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/SVM: restrict hardware SSBD update upon guest
 VIRT_SPEC_CTRL write
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: af85afc7-4e71-41c7-8401-08dad90ed598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jQ5bUZh3BJLOu87zLCBrk3dHQW/eEpH4XpINuUQvsTFW2v8Cm3OnbB7aWbcJQKp2LwDaJ8KK/giWu+82+5i9uDjBN2uIifbqNdayBWB+JqMk2/VbalveQI6fSVkVIl23/qPQR4ro8oKA8rK7lnQeXPjGgdsxAc093JmIpebya3jM14Wj8i01csIKT3K+suFmyuH9DzxRodSx9UVJQjGNcacPrr38mA4EvVdUASiu9WKrlxXRhRqFUDeWIymf6JlNg84dnz0Ol5aGLPOOqiYSMFAVdkDpAwMOGZ6XRoGKagMuplD8UJLfmQGCMgDyFRMoxYPBdp6u7i5x+Q/Fg36w2KdsIX9ah1uRG49unf7alsYlbL54FEkr4H0iscV9Ltb5wuyAz5D1y+ti8W8srgsbHZ3TNbvE/zL5rnAIERUCJW19KOHVp4fg4BJ+zEngQVftGnrYDONyYHWEHWxlQ11xY+1Aws0HsWmalKKOPQ2nKHycicZ6WXux6dE1MVwBpmc72o/DGh4+hjV8Iqtd8P1WO7P7zZJ5OOObwTri1HIAyyNSaL1TCb/S8Q6XQYol1z18R/ZhyF07afU5q7zgsu9fSwADgizm3/3UqYx5GcGjsMusJV50zr4ZGUhZe3mIgPxueetMF6JoI5N6KkCRD70F9+snSLp17Ld7kRT/O1JJ0Ii3H7G3akS8443x9LmLQWyF59LAmX7Ic9vliGTPfesxVYNxXPNxRY5LvyGv/Rjukfk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199015)(36756003)(31696002)(86362001)(6916009)(6486002)(54906003)(316002)(478600001)(4326008)(41300700001)(66556008)(5660300002)(66946007)(66476007)(8676002)(8936002)(2906002)(6512007)(6506007)(38100700002)(26005)(2616005)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXdsejc0SXJlcE8xZURYcjRNemFzaFFUdlIvN3dJUXJyeHVRSVg5N2YxT0ZL?=
 =?utf-8?B?b2dkMnd1VDV6L0FBSDlGNGI1eS9jNm9Qd2FjL3hGMmYwSWJYcEVKQzhVL0N4?=
 =?utf-8?B?OGgvVHc1OSs2dlJWckpWR21DNVg1R0RPNVhMMFBaT0VSd3lhWjluT2hmdlZV?=
 =?utf-8?B?ZnpLQjgyRGMyZjVpdkVndSs2SXpFbjg4UjZ4dU1xMHM1eWx5aEJzcklBNTlI?=
 =?utf-8?B?aExmbHlYOHIxbE0raEtucWpzTXAxejliMWlDNHdud3VmMkdUOXNKSElrMFhz?=
 =?utf-8?B?aU9SUFRrc3BoTzFtWVZoWStKNGZrUjJxdEJqOGFTb05ZSlJTRlR6UTgwR09S?=
 =?utf-8?B?Y3lqUnZNSUJsOUttTnN5OXdocUpqdXdJTFNtWHltQWZsWWhLLzNwMDlUaSs0?=
 =?utf-8?B?dkhBTGplZGhId3doNGtmTFMxcDJYcTlGQnZsQXVqZHpUVnFFc3ViMTdVdGU1?=
 =?utf-8?B?MWpJdmZSN2pyS2Rla0MwLzJnblpOdUFnY29oY3dhcDdiTCt0UXI3MnBGcWVN?=
 =?utf-8?B?N0s2Zi93Qms4LzQrdXAzbnJxUmRPTmVrMlNFS2lBckpUYXNXRHl0bWNEaFdH?=
 =?utf-8?B?ZXZWUG1BTmdhSEZOZWtlME9WNk5RVmExMHlib3BxcUI5bXlvU3N1OEhFcWhq?=
 =?utf-8?B?cTZacUVaUWhyZWhiMzNGNkNicWFpOXVTTGp0SWpwM1NNNDF3ZkNzWnl1V0FW?=
 =?utf-8?B?UHdTSlVPamZMODVxRUVHdkx5ZUdjalR5MFdTaFlkUko1Nk5xZUxmMHluZnAv?=
 =?utf-8?B?WUpTamUwY2hHS09WeW95b2xVL1FoZG4yNnhsSHZlSXdreEpPTXJSWkJxNGtU?=
 =?utf-8?B?OFBkbkluODZuUnFoU3Q1WlFGanlhandlSDV4Y3dGdXRWbjZGcDA3RXo2Mlhm?=
 =?utf-8?B?SHBjUjZaTWNkdk1zZ2owa0t0ZGNyM0NubE9EZVFsWjVMWWpvL09vZThwbUlK?=
 =?utf-8?B?YnhQektRR00wWENFTVlobzdxcXMva0R3eDFsQ3FmWHRoSm5uMzFkclEya3lI?=
 =?utf-8?B?bzRSS09yV1V0Vm9hUDdPL20yK3l2N0tNMnY3T3pUWHJWK3hmbzEvRFRkWWkr?=
 =?utf-8?B?MlM0K2pIMUlVS0YyNms0UEVML2hYbTc5UEJaSThqeGRiOWxDNkFyNnRNMSs0?=
 =?utf-8?B?WUFSZ3pkVW1aRUxQM2l4Yk5IZHo1cFRHcUxQeURyVnBLNjhHbVZGdlF2M1lO?=
 =?utf-8?B?UG5ZMml3Vzd6WDlwUk8vdkZUWGUyajVVK2dKZ2FKRDZiTzh1VnprSGxLUlZk?=
 =?utf-8?B?a1hCdHJ6WitURXhXbVNFQW1iMWZMd2NQYnZQaFhHNlJGVmFsaWNtN09FNGVH?=
 =?utf-8?B?NkdHd1doemcva25WenpJOGYwWTMza01kNThUTm9JRWo2dUE3WkxwSFN5SFFO?=
 =?utf-8?B?U3k1WVc3T2VlV1puazNJNWMraVR0VDRsMnc4alUxb0NRb255czFBbklqNFRQ?=
 =?utf-8?B?S3FvdXJrdlQ2RHZoUlFDdlA1eWRIOUdQZ3hJRTdWZkJrVWQ3RitGbExaRGwr?=
 =?utf-8?B?N1dHOFBnSmQvbE92c2N5WDFJWWVRayt1NzlibTNtOU5UdTF5UXdnQThhZUxm?=
 =?utf-8?B?cE1ZUCthVTJ6bytRV01BUkNOTEpEK3NIK3kyajVqak9FbHhYVFNEbGU3UUdk?=
 =?utf-8?B?YjBNa3FyYVMxTktrNFlsZ29QL0JLRW01M1h2SkdRQVZ1cU1xeFdXdWZBNXYw?=
 =?utf-8?B?WXV6MU5ZRkhEbkZ3dFhXdzRvaVBZWmxwUldGeXJyeWhhU1k0QjVERTh1b0pX?=
 =?utf-8?B?Wm9JTzNXaFhRWmlqelhSQXA1RVZQUkd4UnYxUmkrVnFCYm1HMkhLQlVhQU0r?=
 =?utf-8?B?OW55UWdwNzNXbG5aUmZ6aUVialRlWENvaWdCVFBRaGZLV0RtVFZJOSs0S0Vh?=
 =?utf-8?B?ZVhaQTlDMHc1QkJRQnFaYVFTNXE5dlhHajBEVFpHVVdEVzV4S3NwSWZBak9z?=
 =?utf-8?B?TnNHdkNMTWNXY0FkcHhSTWo3TGdYQlUwK2hXWDhXcTJUQSswSGUyU2V2ZTdY?=
 =?utf-8?B?Y0J5aTE0M0xqZlJlTy9reGE4cmNvNUJwamxKbW94eHVSUW9jcVJyWlVlOHJQ?=
 =?utf-8?B?Ymh5UkpVdXNqREJXaisxNDJJSzE2ZytOMmR3eXJNd1VCcWxmTkhpTFYxUnZl?=
 =?utf-8?Q?ssxLqinK6SaKKgWO1r1YUAdYv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af85afc7-4e71-41c7-8401-08dad90ed598
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 11:24:56.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emwER9Z1xJ249Q17zdhRTnTbGoxoMU0GD6P2FQxQxOpN1kTkdy85KJt+P8+Rkqw6uIF4Mnjb1zVMbWheIiaAsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

core_set_legacy_ssbd() counts the number of times SSBD is being enabled
via LS_CFG on a core. This assumes that calls there only occur if the
state actually changes. While svm_ctxt_switch_{to,from}() conform to
this, guest_wrmsr() doesn't: It also calls the function when the bit
doesn't actually change. Extend the conditional there accordingly.

Fixes: b2030e6730a2 ("amd/virt_ssbd: set SSBD at vCPU context switch")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the less intrusive but more fragile variant of a fix. The
alternative would be to have core_set_legacy_ssbd() record per-thread
state, such that the necessary checking can be done there.

This wants properly testing on affected hardware. From Andrew's
description it's also not clear whether this really is addressing that
problem, or yet another one in this same area.

--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -699,12 +699,16 @@ int guest_wrmsr(struct vcpu *v, uint32_t
         }
         else
         {
+            uint64_t orig = msrs->virt_spec_ctrl.raw;
+
             msrs->virt_spec_ctrl.raw = val & SPEC_CTRL_SSBD;
-            if ( v == curr )
-                /*
-                 * Propagate the value to hardware, as it won't be set on guest
-                 * resume path.
-                 */
+            if ( v == curr &&
+                 /*
+                  * Propagate the value to hardware, as it won't be set on guest
+                  * resume path. But only do so if the bit actually changed, to
+                  * avoid issues with core_set_legacy_ssbd()'s refcounting.
+                  */
+                 ((val ^ orig) & SPEC_CTRL_SSBD) )
                 amd_set_legacy_ssbd(val & SPEC_CTRL_SSBD);
         }
         break;


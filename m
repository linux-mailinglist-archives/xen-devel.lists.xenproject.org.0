Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F6A5A09C2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 09:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393056.631766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR77H-0006FF-AW; Thu, 25 Aug 2022 07:17:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393056.631766; Thu, 25 Aug 2022 07:17:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR77H-0006D4-7B; Thu, 25 Aug 2022 07:17:27 +0000
Received: by outflank-mailman (input) for mailman id 393056;
 Thu, 25 Aug 2022 07:17:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2f78=Y5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oR77E-0006Cv-VZ
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 07:17:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5e5dea0-2445-11ed-9250-1f966e50362f;
 Thu, 25 Aug 2022 09:17:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR0402MB3526.eurprd04.prod.outlook.com (2603:10a6:209:c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 07:17:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 07:17:19 +0000
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
X-Inumbo-ID: f5e5dea0-2445-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YF2uT2UreNVnEoznTOiUgr3rESFlcsOCJczzORX3Hz2hv/nF45UAnumLQlTqly0gxUTYAPrOUYZ8+hZodRJ/DEsBFmG3E/58HMLCG5PNExleSK8JUd14E9m8AeTOyE30nH4o+QVEHFIX4hrFIos5KE7FsqoeD/FLTug/ALo/M/eDnUWKqQ9r28ajCScS25bOqM/FjWzWpDW0ox1KtQrjOJk87FylxLJ89dzE/oDgURii/39x6UycRSzx/zRgvtLwXl1iZtqMwm9yuVI//XuYd9c7ynO6WN0vd/+zVNWvtZRq4w7RpI40Hiduuezld9Kc8gvOwtr20DUlT704talv5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKQFD5eJeOjQplpILH0QuBIfBksxrwb519Rg1xYssig=;
 b=M721cdQPPI7Jn2kMUd3FL5UVJ5hvwb5ypowhFpdjGS5CtAEveuaYIxwooZ2MISBg4EHGekJR8cmav4ZIConufFtb/s+eMTdz0cEbwj//dgOF0WTddGtMg6BBL1bXikEgYuOc3jbimU2Ll+oOwicDixmAZvY9kHGUAzl46PQjnfK389mkgpdbgJtLV6+q5smYQ1XIxpdPNrRQ11AooVu3YYWe+gFUbqo25silvbPQCucETPldC6pm5CEszP7WZ1dK9H4/TNlW8/jwuxsSqa866J7JyGKtHFXZ/uR5UL483bFhj7e2J/4SGbyqKTrgmv4gdd+TYtuz74ai6Rwe6OpfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKQFD5eJeOjQplpILH0QuBIfBksxrwb519Rg1xYssig=;
 b=suTP+w/7lDft1YJXFaZausIfiNeDDcxZs2xRMIZX01Hl5c6Pkt2pLv0hZe46NFFdOkS6z/oJ10MfjGUCYMXWFxjTumoNrbJGEelF2v/5GZOkFQXeLGslLCwx9ANQu5L1ffs97kgkOKpsI3a1kcF4mt4fK4y2CDxMXDwO5ui9ne2j43JNON21Jly9Lc0mq0/h0hllm5utaTzo3tOe9ueln+sgNes93t7ZtlZAxxAyaYfrsd57aAAx9vPCDuMsZ+mTtV4retYyQ+/KfMZ2lDAdChwOiMg52lOpw4j+TvGHfcPXoHUoQuTM/wgM5R+HybaI/HG/NV8Di4r30G05xjQFqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
Date: Thu, 25 Aug 2022 09:17:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Config.mk: correct PIE-related option(s) in
 EMBEDDED_EXTRA_CFLAGS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76fd192e-54c6-48d9-04f4-08da8669d8f1
X-MS-TrafficTypeDiagnostic: AM6PR0402MB3526:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ql4Q+BathP3jfXbiWwQAEogOI6brI7yfbOWtOfk+/g5C7w7N1skNqqpd0eyoQdLAn8faWRBqu5ZsP+VwR+KdXf714wUQ/w34rEMPSgkgnn6iGgGmal/3bz3WyW9jfV9b0LgGypDFD6PtqAhUjJuwYCuWIKmmOCDaS5P4/2NKKQRAlors740/DjPx9iuVhqICLoSdGgwpudP+HUOXHFFSd1JMR/9k9eQx2LebD8NlMVqUmdrBW0FLl4LI4Ck+JPsPniwyglBRKzWzHmpCHTX6XhJwYG59R/Ysg5GsZKdEPmvzeB+yreFhLVWA97xs2fre1k1X6rkg8JaOyLk2d1TPswQi6hE7cDIBltk04r0Bf8AopAnZwdNv2n617nwtMQumCLGKUlVv1xCvS1nMcXhDdFwrq13zhfJKv2S1RfyFCK+onquO4QvFHZsP9UWMAu0Z+SIz7D5QNk6dhlU9xnGW6bQNlzNTwt9DkyVEmKNbjGH5IQNlrJ5A2FgVfiboEGvurNVQ1ANMbCyjs7VzG24aYiO/KFmQsvqTXRmycmQOKfEE1N871zXaJeOT+7suXoAMtzRU2nXz0B66aGuMcTnYJ2Xrkw1y3x1m7sG5fNCgAls+/aS9WDwk8WwAnyRKIQrMZGqao2c9aJCJ8u99TN2wqEalY5zwvXgXUkc9TBV4egAKFEoiQ4b6noHkem9VpA5kqZYQjM9yKwkHtqjTEzaI4R+Sxhdk3cOrumLid7PyRxJu8kBhYQKNyJiiEvGZP8xTc18oYeiw8MRxt4c3Ot4aOJ6kEyw4akjqCIrQemcy3z/GXS4Jy1tsUEFkNRQhD/YYu/bs4byRHXn1BlrBmFBSSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(366004)(376002)(346002)(41300700001)(6506007)(966005)(6486002)(186003)(2616005)(478600001)(6512007)(26005)(5660300002)(2906002)(8936002)(316002)(6916009)(54906003)(4326008)(8676002)(66946007)(66476007)(66556008)(38100700002)(84970400001)(36756003)(31686004)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tkd6eFY1Q2FXRytJUTB2NWoyRFRVV1ZGR3ByVCs0bXIzcHFhcmFKMVF0Sk9B?=
 =?utf-8?B?Y0FhVWZFdGFVZjREeDBrbFpsY3FJc08xbjV6ZUNWcHZDWG45QzF6a1d0bnEw?=
 =?utf-8?B?ZEZkVzRiUkhESTY5QnpSdldsUWJ4U1lobU1nNzg3NUpvcjljSXBqM1NhNk4w?=
 =?utf-8?B?K2tHdkl1T1VEMTJScHRjdldwTEpKZE80eVM4Q1FPUjdlT3BubENMUVN5REpl?=
 =?utf-8?B?blEwYk1lc3NUQTcybUE1OTM2NWlEcjhoQ0lrNG5naVRUT2t0U1lwSEFTSHIz?=
 =?utf-8?B?TkZnK1NweURkak5xV3loTUZOaUJaOTBKSFVLamdhb2pZUTVjbnhyV1hoSGZF?=
 =?utf-8?B?bERibU02d2NIOExuMTMxMEhJL0ZJRkZBOUxrRjhYL0hBSHkrTko0bTRCaklG?=
 =?utf-8?B?WEYwdlpDM3MvaXdKY1AwZGRVa1Y2bVJManZJcTdZYUpJZVdsNUJaVmtMUmFD?=
 =?utf-8?B?enl1YmYyNTFBN1VwS2FMVW9nWHBWbDFwZ2dYcjZ5R2xsa25rSWFOU28xQTRp?=
 =?utf-8?B?VFVRUE14R0JNUUMwNDVqNUpBMjlNSW1EblFtVHduU1VQRDFxUkl3V3V3N01l?=
 =?utf-8?B?d3hzRXkxVldtS3E2ZUlOMmZ4c1FkMjFiQlh3Mk9YVE9aTlYxVk9xUlg4MFpW?=
 =?utf-8?B?TFZEVXNIaW5odWRsZ3dYMTZwdGJZSDdaanpKRkhkQmhGeUdYQnM5WitHaWVm?=
 =?utf-8?B?bUxDc1cxRGFyY0t3c2Jma1R5L09DMUpqYlZRbm9wL2JzMXVKdjVlS3B2aVY1?=
 =?utf-8?B?WDgxS2FTUkRHQkUzQzdHT0R5bXQzMUVHOFJWYjdGUGgwdEJmS2RZMjRYZUNP?=
 =?utf-8?B?V012U2grem1ndXNLWEQ2OVQrbDd5bENpbEdoVzJvellXVUlKcytJTGVEalNm?=
 =?utf-8?B?eWpNNFhDYkt0OGltOHVwZXVuMlk5VjlsS3VOZjhsSVpaeEQzc1hZcy9PZEZN?=
 =?utf-8?B?L2J6TU9QLzdRdlkvRjZTYjhBUzFSMmR3YUJIY0owbjJiRWl5KzJXMUpNOVdj?=
 =?utf-8?B?emJnTitCcjlDTC9ZRkhhUHQxZlcxa1hDWk1XYnF2bWFHVHBEYnp0Yy9GaUZV?=
 =?utf-8?B?ZmsveXhyRGw5RmE3ekcyL0FiOGNFUThOOGt5dUZScGhRckphelRNajJvRC9H?=
 =?utf-8?B?UmlmV3BPYi9kS2hFajU1cGJOaUtqM2pNUEF2ZWJiMnNLVGZxVHZEcGNYSWZS?=
 =?utf-8?B?NDBIbUJsdEdYQ3M3SHo5M2RoNFlUN3dnVGp4Smp6a2lrRDdOQU1Edm96ZFRp?=
 =?utf-8?B?aTI0WDZ0SUhhVHFGMnlkcldnT2w5UTF5ZkVBZXR2Mld1RWVRdjFMcU42T2JX?=
 =?utf-8?B?SmFBZjBRSGowbHM4TUZJUEZla3h5NkdZaUlVb3dReEQ5VHVzMWdiNGlkRmFi?=
 =?utf-8?B?RjdjMmlKdnRhdTJ6M0hSRnJRTWM2L0VCRG94RlpqaTkvT0kzMXBOVW5DUGUy?=
 =?utf-8?B?Y2I4aEdEMFEvWXN6MGJ5R0IvNXlISzJDQ3hWcnNoT3dCT25CbHo0ejhkVTds?=
 =?utf-8?B?K3E2NmtvTk1LeUh3aURpN1RPdFRwUHRXMDFsNDIxWTZQdkNtb3pCcCtIcW5C?=
 =?utf-8?B?UFFLaTY0bkFNbjJmM1dZU3RPNEUyL1F0Sm5yWmRGMy9OM0JvTXY1RmVDVkYr?=
 =?utf-8?B?OVFsWHlDZ0Mxbno5UHE4anBOWjZvc0pMMGN1Tzl4ZGJ0NjZwcVpBMC80ZHFN?=
 =?utf-8?B?bVp3Z1JvcTZJei9NT01YaGFXTzFySHQxWGZyRFJjRFk0NS9mOVVvU1hMbnBq?=
 =?utf-8?B?VlNvSXhOMmlLQVZPMi9VOTFEVXd1U3NOK0V1eC8yZFNjcEJtVlQ3Kzk0Qmto?=
 =?utf-8?B?UWxUaTNuajhvRExYdWwxbG1SRm1Obld6N0xCWjVHOVdZbjkxd3hYRjYydi9n?=
 =?utf-8?B?L3JDdmkvUUIzdFhneDZLREJPYnVIWTh0aW1hTmFVSldCSm8wOU9zZVRCQjRi?=
 =?utf-8?B?U2NMNXMzWkdJVWlVUWhsVEI1a0xsNXcybTVFeC9SbkRxUGU4V2tud0ZrRXJz?=
 =?utf-8?B?T1YxU1Y2TkREVGVNWTlycWFqMUswMjRJMmI4REVWTFdmSE5JbzdJS0JrV3Zm?=
 =?utf-8?B?R1cvVDFuaWNhM0I0VkIzSEE0cUwza2hCbGppM0psM3ROaGpOVG1uMXBsS0Q0?=
 =?utf-8?Q?AwB2llg4nKVhsHCSn8p/S5xbo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fd192e-54c6-48d9-04f4-08da8669d8f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 07:17:19.6958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k5qyTLfcT8ZAO3kNWLiz4z7BnOD5+EfDyn4PJ6Stk3VkE36JDqHh/TN7jFtD/fNGEe0smlIrFCRyxfdZp5kplg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3526

I haven't been able to find evidence of "-nopie" ever having been a
supported compiler option. The correct spelling is "-no-pie".
Furthermore like "-pie" this is an option which is solely passed to the
linker. The compiler only recognizes "-fpie" / "-fPIE" / "-fno-pie", and
it doesn't infer these options from "-pie" / "-no-pie".

Add the compiler recognized form, but for the possible case of the
variable also being used somewhere for linking keep the linker option as
well (with corrected spelling).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- unstable.orig/Config.mk	2022-04-07 12:23:27.000000000 +0200
+++ unstable/Config.mk	2022-08-25 08:58:00.044287451 +0200
@@ -188,7 +188,7 @@ endif
 APPEND_LDFLAGS += $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
 
-EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
+EMBEDDED_EXTRA_CFLAGS := -fno-pie -no-pie -fno-stack-protector -fno-stack-protector-all
 EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
 
 XEN_EXTFILES_URL ?= http://xenbits.xen.org/xen-extfiles

